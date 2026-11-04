Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763536;
	b=Yp7/0kvIjodRUpN2WurpwlzXhaR+Qt0dzaqkA2m1DfIiBfqXO8ZkbaUozbcoX2kDQYmd
	 i17TRavGlPrw+xR1+SLfROPcU6iDCLiyUK7kEKD9wrmZ28scdcu3JPM4bFVA0p9bBXRvz
	 +to+IGDREYITyu0UUrEpZb3pCL4J5W25aNtciPVKSLVH7FUu+moE0Y+AdyJVlnKhLwECe
	 y/bGojeWmIA9Jx+2XAlcJdohUcB7UblugiRhYrSxK9jLF3BSYZfwp86nTH5+69NPyyCdW
	 opazS0tNPOCCIZZEjAeRav3l8pASutF63vRFimz0xEyapl006lfeZ1upegveviJWmNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SwAKSeXNfc2+XjvA2jErPYJH8LVIp2vkgrI+L0V6HEI=;
	b=PweyQP/T6DRul4Yr8dzQsSHjOce6nmbBNNxLpjPZbmYfpKr208Eay7wbE3xxyWBG3Svr
	 HOxkTJBQuC7bLk1y3DmmeTQjvw1LMJFJsZwlPMs2otwl2omDOr1RK7GyiUJDccvta/VDS
	 fndl0q2LlTQZWuIZqUZyYE3uVL5HxVek79LA+HPYuYbIzekUDxAr4V74jTZeqkHnmkDyQ
	 fQl7/QBdQsK1NJccRgVaLNc1eVGKkXD46HGgmzfpHl7KK+zqt+6KitGAijwGVS/1RJbMj
	 IhldZ972vtbVXTSX8xuhSegkYQGsW0Sl+0z3NfFIztwwF+2xvqiUxFmiw/s08rN8TwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9Ams4Ig;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1FB606A338
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 03:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9Ams4Ig
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489491F0093A;
	Wed,  4 Nov 2026 03:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763535;
	bh=SwAKSeXNfc2+XjvA2jErPYJH8LVIp2vkgrI+L0V6HEI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C9Ams4Ig7t1XpFD/82LzY8PYq06koGfBR+kPQCxop/ni36kOeoSI/tPJpczjUBe5L
	 EqcTUeFltiOErP9EeX6DE+gWOUOtL1OBzVYYfOuzAF+Y+etV5MD9/cUBGtOEsrR6N6
	 bKM1UWvVfTE4mjmTLVLZdSid+URiNWlgXZKT3yEEGr363CRJYI4xM2EZ42QGa4x8Sl
	 xJOc9lWLZtrlbOGyzwe+T1UdbYhTI55tdpklmZG3UYZCuumIc4HunOfVvwkmpPvUT0
	 wFSHNyEQuYwrSKRBd2OTbeMnIiJG6PIaIK7plCvwgJ2Enp80gamlE2zE4gLyLT4r+M
	 4VXaX0A2+fl8g==
Message-ID: <sashiko-outbox-196615@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] regulator: willsemi,wl2868c: add the WL2868C
 camera PMIC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104032648.209747-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261104032648.209747-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:38:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] regulator: wl2868c: uninitialized chip->enabled in wl2868c_probe=
()
- [Medium] regulator: wl2868c: missing vsys-supply enable in wl2868c_probe()
- [Medium] regulator: wl2868c: premature state update in wl2868c_disable()
--

commit 43e6bd60d4f6c3f0ce8478df036a5927be90da6e
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver

This commit adds a regulator driver for the Will Semiconductor WL2868C I2C
camera power management IC supporting its seven LDO outputs.

> diff --git a/drivers/regulator/wl2868c-regulator.c b/drivers/regulator/wl=
2868c-regulator.c
> new file mode 100644
> index 0000000000000..35bcdc3971eca
> --- /dev/null
> +++ b/drivers/regulator/wl2868c-regulator.c
> @@ -0,0 +1,212 @@

[ ... ]

> +static int wl2868c_disable(struct regulator_dev *rdev)
> +{
> +	struct wl2868c *chip =3D rdev_get_drvdata(rdev);
> +	unsigned int bits =3D rdev->desc->enable_mask;
> +	unsigned int ldos;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	chip->enabled &=3D ~bits;
> +
> +	/*
> +	 * SYS_EN stays set while at least one output is enabled; the per-LDO
> +	 * bits of the other outputs stay clear so that setting it cannot
> +	 * switch anything else on.
> +	 */
> +	ldos =3D chip->enabled & WL2868C_LDO_ENABLE_MASK;
> +
> +	return regmap_write(chip->regmap, WL2868C_LDO_ENABLE,
> +			    ldos ? WL2868C_SYS_ENABLE | ldos : 0);
> +}

[Severity: Medium]
If regmap_write() fails in wl2868c_disable(), does chip->enabled get out
of sync with both the hardware and the regulator core?

In wl2868c_enable(), chip->enabled |=3D bits is only updated after
regmap_write() succeeds. Here in wl2868c_disable(), chip->enabled &=3D ~bits
is cleared before calling regmap_write().

