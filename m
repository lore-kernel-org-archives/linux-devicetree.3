Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF1A145355
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115290; cv=none; b=ij3Ngj7TjCghKVGG6Vqt3z3p6F2f84MCROZyO+xQ8MgstzGeeop/GnWOcsBNWZJXC2E4TgLRjJ3DzFvLN0JUm8BtGeMm3EOEW1UtWhXqtLW5ReOaVSReLEyYGp/M2wsqC3SNekXz5pdU9wjCYOIel7jRZeno8WkbSo4FWotnELM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115290; c=relaxed/simple;
	bh=Xa7cIYXjVNZMPIM2byHVcVBHh+QcX/yt7ddRfb1wrZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mkdTgeVQu/B8sJQzJSc4nNbLgVIIEbhG1niHYXTnkGgcQaADZCHFA0LwA/Yz2b13fTjZmb9au3PBzWkQC2dWkQ7JjwWLM4MxGQByIiMwg+ZNM87nJZ5jvlkY94Q8tHhLx5JzhsNtTNE1GSLbXDnbsc+RxfG6sWaj88FBrW8R8zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9bwOMsJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9bwOMsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B256E1F00893;
	Wed, 10 Jun 2026 18:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781115289;
	bh=DV4qQXruMoUXJ5QvMPNSKXo/gfO7W7eCu9BpILv/z7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f9bwOMsJntZ/MJfZ/YZMG+8Q4izmYeJvfOdzrpnmxiMt2Zs53tnK30CVn2meb/v2B
	 IQZsfJ0uu7yk5aATUNRpfLSljiuIL99euX1U7PweptOYm75mdjl8H+wzvZxqXtvkWc
	 IPCOMWmE9NIIzDPMNloS3Gu0j93R/D/9Owb2U4C0pcrcmO9sl8flg8m+OuCubBIqMH
	 d/QMjmGVuTpJmJ+SKsQAi9h8+wJs2158vqeAprRSW0Tc2SAb+Ezk4lN6SKqOQQ/KYY
	 0rFHGZyLO85+T1GEkc3FkgtwcxaMD+hU2Hj6cedh3ZxqLLNAHjDGvDN29A7hVKEQkz
	 Z1VEwRghOnpyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V11 8/9] iio: imu: inv_icm42607: Add Gyroscope to
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260610175455.19006-9-macroalpha82@gmail.com>
References: <20260610175455.19006-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 18:14:48 +0000
Message-Id: <20260610181448.B256E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing `_available` info masks in `INV_ICM42607_GYRO_CHAN` make=
s `read_avail` dead code and hides capabilities from userspace.
- [Medium] Missing `iio_device_claim_direct()` protection when writing samp=
ling frequency.
--

commit 85b10db1767bd36f30119bab0e0a4f4f63966fc3
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Gyroscope to icm42607

Add gyroscope functions to the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
> new file mode 100644
> index 0000000000000..8cabebe2e96b1
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
> @@ -0,0 +1,369 @@

[ ... ]

> +#define INV_ICM42607_GYRO_CHAN(_modifier, _index, _ext_info)	\
> +{								\
> +	.type =3D IIO_ANGL_VEL,					\
> +	.modified =3D 1,						\
> +	.channel2 =3D _modifier,					\
> +	.info_mask_separate =3D					\
> +		BIT(IIO_CHAN_INFO_RAW),				\
> +	.info_mask_shared_by_type =3D				\
> +		BIT(IIO_CHAN_INFO_SCALE),			\
> +	.info_mask_shared_by_all =3D				\
> +		BIT(IIO_CHAN_INFO_SAMP_FREQ),			\

[Severity: Medium]
Will userspace be able to discover the available scales and frequencies?

Since .info_mask_shared_by_type_available and=20
.info_mask_shared_by_all_available are not included in this macro, it
appears the IIO core will never query inv_icm42607_gyro_read_avail(),
leaving that function as dead code.

> +	.scan_index =3D _index,					\
> +	.scan_type =3D {						\

[ ... ]

> +static int inv_icm42607_gyro_write_raw(struct iio_dev *indio_dev,
> +				       struct iio_chan_spec const *chan,
> +				       int val, int val2, long mask)
> +{
> +	int ret;
> +
> +	if (chan->type !=3D IIO_ANGL_VEL)
> +		return -EINVAL;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		if (!iio_device_claim_direct(indio_dev))
> +			return -EBUSY;
> +		ret =3D inv_icm42607_gyro_write_scale(indio_dev, val, val2);
> +		iio_device_release_direct(indio_dev);
> +		return ret;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		return inv_icm42607_gyro_write_odr(indio_dev, val, val2);

[Severity: Medium]
Is it safe to write the sampling frequency without claiming direct mode her=
e?

It looks like IIO_CHAN_INFO_SAMP_FREQ bypasses iio_device_claim_direct(),
meaning it could potentially be modified concurrently with active IIO data
buffering.

> +	default:
> +		return -EINVAL;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610175455.1900=
6-1-macroalpha82@gmail.com?part=3D8
