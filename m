Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CBE377009
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979028; cv=none; b=rayE1q7i8rXfYhL5w14vpil142nSYeEU3rq0ex1dgRvkP/bsTQNtNYd2e7oqjivOleOSIutFeVj312CIUYpJnu1iuKxOoy/z0TTa9PhIBv7wA60fCvvt9Pz9EFUnQ40JWNfdEDP9Yt8oFFdfUxC+9n7HBU2fsGUU5uGGUS+DsfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979028; c=relaxed/simple;
	bh=2soEwC9yzvB+hND13pcAXokirjLo8pIgD06Ugugy4/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gjzEoQyehixRkhuHdgjsf/tZLDwCTFXKZjAXcfosfWUDRxRI7y8jQZP6OTaQEjR5hgBqXXp2290w5Yg3XCBjoRE0VFA9GEpdaWTmdHwo3w11Gxf2yfBmeEkbtyKuBUp3ipanv4Cgne6DbDFlu77KGo9glZERXAu7NF5Yr1DOBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIfmJw2+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIfmJw2+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF0F1F000E9;
	Thu, 28 May 2026 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779979026;
	bh=cg2C6F+nIVcW9DB0tIL2/7fzTfqXYri089Xo14V2TI0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NIfmJw2+pYDMashP9L3hg3rNX1WdA0KvTdsLbTUrNsXIDXFI+1aSieLhLBz2zq3x+
	 zo2dCSNAwyA2gh9sTdVQ+3aa9Rf2W81w8LzGbUX+TELVo8cTVXf3nS0AZTFxOZsYrX
	 vZT3q7r3wXPo1fRgEmyZSKeVHCofTLr+oXgn7kzgvKl9AQT/vlybFW+NUYy13N5hxC
	 JBjLLSQ2hrwCKdxZGUawCQRuy8T+KDgDMdbLfS6W8Kp1ochJrJwWiWgxDHPsTpgp9H
	 PDtvByuQkEvKyxr7cv2aV8DbQcWYmeBpwJpMZRDAjGXUO+olQN0jopyR722CCVQFzl
	 VMB3cOFvT9FMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] mfd: lm3533: Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528135123.103745-3-clamor95@gmail.com>
References: <20260528135123.103745-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 14:37:05 +0000
Message-Id: <20260528143706.6AF0F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The `lm3533_cells` array is allocated on the stack but never zero-=
initialized, causing it to contain random garbage data.
- [High] The cell iterator logic increments the `count` variable for every =
child node unconditionally, even if the node does not match any expected co=
mpatible strings.
- [Medium] The ALS driver attempts to free an invalid IRQ number on error p=
aths and during device removal when no IRQ is present.
- [Medium] Uninitialized stack memory is printed to the kernel log if `fwno=
de_property_read_u32()` fails to read the "reg" property.
- [Low] The patch introduces basic syntax and scoping errors in `lm3533_als=
_setup()` that completely prevent compilation.
- [Low] The backlight device tree `reg` property is validated against the w=
rong maximum limit in the MFD core.
- [Low] Passing an `int *` to a function expecting a `u32 *` causes compile=
r warnings/errors and breaks the build.
--

commit 9af50d17aae60cc268d70b24e00ddaa3a0500388
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: lm3533: Convert to use OF bindings

Since there are no users of this driver via platform data, remove the
platform data support and switch to using Device Tree bindings.
Additionally, optimize functions used only by platform data.

> diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-al=
s.c
> index 99f0b903018cf..cbd337b73bd9f 100644
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c

[ ... ]

