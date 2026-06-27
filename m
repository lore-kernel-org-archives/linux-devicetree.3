Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55706211466
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554785; cv=none; b=oXtxg1fwMOGGEGoRngs/anW71/CDl0H1i3r7hw4YQeIISa6mYoM8bNKB8HjTDmzLaP20/Z4riFG1NmNjddnngojm2ZH0wcxhYDQ5dtvnjvMEs7HzUVIyAWJ3WmdG1e+AvNPzXOY7he8H/A7UltUCu04TWsl4M3reeAeGjiaLvGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554785; c=relaxed/simple;
	bh=oU4DtZ2DI9hm5rvX6+/lsXEW/26yi+PUEmlol5jhwTM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KowZmbC5lJvvTvmTtqLSXyoiC9j2XJuJGeJLpFHyZ8l3VgsKgSovs5cHBut1WYr9V5pVo29XemBta35374h4/Hyi61BuW47KF+r/sebFqVZPApGzwPxX41ACj/9xahruboxr/GlfULdqgz+2yQq6N2jvA8bhrSTyT7OgxhxWiEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1uIr3w1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1uIr3w1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9DE1F000E9;
	Sat, 27 Jun 2026 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782554784;
	bh=bDPBX6wFlIThWLf4GHKfVJSTkqAZngyfXOve4go4lis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h1uIr3w15aDrk/hsG9yiWpJDq/tPyo5tPswFPSkJ0n478BVFzynaE/6/g61iiSD7f
	 ad1DTeWWgrjFnZuZS8UukNqmPyJRIOl9PesaOIOwLGnYxS4ZSzsvG27BvhWJPKspBw
	 rPvhdzde7D4UotZSaw8JYQ7Rh4/AGVSEZvPzI43tgadU4s0W3qF5GvReocFcUwPk+y
	 p0E3czApBOQXYUf+gra7VMbtvxCqKD433zYWr8Kl5i2P94aE6I1fInKoFM1jnEjx8s
	 Wt3yMCk0OmZmVbUQdEQLDrLIJDVwJsdInc8JHOvzsrqEHJQan9exMqHUU8ZEW4dbJV
	 j2fFjF3HVnNuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] iio: magnetometer: add support for Melexis
 MLX90393
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikhil Gautam" <nikhilgtr@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260627095519.8377-3-nikhilgtr@gmail.com>
References: <20260627095519.8377-1-nikhilgtr@gmail.com>
 <20260627095519.8377-3-nikhilgtr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 10:06:23 +0000
Message-Id: <20260627100623.AE9DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Data race and state corruption due to function-static `scale_avail=
` array.
- [High] Stack-allocated buffers are passed to `i2c_transfer`, violating DM=
A safety rules.
- [Medium] Writing to temperature scale incorrectly modifies magnetometer h=
ardware gain.
- [Medium] Temperature oversampling ratio exposes raw register values inste=
ad of actual multipliers.
- [Medium] IIO scale factors are incorrectly calculated, violating the expe=
cted IIO ABI units.
- [Low] Use of floating-point literal in delay calculation causes build fai=
lures.
--

commit 46a132b5223abb9cadead7640985442ba357e7bc
Author: Nikhil Gautam <nikhilgtr@gmail.com>

iio: magnetometer: add support for Melexis MLX90393

This patch adds Industrial I/O subsystem support for the Melexis MLX90393
3-axis magnetometer and temperature sensor. The driver supports raw magnetic
field and temperature measurements, scale and oversampling selection, and
currently uses the I2C interface.

> diff --git a/drivers/iio/magnetometer/mlx90393_core.c b/drivers/iio/magne=
tometer/mlx90393_core.c
> new file mode 100644
> index 0000000000000..78fcab8a2b566
> --- /dev/null
> +++ b/drivers/iio/magnetometer/mlx90393_core.c
> @@ -0,0 +1,701 @@

[ ... ]

> +static const int mlx90393_osr2_avail[MLX90393_OSR2_MAX] =3D {
> +	0, 1, 2, 3,
> +};

[Severity: Medium]
Does this expose raw register values for the temperature oversampling ratio
instead of the actual multipliers?

The IIO ABI requires exposing the actual ratio (1, 2, 4, 8) rather than the
raw hardware indices. Users reading or writing the in_temp_oversampling_rat=
io
sysfs attribute might be confused by these hardware-specific indices.

[ ... ]

