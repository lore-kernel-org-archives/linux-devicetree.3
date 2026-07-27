Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACDD4314BC
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174125; cv=none; b=ffkopOOpgMjcQNaoAImvznPLe50IZ7rHnAGNPvtjIIKN6b83V8WB06IthgDYTFniRIaNeZpTbgi4niGaisrvTf3ME7zIizIgoU3Ub/ZlLw7vZs/moEX3iOhgqukRH/KZTx1mwMIV9xEWjCwpuKy7eDcEbY4dW/GKdWH0tKgi+D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174125; c=relaxed/simple;
	bh=JncZPZ/dQKJXe/5zBe4aMyGpXJceY6CjDxZajsDd0pk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SPb8Q/EdYP5KV2IUx2vI5ilSty71uR3e8ZBBBMIFJcpkhD4ho28Q+U71z9u7KpVhnUb8YjFcetfb4vyVbe53fxrTMuoVxryxYdG5Tfhga61H1jGqmIuH6qjT8Wx87jyg126KgtNgQCxv0a+YRyK21FLm0qMo0ehMzowZUHFYYTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBXv5p+R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBXv5p+R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995CE1F000E9;
	Mon, 27 Jul 2026 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785174123;
	bh=M+cSmptBvmNK8KUt789hzNdWbsmMcrokK/DdGCbdJcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kBXv5p+Rkq8mlg23Ti6Wzo3NaIN8BxsWzBSXxyYshyDOJRJz+TVuRsJymiPsxKjlO
	 7QOLI5pldrDtNsgR3cTz7O6fR9aF0iLjSqGzCEUmn/GRnetK70DauOPyZ25ADi0MHD
	 N6ZrhAlH2VdNaFWJNYrjPs4yBV1SfW0KP5ASzWUfzwxj1jCcqvVdXWPId+dMKaUKdf
	 CMgyohJfb83+b1E55uUZVOYnl7qAsg+BwqE6UdcWqGrDxz17CNca7NsLkfMDGfWn+C
	 BZNxRLm0gvGyCDKxP3VOKkbVMH5YApOEcA+dZQdt8I9V1I4tpqFR2V1pJtuKt8ZRAM
	 x97yaebyCTo2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V20 6/9] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727164815.65190-7-macroalpha82@gmail.com>
References: <20260727164815.65190-1-macroalpha82@gmail.com>
 <20260727164815.65190-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:42:03 +0000
Message-Id: <20260727174203.995CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Raw reads via `inv_icm42607_read_sensor` do not wait for the fir=
st sample to be generated, causing spurious `-EINVAL` errors on wakeup.
- [Low] Passing `unsigned int *` to parameters expecting `enum inv_icm42607=
_sensor_mode *` causes a compiler warning and potential strict-aliasing vio=
lation.
--

--- Patch [6]: [PATCH V20 6/9] iio: imu: inv_icm42607: Add Accelerometer fo=
r icm42607 ---
commit 34b41c497c47a25cee214dea5331f64210422963
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607
   =20
Add icm42607 accelerometer sensor for icm42607.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index e6d2fc7c0a344..22cd37e0616e3 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> @@ -191,6 +202,174 @@ static int inv_icm42607_set_pwr_mgmt0(struct inv_ic=
m42607_state *st,

[ ... ]

> +int inv_icm42607_set_sensor_conf(struct inv_icm42607_state *st,
> +				 struct inv_icm42607_sensor_conf *conf,
> +				 enum iio_chan_type chan_type)
> +{
> +	struct inv_icm42607_sensor_conf *oldconf;
> +	unsigned int accel_mode, gyro_mode;
> +	bool config0, config1;
> +	unsigned int val;
> +	int ret;

[ ... ]

> +	/*
> +	 * Since we are only making one-shot calls today, we can avoid needless
> +	 * on/off cycles if we rely on the runtime power management to handle
> +	 * shutting off the sensors when not in use. The downside is if we
> +	 * enable both sensors then only read from one, we have to wait for
> +	 * runtime PM to turn it off. So just keep the mode of the sensor we
> +	 * are not actively using to whatever it's already set as.
> +	 */
> +	ret =3D inv_icm42607_get_pwr_mgmt0(st, &gyro_mode, &accel_mode);

[Severity: Low]
Does this code cause an incompatible pointer type warning?

inv_icm42607_get_pwr_mgmt0() expects enum inv_icm42607_sensor_mode *
parameters, but &gyro_mode and &accel_mode are unsigned int *. Recent kernel
versions (since 6.8) treat this as a build error by default.

[ ... ]

> +int inv_icm42607_read_sensor(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     s16 *val)
> +{
> +	struct inv_icm42607_sensor_conf conf =3D INV_ICM42607_SENSOR_CONF_INIT;
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);

[ ... ]

> +	/* enable sensor */
> +	conf.mode =3D sensor_st->power_mode;
> +	conf.filter =3D sensor_st->filter;
> +	ret =3D inv_icm42607_set_sensor_conf(st, &conf, chan->type);
> +	if (ret)
> +		return ret;
> +
> +	/* read sensor register data */
> +	ret =3D regmap_bulk_read(st->map, reg, &data, sizeof(data));

[Severity: Medium]
Does this sequence need to wait for the first sample to be generated after
powering on the sensor?

It appears that if the sensor is turned on by a userspace read, the driver
waits for the physical hardware startup time in inv_icm42607_set_pwr_mgmt0(=
),
but doesn't wait for the first sample to be generated based on the configur=
ed
ODR (which can take an additional 1/ODR time).

Could reading immediately after power on yield the invalid data marker
(-32768) and return a spurious -EINVAL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727164815.6519=
0-1-macroalpha82@gmail.com?part=3D6
