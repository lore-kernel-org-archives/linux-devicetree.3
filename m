Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107923;
	b=wlDFo8b815CAWlR6z8xyAR3KXgeWS2Xsp41JI5FUAeb39ywQs68MbW7/kBu7ZCpxpwlr
	 HKkk32brywfjZtSYKrSaMMXZ9wvqsIKsjUkSuFL2NckE6BwEMHdgjkhe9U9Wo2cTrFFfX
	 lGglifZKKy+EtbsDFqVk8C5JKQwWQy6osYpnw6EqhaI0mAWlk8yLtgYZUK8yoKRVK1lKg
	 G/dz3bsxx8g/FXwqbxD3SFlcuv11a+DXkbQ2Lk7olhHPu+3cXUeykr5Fts79bhx024fa4
	 aGy27yYTDjr+QL++EjcZuzm9y8RCmvqoOk2j6LXGRWpppMY9ZoVZIqTW9im2cZDUaag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107923;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bxuzEpKSDJB/RsxEPTYJQwupDMqkOWRtvPnDzcAlBes=;
	b=VpGm+eN/zhUheoAZ3N7NzuugGFfYAvVyvkrntixBh2GMQUtHKlIzYbiE7XzkxPMqaTAE
	 gZBso99c1jKYP2Ot8+rpXdXL49BxE+igTF05t0AgXuUEVZR9K8Va8DbGKMSrA9kSfaB/P
	 TogjP/BmUmYeHplAoyrAOLwCC06LdSx00My27EnYXZdzn23Ay+KjRJ07S9SgeSMRfWLxO
	 HyDc2XAKE+tXl6x0pAwC0UCZ4FnEACvxIK9+logXh+myZ6XzyFNehok57dUPwuD7Z01ev
	 WCgF9tT5x55DwVbe7E8VAl6A4tMhAABoTWU0rsamMF0iJKzX3pGpQaxKuFbZSXIpGAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YtO24UXY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F9606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YtO24UXY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5017E1F01825;
	Tue, 27 Oct 2026 13:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793107922;
	bh=bxuzEpKSDJB/RsxEPTYJQwupDMqkOWRtvPnDzcAlBes=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YtO24UXYk9Xx429iSsvN2XDEJ7qoVhNbtrFbmZMfIP6aJHtCTktZQ9jsHSZ2aa6VX
	 sKBfwtxcVxq0M1SW3yvagRgAVFAL1hwrfOtBQ+JK8tdLJyb5m6PDEho8aCCbIkum17
	 L1XAgapNgxGbnZrg/pbflQwKhpTjZIV+rg1RP3+h3ZBqzoaCaMi1CSfMGXjPOpjNd1
	 dgQcDXgLKHhfuWfXg4Q2U+ADltmQ6XS+wdacp1LxAGbxQJEQ+eTbROikCuBRXvndVQ
	 DwUsQqs0S0sYC9p94P5gY/aO2gInQhclBCBXvsMwRAGALst+zV92sZfzP9Y5jh5ZwN
	 qz+eVzOhGnBWQ==
Message-ID: <sashiko-outbox-186624@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Battery Gauge to Anbernic
 Vita-Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027131751.1724448-4-macroalpha82@gmail.com>
References: <20261027131751.1724448-1-macroalpha82@gmail.com>
 <20261027131751.1724448-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 13:32:01 +0000
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
- [High] power: supply: cw2217: 1000x unit error in shunt-resistor-micro-oh=
ms
- [High] power: supply: cw2217: wrong temperature units in cw2217_get_temp()
- [High] power: supply: cw2217: NULL deref when battery-profile is omitted
- [Medium] power: supply: cw2217: missing psy_cfg.fwnode in cw2217_probe()
- [Medium] power: supply: cw2217: unsynchronized work cancel in cw2217_bat_=
suspend()
- [Low] arm64: dts: rockchip: cw2217 fuel gauge node named charger@64
--

commit b2629263398e52e8a7a0c66b2ac2935fa26ad154
Author: Chris Morgan <macromorgan@hotmail.com>

arm64: dts: rockchip: Add Battery Gauge to Anbernic Vita-Pro

