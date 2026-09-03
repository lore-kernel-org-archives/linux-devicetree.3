Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBDB39CD0A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460854; cv=none; b=CsCM5PSxUn7huSDWXtp+lY7q9bq/l2Snv2vhaO+0fuz3xrSZ3KH+oSL50zd1hqERDInt0HEwvfPOLRfVXLHI7H0r7Ev2zROPp0Q0wNpgluMm3pkrwfReIjJT5KCS6bL0tWXqYQ7EbpWHmCEJ4/R7cG9fg1Xg/FSJBqO2GmZBv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460854; c=relaxed/simple;
	bh=BWXpVF15I9ON3mZW4IIcZtedXdW6S9iWm6ktDoTnl5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BCAZ9Am+AB3vUHI4Xp79ymgC/u98DzrQDdtHFkChQgpnZdJJWao7pW/I1jv32UO71FdpSRcijzDm4PdSfd7jOJkLZJzhdS7CfNnQ2N8PevKd7UHCaoY6sCkGcMh45cm8i3r1TP9+oSGl0/n84bzhJn5DkJlCEajwHg8nDX/C32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXgcM9Sy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXgcM9Sy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E325B1F00A3D;
	Thu,  3 Sep 2026 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788460851;
	bh=+FkYx0QmcnsHLgCga6BC4h2CHxh4dHkVCrE8omCyH48=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TXgcM9SyAUf6CjHslAiKqNQJrB1LYOSMAXqy4C1okl0nt+ZiWH8sHlsle44692OIX
	 i/cMbR1D3CAce2xxyOB4KKJ+0fqLUIumBgwPN1+wNSvtY883k9HfGtSVWzZvDNh2GF
	 Xkghl6pwp9kEHnZYxS0sfIC5xuTOVKXfT1YQV54F80zW1RA13dWWxqi4jWyvr6PALh
	 mx8TL3YZArHyj1jo8W3/WzIH9YhYB5YqT7a9JZjWue69GrKwbUoKe/c2pRL5JdDPc7
	 e7HRaPRHDltqgvAAF1dX1WT2IzGrmRixwxEdaM+OXccFc9zAt3iIuAzukWo1NW8x7j
	 GEi9zYixnu04A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 4/6] ASoC: qcom: sdm845: Set codec dai and
 component sysclk during startup
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-pixel3-audio-v2-4-7c22ed915291@ixit.cz>
References: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
 <20260903-pixel3-audio-v2-4-7c22ed915291@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 18:40:50 +0000
Message-Id: <20260903184050.E325B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Resource leak (clock and refcount) on error path in sdm845_snd_s=
tartup.

Pre-existing issues:
- [High] Kernel panic due to NULL pointer dereference in `strcmp()`.
--

commit 620251c05b4c5ac4fb80bf96411a9fcc1f4c402d
Author: David Heidelberg <david@ixit.cz>

ASoC: qcom: sdm845: Set codec dai and component sysclk during startup

The cs35l36 codec needs the codec dai and component sysclk to be set
during TDM startup. Set these for all codec DAIs on the QUATERNARY_TDM
path, gracefully handling codecs that don't support sysclk by ignoring
-ENOTSUPP returns.

> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 59cfa3b26cd4d..f0fbec9c8df25 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -412,6 +412,28 @@ static int sdm845_snd_startup(struct snd_pcm_substre=
am *substream)
>  					return ret;
>  				}
>  			}

[Severity: High]
This is a pre-existing issue, but can codec_dai->component->name_prefix be
NULL when evaluated in the strcmp() calls just above this block?

If the device tree lacks a sound-name-prefix property for a codec on the
QUATERNARY_TDM link, passing a NULL name_prefix to strcmp() will cause a
kernel panic during startup.

> +
> +			/* Set codec sysclk needed by codecs like cs35l36. */
> +			ret =3D snd_soc_dai_set_sysclk(codec_dai, 0,
> +						     TDM_BCLK_RATE,
> +						     SND_SOC_CLOCK_IN);
> +			if (ret < 0 && ret !=3D -ENOTSUPP) {
> +				dev_err(codec_dai->dev,
> +					"Failed to set codec dai sysclk: %d\n",
> +					ret);
> +				return ret;

[Severity: Medium]
Does this early return leak the CPU DAI clock and the clock reference count?

Earlier in sdm845_snd_startup(), the quat_tdm_clk_count is incremented and
the clock is enabled:

    if (++(data->quat_tdm_clk_count) =3D=3D 1) {
        snd_soc_dai_set_sysclk(cpu_dai,
            Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
            TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
    }

If setting the codec DAI sysclk fails and returns here, it bypasses
decrementing this reference count and leaves the CPU DAI sysclk active. The
ALSA/ASoC core does not invoke the machine driver's shutdown callback when
startup fails, meaning this state is permanently leaked.

Is there a need to unwind these resources before returning?

> +			}
> +
> +			ret =3D snd_soc_component_set_sysclk(codec_dai->component,
> +							   0, 0,
> +							   TDM_BCLK_RATE,
> +							   SND_SOC_CLOCK_IN);
> +			if (ret < 0 && ret !=3D -ENOTSUPP) {
> +				dev_err(codec_dai->dev,
> +					"Failed to set codec component sysclk: %d\n",
> +					ret);
> +				return ret;

[Severity: Medium]
Does this early return also leak the CPU DAI clock and the reference count?

Similar to the previous early return, failing to set the codec component
sysclk will leave the quat_tdm_clk_count incremented and the CPU DAI sysclk
active.

> +			}
>  		}
>  		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-pixel3-aud=
io-v2-0-7c22ed915291@ixit.cz?part=3D4
