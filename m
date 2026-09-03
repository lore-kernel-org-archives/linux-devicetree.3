Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF8932937A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 10:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432970; cv=none; b=PmISPF57AcbrHaNDJDuA3n3itdS6UmlJxq6darmrr/ZE8zXQPDeliefIuVpb7PP9G9HS4zFSoCvIVD6+XNJvG9wSmWVOjaJzE1+tvLoZe0WTXPGLp9jqpARUznqVKBsOVJwkwXTql9T/2XqIKcaJ4xmSO5rVfRw4v/6DhydgUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432970; c=relaxed/simple;
	bh=2hAdau/brmZurViZ9snFKOZXZ716ypMfv1I/TLujAXA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mfOxnp+qXZ2uQ5yzxTeYAaO8qhbxTNsBJB/7byWrbWQ+VFdnVER6iKGnRqM4dKG/j2l9FM+c9iBmJf9LG3pENwgA5l434UlkQSivyxQ2VZiJS3TTF4GMSw3woqCVpopUt6XHBOIaDP1vj2nyBsZq6fjduSosilvNAYf1AWvKgp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2I5Mlot; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2I5Mlot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D5D1F000E9;
	Thu,  3 Sep 2026 10:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788432968;
	bh=KXayTPK+C/18IxFsuIIqkzY10+XDbmDFYnzAxMD2+jo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2I5MlotQn6O27xF+3ncMYiXE/yzn7GXPk9j0IdE7YVIvtmDYjwCFNgtFLno2aBj1
	 jvhdB/V/MMwwzJNmYub978ewWXn1YKbpBiIZo0zgu9xgawQsdG8UOkhcK3Uz4gpWSo
	 xt1NmS/b3qJrrudUwdPyoh2vNmrgxrJyIsKEf/BTe+tqc5lljwTG+7/FnUns+A5oNt
	 /ZNQCm866hXOaGGvkWeQOowXMyjwld1qJCjh1BEa+vEwL/KsoTjux0SLJuNBMzKERv
	 EU5lDJi9GamMW92exA1mMSvC575wvVttt+1naHi53ya3EthYzWXZUmT1wY7r/cQ0V9
	 Dkha01K9rrTvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] power: supply: add LT8491 battery charger driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <9c260e1c2056c69be1cb7a05abcd10ba657c1548.1788432152.git.johnerasmusmari.geronimo@analog.com>
References: <20250110080235.54808-1-johnerasmusmari.geronimo@analog.com>
 <cover.1788432152.git.johnerasmusmari.geronimo@analog.com>
 <9c260e1c2056c69be1cb7a05abcd10ba657c1548.1788432152.git.johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 10:56:07 +0000
Message-Id: <20260903105608.60D5D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The local variable `ret` in `lt8491_get_property` is declared as `=
s16`, which will cause valid 16-bit I2C reads >=3D 32768 to be incorrectly =
treated as negative error codes.
- [High] The driver registers its power supply without devres and lacks a `=
.remove` callback, leading to a resource leak and use-after-free on device =
unbind.
- [Medium] The driver calls `i2c_smbus_write_word_data` but fails to check =
for `I2C_FUNC_SMBUS_WRITE_WORD_DATA` during probe.
- [Medium] Missing polling or delay after triggering a telemetry update com=
mand.
- [Medium] Missing bounds check for temperature limits in `lt8491_set_prope=
rty()`.
- [Medium] Missing bounds check for resistor configuration values leading t=
o silent truncation.
--

commit 3b2b2398d72c0229f6f2624e687f0338dc39a93b
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
   =20
power: supply: add LT8491 battery charger driver
   =20
This commit adds initial support for the LT8491 High Voltage Buck-Boost
Battery Charge Controller via I2C. The driver exposes voltage, current,
power, and temperature telemetry through the power supply subsystem.

diff --git a/drivers/power/supply/lt8491_charger.c b/drivers/power/supply/l=
t8491_charger.c
--- /dev/null
+++ b/drivers/power/supply/lt8491_charger.c
@@ -0,0 +1,412 @@

[ ... ]

