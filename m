Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80628248880
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328149; cv=none; b=Wtig+B522NVoZF3ISRVGkq3na3bMeFH3zG8WqPB2zzAYH60UkWWVsfMWMd6ZmHXNfWCzk1dic3tlThh4YqgqO1I7RuquiqP/KQP7qYRXbRTWQVMyY0AXU5OvFBgrF9VGWvH88jxjJD0HB2SQIByeRTsauK1+FkiqHJCI6hfdkDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328149; c=relaxed/simple;
	bh=1rHE/RSkiAYhBj9IST/aUxSjxIwWRmVYSLNmuY7LxzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oEwVgmOXefM5CUUacon+2SlSfXs6IZO8p9n81KL91qioHR4B7HbKCf/uSQwqH0cFHvey76Uw6bpQWYOOBuJsPXFN9E4VRqzs7VhNhlaMtEwX/uHW9bt9YqRZkd/ridyAkz2H9l/D+QCJ41tGZJPWU4/cFUL1ZuQiK6429o3UtZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEnOJxOz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEnOJxOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B8B1F0089A;
	Mon,  1 Jun 2026 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780328148;
	bh=xVhGI11nETQvO66XjxhlY+r2RDGl50kgjv9SprwmQUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iEnOJxOzUgkf5eOOPLnKIKZyf59FGVmFF1RUyaxk8+Kq4F2ye6R99RB0ZVBKEI/bn
	 XFhfzE3OJRnKafLTT0IhPKyB9S53Sc4bRPavXjGWEEk1L8eCbYyIHU+a4wPVC/drDs
	 HEI52TAx3yciMkVPZDKcaAaA4Pw3AX67WoaHnL/RPaEP3ZvBJXuIj1q3zusoRh0n5x
	 syKqkeWepMj63PCvT1ZekmUQmTs2+0aSEvVF9/5e9XoSENh0bRqWfmZRyhBmTySL2r
	 vrvY9LKsVg7n0vQw2vcS0ucxy7uXAUCYdxZaiu4HvGfnRRJSUhkmEkdcafvMOMRzDb
	 NCpIag/EpU2Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260601151831.76350-6-clamor95@gmail.com>
References: <20260601151831.76350-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:35:47 +0000
Message-Id: <20260601153547.96B8B1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Out-of-bounds array write in `lm3533_devices` when a DT child node=
 matches multiple compatible strings.
- [High] The ALS driver expects the 'ti,resistor-value-ohms' property, but =
the DT binding defines 'ti,resistor-ohms'.
- [Medium] Skipped child nodes with invalid 'reg' properties will cause 'mf=
d_add_devices' to assign the wrong OF node to subsequent valid subdevices.
- [Medium] The check `if (!als->irq)` in `store_thresh_either_en` fails to =
handle negative error codes returned by `platform_get_irq_optional`, allowi=
ng invalid IRQ configuration.
- [Low] Incompatible pointer type passed to `device_property_read_u32()`, v=
iolating strict C typing.
--

commit 91427aa1400cfc0dbe1f634ca4391a5aa41811ec
Author: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: mfd: lm3533: Convert to use OF bindings

This commit converts the LM3533 driver stack from using platform data to
using Device Tree bindings. It updates the core, als, backlight, and led
drivers to parse properties directly from the device hierarchy.

> diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-al=
s.c
> index 52136ca1abc94..55b35467a722d 100644
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c
[ ... ]
> @@ -716,30 +722,34 @@ static const struct attribute_group lm3533_als_attr=
ibute_group =3D {
>  	.attrs =3D lm3533_als_attributes
>  };
> =20
> -static int lm3533_als_setup(struct lm3533_als *als,
> -			    const struct lm3533_als_platform_data *pdata)
> +static int lm3533_als_setup(struct lm3533_als *als)
>  {
[ ... ]
> -	if (!pdata->pwm_mode) {
> -		if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> -		    pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
> -			dev_err(&als->pdev->dev, "invalid resistor value\n");
> -			return -EINVAL;
> -		}
> +	if (!als->pwm_mode) {
> +		ret =3D device_property_read_u32(dev, "ti,resistor-value-ohms",
> +					       &als->r_select);

[Severity: High]
Does this use the wrong property name? The device tree binding requires
"ti,resistor-ohms", but this attempts to read "ti,resistor-value-ohms". If a
conformant DT is provided, this read will fail and unconditionally abort the
driver probe when not in PWM mode.

> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to ger resistor value\n");
[ ... ]
> @@ -830,25 +833,28 @@ static int lm3533_als_probe(struct platform_device =
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
> +
> +	if (als->irq =3D=3D -EPROBE_DEFER)
> +		return -EPROBE_DEFER;

[Severity: Medium]
Since platform_get_irq_optional() returns a negative error code (like -ENXI=
O)
when an IRQ is absent, does the existing check in store_thresh_either_en()
need to be updated as well?

Because store_thresh_either_en() still checks:
    if (!als->irq)
        return -EBUSY;

A negative error code will bypass this check, allowing userspace to enable
the interrupt mode via sysfs without a registered interrupt handler.

> +
>  	atomic_set(&als->zone, 0);
>  	mutex_init(&als->thresh_mutex);
[ ... ]
> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> index 45e7f7481aa0f..d57c2cdf11c51 100644
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c
[ ... ]
> -static int lm3533_device_init(struct lm3533 *lm3533)
> +static int lm3533_device_init(struct lm3533 *lm3533)
>  {
[ ... ]
> +	lm3533_devices =3D devm_kcalloc(dev, nchilds, sizeof(*lm3533_devices),
> +				      GFP_KERNEL);
> +	if (!lm3533_devices)
> +		return -ENOMEM;
> =20
> -	lm3533->have_leds =3D 1;
> +	device_for_each_child_node_scoped(lm3533->dev, child) {
> +		if (!fwnode_device_is_available(child))
> +			continue;
> =20
> -	return 0;
> -}
> +		if (count >=3D nchilds)
> +			break;
> =20
> -static int lm3533_device_init(struct lm3533 *lm3533)
> -{
> -	struct lm3533_platform_data *pdata =3D dev_get_platdata(lm3533->dev);
> -	int ret;
> +		if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
> +			lm3533_devices[count].name =3D "lm3533-als";
> +			lm3533_devices[count].id =3D PLATFORM_DEVID_NONE;
> +			lm3533_devices[count].of_compatible =3D "ti,lm3533-als";
> =20
> -	dev_dbg(lm3533->dev, "%s\n", __func__);
> +			lm3533->have_als =3D true;
> +			count++;
> +		}
> =20
> -	if (!pdata) {
> -		dev_err(lm3533->dev, "no platform data\n");
> -		return -EINVAL;
> +		if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {

[Severity: High]
Can a malformed device tree node cause a buffer overflow here? Since these
are independent if-statements rather than mutually exclusive else-if blocks,
a single node containing multiple matching compatible strings could execute
multiple blocks in the same iteration. Because the bounds check against nch=
ilds
is only at the top of the loop, this would unconditionally increment count =
and
write out of bounds of the lm3533_devices array.

> +			ret =3D fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret || reg >=3D LM3533_HVLED_ID_MAX) {
> +				dev_err(dev, "invalid backlight node %s\n",
> +					fwnode_get_name(child));
> +				continue;
> +			}
> =20
> -	lm3533->hwen =3D devm_gpiod_get(lm3533->dev, NULL, GPIOD_OUT_LOW);
> -	if (IS_ERR(lm3533->hwen))
> -		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen), "failed to re=
quest HWEN GPIO\n");
> -	gpiod_set_consumer_name(lm3533->hwen, "lm3533-hwen");
> -
> -	lm3533_enable(lm3533);
> +			lm3533_devices[count].name =3D "lm3533-backlight";
> +			lm3533_devices[count].id =3D reg;
> +			lm3533_devices[count].of_compatible =3D "ti,lm3533-backlight";

[Severity: Medium]
Will this assignment cause mfd_add_devices() to map the wrong OF node to
subdevices if an earlier node was skipped? Since cell->use_of_reg =3D true =
and
cell->of_reg =3D reg are not being set here, mfd_match_of_node_to_dev() will
simply assign the first available matching OF node to the first requested
mfd_cell. If an earlier invalid node was skipped, the subdevice may read
configurations from the wrong DT node.

> =20
> -	ret =3D regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
> -				 LM3533_BOOST_FREQ_MASK,
> -				 pdata->boost_freq << LM3533_BOOST_FREQ_SHIFT);
> +			lm3533->have_backlights =3D true;
> +			count++;
> +		}
[ ... ]
> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index 5c8e690878609..c70b8a3bb3014 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
[ ... ]
> @@ -296,13 +294,20 @@ static int lm3533_bl_probe(struct platform_device *=
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
Does passing &props.brightness violate strict C typing here? The brightness
field in struct backlight_properties is an int, but device_property_read_u3=
2()
strictly expects a u32 pointer. This could cause build failures on modern
kernel trees that have -Werror=3Dincompatible-pointer-types enabled.

> +
> +	bd =3D devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
> +					    bl, &lm3533_bl_ops, &props);
>  	if (IS_ERR(bd)) {
>  		dev_err(&pdev->dev, "failed to register backlight device\n");
>  		return PTR_ERR(bd);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601151831.7635=
0-1-clamor95@gmail.com?part=3D5
