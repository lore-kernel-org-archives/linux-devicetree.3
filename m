Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED29438654F
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448995; cv=none; b=KzKPBHzhS3z6+rQJAq/W7l6fKeUB3Rtw1B+VBQ3kY+vC/2Kabeqq5/BZgR3JKIj8wGZY4z7nCHx9SxydR6G5Pu87lffBmBv4tf4mVmplaFgAHa7ZgOF9yF0Y6nC6pCyPk4ca36q9F9QiLcq/XvRDileRYfOv1+D6fZvi/4qIyuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448995; c=relaxed/simple;
	bh=33MfcqyztX5qoPlMo7PEzSPXL+874eQ0XOQzrZZLp9s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EhuzabiJrfZhaMaEWcUZ4+QE60uy+xayt2jaYxroF9nA6d3nQlgOwqQJj2oUaQpT+BrE/jsvaIhmOkNq3lNRUqBkXe30BhWgAheuVB0GXUQ2aI2nIAozNmtzIxOO74A5y295y1ZRbCe50qsBE/1yQg3gGkmCvqr89lNrmZtWu68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmHEWtiP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmHEWtiP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7398E1F000FF;
	Thu,  8 Oct 2026 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791448994;
	bh=k0YwKNyc+GQzNkiaxymQIrSrOefMnKQ8X34bSgliQGA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmHEWtiPpLIbs/voJGY4ufXQHdlANkDoUDyaebmfNOWXPJTLwphe4JNjOy2Eyd+TP
	 /FceNfIdi8P+13xwRlT0WrlvClHBUXnYQQGW+LQltwmf7eW7b0FYoRfAV38USGcmg8
	 MEQDsT17zwkbJ3fEmIQGJJUBdrwAZph7Vi27HPUJPs14qbSWXV9WCTlqYKJPQOB5/3
	 nrb+Pnz6dwD/J/vxos8qNPT/ZJ7Ma3A1EOdrAspbOexZJjQ/dxhCGsdE6M7O/ksSMk
	 /Lh5COu/oC6Oo/WlKX4tXJuuclEKdvxeaWbqnjIaNmS92AxhKiBqJXsHYVrdmnqgfm
	 hrSsExrexD7PQ==
Message-ID: <sashiko-outbox-163849@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] iio: imu: adis16607: Add calibration bias
 support for gyro/accel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008-adis16607-v2-6-7c94df80878a@analog.com>
References: <20261008-adis16607-v2-0-7c94df80878a@analog.com>
 <20261008-adis16607-v2-6-7c94df80878a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 08:43:14 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: missing bounds check in adis16607_write_raw() causes intege=
r truncation
--

commit e23feabbd136bcd6fd30e2609a83f094ba9326fc
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: adis16607: Add calibration bias support for gyro/accel

This commit adds IIO_CHAN_INFO_CALIBBIAS support for the gyroscope and
accelerometer axes. It backs the new attribute using the device's per-axis
bias registers.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> index 0147eba0b1737..d4b3a8a9fd08a 100644
> --- a/drivers/iio/imu/adis16607.c
> +++ b/drivers/iio/imu/adis16607.c

[ ... ]

> @@ -1000,6 +1026,7 @@ static int adis16607_write_raw(struct iio_dev *indi=
o_dev,
>  			       int val, int val2, long info)
>  {
>  	struct adis16607 *st =3D iio_priv(indio_dev);
> +	const int idx =3D chan->scan_index;
>  	u32 tmp;
> =20
>  	switch (info) {
> @@ -1007,6 +1034,9 @@ static int adis16607_write_raw(struct iio_dev *indi=
o_dev,
>  		tmp =3D val * 1000 + val2 / 1000;
>  		return adis16607_set_freq(st, tmp);
> =20
> +	case IIO_CHAN_INFO_CALIBBIAS:
> +		return adis_write_reg_16(&st->adis, adis16607_calib_bias[idx], val);

[Severity: Medium]
Does this code silently truncate out-of-bounds user inputs? The `val`
parameter in adis16607_write_raw() is a 32-bit signed integer provided by
userspace, but adis_write_reg_16() expects a 16-bit integer.=20

Because there is no bounds check on `val` before passing it down, out-of-ra=
nge
values (values outside the 16-bit signed range [-32768, 32767]) could be
implicitly cast and wrapped. For example, 65536 would become 0, leading to
unintended calibration bias being applied to the device instead of rejecting
the write and returning an error to userspace.

> +
>  	default:
>  		return -EINVAL;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-adis16607-=
v2-0-7c94df80878a@analog.com?part=3D6
