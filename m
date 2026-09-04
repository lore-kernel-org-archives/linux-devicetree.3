Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46F04248D2
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 07:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505222; cv=none; b=KzXUaNNi9DE4cSvuHxZWqBkt7hD41im3zVQFZ+hXatryiaQLmAeWmeXVnfcGrR7EEWHjRJ/XGqVoejfYDxBY7IMDtGtyjIJ5hwGUK1MKWbpAXgnbxBuZaf+Rx5s16X03b2oT8TJ8igX8Icgaf9Nte29A4rlaeC6dOAhXaKSTcHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505222; c=relaxed/simple;
	bh=iXZMa7tJHMQdHFUuoZwEPCSWw7MLZwPbfjMfcxdyEg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nDanuQyD51CqcXKUgxvm2Axi/L3D7yozHQDzP/tFaey8LI/Vxs5+2892I9uQT3M/M62u+8CZjQPZ7Q05RmUEWjDLqvkHFIvFd1Jx7zo2e/ZE4IlsAQ8U1wZDGCqZdH1Y2lGN4VrPWCZTERoOWnI6dSBm0UlujIs/0fl7+WWtti8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkNQvRi+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkNQvRi+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61AF1F00A3E;
	Fri,  4 Sep 2026 07:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788505212;
	bh=/LWYHbRH36PjXCI3gmjuG5osIWGS0uo80B8ufaOSfeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SkNQvRi+WxIlshUXuduXbdMfylpoxqVyfPDvNFKSHGpCJch/Ldoj2pMtyc3iSfSyi
	 mSU4cZytyaj78xTG7OsuAS/yUEGd3brIu/SxUlDFDKQt0ZjR9xNDQ+t9Te/I/vSXcD
	 Y2zHV3/EHzZXIPMqoup3CpWdqN1h3gf+0FVssaai0h8VwuxJi6Aysp2RnRrhUhQyvh
	 j2BRqK7o+fJULfkhW86megSbouVZGpIt5wXYpx1fZPSzd/fQn1tx4GLcA95MkZd9Wm
	 sRS2oiK5dGlBtRsX1IPtDICyy5JM9K6c/fD1iZxVveHv6ISPbIzaq3uaHuauYFWJJ2
	 WlMQy8cxqsDlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/9] media: chips-media: wave6: Add Wave6 thermal
 cooling device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <e3cb770b50ce5932f0ec0ed25419cd8271a04780.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <e3cb770b50ce5932f0ec0ed25419cd8271a04780.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:00:11 +0000
Message-Id: <20260904070011.E61AF1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Initial thermal state commands from the framework are silently d=
iscarded during registration due to a premature check on `thermal->cooling`.
- [Medium] The cooling device acts as a silent placebo if PM domain perform=
ance states are unsupported.
- [Medium] The driver incorrectly uses `dev_pm_genpd_set_performance_state(=
)` with a raw frequency in kHz, violating the OPP/genpd abstraction and ris=
king hardware malfunction on platforms with abstract performance levels.
- [Low] Defensive out-of-bounds check returns success (0) instead of an err=
or, masking invalid requests and caching wrong states.
--

commit 99914a36008f0afa814ae979e8bbaf4616a8b747
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 thermal cooling device

Add a thermal cooling device for the Wave6 VPU.
The device operates within the Linux thermal framework,
adjusting the VPU performance state based on thermal conditions.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c=
 b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
> new file mode 100644
> index 0000000000000..1e67943b213bd
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
> @@ -0,0 +1,143 @@

[ ... ]

> +static int wave6_vpu_thermal_cooling_update(struct vpu_thermal_cooling *=
thermal,
> +					    int state)
> +{
> +	unsigned long new_clock_rate;
> +	int ret;
> +
> +	if (state > thermal->thermal_max || !thermal->cooling)
> +		return 0;

[Severity: Low]
Does returning 0 for an invalid state request (state > thermal->thermal_max)
mask the error from the thermal core? It seems this would incorrectly allow
the caller wave6_vpu_cooling_set_cur_state() to cache this invalid state in
thermal->thermal_event.

[Severity: Medium]
Will the !thermal->cooling check incorrectly trigger during the initial
synchronous state assignment?

When devm_thermal_of_child_cooling_device_register() is called in
wave6_vpu_cooling_init(), it synchronously calls
wave6_cooling_ops.set_cur_state(). The registration function has not yet
returned to assign the pointer to thermal->cooling, so this check evaluates
to true. This would silently discard the initial cooling state set by the
thermal governor.

> +
> +	new_clock_rate =3D DIV_ROUND_UP(thermal->freq_table[state], HZ_PER_KHZ);
> +	dev_dbg(thermal->dev, "receive cooling state: %d, new clock rate %ld\n",
> +		state, new_clock_rate);
> +
> +	ret =3D dev_pm_genpd_set_performance_state(thermal->dev, new_clock_rate=
);

[Severity: Medium]
Is it correct to use dev_pm_genpd_set_performance_state() with a raw
frequency in kHz?

The dev_pm_genpd_set_performance_state() function expects a performance
state index (OPP level). Calculating
DIV_ROUND_UP(thermal->freq_table[state], HZ_PER_KHZ) instead of retrieving
the actual OPP level via dev_pm_opp_get_level() could violate the OPP/genpd
abstraction. On platforms where the performance domain uses abstract levels,
dividing the frequency by 1000 could result in an invalid or zero performan=
ce
state, breaking the cooling mitigation.

> +	if (ret && !((ret =3D=3D -ENODEV) || (ret =3D=3D -EOPNOTSUPP))) {

[Severity: Medium]
Does ignoring -ENODEV and -EOPNOTSUPP errors create a situation where the
cooling device acts as a silent placebo?

If the platform is missing genpd performance state support for the VPU,
these errors are caught and 0 (success) is returned. The thermal governor
will believe the device was throttled and will keep trying, but temperatures
will not drop since the device is not actually being cooled.

> +		dev_err(thermal->dev, "failed to set perf to %lu, ret =3D %d\n",
> +			new_clock_rate, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +int wave6_vpu_cooling_init(struct device *dev, struct vpu_thermal_coolin=
g *thermal)
> +{

[ ... ]

> +	thermal->thermal_event =3D 0;
> +	thermal->cooling =3D devm_thermal_of_child_cooling_device_register(dev,
> +									 dev->of_node,
> +									 dev_name(thermal->dev),
> +									 thermal,
> +									 &wave6_cooling_ops);

[Severity: Medium]
As noted above in wave6_vpu_thermal_cooling_update(), since this is where
registration happens, thermal->cooling is only assigned after the framework
might have already attempted to set an initial cooling state. This causes
that initial command to be silently discarded.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788496816.gi=
t.nas.chung@chipsnmedia.com?part=3D7
