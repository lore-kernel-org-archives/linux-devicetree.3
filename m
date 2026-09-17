Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776DF551993
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653035; cv=none; b=NLAeCH8rxApqnSIrzJONHnZx50NhGSqOodiMqmCsmhDdh9nyP7Ucf2OZpJyddzNdB/Gli6F74T4E8bfaZ1uHbSqAnMZogGcCKHALKo+0q+9e1x9lhmGXBY5Fs8lTx5ywWfjw+UCdD8/3UaKCfawK2QIrA2Zb4iqLwhePhEyQEtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653035; c=relaxed/simple;
	bh=5TL2h/uqU6H2cYydtVjcXuYgnUG12SFwzFls56behfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jPzfvrEVANxOe5CwBvLK4uroNaSnvVo2KVn8mnMQ5BczMkWA5bNOFxWKSLv11rdtnxR3YbDDj6mNNEAZ/KWf8CX7hGcRgoVZlE614cJrqjfK3wzilB/CSdpkAy5gE+g8g1xvg4ka4ud45sJ4eFSd8pey1cvFwBq+YVQwfZiIcVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1pcVtCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1pcVtCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135A31F000FF;
	Thu, 17 Sep 2026 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789653028;
	bh=6CWPQfb3Yy4Ow122wctFdIf8VfL+pj1TWNJ29fYAFds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C1pcVtCXzS5xxZweNNctN2NYexEcd0mzcR4lK7Ko+KcD9p3qfMgzdHigQogJ39ax6
	 c/sb0kUv9sOBR123v0S46xD7qPloeW7DeqENhu9/QX5Scmp4WxAYN8e3FBN6jxWeMM
	 /zZbZSJLH7SSaZs8jnh3D+4Z1RGors41USJ598zz2mxNmGBb+8fWFGKsWNng/pEOsH
	 fIu5Htpu+WxSLfpXJBQhXFSUIfEYzpzjb9sAA547M3r7kWs7LSpxK/2LjDeTzPjSeB
	 lnLR8v0GDocYjtvnCBr30PxM41o5mhoZR8Iajs5+gCdWR2I4uOcqWpNjC4mwG13L2u
	 WlOOhr1KY4KIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] iio: imu: inv_icm42607: Add accelerometer
 calibbias support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917-b4-inv_icm42370p-v4-5-fd9373f123c9@axis.com>
References: <20260917-b4-inv_icm42370p-v4-0-fd9373f123c9@axis.com>
 <20260917-b4-inv_icm42370p-v4-5-fd9373f123c9@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:50:27 +0000
Message-Id: <20260917135028.135A31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: imu: inv_icm42607: calibration bias lost across suspend
--

commit 265a6fbb240f73261702e44167f3a068fc676f5f
Author: Kanak Shilledar <kanak.shilledar@axis.com>

iio: imu: inv_icm42607: Add accelerometer calibbias support

Expose IIO_CHAN_INFO_CALIBBIAS on the accelerometer channels. The
registers are stored in MREG1. The calibration bias is written to
OFFSET_USER4 to OFFSET_USER8 registers in MREG1. Reject the out of
limit calibbias values instead of clamping it.

Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
Datasheet: https://www.lcsc.com/product-detail/C5129967.html

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> index 8f61bc9014526..39c5a3f80b2eb 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c

[ ... ]

> @@ -176,6 +189,171 @@ static int inv_icm42607_accel_write_odr(struct iio_=
dev *indio_dev,
>  	return inv_icm42607_set_sensor_conf(st, &conf, IIO_ACCEL);
>  }
> =20

[ ... ]

> +static int inv_icm42607_accel_write_offset(struct iio_dev *indio_dev,
> +					   struct iio_chan_spec const *chan,
> +					   int val, int val2)
> +{

[ ... ]

> +	switch (chan->channel2) {
> +	case IIO_MOD_X:
> +		/* OFFSET_USER4 upper nibble is shared. */
> +		ret =3D regmap_update_bits(st->map, INV_ICM42607_REG_OFFSET_USER4,
> +					 GENMASK(7, 4), (offset & 0xF00) >> 4);

[Severity: Medium]
Are user-configured accelerometer calibration biases lost across system
suspend and resume cycles?

Since inv_icm42607_accel_write_offset() writes directly to the MREG1 bank
registers in drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c, and the
driver explicitly marks MREG registers as volatile in
inv_icm42607_is_volatile_reg():

    if ((reg & INV_ICM42607_REG_BANK_MASK) !=3D INV_ICM42607_BANK0)
        return true;

won't regcache_sync() skip these registers upon resume?

If the vddio_supply is turned off during suspend, the sensor's internal
state is wiped. Because regmap doesn't cache volatile registers, the
calibration biases would be reset to zero upon resume instead of being
restored.

Could this be updated to cache the user's bias setting in the driver's
software state so it can be restored after resume?

> +		if (ret)
> +			return ret;
> +
> +		return regmap_write(st->map, INV_ICM42607_REG_OFFSET_USER5,
> +				    offset & 0xFF);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-b4-inv_icm=
42370p-v4-0-fd9373f123c9@axis.com?part=3D5
