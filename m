Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E6B3F86FA
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326407; cv=none; b=GRk82CBuWTkbEkvzigujzfd8kIdZ63sPP0Iqgss8f9GsSzIXj3okd24mg4aVOjgCX7mDGIHBvUK8hIeH0ngoCUoERFSKWR+KPTLFNvdpV0yRW98UX6H2whT5bp1a0pNMBSQenqsZNPbW2uxR3fAAXycuYwy4surD+wZ7hc6edes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326407; c=relaxed/simple;
	bh=rD5h8d/iAF+ur2WswRzjAf+UkBoJdLYEHTmtem6U2Uo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W9Gp/ZxiI+L4Txe5RRV+QbANcT/+X9K6dO9w7HsAKOJ1R5bU1lBvkM6XA8l3+0HnZQBlpcf3pnd3r5ITcorMk2E8aeB/AYQ4VCB0O6LK8ogE9F0fyGpSXHQyljhwx99RueLBYN9K7XysSKx81PGHhxtWItXRkBlZNrbv+MDYdCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZ7npwXh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZ7npwXh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3308D1F000E9;
	Mon,  6 Jul 2026 08:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783326399;
	bh=nGsDWrhXHz+UtY283nxi7pzKUPN00CMDIM1ZHP9n0i8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OZ7npwXhuYt9f/rqVFZPqT/P0KyeL5bTGqnfvZJowBLQLVH+fSu4BZrjsL3pwEjhw
	 qxKXtEvzWxOIvKI3a5LYkCFko0ioSG+LuG/cfoY471HV/GB+1KUd4zewaxg33RDGam
	 vDAcBDlZTNuFmFoNIPiVpTZ8s8IrQb0dZSS7xrDugEX6GqCuNtCOOrvAQCYrrohI8t
	 +UJuU0M9vUwy6caduSDbpDG45kHPPaWJ1pxTpWQj5Hwj4mM850L3R/+KQ2H0MeYU/V
	 iPVeqztU3cm8kcHSlt0JYbXxbES9swk5nVtdTo9kCfoxJFkm1B66TdSvIQ0ei68Zh3
	 JMDhm/EUvLfXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] thermal: qcom: Add support for Qualcomm MBG
 thermal monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sachin Gupta" <sachin.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
References: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
 <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 08:26:38 +0000
Message-Id: <20260706082639.3308D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `mbg_tm_set_trip_temp` callback incorrectly treats `INT_MAX`=
 as an out-of-bounds error, printing a spurious error message and returning=
 `-ERANGE` when the thermal framework attempts to disable the upper trip po=
int.
--

commit 11624a52601424e2e0de79b12ee193bdaf63ce36
Author: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

thermal: qcom: Add support for Qualcomm MBG thermal monitoring

This commit adds a driver for the Qualcomm MBG thermal monitoring device.
It registers a thermal zone device and sets up interrupt handling for
temperature threshold violations.

> diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qc=
om/qcom-spmi-mbg-tm.c
> new file mode 100644
> index 0000000000000..fa2f10002253f
> --- /dev/null
> +++ b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c

[ ... ]

> +static int mbg_tm_set_trip_temp(struct thermal_zone_device *tz, int low_=
temp,
> +				int temp)
> +{
> +	struct mbg_tm_chip *chip =3D thermal_zone_device_priv(tz);
> +	int ret =3D 0;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	/* The HW has a limitation that the trip set must be above 25C */
> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
> +		ret =3D regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
> +				   temp_to_vtemp_mv(temp));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +				      MON2_UP_THRESH_EN);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		dev_err(chip->dev, "Set trip b/w 25C and 160C\n");
> +		ret =3D regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_C=
FG,
> +					MON2_UP_THRESH_EN);
> +		return -ERANGE;
> +	}

[Severity: Medium]
Will this cause spurious errors when the thermal core attempts to disable
the trip point?=20

When the thermal subsystem determines that no upper trip point is needed,
it typically passes INT_MAX for the upper limit to disable the trip point.
While this code correctly clears MON2_UP_THRESH_EN to disable the trip,=20
it also logs a "Set trip b/w 25C and 160C" error and returns -ERANGE.
The thermal core will then likely log its own error about failing to set=20
the trips.

Should we handle INT_MAX explicitly as a request to disable the threshold,
rather than treating it as an out-of-bounds error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-spmi-mbg-d=
river-v2-0-f883ff1d8719@oss.qualcomm.com?part=3D2
