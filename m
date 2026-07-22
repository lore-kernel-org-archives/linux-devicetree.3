Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537B44749ED
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736092; cv=none; b=rMOAFuKHevEBvgJmRCZy/ln6BXmpBk7fKNRonUj2NS0FCZCu8GOljZv6QrKrCTgEXKL2YfNFpZFIRCOlE+kTsoncqkUS86VJ3spUp3L64OrCUFSRPi2OdTAb2iRk6bdnghaDUqWlhnCDDgRF14fm8lB6cUgvyoFC9x9Xlk0lMoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736092; c=relaxed/simple;
	bh=28vcYtRMBlvGMpNwSXtZEG2NOpNKt9WaoBiIjB3KI7w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lShbNXBQEZ64cnTURORnJl8ODygs0DWOyv9I7ZlKmy9lINXUSphztuBslhMYf7aQaEjjqXITCBh+BRQzERdzqLXzxaSJZy37BF0I+kKxhBF3X6idGJml81vSvsAw9iY5fHcvYA6k8E+JM9PKyriBOWDZesNXwiLP4fTIyx5mRg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7fswK3t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7fswK3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC2D1F000E9;
	Wed, 22 Jul 2026 16:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784736091;
	bh=IExqtfgUqGvzX+CBKK9wD8d53sZEok+NPsQpDFkqkz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I7fswK3tMNpvGKcLmxDqpFsJuLiTVaVksp/uSZGLABetqn/LXv0YbE8h0RufGia4N
	 t2hWSH9PwL0f/nv+nFPK5Rlvw2BkQC2citZ9iGhMeGTrneKgE7w5AQ32ijTSp625Z0
	 eNN90OejW5YuPpCfhMkOLCYHfHLGJ9CMWk//bkgHczdDtLKp5Bx9p/UBdMaXGnqSs3
	 +GtdhdNlB2r3PccG8JOV/CrxeUbQHNWqTEQ4+3mX9JgbqoFShg3woW7+IKrVNtboVu
	 1tzZXS3TOQ2neV46HtgpsXTJYhbutitDxAhZ5F7qzvD2jJ5H/FpwQaMa3ycvR+mMSb
	 wPcCKU3XmpU5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 6/9] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722153942.144387-7-macroalpha82@gmail.com>
References: <20260722153942.144387-1-macroalpha82@gmail.com>
 <20260722153942.144387-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:01:30 +0000
Message-Id: <20260722160130.DEC2D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Sensor data read immediately after power-on fails with -EINVAL f=
or low ODRs due to insufficient wait time.
- [Medium] A race condition during device removal leaves the hardware perma=
nently powered on because devm-based IIO unregistration occurs after the dr=
iver's custom remove callback.
--

--- Patch [6]: [PATCH V19 6/9] iio: imu: inv_icm42607: Add Accelerometer fo=
r icm42607 ---
commit d5a95e354010c482038057c3ba35322667609d59
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607
   =20
Add icm42607 accelerometer sensor for icm42607.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> new file mode 100644
> index 0000000000000..f563c77084201
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c

[ ... ]

> @@ -288,21 +288,21 @@ struct iio_dev *inv_icm42607_accel_init(struct inv_=
icm42607_state *st)
> +	indio_dev->name =3D name;
> +	indio_dev->info =3D &inv_icm42607_accel_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->channels =3D inv_icm42607_accel_channels;
> +	indio_dev->num_channels =3D ARRAY_SIZE(inv_icm42607_accel_channels);
> +	iio_device_set_drvdata(indio_dev, st);
> +
> +	ret =3D devm_iio_device_register(dev, indio_dev);

[Severity: Medium]
Could this lead to the hardware being left permanently powered on
during device removal?

During driver unbind, the custom remove callback (inv_icm42607_sensors_off)
will run before the devm cleanup unregisters this IIO device.

If a concurrent userspace sysfs read re-enables the sensor via runtime PM
before the devm IIO unregistration occurs:

sysfs read
  pm_runtime_get... (powers device on)
  inv_icm42607_read_sensor()
  pm_runtime_put_autosuspend... (queues async suspend)

Will the subsequent devm cleanup of runtime PM cancel the async suspend
and leave the device powered on indefinitely?

> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return indio_dev;
> +}

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index d85eaedef0706..c1648f5c35389 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> @@ -355,18 +364,18 @@ int inv_icm42607_read_sensor(struct iio_dev *indio_=
dev,
> +	/* read sensor register data */
> +	ret =3D regmap_bulk_read(st->map, reg, &data, sizeof(data));
> +	if (ret)
> +		return ret;
> +
> +	*val =3D be16_to_cpu(data);
> +	if (*val =3D=3D INV_ICM42607_DATA_INVALID)
> +		return -EINVAL;

[Severity: Medium]
Can this return -EINVAL during normal sysfs reads at low ODRs?

When the device is in autosuspend and a sysfs read occurs at a low ODR
(e.g., 1.5625 Hz), the driver wakes up the sensor and waits for=20
INV_ICM42607_ACCEL_STARTUP_TIME_US (10ms).

Since the first sample at such a low ODR can take much longer (e.g., ~640ms)
to be ready, will the hardware return INV_ICM42607_DATA_INVALID here,
causing the read to fail rather than blocking until data is ready?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722153942.1443=
87-1-macroalpha82@gmail.com?part=3D6
