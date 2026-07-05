Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909712F7F0D
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 20:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282824; cv=none; b=HrcAf9IiaRMa5vQAaVDewfzXNWb7cJqIAJUvroG1XfKucCV2r561pkDJNjb/7xdwZwxuoVkxPSHkPVtgN4uMK1lFrBZgxyCD77fgFD23g6Qci/H3abJaZY72Aw5IGIo7x2lumqmPEaPIPtmUrgfyStcUvNRC/v2Mff053Ew2rmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282824; c=relaxed/simple;
	bh=XlyW9syjw3/UmVmRnPMpaYhWiy2GnjlAwLoHxvzCpno=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gm0ObhG98eUqz8gc3/QFuw3Sjhviojn2VeDRHu0+mg3zzSUgL9obKkcScS175yGi/JEqO2hNICWGQoNGLQJ931dRymX3HREbaWh05MjCDyj8nR0ry/3ffWegOUebsqupcr0Xbir/RUGRwu/6coiM7MbqtzqYMODshXyQjjA4zAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISua7iyx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISua7iyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3508A1F000E9;
	Sun,  5 Jul 2026 20:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783282823;
	bh=/CmPH5n1yQtI1ngmwOsoL6Y10vhamkXfNWPeNIdf0P0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ISua7iyxikS/9DMAFu6GvRsVnh8Qn6i+bhpqC/6SN0lL0DkCTs4u7SXDdlAIMVwth
	 J/HsGcpzS2TMleiUXyy5IC7zLSnygfZKbar57kgLxJEBSo625LjWC9dV1yYWnzx5Ah
	 yHNaBLRptIVJ0lYDt/jxaLw7LOMlcj3jfQJnccYfV+5jpuS7ujBnrdaNWoL5Mv+PQm
	 i3EMtF51oURPnMhdLSQ4s2fYsKA95O8fq8JKFrHQrXbMuyRiyPpOC+08pW34Q5SwKT
	 wZitCAVS+0UqM/stZagPI19GqAu4oYCHxi+K3g39gl4xM3JpcsKz0khXPCFKraa831
	 OV9ARCMvN7qmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 5/6] ASoC: cs35l36: Implement set_tdm_slot to
 program RX slot register
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 20:20:22 +0000
Message-Id: <20260705202023.3508A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The newly added set_tdm_slot function conflicts with the existing =
DAPM 'Channel Mux' kcontrol, causing TDM slot state corruption.
- [High] The set_tdm_slot callback silently ignores the tx_mask parameter, =
failing to configure TX TDM slots and causing potential DOUT bus contention.
- [Medium] The return value of regmap_update_bits is ignored, masking poten=
tial hardware communication failures.
--

commit 0a6a2457481eab4ef7efac8df4098277de0088c1
Author: David Heidelberg <david@ixit.cz>

ASoC: cs35l36: Implement set_tdm_slot to program RX slot register

Program ASP_RX1_SLOT with the first set bit of rx_mask so the amplifier
listens on the correct TDM slot when configured by machine drivers.

> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index 89645327945f1..944f4cb5763e4 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
> @@ -947,10 +947,26 @@ static const struct cs35l36_pll_config *cs35l36_get=
_clk_config(
>  	return NULL;
>  }
> =20
> +static int cs35l36_set_tdm_slot(struct snd_soc_dai *dai,
> +				    unsigned int tx_mask, unsigned int rx_mask,
> +				    int slots, int slot_width)
> +{

[Severity: High]
Does this safely handle scenarios where multiple codecs share a TDM bus?

The function accepts a tx_mask parameter but doesn't use it, nor does it
return an error if a non-default tx_mask is requested.

If a machine driver sets up multiple CS35L36 codecs on a shared TDM bus and
calls set_tdm_slot with distinct tx_mask values, the codecs will remain on
their overlapping default TX slots. This could cause multiple codecs to dri=
ve
the I2S DOUT line simultaneously when the capture stream starts.

> +	struct cs35l36_private *cs35l36 =3D
> +			snd_soc_component_get_drvdata(dai->component);
> +
> +	if (rx_mask)
> +		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RX1_SLOT,
> +				   CS35L36_ASP_RX1_SLOT_MASK,
> +				   ffs(rx_mask) - 1);

[Severity: High]
Will this conflict with the existing DAPM channel mux kcontrol?

The preexisting chansel_enum DAPM mux targets the exact same register field:

sound/soc/codecs/cs35l36.c:
static SOC_ENUM_SINGLE_DECL(chansel_enum, CS35L36_ASP_RX1_SLOT, 0,
                            cs35l36_chan_text);

Since chansel_enum uses a 1-bit mask and set_tdm_slot uses a 6-bit mask
(CS35L36_ASP_RX1_SLOT_MASK), these interfaces seem incompatible.=20

If a machine driver sets the slot to 4, later toggling the DAPM kcontrol
from userspace will flip only bit 0, corrupting the slot configuration.

[Severity: Medium]
Should the return value of regmap_update_bits be checked here?

If the hardware write fails with an error like -EIO, the function still
returns 0. This falsely reports success to the ALSA core, allowing the stre=
am
to proceed with the amplifier listening to the wrong TDM slot instead of
gracefully aborting.

> +
> +	return 0;
> +}
> +
>  static const struct snd_soc_dai_ops cs35l36_ops =3D {
>  	.set_fmt =3D cs35l36_set_dai_fmt,
>  	.hw_params =3D cs35l36_pcm_hw_params,
>  	.set_sysclk =3D cs35l36_dai_set_sysclk,
> +	.set_tdm_slot =3D cs35l36_set_tdm_slot,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-pixel3-aud=
io-v1-0-3b66f33859f1@ixit.cz?part=3D5
