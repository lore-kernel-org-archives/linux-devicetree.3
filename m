Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473E322B72
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852068; cv=none; b=SQ4Z4QcGJD6O1rbC/bKtebhsPiWxKaA3nkIP7w6juzU3QXTYDs45VWbj+GMBnBMgBgG3SCPNjddn34+d2dNleHxuPJs3BDckfCa4JteUvxiRwoZpiNSG4R1n5BPhuL869KV23JlTLOPEjvECDmhZHXb/XWJNjwXli7DmuW2DAU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852068; c=relaxed/simple;
	bh=zBMVqPuV0eCvurcoLUCY/bCLK4EOiOhNiBeHwSFTSss=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TJcpzhnq8cVTi246OuaFSTs8bMDECOm83bFOz+tiUdJ+0EXo0NWgOZKjzJriL4obwtPi3OafbXG86Yx0Sqc123XRtzytT0/yOJCRR7E15TdzcuyxwXpLgfoRHqu27WM7FX5SI8KWhTZ4ZapzcPkyvjdnmbjQh3H1U9XVbFZwRMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMg7ik+l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMg7ik+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE29C2BCF5;
	Fri, 15 May 2026 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778852068;
	bh=zBMVqPuV0eCvurcoLUCY/bCLK4EOiOhNiBeHwSFTSss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XMg7ik+lSSu1onWoNBGxXBM6kJ6vJIsmaDV3QG9M7j4STk+m9kiyul1BKYOkX5q/x
	 9zY+Z6AqYfkGWHL6BVj49Gmw/Cc5zJk1CzcVKaOwcBOpUmcDWV6kmT0H6hpKRxNZ/L
	 OdKTopUcNJwW84cJfxnNjxnsoLvBITu3xu9IDo6RD6CTwnMmSMuRFIscJifnppQMDq
	 He4By33XabTEGtX2kE5Or2l5ngAf1Vk4RmauIcZARkeEArHYGEGT03aOzuSNgkmuC0
	 vGWWqd/YOTGfCxbW+iFWXubNG5WhYiOPMIZ+LQcnY8vGfvHuO9bGdeoee+6+rCTwdg
	 bioYnyB6nmvTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V7 08/11] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515130018.237378-9-macroalpha82@gmail.com>
References: <20260515130018.237378-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 13:34:26 +0000
Message-Id: <20260515133428.0BE29C2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Reversed bounds check in FIFO parser causes valid packets to be dr=
opped and out-of-bounds reads
- [High] Unprotected lockless access to shared FIFO state leads to data rac=
es and corruption
- [High] Missing packet bounds check in `inv_icm42607_buffer_fifo_read` all=
ows out-of-bounds memory access
- [High] Unsupported TEMP-only scan mask causes silent data drops and users=
pace deadlock
- [Medium] Reserved array elements exposed as zeroed sampling frequencies i=
n userspace
--

commit 7b72703c452d419fa91a97227176f51c49a6b7cb
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607
   =20
This commit adds accelerometer sensor support to the icm42607 driver. It
introduces device configuration, power management, timestamp handling, and =
data
parsing from the hardware FIFO. It also exposes available sampling frequenc=
ies
and scales to userspace.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> new file mode 100644
> index 0000000000000..b354a84fd2ed4
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
[ ... ]
> +static const unsigned long inv_icm42607_accel_scan_masks[] =3D {
> +	INV_ICM42607_SCAN_MASK_ACCEL_3AXIS,
> +	INV_ICM42607_SCAN_MASK_TEMP,
> +	INV_ICM42607_SCAN_MASK_ACCEL_3AXIS | INV_ICM42607_SCAN_MASK_TEMP,
> +	0
> +};

Does offering INV_ICM42607_SCAN_MASK_TEMP by itself cause issues? If usersp=
ace=20
requests only the temperature channel, inv_icm42607_accel_update_scan_mode(=
)=20
enables only the TEMP sensor. If the hardware generates packets without ACC=
EL=20
or GYRO headers, inv_icm42607_fifo_decode_packet() returns -EINVAL.=20

