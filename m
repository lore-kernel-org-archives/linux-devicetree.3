Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4AC26E165
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779117013; cv=none; b=j1uS/ePCB1FE2oyvQliuq32haYktn51j3h6I+X1AA6dvMH8yVByieviyfhgEsEIQKWZQSeLF58b1uz8MgJV2ONxWJNdAcrKMXRP6qWLKxzvgcwRRVU/i/3cG/b19rfNdkWp5FjXvdmMxr01qQmGbVpV7MTF5CSG5tXk+F3sEu3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779117013; c=relaxed/simple;
	bh=SzICCALtIOt1D5bf9vR4Qkg9kwPIG30Af0xOLr5Mrkc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rpRdHgxITj71CytmAaWZN1qSsStjXQpvKlZLqr1mEQn0iv1wzgo8oS43kfvUeqG7Vc+N+g6+f7Qb2Og+RsQtwklegu9w9iusmZXw3lM9OG3CSJUKebTddsgAjJvRtOOBAn4/hffR1ngc2alI2rdXjnmrHiCoAUiDPo+NlTjArqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1t1m1Q0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1t1m1Q0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8E6C2BCB8;
	Mon, 18 May 2026 15:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779117013;
	bh=SzICCALtIOt1D5bf9vR4Qkg9kwPIG30Af0xOLr5Mrkc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=U1t1m1Q0JwpsOupvfpHN3SJz3gX0lwrSNtTk+DPC2vyofJNK3SRv2cgv4NAcUHPsy
	 tP5qCitj/88KcLzva36Hm4GY6ypDCrBK2zcxF9gfYdVpTGRzn1SpJ61tOO1o1nZuSN
	 OIRWImNgzJQ06lJDEWdCZ70TrSWZblqoPrvYPUzc5lp0LLDPwkUP2blD5iuvSqGfrk
	 CFWB0i5hR+nPfFognWOw0RrpKTEKVc+Shkh6g27MZxpTkasnAJLmKMyOuq3n8bF3Mn
	 dIszb9JlrixmJOTaXoBPQXiXp3CLFIBjwFIVM+Q5g9gTUT2hxnmJMpFEHOryzB7g4L
	 rnB4El1iRgWoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: Add support
 batteryless boards as MAINS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rakesh Kota" <rakesh.kota@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-add_dc_in_support-v1-2-31fbaa329879@oss.qualcomm.com>
References: <20260518-add_dc_in_support-v1-2-31fbaa329879@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 15:10:12 +0000
Message-Id: <20260518151013.0F8E6C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The new MAINS power supply exposes BATTERY properties (STATUS, PRE=
SENT) instead of ONLINE, breaking userspace expectations.
- [Medium] The `qcom,batteryless` property is silently ignored on `SC8280XP=
` and `X1E80100` variants.
--

commit fd3fd36bafd15a4f0b8a90d2f6b2f13ff0fc3a3d
Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

power: supply: qcom_battmgr: Add support batteryless boards as MAINS

This commit adds support for the qcom,batteryless device tree property to
register the power supply as a MAINS type instead of a BATTERY. This is
intended to prevent userspace from triggering battery power-saving sequences
on boards powered directly by adapters.

> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/q=
com_battmgr.c
> index 490137a23d00e..35d266375d8c4 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
[ ... ]
> @@ -930,6 +931,47 @@ static const struct power_supply_desc sm8550_bat_psy=
_desc =3D {
>  	.property_is_writeable =3D qcom_battmgr_bat_is_writeable,
>  };
> =20
> +static int qcom_battmgr_dcin_get_property(struct power_supply *psy,
> +					  enum power_supply_property psp,
> +					  union power_supply_propval *val)
> +{
> +	struct qcom_battmgr *battmgr =3D power_supply_get_drvdata(psy);
> +	int ret;
> +
> +	if (!battmgr->service_up)
> +		return -EAGAIN;
> +
> +	ret =3D qcom_battmgr_bat_sm8350_update(battmgr, psp);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_STATUS:
> +		val->intval =3D battmgr->status.status;
> +		break;
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		val->intval =3D battmgr->info.present;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const enum power_supply_property dcin_props[] =3D {
> +	POWER_SUPPLY_PROP_STATUS,
> +	POWER_SUPPLY_PROP_PRESENT,
> +};
> +
> +static const struct power_supply_desc dcin_psy_desc =3D {
> +	.name =3D "qcom-battmgr-dcin",
> +	.type =3D POWER_SUPPLY_TYPE_MAINS,
> +	.properties =3D dcin_props,
> +	.num_properties =3D ARRAY_SIZE(dcin_props),
> +	.get_property =3D qcom_battmgr_dcin_get_property,
> +};

Since dcin_psy_desc is registered as POWER_SUPPLY_TYPE_MAINS, should it
expose POWER_SUPPLY_PROP_ONLINE instead of POWER_SUPPLY_PROP_STATUS and
POWER_SUPPLY_PROP_PRESENT?

Userspace power managers typically expect MAINS power supplies to report th=
eir
active state via the ONLINE property.

If the firmware returns PRESENT=3D0 on a batteryless board, won't userspace
fail to recognize the AC adapter as an active power source and still trigger
power-saving or shutdown sequences?

[ ... ]
> @@ -1690,7 +1733,9 @@ static int qcom_battmgr_probe(struct auxiliary_devi=
ce *adev,
>  			return dev_err_probe(dev, PTR_ERR(battmgr->wls_psy),
>  					     "failed to register wireless charing power supply\n");
>  	} else {
> -		if (battmgr->variant =3D=3D QCOM_BATTMGR_SM8550)
> +		if (battmgr->batteryless)
> +			psy_desc =3D &dcin_psy_desc;
> +		else if (battmgr->variant =3D=3D QCOM_BATTMGR_SM8550)
>  			psy_desc =3D &sm8550_bat_psy_desc;
>  		else
>  			psy_desc =3D &sm8350_bat_psy_desc;

Does this bypass the qcom,batteryless property on SC8280XP and X1E80100
variants?

Looking at qcom_battmgr_probe(), the check for battmgr->batteryless is only
placed inside the else block which executes for SM8350 and SM8550:

drivers/power/supply/qcom_battmgr.c:qcom_battmgr_probe() {
...
	if (battmgr->variant =3D=3D QCOM_BATTMGR_SC8280XP ||
	    battmgr->variant =3D=3D QCOM_BATTMGR_X1E80100) {
		if (battmgr->variant =3D=3D QCOM_BATTMGR_X1E80100)
			psy_desc =3D &x1e80100_bat_psy_desc;
		else
			psy_desc =3D &sc8280xp_bat_psy_desc;

		battmgr->bat_psy =3D devm_power_supply_register(dev, psy_desc, &psy_cfg);
...
	} else {
		if (battmgr->batteryless)
			psy_desc =3D &dcin_psy_desc;
...
}

If a board uses the SC8280XP or X1E80100 variant, won't it bypass this check
and unconditionally register the standard battery power supply?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-add_dc_in_=
support-v1-0-31fbaa329879@oss.qualcomm.com?part=3D2
