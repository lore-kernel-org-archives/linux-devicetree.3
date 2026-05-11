Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD8237EFE0
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537632; cv=none; b=qIadJlRzDySVpbBdXhb67+bGD1ecVAgR1BZ5QWdslsfJxwCPC02Da3NIXT2RtzLUoS9xtpKn0Q0fWjRmUgILLeRK2VzEguWR1uOtL9NmoPCki0QoF9XlPLL0HZRNnPIC/53hX2iFHlLy8vBG2O8i+Yb8VsPVb9Xui0Nt6Ncof/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537632; c=relaxed/simple;
	bh=3O1ByTEnAZ2FpFFUu2owcr1KxMYITL073QLU32NbH4Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ne97n4zbNspjyffL4FjUM5u1qbJRtZ68pYDsvM76QdkdYhfcMMAubsgUkxqfjMFbZgkBtijtiL0AhmTcjQa7RjvMDy25PPzLaeJAJhegGqeKL67b9s2WLflv91YLwa4K/ZjRWGuDqv25MH09hvi+whM4RvLOSLotxYoji/lZs/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsIHTDoy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsIHTDoy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BBDCC2BCB0;
	Mon, 11 May 2026 22:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778537632;
	bh=3O1ByTEnAZ2FpFFUu2owcr1KxMYITL073QLU32NbH4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PsIHTDoyP2A1E5KLOQZXYStNjo2kDOCqttKlVlz4JvF25ExFleMc2UX69k4EICNVD
	 BcC/B1vdIiULcC360yIng7X+uc0CHHUSY5cnSh9cgANna6l5STiuT3rNeCN+GXGyzX
	 UprWAkr0EEDIwmyEupc1qk77G/TH95tIl9sRvozQ3tbvws77NlnRKpf4ZQLHyPdOS7
	 hjeyuXdPDNClZIDmj3cN/KRgUI2MS3YGFUPKwImslKXiEyxbLZZqErk6+RFuaWsNHb
	 JPauGCh+KejHpDkeyguFaOrwHmXn6XsfKaKoZBBaWE+HfsRuoGgT7Koebw/JYGtyPo
	 ncWZXtynS6l3A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/2] iio: magnetometer: add support for Melexis
 MLX90393
Reply-To: sashiko@lists.linux.dev
To: "Nikhil Gautam" <nikhilgtr@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510191010.155380-3-nikhilgtr@gmail.com>
References: <20260510191010.155380-3-nikhilgtr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:13:51 +0000
Message-Id: <20260511221352.4BBDCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Data race on static `scale_avail` array in `mlx90393_read_avail`
- [High] `mlx90393_check_status` unconditionally rejects valid full-sensor =
measurements
- [High] Stack-allocated buffers are passed to I2C transfer, violating DMA =
safety rules
- [High] Unprotected state reads in `mlx90393_read_raw` lead to data races
- [Medium] IIO ABI violation: Magnetometer and temperature scales use incor=
rect units
- [Medium] `mlx90393_write_raw` improperly allows modifying the magnetomete=
r gain via the temperature scale attribute
- [Medium] Magnetometer scale is exported as separate attributes despite ut=
ilizing a global hardware register
- [Low] Temperature channel exposes internal hardware register values for o=
versampling ratios
- [Low] Incorrect use of `usleep_range` for delays exceeding 200ms
--

commit b098ee066ea285eea196aa30f9837e81df63b980
Author: Nikhil Gautam <nikhilgtr@gmail.com>

iio: magnetometer: add support for Melexis MLX90393

This commit adds Industrial I/O subsystem support for the Melexis MLX90393
3-axis magnetometer and temperature sensor.

> diff --git a/drivers/iio/magnetometer/mlx90393_core.c b/drivers/iio/magne=
tometer/mlx90393_core.c
> index 0000000000000..c79f2b8c20d8e
> --- /dev/null
> +++ b/drivers/iio/magnetometer/mlx90393_core.c

[ ... ]

> +static const int mlx90393_osr2_avail[MLX90393_OSR2_MAX] =3D {
> +	0, 1, 2, 3,
> +};

Is it intentional to expose internal hardware register index limits directly
to userspace instead of the actual physical oversampling ratios?

[ ... ]

> +#define MLX90393_CHAN(idx, axis, addr) { \
> +	.type =3D IIO_MAGN, \
> +	.modified =3D 1, \
> +	.channel =3D idx, \
> +	.address =3D addr, \
> +	.channel2 =3D IIO_MOD_##axis, \
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |	\
> +		BIT(IIO_CHAN_INFO_SCALE), \

Does using info_mask_separate for IIO_CHAN_INFO_SCALE correctly represent
the hardware capabilities? Writing to the scale of one axis will alter the
global GAIN_SEL hardware register in mlx90393_set_scale(), altering the
scale for all axes.

[ ... ]

