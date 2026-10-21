Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580220;
	b=F0/Geaa2ypiaUJH3WS+1ZTl7l+kOoLECAMte4vHdeQZF+LNaBEs7sdscT66+1/FkXAY4
	 EOBmFQqlNk2vt77qFfJf1l4PdOfV8J90lX9wxgvxkDyjynfdP0EntD/9Eahzk344t/Jew
	 bb6I9f07VrkB/jdSHonaM/pan3ZS15l6q71TXXXM683gxgVls3/34nYIX33gHPu9lqjO9
	 9GZ3TQyRIHnUAXOFLg6aomvwU1ouF06BwBMp51B7ZWnJj5TtmKgRyiGHZ81+AZbrMjUKL
	 NHgog3IXGUOvinqTtZOfrk26FA31zBRhev4XEXc5YMTjl9Mtt/7RVZfM+F6ieCY6eTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580220;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rzk9z3hwjs0+L2ZusjvuQB1QJo7F0GloIXbRSYOb20o=;
	b=KLTx/WB07GI3K3L4fmaNslOgmnPdOtuIN3/RKy+Z0qmp/+aXWVDrqFHuvFUNmrnuMCqM
	 jgaA2lxNpKs9Ozco1wi1cVQCkfBqAZx4u94IdkiPa7V2zvKZ8Pu5vchkxABJlAO99yTOU
	 s6wM4AdzSKVUgGjwetj70zHwLDsuc8B+ZsTcEySXqyMO9eEUJE58/tLme01UM2ZF4zQQk
	 WtuFYTOk6u15Q4x945CgyW/H6y0FJ4QbKwXuZUdM2quDAWVI6IXF0mbHXAS5venixM5be
	 m1+Yetl2ONM3fdg4KtWHrnMoIHQ6W3PEzg6wD7g4bs3wOsOJoQ2KKnb+GkKAkbTVtqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHBi59b3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEEC606A323
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHBi59b3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185901F000CE;
	Wed, 21 Oct 2026 10:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580219;
	bh=rzk9z3hwjs0+L2ZusjvuQB1QJo7F0GloIXbRSYOb20o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hHBi59b3g65F5b/NhVOlL0GRuU/aicdciBimqp0Pfz6B/Knk+n7BKWFKQGY1I9DJd
	 6QZJkxlRFvbCUv5+et7lg7GTOwkXvLYJCXYGkgr2XJWp0nqRW2xf+d9FPq3SvHOId6
	 R19TInJ1kxN91jAiiZsknH0xhxAAWxz8W9Usy42deJQxmEUuQa9OK5Rj85Je/CMmm4
	 mNDFXsjf8sdfivdjuB82wPRDjpkDjTrhoPxmop28NYvFLYoYhKfPGKaObz0bWkUwPj
	 JmVprO/d8Crz0Z290EmuJaITQ+GHGni+78Ky6a2Xgdcb7/nnqcVO+9YwYkGPcBUQ+4
	 QJB/mlEhqvBVw==
Message-ID: <sashiko-outbox-180131@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] regulator: Add TI LM51772 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:56:58 +0000
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
- [High] regulator: lm51772: wrong register for CONV_EN in lm51772_set_conv=
_en()
- [High] regulator: lm51772: cached CLEAR_FAULTS read in lm51772_irq_renabl=
e()
- [High] regulator: lm51772: OVP lowered before VOUT in lm51772_regulator_s=
et_voltage_sel()
- [Medium] regulator: lm51772: multi-bit mask passed to regulator_err2notif=
()
- [Medium] regulator: lm51772: plain 64-bit division in lm51772_regulator_s=
et_current_limit()
- [Medium] regulator: lm51772: min_uA ignored in lm51772_regulator_set_curr=
ent_limit()
--

commit a4b40e7b6b6cb8eaba3df00e481d736c9bbb846f
Author: Paul Louvel <paul.louvel@bootlin.com>

regulator: Add TI LM51772 support

This commit adds an I2C regulator driver for the TI LM51772 buck-boost
controller, supporting a configurable buck-boost output and a fixed 5 V LDO
output with voltage setting, current limiting, and fault reporting.

> diff --git a/drivers/regulator/lm51772-regulator.c b/drivers/regulator/lm=
51772-regulator.c
> new file mode 100644
> index 0000000000000..b5259f2772433
> --- /dev/null
> +++ b/drivers/regulator/lm51772-regulator.c
> @@ -0,0 +1,826 @@

[ ... ]

> +/* MFR_SPECIFIC_D0 bits */
> +#define LM51772_EN_VCC1				BIT(5)
> +
> +/* MFR_SPECIFIC_D1 bits */
> +#define LM51772_EN_THER_WARN			BIT(7)
> +#define LM51772_THW_THRESHOLD_MASK		GENMASK(6, 5)
> +#define LM51772_EN_NINT				BIT(4)
> +#define LM51772_CONV_EN				BIT(0)

