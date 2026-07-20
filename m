Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C005E3CAA5F
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579952; cv=none; b=MHj6omMz4XbbIdyVaQ93nW4vQY772ejBU0t5gOJNB5ezyIGS9GzGNG7e5VpNWHjrrL2KbanH1tcDAE7iwpXUWBt5Ig+GwEwZowiDIjFjsFmfyQZnUlLYIxaovf7NZFwh4xsoXan3aX1ss4Lt/8ogDmSu+K7Y1EqO8FqCAtghYeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579952; c=relaxed/simple;
	bh=/8EINSfQhoZP3zz7+XvoO0aR0faVbSEhVivD2EKgbpw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rJtFpTDaxINqrf32hKVS/z+hVODI4k72MbYjtyrLtwtx2ixMLqWdKEn1+P4C4n2QVLFbQ1C9tTCqyiSRBk5g8EJxq+DJGPKhkYLIJd8k7ee5YEpShFZCM1tk7nzCGQjgB6YzQAlSMuvj2e2vKfdp8PsAfsB/jor1OH9sx7wJAss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COpJNH+n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COpJNH+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505011F000E9;
	Mon, 20 Jul 2026 20:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784579950;
	bh=WC8aYtuLrcT3JUVi+C12d2r1cCQUgmD2KV0AMEaXPDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=COpJNH+nYBBJHh1N7zRijw3XQirK0GAyy4XJ9rYXF6hEv6riEzmOnTPk5zoKb//j/
	 xhk2S05wUGB15pxDjbrRoroeNO2rCx8+xmUJympZCqMUYbLSU3U2LuQmhGHUqMfSx2
	 0OHV/LsLI2+0ie4rt84ytOCGlE92rJCj+htvlUFFsHON0T98dc/hY8llLCmQhj62/W
	 aMAQ2eAfgeK28lM97ra+aI/Z3pZ06/ZAfhfayAst5G6W85A7uG0FXynUZGSmjauwbm
	 xZ1ZpzWeLzrvetJdP6+Axhz4qxnySTQVZ4aCwcSBmHnOiosMzUDIz09snQwWGna7nz
	 O2ExDaQEVCzRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V18 8/9] iio: imu: inv_icm42607: Add Temp Support in
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720202343.70138-9-macroalpha82@gmail.com>
References: <20260720202343.70138-1-macroalpha82@gmail.com>
 <20260720202343.70138-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:39:09 +0000
Message-Id: <20260720203910.505011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The temperature channel advertises IIO_CHAN_INFO_SAMP_FREQ but f=
ails to handle it in its read_raw implementation, causing -EINVAL.
--

--- Patch [8]: [PATCH V18 8/9] iio: imu: inv_icm42607: Add Temp Support in =
icm42607 ---
commit d42e76e3efb32de0c89c91668f6d156c61cbf937
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Temp Support in icm42607
   =20
Add functions for reading temperature sensor data.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> index ad1135d48902d..718a0201b6eda 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
[ ... ]
> @@ -187,6 +190,8 @@ static int inv_icm42607_accel_read_raw(struct iio_dev=
 *indio_dev,
>  	switch (chan->type) {
>  	case IIO_ACCEL:
>  		break;
> +	case IIO_TEMP:
> +		return inv_icm42607_temp_read_raw(indio_dev, chan, val, val2, mask);

[Severity: Medium]
Will this early return bypass the IIO_CHAN_INFO_SAMP_FREQ handler located
further down in inv_icm42607_accel_read_raw()?

Since the temperature channel advertises IIO_CHAN_INFO_SAMP_FREQ in
INV_ICM42607_TEMP_CHAN, this causes requests for the sampling frequency to
return -EINVAL instead of the actual sampling frequency.

>  	default:
>  		return -EINVAL;
>  	}

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
> index 6af7b143e6a15..e7d5e552bb5cb 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
[ ... ]
> @@ -184,6 +187,8 @@ static int inv_icm42607_gyro_read_raw(struct iio_dev =
*indio_dev,
>  	switch (chan->type) {
>  	case IIO_ANGL_VEL:
>  		break;
> +	case IIO_TEMP:
> +		return inv_icm42607_temp_read_raw(indio_dev, chan, val, val2, mask);

[Severity: Medium]
Similar to the accel implementation, does this early return intercept IIO_T=
EMP
and incorrectly skip the IIO_CHAN_INFO_SAMP_FREQ fallback?

>  	default:
>  		return -EINVAL;
>  	}

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_temp.c
> new file mode 100644
> index 0000000000000..8681ef2b49e21
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
[ ... ]
> @@ -0,0 +1,98 @@
[ ... ]
> +int inv_icm42607_temp_read_raw(struct iio_dev *indio_dev,
> +				struct iio_chan_spec const *chan,
> +				int *val, int *val2, long mask)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	s16 temp;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret =3D inv_icm42607_temp_read(st, &temp);
> +		if (ret)
> +			return ret;
> +		*val =3D temp;
> +		return IIO_VAL_INT;
> +	/*
> +	 * T=C2=B0C =3D (temp / 128) + 25
> +	 * Tm=C2=B0C =3D 1000 * ((temp * 100 / 12800) + 25)
> +	 * scale: 100000 / 12800 ~=3D 7.8125
> +	 * offset: 3200
> +	 */
> +	case IIO_CHAN_INFO_SCALE:
> +		*val =3D 7;
> +		*val2 =3D 812500000;
> +		return IIO_VAL_INT_PLUS_NANO;
> +	case IIO_CHAN_INFO_OFFSET:
> +		*val =3D 3200;
> +		return IIO_VAL_INT;
> +	default:

[Severity: Medium]
Since this function handles the mask for IIO_TEMP, should it also handle
IIO_CHAN_INFO_SAMP_FREQ?=20

It currently falls through to the default -EINVAL case, causing in-kernel
reads for the sampling frequency to fail, despite the temperature channel
advertising it.

> +		return -EINVAL;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720202343.7013=
8-1-macroalpha82@gmail.com?part=3D8
