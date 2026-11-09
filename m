Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794255240;
	b=x3NxuhqMF7iUy59Q+19sQIXXCjjYy1nPeN9vuBhJvicx00GxsXMydPFNxQurj+urJ6BX
	 TsNQTaS9533TJKjuHCpX4w7AO2s4wZYOvB9OBLAG3ewc/tsi+nBDC4A7LOkC0XK9Jv94s
	 CPLCJViDxe1KI6fKqluXbfQUNntm1VmVSJBLMdqLuDnSE8G042oNcpe/5/R5YIXOHR1XI
	 +uZh5hMi0HfKgovxIusroNUWabPpjr3ln5VxJb4jVn05Td/aQ9eIfRmZLm3C5DengPsUh
	 NwgD8RbfJzNeePnP9OKfbgJW+30x27rDLr37NLNCxmRUfF/whQPpitV7fDQ9UUexRBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255240;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dBetkNFaWuC8eYwvQMWJ5GmcdqzTgzGr2hj1HKNyDIg=;
	b=UHB7W5OZOo0XHCaHJS7l/Gde/skQ0NOlVZE28VzWpVT1bXDHStFPD2f+P+6EMrvEj5im
	 T8O4GiW4mDjqFBzO3C7W+UJ02m4fYyYBa/Z8QUra2fFPLEl/mjggD4CT0LreQHC0QVKFB
	 c7UIOWtxVT2B1VTkoY7Vf5ShXgyCFnDd+L6+PasReLLvKpV9hKoc3ONoH62jOdP/ywyK/
	 IT6To6fl03fHAozeyc+TxeNMMU+xFzRgpWj5pjbMBsibHRdb8OZUwXFlNoxpYiXDzbFOP
	 brEKV8RWTaoPcYRbi/wul4MqBoEVi2AQUicpzOsUqJJIHWybQSu/IpX37T1L7ai7giA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNKDPjKg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FD1606A336
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNKDPjKg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E111F008A1;
	Mon,  9 Nov 2026 20:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794255239;
	bh=dBetkNFaWuC8eYwvQMWJ5GmcdqzTgzGr2hj1HKNyDIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LNKDPjKg6a7zYpsJXesbejZmAxgPK8dSlbYNtBbJKL5lbYHzXo/SZ+btWC0MesHas
	 LQTIchQ39bF3TzOUu/CVsfVe6USn7+Sgb6MGNhBWOpMkbWpwZVgAXiRBJhwqqNJJJL
	 9P8elKBzlC4v0FU8GzW7A1W2EAkL8ix2xDkGMkWKHflJ1Ao1yqoGPJyb41GBasF31d
	 LkpwHhPo5qEheU27bmDrwkXWSKk/OQ9yrQZMjWN77Tz6ybiuXkBsmibx9z7GL1TDBk
	 IEDyyPUMuazcEcEVpvVCKw5wu+NIffpRw67gNhhzWm6vrtWJyd4+Psc3I34z2Y9ME4
	 WRtM6LtJOycjg==
Message-ID: <sashiko-outbox-205554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] regulator: willsemi,wl2868c: add the WL2868C
 camera PMIC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107015014.22374-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106114252.988023-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261107015014.22374-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261107015014.22374-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:13:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] regulator: wl2868c: preset LDOs enabled by wl2868c_probe()
  when SYS_EN is 0
- [Medium] regulator: wl2868c: reset released before enabling vsys in
  wl2868c_probe()
- [Medium] regulator: wl2868c: vin7-supply not enabled for I2C in
  wl2868c_probe()
--

commit fa96a3434b8aa9642e9973857f62fda162d22f23
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver

This commit adds a regulator driver for the seven LDO outputs of the Will
Semiconductor WL2868C I2C camera power management IC.

> diff --git a/drivers/regulator/wl2868c-regulator.c b/drivers/regulator/wl=
2868c-regulator.c
> new file mode 100644
> index 0000000000000..64baeeacf378b
> --- /dev/null
> +++ b/drivers/regulator/wl2868c-regulator.c
> @@ -0,0 +1,246 @@

[ ... ]

> +static int wl2868c_enable(struct regulator_dev *rdev)
> +{
> +	struct wl2868c *chip =3D rdev_get_drvdata(rdev);
> +	unsigned int bits =3D rdev->desc->enable_mask;
> +	unsigned int ldos;
> +	int ret;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	/*
> +	 * The enable register is written as a whole on purpose. SYS_EN gates
> +	 * every output of the chip, and the per-LDO bits may be preset by the
> +	 * firmware while SYS_EN is still clear: setting only SYS_EN and our own
> +	 * bit would then bring the preset LDOs up as well. Writing the register
> +	 * with the bits of the LDOs consumers have enabled, and only those,
> +	 * keeps the other outputs off. chip->enabled was seeded from the
> +	 * register in probe(), so an output the firmware left on is carried
> +	 * over instead of being cleared by the first enable.
> +	 */
> +	ldos =3D (chip->enabled | bits) & WL2868C_LDO_ENABLE_MASK;
> +	ret =3D regmap_write(chip->regmap, WL2868C_LDO_ENABLE,
> +			   WL2868C_SYS_ENABLE | ldos);
> +	if (ret)
> +		return ret;
> +
> +	chip->enabled =3D ldos;
> +
> +	return 0;
> +}

