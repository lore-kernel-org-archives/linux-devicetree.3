Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC52B3C3448
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778739314; cv=none; b=aaj+11VGQjJyQrM/smhg1yoJ+5TOBQGlM5PNbZV4pk76Zf8kjJ+wE0krrhr0xXKRpoIIpIe0ckHyFajvP5H1EUMG7ZNLZb9crVmkJKlcrlWhcea+zHD4GdxAsH/wAWvRBXgeNOjgIJ+63dL3tyqPqr6mknM6T8PV9/FU8kShOYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778739314; c=relaxed/simple;
	bh=tLSBjYRPDcYoDmcsO79mTbXnbwMydT46Nx1xvUN8H54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q93Um3qF6v/YRhzOGBVVxEgv2Xr0FYsbSrzlWU+1q7GPm/O3JTRFfzdBM6WWdhbTWFob4JclxDxBPqOWbWjLwaHgJ6TD9NkrRLjCOUaBxU1l7TM6007P+P8J6KqilmD2QsrJJWgGqMeceoe5ZzGJAUzlzDUYi73phlQYKdAw5rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4OlIPG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4OlIPG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E30C2BCB7;
	Thu, 14 May 2026 06:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778739314;
	bh=tLSBjYRPDcYoDmcsO79mTbXnbwMydT46Nx1xvUN8H54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=R4OlIPG6pBhY+Q4n4xseXJueprMSnhw+Z/Ax8Q2nwR0sMkY5E/iazOrBgCN/RgZd5
	 0mwcovtuTvj2GNHheiRGL/Lk+o7SRnqQ+fb1OlaAu3SaVisywsZRG4VH2jkY5KcT/w
	 fWc708RvK7q/JwRjSH/cVbvcjow1jCg1jzW7nZbKulxvRDC5HQTZRNQtCZuo+1Fa1b
	 Zcb466EQNcHSHSaN3caUSW/AIORwGEuKeX9Ecx5vNkoaHcyao/RKIKyzGakSjifAkR
	 8jEgBq2zwy6uEFuKpr/SfJyBPROeeBH2eZI1kcz5v8Gm/UaYTffcHcbaKl8sue26qM
	 youu37/r9immA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 08/11] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512221634.256747-9-macroalpha82@gmail.com>
References: <20260512221634.256747-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 06:15:13 +0000
Message-Id: <20260514061514.37E30C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Uninitialized variable `size` used in loop condition and incor=
rect bounds checking leads to undefined behavior and out-of-bounds reads.
- [High] Self-deadlock on `st->lock` during hardware FIFO flush.
- [High] NULL pointer dereference of `st->indio_gyro` during hardware FIFO =
flush.
- [High] Missing PM runtime acquisition in sysfs callbacks.
- [High] IIO device registration race condition leading to NULL pointer der=
eference.
- [High] 3-byte regmap read corrupts hardware FIFO stream.
--

commit 965b05f7b7791892c50d261d2a071baceb950c47
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607
   =20
Add icm42607 accelerometer sensor for icm42607.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> new file mode 100644
> index 0000000000000..06f2126af22a8
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c

[ ... ]

> +static int inv_icm42607_accel_hwfifo_set_watermark(struct iio_dev *indio=
_dev,
> +						   unsigned int val)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +
> +	guard(mutex)(&st->lock);
> +
> +	st->fifo.watermark.accel =3D val;
> +	return inv_icm42607_buffer_update_watermark(st);
> +}

Does this callback need to acquire a power management reference (via
PM_RUNTIME_ACQUIRE_AUTOSUSPEND) before updating hardware registers? Since t=
he
runtime suspend callback turns off the sensor, accessing registers here
could result in bus lockups or dropped writes.

[ ... ]

> +static int inv_icm42607_accel_hwfifo_flush(struct iio_dev *indio_dev,
> +					   unsigned int count)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	int ret;
> +
> +	if (count =3D=3D 0)
> +		return 0;
> +
> +	/* Make sure we don't try to count more than the buffer can hold. */
> +	count =3D min(count, sizeof(st->fifo.data));
> +
> +	guard(mutex)(&st->lock);

Similarly, should this callback acquire a power management reference
before communicating with the hardware to avoid timeouts?

> +	ret =3D inv_icm42607_buffer_hwfifo_flush(st, count);

Will this result in a self-deadlock? The guard(mutex) above acquires
st->lock, but inv_icm42607_buffer_hwfifo_flush() calls
inv_icm42607_buffer_fifo_read(), which unconditionally attempts to
acquire st->lock again.

[ ... ]

> +struct iio_dev *inv_icm42607_accel_init(struct inv_icm42607_state *st)
> +{

[ ... ]

> +	ret =3D devm_iio_device_register(dev, indio_dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return indio_dev;
> +}

Does calling devm_iio_device_register() here expose the IIO device to
userspace before st->indio_accel is assigned in inv_icm42607_core_probe()?

If userspace triggers a hardware FIFO flush in this window, it seems this
would lead to a NULL pointer dereference when accessing st->indio_accel.

[ ... ]

> +int inv_icm42607_accel_parse_fifo(struct iio_dev *indio_dev)
> +{

[ ... ]

> +	ssize_t i, size;
> +	unsigned int no;
> +	const void *accel, *gyro, *timestamp;
> +	const int8_t *temp;
> +	unsigned int odr;
> +	int64_t ts_val;
> +	struct inv_icm42607_accel_buffer buffer =3D { };
> +
> +	/* parse all fifo packets */
> +	for (i =3D 0, no =3D 0; i < st->fifo.count && i + size > st->fifo.count;
> +	     i +=3D size, ++no) {

Is the size variable uninitialized on the first iteration of this loop?

If the garbage value happens to be small, could the inverted loop condition
(using > instead of <=3D) cause the loop to exit immediately or lead to
out-of-bounds heap memory reads when parsing the data?

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> index 0919b4241241a..42a3211a1dfb8 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c

[ ... ]

> @@ -440,7 +460,7 @@ int inv_icm42607_buffer_fifo_read(struct inv_icm42607=
_state *st,
>  	/* compute number of samples for each sensor */
>  	for (i =3D 0; i < st->fifo.count && i + size > st->fifo.count; i +=3D s=
ize) {
>  		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],
> -				&accel, &gyro, &temp, &timestamp);
> +				&accel, &gyro, &temp, &timestamp, &odr);

As mentioned above, could the uninitialized size variable and inverted
loop condition cause out-of-bounds reads here as well?

Also, does reading the FIFO count earlier in this function with a 3-byte
regmap bulk read at INV_ICM42607_REG_FIFO_COUNTH inadvertently pop a byte
from the FIFO_DATA register? It seems this might misalign the subsequent
read and corrupt the stream. I realize this wasn't introduced in this patch,
but wanted to point it out.

[ ... ]

>  int inv_icm42607_buffer_hwfifo_flush(struct inv_icm42607_state *st,
>  				     unsigned int count)
>  {
> +	struct inv_icm42607_sensor_state *accel_st =3D iio_priv(st->indio_accel=
);
> +	struct inv_sensors_timestamp *ts;
>  	s64 gyro_ts, accel_ts;
>  	int ret;
> =20
>  	gyro_ts =3D iio_get_time_ns(st->indio_gyro);

Will passing st->indio_gyro to iio_get_time_ns() cause a panic here?

It appears st->indio_gyro is not initialized in this patch and remains NULL.
I understand this is fixed later in the patch series, but could this break
git bisect?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512221634.2567=
47-1-macroalpha82@gmail.com?part=3D8