> @@ -714,59 +720,33 @@ static const struct attribute_group lm3533_als_attr=
ibute_group =3D {
>  	.attrs =3D lm3533_als_attributes
>  };
> =20
> -static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mo=
de)
> +static int lm3533_als_setup(struct lm3533_als *als)
>  {
> -	u8 mask =3D LM3533_ALS_INPUT_MODE_MASK;
> -	u8 val;
> +	struct device *dev =3D &als->pdev.dev;

[Severity: Low]
Does this syntax cause a build error? The pointer als->pdev requires
the -> operator to access dev, like &als->pdev->dev.

>  	int ret;
> =20
> -	if (pwm_mode)
> -		val =3D mask;	/* pwm input */
> -	else
> -		val =3D 0;	/* analog input */
> -
> -	ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, val, mask);
> -	if (ret) {
> -		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
> -								pwm_mode);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
> -{
> -	int ret;
> -
> -	if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_MAX) {
> -		dev_err(&als->pdev->dev, "invalid resistor value\n");
> -		return -EINVAL;
> -	}
> -
> -	ret =3D lm3533_write(als->lm3533, LM3533_REG_ALS_RESISTOR_SELECT, val);
> -	if (ret) {
> -		dev_err(&als->pdev->dev, "failed to set resistor\n");
> -		return ret;
> -	}
> +	device_property_read_u32(dev, "ti,resistor-value-ohm",
> +				 &als->r_select);
> =20
> -	return 0;
> -}
> +	als->r_select =3D clamp(als->r_select, LM3533_ALS_RESISTOR_MIN,
> +			      LM3533_ALS_RESISTOR_MAX);
> +	als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * als->r_select);
> =20
> -static int lm3533_als_setup(struct lm3533_als *als,
> -			    const struct lm3533_als_platform_data *pdata)
> -{
> -	int ret;
> +	als->pwm_mode =3D device_property_read_bool(dev, "ti,pwm-mode");
> =20
> -	ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> +	ret =3D lm3533_update(lm3533, LM3533_REG_ALS_CONF, als->pwm_mode ?

[Severity: Low]
Will this fail to compile since lm3533 is undeclared in this scope? It
appears this should use als->lm3533 instead.

[ ... ]

> @@ -838,12 +817,6 @@ static int lm3533_als_probe(struct platform_device *=
pdev)
>  	if (!lm3533)
>  		return -EINVAL;
> =20
> -	pdata =3D dev_get_platdata(&pdev->dev);
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "no platform data\n");
> -		return -EINVAL;
> -	}
> -
>  	indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*als));
>  	if (!indio_dev)
>  		return -ENOMEM;
> @@ -852,25 +825,28 @@ static int lm3533_als_probe(struct platform_device =
*pdev)
>  	indio_dev->channels =3D lm3533_als_channels;
>  	indio_dev->num_channels =3D ARRAY_SIZE(lm3533_als_channels);
>  	indio_dev->name =3D dev_name(&pdev->dev);
> -	iio_device_set_parent(indio_dev, pdev->dev.parent);
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;
> =20
>  	als =3D iio_priv(indio_dev);
>  	als->lm3533 =3D lm3533;
>  	als->pdev =3D pdev;
> -	als->irq =3D lm3533->irq;
> +	als->irq =3D platform_get_irq_optional(pdev, 0);

[Severity: Medium]
Will this cause problems during error handling or device removal?
platform_get_irq_optional() returns negative error codes when no IRQ
is present. The existing cleanup paths check if (als->irq) which evaluates
to true for negative numbers, causing it to call free_irq() with an
invalid IRQ number. Should the cleanup checks be updated to
if (als->irq > 0)?

[ ... ]

> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> index 0a2409d00b2e0..8495e91198711 100644
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c

[ ... ]

