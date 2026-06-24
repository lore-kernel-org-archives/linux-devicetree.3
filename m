Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398971AAE17
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327029; cv=none; b=qeSEkPLhja1D5yOpvDdZapxcfB0h8jOSt7Xs5sMD+bVEeQWwnIAYWz+6g7G/ekobvIJfTJhIbEaLr85Zakn0icBWgoPZauhr+ofOZBlQqX6OGT5xh1WBSl5WF2fDd6dcelo+O/Zcz7KjJFcchM+prrRBPL/UflyZiCdMbxX6Zh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327029; c=relaxed/simple;
	bh=0u5bduXiUhin6ACpvbNTsKhxpcQdJ0bipZXEUbIEiGs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G6bLDIgtK/NNN4KbKpkDQzcafVChInVHTZ3xFxJJs/xxkFYwKJoVr7eEWCWx6Qww6iAhONJdkr3TF9gxRip9n1w4a4Sa5lbbjCR1nnNy1LPZR0nTxD5SEXfhs2w0M9efyxVvEqVoudaCvqZ7kQPx1D2rMdAP6LDK72dALOOj7KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxE7JmEY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxE7JmEY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949861F000E9;
	Wed, 24 Jun 2026 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782327027;
	bh=3NEwPmsso7rYLqssQg/CcKBbW/5m0kL0NA2h/eM88jE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oxE7JmEYfz09M3TDCKoe0tDAfCwRYwMo9NboiP5LSvxl4Va6id1v2xot6Sr42aLXJ
	 HTg3QDzDz5b5zL/wpQmaOJ+rTqsf493sSPhGH92dZeygkswdxvfQxLy4cy/nWaRhpD
	 lgqG4S2GfY7xTTzvD1DLAFEkITdR+02nE5ivAwEOPnTobqLadrWRH/czhrqExbpdxs
	 FK9mbqaWzYyJDoyvbL+yAKHMuFszePzzVeRNkrbiqwt/NAnkLE3B29azGRIYMHS2Xq
	 YGwNWChE6hm2vNv3J1wwRsaxBYBE0mkBYNnHmkQzfjiyzK79u2K/XcXw7TUXhmzzbt
	 o9p1IxsTxYAAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V14 6/9] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624182350.50467-7-macroalpha82@gmail.com>
References: <20260624182350.50467-1-macroalpha82@gmail.com>
 <20260624182350.50467-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 18:50:27 +0000
Message-Id: <20260624185027.949861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing update of software cache for sensor power mode causes unin=
tended hardware power-downs.
- [Medium] Use of non-monotonic `ktime_get_real()` for hardware delay track=
ing.
--

commit 99de30070cdb6e08bed49a3aac077583415f3f84
Author: Chris Morgan <macromorgan@hotmail.com>
Subject: iio: imu: inv_icm42607: Add Accelerometer for icm42607

This patch adds accelerometer sensor support for the icm42607 device.=20
It introduces the accelerometer IIO channel configurations and integrates=20
the sensor state management.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index ad23386a37b78..26cedec0c97ce 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> @@ -106,6 +107,15 @@ const struct inv_icm42607_hw inv_icm42607p_hw_data =
=3D {

[ ... ]

> +static int inv_icm42607_set_pwr_mgmt0(struct inv_icm42607_state *st,
> +				      enum inv_icm42607_sensor_mode gyro,
> +				      enum inv_icm42607_sensor_mode accel)
> +{

[ ... ]

> +	if (!gyro && oldgyro) {
> +		disable_wait =3D ktime_us_delta(st->conf.gyro_stop,
> +					      ktime_get_real());

[Severity: Medium]
Is ktime_get_real() safe to use here for hardware delay tracking?

Because ktime_get_real() returns wall-clock time, it is susceptible to
time jumps, such as an NTP synchronization.

If the clock jumps forwards while the gyroscope is being powered off,
could the calculated disable_wait become negative and get clamped to 0,
thereby bypassing the 45ms minimum on-time requirement?

> +		disable_wait =3D clamp(disable_wait, 0,
> +				     INV_ICM42607_GYRO_STOP_TIME_US);
> +		fsleep(disable_wait);
> +	}

[ ... ]

> +	if (gyro && !oldgyro) {
> +		sleepval_us =3D max(sleepval_us, INV_ICM42607_GYRO_STARTUP_TIME_US);
> +		/* Track the earliest we can turn off the gyroscope. */
> +		st->conf.gyro_stop =3D ktime_add_us(ktime_get_real(),
> +						  INV_ICM42607_GYRO_STOP_TIME_US);

[Severity: Medium]
Would using a monotonic time source like ktime_get() prevent potential=20
issues with time jumps during this delay calculation?

> +	}
> +
> +	fsleep(sleepval_us);
> +
> +	return 0;
> +}

[ ... ]

> @@ -171,6 +181,160 @@ static int inv_icm42607_set_pwr_mgmt0(struct inv_ic=
m42607_state *st,

[ ... ]

> +int inv_icm42607_set_sensor_conf(struct inv_icm42607_state *st,
> +				 struct inv_icm42607_sensor_conf *conf,
> +				 enum iio_chan_type chan_type)
> +{

[ ... ]

> +	if (chan_type =3D=3D IIO_ANGL_VEL)
> +		return inv_icm42607_set_pwr_mgmt0(st, conf->mode, st->conf.accel.mode);
> +
> +	return inv_icm42607_set_pwr_mgmt0(st, st->conf.gyro.mode, conf->mode);
> +}

[Severity: High]
Does this code update the software state cache for the sensor mode?

It appears that inv_icm42607_set_sensor_conf() applies the new mode to
the hardware by calling inv_icm42607_set_pwr_mgmt0(), but returns without
saving conf->mode into oldconf->mode (or st->conf.accel.mode /=20
st->conf.gyro.mode).=20

If this cache remains at its initial OFF value, could a subsequent
configuration of the other sensor read this stale OFF state and
erroneously power down the currently active sensor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624182350.5046=
7-1-macroalpha82@gmail.com?part=3D6
