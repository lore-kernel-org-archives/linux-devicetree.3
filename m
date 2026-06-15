Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E780D21D596
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545892; cv=none; b=M6EgEP8qlxTXnxxdh6XTM4/pJUkJy2hcLKknfESVvaBcF6dH/O04oKiCht4Ku814IRmJx+x8Jeca5y+G7B9nNcpDSbspgin+pENWbSbfBv7m0JzJ3glV64RvsheI46WQ6zIi5ggJxiJoz/jeMigz8i1pvI7Lx2prc6WFpRFATlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545892; c=relaxed/simple;
	bh=aOGvR/6EMXxzHIz/mT4m4+9Tih1GazD+g4jiXrWaUTk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rOxLtm22t84Jkj1hpDW11UDaVSRBAXltJf+813AbEyN+cPS1Rmna0P3IeGpDZuU0/ipwfBA7k6+EQ+qYogM1/lKM7sGWXtEhKknt4rvhtSWy/OUZ6yGuZAfHI35eJgWnh0BJB51/kPQAGcFJRmYokHKCI5+1KZa8CinPdcXQ1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fu+gyOXz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fu+gyOXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEE41F000E9;
	Mon, 15 Jun 2026 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781545890;
	bh=kbacCHcH56fljO/cEdIVM0u0Q74/nT7xv4thcY7cGFo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fu+gyOXzW0velKzuApERSvd2zOPgC71NyuA4GbBRFanre3eO8sCE62rsAHlCSfft/
	 iaXDhb2FJJ8A8rEdSA6ZpDagxAvFfx6gs+Tq4dEoxETwR+Tw8nPawhFw9zWy/GPo8K
	 pnDetalumh/vMJUf91rkY8yOIW+YXlhp3XFq1hoOTi24pXg6XqTk+/t8Dj/n0W5s2Z
	 b+XoswGYWFMObyKySH1HHvWbZTyIg2BW/zzbU+oQA1JjGc5fhfOrUz9P6efjwbhAi0
	 KfCarBjiokNzkWEOb4BioWxa5SRWvpfndK/kCywq0VkDgG7V2yhrOwH26lV2wf7BYd
	 5EuA/d7A99RCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V13 6/9] iio: imu: inv_icm42607: Add Temp Support in
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260615172554.160910-7-macroalpha82@gmail.com>
References: <20260615172554.160910-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:51:30 +0000
Message-Id: <20260615175130.6CEE41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Prematurely mutating the temperature software state before calling=
 the power management configuration bypasses state change detection, skippi=
ng the mandatory startup delay and causing reads of uninitialized data.

Pre-existing issues:
- [High] The temperature sensor read fails (returns -EINVAL) when the gyros=
cope and accelerometer are off because the device is placed in Sleep mode i=
nstead of Idle mode, disabling the internal RC oscillator.
--

commit d36f0c461ef9d5076de90b75b6238be45c35148d
Author: Chris Morgan <macromorgan@hotmail.com>
Subject: iio: imu: inv_icm42607: Add Temp Support in icm42607

Add functions for reading temperature sensor data.

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 64f5d263de4f2..644cd7f821b92 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -162,6 +162,24 @@ static int inv_icm42607_set_pwr_mgmt0(struct inv_icm=
42607_state *st,
>  	return 0;
>  }
> =20
> +int inv_icm42607_set_temp_conf(struct inv_icm42607_state *st, bool enabl=
e,
> +			       unsigned int *sleep_ms)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	val =3D FIELD_PREP(INV_ICM42607_TEMP_CONFIG0_FILTER_MASK,
> +			 INV_ICM42607_FILTER_BW_34HZ);
> +	ret =3D regmap_update_bits(st->map, INV_ICM42607_REG_TEMP_CONFIG0,
> +				 INV_ICM42607_TEMP_CONFIG0_FILTER_MASK, val);
> +	if (ret)
> +		return ret;
> +
> +	return inv_icm42607_set_pwr_mgmt0(st, st->conf.gyro.mode,
> +					  st->conf.accel.mode, enable,
> +					  sleep_ms);

[Severity: High]
This is a pre-existing issue, but will this temperature read fail with -EIN=
VAL
if the gyroscope and accelerometer are off?

Looking at inv_icm42607_set_pwr_mgmt0(), it constructs the PWR_MGMT0 regist=
er
value using only the gyro and accel mode masks:

    val =3D FIELD_PREP(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, gyro);
    val |=3D FIELD_PREP(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, accel);
    ret =3D regmap_write(st->map, INV_ICM42607_REG_PWR_MGMT0, val);

If both gyro and accel are off, val is 0, which places the device in Sleep =
mode
instead of Idle mode. The internal RC oscillator required for temperature r=
eads
is disabled, causing the data register to return 0x8000
(INV_ICM42607_DATA_INVALID).

Should the IDLE bit be set when temp is true and the other sensors are
inactive?

> +}
> +
[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_temp.c
> new file mode 100644
> index 0000000000000..9a60e1a478b08
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
[ ... ]
> +static int inv_icm42607_temp_read(struct inv_icm42607_state *st, s16 *te=
mp)
> +{
> +	struct device *dev =3D regmap_get_device(st->map);
> +	u8 raw[2];
> +	int ret;
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
> +	ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	st->conf.temp_en =3D true;
> +	ret =3D inv_icm42607_set_temp_conf(st, st->conf.temp_en, NULL);

[Severity: High]
Does setting st->conf.temp_en to true before this call bypass the hardware
configuration and startup delay?

Because st->conf.temp_en is mutated before the call, when
inv_icm42607_set_temp_conf() calls inv_icm42607_set_pwr_mgmt0(), it will
evaluate the state transition like this:

    bool oldtemp =3D st->conf.temp_en;
    ...
    if (gyro =3D=3D oldgyro && accel =3D=3D oldaccel && temp =3D=3D oldtemp)
        return 0;

Since temp and oldtemp are now both true, the function returns early without
writing to the power management register or waiting for the startup delay.
Could this lead to reading uninitialized or desynchronized data?

> +	st->conf.temp_en =3D false;
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_bulk_read(st->map, INV_ICM42607_REG_TEMP_DATA1,
> +			       raw, sizeof(raw));
> +	if (ret)
> +		return ret;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615172554.1609=
10-1-macroalpha82@gmail.com?part=3D6
