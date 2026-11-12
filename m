Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504584;
	b=5sazdspY4s7b8v0GQVVilPO2AK8Yo3wZ47Vx39KLBjaThZY+/5lfXSnX3cXfoHr4TzrR
	 2sJL9urGRU7vj0UPgcR1UsRXbrVKCSxtXCxi3Q8bHlGOaZNXxay6JMHHwQou6frIEh4Zv
	 V9SwNW8A9kj4wOTpENsTpNKYFKTjIFJCwgYCGMnyWgFIyCV6rsvnrLQaExBKTO2IxRLx6
	 ksk6Y5pkPWjahYCA+rVVNf7/emliC7HGY7dOrmuIevy5YOHpSChxu1svJcCbAKw7WwW7x
	 vRtTsCZvQG1igvoDeKdQw5nU1yp5BpFo/xTNqJ4WEdfv3VrWsojNins/MV1MHKQVvkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504584;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3dewtD4z6MnboKiN4P6/KieXHq4pTJgNkPSFbFWmsWI=;
	b=zouH+yp6knp9JA2dH7g3w++251mmMBrdm4HuhPZAo060SzP48pgFaQ/LMYbsn4dkPoz/
	 Lu8AbPzILzqWZ/hTlRbRHrirltiUo2JQd0BIVCg8Y0HGWlJwYDNzAJbJPSY6hXz4ya8BB
	 IGuN1pskyHSFNFjPVEYRaZMNUwN9T2u5D51jedDJ1pj10QbUP0n7shVFKKd/bUrkIIvPA
	 bobVvIaFSN56IILbYsFSVwyKpsLZWCDlhz5iq4LhNzG9TRvHvgBLEPZ2fnvDKPzrmG/te
	 +18ixn+tHloEYbk8XGk0umfklaqRocuxgjMlJdoW2Zy0s/hbfovSbG77MMCIIPGwD0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZWvrQQSI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A86C606A32A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZWvrQQSI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA58D1F000C4;
	Thu, 12 Nov 2026 17:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794504584;
	bh=3dewtD4z6MnboKiN4P6/KieXHq4pTJgNkPSFbFWmsWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZWvrQQSILCPXWpTaQBXlbmCfveD7vWdm6VcmIq+obrGlCxWK90ymZhP8y3Wc1WKJq
	 OsI6zK1fPdjGbvZtYXZVBB1nfduMc76M9BysGaWxopDnbf6Vdy2VKy/Qe/ugtfXIEg
	 //jGq2naXMSzCDi1qS9O8Nu1nu+X22EXSUygTTaaJu2nHQHBc4rOU2t1oM2uRDd+pU
	 A37mrHNiTuzmt7G16w6535rmTfO2DZLpTQ2sj04VMgCZLWuFiWoSc9WznHXdL5rcpZ
	 h5auX8fKNdjzqt2hPslEVK6vf6fNczE15vzxoqPD5ThtWdqi5pEHO3OtvjKvGK1Gtb
	 5UQfvmpYyZ+qg==
Message-ID: <sashiko-outbox-211593@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] power: supply: add Qualcomm QGauge (qcom_qg) fuel
 gauge driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112170841.2189322-3-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-3-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 17:29:43 +0000
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
- [High] power: supply: qcom_qg: UAF of batt_info in qcom_qg_probe()
  teardown
- [Medium] power: supply: qcom_qg: temperature unit mismatch in
  qg_get_capacity()
- [Medium] power: supply: qcom_qg: broken temperature threshold checks
  in qg_get_health()
- [Medium] power: supply: qcom_qg: unhandled -EINVAL design voltage
  limits in health/props
--

commit 23cbeedd29303e2809a8e496524a3641be8ea9bc
Author: Marc Lainez <marc.lainez@gmail.com>

power: supply: add Qualcomm QGauge (qcom_qg) fuel gauge driver

This commit adds a power_supply driver for the Qualcomm QGauge (QG) fuel
gauge hardware block found in SPMI PMICs such as PMI632 and PM6150.

