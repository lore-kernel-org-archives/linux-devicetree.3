Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C6224AF7
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852142; cv=none; b=T2/WPRum4ZuMCjSmrYWWIP6nO20gJoi2184LNnTCEFuPGGKqWiaDPO3Ics3fEK6Rg92VwVcEaZ2rpLiVgCSsNitP7jxSzZK/vKLmWUn/oOSwNb9MQ345mANLhnVvylqe5OqEHi5fOSoi0mMzufJVeuJiL5KUuHixlVT8hpHNAUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852142; c=relaxed/simple;
	bh=nc5Orx7m54en1/8Sa4kUcm3InnfZ3JxI9Kv0RQTsun8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uxAplKd1dgES4qKGQ/j3Xf0w9S+8wX/A8iuw2tDLPdAAZ0YOKbrmSX6nCXrFQhtAA6aZK0gkiMIBp/6Nj3Q39tf+b13VitCKPTiFMmLTS+1R/mLFcHveDHZv+XUgr2et/RyCQKl7dXwW/8bN5mlXmG9zJbYrSfdDxW/iidXvdcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4MnErqj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4MnErqj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8090C2BCC7;
	Fri, 15 May 2026 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778852142;
	bh=nc5Orx7m54en1/8Sa4kUcm3InnfZ3JxI9Kv0RQTsun8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=W4MnErqjMTLtox5WKvV+Qq9Z6wVVZGOftZY4+36pGL/kLRTXFXtEChM8zmsvPbU0/
	 dWl4TiGwVh+1k1/TZSw6e8xf8fI7TldI+9c9VBe2XIf4rreiXG83u6bnbjbSof/MyI
	 uUA8uHli+y9Fmr7ni9J21KrNry4SCqO3fL0dzxLBu9YKAcezKduvs+2EHQnEEslW2A
	 XndxqpP9tTHw8P0/OC8ZHE0JQwgnfk9iq2yezoFSr4vnwDELpApwG1FugUvazmvotl
	 wMW4mPWfRzROJ93aPZaXTzeGHQI7m3eaugeHp+ePwLrw4w6uO/26CD2pw5xzQgZ5HM
	 xqKzE4BcO22Ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V7 06/11] iio: imu: inv_icm42607: Add Buffer support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515130018.237378-7-macroalpha82@gmail.com>
References: <20260515130018.237378-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 13:35:41 +0000
Message-Id: <20260515133541.B8090C2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Missing bounds check in `inv_icm42607_buffer_fifo_read` allows out=
-of-bounds slab memory read.
- [High] Unaligned memory access in `inv_icm42607_fifo_is_data_valid()` cau=
ses undefined behavior and alignment faults.
- [High] Software state desynchronization in `inv_icm42607_buffer_predisabl=
e` due to missing teardown on error paths.
- [Medium] Redundant and potentially destructive assignment logic in `inv_i=
cm42607_buffer_set_fifo_en` overwrites FIFO configuration.
- [Medium] Dead code for sleep delay in `inv_icm42607_buffer_postdisable` b=
ypasses required hardware power-down delays.
- [Low] The macro `INV_ICM42607_SENSOR_CONF_INIT` initializes more elements=
 than the struct contains.
--

commit b372db6e3728fbbbe2a3d28ca15a025d7cf101c5
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Buffer support for icm42607

This commit adds all FIFO parsing and reading functions to support the
inv_icm42607 hardware.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607.h b/drivers/iio/im=
u/inv_icm42607/inv_icm42607.h
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607.h
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
[ ... ]
> @@ -84,6 +88,7 @@ struct inv_icm42607_sensor_conf {
>  	int odr;
>  	int filter;
>  };
> +#define INV_ICM42607_SENSOR_CONF_INIT		{-1, -1, -1, -1}

This isn't a bug, but struct inv_icm42607_sensor_conf is defined with exact=
ly
three fields. Will initializing it with four values cause excess elements in
struct initializer compiler warnings?

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
[ ... ]
> +int inv_icm42607_buffer_set_fifo_en(struct inv_icm42607_state *st,
> +				    unsigned int fifo_en)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	/* update FIFO EN bits for accel and gyro */
> +	val =3D 0;
> +	if (fifo_en & INV_ICM42607_SENSOR_GYRO)
> +		val |=3D INV_ICM42607_FIFO_CONFIG1_MODE;
> +	if (fifo_en & INV_ICM42607_SENSOR_ACCEL)
> +		val |=3D INV_ICM42607_FIFO_CONFIG1_MODE;
> +	if (fifo_en & INV_ICM42607_SENSOR_TEMP)
> +		val |=3D INV_ICM42607_FIFO_CONFIG1_MODE;
> +
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_FIFO_CONFIG1, val);

