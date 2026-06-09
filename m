Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C186315D33
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997433; cv=none; b=fUDHkclivNmGej9xmBd6xchxEBmJgiguW7MWr+yE3IgcWBU3ofbXb3Nz4IkWw/aOaR3ypj5WWQgIiU2knGMRMznB9gtqqNkKFH3arMozxejQX7WsdUEYG7w2tWNmSHDPJIdUGzWajvv+p1+T25e/++iyvjEcY5hdlbRyl9GYpMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997433; c=relaxed/simple;
	bh=KgfJOsahO6kus9AFTkN/5WhoCgXpScxwMBRx8Ld1ReU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GqBd0KlograQFyn6l2tm9ZBelpcy0axEPKPlt4qEsO2Lp/983VYVfHPZ+v3ixINpY7IACP/9BDh10rlY3bTTtBxhdDOrLmwr+ISNsRh8EP+U+eOet82tnKF5LpxsQBRl4ItD8PV9wMq21TXCm3fztL6rmpCyEovovgGYv52XV5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1LAeiFr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1LAeiFr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30BE1F00893;
	Tue,  9 Jun 2026 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780997432;
	bh=+vxGgUbFY8v7cPk8c5oxxsAdCGBJtNZJjc0dJ5VDuFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l1LAeiFrWVpELi6aYmvSG5HYISjlV6dZhkdDIS0Bs25lDz+uEll+O/1ADVECMdZxi
	 3EO1wjd2jB/GWJZmfeFxLSLMnDljWM5zm8fF/+UYQFR4tOQ/NKWTx+Ru9fn/k+1bkj
	 vOrGo8R1wyIw9mThBGJhZUI+LgbEnlZoCpXFYbt68tGT5CQakqbMuI54R4/sB4/g+L
	 riceAfGiiuIxlTWnZpC/eiTMyMgBz/Oitcxv8bkR7Bow5nkHaSZjqnrIci9+2+oJa4
	 E4xCysbkzC/O8dOfi+azszxWa09YSFcY00V9ir1KUtGGrNt4e32JVk7TnrWGyb03yV
	 IpjyYzdAeqmJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: Add thermal mitigation
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: DhruvinRajpura <dhruvin.rajpura@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com>
References: <20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 09:30:31 +0000
Message-Id: <20260609093031.B30BE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Software state properties are updated outside of `battmgr->lock`, =
creating data races and state desynchronization.
- [High] Thermal mitigation state is lost on firmware restart (PDR) if the =
charging limit was throttled to 0 uA.
- [High] Calling `devm_thermal_of_cooling_device_register()` from an asynch=
ronous workqueue causes a resource leak and use-after-free race with device=
 unbind.
- [Medium] The SM8550 variant lacks the `CHARGE_CONTROL_LIMIT` and `CHARGE_=
CONTROL_LIMIT_MAX` sysfs properties.
- [Medium] Reading the charge control limits triggers synchronous, blocking=
 firmware requests whose results are ignored.
- [Medium] Userspace sysfs race allows throttling to 0 uA due to uninitiali=
zed `thermal_levels[0]`.

Pre-existing issues:
- [High] `qcom_battmgr_request` is called without acquiring `battmgr->lock`=
 in `qcom_battmgr_enable_worker`.
--

commit c50b550e81a56aef117f049101952557cf7ba5cd
Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

power: supply: qcom_battmgr: Add thermal mitigation support

This patch explicitly registers a thermal cooling device for the battery
manager to throttle charging current during thermal stress. It maps discrete
current levels from the qcom,thermal-mitigation DT property to cooling
states. It also exposes CHARGE_CONTROL_LIMIT properties to sysfs to allow
userspace observation and control.

> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/q=
com_battmgr.c
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -449,6 +460,8 @@ static const u8 sm8350_bat_prop_map[] =3D {
>  	[POWER_SUPPLY_PROP_POWER_NOW] =3D BATT_POWER_NOW,
>  	[POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD] =3D BATT_CHG_CTRL_ST=
ART_THR,
>  	[POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] =3D BATT_CHG_CTRL_END_=
THR,
> +	[POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT] =3D BATT_CHG_CTRL_LIM,
> +	[POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX] =3D BATT_CHG_CTRL_LIM_MAX,
>  };

[Severity: Medium]
Does mapping BATT_CHG_CTRL_LIM trigger a blocking BATTMGR_BAT_PROPERTY_GET
request over GLINK when userspace reads POWER_SUPPLY_PROP_CHARGE_CONTROL_LI=
MIT?

Looking at qcom_battmgr_bat_get_property(), the result of this firmware upd=
ate
is discarded, and the locally cached curr_thermal_level is returned instead.
Could this be avoided to prevent a useless IPC call?

[ ... ]

> @@ -770,6 +789,55 @@ static int qcom_battmgr_bat_is_writeable(struct powe=
r_supply *psy,
>  	return 0;
>  }
> =20
> +static int __battery_psy_set_charge_current(struct qcom_battmgr *battmgr,
> +					    u32 fcc_ua)
> +{
> +	int ret;
> +
> +	mutex_lock(&battmgr->lock);
> +	ret =3D qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_SET,
> +					    BATT_CHG_CTRL_LIM, fcc_ua);
> +	mutex_unlock(&battmgr->lock);
> +	if (ret < 0) {
> +		dev_err(battmgr->dev, "Failed to set FCC %u, ret=3D%d\n", fcc_ua, ret);
> +	} else {
> +		dev_dbg(battmgr->dev, "Set FCC to %u uA\n", fcc_ua);
> +		battmgr->last_fcc_ua =3D fcc_ua;

[Severity: High]
Can concurrent updates desynchronize the software tracking variables from t=
he
hardware state?

The GLINK request is protected by battmgr->lock, but last_fcc_ua is assigned
here after the lock is released.

> +	}
> +
> +	return ret;
> +}
> +
> +static int battery_psy_set_charge_current(struct qcom_battmgr *battmgr,
> +					  int val)
> +{
> +	u32 fcc_ua, prev_fcc_ua;
> +	int ret;
> +
> +	if (!battmgr->num_thermal_levels)
> +		return 0;
> +
> +	if (battmgr->num_thermal_levels < 0) {
> +		dev_err(battmgr->dev, "Incorrect num_thermal_levels\n");
> +		return -EINVAL;
> +	}
> +
> +	if (val < 0 || val > battmgr->num_thermal_levels)
> +		return -EINVAL;
> +
> +	fcc_ua =3D battmgr->thermal_levels[val];

[Severity: Medium]
If sysfs writes to CHARGE_CONTROL_LIMIT occur after probe() but before
qcom_battmgr_enable_worker() has initialized thermal_levels[0], could this =
read
a zero-initialized value and improperly throttle charging to 0 uA?

> +	prev_fcc_ua =3D battmgr->thermal_fcc_ua;
> +	battmgr->thermal_fcc_ua =3D fcc_ua;
> +
> +	ret =3D __battery_psy_set_charge_current(battmgr, fcc_ua);
> +	if (!ret)
> +		battmgr->curr_thermal_level =3D val;
> +	else
> +		battmgr->thermal_fcc_ua =3D prev_fcc_ua;

[Severity: High]
Additionally, thermal_fcc_ua and curr_thermal_level are updated here comple=
tely
outside of battmgr->lock. If thermal framework and sysfs operations concurr=
ently
set the charge current, could the software state interleave with hardware
updates?

> +
> +	return ret;
> +}

[ ... ]