> +static int mlx90393_check_status(u8 cmd, u8 status)
> +{
> +	/* Always validate error bit */
> +	if (status & MLX90393_STATUS_ERROR)
> +		return -EIO;
> +
> +	switch (cmd & MLX90393_CMD_MASK) {
> +	case MLX90393_CMD_RM:
> +		/*
> +		 * D1:D0 indicates response availability
> +		 * 00 means invalid/no measurement
> +		 */
> +		if ((status & MLX90393_STATUS_RESP) =3D=3D 0)
> +			return -EIO;

If MLX90393_MEASURE_ALL requests all 4 channels (T, X, Y, Z), resulting in
4 words, does the 2-bit D[1:0] field truncate this to 00? This check might
unconditionally reject valid full-sensor measurements and return -EIO.

[ ... ]

> +static int mlx90393_read_reg(struct mlx90393_data *data,
> +			     u8 reg, u16 *val)
> +{
> +	u8 tx[2];
> +	u8 rx[3];
> +	int ret;
> +
> +	tx[0] =3D MLX90393_CMD_RR;
> +	/* Register address is encoded in bits [7:2] */
> +	tx[1] =3D reg << 2;
> +
> +	ret =3D mlx90393_xfer(data,
> +			    tx, sizeof(tx),
> +			    rx, sizeof(rx));

Are these stack-allocated buffers DMA-safe?

When passed to ops->xfer which calls i2c_transfer(), this can lead to memory
corruption or panics if the host controller maps buffers for DMA (especially
with CONFIG_VMAP_STACK=3Dy).

[ ... ]

> +static int mlx90393_read_measurement(struct mlx90393_data *data,
> +				     enum mlx90393_channels chan, int *val)
> +{
> +	u8 cmd;
> +	u8 rx[9];

Can this stack allocated buffer also cause DMA safety issues?

> +	int ret;
> +	int tconv_us =3D mlx90393_get_tconv_us(data);
> +
> +	/* Start measurement */
> +	cmd =3D MLX90393_CMD_SM | MLX90393_MEASURE_ALL;
> +
> +	ret =3D mlx90393_write_cmd(data, cmd);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait conversion */
> +	usleep_range(tconv_us, tconv_us + 1000);

Depending on the configured oversampling ratio and digital filters, tconv_us
can exceed 200,000 microseconds. Is usleep_range() appropriate for delays
exceeding 20ms, or should msleep() be used here instead to avoid
unnecessarily taxing the hrtimer subsystem?

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

Does this scale comply with the IIO ABI requirements? Returning
IIO_VAL_INT_PLUS_NANO with these values produces Tesla rather than the Gauss
units required for magnetometers.

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
> +	case IIO_CHAN_INFO_SCALE:
> +		mutex_lock(&data->lock);
> +		ret =3D mlx90393_set_scale(data, chan, val, val2);
> +		mutex_unlock(&data->lock);
> +		return ret;

Does this safely handle writes to the temperature scale?=20

The temperature channel exposes IIO_CHAN_INFO_SCALE, but mlx90393_set_scale=
()
modifies the GAIN_SEL hardware register, which might inadvertently corrupt =
the
magnetometer's sensitivity when a user writes to in_temp_scale.

[ ... ]

> +static int mlx90393_read_raw(struct iio_dev *indio_dev,
> +			     const struct iio_chan_spec *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct mlx90393_data *data =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		mutex_lock(&data->lock);
> +		ret =3D mlx90393_read_measurement(data, chan->address, val);
> +		mutex_unlock(&data->lock);
> +		if (ret)
> +			return ret;
> +
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_SCALE:
> +		switch (chan->type) {
> +		case IIO_MAGN:
> +			return mlx90393_get_scale(data, chan, val, val2);

Can this read race with concurrent sysfs writes?=20

mlx90393_get_scale() reads shared state like data->gain_sel without acquiri=
ng
data->lock, while mlx90393_write_raw() modifies these fields while holding =
the
lock.

> +
> +		case IIO_TEMP:
> +			/* Datasheet: 22124 millidegC/LSB */
> +			*val =3D 0;
> +			*val2 =3D 22124;
> +			return IIO_VAL_INT_PLUS_MICRO;

Does returning IIO_VAL_INT_PLUS_MICRO with 22124 yield Celsius rather than
the milli-Celsius required for temperature channels by the IIO ABI?

> +
> +		default:
> +			return -EINVAL;
> +		}
> +
> +	case IIO_CHAN_INFO_OFFSET:
> +		if (chan->type =3D=3D IIO_TEMP) {
> +			/* Datasheet: temperature offset */
> +			*val =3D -45114;
> +			return IIO_VAL_INT;
> +		}
> +		return -EINVAL;
> +
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> +		if (chan->type =3D=3D IIO_TEMP)
> +			return mlx90393_get_temp_osr2(data, val);
> +		if (chan->type =3D=3D IIO_MAGN)
> +			return mlx90393_get_osr(data, val);

Can these reads of data->osr and data->osr2 also race with concurrent sysfs
writes, as data->lock is not acquired here?

[ ... ]

> +static int mlx90393_read_avail(struct iio_dev *indio_dev,
> +			       const struct iio_chan_spec *chan,
> +			       const int **vals,
> +			       int *type,
> +			       int *length,
> +			       long mask)
> +{
> +	struct mlx90393_data *data =3D iio_priv(indio_dev);
> +
> +	static int scale_avail[MLX90393_GAIN_MAX][MLX90393_AXIS_MAX];
> +	enum mlx90393_axis_type axis;
> +	int i;
> +	u8 res;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		axis =3D chan->channel2 =3D=3D IIO_MOD_Z;
> +		res =3D axis ? data->res_z : data->res_xy;
> +
> +		for (i =3D 0; i < MLX90393_GAIN_MAX; i++) {
> +			scale_avail[i][0] =3D 0;
> +			scale_avail[i][1] =3D
> +				mlx90393_scale_table[axis][i][res];
> +		}
> +
> +		*vals =3D &scale_avail[0][0];

Is it safe to use a global static array here?

Since scale_avail is dynamically populated based on the requested channel
axis, concurrent sysfs reads across different axes or device instances could
overwrite the array mid-operation, causing a data race and corrupted scale
values to be returned.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510191010.1553=
80-1-nikhilgtr@gmail.com?part=3D2
