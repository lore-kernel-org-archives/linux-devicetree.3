Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107862;
	b=XdTOFVcwAq23T0348ut+tMmpDhyR+Q9r7GGEapWdbrwAc2/0G9kk5SBeSFD8+1Wlid4G
	 ntlYOfpiGQAqg40zUJ/D4IkkCkVokMPH0v2Hia1p4OJGD2GUDJ+SQ8e6t+VAqYvd65zuC
	 w4+WYsZGHo1AvCrGAFEMW+dxEA5PSHy+C2j8O2FK8YnNKa68DxwIJjwI+WflJz7PDXAAZ
	 QnRy0OPARHRaZx3oWvp6OB75Izk6+1PBFVAuBs2dsOfZ5kFeWaYEngbfPRm3PO36g3r7d
	 +Xsb+7JWN1d03DPG1x1GIeMGm3q24f5kR7qkC7FLW8wMelT3FUrDtMlbFFpkMmpplKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107862;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Gx0bsJwBKLrCpnM6Tt+OF82XIc/SB1qX3GUma/BbS3M=;
	b=mLJ8poEtGB38Yyenk1UMH/NlCI7gVIJePwf4oyHb7rR/QUAwaRO+JkUQ95Y7l2K8MrDx
	 x1XXDyw69eJc7MPSIalNhHzL2TPMn/8d7/7Q6nPSDUFUToBhuo9Xp3WjH9PYGb0SYyBN5
	 4HEzKhmZ1wGe8A5wWPxTWw5oliZegy+c6U5qIQEBJnb+2y3MRqvO+i4EL8Da4UwUe48up
	 WGrqbqdGV1hGSd5xevm5vjqTtU4LP9OPf0lHOd680FFi7S+m1ITn0YYz8i4jlzvoStFBY
	 t2pujD77uaEhYNMbcpw5K2K/7d1YB8PNDD0xVVpGTphu+Gvl4vnxVBD1V/WuOxCIdyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GreYLC4L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED5F606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GreYLC4L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E35B1F01825;
	Tue, 27 Oct 2026 13:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793107861;
	bh=Gx0bsJwBKLrCpnM6Tt+OF82XIc/SB1qX3GUma/BbS3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GreYLC4Li6eLSRjJ7gXLkw+ymjH55jLmO/Kc86fA/immfuVvFL+UZWOcIrIsThRgM
	 kZDrtQR3eHNAfiNNg1YR3MlF/hzrl722Pg/vaQ6uWl/QviomgWQL6ArH1/mbBLILrC
	 WsdlPJuWZbNO5Dwk8dMAZm+ofXDJH+zJ7rIetoMTRwsuxT6jr/RcPqq2ZZlSL2nPoH
	 V+hShZ/D+9e+wUXpUV/cmABeJcRFWHn8cMzgU5D1sarmCIuA8t4GdR5w/iUn6CQwEj
	 33AVs97P/Ce4Yb3sgSBsgA+n1NJNUTGZ3oyx0lxcV2aVg8ddX/zwqvQx5Pfmp5uDT4
	 BtAgMEKoGEagA==
Message-ID: <sashiko-outbox-186623@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] power: supply: cw2217: Add support for Cellwise
 cw2217
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027131751.1724448-3-macroalpha82@gmail.com>
References: <20261027131751.1724448-1-macroalpha82@gmail.com>
 <20261027131751.1724448-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 13:31:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] power: supply: cw2217: NULL dereference when battery-profile is om=
itted
- [Medium] power: supply: cw2217: cw2217_get_temp() reports whole degrees C
- [Medium] power: supply: cw2217: wrong micro-ohm clamp and scale for user_=
rsense
- [Medium] power: supply: cw2217: cw2217_bat_suspend() uses async work canc=
el
- [Medium] power: supply: cw2217: missing psy_cfg.fwnode assignment in cw22=
17_probe()
- [Low] power: supply: cw2217: missing linux/bitfield.h include for FIELD_G=
ET()
--

commit 68c62280ed8f695c082c0defbfb031a888057f82
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: cw2217: Add support for Cellwise cw2217

This commit adds a power supply driver for the Cellwise CW2217, CW2215, and
CW2218 I2C battery fuel gauges.