> @@ -892,6 +977,8 @@ static const struct power_supply_desc sm8350_bat_psy_=
desc =3D {
>  	.properties =3D sm8350_bat_props,
>  	.num_properties =3D ARRAY_SIZE(sm8350_bat_props),
>  	.get_property =3D qcom_battmgr_bat_get_property,
> +	.set_property =3D qcom_battmgr_bat_set_property,
> +	.property_is_writeable =3D qcom_battmgr_prop_is_writeable,
>  };
> =20
>  static const enum power_supply_property sm8550_bat_props[] =3D {

[Severity: Medium]
The commit message states that CHARGE_CONTROL_LIMIT and
CHARGE_CONTROL_LIMIT_MAX are exposed to allow userspace control. Should
these properties also be added to sm8550_bat_props to expose them for the
SM8550 variant?

[ ... ]

> +static int qcom_battmgr_register_thermal_cooling_device(struct qcom_batt=
mgr *battmgr)
> +{
> +	struct thermal_cooling_device *tcd;
> +	u32 prev;
> +	int ret, i;

[ ... ]

> +	battmgr->thermal_levels[0] =3D battmgr->status.max_charge_ctl_limit;
> +	battmgr->thermal_fcc_ua =3D battmgr->status.max_charge_ctl_limit;
> +
> +	/* Register Thermal Cooling Device */
> +	tcd =3D devm_thermal_of_cooling_device_register(battmgr->dev,
> +						      battmgr->dev->of_node,
> +						      (char *)battmgr->bat_psy->desc->name,
> +						      battmgr, &battery_tcd_ops);

[Severity: High]
Is it safe to allocate devm_ resources from an asynchronous workqueue?

If the driver unbinds, devres_release_all() will free the battmgr structure.
If qcom_battmgr_enable_worker() runs concurrently or just after, could it
register a cooling device to a dead device's devres list, leading to a
resource leak and eventual use-after-free when the thermal core polls it?

[ ... ]

> @@ -1596,6 +1834,18 @@ static void qcom_battmgr_enable_worker(struct work=
_struct *work)
>  	struct qcom_battmgr *battmgr =3D container_of(work, struct qcom_battmgr=
, enable_work);
>  	struct qcom_battmgr_enable_request req =3D {
>  		.hdr.owner =3D cpu_to_le32(PMIC_GLINK_OWNER_BATTMGR),
>  		.hdr.type =3D cpu_to_le32(PMIC_GLINK_NOTIFY),
>  		.hdr.opcode =3D cpu_to_le32(BATTMGR_REQUEST_NOTIFICATION),
>  	};
>  	int ret;
> =20
>  	ret =3D qcom_battmgr_request(battmgr, &req, sizeof(req));

[Severity: High]
This isn't a bug introduced by this patch, but is it intentional that
qcom_battmgr_request() is called here without holding battmgr->lock?

If sysfs operations take the lock simultaneously, could this concurrent
execution mutate the GLINK communication state and corrupt
reinit_completion(&battmgr->ack)?

>  	if (ret)
>  		dev_err(battmgr->dev, "failed to request power notifications\n");
> +
> +	if (!battmgr->thermal_dev_registered) {
> +		ret =3D qcom_battmgr_register_thermal_cooling_device(battmgr);
> +		if (ret < 0)
> +			dev_err(battmgr->dev, "failed to register thermal cooling device ret:=
%d\n",
> +				ret);
> +	} else if (battmgr->last_fcc_ua) {

[Severity: High]
Does checking if (battmgr->last_fcc_ua) prevent restoration of the mitigati=
on
limit after a firmware restart?

If the device was legitimately throttled to 0 microamps due to extreme heat,
this check evaluates to false and skips the restoration, which could cause
the firmware to resume charging at the maximum limit.

> +		ret =3D __battery_psy_set_charge_current(battmgr, battmgr->last_fcc_ua=
);
> +		if (ret < 0)
> +			dev_err(battmgr->dev, "Failed to set FCC (%u uA), ret:%d\n",
> +				battmgr->last_fcc_ua, ret);
> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-cooling_de=
vice_reg-v1-0-e15bddcb0086@qti.qualcomm.com?part=3D2
