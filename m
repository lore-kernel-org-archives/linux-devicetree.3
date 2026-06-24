Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE4F26CE39
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 18:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327255; cv=none; b=LkxyE4uL1IXfRlU0WcEJzGXH/dCEtiCMTn7GdpjNhMF+OeN8USaKdj4l2eV5MkNHSoGNbjUVw1VLGKAevsPtFuX3i40sTd2I3gxsa4XwJdKDfg2sZVx1mJHl2hNv+KXQ/Mq7daeAA7KILM+7rXLyJQcXZlDJWU5cANV8Xps8fs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327255; c=relaxed/simple;
	bh=hNuTo92/h5hoPBjYellLHSQ8OazsB6frqCbGPsVScTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qWildCeGdTV0yy1oVBWqoyeWxhpz7VTpYi5Ge66eXTxbtS1Yz9Iq9Vjv4fV+A/XhvQ0oSXkECNl7by6v8Bjq8FTSunXakXr3r7CyU149kP8Wb9S+MQSEvlQ/LB36XLlPCCI8MyZ3EK+E5gJucbKq7JBorfLnvIn/PsXkK5h74Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIkiQFbc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIkiQFbc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257FB1F000E9;
	Wed, 24 Jun 2026 18:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782327254;
	bh=cEN6fqNXpx0U7X1ZVm3/OmbYot20igqV6Es/1qu5qhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kIkiQFbck+HGWpY89AvycvoOGDml1stQSy2uPf8VEEC811mPFBYQWtNFdpBsFYDcg
	 t7WQNCDgOkTbxklaRBXJk+UskmkfJYrrGkkTjw72VVQn3pOSQQEeneXLSM1SNkEM4K
	 FlOXWwiqpegm/NH9npy+M+83UGoWM4+wq9U8Zqs8qJEkWcZXlCMNMIbWOtio+ogAxK
	 2HgcoPdj3DiwywxBk01WBKe8EQo2uAm0+m8T70c57fKp4NwMnsneI//grV55SSytj/
	 C8pDy8jaqxLA0BDiISUibJXwv227cihT70P9A/uUG+svy9Jj5q+OXuUhtYiR3r394I
	 YpNOIW6nrzfnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V14 5/9] iio: imu: inv_icm42607: Add PM support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624182350.50467-6-macroalpha82@gmail.com>
References: <20260624182350.50467-1-macroalpha82@gmail.com>
 <20260624182350.50467-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 18:54:13 +0000
Message-Id: <20260624185414.257FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver incorrectly uses the non-monotonic `ktime_get_real()`=
 to measure the 45ms gyroscope power-off delay, risking bypassed hardware w=
aits.
--

commit d9cd3cdeff3488026816468ab782366517d43120
Author: Chris Morgan <macromorgan@hotmail.com>
Subject: iio: imu: inv_icm42607: Add PM support for icm42607

Add power management support for the ICM42607 device driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 9b82a0499d35b..ad23386a37b78 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -102,6 +106,71 @@ const struct inv_icm42607_hw inv_icm42607p_hw_data =
=3D {
>  };
>  EXPORT_SYMBOL_NS_GPL(inv_icm42607p_hw_data, "IIO_ICM42607");
> =20
> +static int inv_icm42607_set_pwr_mgmt0(struct inv_icm42607_state *st,
> +				      enum inv_icm42607_sensor_mode gyro,
> +				      enum inv_icm42607_sensor_mode accel)
> +{
> +	unsigned int oldaccel, oldgyro;
> +	unsigned int sleepval_us =3D 0;
> +	unsigned int val;
> +	s64 disable_wait;
> +	int ret;
> +
> +	ret =3D regmap_read(st->map, INV_ICM42607_REG_PWR_MGMT0, &val);
> +	if (ret)
> +		return ret;
> +
> +	oldaccel =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, val);
> +	oldgyro =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);
> +
> +	if (gyro =3D=3D oldgyro && accel =3D=3D oldaccel)
> +		return 0;
> +
> +	/*
> +	 * Datasheet on page 14.26 says we need to ensure the gyro sensor is on
> +	 * for a minimum of 45ms. So if we transition from an on state to an
> +	 * off state make sure at least 45ms have passed before power off and
> +	 * wait if it hasn't.
> +	 */
> +	if (!gyro && oldgyro) {
> +		disable_wait =3D ktime_us_delta(st->conf.gyro_stop,
> +					      ktime_get_real());

[Severity: Medium]
Is it safe to use the non-monotonic ktime_get_real() here to measure the
45ms gyroscope power-off delay?

If the system wall-clock (CLOCK_REALTIME) is stepped forward concurrently
(e.g., by an NTP sync), ktime_get_real() will jump forward. The calculated
disable_wait could become negative, get clamped to 0, and completely bypass
the mandatory wait before powering off the gyroscope, violating the datashe=
et
constraint.

Would it be better to use a monotonic clock like ktime_get() here and when
setting st->conf.gyro_stop below to track the elapsed interval reliably?

> +		disable_wait =3D clamp(disable_wait, 0,
> +				     INV_ICM42607_GYRO_STOP_TIME_US);
> +		fsleep(disable_wait);
> +	}
> +
> +	val =3D FIELD_PREP(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, gyro);
> +	val |=3D FIELD_PREP(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, accel);
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_PWR_MGMT0, val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If a state change occurs from off to on, sleep for the startup
> +	 * time of the sensor, unless a sleep_ms is specified. Since more
> +	 * than one sensor can be transitioned from off to on, select the
> +	 * maximum time from each of the sensors changing from off to on.
> +	 * The startup time for the temp sensor is considerably smaller
> +	 * than the startup time for the other sensors and one or more are
> +	 * required to be on for the temp sensor to function, so any start
> +	 * delay should be enough.
> +	 */
> +	if (accel && !oldaccel)
> +		sleepval_us =3D max(sleepval_us, INV_ICM42607_ACCEL_STARTUP_TIME_US);
> +
> +	if (gyro && !oldgyro) {
> +		sleepval_us =3D max(sleepval_us, INV_ICM42607_GYRO_STARTUP_TIME_US);
> +		/* Track the earliest we can turn off the gyroscope. */
> +		st->conf.gyro_stop =3D ktime_add_us(ktime_get_real(),
> +						  INV_ICM42607_GYRO_STOP_TIME_US);
> +	}
> +
> +	fsleep(sleepval_us);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624182350.5046=
7-1-macroalpha82@gmail.com?part=3D5
