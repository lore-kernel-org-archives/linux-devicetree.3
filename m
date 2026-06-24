Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E03826CE39
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327072; cv=none; b=dqDGaopec6p/qVIde7wJji6z0y7AZjSPMoyJsoeYO0kgiPIDqFpKHsYnr1w2KnTNeS9MUKGMMEFu3Zzujk4v/jIR9e8oqQ6yUsFmog92987BaqBj8DhXnIiovIS8sKucj/Bo1i02XzQZnDmuErnDLIo4LzcR722iGnNjqB77iz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327072; c=relaxed/simple;
	bh=p4g7grejHoVoZHXOm3JSaTfp/eGUmT2Dk70IEZ5XG5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B3sGtRxRBkR4uGy//BAB5TExDHTD1QKcR4ONqrudHqL72BWBeaWN3R92RnaoqYEUMkGQyNE0qLsnGX5sqA7QhH4AaZVUMFVOtm5S1yNNJtSYsYbZ3lmsxm5CsFg9MYhFmqd2biHPnnyiqmmkk936DTIchTBSIztn511UYvQvvsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3Z/u2MK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3Z/u2MK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153C31F000E9;
	Wed, 24 Jun 2026 18:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782327070;
	bh=Wt1Aux7TYVW66EvfjQT21s7Jvbr/FRDndCh00sN4qAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b3Z/u2MKzRpNDOKwZrIPa97RhBYGONOv8SQO7I2nm3ESYEeHIPFY7B3HRiy9XHNyP
	 gj6nUFWKEugDSU1KP9eOdLQTaWDvtNxx2y6uYrt2avJEo/z6UI5P4WD59HxY0d3v04
	 JURBN1nM3AFIj/Sjag+yOOqEmGfjB9qTz5B0PTatcMBx4GQkHWJSr6mfSc8gAYuSI6
	 047mMs9LO8aPBXYZPD1wayrCmW6CnmkHe8HzjOZn21B7UUtWXmli1693Z2pwvrFZpk
	 9hn3Eh2j2qV3TkTgGFYRa6jr9gUFBeZtFFyTeWhvrFcfEmUikF+yYPCxKIozKpnOQf
	 EPXVN/zBh6UEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V14 8/9] iio: imu: inv_icm42607: Add Temp Support in
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624182350.50467-9-macroalpha82@gmail.com>
References: <20260624182350.50467-1-macroalpha82@gmail.com>
 <20260624182350.50467-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 18:51:09 +0000
Message-Id: <20260624185110.153C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing endianness initialization in INV_ICM42607_TEMP_CHAN.
- [Low] Leftover commented-out developmental code.
--

commit a30ed1de671168873a3fd8263c138bbcda62583a
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Temp Support in icm42607
   =20
Add functions for reading temperature sensor data.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_temp.c
> new file mode 100644
> index 0000000000000..f7e286ecb5cd6
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
[ ... ]
> +static int inv_icm42607_temp_read(struct inv_icm42607_state *st, s16 *te=
mp)
> +{
[ ... ]
> +	accel_mode =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, val);
> +	gyro_mode =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);
> +	if (!gyro_mode && !accel_mode) {
> +		/* enable accel sensor */
> +		conf.mode =3D INV_ICM42607_SENSOR_MODE_LOW_NOISE;
> +//		ret =3D inv_icm42607_set_accel_conf(st, &conf);

[Severity: Low]
This isn't a bug, but should this commented-out line of code be removed
from the final patch?

> +		ret =3D inv_icm42607_set_sensor_conf(st, &conf, IIO_ACCEL);
> +		if (ret)
> +			return ret;
> +	}
[ ... ]
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_temp.h
> new file mode 100644
> index 0000000000000..cb7b460ffb441
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h
[ ... ]
> +#define INV_ICM42607_TEMP_CHAN(_index)				\
> +{								\
> +	.type =3D IIO_TEMP,					\
> +	.info_mask_separate =3D					\
> +		BIT(IIO_CHAN_INFO_RAW) |			\
> +		BIT(IIO_CHAN_INFO_OFFSET) |			\
> +		BIT(IIO_CHAN_INFO_SCALE),			\
> +	.info_mask_shared_by_all =3D				\
> +		BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
> +	.info_mask_shared_by_all_available =3D			\
> +		BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
> +	.scan_index =3D _index,					\
> +	.scan_type =3D {						\
> +		.sign =3D 's',					\
> +		.realbits =3D 16,					\
> +		.storagebits =3D 16,				\
> +	},							\

[Severity: Low]
Does this scan_type struct need its endianness field initialized to IIO_BE?

Since get_unaligned_be16() is used when reading the sensor data in
inv_icm42607_temp_read(), it appears the hardware outputs big-endian data.
Omitting the endianness here defaults to IIO_CPU (0), which differs from the
gyro and accel channels that explicitly define it. Could this cause issues
if IIO buffered reads are implemented later?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624182350.5046=
7-1-macroalpha82@gmail.com?part=3D8
