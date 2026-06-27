Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745CF2F84F
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 01:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782522617; cv=none; b=umUQdJGRqD06AsN0xiPh1XeNH27AnL/WY9apEnUZ/BOM3mhGXFPw0hjkRWqzZA7Aj++G+2Kn11r5ANDss2ic1EYTHwB6+qSkDs2hmF4altJH/U/TTTyuRYbUlIjulm3kFk5iemiTYkaxYs6s5mW1CTNRsgFs1lDHkJnxU2Idn2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782522617; c=relaxed/simple;
	bh=z+1uh1kVLWq7fTLQxK8GqdQa/psWHFbRKgXc4AXag2U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HLsE2Ma8AJaZQARahV0KjhZjYviKBewOaRuJ9tUR31Ru3x0mBJX1mDngII5BUFDFNJI7gV51307sujUu0VMFAzyw4rLlIdjUSO+toCqBIGV09YqZUFSnEVs3zOJ69bd6+nPJGul5dsDu+jDOJ8XfgD/pns7PnyCJoU/G2f42HA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGGwcHLB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGGwcHLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E3A1F000E9;
	Sat, 27 Jun 2026 01:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782522616;
	bh=J+UuVknGOLLgWjNYluenhsG0ezWbuWvNrDMSzzcXp0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mGGwcHLBr1CtiXzkY4zKXBcokpYl6UUQUOKTnlPnx5qQtjui/bdoYzEs99IQZh/N8
	 4oyE/gH3gAOD74WDLSbltE6OuP9NLW+v9tAiq9RbCApIw66BmtdceIiKrzhGGTRppA
	 PdeImokIbQipGuiiINsgqFreWFxeSMDvJjhPYwLlvMloz4gTPZJb+tNGOP1PR78EvO
	 1wxIPkRHk1i+gM56nLpl6EcAFCk6yUDNHexvjnOeACrGpjvXZY4e10i8mVF7nD4geK
	 irImjP4teGq6cH9DUJm2RK6mxPcVUwffZ9WMH/9PXODntjAJgBoq5DpOXJOifOEp+X
	 /tTW3Q+R86hdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: magnetometer: add support for Melexis
 MLX90393
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikhil Gautam" <nikhilgtr@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260627005843.7786-3-nikhilgtr@gmail.com>
References: <20260627005843.7786-1-nikhilgtr@gmail.com>
 <20260627005843.7786-3-nikhilgtr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 01:10:15 +0000
Message-Id: <20260627011015.C4E3A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] TOCTOU data race in `mlx90393_read_avail` due to static array.
- [High] Stack-allocated buffers passed to I2C transport violate DMA rules.
- [High] `mlx90393_check_status` rejects valid responses for 4-axis reads.
- [Medium] Writing to `in_temp_scale` silently corrupts magnetometer gain c=
onfiguration.
- [Medium] Incorrect physical units exposed for IIO scales (ABI violation).
- [Medium] Temperature oversampling ratio exposes internal register indices=
 (ABI violation).
- [Low] Use of floating-point literal in `fsleep` duration.
- [Low] Misuse of `MLX90393_AXIS_MAX` for scale array length.
- [Low] Data race on configuration variables in `mlx90393_read_raw`.
--

commit 615b644e2712a4949015c117e64d449d197438d8
Author: Nikhil Gautam <nikhilgtr@gmail.com>

iio: magnetometer: add support for Melexis MLX90393

Add Industrial I/O subsystem support for the Melexis MLX90393 3-axis
magnetometer and temperature sensor.

> diff --git a/drivers/iio/magnetometer/mlx90393_core.c b/drivers/iio/magne=
tometer/mlx90393_core.c
> index 0000000000000..78fcab8a2b566 100644
> --- /dev/null
> +++ b/drivers/iio/magnetometer/mlx90393_core.c
[ ... ]
> +static const int mlx90393_osr2_avail[MLX90393_OSR2_MAX] =3D {
> +	0, 1, 2, 3,
> +};

[Severity: Medium]
Should this array expose the physical oversampling ratios (e.g., 1, 2, 4, 8)
rather than the internal register values, to comply with IIO ABI standards?

[ ... ]
> +static int mlx90393_check_status(u8 cmd, u8 status)
> +{
> +	/* Datasheet: Table 12: Status byte definition */
> +
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

[Severity: High]
Does this validation break 4-axis reads?

If MLX90393_MEASURE_ALL requests 4 words, could the 2-bit counter overflow
to 00, causing the driver to incorrectly reject valid responses?

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
Can passing stack-allocated buffers to the I2C transport cause memory
corruption or a kernel panic?

If the underlying I2C controller uses DMA, mapping stack memory (which might
be CONFIG_VMAP_STACK) is generally not allowed. This also applies to the rx
buffer in mlx90393_read_measurement().

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

[Severity: Medium]
Do these return values violate the IIO ABI?

Is the magnetometer scale exposing Tesla (nano scale) instead of Gauss?

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
Does this lack of chan->type checking mean writes to the temperature scale
sysfs attribute will fall through to mlx90393_set_scale()?

Could this unintentionally alter the magnetometer gain configuration?

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

[Severity: Low]
Does reading driver configuration fields like data->gain_sel in
mlx90393_get_scale() without holding data->lock introduce a data race with
concurrent sysfs writes in mlx90393_write_raw()?

> +
> +		case IIO_TEMP:
> +			/*
> +			 * Datasheet Table 7: Thermal Specification
> +			 */
> +			*val =3D 0;
> +			*val2 =3D 22124;
> +			return IIO_VAL_INT_PLUS_MICRO;

[Severity: Medium]
Does this violate the IIO ABI by exposing Celsius instead of milli-Celsius?

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
Is it safe to populate and return a pointer to a static array here?

Since the IIO core reads this array outside the driver's lock, couldn't a
concurrent sysfs read from another thread or device overwrite the array
contents while it's being read?

[ ... ]
> +		*vals =3D &scale_avail[0][0];
> +		*type =3D IIO_VAL_INT_PLUS_NANO;
> +		*length =3D MLX90393_GAIN_MAX * MLX90393_AXIS_MAX;

[Severity: Low]
Is MLX90393_AXIS_MAX being misused here to calculate the length?

While it evaluates to 2, shouldn't length represent the number of values
(entries * 2 elements per IIO value pair) rather than axis count?

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
Could using a floating-point literal (1.5) cause build or linkage errors
on architectures where hardware floating-point arithmetic is not supported
in the kernel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627005843.7786=
-1-nikhilgtr@gmail.com?part=3D2
