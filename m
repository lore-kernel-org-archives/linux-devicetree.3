Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4B93CBE69
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778355892; cv=none; b=Mq3cLCLpefVNHEdNju4m+IkZvodv5VXjNY0/3BEYs6wvAuIf6ZsEDHWHql9XUMSU42+NJaVx/HP+KnP2jlZWFCmjNmKgzzv0BmIBCb+H3KTgBSw/1UFUIbCU1rpZHCqAzoCFkyvsQOl4ZACT4G3TnZNCOF6Uv8RwE7c9ptTbXXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778355892; c=relaxed/simple;
	bh=BbKvTPhXoOjDiFS4A4lQuAFCWews5/6YYotzKPWy9KQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FVpncBFnneY6Sl8072kwld0t4EFPhDstGQp62fkLa+lQ3kGL56mjwz7rcCVmHwU73v45nXyn9yV0TkshaD5ok7/f5djEL+NXkZLC/L5GtDPZXgG1FL5pFyiP9sHUDuW0ef8Sz+cQGaEgn0L9rywBb7t02tF3MMMcKy7Mv0v1fF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDuy2hsH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDuy2hsH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82A1C2BCB2;
	Sat,  9 May 2026 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778355892;
	bh=BbKvTPhXoOjDiFS4A4lQuAFCWews5/6YYotzKPWy9KQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hDuy2hsH/XVGX7ZlGnwYH24oT1W7L1L7YyBYnzk61nAbLuNV1mltfQqmiceaCrUR5
	 V3uEeTREshVHxLsEpgLf+Vba3G8NVHAGhezPprexkub+n1NFdQlI4BzqnPHCRq4P2a
	 Qr/duYzKSSBE54oyosMJRQLsBHW0u/YN18ewSWvt31Lk+Up+0OJQm2YjBTAtK8cdVX
	 OlH1EnLjCuP2V7sjOkqsFMFNvmLESz7Y2XdKu53spZ468k4HZOw7BM3vhMgymqtJmp
	 2wJDwax3T03+tmfj6dye0BDo5cMtpgTd06+d1vdmq6Nskk34Xs2/icurGAVKzNKchJ
	 Hj7HlWVdiArag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 06/11] iio: imu: inv_icm42607: Add Buffer support for
 icm42607
Reply-To: sashiko@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509191907.24734-7-macroalpha82@gmail.com>
References: <20260509191907.24734-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 19:44:51 +0000
Message-Id: <20260509194451.E82A1C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] Uninitialized variable usage and kernel heap buffer overflow d=
uring FIFO read.
- [Critical] Uninitialized pointer dereference and infinite loop vulnerabil=
ity due to integer type mismatch.
- [High] Hardware FIFO stream corruption due to oversized register read.
- [High] Logic inversion completely breaks watermark truncation.
- [High] Integer underflow on internal state variable permanently disables =
the device on error rollback.
- [High] Race condition due to missing lock in `hwfifo_flush` callback.
- [High] Data corruption due to missing bounds check on partial hardware FI=
FO packets.
- [Medium] Missing hardware delays during buffer postdisable.
- [Medium] Watermark interrupt is leaked/permanently disabled on regmap err=
or path.
- [Medium] Ignored return value leads to silent failure during system resum=
e.
--

commit bdccadc0097311be50ac67b485f5dccd2b087eff
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Buffer support for icm42607

This commit adds FIFO parsing and reading functions to support buffer
transfers on the inv_icm42607 hardware.

diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_buffer.c
--- /dev/null
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
@@ -148,15 +148,12 @@
=20
 [ ... ]
=20
> +static unsigned int inv_icm42607_wm_truncate(unsigned int watermark,
> +					     size_t packet_size)
> +{
> +	size_t wm_size;
> +
> +	wm_size =3D watermark * packet_size;
> +	wm_size =3D max(wm_size, INV_ICM42607_FIFO_WATERMARK_MAX);

Is this max() intentional? It forces the watermark to always be greater
than or equal to the maximum hardware limit. Should this be min() instead?

> +
> +	return wm_size / packet_size;
> +}
> +
> +/**
> + * inv_icm42607_buffer_update_watermark - update watermark FIFO threshold

[ ... ]

> +	/* changing FIFO watermark requires to turn off watermark interrupt */
> +	ret =3D regmap_update_bits_check(st->map, INV_ICM42607_REG_INT_SOURCE0,
> +				       INV_ICM42607_INT_SOURCE0_FIFO_THS_INT1_EN,
> +				       0, &restore);
> +	if (ret)
> +		return ret;
> +
> +	/* compute watermark value in bytes */
> +	wm_size =3D watermark * packet_size;
> +	raw_wm =3D INV_ICM42607_FIFO_WATERMARK_VAL(wm_size);
> +	memcpy(st->buffer, &raw_wm, sizeof(raw_wm));
> +	ret =3D regmap_bulk_write(st->map, INV_ICM42607_REG_FIFO_CONFIG2,
> +				st->buffer, sizeof(raw_wm));
> +	if (ret)
> +		return ret;

If this regmap_bulk_write() fails, the function returns immediately without
restoring the interrupt. Could this leave the watermark interrupt permanent=
ly
disabled?

> +
> +	/* restore watermark interrupt */
> +	if (restore) {
> +		ret =3D regmap_update_bits(st->map, INV_ICM42607_REG_INT_SOURCE0,
> +					 INV_ICM42607_INT_SOURCE0_FIFO_THS_INT1_EN,
> +					 INV_ICM42607_INT_SOURCE0_FIFO_THS_INT1_EN);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int inv_icm42607_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	if (st->fifo.on > 1) {
> +		st->fifo.on--;
> +		return 0;
> +	}
> +
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
> +	st->fifo.on--;

If inv_icm42607_buffer_postenable() fails early before incrementing
st->fifo.on, and the IIO core rolls back by calling this predisable
function, st->fifo.on would be 0 here. Since it is unsigned, could this
decrement cause it to underflow to UINT_MAX, leaving the device permanently
disabled for future calls?

> +
> +	return 0;
> +}
> +
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

