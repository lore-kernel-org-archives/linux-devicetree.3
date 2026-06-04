Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707BF4F7995
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 21:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780609526; cv=none; b=ReJ8dO7JC4ej3je49Bi5k0/SdDqihtGjFY2i7Qx3H10LmPiGCxc0AGXxx/XC03Tc36ETtigXW0nJhrJlthY+aYWTMkv5IZyC+M/G7JZdiwaKX4+UTbht1oMmr65WDcuU9cUVGPEVyuJCDviefD1gwuJcl147KtJt6l0bfCG1bSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780609526; c=relaxed/simple;
	bh=jQhMKX6BkOmplcu6VtcEywHglt/bK7xVODS9S5T1WO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uPK08lYu9I/L47PKCuPZsZgadQNywhOgNjtrocVycPzb+TWj4HRYS4pmhx4++SQfh+Gn+ve6KUl36uLkurEmLprFv0m9bCUGhf98X57n526phvPiXjOhSg39gq6thotHEJSnSlebIL02zyPUKJZ2t0ojgG0FAIZ2/Z/2N32OG+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbfDprfD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbfDprfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EF51F00893;
	Thu,  4 Jun 2026 21:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780609524;
	bh=lQqi597dNy9XCj2Gj50QnCXATCkarwPN4Sqa9KF5tPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CbfDprfDVfuTFNLnvgERIMSkK2HFv0BPx8/YwWXOUGMwA4dMWJ0ox7oRfqPFrcly/
	 h5+C9ke/QS2Mt37uF+pUx5QXu8pVHovtl5Pi52Nj1UxPfKvybImWEfKRsVAH07G7cO
	 uIuAklly1TIMF4VWLvvn5I10N+kFHpAZRTZFg258Pe42TTv1UyAN5/W9BKY4lCaH1X
	 M9mHAiO6VE8MbVOSOZljYmZTb4o+7ACe3o/gMWq4cynEkOG5FOLSGRkIN0u2XGoZio
	 cCkuAlfZqqYbsWV2cIUXi5iRagv5osi8BG4Pn8pGDzP2xEO0+t4cwBDDO6M5JO/QgN
	 KP83OMefkKcAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V10 7/9] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604201832.60656-8-macroalpha82@gmail.com>
References: <20260604201832.60656-8-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 21:45:23 +0000
Message-Id: <20260604214524.92EF51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Incomplete IIO buffer support results in dead code and logically=
 flawed `update_scan_mode` callback.
- [Medium] Accelerometer initialized with conflicting power mode and filter=
 macro.
- [Medium] Failing to configure the hardware ODR leaves the software timest=
amp structure in an inconsistent state.
- [Medium] Lockless reads of shared state in `inv_icm42607_accel_read_scale=
()` and `inv_icm42607_accel_read_odr()`.
--

commit aa64241d5631fbdd46e4e9a9ec9bb1ee1fabadb5
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607

Add icm42607 accelerometer sensor for icm42607.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> new file mode 100644
> index 0000000000000..6c1f88688c3f4
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c

[ ... ]

> +static int inv_icm42607_accel_read_scale(struct iio_dev *indio_dev,
> +					 int *val, int *val2)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	unsigned int idx;
> +
> +	idx =3D st->conf.accel.fs;

[Severity: Medium]
Is it safe to read st->conf.accel.fs here without acquiring st->lock?=20

The write path in inv_icm42607_accel_write_scale() mutates this state while=
=20
holding the lock, so concurrent accesses might result in a data race. Should
this read be protected using guard(mutex)(&st->lock)?

[ ... ]

> +static int inv_icm42607_accel_read_odr(struct inv_icm42607_state *st,
> +				       int *val, int *val2)
> +{
> +	unsigned int odr;
> +	unsigned int i;
> +
> +	odr =3D st->conf.accel.odr;

[Severity: Medium]
Does this read of st->conf.accel.odr need to be protected by st->lock,=20
similar to how it is protected during writes in=20
inv_icm42607_accel_write_odr()?

[ ... ]

> +static int inv_icm42607_accel_write_odr(struct iio_dev *indio_dev,
> +					int val, int val2)
> +{

[ ... ]

> +	ret =3D inv_sensors_timestamp_update_odr(ts, inv_icm42607_odr_to_period=
(conf.odr),
> +					       iio_buffer_enabled(indio_dev));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D inv_icm42607_set_accel_conf(st, &conf, NULL);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If inv_icm42607_set_accel_conf() fails here, do we leave the software=20
timestamp module expecting the new ODR while the hardware remains at the=20
old ODR?

[ ... ]

> +struct iio_dev *inv_icm42607_accel_init(struct inv_icm42607_state *st)
> +{

[ ... ]

> +	accel_st->power_mode =3D INV_ICM42607_SENSOR_MODE_LOW_NOISE;
> +	accel_st->filter =3D INV_ICM42607_FILTER_AVG_16X;

[Severity: Medium]
Is this the intended filter configuration?=20

We are setting the power_mode to INV_ICM42607_SENSOR_MODE_LOW_NOISE, but=20
using an averaging filter macro (INV_ICM42607_FILTER_AVG_16X) meant for low=
=20
power mode.=20

[ ... ]

> +	iio_device_set_drvdata(indio_dev, st);
> +	indio_dev->name =3D name;
> +	indio_dev->info =3D &inv_icm42607_accel_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->channels =3D inv_icm42607_accel_channels;
> +	indio_dev->num_channels =3D ARRAY_SIZE(inv_icm42607_accel_channels);
> +	indio_dev->available_scan_masks =3D inv_icm42607_accel_scan_masks;

[Severity: Medium]
Since INDIO_DIRECT_MODE is the only mode configured and there is no buffer=
=20
setup (like devm_iio_kfifo_buffer_setup), does this make the buffer-specifi=
c=20
logic like inv_icm42607_accel_update_scan_mode, available_scan_masks, and=20
IIO_CHAN_SOFT_TIMESTAMP dead code?=20

Also, if inv_icm42607_accel_update_scan_mode were to be called, it lacks a=
=20
PM runtime acquisition, which could lead to accessing hardware registers on=
 a=20
suspended device.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +int inv_icm42607_set_accel_conf(struct inv_icm42607_state *st,
> +				struct inv_icm42607_sensor_conf *conf,
> +				unsigned int *sleep_ms)
> +{

[ ... ]

> +	if (conf->filter !=3D oldconf->filter) {
> +		if (conf->mode =3D=3D INV_ICM42607_SENSOR_MODE_LOW_POWER) {
> +			val =3D FIELD_PREP(INV_ICM42607_ACCEL_CONFIG1_AVG_MASK, conf->filter);
> +			ret =3D regmap_update_bits(st->map, INV_ICM42607_REG_ACCEL_CONFIG1,
> +						 INV_ICM42607_ACCEL_CONFIG1_AVG_MASK, val);
> +		} else {
> +			val =3D FIELD_PREP(INV_ICM42607_ACCEL_CONFIG1_FILTER_MASK,
> +					 conf->filter);

[Severity: Medium]
Since conf->mode is initialized to LOW_NOISE, this branch will apply the=20
filter value (3 for AVG_16X) to INV_ICM42607_ACCEL_CONFIG1_FILTER_MASK.=20

Value 3 in the bandwidth enum corresponds to INV_ICM42607_FILTER_BW_73HZ.=20
Will this silently set a 73Hz bandwidth instead of the intended 16x=20
averaging?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604201832.6065=
6-1-macroalpha82@gmail.com?part=3D7
