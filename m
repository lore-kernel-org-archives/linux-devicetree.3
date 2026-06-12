Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7900A40D56A
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268970; cv=none; b=sVhbUMJHf4L5iqGWq0qkt9KP/GmlxwVqJxahtTwR9jpPKXSlpQeQ6CiukprSl1Lwdm2KlSnlqr0AJQkF161lcvqmpjKgX0K/v25N3uTNMkCtGihujli14BnktkxALuVPnDe0Y79uQ1Zgtj6o1jipFgJOnxn5u5qfM7bE6tFaXaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268970; c=relaxed/simple;
	bh=rNBXnL5gB90ZU2VFSCeIM8faZKvlbH/p1XnDM68wrAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V6WjaB0vRRIqxaEPeLbAzLVIY8BQlUhMxtQcVZVBnpZxEgDDAK5+9QiDC6EwmGl+avxa5d2ETQ3iYCgdKO7JJsQqtEucEbyKadRLAcC1u2DW4FyUDZvmVmtbh/gyEIEdycLgbJlh08Ttqm0pW5RybB3Xfzrf4F9HUQ3qWRil9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQWrqa3t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQWrqa3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4201F000E9;
	Fri, 12 Jun 2026 12:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781268969;
	bh=uaV7ZQ7A4RtMJYEO0efUSf78Z6a4q2bj0asdFhBRS9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nQWrqa3tdvV5cW78WfCY6eW993Li/lrV9kR4njhDI5zSHDTx7V9SWOljAThOwWUdt
	 K0ygFHYJkfo6350CVjufybcHLDiMyByFCVBpVT4BpyKnJ+PlbokyFnqdLhWaveFz+j
	 RJMCyBnZw2lLeQnPCQNH2bM4/43nqegbg7CM9yqPbLOURz5tJxL4BENPH3N4zKCak0
	 ppDXm1mf+VnCrlHaJ9kI0PWC1A7EZguOUrc3J/x6w0053D+jiagHneU6sKXeT5c+fv
	 5cYXjSO1MCG78BdzqBxeCdDg6wd60Oedkofz/Scpj9WCXUAvgul8BZzrEEp6ktMQU0
	 M3cKDkfG4UnDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] iio: magnetometer: add driver for QST QMC5883L
 Sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Siratul Islam" <email@sirat.me>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260612124557.13750-4-email@sirat.me>
References: <20260612124557.13750-4-email@sirat.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 12:56:08 +0000
Message-Id: <20260612125608.DE4201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Returning early with `-ERANGE` when the overflow flag (OVL) is set=
 prevents the data registers from being read, leaving the sensor permanentl=
y stuck in an overflow state.
- [Medium] The device is left in continuous measurement mode on driver remo=
val or initialization failure, causing an unnecessary power drain.
--

commit 8aa498258e2b8bddd48bf3c46ef8555a7376ea6e
Author: Siratul Islam <email@sirat.me>

iio: magnetometer: add driver for QST QMC5883L Sensor

This commit adds a new I2C driver for the QST QMC5883L 3-Axis Magnetic Sens=
or,
including continuous measurement mode support and scaling options.

> diff --git a/drivers/iio/magnetometer/qmc5883l.c b/drivers/iio/magnetomet=
er/qmc5883l.c
> new file mode 100644
> index 0000000000000..055e51570635c
> --- /dev/null
> +++ b/drivers/iio/magnetometer/qmc5883l.c

[ ... ]

> +static int qmc5883l_take_measurement(struct iio_dev *indio_dev, int inde=
x,
> +				     int *val)
> +{
> +	struct qmc5883l_data *data =3D iio_priv(indio_dev);
> +	unsigned int status;
> +	__le16 buf[3];
> +	int ret;
> +
> +	scoped_guard(mutex, &data->mutex)
> +	{
> +		/* 50ms headroom over the slowest ODR (10Hz) */
> +		ret =3D regmap_read_poll_timeout(data->regmap,
> +					       QMC5883L_REG_STATUS1, status,
> +					       (status & QMC5883L_STATUS_DRDY),
> +					       2 * USEC_PER_MSEC,
> +					       150 * USEC_PER_MSEC);
> +		if (ret)
> +			return ret;
> +
> +		if (status & QMC5883L_STATUS_OVL)
> +			return -ERANGE;

[Severity: High]
If we return -ERANGE here when the overflow flag (OVL) is set, does the
sensor get permanently stuck in an overflow state?

In typical I2C magnetometers, the Data Ready (DRDY) and Overflow (OVL)
status bits are only cleared by reading the data registers. By returning
early without reading the data registers via regmap_bulk_read(), the DRDY
and OVL flags might remain set indefinitely.=20

On subsequent measurement attempts, regmap_read_poll_timeout() will return
immediately and this check will instantly fail again, potentially locking up
the sensor until a reset.

> +
> +		ret =3D regmap_bulk_read(data->regmap, QMC5883L_REG_X_LSB, buf,
> +				       sizeof(buf));

[ ... ]

> +static int qmc5883l_init(struct qmc5883l_data *data)
> +{
> +	unsigned int reg;
> +	int ret;
> +

[ ... ]

> +	data->odr =3D QMC5883L_ODR_50HZ;
> +	data->range =3D QMC5883L_RNG_2G;
> +	data->osr =3D QMC5883L_OSR_64;
> +
> +	ret =3D regmap_write(data->regmap, QMC5883L_REG_CTRL1,
> +			   (QMC5883L_MODE_CONT | data->odr | data->range |
> +			    data->osr));
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

[ ... ]

> +static int qmc5883l_probe(struct i2c_client *client)
> +{

[ ... ]

> +	indio_dev->name =3D "qmc5883l";
> +	indio_dev->info =3D &qmc5883l_info;
> +	indio_dev->channels =3D qmc5883l_channels;
> +	indio_dev->num_channels =3D ARRAY_SIZE(qmc5883l_channels);
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +
> +	ret =3D qmc5883l_init(data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "qmc5883l init failed\n");
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

[Severity: Medium]
Is there a missing devm teardown callback to power down the sensor when the
driver is unbound or if registration fails?

In qmc5883l_init(), the sensor is placed into continuous sampling mode. If
devm_iio_device_register() fails, or when the driver is removed, there
doesn't appear to be a registered cleanup action (e.g., via
devm_add_action_or_reset()) to place the device back into standby mode.

Although the devm core disables the VDD/VDDIO regulators during teardown,
these regulators might be shared with other components on the board. If the
shared supply remains active, the sensor could continue continuous sampling
and unnecessarily drain power.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612124557.1375=
0-1-email@sirat.me?part=3D3
