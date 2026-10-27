Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095310;
	b=5YPNCgMEQb7w1ciBHA7/eUh8oMVdngpfI/3UOvlWp4JvTA7KZXzlO731iWx8X/hAj4Lc
	 ksL/wQR97sUJsFXKTRuCDhYajuSOub36XU9mQ5XY3yqGGFHswwYVx8qlqZhIvVBMeAlnS
	 wh3BGDg/mMFKWMNUCZwBZqKH9H6C5lQf6KZ1dLGuOr672pM9KWu2wUDlPKWwUulqm7p8H
	 /tl228nJwUikEUK0dzDnDE2dh/5EwSc0S/sJM5CSo7+reqTK1/Hdn1UBro1qvSVRqmr2Z
	 WHW3u6Zrzrl+4OprdXGeTtdkOqWUp+oGvuZeePiHd8rZNp3oWBXwsrM68ty/tI4gNqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095310;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZNJYMp0V92vRLPnj8bIl/UAQE2eIcAcUdHYUSyvqDCI=;
	b=b+EoApXAD/M4pjJZ5DsVzYDta/XFPRTOieuAfwsUoJXXrcgdow79NJzVSgKCKWqTYkXj
	 2DRzorxyO/vH8NfbSs+uZQQqX/lRvFiSH12QzDvClnDR6i8++KtU6QPFx1mZ/3LxgEVoL
	 KQOJPiIX3kxRuOIkX21HAfyB7rAquconEsBJEinmzy+93YZX8XIfdTym40Q65WXM1ebUM
	 jqW/u994qI0wFGwdLZHLWicrKz1Ypy05PNB3VSOj+ntbxE1LNHYsbue/tONGN1cRF8SkU
	 z8i6NImy22IVB0G9XBEjFg5oDsz/wbeDiBfty9mBGSAQOMub6mxcjNfgCb/vGzfwduA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LReFstN4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C197606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LReFstN4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FA31F01825;
	Tue, 27 Oct 2026 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793095310;
	bh=ZNJYMp0V92vRLPnj8bIl/UAQE2eIcAcUdHYUSyvqDCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LReFstN4tBfwVUiduLXZ4rzCRhOqONUwu0T5fenT9fWHDE01U28X7LzPoq0/6l3qF
	 ojefq3q72Rm4WmyCs3c0q0sp5buTn7/aTgJI/+hPfZl4ucb5eg8QEJCs1GjwxbyfjC
	 o6wIQecQMpgqJJAAJn7/IQdQi/84EHGHQORf5OsrAUSIt5pIXQ+qi6+M7Ksa2S8HIj
	 rbjuKRiQyiJfg9G5laXKZg+uhEt7oYtQjfdE1nNGvTf4U5x8o9hC7KsFKgoOnx622Q
	 K3Kx/m432IaV5lVpdKqYw1km49A3yCtSVfGl1P4fkhRaTUNpFbLbve26iWQH8oobHv
	 9Orq2a1S5YfDA==
Message-ID: <sashiko-outbox-186345@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] regulator: Add TI LM51772 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-paul-lm51772-v2-4-b2a767e34722@bootlin.com>
References: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
 <20261027-paul-lm51772-v2-4-b2a767e34722@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 10:01:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] regulator: lm51772: use logical AND in lm51772_get_conv_en()
- [High] regulator: lm51772: fix current limit bounds and max_uA check
- [High] regulator: lm51772: fix STAT_OFF and fault checks in IRQ callbacks
- [Medium] regulator: lm51772: fix cached errors and IRQ order in lm51772_s=
etup_irq()
- [Medium] regulator: lm51772: allow OVP limits below 4V in lm51772_set_ov()
- [Medium] regulator: lm51772: OVP updated after voltage ramp-up trips fals=
e OVP fault
- [Medium] regulator: lm51772: state mismatch between priv->iset_pin and ha=
rdware default
--

commit 85d9f9bf5e7e89e913ab51cc149fc605a17772db
Author: Paul Louvel <paul.louvel@bootlin.com>

regulator: Add TI LM51772 support

This commit adds a regulator driver for the TI LM51772 I2C buck-boost
voltage regulator and its auxiliary 5 V LDO output.

> diff --git a/drivers/regulator/lm51772-regulator.c b/drivers/regulator/lm=
51772-regulator.c
> new file mode 100644
> index 0000000000000..66f4541b50994
> --- /dev/null
> +++ b/drivers/regulator/lm51772-regulator.c