> diff --git a/drivers/power/supply/cw2217_battery.c b/drivers/power/supply=
/cw2217_battery.c
> new file mode 100644
> index 0000000000000..8b18db3d54db2
> --- /dev/null
> +++ b/drivers/power/supply/cw2217_battery.c
> @@ -0,0 +1,818 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Chrager driver for cw2217
> + *
> + * Copyright (c) 2026 Rockchip Electronics Co., Ltd.
> + *
> + * Author: Xu Shengfei <xsf@rock-chips.com>
> + */
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/i2c.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/power_supply.h>
> +#include <linux/regmap.h>
> +#include <linux/workqueue.h>

[Severity: Low]
cw2217_get_current(), cw2217_update_config(), and cw2217_check_profile()
call FIELD_GET(), which is defined in linux/bitfield.h.

Since CONFIG_BATTERY_CW2217 only depends on I2C, should linux/bitfield.h
be explicitly included here so the build does not fail with an implicit
declaration of FIELD_GET() on architectures such as x86_64 that do not pull
it in transitively?

[ ... ]

> +/* Default values from BSP driver */
> +#define CW2217_USER_RSENSE		1500
> +#define CW2217_DEFAULT_POLL_INTERVAL_MS	5000

[ ... ]

> +/*
> + * The TEMP register is an UNSIGNED 8bit read only register.
> + * It reports the real-time battery temperature
> + * measured at TS pin. The scope is from -40 to 87.5 degrees Celsius,
> + * LSB is 0.5 degree Celsius. TEMP(C) =3D - 40 + Value(0x06 Reg) / 2
> + */
> +static int cw2217_get_temp(struct cw2217_battery *cw_bat)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	ret =3D regmap_read(cw_bat->regmap, CW2217_TEMP, &reg);
> +	if (ret)
> +		return ret;
> +
> +	cw_bat->temp =3D ((int)reg / 2) - 40;
> +
> +	return 0;
> +}

[Severity: Medium]
Does cw2217_get_temp() report the temperature in the wrong units for
POWER_SUPPLY_PROP_TEMP?

cw2217_battery_get_property() returns cw_bat->temp directly for
POWER_SUPPLY_PROP_TEMP, which the power_supply ABI expects in tenths of a
degree Celsius (0.1 C). Computing ((int)reg / 2) - 40 reports whole degrees
Celsius (10x lower than expected) and truncates the 0.5 C LSB. Should this
be (int)reg * 5 - 400 instead?

