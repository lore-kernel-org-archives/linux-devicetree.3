Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6A3BED7F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552052; cv=none; b=K5fQATtSsq0U0wxNqkDitdFFcQpHOgagU66n/zlpSOfrpj1Bz9MBp7J8HBr6/SgP+NwDxpxRcQmvmvt18ZW9ar+coXJNaGIR6uDQB9VHmyPm8Xb0aHN/jHaOOEHAloy4I/EbUgqAJ8wM621dEtP4bqLS8ftm+JJ98/OlPprDnEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552052; c=relaxed/simple;
	bh=P313hdxyerC/X8JBzDhFARfUeN2N427LEWxBRMFOqY4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GgZoxtg7rBnT2U33PkcfqWeYjsYbgL0in8fRFpnDTO9BTSuZlZv/mSbKZ0aZT8OxLBd5RZO6EYB+9lnuKrpILy537kSL4GKzb8MpSu8k1hRaGS2DMgxMQBrakR/XQYSldGUBWV0CKW1JssiKWUFY6ISR7gmcVdGw4sAw8o7xC1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvQI16jF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvQI16jF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3311F000FF;
	Fri,  9 Oct 2026 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791552050;
	bh=ice9KRx0n3ii33JIUrbU2ONw1IGvFHMbg83UV7dGZvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nvQI16jFLDh61YisPrGqhmPxRb13u2cCADriTRinnFwSU4JmnWY8cfCU2uk2wVyrz
	 5sFEP/z6OP8RwrxjChlZJnkXA2pQsAHylewqMFlNFjNqsZqld6sUN6knsaYK4XdcSZ
	 4wGRBfx8RiHTkQoy5qnpDVRSdU19bEMAr+Ph+XvuPUUAzylgLZHgEzq6T6h8uDjxGZ
	 AvaqVaYTFUPRS49hFdiqIz/z7JQo1FOr0EXLSWzLQfrSb5jJq5AWrEHw4++llAMMm/
	 wZavUDyoJ2Gju0iwGDxmjnSgXWdsjNmJ8CF+ZZe8Cp9X8jc5osLwJGj1n8MW6kZpla
	 sD7y72LImTIQg==
Message-ID: <sashiko-outbox-165620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] ASoC: codec: pcm1681: Add TDM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-3-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-3-0c1897f21ccf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 13:20:50 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ASoC: missing regmap_update_bits error check in pcm1681_set_deemph()
--

commit c7cf94fd54a2248eb129e6005f0299fa2844892f
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: codec: pcm1681: Add TDM support

The PCM1681 selects the audio interface format using FMT[3:0] in the format
register. This commit adds support for SND_SOC_DAIFMT_DSP_A and programs the
PCM1681 I2S TDM format when it is selected. It also corrects the reset
default for the format register to match the hardware reset value.

> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index a1ccf1edf4819..3675b2236d663 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c

[ ... ]

> @@ -217,6 +217,9 @@ static int pcm1681_hw_params(struct snd_pcm_substream=
 *substream,
>  	case SND_SOC_DAIFMT_LEFT_J:
>  		val =3D 0x05;
>  		break;
> +	case SND_SOC_DAIFMT_DSP_A:
> +		val =3D 0x06;
> +		break;
>  	default:
>  		dev_err(component->dev, "Invalid DAI format\n");
>  		return -EINVAL;

[Severity: Low]
Does this code ignore the return value of the first regmap_update_bits() ca=
ll
in pcm1681_set_deemph()?

When pcm1681_hw_params() finishes successfully, it calls pcm1681_set_deemph=
():

sound/soc/codecs/pcm1681.c:pcm1681_set_deemph() {
    ...
	if (val !=3D -1) {
		regmap_update_bits(priv->regmap, PCM1681_DEEMPH_CONTROL,
				   PCM1681_DEEMPH_RATE_MASK, val << 3);
		enable =3D 1;
	} else {
    ...
}

If the first register update to set the de-emphasis rate fails due to a
transient bus error, its return value is ignored before executing the
subsequent update.

If the subsequent transaction to enable it succeeds, the codec will have
de-emphasis enabled with an incorrect or default rate, potentially causing
minor audio distortion.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-nord-asoc-=
driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com?part=3D3