[ ... ]

> +static int lm51772_set_conv_en(struct regmap *regmap, bool enable)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(regmap, LM51772_REG_USB_PD_CONTROL_0, LM5177=
2_CONV_EN2,
> +				 FIELD_PREP(LM51772_CONV_EN2, enable));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D0, LM51772_=
CONV_EN,
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
Should lm51772_get_conv_en() use && instead of || here?

In lm51772_reg_defaults (and at hardware reset), LM51772_REG_USB_PD_CONTROL=
_0
is 0x01 (so LM51772_CONV_EN2 is 1) while LM51772_REG_MFR_SPECIFIC_D0 is 0x32
(so LM51772_CONV_EN is 0), and lm51772_set_conv_en() must set both bits to
enable the converter.

When a consumer calls regulator_enable() on vout for the first time:

  _regulator_enable()
    _regulator_is_enabled()
      lm51772_regulator_is_enabled()
        lm51772_get_conv_en()

Because lm51772_get_conv_en() uses ||, it returns 1 while LM51772_CONV_EN is
still 0, causing _regulator_enable() to treat vout as already enabled and
skip calling _regulator_do_enable().

[ ... ]

> +static int lm51772_set_ov(struct regulator_dev *rdev, int lim_uV)
> +{
> +	static const struct linear_range ovp_ranges[] =3D {
> +		LINEAR_RANGE(4000000, 0, 0x18, 500000),
> +		LINEAR_RANGE(16000000, 0x18, 0x3f, 1000000),
> +	};
> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
> +	struct device *dev =3D rdev_get_dev(rdev);
> +	unsigned int sel;
> +	bool found;
> +	int ret;
> +
> +	ret =3D linear_range_get_selector_high_array(ovp_ranges, ARRAY_SIZE(ovp=
_ranges), lim_uV, &sel,
> +						   &found);
> +	if (ret || !found)
> +		return -EINVAL;

[Severity: Medium]
Does checking !found in lm51772_set_ov() reject valid over-voltage protecti=
on
thresholds when the target voltage plus lim_uV is below 4.0 V?

Because vout supports output voltages down to 1.0 V while ovp_ranges starts
at 4.0 V (4000000 uV), calling linear_range_get_selector_high_array() with
lim_uV < 4000000 sets sel =3D 0 (4.0 V, the lowest available upper-bound OVP
threshold), sets found =3D false, and returns 0.

Checking !found causes lm51772_set_ov() to return -EINVAL instead of
selecting 4.0 V, and since fixed_ovp is set on vout, _regulator_do_set_volt=
age()
will also fail with -EINVAL whenever vout + lim_uV is under 4.0 V.

> +
> +	dev_dbg(dev, "OVP set to selector 0x%02x\n", sel);
> +
> +	return regmap_write(regmap, LM51772_REG_MFR_SPECIFIC_D5, sel);
> +}
> +
> +static int lm51772_regulator_set_over_voltage_protection(struct regulato=
r_dev *rdev, int lim_uV,
> +							 int severity, bool enable)
> +{
> +	int ret;
> +
> +	if (!enable)
> +		return -EOPNOTSUPP;
> +
> +	if (severity !=3D REGULATOR_SEVERITY_PROT)
> +		return -EOPNOTSUPP;
> +
> +	/* Use default OVP threshold when no limit is requested. */
> +	if (!lim_uV)
> +		return regmap_write(rdev_get_regmap(rdev), LM51772_REG_MFR_SPECIFIC_D5,
> +				    LM51772_OVP_DEFAULT);
> +
> +	ret =3D regulator_get_voltage_rdev(rdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return lm51772_set_ov(rdev, ret + lim_uV);
> +}

[Severity: Medium]
When regulator-ov-protection-microvolt is configured and vout is raised to a
new voltage above the previous absolute OVP threshold, can this trip a false
hardware OVP fault during the voltage ramp?

With fixed_ovp enabled on vout in lm51772_regulator_descs,
_regulator_do_set_voltage() first writes the new voltage selector via
ops->set_voltage_sel() and sleeps for fsleep(delay) while the output slews,
and only afterwards invokes ops->set_over_voltage_protection():

  _regulator_do_set_voltage()
    ops->set_voltage_sel()
    fsleep(delay)
    handle_notify_limits(..., ops->set_over_voltage_protection, ...)
      lm51772_regulator_set_over_voltage_protection()

When stepping vout up (for example from 5 V to 20 V with a 1 V OVP margin,
where LM51772_REG_MFR_SPECIFIC_D5 is initially set to 6 V), the converter
ramps past 6 V during fsleep(delay) before LM51772_REG_MFR_SPECIFIC_D5 is
updated to 21 V. Should the OVP threshold be raised before increasing the
output voltage?

[ ... ]

> +static int lm51772_regulator_set_current_limit(struct regulator_dev *rde=
v, int min_uA, int max_uA)
> +{
> +	struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
> +	unsigned int current_uA;
> +	unsigned int sel;
> +
> +	if (priv->iset_pin)
> +		return -EOPNOTSUPP;
> +
> +	if (min_uA > LM51772_ILIM_MAX_UA || max_uA < LM51772_ILIM_MIN_UA)
> +		return -EINVAL;
> +
> +	if (max_uA > LM51772_ILIM_MAX_UA)
> +		max_uA =3D LM51772_ILIM_MAX_UA;
> +
> +	sel =3D LM51772_UA_TO_ILIM_SEL(priv->sense_res_micro_ohms, max_uA);
> +	sel =3D clamp_val(sel, LM51772_ILIM_THR_MIN, LM51772_ILIM_THR_MAX);
> +
> +	/* Check if the selected value is still within the allowed range after =
computation. */\n> +	current_uA =3D LM51772_ILIM_SEL_TO_UA(priv->sense_res_=
micro_ohms, sel);
> +	if (current_uA < min_uA)
> +		return -EINVAL;

[Severity: High]
Can clamping sel up to LM51772_ILIM_THR_MIN cause
lm51772_regulator_set_current_limit() to program a current limit higher than
max_uA when a smaller sense resistor is used?

For example, if shunt-resistor-micro-ohms is 5000 (where LM51772_ILIM_THR_M=
IN
0x0A corresponds to 1000000 uA) and the caller requests min_uA =3D 500000 a=
nd
max_uA =3D 600000, LM51772_UA_TO_ILIM_SEL() computes sel =3D 6, which clamp=
_val()
raises to 0x0A. Recomputing current_uA gives 1000000 uA, and because only
current_uA < min_uA is checked (without checking current_uA > max_uA), the
driver programs 1.0 A into LM51772_REG_ILIM_THRESHOLD, exceeding max_uA.

Also, LM51772_ILIM_MIN_UA and LM51772_ILIM_MAX_UA hardcode the current range
for a 10 mOhm resistor rather than scaling with priv->sense_res_micro_ohms,
which rejects valid selectors when a different sense resistor is configured.

[ ... ]

> +static int lm51772_irq_map_event(int irq, struct regulator_irq_data *rid=
, unsigned long *dev_mask)
> +{
> +	struct regmap *regmap =3D rid->data;
> +	unsigned int status, reg, errors;
> +	bool dev_off;
> +	size_t bit;
> +	int ret;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &status);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;
> +
> +	errors =3D lm51772_status2err(status);
> +	rid->opaque =3D status;
> +
> +	dev_off =3D (status & LM51772_STAT_OFF) !=3D 0;
> +
> +	ret =3D regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;
> +
> +	for (size_t i =3D 0; i < rid->num_states; i++) {
> +		rid->states[i].errors =3D errors & rid->states[i].possible_errs;
> +		rid->states[i].notifs =3D 0;
> +
> +		for_each_set_bit(bit, &rid->states[i].errors, BITS_PER_TYPE(rid->state=
s[i].errors))
> +			rid->states[i].notifs |=3D regulator_err2notif(BIT(bit));
> +
> +		if (dev_off)
> +			rid->states[i].notifs |=3D REGULATOR_EVENT_DISABLE;
> +
> +		if (rid->states[i].errors || dev_off)
> +			*dev_mask |=3D BIT(i);
> +	}
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

[Severity: High]
Are LM51772_STAT_OFF and rid->opaque handled as intended in
lm51772_irq_map_event() and lm51772_irq_renable()?

In lm51772_irq_map_event(), dev_off reflects LM51772_STAT_OFF for the main
buck-boost converter (vout), including when vout is simply disabled in
software. However, the loop applies dev_off to all regulators in
rid->num_states, which sends REGULATOR_EVENT_DISABLE to the auxiliary vcc1
LDO (and to vout on warning interrupts while vout is software-disabled).

In lm51772_irq_renable(), comparing the raw status byte with
rid->opaque =3D=3D reg has two issues:

1. If an interrupt occurs when status is only LM51772_STAT_OFF (for example,
an INPUT/VIN_UV event while vout is off), reading LM51772_REG_CLEAR_FAULTS
does not clear LM51772_STAT_OFF, so rid->opaque =3D=3D reg stays true and
lm51772_irq_renable() returns REGULATOR_ERROR_ON in an infinite polling loo=
p.

2. If multiple status bits were set and one bit changes while other fault
bits remain active in reg, rid->opaque =3D=3D reg evaluates to false, skipp=
ing
LM51772_REG_CLEAR_FAULTS and prematurely returning REGULATOR_ERROR_CLEARED.

> +
> +static int lm51772_vout_of_parse(struct device_node *np, const struct re=
gulator_desc *desc,
> +				 struct regulator_config *cfg)
> +{
> +	u32 sense_res_micro_ohms, active_discharge_strength, pcm_window_low;
> +	struct lm51772_priv *priv =3D cfg->driver_data;
> +	int ret;

[ ... ]

> +	priv->iset_pin =3D of_property_read_bool(np, "ti,iset-pin");

[Severity: Medium]
What happens to priv->iset_pin if the optional regulators/vout DT node is
absent?

In lm51772_reg_defaults, LM51772_REG_MFR_SPECIFIC_D9 defaults to 0x2C, which
has LM51772_SEL_ISET_PIN (BIT(5)) set to 1 (selecting the external ISET pin=
).
However, priv->iset_pin is zero-initialized to false in lm51772_probe() and
LM51772_SEL_ISET_PIN is only updated in lm51772_vout_of_parse().

If the vout child node is omitted (or on non-DT instantiation via
lm51772_id), regulator_of_get_init_data() does not invoke
lm51772_vout_of_parse(), leaving LM51772_SEL_ISET_PIN set to 1 in hardware
while priv->iset_pin is false in software. As a result,
lm51772_regulator_get_current_limit() and
lm51772_regulator_set_current_limit() will read and write the inactive
LM51772_REG_ILIM_THRESHOLD register instead of returning -EOPNOTSUPP (or
clearing LM51772_SEL_ISET_PIN).

[ ... ]

> +static int lm51772_setup_irq(struct device *dev, struct regmap *regmap, =
int irq,
> +			     struct regulator_dev *rdev[LM51772_N_REGS], bool nint)
> +{
> +	int common_errs =3D REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TE=
MP_WARN |
> +			  REGULATOR_ERROR_FAIL;
> +	int per_rdev_errs[] =3D {
> +		REGULATOR_ERROR_OVER_CURRENT | REGULATOR_ERROR_OVER_VOLTAGE_WARN,
> +		0,
> +	};
> +	struct regulator_irq_desc irq_desc =3D {
> +		.name =3D "lm51772-irq",
> +		.data =3D regmap,
> +		.map_event =3D lm51772_irq_map_event,
> +	};
> +	void *retp;
> +
> +	if (!nint) {
> +		irq_desc.renable =3D lm51772_irq_renable;
> +		irq_desc.irq_off_ms =3D 1000;
> +		irq_desc.reread_ms =3D 200;
> +	}
> +
> +	retp =3D devm_regulator_irq_helper(dev, &irq_desc, irq, 0, common_errs,=
 per_rdev_errs, rdev,
> +					 LM51772_N_REGS);
> +	if (IS_ERR(retp))
> +		return PTR_ERR(retp);
> +
> +	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D1, LM51772_=
EN_NINT,
> +				  FIELD_PREP(LM51772_EN_NINT, nint));
> +}

[Severity: Medium]
When nint is true, how do cached error flags in rdev->cached_err get cleare=
d?

Because common_errs and per_rdev_errs are passed to
devm_regulator_irq_helper(), init_rdev_errors() sets rdev->use_cached_err =
=3D
true, and regulator_notifier_isr() latches any reported errors via
rdev_flag_err(). However, rdev_clear_err() is only called from
regulator_notifier_isr_work(), which is only scheduled when
irq_desc.irq_off_ms is non-zero. With irq_off_ms left at 0 when nint is tru=
e,
_regulator_get_error_flags() will permanently OR the latched rdev->cached_e=
rr
flags into every subsequent regulator_get_error_flags() call even after the
fault clears.

Also, should LM51772_EN_NINT be configured via regmap_update_bits() before
calling devm_regulator_irq_helper() so the IRQ handler is not active while
the pin is still in its default nFLT mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-paul-lm517=
72-v2-0-b2a767e34722@bootlin.com?part=3D4
