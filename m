Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6053803DA
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684307; cv=none; b=YjOijtwqUzTuIDE40FB4pPR3snoIHm6sJdw7hoKakAWeC1oF16wTQ2odL5bNWBsZgCWfc/0l7UaFnObH7dQdpSjlD1FhvCJ04UDeZRxcDAFRFVFQ8rENpFojr1gtLBQTHaHqcnaWka3i/Sh1+GuZsu3Re1nfWJv7GWvPTMyjSSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684307; c=relaxed/simple;
	bh=pOtjPd30KsF0yYahtCCRARRtnBkfd9hGwoCjxZbMMAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ULJhgp1Czx6a+ieeeVVJl56EvxRlKjKUc5wjjt/6EO0/GKhkaMPBNjO911tz+HqJYc6enAhVYKzjC0lhjSIXALrtchsGmDySq2pDLCVWgwBWwBkkZPLiHY93nQFjDIKoG7i2t1UYms0LL1ASeON3m167pJMlOW/ecK/3HPsVXfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1BKapoV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1BKapoV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9D21F00A3D;
	Wed, 17 Jun 2026 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781684305;
	bh=97ZJT/CCUoabnLTNLvjmKsXlThHvT5k3+GVud78Rjgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T1BKapoV89Crdy2R10Muwnl3oU09W9arSCS3/c/4LJnKEDSEcFbLlvfPbJVOCkgkU
	 P8OmiBFxoabF5uC/4ZpD8BvTWTbvWAf7udfC2cYwmtrhO+0WcwnnVhui6hxb7FBjmZ
	 jJRtcso93FIm+TM4it2/GRi6oW8GUMHeZAkLqjlClgqDV0Oj/2IzXbvmVv1U1Edo2y
	 vcFnEuT8peAC6aMbewKyM4MV1i6O/VHBXsEFlt+Ygebn/+lk1HtILhHFTBK3LUjDZq
	 wVSFvqA/HphDyMtg3pkkA5XcZ77WErnrq7Wn0drrz2/Bp7iMBoJTpp49NbdB6edVxx
	 GTydcx8doqnJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/14] video: leds: backlight: lm3533: Support
 getting LED sources from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260617080031.99156-15-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-15-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 08:18:24 +0000
Message-Id: <20260617081825.6A9D21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Out-of-bounds bitmask shift causes regcache pollution and unnecessa=
ry I2C bus writes for LM3533_REG_OUTPUT_CONF1.
--

commit a74553be2d2b60a05a193e9dc35527d3d4a425da
Author: Svyatoslav Ryhel <clamor95@gmail.com>

video: leds: backlight: lm3533: Support getting LED sources from DT

This commit adds Control Bank to HVLED/LVLED muxing support based on
the led-sources defined in the device tree.

> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index ed810c23f30f3..9e07953814fdd 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c

[ ... ]

> @@ -623,8 +631,36 @@ static const struct attribute_group *lm3533_led_attr=
ibute_groups[] =3D {
> =20
>  static int lm3533_led_setup(struct lm3533_led *led)
>  {
> +	u32 output_cfg_shift =3D 0;
> +	u32 output_cfg_val =3D 0;
> +	u32 output_cfg_mask =3D 0;
>  	int ret;
> =20
> +	if (led->num_leds) {
> +		for (int i =3D 0; i < led->num_leds; i++) {
> +			if (led->leds[i] >=3D LM3533_LVCTRLBANK_MAX)
> +				continue;
> +
> +			output_cfg_shift =3D led->leds[i] * 2;
> +			output_cfg_val |=3D led->id << output_cfg_shift;
> +			output_cfg_mask |=3D OUTPUT_LVLED_MASK << output_cfg_shift;
> +		}
> +
> +		/* LVLED1, LVLED2 and LVLED3 */
> +		ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF1,
> +					 output_cfg_mask << OUTPUT_CONF1_SHIFT,
> +					 output_cfg_val << OUTPUT_CONF1_SHIFT);

[Severity: Low]
Can this shift cause bits to fall outside the 8-bit register width?

When led-sources specifies LVLED4 or LVLED5, output_cfg_mask accumulates
bits that, when shifted left by OUTPUT_CONF1_SHIFT (which is 2), will exceed
8 bits (for example, forming masks like 0x300 or 0xC00).

Because regmap_update_bits operates on unsigned int internally, these
out-of-bounds bits are applied to the cached register value. This causes
the internal comparison (tmp !=3D orig) to incorrectly evaluate to true,
triggering an unnecessary I2C write.

Although the I2C subsystem harmlessly truncates the value to 8 bits so the
hardware state is not corrupted, does it make sense to apply an explicit
8-bit mask (e.g., & 0xFF) before passing the shifted mask and value to
regmap_update_bits() to prevent regcache pollution and redundant bus traffi=
c?

> +		if (ret)
> +			return ret;
> +
> +		/* LVLED4 and LVLED5 */
> +		ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF2,
> +					 output_cfg_mask >> OUTPUT_CONF2_SHIFT,
> +					 output_cfg_val >> OUTPUT_CONF2_SHIFT);
> +		if (ret)
> +			return ret;
> +	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617080031.9915=
6-1-clamor95@gmail.com?part=3D14
