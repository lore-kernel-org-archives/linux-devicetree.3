Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABE346FA6
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535895; cv=none; b=K0XBCSItFQLHPq7XjYnr41sG92hXR5B9I9STLVt5SdDL20AtxnwWL02lpbsjKrEbujcF/fsXpjyClQDpeERrvh62JzPTbBJ1fFi0boovqifm1gzoBz20NBMXt2ojVuHw4ijOtp771ZN7loS3Na3lHX70u3oUxCqF4rkS7tZ6zoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535895; c=relaxed/simple;
	bh=8/Hsok4QDtH8rZeL4Snj6ss4T3S3yIzUoV9FPL52y0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G+Dk4/X/6+n3yOny/T4bxGGbG5EeK6WDVpNPS5J4j5ft9pJkcfK2+tVqHV/FmyGDCX26d6138XYdzV6vomAqCc7WRx51owC2y9lgwTRNAGDLovQBQMD5puOvMXOLEklGXbhqypx0eVUYVF6ygVgeZlhNv7FkL3OLXyobPH64IM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6eqhiHq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6eqhiHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC4AC2BCB0;
	Mon, 11 May 2026 21:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778535894;
	bh=8/Hsok4QDtH8rZeL4Snj6ss4T3S3yIzUoV9FPL52y0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=d6eqhiHqMpfP0JrpFqzxk1WnKYDDYrg44UmVpw2zEfa0T/Vmtis3uzhpjvh52NSLa
	 trOWveqEGrlkbLunXXno2HVyV3FPjzTIK3NZeIqOoXRTCb0+QSPsh8CMuzVE05Nl4d
	 FeQiIWMrh/+71NISwh41d/dU9ucfujG0HlPfX5SHRcHGyjkl1gMJ/CpVqyOnv+S4sT
	 J5soocKcWEA0H1AR9sIGP6XfxU6OTQKLG+u+nwRJG7NB3CbcdH9ysFn2mzl24RS4y3
	 17/kfndwRrvilnF5/bEEDQMNnkoilkbTqSGtnAbu16inehoLkKs1052iDDxy7W28bI
	 kroOwaoxqnDYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] regulator: sgm3804: add SGMicro SGM3804 charge-pump
 regulator driver
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260510-sgm3804-v1-2-e5e8799e0aa0@gmail.com>
References: <20260510-sgm3804-v1-2-e5e8799e0aa0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:44:53 +0000
Message-Id: <20260511214454.8DC4AC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unhandled ERR_PTR for the optional second reset GPIO leads to inva=
lid pointer dereference and breaks probe deferral.
- [High] Hardware state mismatch at probe leads to permanent power leak.
- [High] Missing REGMAP_I2C dependency in Kconfig causes build failures.
- [Medium] Bitwise ORing of negative error codes corrupts regmap_write() re=
turn values.
- [Medium] Incomplete error path cleanup leaves reset GPIOs asserted if I2C=
 writes fail.
- [Medium] Incorrectly aborting probe with -ENOMEM when of_get_regulator_in=
it_data() returns NULL.
--

commit 382f3ebf01ae63955e0f9f2e654949e5dbe548b4
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

regulator: sgm3804: add SGMicro SGM3804 charge-pump regulator driver
   =20
Add an I2C-controlled charge-pump regulator driver for the SGMicro SGM3804,
typically used to power display panel AVDD/AVEE rails. The driver exposes
a single 5V regulator and uses two reset GPIOs for sequencing.

> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d71dac9436e3e..e1adb0bda75d7 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
[ ... ]
> @@ -1490,6 +1490,17 @@ config REGULATOR_SC2731
>  	  This driver provides support for the voltage regulators on the
>  	  SC2731 PMIC.
> =20
> +config REGULATOR_SGM3804
> +	tristate "SGMicro sgm3804 voltage regulator"
> +	depends on I2C && OF

Is a select REGMAP_I2C needed here?=20

Since the driver relies on devm_regmap_init_i2c(), if this driver is
enabled without CONFIG_REGMAP_I2C selected elsewhere, it might cause a
link-time undefined reference error.

