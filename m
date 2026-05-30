Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C752628D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 04:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780114941; cv=none; b=Iyeqeci+ZVo70qTwbw1K65ihQ4xqPoZ3+ErnfvJwEsMVOrQGRSgIUr6ftDwdcmab0PTuiqV0QMg+CRK7JfZMpqDnQk+0qFopTIJb0quDZRogrBa/TJKA/xTLJT8tctXft/XW/vLcC1fQcCJmmoYFwH/9c2DDJTYqC6e2bzhzI6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780114941; c=relaxed/simple;
	bh=oOpx6lnjO8FOmhmHhZ/sJMr8NfHFF3hKR9DJiZx/FCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Htyh9JQ01cR5N1/MZj/CGo5VA+FEgMgMBEUrG6j6Nih13Z9jDzPk/FfcEEFhHdmvkkhbA+3IaP20kURQfS+ZUix475QKA5r9vnz3SYADRQu2qk3xK/u+zzy9CzUQw4RoOjkpc4bG+CvX/4F9duuDlvnklfs911T3XNdjKOACmtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAo5bHak; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAo5bHak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85841F00893;
	Sat, 30 May 2026 04:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780114939;
	bh=UIVW1XIaF8Ey4uHvcL4bUk0srNy/Gg9ZfhCQ/Uq0TeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TAo5bHakMUN7PrU/L3WV3xH7EHTZ8sA/uBQVZAdPp4MzkhOq+FnjBH/ksKK4GlenU
	 59YlL6MYcB8Se45Zi3gHU7q+PC57XHItbsyL4M7kOh6sWNlmEOPiZL/jZf6pgvn2Fc
	 Dcm5B/lqxWRb6HicO6gcC2Izvz0ri6pb3cpogvJA090AgzwUcRKC83IYGHvgOTkWDK
	 RZ4JF1hWsxhoota3DuaO9Mg/71Ceacc52G/lkhhbnaDeS0ec3SdSYOHocxdj0NmfgP
	 YrcLSBoTtsgN34aRFvg7JOU2omxq5fyqhZBXMZ2gEwHMJnscKthQE3yJuJ4H8223ZT
	 Jrqsrz+iAvlDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 08/11] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260530031739.109063-9-macroalpha82@gmail.com>
References: <20260530031739.109063-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 04:22:19 +0000
Message-Id: <20260530042219.B85841F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Concurrency bug and data race in FIFO flush and parsing sequence d=
ue to split locking.
- [High] Self-deadlock in system PM sleep callbacks due to recursive mutex =
acquisition.
- [High] Unaligned memory access exception caused by casting a misaligned p=
acked structure member.
--

commit 60c8a604221a1456a1b6206c583d1e17204ce235
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607

Add icm42607 accelerometer sensor for icm42607.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> new file mode 100644
> index 0000000000000..43edc2923d048
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c

[ ... ]

> +int inv_icm42607_accel_parse_fifo(struct iio_dev *indio_dev)
> +{

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
> +		if (i + size > st->fifo.count)
> +			return -EIO;
> +
> +		/* skip packet if no accel data or data is invalid */
> +		if (accel =3D=3D NULL || !inv_icm42607_fifo_is_data_valid(accel))

[Severity: High]
Will this cause an unaligned memory access trap on architectures with
strict alignment requirements?

The accel pointer is populated by inv_icm42607_fifo_decode_packet() which
returns the address of pack1->data. Because pack1 is a packed structure
with a 1-byte header, the pack1->data pointer sits at an odd address.

When inv_icm42607_fifo_is_data_valid() casts this misaligned pointer to a
non-packed structure and accesses 16-bit members via be16_to_cpu(), it
could trigger a hardware fault.

> +			continue;

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> index e065d60ac1197..5b69bf895b350 100644
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

[Severity: High]
Is it safe to access st->fifo.nb and update the timestamp locklessly here?

The preceding call to inv_icm42607_buffer_fifo_read() acquires and then
releases st->lock via a scoped guard before returning. Because the lock
is dropped, a concurrent sysfs hwfifo_flush or IRQ handler could interleave
here and overwrite st->fifo.data and st->fifo.nb before they are parsed,
leading to a data race and corrupted timestamp calculations.

> +		ret =3D inv_icm42607_accel_parse_fifo(st->indio_accel);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index cf9d0c6f3f4b8..6b623fb679f34 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> @@ -383,6 +444,8 @@ static int inv_icm42607_suspend(struct device *dev)
> =20
>  	guard(mutex)(&st->lock);
> =20
> +	st->suspended.accel =3D st->conf.accel.mode;
> +	st->suspended.temp =3D st->conf.temp_en;
>  	if (pm_runtime_suspended(dev))
>  		return 0;

[Severity: High]
Could this lead to a self-deadlock?

We acquire st->lock via the scoped guard at the top of=20
inv_icm42607_suspend(). Shortly after this snippet, the function calls=20
pm_runtime_force_suspend() which synchronously executes the driver's=20
runtime PM suspend callback.

If the runtime suspend callback also attempts to acquire st->lock, it will
deadlock since the mutex is not recursive. The same locking structure is
present in inv_icm42607_resume() with pm_runtime_force_resume().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530031739.1090=
63-1-macroalpha82@gmail.com?part=3D8
