Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CE82E6116
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545824; cv=none; b=VRiD68xEDqBkp1Z94buiK1MrMbsG1VHsJ/J2aQFnjfEnW1/zD83aNvPZzqc/FSoGdVaNQCKVGdz2fd6AU2hEQ/JTNvs16k0jzoIYAB1htWjmFFLPrm8NRnGEDhlg7iaQWn8HfAZ+z3svovARGVKRDjVQg00e2t6OkcZOM1eUp4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545824; c=relaxed/simple;
	bh=XGoUcUEU4j54w0QguWzcYYqOmDeMSZBvJxrKiEDM51Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ocZHTQ8Kcnfu2KZwWEpqqXf6rjLaxChB87YvIgCTI/jLblhqczvePnY93c9JBAYQnsgzXdvDon1nfgzU0HhxuGPDjvpx4YDcb6+adsuWuHZoSwn0SlPKvTJDvf933NNVuc+XmlweJ3UoZLVi/lTYOxB41zllc/JzjTrtHrmxr/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QN5U80TT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QN5U80TT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3771F000E9;
	Mon, 15 Jun 2026 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781545822;
	bh=xttoPIat5TvELpIaoc4pkxjEovch9JYfzrznzcYQrTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QN5U80TTEFCP25v+xA+6Ety8Y7IWeTHI8zQNtoqBFFvBVlW148Q2TRjfFHzc4R2LA
	 MZk9LXQKmlLPaRJjlnisAm8KQ6HV7e1CUMf9KC8QWW91ok+MSU6ythB/bR/nJtGETo
	 JbsO9EIhf2Sgon52UC4V47WkysnZLCVi6ec21UQFCdjuNCvICVQe0injmUGtDS2WWd
	 wBLdj4T2s22JZCl/KaXr8I9uHTcjM1mOQA+NCfr0jwGjPnk0ejmhPMe42t33p9Iy6P
	 tbX3VUH8PZoR9QWuowp7O/rmyGwM5JchrSQDczg2/7385b1Q06rE0NfpkJSWfPjBcO
	 htS0Mq39GNMVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V13 5/9] iio: imu: inv_icm42607: Add PM support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615172554.160910-6-macroalpha82@gmail.com>
References: <20260615172554.160910-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:50:21 +0000
Message-Id: <20260615175022.9A3771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing synchronous suspend during driver unbind leaves hardware s=
ensors powered on and leaking power.
- [Medium] Unconditional 45ms sleep during gyro power-off injects unnecessa=
ry delay on every suspend transition.
- [Low] Incorrect constant used for defining the autosuspend delay.
--

commit c053e5ed4a86d71f412c402ec80e9602b6677c2a
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add PM support for icm42607
   =20
Add power management support for the ICM42607 device driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607.h b/drivers/iio/im=
u/inv_icm42607/inv_icm42607.h
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607.h
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
[ ... ]
> @@ -334,11 +345,18 @@ struct inv_icm42607_state {
>  #define INV_ICM42607_GYRO_STOP_TIME_MS			45
>  #define INV_ICM42607_TEMP_STARTUP_TIME_MS		77
> =20
> +/*
> + * Suspend delay assumed from other icm42600 series device, not
> + * documented in datasheet.
> + */
> +#define INV_ICM42607_SUSPEND_DELAY_MS			(2 * USEC_PER_MSEC)

[Severity: Low]
Is this using the correct conversion macro? While (2 * USEC_PER_MSEC)
evaluates to 2000, USEC_PER_MSEC means microseconds per millisecond. Using
it to convert seconds to milliseconds is semantically confusing. Should thi=
s be
2 * MSEC_PER_SEC or just the literal 2000?

> +
>  typedef int (*inv_icm42607_bus_setup)(struct inv_icm42607_state *);
> =20
>  extern const struct regmap_config inv_icm42607_regmap_config;
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -103,6 +105,63 @@ const struct inv_icm42607_hw inv_icm42607p_hw_data =
=3D {
>  };
>  EXPORT_SYMBOL_NS_GPL(inv_icm42607p_hw_data, "IIO_ICM42607");
> =20
> +static int inv_icm42607_set_pwr_mgmt0(struct inv_icm42607_state *st,
> +				      enum inv_icm42607_sensor_mode gyro,
> +				      enum inv_icm42607_sensor_mode accel,
> +				      bool temp, unsigned int *sleep_ms)
> +{
> +	enum inv_icm42607_sensor_mode oldaccel =3D st->conf.accel.mode;
> +	enum inv_icm42607_sensor_mode oldgyro =3D st->conf.gyro.mode;
> +	bool oldtemp =3D st->conf.temp_en;
> +	unsigned int sleepval_ms;
> +	unsigned int val;
> +	int ret;
> +
> +	if (gyro =3D=3D oldgyro && accel =3D=3D oldaccel && temp =3D=3D oldtemp)
> +		return 0;
> +
> +	/*
> +	 * Datasheet on page 14.26 says we need to ensure the gyro sensor is on
> +	 * for a minimum of 45ms. So if we transition from an on state to an
> +	 * off state wait 45ms to ensure a sufficient pause before power off.
> +	 */
> +	if (!gyro && oldgyro)
> +		fsleep(INV_ICM42607_GYRO_STOP_TIME_MS * USEC_PER_MSEC);

[Severity: Medium]
Does this inject a 45ms delay into every runtime suspend transition?=20

The code unconditionally sleeps for 45ms when turning off the gyro.
If the datasheet requires the gyro to remain ON for a minimum of 45ms
after power-on, wouldn't it be better to track the power-on timestamp
instead of delaying every power-off sequence, even if the gyro has
been active for hours?

> +
> +	val =3D FIELD_PREP(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, gyro);
> +	val |=3D FIELD_PREP(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, accel);
[ ... ]
> @@ -271,10 +342,78 @@ int inv_icm42607_core_probe(struct regmap *regmap,
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, INV_ICM42607_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +
>  	return 0;
>  }

[Severity: High]
Does this code leak power on unbind?=20

Since autosuspend is used, the device doesn't suspend synchronously when
pm_runtime_put_sync() is called by the driver core on removal. Instead, an
async autosuspend is queued.=20

When the devres cleanup action invokes pm_runtime_disable(), the pending
autosuspend work is cancelled, meaning inv_icm42607_runtime_suspend() is
never executed.

If the sensors remain fully powered on in the PWR_MGMT0 register, and the
vddio regulator is shared with other devices, will this cause a permanent
power leak? Would adding a driver remove callback that calls
pm_runtime_dont_use_autosuspend() or pm_runtime_put_sync_suspend()
ensure the device powers down synchronously?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615172554.1609=
10-1-macroalpha82@gmail.com?part=3D5