[ ... ]

> +static int wl2868c_is_enabled(struct regulator_dev *rdev)
> +{
> +	unsigned int mask =3D WL2868C_SYS_ENABLE | rdev->desc->enable_mask;
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(rdev->regmap, WL2868C_LDO_ENABLE, &value);
> +	if (ret)
> +		return ret;
> +
> +	return (value & mask) =3D=3D mask;
> +}

[ ... ]

> +static const struct regulator_desc wl2868c_regulators[] =3D {
> +	WL2868C_LDO(1, "vin12", 496000, 128, 0x03, 0x7f, BIT(0)),
> +	WL2868C_LDO(2, "vin12", 496000, 128, 0x04, 0x7f, BIT(1)),
> +	WL2868C_LDO(3, "vin34", 1504000, 256, 0x05, 0xff, BIT(2)),
> +	WL2868C_LDO(4, "vin34", 1504000, 256, 0x06, 0xff, BIT(3)),
> +	WL2868C_LDO(5, "vin5", 1504000, 256, 0x07, 0xff, BIT(4)),
> +	WL2868C_LDO(6, "vin6", 1504000, 256, 0x08, 0xff, BIT(5)),
> +	WL2868C_LDO(7, "vin7", 1504000, 256, 0x09, 0xff, BIT(6)),
> +};

[ ... ]

> +static int wl2868c_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct regulator_config config =3D { .dev =3D dev };
> +	struct regulator_dev *rdev;
> +	struct gpio_desc *reset;
> +	struct wl2868c *chip;
> +	unsigned int id, value;
> +	int ret, i;
> +
> +	chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	mutex_init(&chip->lock);
> +	config.driver_data =3D chip;
> +
> +	reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset GPIO\n"=
);
> +
> +	if (reset) {
> +		ret =3D devm_add_action_or_reset(dev, wl2868c_reset, reset);
> +		if (ret)
> +			return ret;
> +		fsleep(1000);
> +	}

[Severity: Medium]
Does wl2868c_probe() release the reset line and wait 1 ms before enabling
the vsys power supply below?

If vsys is initially off, the reset deassertion and 1 ms startup delay
happen while the chip is unpowered, and the subsequent device ID read runs
immediately after devm_regulator_get_enable() with no startup delay.
Because devres unwinds in reverse order, unbind or probe failure will also
disable vsys before wl2868c_reset() asserts reset.

> +	chip->regmap =3D devm_regmap_init_i2c(client, &wl2868c_regmap_config);
> +	config.regmap =3D chip->regmap;
> +	if (IS_ERR(config.regmap))
> +		return dev_err_probe(dev, PTR_ERR(config.regmap),
> +				     "Failed to create regmap\n");
> +
> +	/*
> +	 * The I2C interface is powered from the higher of VIN7 and VSYS, so the
> +	 * system supply has to be up before the device can answer at all. It
> +	 * stays enabled for as long as the driver is bound.
> +	 */
> +	ret =3D devm_regulator_get_enable(dev, "vsys");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable the system supply\n");
> +
> +	ret =3D regmap_read(config.regmap, WL2868C_DEVICE_ID, &id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read device ID\n");
> +	if (id !=3D WL2868C_DEVICE_ID_VALUE)
> +		return dev_err_probe(dev, -ENODEV, "Unexpected device ID: %#x\n", id);

[Severity: Medium]
What happens on boards that power the control logic and I2C interface from
vin7-supply without vsys-supply?

The devicetree binding allows supplying either vin7-supply or vsys-supply,
but wl2868c_probe() only enables vsys and leaves vin7 attached solely as
the input supply of ldo7.  When vsys-supply is omitted,
devm_regulator_get_enable() falls back to a dummy regulator while
vin7-supply stays disabled during the initial register reads and whenever
ldo7 is off, leaving the chip unpowered on the I2C bus.

> +	/*
> +	 * Seed the tracked set with the outputs the firmware left enabled, so
> +	 * that the first enable() or disable() of any output preserves them.
> +	 * The regulator core reads the state back through is_enabled(), which
> +	 * does not look at this set.
> +	 */
> +	ret =3D regmap_read(config.regmap, WL2868C_LDO_ENABLE, &value);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read the enable register\n");
> +
> +	chip->enabled =3D value & WL2868C_LDO_ENABLE_MASK;

[Severity: Medium]
Doesn't seeding chip->enabled without checking whether bit 7 (sys_en) is
set in value defeat the protection against preset LDO bits in
wl2868c_enable()?

When bit 7 is clear at probe time, any preset per-LDO bits in value are
copied into chip->enabled even though all outputs are off and
wl2868c_is_enabled() reports them as disabled.  The first wl2868c_enable()
call for any single output then writes chip->enabled | bits together with
bit 7, turning on all of the preset outputs and leaving them stuck on
even after consumers disable their regulators.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107015014.2237=
4-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
