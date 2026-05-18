Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57FA171BB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779137625; cv=none; b=OkByL/MD94bSAkh0F6y1t0Qq6xEy/+z9LIB8H7hIF66INlSkCxcaLWPmItce5l2Zm+kXlt/NFbPDLedNhmdcC+rM09q1U5/1cwSBLcI4z9I1IzK8KYQHjZpb1RrHiqkIpYjZIA1nI8abhTRVFAdu4ENjYY7CM9VEN6S/U5xdwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779137625; c=relaxed/simple;
	bh=ebWReMvD97ZybmvDhUmHC4V91osP4iw9EvH+4wZsECw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vc5syUub+/itJIjOLQxBe6jtIRIRCF5jPFAdQI2gLH/hG9av3+xG26qZkcwvkrw7O0r0WXvMch7wsnDCnij0s/S2NIGzQ8bLMnUgGpWWU1XzBjgJszJEaUv+9lU2ermGbet8kbVOJekpvaf1NRM6ScDNO4YKJShTZQsTt+1hZ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1uVyvl/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1uVyvl/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F107C2BCB7;
	Mon, 18 May 2026 20:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779137625;
	bh=ebWReMvD97ZybmvDhUmHC4V91osP4iw9EvH+4wZsECw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=i1uVyvl/tSOOngdYJnb92wvLQwhAPIa6OT/vQ2KSu/qBwg4U06iMLDti0pgSoGAg0
	 vNp/JVMstgyT9EnwD7caKpG5w57hHmGrL2m0+M3yDFZujzaRskmPC1O0rn0BRn7QQU
	 PzYiaZEokI67FMzFCm8XfskxH8uZ0Po/2cnvfUkOFLCgkiKN4xpJUOktl3f0b0ZSUy
	 dFNU8WuIgXbQahnOeIOhgwEMMDXHvxwN6ZIPSuIe8r8JCjhcVY96uhFlnrUnaS5HRm
	 9rzp/IwX3I+GDueVnz6w2Na5e3NaXVnxY+zD41gCmkF31+XaVnKX1r2npyDrxtIEZv
	 nZF+eWxlvbqqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V8 08/10] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518200526.458421-9-macroalpha82@gmail.com>
References: <20260518200526.458421-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 20:53:44 +0000
Message-Id: <20260518205345.4F107C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Data race on shared hardware FIFO state resulting in data loss and=
 duplication.
- [High] Hardware interrupt is never requested, rendering FIFO watermark in=
terrupts unhandled.
- [Medium] Uninitialized array padding exposed to userspace as valid availa=
ble sampling frequencies.
- [Medium] Incorrect system wakeup configuration for the logical IIO device.
- [Low] Semantic mismatch using Low-Power filter enum while the sensor is p=
laced in Low-Noise mode.
- [Low] Lockless reads of shared configuration state in sysfs read handlers.
--

commit 084a1e35ff43644b9bd6bf8af6b8015a9b6bcef4
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607