> +	help
> +	  This driver supports the SGMicro SGM3804 I2C-controlled positive
[ ... ]
> diff --git a/drivers/regulator/sgm3804-regulator.c b/drivers/regulator/sg=
m3804-regulator.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/regulator/sgm3804-regulator.c
[ ... ]
> +static int sgm3804_enable(struct regulator_dev *rdev)
> +{
> +	struct sgm3804_data *data =3D rdev_get_drvdata(rdev);
> +	struct regmap *regmap =3D data->regmap;
> +	int ret =3D 0;
> +
> +	/* Set reset GPIO high to enable the device if available */
> +	if (data->reset_gpio[0])
> +		gpiod_set_value_cansleep(data->reset_gpio[0], 1);
> +
> +	if (data->reset_gpio[1])
> +		gpiod_set_value_cansleep(data->reset_gpio[1], 1);
> +
> +	ret |=3D regmap_write(regmap, 0x00, 0x0c);
> +	ret |=3D regmap_write(regmap, 0x01, 0x0c);
> +	ret |=3D regmap_write(regmap, 0x03, 0x03);

Will bitwise ORing the return values here corrupt the error codes?=20

The regmap_write() function returns standard negative error codes on failur=
e.
Applying a bitwise OR to negative integers fundamentally alters their binary
representation, generating unrelated negative values (e.g., -5 | -12 evalua=
tes
to -1, which is -EPERM) and it also issues subsequent I2C writes to a
potentially unresponsive device instead of returning early.

> +	if (ret) {
> +		dev_err(rdev->dev.parent,
> +			"Failed to enable SGM3804 regulator\n");
> +		return ret;
> +	}

If one of these I2C writes fails, should the reset GPIOs be driven back to 0
before returning?=20

Currently, it looks like an error here leaves the hardware physically
enabled with the GPIOs still driven high, but returns an error which tells
the regulator core it is disabled.

[ ... ]
> +static int sgm3804_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct device *dev =3D &i2c->dev;
> +	struct regulator_config config =3D {};
> +	struct regulator_dev *rdev;
> +	struct sgm3804_data *data;
> +	int error;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap =3D devm_regmap_init_i2c(i2c, &sgm3804_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(dev, PTR_ERR(data->regmap),
> +				     "failed to init regmap\n");
> +
> +	/* Get reset-gpio from device tree */
> +	data->reset_gpio[0] =3D
> +		devm_gpiod_get_index(dev, "reset", 0, GPIOD_OUT_HIGH);

Could requesting the GPIOs with GPIOD_OUT_HIGH cause a state mismatch?=20

This physically turns on the regulator hardware immediately, but data->enab=
led
is set to false below.

If the regulator framework queries sgm3804_is_enabled(), it receives false
and assumes the device is disabled. If no consumers claim it, will the core
ever invoke sgm3804_disable() to turn it off, or does this leave the device
permanently powered on? Would GPIOD_OUT_LOW be more appropriate?

> +	if (IS_ERR(data->reset_gpio[0]))
> +		return dev_err_probe(dev, PTR_ERR(data->reset_gpio[0]),
> +				     "failed to get first reset GPIO\n");
> +
> +	data->reset_gpio[1] =3D
> +		devm_gpiod_get_index(dev, "reset", 1, GPIOD_OUT_HIGH);
> +	if (IS_ERR(data->reset_gpio[1]))
> +		dev_warn(dev, "failed to get second reset GPIO\n");

Does this correctly handle the case where the second GPIO is absent or
deferring?=20

If devm_gpiod_get_index() returns ERR_PTR(-ENOENT) or ERR_PTR(-EPROBE_DEFER=
),
that pointer remains in data->reset_gpio[1].

Later in sgm3804_enable(), if (data->reset_gpio[1]) evaluates as true for
an error pointer, passing it to gpiod_set_value_cansleep() which can cause
a warning spam. Should this use devm_gpiod_get_index_optional() instead?

> +
> +	config.dev =3D dev;
> +	config.regmap =3D data->regmap;
> +	config.driver_data =3D data;
> +	config.of_node =3D dev->of_node;
> +	config.init_data =3D
> +		of_get_regulator_init_data(dev, dev->of_node, &sgm3804_reg);
> +	if (!config.init_data)
> +		return -ENOMEM;

Is it safe to fail the probe if of_get_regulator_init_data() returns NULL?

This function can legitimately return NULL if the device tree node lacks
specific regulator properties or constraints, which is completely valid for
regulators acting as simple switches with default parameters.

Since the regulator core safely handles config.init_data =3D=3D NULL, and
automatically parses the init data anyway because config.of_node is set,
does returning -ENOMEM here incorrectly prevent the device from binding on
valid device tree configurations?

> +	data->enabled =3D false;
> +	rdev =3D devm_regulator_register(dev, &sgm3804_reg, &config);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-sgm3804-v1=
-0-e5e8799e0aa0@gmail.com?part=3D2