> +
> +/*
> + * Current is a signed 16bit register (0x0E 0x0F) that reports current A=
/D
> + * converter result of the voltage across the current sense resistor,
> + * 10mohm typical. The register value should be divided by the sense
> + * resistance to convert to amperes. The value of the sense resistor
> + * determines the resolution and the full-scale range of the current rea=
dings.
> + * The LSB of 0x0F is (52.4/32768)uV for CW2215 and CW2217. The LSB of 0=
x0F is
> + * (125/32768)uV for CW2218.
> + */
> +static int cw2217_get_current(struct cw2217_battery *cw_bat)
> +{
> +	s32 cw_current;
> +	__be16 reg;
> +	u8 fw_ver;
> +	int ret;
> +
> +	if (cw_bat->fw_version =3D=3D 0) {
> +		cw_bat->cw_current =3D 0;
> +		dev_err(cw_bat->dev, "Error! CW2217 firmware read error!\n");
> +		return -EIO;
> +	}
> +
> +	ret =3D regmap_bulk_read(cw_bat->regmap, CW2217_CURRENT_H,
> +			       &reg, sizeof(reg));
> +	if (ret)
> +		return ret;
> +
> +	cw_current =3D (s16)be16_to_cpu(reg);
> +
> +	fw_ver =3D FIELD_GET(CW2217_ID_MASK, cw_bat->fw_version);
> +	switch (fw_ver) {
> +	case CW2215_ID:
> +	case CW2217_ID:
> +		cw_current =3D (cw_current * 1600) / (cw_bat->user_rsense / 1000);
> +		cw_bat->cw_current =3D cw_current * 1000;
> +		break;
> +	case CW2218_ID:
> +		cw_current =3D (cw_current * 3815) / (cw_bat->user_rsense / 1000);
> +		cw_bat->cw_current =3D cw_current * 1000;
> +		break;
> +	default:
> +		cw_bat->cw_current =3D 0;
> +		dev_err(cw_bat->dev, "Error! CW2217 firmware read error!\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int cw2217_parse_properties(struct cw2217_battery *cw_bat)
> +{
> +	struct device *dev =3D cw_bat->dev;
> +	int length;
> +	int ret;
> +
> +	ret =3D device_property_read_u32(dev, "cellwise,monitor-interval-ms",
> +				       &cw_bat->poll_interval_ms);
> +	if (ret) {
> +		dev_dbg(cw_bat->dev, "Using default poll interval\n");
> +		cw_bat->poll_interval_ms =3D CW2217_DEFAULT_POLL_INTERVAL_MS;
> +	}
> +
> +	/*
> +	 * Datasheet only lists options of between 1M and 50M for resistor
> +	 * values, so assuming that is all and clamping if out of range.
> +	 */
> +	ret =3D device_property_read_u32(dev,
> +				       "shunt-resistor-micro-ohms",
> +				       &cw_bat->user_rsense);
> +	if (ret) {
> +		cw_bat->user_rsense =3D CW2217_USER_RSENSE;
> +		dev_warn(cw_bat->dev,
> +			 "Using default resistor value, reported mA may be wrong\n");
> +	}
> +
> +	/* Clamp, but also warn we're clamping due to out of range. */
> +	if ((cw_bat->user_rsense < 1000000) || (cw_bat->user_rsense > 50000000)=
) {
> +		cw_bat->user_rsense =3D clamp(cw_bat->user_rsense, 1000000, 50000000);
> +		dev_warn(cw_bat->dev, "Shunt resistor value out of range, setting to %=
d",
> +			 cw_bat->user_rsense);
> +	}

[Severity: Medium]
Are the clamp bounds and scaling for cw_bat->user_rsense off by a factor of
1000?

A sense resistor between 1 mOhm and 50 mOhm corresponds to 1,000 to 50,000
micro-ohms (matching CW2217_USER_RSENSE =3D 1500 for 1.5 mOhm), whereas
1000000 to 50000000 micro-ohms is 1 Ohm to 50 Ohms.

Because of this check, both CW2217_USER_RSENSE (1500) and any valid
shunt-resistor-micro-ohms value in the 1-50 mOhm range get clamped up to
1000000, and cw2217_get_current() then divides by (cw_bat->user_rsense /
1000).

> +
> +	length =3D device_property_count_u8(dev, "cellwise,battery-profile");
> +	if (length < 0) {
> +		dev_warn(cw_bat->dev,
> +			 "No battery-profile found, using current flash contents\n");
> +	} else if (length !=3D CW2217_PROFILE_SZ) {
> +		dev_err(cw_bat->dev, "battery-profile must be %d bytes\n",
> +			CW2217_PROFILE_SZ);
> +		return -EINVAL;
> +	} else {
> +		cw_bat->bat_profile =3D devm_kzalloc(dev, length, GFP_KERNEL);
> +		if (!cw_bat->bat_profile)
> +			return -ENOMEM;
> +
> +		ret =3D device_property_read_u8_array(dev,
> +						    "cellwise,battery-profile",
> +						    cw_bat->bat_profile,
> +						    length);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Load a new battery profile provided from the device tree. */
> +static int cw2217_update_config(struct cw2217_battery *cw_bat)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	/* Set the battery monitor state to shutdown. */
> +	ret =3D cw2217_active(cw_bat, false);
> +	if (ret)
> +		return ret;
> +
> +	/* update new battery info */
> +	ret =3D regmap_raw_write(cw_bat->regmap, CW2217_BAT_PROFILE,
> +			       cw_bat->bat_profile, CW2217_PROFILE_SZ);

[ ... ]

> +/* Determine whether the battery profile needs to be updated. */
> +static int cw2217_check_profile(struct cw2217_battery *cw_bat)
> +{
> +	u8 bat_info[CW2217_PROFILE_SZ];
> +	int ret;
> +	u32 reg;
> +
> +	cw_bat->update_profile =3D false;
> +
> +	ret =3D regmap_read(cw_bat->regmap, CW2217_CONFIG, &reg);
> +	if (ret)
> +		return ret;
> +
> +	/* Active is 0x00, anything else is inactive */
> +	if (FIELD_GET(CW2217_CONFIG_ACT_MSK, reg)) {
> +		cw_bat->update_profile =3D true;
> +		return 0;
> +	}
> +
> +	ret =3D regmap_read(cw_bat->regmap, CW2217_SOC_ALERT, &reg);
> +	if (ret)
> +		return ret;
> +
> +	if (FIELD_GET(CW2217_SOC_UPDATE_FLG, reg) =3D=3D 0) {
> +		cw_bat->update_profile =3D true;
> +		return 0;
> +	}
> +
> +	ret =3D regmap_raw_read(cw_bat->regmap, CW2217_BAT_PROFILE, bat_info, C=
W2217_PROFILE_SZ);
> +	if (ret) {
> +		dev_err(cw_bat->dev, "Failed to read existing battery profile\n");
> +		return ret;
> +	}
> +
> +	if (memcmp(bat_info, cw_bat->bat_profile, CW2217_PROFILE_SZ)) {
> +		dev_warn(cw_bat->dev, "Replacing stored battery profile\n");
> +		cw_bat->update_profile =3D true;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cw2217_init(struct cw2217_battery *cw_bat)
> +{
> +	int ret;
> +
> +	ret =3D cw2217_get_chip_id(cw_bat);
> +	if (ret)
> +		return dev_err_probe(cw_bat->dev, ret, "I2C read write error");
> +
> +	/*
> +	 * All of the known Cellwise 221x chips set the ID bits to 0xa0. If it
> +	 * doesn't match, we're trying to probe the wrong hardware.
> +	 */
> +	if (cw_bat->chip_id !=3D CW2217_CHIP_ID)
> +		return dev_err_probe(cw_bat->dev, -ENODEV, "Not a cw221x\n");
> +
> +	ret =3D cw2217_check_profile(cw_bat);
> +	if (ret) {
> +		dev_err(cw_bat->dev, "i2c read write error");
> +		return ret;
> +	}
> +
> +	if (cw_bat->update_profile) {
> +		ret =3D cw2217_update_config(cw_bat);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
What happens in cw2217_init() when the optional cellwise,battery-profile
property is omitted?

In cw2217_parse_properties(), a missing cellwise,battery-profile logs a
warning and leaves cw_bat->bat_profile as NULL. cw2217_probe() then calls
cw2217_init() -> cw2217_check_profile():

- If the chip is already active and CW2217_SOC_UPDATE_FLG is set,
  cw2217_check_profile() calls memcmp(bat_info, cw_bat->bat_profile,
  CW2217_PROFILE_SZ), dereferencing NULL.
- If the chip is inactive or CW2217_SOC_UPDATE_FLG is clear,
  cw2217_check_profile() sets cw_bat->update_profile =3D true, and
  cw2217_init() calls cw2217_update_config(), which passes
  cw_bat->bat_profile (NULL) to regmap_raw_write().

Should cw2217_init() or cw2217_check_profile() checkwhether
cw_bat->bat_profile is non-NULL before comparing or uploading the profile?

[ ... ]

> +static int cw2217_probe(struct i2c_client *client)
> +{
> +	struct power_supply_config psy_cfg =3D { 0 };
> +	struct cw2217_battery *cw_bat;
> +	int ret;

[ ... ]

> +	psy_cfg.drv_data =3D cw_bat;
> +	cw_bat->cw_bat =3D devm_power_supply_register(&client->dev,
> +						    &cw2217_bat_desc, &psy_cfg);

[Severity: Medium]
Should cw2217_probe() also set psy_cfg.fwnode =3D dev_fwnode(cw_bat->dev)
before calling devm_power_supply_register()?

Without psy_cfg.fwnode set, __power_supply_register() does not attach the
device's firmware node to the power_supply device, so properties parsed by
the core such as power-supplies and monitored-battery are ignored.

[ ... ]

> +static int __maybe_unused cw2217_bat_suspend(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct cw2217_battery *cw_bat =3D i2c_get_clientdata(client);
> +
> +	cancel_delayed_work(&cw_bat->battery_delay_work);
> +	return 0;
> +}

[Severity: Medium]
Can cw2217_bat_work() race with system suspend here?

Because cw2217_bat_suspend() calls cancel_delayed_work() instead of
cancel_delayed_work_sync(), an already-running cw2217_bat_work() instance
is not waited on:

cw2217_bat_work()
  cw2217_update_data()
  queue_delayed_work(cw_bat->battery_workqueue,
                     &cw_bat->battery_delay_work, ...)

It can continue performing I2C reads while the device and I2C adapter
suspend, and then re-queue battery_delay_work at the end of the handler.
Should cw2217_bat_suspend() use cancel_delayed_work_sync()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027131751.1724=
448-1-macroalpha82@gmail.com?part=3D2