> diff --git a/drivers/power/supply/qcom_qg.c b/drivers/power/supply/qcom_q=
g.c
> new file mode 100644
> index 0000000000000..071e29d4c2991
> --- /dev/null
> +++ b/drivers/power/supply/qcom_qg.c

[ ... ]

> +static int qg_get_capacity(struct qcom_qg *qg, int *capacity)
> +{
> +	int temp_decidegc;
> +	int cap, ret;
> +
> +	if (!qg->batt_info)
> +		return -ENODATA;
> +
> +	/*
> +	 * Without OCV, it's impossible to calculate state-of-charge.
> +	 * Well, you could try, but you'd get *massive* load swings.
> +	 */
> +	if (!qg->ocv_uv)
> +		return -ENODATA;
> +
> +	ret =3D qg_read_temperature(qg, &temp_decidegc);
> +	if (ret)
> +		temp_decidegc =3D 250; /* default 25.0 degC */
> +
> +	cap =3D power_supply_batinfo_ocv2cap(qg->batt_info, qg->ocv_uv,
> +					   temp_decidegc);

[Severity: Medium]
Does passing temp_decidegc to power_supply_batinfo_ocv2cap() use the wrong
temperature unit?

qg_read_temperature() and the fallback value return tenths of a degree
Celsius (e.g. 250 for 25.0 degC), whereas power_supply_get_battery_info()
populates info->ocv_temp[] from ocv-capacity-celsius in whole degrees
Celsius.  When multiple temperature OCV tables are defined,
power_supply_find_ocv2cap_table() compares decidegrees against degrees and
selects the wrong table.

[ ... ]

> +static int qg_get_health(struct qcom_qg *qg, int *health)
> +{
> +	struct power_supply_battery_info *info =3D qg->batt_info;
> +	int temp_decidegc;
> +	int ret;
> +
> +	if (!qg->batt_present) {
> +		*health =3D POWER_SUPPLY_HEALTH_UNKNOWN;
> +		return 0;
> +	}
> +
> +	if (info) {
> +		ret =3D qg_read_temperature(qg, &temp_decidegc);
> +
> +		/* No thermistor is not a health fault */
> +		if (ret && ret !=3D -ENODEV)
> +			return ret;
> +
> +		if (!ret) {
> +			/* Unset thresholds stay 0; 0 degC is a valid reading. */
> +			if (info->temp_alert_max > 0 &&
> +			    temp_decidegc >=3D info->temp_alert_max) {
> +				*health =3D POWER_SUPPLY_HEALTH_HOT;
> +				return 0;
> +			}
> +			if (info->temp_alert_min > 0 &&
> +			    temp_decidegc <=3D info->temp_alert_min) {
> +				*health =3D POWER_SUPPLY_HEALTH_COLD;
> +				return 0;
> +			}
> +			if (info->temp_max > 0 &&
> +			    temp_decidegc >=3D info->temp_max) {
> +				*health =3D POWER_SUPPLY_HEALTH_WARM;
> +				return 0;
> +			}
> +			if (info->temp_min > 0 &&
> +			    temp_decidegc <=3D info->temp_min) {
> +				*health =3D POWER_SUPPLY_HEALTH_COOL;
> +				return 0;
> +			}
> +		}
> +	}

[Severity: Medium]
Are the temperature threshold checks in qg_get_health() comparing
decidegrees against whole degrees and using the wrong sentinel values?

power_supply_get_battery_info() initializes unset info->temp_alert_min and
info->temp_min to INT_MIN and unset info->temp_alert_max and info->temp_max
to INT_MAX, and populates them from alert-celsius and
operating-range-celsius in whole degrees Celsius.

Because temp_decidegc is in tenths of a degree Celsius and unset max limits
are INT_MAX (which satisfies > 0), any room-temperature reading (e.g. 250
for 25.0 degC) is compared directly against a whole-degree limit (e.g. 45)
and falsely reports POWER_SUPPLY_HEALTH_HOT.  Checking > 0 on
temp_alert_min and temp_min also ignores any cold threshold at or below
0 degC.  In addition, temp_min and temp_max represent the outer operating
range (COLD/HOT) while temp_alert_min and temp_alert_max are the inner
alert thresholds (COOL/WARM), so their health states are swapped here.

> +
> +	*health =3D POWER_SUPPLY_HEALTH_GOOD;
> +
> +	if (info && qg->vbat_uv) {
> +		if (qg->vbat_uv < info->voltage_min_design_uv)
> +			*health =3D POWER_SUPPLY_HEALTH_DEAD;
> +		else if (qg->vbat_uv > info->voltage_max_design_uv)
> +			*health =3D POWER_SUPPLY_HEALTH_OVERVOLTAGE;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
> +		if (!qg->batt_info)
> +			return -ENODATA;
> +		val->intval =3D qg->batt_info->voltage_max_design_uv;
> +		return 0;
> +
> +	case POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN:
> +		if (!qg->batt_info)
> +			return -ENODATA;
> +		val->intval =3D qg->batt_info->voltage_min_design_uv;
> +		return 0;

[Severity: Medium]
What happens in qg_get_health() and qg_get_property() when
voltage-min-design-microvolt or voltage-max-design-microvolt is omitted from
the battery node?

power_supply_get_battery_info() initializes info->voltage_min_design_uv and
info->voltage_max_design_uv to -EINVAL.  In qg_get_health(), comparing
unsigned int qg->vbat_uv against signed int info->voltage_min_design_uv
promotes -EINVAL to UINT_MAX - 21, so qg->vbat_uv <
info->voltage_min_design_uv is always true and reports
POWER_SUPPLY_HEALTH_DEAD.  In qg_get_property(),
POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN and
POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN return 0 with val->intval =3D -22 inst=
ead
of returning -ENODATA when those fields are negative (unlike
POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN just below).

[ ... ]

> +static void qg_batt_info_cleanup(void *data)
> +{
> +	struct qcom_qg *qg =3D data;
> +
> +	power_supply_put_battery_info(qg->psy, qg->batt_info);
> +}
> +
> +static int qcom_qg_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	qg->psy =3D devm_power_supply_register(dev, &qg_psy_desc, &psy_cfg);
> +	if (IS_ERR(qg->psy))
> +		return dev_err_probe(dev, PTR_ERR(qg->psy),
> +				     "Failed to register power supply");
> +
> +	ret =3D power_supply_get_battery_info(qg->psy, &qg->batt_info);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get battery info");
> +
> +	ret =3D devm_add_action_or_reset(dev, qg_batt_info_cleanup, qg);
> +	if (ret)
> +		return ret;

[Severity: High]
Can qg_get_property() dereference qg->batt_info after it has been freed
during driver unbind or probe unwind?

devm_add_action_or_reset(dev, qg_batt_info_cleanup, qg) is registered on
dev after devm_power_supply_register().  Because devres releases resources
in reverse order, on driver unbind or if any of the subsequent
qg_get_optional_irq() calls fails, qg_batt_info_cleanup() frees
qg->batt_info and its ocv_table[] arrays while qg->psy is still registered
and qg->batt_info remains non-NULL.  Any sysfs read or pending uevent work
flushed during power_supply_unregister() then calls qg_get_property() and
reads freed memory.  Calling power_supply_get_battery_info() after
devm_power_supply_register() also leaves qg->batt_info NULL while qg->psy
is first exposed to userspace and thermal/hwmon consumers.

Note that because qg_psy_desc.type is POWER_SUPPLY_TYPE_BATTERY,
__power_supply_register() already populates psy->battery_info before
device_add() and frees it when psy->dev is unregistered, or if
qg->batt_info is kept, its cleanup action only runs safely if unregistered
after qg->psy (or if qg->batt_info is allocated on &qg->psy->dev without a
separate dev action that runs before power_supply_unregister()).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112170841.2189=
322-1-val@packett.cool?part=3D2