This commit adds the Devicetree node for the Cellwise CW2217 battery fuel
gauge on the Anbernic RG Vita Pro.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts=
 b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> index 358dea43f9b66..6a730499148db 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> @@ -954,7 +954,26 @@ hym8563: rtc@51 {
>  		wakeup-source;
>  	};
> =20
> -	/* cellwise,cw221X battery manager at 0x64 */
> +	cw2217: charger@64 {

[Severity: Low]
Since the CW2217 is a battery fuel gauge (registered as
POWER_SUPPLY_TYPE_BATTERY) and this I2C bus already has a separate charger
node (sgm41542: charger@3b), should this node be named fuel-gauge@64 or
battery@64 instead of charger@64?

> +		compatible =3D "cellwise,cw2217";
> +		reg =3D <0x64>;

[Severity: High]
In the underlying driver for cellwise,cw2217
(drivers/power/supply/cw2217_battery.c), cw2217_update_data() calls
cw2217_get_temp(), which computes:

	cw_bat->temp =3D ((int)reg / 2) - 40;

and cw2217_battery_get_property() returns that value directly for
POWER_SUPPLY_PROP_TEMP:

	case POWER_SUPPLY_PROP_TEMP:
		val->intval =3D cw_bat->temp;
		break;

The power_supply class ABI expects POWER_SUPPLY_PROP_TEMP in tenths of a
degree Celsius (for example, power_supply_read_temp() in
drivers/power/supply/power_supply_core.c multiplies val.intval by 100 to
convert to millidegrees Celsius):

	/* Convert tenths of degree Celsius to milli degree Celsius. */
	*temp =3D val.intval * 100;

Since the CW2217 temperature register has a 0.5 degree Celsius step with a
-40 degree Celsius offset, doesn't reporting ((int)reg / 2) - 40 instead of
(int)reg * 5 - 400 cause all temperature readings to be 10x too low and
discard the 0.5 degree resolution?

[Severity: Medium]
Also in drivers/power/supply/cw2217_battery.c, cw2217_probe() allocates
cw_bat->battery_workqueue without WQ_FREEZABLE, and cw2217_bat_suspend()
cancels the polling work asynchronously:

	cancel_delayed_work(&cw_bat->battery_delay_work);
	return 0;

while cw2217_bat_work() performs I2C reads and unconditionally re-queues
itself:

	ret =3D cw2217_update_data(cw_bat);
	if (ret)
		dev_err(cw_bat->dev, "i2c read error when update data");

	queue_delayed_work(cw_bat->battery_workqueue,
			   &cw_bat->battery_delay_work,
			   msecs_to_jiffies(cw_bat->poll_interval_ms));

If cw2217_bat_work() is already running when cw2217_bat_suspend() executes,
won't it race with I2C controller suspend and re-arm battery_delay_work
while the system is suspended unless cancel_delayed_work_sync() is used?

> +		cellwise,battery-profile =3D /bits/ 8 <
> +			0x5a 0x00 0x00 0x00 0x00 0x00 0x00 0x00
> +			0xab 0xb5 0xae 0xc0 0xa9 0xa4 0xcf 0xaf
> +			0x96 0xff 0xff 0xd7 0x9a 0x83 0x70 0x69
> +			0x65 0x65 0x65 0xb8 0x81 0xd9 0xaf 0xd9
> +			0xd2 0xce 0xcd 0xcb 0xca 0xc7 0xc8 0xc5
> +			0xc2 0xba 0xa8 0x96 0x8a 0x85 0x7d 0x7a
> +			0x7f 0x88 0x92 0x93 0x94 0xd3 0xff 0x5f
> +			0x20 0x00 0xab 0x10 0x00 0x91 0x68 0x00
> +			0x00 0x00 0x64 0x3c 0xa0 0x89 0x00 0x00
> +			0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xb2
> +		>;

[Severity: High]
While this board provides cellwise,battery-profile, the property is optional
in Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml, and
cw2217_parse_properties() in drivers/power/supply/cw2217_battery.c leaves
cw_bat->bat_profile as NULL when it is absent:

	length =3D device_property_count_u8(dev, "cellwise,battery-profile");
	if (length < 0) {
		dev_warn(cw_bat->dev,
			 "No battery-profile found, using current flash contents\n");
	} else if (length !=3D CW2217_PROFILE_SZ) {

However, cw2217_init() unconditionally calls cw2217_check_profile(), which
either passes cw_bat->bat_profile to memcmp():

	if (memcmp(bat_info, cw_bat->bat_profile, CW2217_PROFILE_SZ)) {
		dev_warn(cw_bat->dev, "Replacing stored battery profile\n");
		cw_bat->update_profile =3D true;
	}

or sets cw_bat->update_profile =3D true, causing cw2217_init() ->
cw2217_update_config() to pass cw_bat->bat_profile to regmap_raw_write():

	/* update new battery info */
	ret =3D regmap_raw_write(cw_bat->regmap, CW2217_BAT_PROFILE,
			       cw_bat->bat_profile, CW2217_PROFILE_SZ);

Won't probing a node without cellwise,battery-profile trigger a NULL pointer
dereference on cw_bat->bat_profile?

> +		monitored-battery =3D <&battery>;
> +		power-supplies =3D <&sgm41542>;

[Severity: Medium]
Does power-supplies =3D <&sgm41542> take effect with the current cw2217 dri=
ver?

In drivers/power/supply/cw2217_battery.c, cw2217_probe() registers the power
supply without setting psy_cfg.fwnode:

	psy_cfg.drv_data =3D cw_bat;
	cw_bat->cw_bat =3D devm_power_supply_register(&client->dev,
						    &cw2217_bat_desc, &psy_cfg);

When __power_supply_register() calls power_supply_check_supplies() in
drivers/power/supply/power_supply_core.c, it checks:

	/* No device node found, nothing to do */
	if (!psy->dev.fwnode)
		return 0;

Without psy_cfg.fwnode =3D dev_fwnode(cw_bat->dev), won't
power_supply_check_supplies() return early, ignoring the power-supplies
phandle and skipping probe deferral if sgm41542 has not probed yet?

> +		shunt-resistor-micro-ohms =3D <2000000>;

[Severity: High]
Is shunt-resistor-micro-ohms scaled by an extra factor of 1000 (nano-ohms
instead of micro-ohms) here, in the binding schema, and in the driver?

A 2 mOhm sense resistor is 2,000 micro-ohms, whereas <2000000> micro-ohms is
2 Ohms.

In Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml, the
range for a 1 mOhm to 50 mOhm shunt resistor is also specified 1000x too
high (1 Ohm to 50 Ohms):

  shunt-resistor-micro-ohms:
    description: |
      The value, in micro-ohms, of the shunt resistor used for sampling
      the battery current.
    minimum: 1000000
    maximum: 50000000

And in drivers/power/supply/cw2217_battery.c, CW2217_USER_RSENSE is defined
as 1500 (1.5 mOhm in micro-ohms), but cw2217_parse_properties() clamps
cw_bat->user_rsense to 1000000..50000000 (which also overwrites the 1500
fallback to 1000000 whenever the property is omitted):

	ret =3D device_property_read_u32(dev,
				       "shunt-resistor-micro-ohms",
				       &cw_bat->user_rsense);
	if (ret) {
		cw_bat->user_rsense =3D CW2217_USER_RSENSE;
		dev_warn(cw_bat->dev,
			 "Using default resistor value, reported mA may be wrong\n");
	}

	/* Clamp, but also warn we're clamping due to out of range. */
	if ((cw_bat->user_rsense < 1000000) || (cw_bat->user_rsense > 50000000)) {
		cw_bat->user_rsense =3D clamp(cw_bat->user_rsense, 1000000, 50000000);
		dev_warn(cw_bat->dev, "Shunt resistor value out of range, setting to %d",
			 cw_bat->user_rsense);
	}

followed by cw2217_get_current() dividing cw_bat->user_rsense by 1000:

	case CW2215_ID:
	case CW2217_ID:
		cw_current =3D (cw_current * 1600) / (cw_bat->user_rsense / 1000);
		cw_bat->cw_current =3D cw_current * 1000;
		break;
	case CW2218_ID:
		cw_current =3D (cw_current * 3815) / (cw_bat->user_rsense / 1000);
		cw_bat->cw_current =3D cw_current * 1000;
		break;

Should shunt-resistor-micro-ohms use actual micro-ohms (2000 in this DT nod=
e,
and 1000..50000 in the schema and driver)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027131751.1724=
448-1-macroalpha82@gmail.com?part=3D3