Add icm42607 accelerometer sensor for icm42607.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> new file mode 100644
> index 0000000000000..623d607046091
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
[ ... ]
> +static int inv_icm42607_accel_read_odr(struct inv_icm42607_state *st,
> +				       int *val, int *val2)
> +{
> +	unsigned int odr;
> +	unsigned int i;
> +
> +	odr =3D st->conf.accel.odr;

Is it safe to read st->conf.accel.odr here without holding st->lock?

Since sysfs reads and writes for IIO_CHAN_INFO_SAMP_FREQ are not synchroniz=
ed
by the direct mode lock, could this race with a concurrent write mutating
st->conf?

[ ... ]
> +static int inv_icm42607_accel_read_avail(struct iio_dev *indio_dev,
> +					 struct iio_chan_spec const *chan,
> +					 const int **vals,
> +					 int *type, int *length, long mask)
> +{
[ ... ]
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*vals =3D (const int *)inv_icm42607_accel_odr;
> +		*type =3D IIO_VAL_INT_PLUS_MICRO;
> +		*length =3D ARRAY_SIZE(inv_icm42607_accel_odr) * 2;
> +		return IIO_AVAIL_LIST;

Since inv_icm42607_accel_odr uses designated initializers starting at index=
 5,
elements 0 through 4 are implicitly zero-initialized.=20

Will returning the entire array size here expose these uninitialized elemen=
ts
as valid 0 Hz sampling frequencies to userspace?

[ ... ]
> +struct iio_dev *inv_icm42607_accel_init(struct inv_icm42607_state *st)
> +{
[ ... ]
> +	accel_st->power_mode =3D INV_ICM42607_SENSOR_MODE_LOW_NOISE;
> +	accel_st->filter =3D INV_ICM42607_FILTER_AVG_16X;

This isn't a bug, but FILTER_AVG values are intended for low-power mode
averaging. Since the sensor is set to INV_ICM42607_SENSOR_MODE_LOW_NOISE,
inv_icm42607_set_accel_conf() will apply this value to the bandwidth filter
mask instead.=20

Is it intentional to use an averaging enum to configure a bandwidth registe=
r?

[ ... ]
> +	/* accel events are wakeup capable */
> +	ret =3D devm_device_init_wakeup(&indio_dev->dev);

Should this target the physical hardware device (regmap_get_device(st->map))
instead of the logical IIO device?

The PM subsystem relies on the physical device that owns the IRQ line to arm
the wakeup interrupt during system suspend. Additionally,
inv_icm42607_suspend() unconditionally sets INV_ICM42607_SENSOR_MODE_OFF.=20

Will this prevent hardware wake-on-motion events from occurring?

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> index a011f1f728b98..0e723a7dd5623 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
[ ... ]
>  int inv_icm42607_buffer_hwfifo_flush(struct inv_icm42607_state *st,
>  				     unsigned int count)
>  {
> +	struct inv_icm42607_sensor_state *accel_st =3D iio_priv(st->indio_accel=
);
> +	struct inv_sensors_timestamp *ts;
> +	s64 accel_ts;
>  	int ret;
> =20
> +	accel_ts =3D iio_get_time_ns(st->indio_accel);
> =20
>  	ret =3D inv_icm42607_buffer_fifo_read(st, count);
> +	if (ret)
> +		return ret;
> =20
> -	return ret;
> +	if (st->fifo.nb.total =3D=3D 0)
> +		return 0;
> +
> +	if (st->fifo.nb.accel > 0) {
> +		ts =3D &accel_st->ts;
> +		inv_sensors_timestamp_interrupt(ts, st->fifo.nb.accel, accel_ts);
> +		ret =3D inv_icm42607_accel_parse_fifo(st->indio_accel);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }

Since both inv_icm42607_buffer_fifo_read() and inv_icm42607_accel_parse_fif=
o()
acquire and release st->lock internally, the mutex is dropped between readi=
ng
the hardware FIFO and parsing it.

If another sysfs hwfifo_flush executes concurrently for the gyroscope devic=
e,
could it overwrite st->fifo.data and reset st->fifo.nb while the lock is
dropped?

If so, this might cause the resumed thread to parse overwritten data with
stale counters, potentially leading to data loss or corrupted timestamps.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 5d9155e4c41f9..4bbcbbe8905f4 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -379,6 +435,11 @@ int inv_icm42607_core_probe(struct regmap *regmap, c=
onst struct inv_icm42607_hw
>  	pm_runtime_set_autosuspend_delay(dev, INV_ICM42607_SUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(dev);
> =20
> +	/* Initialize IIO device for Accel */
> +	st->indio_accel =3D inv_icm42607_accel_init(st);
> +	if (IS_ERR(st->indio_accel))
> +		return PTR_ERR(st->indio_accel);
> +
>  	return 0;
>  }

The driver configures hardware watermark interrupts and retrieves the INT1
irq line via fwnode_irq_get_byname() during probe, but I don't see a call to
devm_request_threaded_irq() being added.

Does the lack of an interrupt handler prevent the driver from automatically
draining the FIFO and leave the newly added inv_icm42607_buffer_fifo_parse()
routine unhandled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518200526.4584=
21-1-macroalpha82@gmail.com?part=3D8