> static int lt8491_get_property(struct power_supply *psy,
> 				enum power_supply_property psp,
> 				union power_supply_propval *val)
> {
> 	struct lt8491_info *info =3D power_supply_get_drvdata(psy);
> 	s16 ret;

[Severity: High]
Will the ret variable incorrectly wrap to a negative value when reading lar=
ge
16-bit register values? Since i2c_smbus_read_word_data() returns an s32,
reading a negative temperature (where bit 15 is set) will cause ret to beco=
me
negative. Does this prematurely trigger the if (ret < 0) error path and
prevent userspace from reading negative temperatures?

[ ... ]

> 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> 		scoped_guard(mutex, &info->lock) {
> 			ret =3D i2c_smbus_read_byte_data(info->client,
> 						LT8491_STAT_CHARGER_REG);
> 			if (ret < 0)
> 				return ret;
>
> 			if (!FIELD_GET(LT8491_TELEM_ACTIVE_MASK, ret)) {
> 				ret =3D i2c_smbus_write_byte_data(info->client,
> 						LT8491_CTRL_UPDATE_TELEM_REG,
> 						LT8491_UPDATE_TELEM_CMD);
> 				if (ret)
> 					return ret;
> 			}
>
> 			ret =3D i2c_smbus_read_word_data(info->client,
> 						LT8491_TELE_VBAT_REG);

[Severity: Medium]
Is a delay or completion check required after triggering the telemetry upda=
te?
The code writes the update command to the telemetry register but immediately
reads the voltage data. Could this result in reading uninitialized or stale
data if the hardware ADC requires time to process the conversion?

[ ... ]

> static int lt8491_set_property(struct power_supply *psy,
> 				enum power_supply_property psp,
> 				const union power_supply_propval *val)
> {
> 	struct lt8491_info *info =3D power_supply_get_drvdata(psy);
>
> 	switch (psp) {
> 	case POWER_SUPPLY_PROP_TEMP_ALERT_MIN:
> 		return i2c_smbus_write_byte_data(info->client,
> 						 LT8491_CFG_TBAT_MIN_REG,
> 						 val->intval / 10);

[Severity: Medium]
Should the bounds of val->intval be validated before writing it? If userspa=
ce
writes an extremely large or deeply negative value, could it be silently
truncated when cast to the 8-bit parameter of i2c_smbus_write_byte_data(),
configuring incorrect temperature hardware limits?

[ ... ]

> static int lt8491_configure_resistor(struct lt8491_info *info,
> 				     const char *propname, int divider,
> 				     unsigned int reg)
> {
> 	struct device *dev =3D &info->client->dev;
> 	int ret;
> 	u32 val;
>
> 	ret =3D device_property_read_u32(dev, propname, &val);
> 	if (ret < 0)
> 		return dev_err_probe(dev, ret, "Missing %s property.\n",
> 				     propname);
>
> 	return i2c_smbus_write_word_data(info->client, reg, val / divider);

[Severity: Medium]
Does this division risk silent truncation? If the device tree contains
very large resistor values, could the result of val / divider exceed the
maximum 16-bit unsigned integer (65535) and get silently truncated by the
u16 parameter in i2c_smbus_write_word_data()?

[ ... ]

> static int lt8491_probe(struct i2c_client *client)
> {
> 	struct device *dev =3D &client->dev;
> 	struct lt8491_info *info;
> 	struct power_supply_config psy_cfg =3D {};
> 	int ret;
>
> 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> 				     I2C_FUNC_SMBUS_READ_WORD_DATA))
> 		return -EOPNOTSUPP;

[Severity: Medium]
Since lt8491_configure_resistor() later calls i2c_smbus_write_word_data(),
should this capability check also require I2C_FUNC_SMBUS_WRITE_WORD_DATA
to avoid unexpected probe failures on adapters that lack word write support?

[ ... ]

> 	info->psp =3D power_supply_register(dev, &lt8491_desc, &psy_cfg);
> 	if (IS_ERR(info->psp))
> 		return dev_err_probe(dev, PTR_ERR(info->psp),
> 				     "Failed to register power supply.\n");
>
> 	return 0;
> }

[ ... ]

> static struct i2c_driver lt8491_driver =3D {
> 	.driver =3D {
> 		.name =3D "lt8491",
> 		.of_match_table =3D lt8491_of_match,
> 	},
> 	.probe =3D lt8491_probe,
> 	.id_table =3D lt8491_id,
> };

[Severity: High]
Will this leave the power supply device registered indefinitely if the driv=
er
is unbound? The probe function uses power_supply_register() instead of the
devres equivalent, and the driver struct entirely omits a remove callback.
Could this lead to a use-after-free when the underlying info struct is
freed via devres but the power supply sysfs nodes remain active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788432152.gi=
t.johnerasmusmari.geronimo@analog.com?part=3D2