> +static int mlx90393_read_reg(struct mlx90393_data *data, u8 reg, u16 *va=
l)
> +{
> +	u8 tx[2];
> +	u8 rx[3];
> +	int ret;
> +
> +	tx[0] =3D MLX90393_CMD_RR;
> +	/* Register address is encoded in bits [7:2] */
> +	tx[1] =3D reg << 2;
> +
> +	ret =3D mlx90393_xfer(data, tx, sizeof(tx), rx, sizeof(rx));

[Severity: High]
Can passing these stack-allocated buffers to the I2C transport cause memory
corruption or DMA mapping errors?

Since CONFIG_VMAP_STACK is enabled by default in modern kernels, stack memo=
ry
is not physically contiguous and cannot be safely mapped for DMA. When sysfs
operations trigger communication with the device, the I2C controller might =
use
DMA to transfer data, which expects DMA-safe memory.

This pattern is also present in mlx90393_write_reg() and
mlx90393_read_measurement().

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
> +	*val =3D 0;
> +	*val2 =3D mlx90393_scale_table[axis][data->gain_sel][res];
> +
> +	return IIO_VAL_INT_PLUS_NANO;
> +}

[Severity: Medium]
Does this calculate the scale factor correctly for the IIO ABI?

The magnetometer scale values in mlx90393_scale_table are returned using
IIO_VAL_INT_PLUS_NANO, yielding a value like 0.000000751. However, since the
value is 0.751 uT/LSB, this corresponds to 0.00751 Gauss/LSB. Returning it
as nanounits without adjusting the multiplier makes the reported scale off =
by
a factor of 10,000.

[ ... ]

> +static int mlx90393_write_raw(struct iio_dev *indio_dev,
> +			      const struct iio_chan_spec *chan,
> +			      int val, int val2,
> +			      long mask)
> +{
> +	struct mlx90393_data *data =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE: {
> +		guard(mutex)(&data->lock);
> +		return mlx90393_set_scale(data, chan, val, val2);
> +	}

[Severity: Medium]
Does this allow writing to the temperature scale?

Since IIO_CHAN_INFO_SCALE is checked unconditionally without validating
chan->type, writes to the in_temp_scale sysfs attribute fall through to
mlx90393_set_scale(). Because chan->channel2 is 0 for the temperature chann=
el,
this unintentionally modifies the magnetometer's GAIN_SEL configuration ins=
tead
of returning -EINVAL.

[ ... ]

> +static int mlx90393_read_raw(struct iio_dev *indio_dev,
> +			     const struct iio_chan_spec *chan,
> +			     int *val, int *val2, long mask)
> +{

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		switch (chan->type) {
> +		case IIO_MAGN:
> +			return mlx90393_get_scale(data, chan, val, val2);
> +
> +		case IIO_TEMP:
> +			/*
> +			 * Datasheet Table 7: Thermal Specification
> +			 */
> +			*val =3D 0;
> +			*val2 =3D 22124;
> +			return IIO_VAL_INT_PLUS_MICRO;

[Severity: Medium]
Does this return the temperature scale in degrees Celsius instead of
milli-Celsius?

The IIO ABI specifies that temperature should be exposed in milli-Celsius, =
but
returning 0.022124 yields degrees Celsius.

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
Can concurrent reads of this function corrupt the scale_available sysfs out=
put?

Because scale_avail is declared as a function-static array, it is shared
across all channels and devices. When the IIO core processes the returned
pointer outside of the driver's lock, concurrent reads (e.g., from multiple
axes or probed devices) will overwrite the array and return interleaved or
incorrect values to userspace.

[ ... ]

> +static int mlx90393_init(struct mlx90393_data *data)
> +{
> +	int ret;
> +	u16 reg;
> +
> +	/* Exit mode */
> +	ret =3D mlx90393_write_cmd(data, MLX90393_CMD_EX);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Datasheet section 15.4.1.2 (RT command), Figure 16:
> +	 * Wait 1 ms after EX command before issuing RT.
> +	 */
> +	fsleep(1 * USEC_PER_MSEC);
> +
> +	/* Reset device */
> +	ret =3D mlx90393_write_cmd(data, MLX90393_CMD_RT);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Datasheet section 15.4.1.2 (RT command), Figure 16:
> +	 * Wait 1.5 ms for the start-up sequence to complete.
> +	 */
> +	fsleep(1.5 * USEC_PER_MSEC);

[Severity: Low]
Will this floating-point literal cause build failures?

The expression uses 1.5, which is a double-precision floating-point literal.
The Linux kernel does not support floating-point arithmetic, which leads to
compilation errors on most architectures that do not support soft-float or
have strict compiler flags against floating-point usage.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627095519.8377=
-1-nikhilgtr@gmail.com?part=3D2
