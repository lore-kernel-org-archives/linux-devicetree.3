Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D9C407599
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984047; cv=none; b=r2SxXv7oKPRZNlQZ5iLUElxF6vuYWwpe/40H3pNIa3I0igpKRPjqX0/9K84BEMu3mYzQwCGmD16R1CEH/i80yS8s3DZ7fMpe48kgwUMayBdIj8JFzcWbuaLqg7e0fMx2fRfEiStkgFFnugVymBai27sPA00B3jWnCGzE6CStbqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984047; c=relaxed/simple;
	bh=WVcijDl2vQRo6jm6MJQMt+yOuY3b/dMOUjWFVsIdgZk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K78u+B0myY3GtCsxDrP4yVsi9V3dagpc+LEnAFXWfY4PEVOj8X2dJoIJNR9AN6cbVSaIzAfqoyC6MX2VS0NeyG2hHU035NLQfmD/RsdQQp4mEOhImmpPuNjRiPL0E4WDtfq7QNeOeDe4s7wURZP1FPFtaAtqzGROjBg9X85goZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hvebq2uR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hvebq2uR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592AE1F000E9;
	Thu, 28 May 2026 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779984045;
	bh=Oq+zsNl9QL8uaBDVKXsZ/ZDbmSvNBgFfFDXyLVR4i34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hvebq2uR8zJ3ctkBC3mMTbRcHZNNMO1K2X1OqeA1FU5wW+jM6KN3n4zeC/N9bh02a
	 2tFDg6k1zFSL9F5oAvxwb+t6gmG0OALL0wJilfqyG6FHvO72tp5s1iWPQUNYT6hmKB
	 bRBFu+tIOS+P/BIhG2cae0tTaolGgpr23w/j89juhYc87iztTbVJYmNUqYuBjEqzIv
	 RT3HmR2t/mS39LO86CcQ8DOn60kN79lwkvYg/audJLMaqrhYibTP6mKXrhuq8ot6mg
	 BMQKnFLd6uQ7krYDk0frr2J0gDvjR6P4p9BN6jQtiYlQWw0wH7QJuuqHw7NnM+teX6
	 jLuT7KWt3QqcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] video: backlight: lm3533_bl: Set initial mapping
 mode from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528135123.103745-6-clamor95@gmail.com>
References: <20260528135123.103745-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 16:00:44 +0000
Message-Id: <20260528160045.592AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The backlight device is exposed to userspace before its hardware i=
nitialization is complete.
--

commit 106cefce156b039f4639eecee3b1a98c82987da6
Author: Svyatoslav Ryhel <clamor95@gmail.com>

video: backlight: lm3533_bl: Set initial mapping mode from DT

This commit adds support to obtain the initial mapping mode from DT instead
of leaving it unconfigured. It also updates the linear sysfs code.

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index 42da652df58d9..c03d0d1667e42 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c

[ ... ]

> @@ -317,14 +318,6 @@ static int lm3533_bl_probe(struct platform_device *p=
dev)
> =20
>  	platform_set_drvdata(pdev, bl);
> =20
> -	ret =3D sysfs_create_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to create sysfs attributes\n");
> -		return ret;
> -	}
> -
> -	backlight_update_status(bd);
> -
>  	device_property_read_u32(&pdev->dev, "led-max-microamp",
>  				 &bl->max_current);
>  	bl->max_current =3D clamp(bl->max_current, LM3533_LED_MAX_CURRENT_MIN,
> @@ -333,9 +326,20 @@ static int lm3533_bl_probe(struct platform_device *p=
dev)
>  	bl->pwm =3D 0;
>  	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
> =20
> +	bl->linear =3D device_property_read_bool(&pdev->dev,
> +					       "ti,linear-mapping-mode");
> +
>  	ret =3D lm3533_bl_setup(bl);

[Severity: High]
This is a pre-existing issue, but I noticed a potential race condition here
with devm_backlight_device_register() being called earlier in this function.

When devm_backlight_device_register() is called, it creates the device in
sysfs, exposes standard attributes like brightness, and immediately fires a
KOBJ_ADD uevent.

Could a userspace daemon like systemd-backlight react to this uevent and
write a saved brightness value concurrently with the rest of this probe
function?

If that happens, it would trigger lm3533_bl_ops.update_status, which calls
lm3533_ctrlbank_set_brightness() to configure the hardware to drive the LED=
s.

Because the driver has not yet read device tree limits like led-max-microamp
and applied them via lm3533_bl_setup() and lm3533_ctrlbank_set_max_current(=
),
could driving the LEDs before configuring the hardware's maximum safe curre=
nt
limit result in physical hardware damage?

>  	if (ret)
> -		goto err_sysfs_remove;
> +		return ret;
> +
> +	ret =3D sysfs_create_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to create sysfs attributes\n");
> +		return ret;
> +	}
> +
> +	backlight_update_status(bd);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528135123.1037=
45-1-clamor95@gmail.com?part=3D5