> +	*watermark =3D 0;
> +	ret =3D inv_icm42607_buffer_update_watermark(st);
> +	if (ret)
> +		goto out_unlock;
> +
> +out_unlock:
> +	mutex_unlock(&st->lock);
> +
> +	/* sleep maximum required time */
> +	sleep =3D max(sleep_sensor, sleep_temp);
> +	if (sleep)
> +		msleep(sleep);

Both sleep_temp and sleep_sensor are initialized to 0 and never modified
before this check. Does this mean the required hardware shutdown
power-transition delays are skipped completely?

[ ... ]

> +int inv_icm42607_buffer_fifo_read(struct inv_icm42607_state *st,
> +				  unsigned int max)
> +{
> +	const void *accel, *gyro, *timestamp;
> +	size_t i, max_count, size;
> +	const s8 *temp;
> +	int ret;
> +
> +	/* reset all samples counters */
> +	st->fifo.count =3D 0;
> +	st->fifo.nb.gyro =3D 0;
> +	st->fifo.nb.accel =3D 0;
> +	st->fifo.nb.total =3D 0;
> +
> +	/* compute maximum FIFO read size */
> +	if (max =3D=3D 0)
> +		max_count =3D sizeof(st->fifo.data);
> +	else
> +		max_count =3D clamp(max_count,
> +				  (max * inv_icm42607_get_packet_size(st->fifo.en)),
> +				  sizeof(st->fifo.data));

If max !=3D 0, max_count is passed uninitialized to clamp(). Could this lead
to undefined behavior?

> +
> +	/* read FIFO count value */
> +	ret =3D regmap_bulk_read(st->map, INV_ICM42607_REG_FIFO_COUNTH,
> +			       st->buffer, sizeof(st->buffer));

Is it safe to use sizeof(st->buffer) here? st->buffer is declared as an
array of 3 __be16 elements (6 bytes). The hardware FIFO count register is 2
bytes, so a 6-byte read would spill over into the adjacent FIFO_DATA
registers, unintentionally popping 4 bytes of data and breaking alignment.

> +	if (ret)
> +		return ret;
> +	st->fifo.count =3D be16_to_cpup(st->buffer);
> +
> +	/* check and clamp FIFO count value */
> +	if (st->fifo.count =3D=3D 0)
> +		return 0;
> +
> +	st->fifo.count =3D max(st->fifo.count, max_count);

Should this be min() instead of max()? Using max() forces the count to be
at least the potentially uninitialized max_count value. This could cause
regmap_noinc_read() to read past the hardware count and overflow the
st->fifo.data buffer.

> +
> +	/* read all FIFO data in internal buffer */
> +	ret =3D regmap_noinc_read(st->map, INV_ICM42607_REG_FIFO_DATA,
> +				st->fifo.data, st->fifo.count);
> +	if (ret)
> +		return ret;
> +
> +	/* compute number of samples for each sensor */
> +	for (i =3D 0; i < st->fifo.count; i +=3D size) {
> +		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],
> +				&accel, &gyro, &temp, &timestamp);
> +		if (size <=3D 0)
> +			break;

inv_icm42607_fifo_decode_packet() returns a ssize_t which can be -EINVAL.
Since size is of type size_t, the negative error code becomes a huge
unsigned integer. The size <=3D 0 check will evaluate to false, skipping
error handling.

Since decode_packet() does not initialize accel and gyro on error, could
this result in dereferencing uninitialized pointers below?

Also, if the hardware returns a byte count that ends with a partial packet,
could this loop access memory beyond what was populated from the hardware
since there is no check for i + size > st->fifo.count?

> +		if (gyro !=3D NULL && inv_icm42607_fifo_is_data_valid(gyro))
> +			st->fifo.nb.gyro++;
> +		if (accel !=3D NULL && inv_icm42607_fifo_is_data_valid(accel))
> +			st->fifo.nb.accel++;
> +		st->fifo.nb.total++;
> +	}
> +
> +	return 0;
> +}
> +
> +int inv_icm42607_buffer_hwfifo_flush(struct inv_icm42607_state *st,
> +				     unsigned int count)
> +{
> +	s64 gyro_ts, accel_ts;
> +	int ret;
> +
> +	gyro_ts =3D iio_get_time_ns(st->indio_gyro);
> +	accel_ts =3D iio_get_time_ns(st->indio_accel);

These timestamps appear to be unused. Should they be passed to the buffer
logic or are they just dead code?

> +
> +	ret =3D inv_icm42607_buffer_fifo_read(st, count);

Does this need to be protected by mutex_lock(&st->lock)? Since this
callback can be triggered via sysfs concurrently with the normal interrupt
handler, it seems possible to have interleaved regmap reads or corrupted
internal FIFO sample counters.

> +
> +	return ret;
> +}

diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/iio=
/imu/inv_icm42607/inv_icm42607_core.c
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
@@ -404,8 +404,11 @@
 	if (ret)
 		return ret;
=20
-	/* Nothing else to restore at this time. */
+	if (st->fifo.on) {
+		ret =3D regmap_write(st->map, INV_ICM42607_REG_FIFO_CONFIG1,
+				   INV_ICM42607_FIFO_CONFIG1_MODE);
+	}
=20
 	return 0;
 }

Is the return value from regmap_write() meant to be checked? Currently, ret
is assigned but not used, so the function unconditionally returns 0 even if
the write fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509191907.2473=
4-1-macroalpha82@gmail.com?part=3D6
