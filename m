Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7434B1B0
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 18:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115052; cv=none; b=Vedq6UtWKfUVhkQrdiJBvYbAu0O+MBAQsMFLDt/Cj7UoUsos8gx8HgBSWORx3QI79K+pb/Tg7idmDSD8bjGeSdKPn/h3Tg/fxy5CQ2I4jN9eJ/YTbD3wGSLgOgv1wcx8XcUlk+5FitGBCmqvQsEi3gzs3x3riWTokbbje5dbjZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115052; c=relaxed/simple;
	bh=idCqPoKV4lmFetOSlf24Y3hNwoJ4RaKtobqNF+QWOv0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I4GtEj+ZKageZSDoj5dIKX2Or9rS1OzP9mVYwXma+vySSEm4T4/nVfBdApytZ4x5+cqD5Xc/Nqb2l9ndzUONkO7toU+NzPk3uYWg2Ejc/w8gxZXkJl5dhMLd6dEA5x0pojV4fiaMK5GSqN5MmaGKb7b3oKmSsrvysuXxmhQWChg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXNQF1iJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXNQF1iJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2991A1F00893;
	Wed, 10 Jun 2026 18:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781115051;
	bh=27ZQfl8sz+uVeISilrymjEiFD2S1U+S9ZaXU/IxF4iA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lXNQF1iJu5FaUjRExBjeI9vDQl0YhVkl2Jog2y1tnltPbonq+UcJ60tmP6j1TWOMN
	 g+j8bHwlJFm6LfkmAIhXxu8ijNAprC6OnGy96o7nciUDWQixUSVYy4G56/hZCj1j3+
	 8W2zHcKZgJiX6D2KyeQ0RlVxr7vQ3GQOb9HVHpWwUKzosJzLao/39+7L9fxmx6QKuK
	 l6jZUVk8kmkEw14sTuTtL7HctVMJ8KfLQ6osRgJOM+enIakvxNafY2iYcVxIVlp/lO
	 nYwoil34s7tGUjQadZj/xGLYzTsnbG57rnFrkGlB9jTqBUiQ58aTeT6gDZmJOxY2lf
	 7JuGQqcPwJmBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V11 7/9] iio: imu: inv_icm42607: Add Accelerometer for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610175455.19006-8-macroalpha82@gmail.com>
References: <20260610175455.19006-8-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 18:10:50 +0000
Message-Id: <20260610181051.2991A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `iio_device_claim_direct()` protection when changing the=
 sampling frequency (ODR) in `inv_icm42607_accel_write_raw()`.
--

commit 09acc28167411b3db95fd7b8d7918637d445b62b
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Accelerometer for icm42607

This commit adds support for the accelerometer sensor to the icm42607
driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c

[ ... ]

> +static int inv_icm42607_accel_write_raw(struct iio_dev *indio_dev,
> +					struct iio_chan_spec const *chan,
> +					int val, int val2, long mask)
> +{
> +	int ret;
> +
> +	if (chan->type !=3D IIO_ACCEL)
> +		return -EINVAL;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		if (!iio_device_claim_direct(indio_dev))
> +			return -EBUSY;
> +		ret =3D inv_icm42607_accel_write_scale(indio_dev, val, val2);
> +		iio_device_release_direct(indio_dev);
> +		return ret;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		return inv_icm42607_accel_write_odr(indio_dev, val, val2);

[Severity: Medium]
Should this IIO_CHAN_INFO_SAMP_FREQ case be protected by
iio_device_claim_direct() and iio_device_release_direct() similar to the
IIO_CHAN_INFO_SCALE case above it?

While the driver currently only supports INDIO_DIRECT_MODE, omitting the lo=
ck
here leaves the state management inconsistent. If buffered mode is added in
the future, modifying the sampling frequency while the buffer is actively
streaming could lead to stream breakage or corrupted timestamps.

> +	default:
> +		return -EINVAL;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610175455.1900=
6-1-macroalpha82@gmail.com?part=3D7
