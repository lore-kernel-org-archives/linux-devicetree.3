Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7504B298CB2
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799327; cv=none; b=b0DwPB7b/2eNpnuMluJvyWxAmfB2EdBzCz/nogaiRDDSD6Y/jxPrNfePmHw+GBMGyPulEfZ6RU5JWlsD1WnFgkLIrLAhfxhb3WuSXnnDWkE8cO3KLZM4pviw0oXn4bTfN9bmSm3+7rKuhGnkqJG26YiGrhusAajk0Hy4CkFX+iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799327; c=relaxed/simple;
	bh=L6a/IguoZMSk29JDIFwno+xk6+fquaZybSe+Vex7D8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NIzY4NcYdM+tI9oj/zW0iuVzfEpbxa4Rmnz0NB7k0hMPvUZnZ7gvuibbA3/UVF2g3uSthdcj+n6m/wiXtltQJEooQW6JQFK8D4sik7AFZoMRqtKaU3/xRbzrus5uEtpaWtWw7qbqqnjitWECJ7qsJT0yn2y8mSMQ7ZtVt2F8XNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBrS1RLE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBrS1RLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEFD1F00A3A;
	Thu, 18 Jun 2026 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781799326;
	bh=LN0T7THp2CZC68lZQGasdy3GKqMZe6xRHm8PJ/aevDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XBrS1RLE/h3eM14YzZmMXBA6FVBqc1qWxsemXx2pIoi/Hd7bIufo+X8tHcSyTR113
	 YP+4VAfkEkAeSHvic/p5sIfF9QfEaPQa/ZJHwXorfJ7RPBxU4wKXBITV37JBTgFhTh
	 ev8bAPcBbFbVDBNno5ZzYugfIWkAV50Btl597slNAOrA+i6yxhchGShqdUbWYQ1SIf
	 4lC8L2aYIKKCXh0WcIyKnuxGGl5urLkPcbt6sckb5rFyuviZcXBk0plET4lni7xW6F
	 l/vIEVSqx/Gg12dUOFUaxBJMRTkY9oILj4HrgDMGjG/2GkIVURL3/leqmC6C58GDs2
	 rs8h1BEjcQDUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: magnetometer: add support for Melexis
 MLX90393
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikhil Gautam" <nikhilgtr@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618160141.11409-3-nikhilgtr@gmail.com>
References: <20260618160141.11409-1-nikhilgtr@gmail.com>
 <20260618160141.11409-3-nikhilgtr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 16:15:25 +0000
Message-Id: <20260618161526.2CEFD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Data race on statically allocated `scale_avail` array.
- [High] DMA safety violation due to stack-allocated transfer buffers.
- [High] Writing to the temperature scale attribute corrupts the magnetomet=
er gain configuration.
- [Medium] IIO scale values violate ABI standard (Tesla and Celsius instead=
 of Gauss and milli-Celsius).
- [Medium] Missing `id_table` assignment in the I2C driver structure.
- [Medium] Temperature channel exposes raw register exponent values instead=
 of true oversampling ratios.
- [Medium] Lockless state reads in `mlx90393_read_raw` lead to data races.
--

commit bdec68e57f45f6e35e5c0c76d37b8ee5efa9691b
Author: Nikhil Gautam <nikhilgtr@gmail.com>

iio: magnetometer: add support for Melexis MLX90393

Add Industrial I/O subsystem support for the Melexis
MLX90393 3-axis magnetometer and temperature sensor.

> diff --git a/drivers/iio/magnetometer/mlx90393_core.c b/drivers/iio/magne=
tometer/mlx90393_core.c
> new file mode 100644
> index 0000000000000..0ad4a30c0be96
> --- /dev/null
> +++ b/drivers/iio/magnetometer/mlx90393_core.c

[ ... ]