When ops->disable() returns a negative error code in _regulator_disable():

drivers/regulator/core.c:_regulator_disable() {
    ...
    ret =3D _regulator_do_disable(rdev);
    if (ret < 0) {
        rdev_err(rdev, "failed to disable: %pe\n", ERR_PTR(ret));
        _notifier_call_chain(rdev,
                REGULATOR_EVENT_ABORT_DISABLE,
                NULL);
        return ret;
    }
    ...
    rdev->use_count =3D 0;
}

the regulator core aborts the disable and keeps rdev->use_count at 1 while
the LDO remains enabled in hardware, but chip->enabled has already lost
that LDO's bit. A subsequent wl2868c_enable() or wl2868c_disable() on
another LDO will then overwrite WL2868C_LDO_ENABLE with that bit cleared,
shutting off the still-enabled output.

Should chip->enabled only be updated after regmap_write() succeeds,
matching wl2868c_enable()?

> +
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
> +	unsigned int id;
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
> +
> +	chip->regmap =3D devm_regmap_init_i2c(client, &wl2868c_regmap_config);
> +	config.regmap =3D chip->regmap;
> +	if (IS_ERR(config.regmap))
> +		return dev_err_probe(dev, PTR_ERR(config.regmap),
> +				     "Failed to create regmap\n");
> +
> +	ret =3D regmap_read(config.regmap, WL2868C_DEVICE_ID, &id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read device ID\n");

[Severity: Medium]
Does wl2868c_probe() need to request and enable vsys-supply (or the
control logic supply) before accessing the chip over I2C?

Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml defines
vsys-supply and notes that the internal control logic is powered from the
higher of VIN7 and VSYS, requiring at least one of vin7-supply or
vsys-supply.

However, vsys-supply is never requested or enabled by the driver, and
vin7-supply is only registered as the supply_name for LDO7. On systems
where the control logic is powered by a switchable vsys-supply (or
vin7-supply when LDO7 is not enabled), the chip may not be powered when
regmap_read() reads WL2868C_DEVICE_ID in wl2868c_probe(), or
regulator_late_cleanup() may disable an unclaimed vsys-supply while LDO1
through LDO6 are in use.

> +	if (id !=3D WL2868C_DEVICE_ID_VALUE)
> +		return dev_err_probe(dev, -ENODEV, "Unexpected device ID: %#x\n", id);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(wl2868c_regulators); i++) {
> +		rdev =3D devm_regulator_register(dev, &wl2868c_regulators[i], &config);
> +		if (IS_ERR(rdev))
> +			return dev_err_probe(dev, PTR_ERR(rdev),
> +					     "Failed to register LDO%d\n", i + 1);
> +	}

[Severity: Medium]
What happens if WL2868C_SYS_ENABLE and one or more LDO bits are already
set in WL2868C_LDO_ENABLE when wl2868c_probe() runs (for example, when the
optional reset GPIO is not present or was already deasserted by the
bootloader)?

In wl2868c_probe(), chip->enabled starts at 0, whereas
wl2868c_is_enabled() reads WL2868C_LDO_ENABLE directly from the hardware
and returns 1 for any LDO that is already active alongside
WL2868C_SYS_ENABLE.

When a consumer calls regulator_enable() on a boot-enabled LDO,
_regulator_enable() checks _regulator_is_enabled(rdev):

drivers/regulator/core.c:_regulator_enable() {
    ...
    if (rdev->use_count =3D=3D 0) {
        /* The regulator may on if it's not switchable or left on */
        ret =3D _regulator_is_enabled(rdev);
        if (ret =3D=3D -EINVAL || ret =3D=3D 0) {
            if (!regulator_ops_is_valid(rdev,
                    REGULATOR_CHANGE_STATUS)) {
                ret =3D -EPERM;
                goto err_consumer_disable;
            }

            ret =3D _regulator_do_enable(rdev);
            if (ret < 0)
                goto err_consumer_disable;

            _notifier_call_chain(rdev, REGULATOR_EVENT_ENABLE,
                         NULL);
        } else if (ret < 0) {
            ...
        }
    }

    rdev->use_count++;
    ...
}

Because wl2868c_is_enabled() returns 1, _regulator_enable() skips calling
_regulator_do_enable() -> wl2868c_enable() and increments rdev->use_count
to 1 while that LDO's bit remains 0 in chip->enabled.

When any other LDO is subsequently enabled in wl2868c_enable() or disabled
in wl2868c_disable() (including regulator_late_cleanup() turning off an
unused LDO), the driver writes WL2868C_LDO_ENABLE from chip->enabled and
clears the boot-enabled LDO's bit while its consumer is actively using it.
Similarly, if multiple LDOs are already enabled at boot and marked
regulator-always-on or regulator-boot-on, registering the first one calls
wl2868c_enable() with chip->enabled =3D=3D 0 and powers off the others.

Should wl2868c_probe() initialize chip->enabled from WL2868C_LDO_ENABLE
when WL2868C_SYS_ENABLE is already set?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104032648.2097=
47-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