[ ... ]

> +static int lm51772_set_conv_en(struct regmap *regmap, bool enable)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(regmap, LM51772_REG_USB_PD_CONTROL_0,
> +				 LM51772_CONV_EN2,
> +				 FIELD_PREP(LM51772_CONV_EN2, enable));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D0,
> +				  LM51772_CONV_EN,
> +				  FIELD_PREP(LM51772_CONV_EN, enable));
> +}
> +
> +static int lm51772_get_conv_en(struct regmap *regmap)
> +{
> +	unsigned int pd_ctrl, cfg0;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_USB_PD_CONTROL_0, &pd_ctrl);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_MFR_SPECIFIC_D0, &cfg0);
> +	if (ret)
> +		return ret;
> +
> +	return FIELD_GET(LM51772_CONV_EN2, pd_ctrl) || FIELD_GET(LM51772_CONV_E=
N, cfg0);
> +}

[Severity: High]
Should lm51772_set_conv_en() and lm51772_get_conv_en() access
LM51772_REG_MFR_SPECIFIC_D1 instead of LM51772_REG_MFR_SPECIFIC_D0 for
LM51772_CONV_EN?

LM51772_CONV_EN is defined under the MFR_SPECIFIC_D1 bit definitions, and in
lm51772_reg_defaults, LM51772_REG_MFR_SPECIFIC_D1 has a default value of
0x09 (bit 0 set) while LM51772_REG_MFR_SPECIFIC_D0 defaults to 0x32 (bit 0
clear).

When lm51772_regulator_enable(), lm51772_regulator_disable(), or
lm51772_regulator_is_enabled() is called on the vout regulator, updating and
reading LM51772_REG_MFR_SPECIFIC_D0 leaves LM51772_CONV_EN set in
LM51772_REG_MFR_SPECIFIC_D1, preventing the converter from being disabled in
hardware while modifying bit 0 of LM51772_REG_MFR_SPECIFIC_D0.

[ ... ]

> +static int lm51772_set_ov(struct regulator_dev *rdev, int lim_uV)
> +{
> +	static const struct linear_range ovp_ranges[] =3D {
> +		LINEAR_RANGE(4000000, 0, 0x17, 500000),
> +		LINEAR_RANGE(16000000, 0x18, 0x3f, 1000000),
> +	};
> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
> +	struct device *dev =3D rdev_get_dev(rdev);
> +	unsigned int selector;
> +	bool found;
> +	int ret;
> +
> +	ret =3D linear_range_get_selector_low_array(ovp_ranges, ARRAY_SIZE(ovp_=
ranges), lim_uV,
> +						  &selector, &found);
> +	if (ret || !found)
> +		return -EINVAL;
> +
> +	dev_dbg(dev, "OVP set to %d uV (selector 0x%02x)\n", lim_uV, selector);
> +
> +	return regmap_write(regmap, LM51772_REG_MFR_SPECIFIC_D5, selector);
> +}
> +
> +static int lm51772_regulator_set_voltage_sel(struct regulator_dev *rdev,=
 unsigned int selector)