Even if it generates an ACCEL packet, inv_icm42607_accel_parse_fifo() expli=
citly
discards packets lacking accelerometer data. Would this cause the TEMP data=
 to be
silently dropped, potentially leaving userspace applications deadlocked wai=
ting
for data?

[ ... ]
> +static int inv_icm42607_accel_read_avail(struct iio_dev *indio_dev,
> +					 struct iio_chan_spec const *chan,
> +					 const int **vals,
> +					 int *type, int *length, long mask)
> +{
> +	if (chan->type !=3D IIO_ACCEL)
> +		return -EINVAL;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		*vals =3D (const int *)inv_icm42607_accel_scale_nano;
> +		*type =3D IIO_VAL_INT_PLUS_NANO;
> +		*length =3D ARRAY_SIZE(inv_icm42607_accel_scale_nano) * 2;
> +		return IIO_AVAIL_LIST;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*vals =3D (const int *)inv_icm42607_accel_odr;
> +		*type =3D IIO_VAL_INT_PLUS_MICRO;
> +		*length =3D ARRAY_SIZE(inv_icm42607_accel_odr) * 2;
> +		return IIO_AVAIL_LIST;

Can this expose uninitialized array elements to userspace? Because=20
inv_icm42607_accel_odr has indices 0-5 reserved and implicitly initialized =
to=20
zero, passing the full ARRAY_SIZE() could expose those 0.000000 sampling=20
frequencies as available to userspace.

[ ... ]
> +	/* parse all fifo packets */
> +	for (i =3D 0, no =3D 0; i < st->fifo.count; i +=3D size, ++no) {
> +		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],
> +				&accel, &gyro, &temp, &timestamp, &odr);
> +		/* quit if error or FIFO is empty */
> +		if (size <=3D 0)
> +			return size;
> +
> +		/* If the packet size could cause us to overflow, return. */
> +		if (i + size <=3D st->fifo.count)
> +			return -EIO;

Is this condition reversed? If i + size <=3D st->fifo.count, the packet fit=
s=20
within the valid buffer limit, but the parser returns -EIO and valid packet=
s=20
are dropped. Conversely, if the packet exceeds the buffer boundaries=20
(i + size > st->fifo.count), it evaluates to false, allowing the parser to=
=20
read out-of-bounds kernel memory.

> +
> +		/* skip packet if no accel data or data is invalid */
> +		if (accel =3D=3D NULL || !inv_icm42607_fifo_is_data_valid(accel))
> +			continue;
[ ... ]
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> index 74e5213d92671..4371f428cc3f8 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c
[ ... ]
> @@ -440,7 +460,7 @@ int inv_icm42607_buffer_fifo_read(struct inv_icm42607=
_state *st,
>  	/* compute number of samples for each sensor */
>  	for (i =3D 0; i < st->fifo.count; i +=3D size) {
>  		size =3D inv_icm42607_fifo_decode_packet(&st->fifo.data[i],
> -				&accel, &gyro, &temp, &timestamp);
> +				&accel, &gyro, &temp, &timestamp, &odr);
>  		/* Make sure the size is at least 1 valid packet. */
>  		if (size < INV_ICM42607_FIFO_1SENSOR_PACKET_SIZE)
>  			break;

Could this code access memory out-of-bounds? If the hardware returns a=20
partial packet at the very end of the st->fifo.data array, the loop does no=
t=20
verify that i + size <=3D st->fifo.count before passing the decoded pointer=
s.=20
inv_icm42607_fifo_decode_packet() could then yield pointers that point=20
outside the populated bounds, which inv_icm42607_fifo_is_data_valid() would=
=20
subsequently dereference.

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
> +
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

Can a data race happen here? inv_icm42607_buffer_fifo_read() properly=20
acquires and releases st->lock, but then inv_icm42607_accel_parse_fifo() is=
=20
called without holding the lock. A concurrent flush operation could acquire=
=20
the lock, overwrite st->fifo.data, and reset st->fifo.count while the=20
original thread is mid-parse, leading to memory corruption and out-of-bound=
s=20
reads.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515130018.2373=
78-1-macroalpha82@gmail.com?part=3D8
