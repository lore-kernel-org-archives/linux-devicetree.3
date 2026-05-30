Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16D2DC32A
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780113100; cv=none; b=ZNXT32UUGUd2t3uJf00oZNvpi7aUMoeWlVWea81YYvNPduXW7u/+o1cn9+PrxxyveqTmU2oUU9vZTB6cK25/6y35f76+ssJj6RQrPjXQsiVJ0XHC9a+b0k6QWrREuLAroJPoT1AdiCGZGhPBm2svVn4rR4H6fv1onwuXWjnRUv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780113100; c=relaxed/simple;
	bh=7Kra2xB+xEoBPHwxdzzZq1wMNz7JcY0qC6pmFi/nwxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q1arE4fukEIe6yhvlwSltPl4/Xnf+XDiRIFp6uoe3FOL7BeGn5bpx1FAtIXpLaeeOKp9iA5E0d69rLYR8rVYyYBmrDbCQr55rI3dPTm67H98JlqSo+R2rsECjWLwOOAnhexHVU9K7KaCFv+E39PukcBgnjhmWm+FJuoK/cYXGX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHaCoLL2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHaCoLL2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAB61F00893;
	Sat, 30 May 2026 03:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780113099;
	bh=XT28ic52xvaZbTo9+AvyOAkrlqFY3rxgftf4jbS5oE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IHaCoLL2LNrjFvjue0o3O4RxVig49shSvzZZTQmOFi1BzQbTCYsFjVPZW46XOkdVX
	 Toyqp8/l8B1T+ITogibuEuOZA9GV3jpEl3xkCs92Q43748cktl65zGBY/d47sZrS5r
	 WPrQU+5qrWl0I+AFt2dMQwQ/NEKGeSTD1QXSc7Ufe9TyUHwmAClp/HA0einyC5NV9a
	 EN/YedAzCH826sHOqHoJ7ihyCJuYb/kFE4HYc3uZwrCYI/psigbVWzsvWRbdUpY53Z
	 Px1+jWXeYcb8T27GA8NtN9iIzAY8OActNOA+4xI4UOOZ+mq12Bog5nRwM8H5V5hwIJ
	 vTiyB3n9K+PVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 04/11] iio: imu: inv_icm42607: Add I2C and SPI For
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260530031739.109063-5-macroalpha82@gmail.com>
References: <20260530031739.109063-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 03:51:38 +0000
Message-Id: <20260530035138.BEAB61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing power-up delay after enabling the `vdd` regulator and be=
fore obtaining/enabling the `vddio` regulator.
--

commit f54ebd503e69aebf3524a2526c6611126af82da8
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add I2C and SPI For icm42607

This commit adds I2C and SPI driver support for InvenSense ICM-42607 device=
s.
It includes the necessary Kconfig and Makefile additions to allow building
the module.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_i2c.c
> new file mode 100644
> index 0000000000000..22ac51108cd3b
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c

[ ... ]

> +static int inv_icm42607_probe(struct i2c_client *client)
> +{
> +	const struct inv_icm42607_hw *hw;
> +	struct regmap *regmap;
> +
> +	hw =3D i2c_get_match_data(client);
> +	if (!hw)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "Failed to get i2c data\n");
> +
> +	regmap =3D devm_regmap_init_i2c(client, &inv_icm42607_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> +				     "Failed to register i2c regmap %ld\n",
> +				     PTR_ERR(regmap));
> +
> +	return inv_icm42607_core_probe(regmap, hw, inv_icm42607_i2c_bus_setup);
> +}

[Severity: Medium]
Does inv_icm42607_core_probe() need a power-up stabilization delay after
enabling the vdd regulator?

Looking at inv_icm42607_core_probe() in inv_icm42607_core.c, the vdd and
vddio regulators are enabled sequentially without an intervening delay:

	ret =3D devm_regulator_get_enable(dev, "vdd");
	if (ret)
		return dev_err_probe(dev, ret,
				     "Failed to get vdd regulator\n");

	st->vddio_supply =3D devm_regulator_get(dev, "vddio");
	if (IS_ERR(st->vddio_supply))
		return dev_err_probe(dev, PTR_ERR(st->vddio_supply),
				     "Failed to get vddio regulator\n");

	ret =3D inv_icm42607_enable_vddio_reg(st);

Other sensors in this family, such as the icm42600 and icm45600, typically
require a delay before vddio can be applied. Could omitting this delay
cause hardware initialization failures or latch-up on platforms where vddio
ramps up before vdd is fully stable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530031739.1090=
63-1-macroalpha82@gmail.com?part=3D4
