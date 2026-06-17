Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A10D366822
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684206; cv=none; b=kp8jYUe7RA3Zg7l0cTDmpsC4raHsTFjqU80OnXeLm6wE124VZeBOC6F4IKcyBS9FnGwngQJqxENnv2ot/KXTJ/iUkH8Vudlf2YQLBx3Z01upmVYUTudICuv2iy3oSqE/TtYb4HCJ8lYxEESESBI1pm1lsFANISiV3nQSDYpjT88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684206; c=relaxed/simple;
	bh=JuDaAL23n6c3bCTXLdyN4vO9W2ZL8ahwXNOdg1KXQac=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XL1swNeSmUqyKRJuZPtOVs4me7ZhUGpNYdMXNtmz8dAom1IE/ieIfBof3/7+J1FTScxfL+sgeskxqWGAGShv6jbfLtM1dqPsD15crjm3c8yo9N8cIQkXFAN5pVKh4949derfpBA1J7wet07Y8XzFt0Wx3H7khYuBE9alfAYlHZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9KwxgCq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9KwxgCq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D981F00A3D;
	Wed, 17 Jun 2026 08:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781684205;
	bh=9d9IY2AjX42Rn3jsTp1PZWQRQY7g0SFSrugxwXeqMs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B9KwxgCqONOQsGY6pmnBp41mdV1zFR6vtBaPplfxvy3dg9UG78pZK3yZgvTAPFwHE
	 tR2muEbCA/EZcsJfGsXiaFtSx+5ZHLVt5Xz13PMjCCI3di9ItY4tfojuuRuBWDRuWf
	 Dw3jUSCy4sb+cQKhxyoYFjhpWHihJMEKp27JV659BVaKZOtllHpOJD5WEtH6TaikR8
	 VtP5Bp/77MnqBzTzGXNymhz6ocWNGeDNI4cBk2h7FVPzPvZAQyjmfqpoNU72up6F+z
	 +HcrmYkGwYxg3xAKC33V6UzZj8KU8vNypOdLOnRmz2GqptlV7Uej4BscAWhxtOjmMC
	 bMlOuqrlzW6Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/14] mfd: lm3533: Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617080031.99156-9-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-9-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 08:16:44 +0000
Message-Id: <20260617081644.51D981F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `default-brightness` property is read from the Device Tree a=
s a `u32` without being clamped to `LM3533_BL_MAX_BRIGHTNESS` (255).
--

commit ea75baf449ff637e79d3393f0fdd68b3fcf947de
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: lm3533: Convert to use OF bindings

This commit removes platform data support and transitions the driver to use
Device Tree bindings for its configuration.

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index 9ef171d3aaeab..2c24647fc17a4 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c

[ ... ]

> @@ -292,13 +291,21 @@ static int lm3533_bl_probe(struct platform_device *=
pdev)
>  	bl->cb.id =3D lm3533_bl_get_ctrlbank_id(bl);
>  	bl->cb.dev =3D NULL;			/* until registered */
> =20
> +	name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
> +			      pdev->name, pdev->id);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	device_property_read_u32(&pdev->dev, "default-brightness",
> +				 &default_brightness);
> +
>  	memset(&props, 0, sizeof(props));
>  	props.type =3D BACKLIGHT_RAW;
>  	props.max_brightness =3D LM3533_BL_MAX_BRIGHTNESS;
> -	props.brightness =3D pdata->default_brightness;
> +	props.brightness =3D default_brightness;

[Severity: Medium]
Should default_brightness be clamped to LM3533_BL_MAX_BRIGHTNESS before bei=
ng
assigned to props.brightness?

The transition to Device Tree bindings introduces reading default-brightness
as a u32. In the previous platform data implementation, default_brightness
was a u8, which inherently restricted it to a 0-255 range.

If a Device Tree provides a value greater than 255, it will be implicitly
truncated to an 8-bit unsigned integer when passed to the hardware writing
functions (for instance, 256 would wrap around to 0). This would cause the
backlight to turn off instead of setting it to the expected maximum brightn=
ess.

Does it make sense to clamp default_brightness similar to how led-max-micro=
amp
is clamped later in this function?

> -	bd =3D devm_backlight_device_register(&pdev->dev, pdata->name,
> -					pdev->dev.parent, bl, &lm3533_bl_ops,
> -					&props);
> +
> +	bd =3D devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
> +					    bl, &lm3533_bl_ops, &props);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617080031.9915=
6-1-clamor95@gmail.com?part=3D8
