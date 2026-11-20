Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210979;
	b=K70ia5z11+4k0ySd5r7j31Y1aH8mwoEv/kIwQmxP6JuEfA8OK2HhRmUDAGQQmsSlqPeu
	 SPodhsqzookwJon3pZeWuLy4Es8nzNUgrEyDyTLuGaYbq7Mu08v7R5J1a5TTY9mj3B/7a
	 /AGW9hK8qprpGR2eydwgFAaPMVPuGSpHyKVv+kzAbWBAsQRifnnyJG1VZd6+dGAlMzC9o
	 X25GIu0dY4mhBeIWqnxaJ+SVzzIMeriIh8VRBd/MGyJScY7e2G/cm1cqceISQD4e/Vubs
	 Xq6UbLcKsvIukHouN2H2uO8k9rg3/TvF4eyB+DpWkPlOk6WMjiA4X/OiI57+XtwsrfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210979;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=H/16LcwBS3pMY05rENBIXnogYiIxMoqlB7pgoFRgdeE=;
	b=GRiCJfv6xLytJjwn7pGvkkD0lW52xYo40OY6p5iJWMwCRUsJmxSj/TVu/EFEDSlXBSZY
	 1A47ulattJYwWFf+OZs2gE70Z6Xs23kaEi0KUs54ItcMZoKPORgV66w94+L6iPIyoP9Kh
	 rvMdZyPmP25LdF1W8GXcDtRuvikmmAfxYBXfkEw4EEvFNECaJ3d4CdjdysCULGU/Cmf+C
	 y0Gpo3e3Hhe4vYtiH/wTFppp7Qy3BJ2MFBf2RVi3mtKj8NSbb4rdN4vZheLDEnWE2xJXT
	 adlGU+4cMzO6pxqDqRwSSpNTXxtHxiY466O/VOO9+oSzYSPwV3v+BW8tvCboBB4Wafw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4lyql3w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197F8606A689
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 21:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4lyql3w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F8C1F000C4;
	Fri, 20 Nov 2026 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795210978;
	bh=H/16LcwBS3pMY05rENBIXnogYiIxMoqlB7pgoFRgdeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R4lyql3w3uc6fuyQc06rRxhN/Vp503FHHBN+IDJtTRoXm/DwEYzsWv5ws8h1w89Gr
	 qccIP6Iqzze4xJ5PbC7vcLYVBNxo6vEjn4VTyUCB8zt5HUHQQQVABpHoJFw8CDBH95
	 c78LWbxSoXQK7VTXls70Fxh/l+5s9MGqsDOxMtwj/nPKETCaaWMMtB1IyYUJ+2V6gO
	 WZiQaxBT+uZ4YJp4Sh3OnsyL10l+JjeeHquL7TRjc8curz4tRYHVIrNQ9O35NpP1Gl
	 jEMsgedoye9uPoFvWDFrwNCcyCvg8W8oOktmFV98D+gM55kmI1K3Qr4YFD5UkmET0E
	 1AiPv6gfzuhkQ==
Message-ID: <sashiko-outbox-226207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 2/3] power: supply: cw2217: Add support for Cellwise
 cw2217
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120212815.35663-3-macroalpha82@gmail.com>
References: <20261120212815.35663-1-macroalpha82@gmail.com>
 <20261120212815.35663-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 21:42:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] power: supply: cw2217: 32-bit signed overflow in
  cw2217_get_current()
- [Medium] power: supply: cw2217: gauge left in shutdown mode without DT
  profile
- [Medium] power: supply: cw2217: missing power_supply_changed() in
  cw2217_bat_work()
- [Low] power: supply: cw2217: unused match table with !CONFIG_OF via
  of_match_ptr()
--

commit b7f80d5b2ad4376d864e98e5237d2f7d87f7e959
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: cw2217: Add support for Cellwise cw2217