> +static int mlx90393_write_reg(struct mlx90393_data *data, u8 reg, u16 va=
l)
> +{
> +	u8 tx[4];
> +	u8 status;
> +	int ret;
> +
> +	tx[0] =3D MLX90393_CMD_WR;
> +	put_unaligned_be16(val, &tx[1]);
> +	/* Register address is encoded in bits [7:2] */
> +	tx[3] =3D reg << 2;
> +
> +	ret =3D mlx90393_xfer(data, tx, sizeof(tx), &status, 1);

[Severity: High]
Is it safe to allocate the transfer buffers on the stack here and in
mlx90393_read_measurement()?=20

If the I2C host adapter uses DMA and CONFIG_VMAP_STACK is enabled, mapping
stack memory for DMA operations will fail. Should these buffers be
dynamically allocated to ensure DMA safety?

[ ... ]

> +static int mlx90393_get_scale(struct mlx90393_data *data,
> +			      const struct iio_chan_spec *chan,
> +			      int *val, int *val2)
> +{
> +	enum mlx90393_axis_type axis;
> +	u8 res;
> +
> +	if (chan->channel2 =3D=3D IIO_MOD_Z) {
> +		axis =3D MLX90393_AXIS_TYPE_Z;
> +		res =3D data->res_z;
> +	} else {
> +		axis =3D MLX90393_AXIS_TYPE_XY;
> +		res =3D data->res_xy;
> +	}
> +
> +	/*
> +	 * Convert:
> +	 * =C2=B5T =C3=97 1000 =E2=86=92 nT
> +	 */
> +	*val =3D 0;
> +	*val2 =3D mlx90393_scale_table[axis][data->gain_sel][res];
> +
> +	return IIO_VAL_INT_PLUS_NANO;
> +}

[Severity: Medium]
Does this return the scale in Gauss as required by the IIO ABI for
in_magn_scale? Using IIO_VAL_INT_PLUS_NANO with the current scale table yie=
lds
Tesla, which is off by a factor of 10,000 compared to Gauss.

[ ... ]

> +static int mlx90393_write_raw(struct iio_dev *indio_dev,
> +			      const struct iio_chan_spec *chan,
> +			      int val, int val2,
> +			      long mask)
> +{
> +	struct mlx90393_data *data =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE: {
> +		guard(mutex)(&data->lock);
> +		ret =3D mlx90393_set_scale(data, chan, val, val2);
> +		return ret;
> +	}

[Severity: High]
Can writing to the temperature scale attribute corrupt the magnetometer gain
configuration?

The IIO_TEMP channel exposes a writable scale attribute, but this case does
not check chan->type before calling mlx90393_set_scale(). Because the
temperature channel's channel2 field is 0, it evaluates as an XY magnetomet=
er
channel and will reconfigure the global gain_sel register.

[ ... ]

> +static int mlx90393_read_raw(struct iio_dev *indio_dev,
> +			     const struct iio_chan_spec *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct mlx90393_data *data =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		guard(mutex)(&data->lock);
> +		ret =3D mlx90393_read_measurement(data, chan->address, val);
> +		if (ret)
> +			return ret;
> +
> +		return IIO_VAL_INT;
> +		}
> +	case IIO_CHAN_INFO_SCALE:
> +		switch (chan->type) {
> +		case IIO_MAGN:
> +			return mlx90393_get_scale(data, chan, val, val2);

[Severity: Medium]
Is a lock needed here?

Configuration variables like gain_sel, osr, and osr2 are updated while
holding data->lock in mlx90393_write_raw(), but mlx90393_read_raw() reads
these properties without acquiring the lock.

Can concurrent updates result in stale or inconsistently-read configuration=
s?

> +
> +		case IIO_TEMP:
> +			/* Datasheet: 22124 millidegC/LSB */
> +			*val =3D 0;
> +			*val2 =3D 22124;
> +			return IIO_VAL_INT_PLUS_MICRO;

[Severity: Medium]
Does this return the temperature scale in milli-Celsius as required by the =
IIO
ABI? Returning 22124 with IIO_VAL_INT_PLUS_MICRO yields Celsius, which is o=
ff
by a factor of 1,000.

[ ... ]

> +static int mlx90393_read_avail(struct iio_dev *indio_dev,
> +			       const struct iio_chan_spec *chan,
> +			       const int **vals,
> +			       int *type,
> +			       int *length,
> +			       long mask)
> +{
> +	struct mlx90393_data *data =3D iio_priv(indio_dev);
> +	static int scale_avail[MLX90393_GAIN_MAX][MLX90393_AXIS_MAX];

[Severity: High]
Is it safe to use a statically allocated local array for scale_avail?

The lock is released before the IIO core iterates over the returned pointer.
Can concurrent sysfs reads across different channels or multiple device
instances clobber the shared array and return corrupted lists to userspace?

> +	enum mlx90393_axis_type axis;
> +	u8 res;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE: {
> +		guard(mutex)(&data->lock);
> +		axis =3D chan->channel2 =3D=3D IIO_MOD_Z;
> +		res =3D axis ? data->res_z : data->res_xy;
> +
> +		for (unsigned int i =3D 0; i < MLX90393_GAIN_MAX; i++) {
> +			scale_avail[i][0] =3D 0;
> +			scale_avail[i][1] =3D mlx90393_scale_table[axis][i][res];
> +		}
> +
> +		*vals =3D &scale_avail[0][0];
> +		*type =3D IIO_VAL_INT_PLUS_NANO;
> +		*length =3D MLX90393_GAIN_MAX * MLX90393_AXIS_MAX;
> +		return IIO_AVAIL_LIST;
> +	}
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> +		if (chan->type =3D=3D IIO_TEMP) {
> +			*vals =3D mlx90393_osr2_avail;
> +			*type =3D IIO_VAL_INT;
> +			*length =3D MLX90393_OSR2_MAX;

[Severity: Medium]
Does this expose raw register exponent values instead of true oversampling
ratios for the temperature channel?

Returning the register exponents (0, 1, 2, 3) directly violates the IIO ABI
which dictates reflecting the actual number of hardware samples applied.

[ ... ]

> diff --git a/drivers/iio/magnetometer/mlx90393_i2c.c b/drivers/iio/magnet=
ometer/mlx90393_i2c.c
> new file mode 100644
> index 0000000000000..52233b6295c2b
> --- /dev/null
> +++ b/drivers/iio/magnetometer/mlx90393_i2c.c

[ ... ]

> +static struct i2c_driver mlx90393_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "mlx90393",
> +		.of_match_table =3D mlx90393_of_match,
> +	},
> +	.probe =3D mlx90393_i2c_probe,
> +};

[Severity: Medium]
Is the id_table assignment missing here?

The driver defines the mlx90393_id table and exports it, but it is not
assigned to the id_table field of this structure. Could this prevent the
driver from binding on systems relying on legacy board-file setups or sysfs
new_device instantiation?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618160141.1140=
9-1-nikhilgtr@gmail.com?part=3D2