> +{
> +	const struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	/*
> +	 * The LM51772 uses hardcoded OVP thresholds. Update the OVP threshold
> +	 * to match the new voltage.
> +	 */
> +	if (priv->ovp_thres) {
> +		ret =3D regulator_list_voltage_pickable_linear_range(rdev, selector);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D lm51772_set_ov(rdev, ret + priv->ovp_thres);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regulator_set_voltage_sel_pickable_regmap(rdev, selector);
> +}

[Severity: High]
When decreasing the output voltage in lm51772_regulator_set_voltage_sel()
while priv->ovp_thres is set, can calling lm51772_set_ov() before
regulator_set_voltage_sel_pickable_regmap() trip a false over-voltage
protection fault because VOUT is still at the higher voltage when the lower
OVP threshold is written to LM51772_REG_MFR_SPECIFIC_D5?

Also, in lm51772_set_ov(), ovp_ranges[0] ends at 15500000 uV (selector 0x17)
and ovp_ranges[1] starts at 16000000 uV (selector 0x18), up to 55000000 uV
(selector 0x3f). If ret + priv->ovp_thres falls between 15500001 uV and
15999999 uV, or exceeds 55000000 uV, linear_range_get_selector_low_array()
sets found to false and lm51772_set_ov() returns -EINVAL, causing the
voltage change to fail.

[ ... ]

> +static int lm51772_regulator_set_current_limit(struct regulator_dev *rde=
v, int min_uA, int max_uA)
> +{
> +	struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
> +	u64 voltage_uV =3D ((u64)priv->sense_res_milliohms * max_uA) / 1000;
> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
> +	u8 ilim_reg;
> +
> +	if (priv->iset_pin)
> +		return -EOPNOTSUPP;
> +
> +	if (voltage_uV < LM51772_ILIM_THR_MIN_UV || voltage_uV > LM51772_ILIM_T=
HR_MAX_UV)
> +		return -EINVAL;
> +
> +	ilim_reg =3D voltage_uV / LM51772_ILIM_THR_STEP_UV;

[Severity: Medium]
Will dividing u64 values with the plain / operator in
lm51772_regulator_set_current_limit() cause a link failure (__udivdi3 /
__aeabi_uldivmod undefined) when building on 32-bit architectures? Should
this use div_u64() instead?

[Severity: Medium]
What happens in lm51772_regulator_set_current_limit() if the truncated
register value ilim_reg corresponds to a current limit strictly below
min_uA? Because min_uA is not checked, can this program a hardware current
limit lower than the minimum requested by the caller instead of returning
-EINVAL?

> +
> +	dev_dbg(rdev_get_dev(rdev),
> +		"set current limit: %d uA (ilim_reg 0x%02x, sense_res %d mOhm)\n", max=
_uA, ilim_reg,
> +		priv->sense_res_milliohms);
> +
> +	return regmap_write(regmap, LM51772_REG_ILIM_THRESHOLD, ilim_reg);
> +}

[ ... ]

> +static int lm51772_irq_map_event(int irq, struct regulator_irq_data *rid,
> +			     unsigned long *dev_mask)
> +{
> +	struct regmap *regmap =3D rid->data;
> +	unsigned int reg, errors;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;
> +
> +	errors =3D lm51772_status2err(reg);
> +
> +	for (size_t i =3D 0; i < rid->num_states; i++) {
> +		rid->states[i].errors =3D errors & rid->states[i].possible_errs;
> +		rid->states[i].notifs =3D regulator_err2notif(rid->states[i].errors);

[Severity: Medium]
In lm51772_irq_map_event(), what happens when more than one fault bit is set
in LM51772_REG_STATUS_BYTE at the same time?

lm51772_status2err() ORs multiple REGULATOR_ERROR_* flags together, so
rid->states[i].errors can have multiple bits set. However,
regulator_err2notif() in include/linux/regulator/driver.h is a switch
statement over single-bit REGULATOR_ERROR_* constants and returns 0 when
passed a multi-bit mask, which drops the corresponding REGULATOR_EVENT_*
notifications.

> +
> +		if (reg & LM51772_STAT_OFF)
> +			rid->states[i].notifs |=3D REGULATOR_EVENT_DISABLE;
> +
> +		if (rid->states[i].errors || rid->states[i].notifs & REGULATOR_EVENT_D=
ISABLE)
> +			*dev_mask |=3D BIT(i);
> +	}
> +
> +	rid->opaque =3D reg;
> +
> +	return 0;
> +}
> +
> +static int lm51772_irq_renable(struct regulator_irq_data *rid)
> +{
> +	struct regmap *regmap =3D rid->data;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;
> +
> +	if (rid->opaque && rid->opaque =3D=3D reg) {
> +		ret =3D regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
> +		if (ret)
> +			return REGULATOR_FAILED_RETRY;
> +
> +		return REGULATOR_ERROR_ON;
> +	}
> +
> +	rid->opaque =3D 0;
> +
> +	return REGULATOR_ERROR_CLEARED;
> +}

[ ... ]

> +static const struct regmap_range lm51772_volatile_ranges[] =3D {
> +	regmap_reg_range(LM51772_REG_PD_STATUS_0, LM51772_REG_PD_STATUS_0),
> +	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE)
> +};
> +
> +static const struct regmap_access_table lm51772_volatile_table =3D {
> +	.yes_ranges =3D lm51772_volatile_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(lm51772_volatile_ranges)
> +};
> +
> +static const struct reg_default lm51772_reg_defaults[] =3D {
> +	{ LM51772_REG_CLEAR_FAULTS, 0x00 },	{ LM51772_REG_ILIM_THRESHOLD, 0x64 =
},

[Severity: High]
Does regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg) in
lm51772_irq_renable() actually reach the hardware over I2C?

Because lm51772_regmap_config enables REGCACHE_MAPLE, seeds
LM51772_REG_CLEAR_FAULTS in lm51772_reg_defaults, and omits
LM51772_REG_CLEAR_FAULTS from lm51772_volatile_ranges, regmap_read() returns
the cached 0x00 value without performing an I2C bus transaction. As a
result, latched faults in LM51772_REG_STATUS_BYTE are never cleared and
lm51772_irq_renable() will keep returning REGULATOR_ERROR_ON.

Also, in lm51772_irq_renable(), if an additional fault bit becomes set in
LM51772_REG_STATUS_BYTE so that reg is non-zero but no longer equal to
rid->opaque, won't the (rid->opaque && rid->opaque =3D=3D reg) check evalua=
te to
false and return REGULATOR_ERROR_CLEARED while faults are still active?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-paul-lm517=
72-v1-0-25f0ffbffa8d@bootlin.com?part=3D5