This commit adds a power supply driver for the Cellwise CW2215, CW2217, and
CW2218 I2C battery fuel gauges.

> diff --git a/drivers/power/supply/cw2217_battery.c b/drivers/power/supply=
/cw2217_battery.c
> new file mode 100644
> index 0000000000000..a54e19889b46c
> --- /dev/null
> +++ b/drivers/power/supply/cw2217_battery.c
[ ... ]
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
> +		cw_bat->cw_current =3D (cw_current * 1600 * 1000) / cw_bat->user_rsens=
e;
> +		break;
> +	case CW2218_ID:
> +		cw_bat->cw_current =3D (cw_current * 3815 * 1000) / cw_bat->user_rsens=
e;
> +		break;

[Severity: High]
Can the numerator multiplication in cw2217_get_current() overflow s32?

Because cw_current and the multiplier literals are 32-bit signed integers,
(cw_current * 1600 * 1000) overflows s32 once abs(cw_current) reaches 1343
(~1.43 A with the default 1500 uOhm shunt, or ~215 mA with a 10 mOhm
shunt), and (cw_current * 3815 * 1000) overflows at 563.  When charging
current wraps negative, POWER_SUPPLY_PROP_CURRENT_NOW is corrupted and
cw2217_battery_get_property() misreports POWER_SUPPLY_PROP_STATUS as
NOT_CHARGING or FULL.

Using div_s64((s64)cw_current * 1600 * 1000, cw_bat->user_rsense) would
avoid the overflow.

[ ... ]

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
> +	if (!cw_bat->bat_profile) {
> +		dev_warn(cw_bat->dev, "continuing with default bat profile\n");
> +		return 0;
> +	}

[Severity: Medium]
Does returning early when cw_bat->bat_profile is NULL leave the gauge in
shutdown mode?

If the optional cellwise,battery-profile property is omitted and the chip
is still in its default shutdown state (CW2217_CONFIG =3D 0xF0),
CW2217_FW_VERSION reads as 0x00, causing cw2217_get_current() to fail
cw2217_probe() with -EIO.

[ ... ]

> +static void cw2217_bat_work(struct work_struct *work)
> +{
> +	struct delayed_work *delay_work;
> +	struct cw2217_battery *cw_bat;
> +	int ret;
> +
> +	delay_work =3D container_of(work,
> +				  struct delayed_work,
> +				  work);
> +
> +	cw_bat =3D container_of(delay_work,
> +			      struct cw2217_battery,
> +			      battery_delay_work);
> +
> +	ret =3D cw2217_update_data(cw_bat);
> +	if (ret)
> +		dev_err(cw_bat->dev, "i2c read error when update data");
> +
> +	queue_delayed_work(cw_bat->battery_workqueue,
> +			   &cw_bat->battery_delay_work,
> +			   msecs_to_jiffies(cw_bat->poll_interval_ms));
> +}

[Severity: Medium]
Should cw2217_bat_work() call power_supply_changed(cw_bat->cw_bat) when
battery data changes so userspace and in-kernel subscribers receive update
notifications?

[ ... ]

> +static const struct of_device_id cw2217_match_table[] =3D {
> +	{ .compatible =3D "cellwise,cw2215", },
> +	{ .compatible =3D "cellwise,cw2217", },
> +	{ .compatible =3D "cellwise,cw2218", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, cw2217_match_table);
> +
> +static struct i2c_driver cw2217_driver =3D {
> +	.driver =3D {
> +		.name =3D "cw2217",
> +		.pm =3D &cw2217_bat_pm_ops,
> +		.of_match_table =3D of_match_ptr(cw2217_match_table),
> +	},

[Severity: Low]
Does using of_match_ptr() here trigger a -Wunused-const-variable warning on
cw2217_match_table when CONFIG_OF is disabled?  Since the driver uses
generic device_property_* helpers, of_match_ptr() can be dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120212815.3566=
3-1-macroalpha82@gmail.com?part=3D2