> -static int lm3533_device_init(struct lm3533 *lm3533)
> +static int lm3533_device_init(struct lm3533 *lm3533)
>  {
> -	struct lm3533_platform_data *pdata =3D dev_get_platdata(lm3533->dev);
> +	struct device *dev =3D lm3533->dev;
> +	struct mfd_cell lm3533_cells[LM3533_CELLS_MAX];

[Severity: High]
Does this array need to be zero-initialized? Because it's allocated on
the stack, fields like num_resources and resources will contain garbage
memory. When mfd_add_devices() processes it, could this lead to wild
pointer dereferences?

> +	u32 count =3D 0, reg;
>  	int ret;
> =20
> -	dev_dbg(lm3533->dev, "%s\n", __func__);
> -
> -	if (!pdata) {
> -		dev_err(lm3533->dev, "no platform data\n");
> -		return -EINVAL;
> +	lm3533_enable(lm3533);
> =20
> -	lm3533->hwen =3D devm_gpiod_get(lm3533->dev, NULL, GPIOD_OUT_LOW);
> -	if (IS_ERR(lm3533->hwen))
> -		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen), "failed to re=
quest HWEN GPIO\n");
> -	gpiod_set_consumer_name(lm3533->hwen, "lm3533-hwen");
> -
> -	lm3533_enable(lm3533);
> -
> -	ret =3D lm3533_device_setup(lm3533, pdata);
> -	if (ret)
> +	device_for_each_child_node_scoped(lm3533->dev, child) {
> +		if (!fwnode_device_is_available(child))
> +			continue;
> =20
> -	lm3533_device_als_init(lm3533);
> -	lm3533_device_bl_init(lm3533);
> -	lm3533_device_led_init(lm3533);
> -
> -	ret =3D sysfs_create_group(&lm3533->dev->kobj, &lm3533_attribute_group);
> -	if (ret < 0) {
> -		dev_err(lm3533->dev, "failed to create sysfs attributes\n");
> -		goto err_unregister;
> +		if (count >=3D LM3533_CELLS_MAX)
> +			break;
> =20
> +		if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
> +			lm3533_cells[count].name =3D "lm3533-als";
> +			lm3533_cells[count].id =3D PLATFORM_DEVID_NONE;
> +			lm3533_cells[count].of_compatible =3D "ti,lm3533-als";
> =20
> +			lm3533->have_als =3D true;
> +		}
> =20
> +		if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {
> +			ret =3D fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret || reg > LM3533_HVLED_ID_MAX) {

[Severity: Low]
Is LM3533_HVLED_ID_MAX the correct boundary to check here? The backlight IDs
should typically be validated against LM3533_BL_ID_MAX. Since
LM3533_HVLED_ID_MAX is 2, it would allow invalid backlight IDs to bypass
this check.

> +				dev_err(dev, "invalid backlight reg %d\n", reg);

[Severity: Medium]
If fwnode_property_read_u32() returns an error, reg remains uninitialized.
Could this print stack garbage memory to the kernel log?

> +				continue;
> +			}
> =20
> +			lm3533_cells[count].name =3D "lm3533-backlight";
> +			lm3533_cells[count].id =3D reg;
> +			lm3533_cells[count].of_compatible =3D "ti,lm3533-backlight";
> =20
> +			lm3533->have_backlights =3D true;
> +		}
> =20
> +		if (fwnode_device_is_compatible(child, "ti,lm3533-leds")) {
> +			ret =3D fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret || reg < LM3533_HVLED_ID_MAX ||
> +			    reg > LM3533_LVLED_ID_MAX) {
> +				dev_err(dev, "invalid LED reg %d\n", reg);
> +				continue;
> +			}
> =20
> +			lm3533_cells[count].name =3D "lm3533-leds";
> +			lm3533_cells[count].id =3D reg - LM3533_HVLED_ID_MAX;
> +			lm3533_cells[count].of_compatible =3D "ti,lm3533-leds";
> =20
> +			lm3533->have_leds =3D true;
> +		}
> =20
> +		count++;

[Severity: High]
Does count increment unconditionally even if the child node didn't match
any of the compatible strings? If an unrelated child node is present, it
would increment count while leaving the lm3533_cells[count] entirely
unpopulated. When mfd_add_devices() is called, this could result in a NULL
pointer dereference on the .name field.

[ ... ]

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index babfd3ceec866..42da652df58d9 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c

[ ... ]

> @@ -295,13 +293,20 @@ static int lm3533_bl_probe(struct platform_device *=
pdev)
>  	bl->cb.id =3D lm3533_bl_get_ctrlbank_id(bl);
>  	bl->cb.dev =3D NULL;			/* until registered */
> =20
> +	name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
> +			      pdev->name, pdev->id);
> +	if (!name)
> +		return -ENOMEM;
> +
>  	memset(&props, 0, sizeof(props));
>  	props.type =3D BACKLIGHT_RAW;
>  	props.max_brightness =3D LM3533_BL_MAX_BRIGHTNESS;
> -	props.brightness =3D pdata->default_brightness;
> -	bd =3D devm_backlight_device_register(&pdev->dev, pdata->name,
> -					pdev->dev.parent, bl, &lm3533_bl_ops,
> -					&props);
> +	props.brightness =3D LM3533_BL_MAX_BRIGHTNESS;
> +	device_property_read_u32(&pdev->dev, "default-brightness",
> +				 &props.brightness);

[Severity: Low]
Will this pass an incompatible pointer type? props.brightness is defined as
an int in struct backlight_properties, but device_property_read_u32() expec=
ts
a u32 pointer. This could cause compiler warnings or errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528135123.1037=
45-1-clamor95@gmail.com?part=3D2
