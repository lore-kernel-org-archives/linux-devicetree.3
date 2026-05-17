Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F9E30FF21
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779010123; cv=none; b=r9JCampt4uIbdLlaex0FF87qlTH+PiYFMPeqVk9V+952yb6l1BZqd3sZi6ROU+L+EvlYseggGy8En1HzeFrc/jDzsrVioL6Su+7DDzw6ecS88xgiPAbkIXaRZAJIf9Xuqab1G5Q3kNozI55e2A0YjNncMCZR+IzpgK9uiQZXBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779010123; c=relaxed/simple;
	bh=VWTJlVtxgPvR3XPthauEbhuXVVeodOlY+9Kvw5t1HbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RK/sQ/sgqWGtre2B50ooYpREDfhPQaPYC83YFPnGEVDQZ1L0pc4GATJ42hjKKpD7W6EnViXza8aRmzfBj1AKe/vPzRP/oaEOFsyw+nVAael4QvTJuWaxwf6E5oFBn1HIyYKyTqSSKsPY2wN0omXKtkgoVQw9/Wm4Xe0poyCoong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfH35yp4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfH35yp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1FFC2BCB0;
	Sun, 17 May 2026 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779010123;
	bh=VWTJlVtxgPvR3XPthauEbhuXVVeodOlY+9Kvw5t1HbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DfH35yp44JqQ41Qa30BUH/n34IYqf5QFXa/3heV7A6iYmknHS6Nlyz52qjcnOueBp
	 GZRzRJzHeQk1+QHJr7n/e/CEXNCQWzAtihwIPb0+CiX/zopp+pHJ9lLD+VmI4uiHjs
	 /rEh68KSvRl05lbULPDJAfSdRd8msL/KAR6wXtBdJy4XlI2ZWPSd5V27t10UENHG+n
	 eus7QvwUAOtj5VHDpM4s+psNb65tNeo41iGo3V9NP77xd2VrF5XQ86D05S0CU65rRw
	 WRoYFXoTepWdmYomKwtRf1KK/odjgbXVQQDB+A6x7Y3qLIvCyb36OLhdRnZSqwex5D
	 VUUW9hXOnoLkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/6] video: backlight: lm3533_bl: Set initial mapping
 mode from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260517074306.30937-6-clamor95@gmail.com>
References: <20260517074306.30937-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 09:28:41 +0000
Message-Id: <20260517092842.EB1FFC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver unconditionally clears the hardware linear mapping mode=
 if the new DT property is absent, breaking existing configurations.
- [High] The `linear` sysfs attribute is exposed to userspace before hardwa=
re initialization completes, allowing userspace configurations to be silent=
ly discarded.
--

commit cebf8bbd6f9d389030ebbf6dbf1725031e2f46a7
Author: Svyatoslav Ryhel <clamor95@gmail.com>

video: backlight: lm3533_bl: Set initial mapping mode from DT

This commit adds support to configure the initial backlight mapping mode
(linear or exponential) from the device tree instead of leaving it
unconfigured. It also updates the linear sysfs attribute handling to use
similar patterns.

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index 42da652df58d9..be9114b7e0ad7 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c

[ ... ]

> @@ -253,8 +247,15 @@ static struct attribute_group lm3533_bl_attribute_gr=
oup =3D {
> =20
>  static int lm3533_bl_setup(struct lm3533_bl *bl)
>  {
> +	int id =3D lm3533_bl_get_ctrlbank_id(bl);
>  	int ret;
> =20
> +	ret =3D lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
> +			    bl->linear ? CTRLBANK_AB_BCONF_MODE(id) : 0,
> +			    CTRLBANK_AB_BCONF_MODE(id));

Could this break existing hardware configurations where the DT property is
absent but the bootloader already configured linear mode?

Previously, this register was left unconfigured. Because
device_property_read_bool() returns false when the property is missing, this
unconditionally forces the mapping mode to exponential (0), silently revert=
ing
any existing setups lacking the new ti,linear-mapping-mode property.

[ ... ]

> @@ -333,6 +334,9 @@ static int lm3533_bl_probe(struct platform_device *pd=
ev)
>  	bl->pwm =3D 0;
>  	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
> =20
> +	bl->linear =3D device_property_read_bool(&pdev->dev,
> +					       "ti,linear-mapping-mode");
> +
>  	ret =3D lm3533_bl_setup(bl);

Does this sequence silently discard userspace configuration?

Earlier in lm3533_bl_probe(), sysfs_create_group() creates the linear sysfs
attribute before we read the device properties and call lm3533_bl_setup().

If a udev rule writes to the linear attribute, it will update the hardware
register via store_linear(), but the setup function here will subsequently
overwrite the register with the bl->linear value cached from DT, discarding
the userspace setting.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517074306.3093=
7-1-clamor95@gmail.com?part=3D5
