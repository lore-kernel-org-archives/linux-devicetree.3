Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862A3FAE1D
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491376; cv=none; b=DhS85x2kE9IXAXOGRL6NSVb1JNzUR58Say3ocw9yiJfEQXWIA8SUCrV8V9pussMdDAL9BfwRxjpGyDIEPC7S9TojEaTU94IuwaOR11N+/GKfFSud+4yUaj9/TQpvOgsv9BKcwYuLMomAQKTpvn6UGkC9d+BMITGAffUi3EruS7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491376; c=relaxed/simple;
	bh=NVnDY4gc25ftt42g3Xr863CczjUFB23Nl3ms3pHnF5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aUMKpDDOIub/5CoXAUzDEWGDhCqPk8xPh8BdYqR1SgkEHsqBoT8JRXywIOvii/NXFxE8BNa9QQje320B1UB6VBdpQetsUUx+TTKae+JwWFt2dFWjH+NVuZph7umtyp+iwz01IIEe/gRnVu+QetJTQ3y0aj8jjqvEwvdJG4PamWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lynv2BJb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lynv2BJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD321F00A3D;
	Fri, 26 Jun 2026 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782491375;
	bh=F+JurBC5JmoPZ8SGzqZjX7BQ53Wf3AUpWJtIqX+9iX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lynv2BJbdItJuWfbm+lhlF6fb9cjE3fIIpDYH3EKQ1R74E1NfmX+Yukbl3yjc9Ifs
	 JiNEGpaipJptp2vnTZP61mDjnTqzgDHRHf+W3CN3umCNmZOsFDc302Q9JLXaHyrW/n
	 848zNvkK51Dr7IhOG3eOlkSS4sAizPxNLN17GsrZJvG4eRwXHTYvNdiYAzwA+I2uhZ
	 a14Z5kZ7eRtae5ioMBquuIdfG4VYfCWuCQU8ZAHBd28RdreEI0UcAqG3WytPRodmGS
	 u0SuSvxyW04gvAwhPRbR5yHlnxBex7fHlD/iLRQGstjXAhh58UqjoFlo4JGgnKpiyx
	 Z/HPEQUjQh6SQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V15 6/9] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260626161230.93069-7-macroalpha82@gmail.com>
References: <20260626161230.93069-1-macroalpha82@gmail.com>
 <20260626161230.93069-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 16:29:34 +0000
Message-Id: <20260626162935.2FD321F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver fails to update the cached sensor mode (`st->conf.accel=
.mode` and `st->conf.gyro.mode`) in `inv_icm42607_set_sensor_conf()`, causi=
ng active sensors to be inadvertently powered down during subsequent operat=
ions on other channels.
- [Low] Comment mismatch regarding reserved values in ODR arrays.
--

commit 21180a0d12af14de0e8d6f0ad4323cd153c83b4d
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607
   =20
Add icm42607 accelerometer sensor for icm42607.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> new file mode 100644
> index 0000000000000..8ef9fdae1bc84
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c

[ ... ]

> +static int inv_icm42607_accel_write_scale(struct iio_dev *indio_dev,
> +					  int val, int val2)
> +{

[ ... ]

> +	return inv_icm42607_set_sensor_conf(st, &conf, IIO_ACCEL);
> +}
> +
> +/* IIO format int + micro , values 0-5 reserved. */
> +static const int inv_icm42607_accel_odr[][2] =3D {
> +	[INV_ICM42607_ODR_1600HZ] =3D { 1600, 0 },
> +	[INV_ICM42607_ODR_800HZ] =3D { 800, 0 },

[Severity: Low]
This isn't a bug, but the comment states values 0-5 are reserved.
However, the array defines index 5 (INV_ICM42607_ODR_1600HZ) and the iterat=
ion
logic later starts at index 5. Should this say values 0-4 are reserved
instead?

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 738970ed5c66f..300c583aba81d 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +int inv_icm42607_set_sensor_conf(struct inv_icm42607_state *st,
> +				 struct inv_icm42607_sensor_conf *conf,
> +				 enum iio_chan_type chan_type)
> +{
> +	struct inv_icm42607_sensor_conf *oldconf;
> +	bool config0, config1;
> +	unsigned int val;
> +	int ret;

[ ... ]

> +	if (config1) {
> +		if (chan_type =3D=3D IIO_ANGL_VEL) {
> +			val =3D FIELD_PREP(INV_ICM42607_GYRO_CONFIG1_FILTER_MASK,
> +					 conf->filter);
> +			ret =3D regmap_update_bits(st->map, INV_ICM42607_REG_GYRO_CONFIG1,
> +						 INV_ICM42607_GYRO_CONFIG1_FILTER_MASK, val);
> +		} else {
> +			val =3D FIELD_PREP(INV_ICM42607_ACCEL_CONFIG1_FILTER_MASK,
> +					 conf->filter);
> +			ret =3D regmap_update_bits(st->map, INV_ICM42607_REG_ACCEL_CONFIG1,
> +						 INV_ICM42607_ACCEL_CONFIG1_FILTER_MASK, val);
> +		}
> +		if (ret)
> +			return ret;
> +
> +		oldconf->filter =3D conf->filter;
> +	}
> +

[Severity: High]
Should conf->mode be saved to oldconf->mode before updating the power
management state?

Since oldconf->mode is never updated here, the software state permanently
tracks both sensors as OFF. When reading one sensor, the stale OFF state
for the other sensor is passed to inv_icm42607_set_pwr_mgmt0(), which
inadvertently powers it down. This can cause the driver to ping-pong power
states and incur 45ms delays on alternating reads.

> +	if (chan_type =3D=3D IIO_ANGL_VEL)
> +		return inv_icm42607_set_pwr_mgmt0(st, conf->mode, st->conf.accel.mode);
> +
> +	return inv_icm42607_set_pwr_mgmt0(st, st->conf.gyro.mode, conf->mode);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626161230.9306=
9-1-macroalpha82@gmail.com?part=3D6
