Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9034395D8C
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779137668; cv=none; b=pZOHI/vmcIBWXMjJc+e5tV5D8pAfcpE/kTqNW5XCw7puMfra9NXf1W0BGuMKum6862v5vlvrKv8C+HH5grDFN+cnzLN8HxTDrIlsjk21CXu+gpheNrWSEkw6E+dQAxMfq29RWbsn5WP6IRQoLpXFr9ONXrjp8OY/b06MIJODbWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779137668; c=relaxed/simple;
	bh=LI5eh3Br0aYTF32c7c3aEvHzemj+zf0tkG4VKc9X16M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g36qJFMv3s0KHymz6aOPF2RMr6FAnpyB1Ft3t4M7Y1OxrqzW/Ehe0Ykbwg6hTk6KxaVb4V45k5BLGBzVssOvSouTJe3VMwuITy3iDgPrNoEoPBevoAYveORauIDPK6b98L6Q003YSf8S0sdZDDE7iLmJ/XRZtKMVxch70jQo8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHnNRmA0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHnNRmA0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC6CC2BCC6;
	Mon, 18 May 2026 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779137668;
	bh=LI5eh3Br0aYTF32c7c3aEvHzemj+zf0tkG4VKc9X16M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=eHnNRmA0UYQniY4PFmsDvSGNatiWB+QBiwaeebVarsoLpXMw6orZNZhiG2PnfY95X
	 cUE3CjqPuX3VMV8x/Z9jzykE/GGJF+Z1c99k1K/cPyzBjmAxb5QP6kuaOdNt9WAHsF
	 Nhz5g+XzlEuTLpr7UvcHH0s+dHlsn4KZAvg/DFXMcodTq0nCFqM3HuFi9JhF0RpVoY
	 KdVBVX5Oy7EYdCCekpOufYmHziTS+km2HB7ftzQ1k+pHFxDelZPcu5tnVThZzdJCCJ
	 jBhoKvDmzAE3XcW1llCxPQaCChlIN24c+T59yHVkQn1OVZK9VCRYET9cwXkvXxJ1p3
	 PYKRhlz32HNoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V8 04/10] iio: imu: inv_icm42607: Add I2C and SPI For
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518200526.458421-5-macroalpha82@gmail.com>
References: <20260518200526.458421-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 20:54:27 +0000
Message-Id: <20260518205428.2FC6CC2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver unconditionally fails to probe if the `interrupt-names`=
 property is missing from the devicetree.
--

commit f16907e397de069b83b61a52946a989d7853c245
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add I2C and SPI For icm42607
   =20
This commit adds I2C and SPI driver support for InvenSense ICM-42607
devices. It introduces the necessary Kconfig and Makefile entries to allow
building the new modules.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_i2c.c
> new file mode 100644
> index 0000000000000..8631579a609a0
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

This isn't a bug in this patch specifically, but since this patch enables t=
he
I2C and SPI probing, it exposes an issue introduced in the core driver patc=
h.

If the interrupt-names property is missing from the devicetree, the probe
unconditionally fails because inv_icm42607_core_probe() does:

    irq =3D fwnode_irq_get_byname(dev_fwnode(dev), "INT1");
    if (irq < 0)
        return dev_err_probe(dev, irq, "Unable to get INT1 interrupt\n");

Since interrupt-names is not a required property in the devicetree bindings
for invensense,icm42600 (which covers icm42607), a valid devicetree might o=
nly
provide the interrupts property. In this case, fwnode_irq_get_byname() retu=
rns
-EINVAL, causing the probe to fail unconditionally and rendering the device
unusable.

Should the core driver instead use the pre-resolved client->irq or spi->irq,
or fallback to fwnode_irq_get(dev_fwnode(dev), 0) like other drivers in the
subsystem do?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518200526.4584=
21-1-macroalpha82@gmail.com?part=3D4
