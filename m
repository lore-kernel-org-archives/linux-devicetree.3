Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164522FDC30
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 20:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282747; cv=none; b=ois4p3FZLVjee7P1VKX+1cxkrjoeg5xjmyHofCCcFcHJAgDEXZoylNIfjF/ZDPU+4Me0ISFa4C3hRSfm9HimYa9S29RRqONjGv/nBRppmce/m/UdSJulGsYdofULKQ/3KxPkhuhKKoR75it+a+lp0KA6pnJFDJJ/eDxHNkQxbkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282747; c=relaxed/simple;
	bh=5DrTalZVCde4fdBr6riFjhrFfsNC55mzkuQ/sUmSgww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iAss+TrRVO24Bg3NXHkspCSjZVyYF4l8Cuv2bZmkJoFHKLtvglKRxs3TXPWgjFO++MxWyuOFQhJ6BynDl7r6Rs4Ihrpw0+P9ytkxWx0uZtkXKm/Y7il4v6yYv8xhjvjL0sevtOSwLP+5S4G2+LFS/BD76cKNtbbNvWzDcsQbeiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jk/KVrOm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jk/KVrOm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0031F000E9;
	Sun,  5 Jul 2026 20:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783282745;
	bh=Y64VGi81YeMcyOZJ29qmt/EcpF+KGYtwInOLutkgsMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jk/KVrOmGeLzjYRDiwE50XbjAT+65+cdGuTgydTSS8dqL3wMK0NuNOQszJC3dRQuW
	 2AQ7B1T8UjTnMSn3EqNaDJBtUtqqsQ6LLDIbAldU2V2qvC4z82CPhRs/CJgpyUa/rZ
	 OluPXhnEQRq8bCiw0IgwpwmbmnWX23bx/Azv1daIm9eRAUHwD6tZsB86aOyu9l8mJA
	 1Ygg9JkNj59LETpfA29VG7kZ8olTxdolejpVJ45szJ1WmiKNuayuSrXI4ngrOY4XZu
	 yA4NJKlO0MeWwB+fObjJlT9XW6jyMgZakMUEwe6KlBoHNfEztASEEP7jDOs6wcLD4F
	 AFbHlvO2+NrRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/6] ASoC: qcom: sdm845: Set codec dai and component
 sysclk during startup
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260705-pixel3-audio-v1-4-3b66f33859f1@ixit.cz>
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-4-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 20:19:04 +0000
Message-Id: <20260705201905.6A0031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Error paths in `sdm845_snd_startup()` fail to decrement clock refe=
rence counters, causing permanent resource leaks.
- [High] Un-guarded `strcmp()` on potentially NULL `name_prefix` causes a k=
ernel panic.
--

commit 6324d11aea931e9e3bac52b9aaf6e703b5d354f0
Author: David Heidelberg <david@ixit.cz>

ASoC: qcom: sdm845: Set codec dai and component sysclk during startup

This commit sets the codec dai and component sysclk during TDM startup
for all codec DAIs on the QUATERNARY_TDM path. It gracefully ignores
-ENOTSUPP errors for codecs that do not support sysclk configuration.

> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 8b65aa3982d47..b2d51e472bc26 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -410,6 +410,28 @@ static int sdm845_snd_startup(struct snd_pcm_substre=
am *substream)

[Severity: High]
This isn't a bug introduced by this patch, but does the pre-existing strcmp=
()
slightly earlier in this loop safely handle missing device tree properties?

Looking at the code just before this diff in sdm845_snd_startup():

	if (!strcmp(codec_dai->component->name_prefix, "Left")) {

If a device tree is missing the sound-name-prefix property, the component's
name_prefix pointer is left as NULL. Since strcmp() doesn't gracefully hand=
le
NULL pointers, does this cause a direct kernel panic during stream startup?

>  					return ret;
>  				}
>  			}
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

[Severity: High]
This is a pre-existing issue, but do these early returns (both the new ones
and the pre-existing format setup checks) leak the clock reference?

At the start of the QUATERNARY_TDM_RX_0 case in sdm845_snd_startup(),
data->quat_tdm_clk_count is incremented and the clock is enabled.

If snd_soc_dai_set_sysclk() fails and returns early here, the ASoC core
handles the .startup failure by calling soc_pcm_clean(), which in turn calls
snd_soc_link_shutdown().

However, snd_soc_link_shutdown() skips the machine driver's .shutdown
callback if the .startup callback itself failed.

Since .shutdown is skipped, the clock reference counts are never decremente=
d,
leaving the CPU DAI clocks permanently enabled. Could we add a cleanup path
to decrement the counters before returning?

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
> +			}
>  		}
>  		break;
>  	case SLIMBUS_0_RX...SLIMBUS_6_TX:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-pixel3-aud=
io-v1-0-3b66f33859f1@ixit.cz?part=3D4
