Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24206344DAE
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227507; cv=none; b=S4VRmSnY96+fP3s13Sn/1yUKmrZJ2YmjVhvydYP4jQE1P+A1VROkUXDmxh4XVFlm5hzge80G3wUbziNipaGbj81RV5FvqWm9jGeCXHy1bIHWmgp4zHFbnIM5f0aDlBbom95NoKyLrDIHVo5TfJ8ErNtXWBzC4CkSsdDYjM+JHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227507; c=relaxed/simple;
	bh=zkIjg48oWCzCJCM4dXsGze/Ir2WNg/9PKKgF2D/1wBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YxLjrnRak1sAGD/k8Cbywr8hzSWcBEbQU8pQq0jdhof3LIUS2qnJCEzfflXq/IyNAsNHscJRxQlTKxb/7B9oRTj6YKmJtfl6peX+o22gHm1V5KEQr6PiSTvUvLML4KVRXdX4SJKtqKJbVmRwNVWxpslHmIvkyqGZuIcKqwD2OAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiA8TwB9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiA8TwB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413EE1F000E9;
	Thu, 16 Jul 2026 18:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784227505;
	bh=eaIKFHdYByke3P2qAumTRR6WeElRxS0RM+lCraIg9bU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NiA8TwB98ZzcCPcS3M8ewttWe9CItlR2RcaVTBG4YZr77kKhsrVz3h3s1ty/ju23Y
	 9UhPHCMrQsLpPG/oXJ40hnguIKVPUFzhzgqFv4kcAf5Vx+cbJexECE1bERLRQ8ubHe
	 9x/d7sleWgIAA6Y2c4B1bwaURseWf6ZWNowbbwwJxvNbAFShb+1gVygt8ZUwVZmOY0
	 cqgeLQSv92Q69HYzf+7/+1gVRoClWfLMpcsdiLk3njTHvI8Y0DsAQFg5qvxGjOE91e
	 NHiy7OlasR9rsvwsKZsJdXxJwml8aUFiYf/YyXRvykipL6GK7wpoIUcBCkkwfmcwMG
	 OSHgX8uJX0PyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V17 8/9] iio: imu: inv_icm42607: Add Temp Support in
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716182637.24310-9-macroalpha82@gmail.com>
References: <20260716182637.24310-1-macroalpha82@gmail.com>
 <20260716182637.24310-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 18:45:04 +0000
Message-Id: <20260716184505.413EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Temperature channel SCALE and OFFSET attributes are inaccessible=
 because the parent `read_raw` wrappers incorrectly intercept and reject th=
ese requests.
--

--- Patch [8]: [PATCH V17 8/9] iio: imu: inv_icm42607: Add Temp Support in =
icm42607 ---
commit b01bd8621993e536d7296ab4582e3caee33a909a
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Temp Support in icm42607

Add functions for reading temperature sensor data.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> index 7bb67f232d191..9a44a180e5ccf 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
[ ... ]
> @@ -186,6 +189,9 @@ static int inv_icm42607_accel_read_raw(struct iio_dev=
 *indio_dev,
> =20
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
> +		if (chan->type =3D=3D IIO_TEMP)
> +			return inv_icm42607_temp_read_raw(indio_dev, chan,
> +							  val, val2, mask);
>  		ret =3D inv_icm42607_read_sensor(indio_dev, chan, &data);
>  		if (ret)
>  			return ret;

[Severity: Medium]
Will userspace be able to read the scale and offset attributes for the
temperature channel?

Since the delegation to inv_icm42607_temp_read_raw() only happens inside the
IIO_CHAN_INFO_RAW case, requests for IIO_CHAN_INFO_SCALE and
IIO_CHAN_INFO_OFFSET are not forwarded.

For example, when reading IIO_CHAN_INFO_SCALE, the code drops down to:

	case IIO_CHAN_INFO_SCALE:
		if (chan->type !=3D IIO_ACCEL)
			return -EINVAL;

which evaluates to true and returns -EINVAL.

Could the check for IIO_TEMP be moved outside the switch statement so it
handles all masks? This same logic also appears to apply to
inv_icm42607_gyro_read_raw() in inv_icm42607_gyro.c.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716182637.2431=
0-1-macroalpha82@gmail.com?part=3D8