Does writing 0 to the FIFO_CONFIG1 register here when fifo_en is empty
inadvertently overwrite the INV_ICM42607_FIFO_CONFIG1_BYPASS mode set
previously in inv_icm42607_buffer_predisable()?

Also, does setting the exact same mask (INV_ICM42607_FIFO_CONFIG1_MODE) for
all three sensors properly configure the hardware, or are distinct bits
expected here?

[ ... ]
> +static int inv_icm42607_buffer_predisable(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	/* set FIFO in bypass mode */
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_FIFO_CONFIG1,
> +			   INV_ICM42607_FIFO_CONFIG1_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	/* flush FIFO data */
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_SIGNAL_PATH_RESET,
> +			   INV_ICM42607_SIGNAL_PATH_RESET_FIFO_FLUSH);
> +	if (ret)
> +		return ret;
> +
> +	/* disable FIFO threshold interrupt */
> +	ret =3D regmap_update_bits(st->map, INV_ICM42607_REG_INT_SOURCE0,
> +				 INV_ICM42607_INT_SOURCE0_FIFO_THS_INT1_EN, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * FIFO should only be 1 at this point, so explicitly set it to 0
> +	 * instead of decrementing it.
> +	 */
> +	st->fifo.on =3D 0;
> +
> +	return 0;
> +}

If any of these regmap operations fail and return early, st->fifo.on remains
greater than 0. Since the IIO core continues the buffer teardown process ev=
en
if predisable returns an error, does this leave the software state permanen=
tly
desynchronized?=20

If so, future calls to inv_icm42607_buffer_postenable() might see st->fifo.=
on
as non-zero and silently skip initialization, leaving the device unresponsi=
ve
until the module is reloaded.

[ ... ]
> +static int inv_icm42607_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	struct device *dev =3D regmap_get_device(st->map);
> +	unsigned int sensor;
> +	unsigned int *watermark;
> +	unsigned int sleep_temp =3D 0;
> +	unsigned int sleep_sensor =3D 0;
> +	unsigned int sleep;
> +	int ret;
[ ... ]
> +	/* sleep maximum required time */
> +	sleep =3D max(sleep_sensor, sleep_temp);
> +	if (sleep)
> +		msleep(sleep);

Is there missing logic to update sleep_sensor and sleep_temp?

Since they are initialized to 0 and never changed, this sleep will never
occur. Could bypassing this hardware-specific power-down delay lead to issu=
es
when rapidly toggling power states?

[ ... ]
> +int inv_icm42607_buffer_fifo_read(struct inv_icm42607_state *st,
> +				  unsigned int max)
> +{
[ ... ]
> +	/* compute number of samples for each sensor */
> +	for (i =3D 0; i < st->fifo.count; i +=3D size) {
> +		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],
> +				&accel, &gyro, &temp, &timestamp);
> +		/* Make sure the size is at least 1 valid packet. */
> +		if (size < INV_ICM42607_FIFO_1SENSOR_PACKET_SIZE)
> +			break;
> +		if (gyro !=3D NULL && inv_icm42607_fifo_is_data_valid(gyro))
> +			st->fifo.nb.gyro++;
> +		if (accel !=3D NULL && inv_icm42607_fifo_is_data_valid(accel))
> +			st->fifo.nb.accel++;
> +		st->fifo.nb.total++;
> +	}

Can an incomplete partial packet at the end of the read result in size
extending past the valid populated data?=20

There is no validation to ensure that i + size <=3D st->fifo.count. If
st->fifo.count is near the maximum array size, could i + size exceed the
bounds of the st->fifo.data array, leading to an out-of-bounds memory read
in inv_icm42607_fifo_is_data_valid()?

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.h b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.h
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.h
[ ... ]
> +/* FIFO data packet */
> +struct inv_icm42607_fifo_sensor_data {
> +	__be16 x;
> +	__be16 y;
> +	__be16 z;
> +};
> +
> +#define INV_ICM42607_FIFO_DATA_INVALID		-32768
> +
> +static inline bool
> +inv_icm42607_fifo_is_data_valid(const struct inv_icm42607_fifo_sensor_da=
ta *s)
> +{
> +	s16 x, y, z;
> +
> +	x =3D be16_to_cpu(s->x);

Because the first field of the packet layout struct
(inv_icm42607_fifo_2sensors_packet) is a 1-byte header, the accel and gyro
fields reside at odd byte offsets.

Since struct inv_icm42607_fifo_sensor_data is not marked as __packed, the
compiler assumes 2-byte alignment for its __be16 fields. Will passing these
unaligned pointers into inv_icm42607_fifo_is_data_valid() trigger undefined
behavior and alignment faults on architectures that enforce strict alignmen=
t?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515130018.2373=
78-1-macroalpha82@gmail.com?part=3D6
