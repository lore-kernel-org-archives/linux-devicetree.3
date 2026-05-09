Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D946732720D
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778356367; cv=none; b=ZcqeEZzceSPZ/yQfwqXIWZp6k/tFgQuJwSfnlkxjAsCRoADJE4J1G+J5MLGSvjTTD2s8jDdCvm6L6ILoWGDmR2u6Kq6t12gLmj/XYdhzJTp6+CUN+A0cj340+KwgFezigdz9xPa9JopjwwNuafy/oi2EYddM2+mhGn3kuXrSNU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778356367; c=relaxed/simple;
	bh=jDlnVk9hGSpRwarxytlyXyfzqc2cWz0vGBLdqtEZog0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kjq4rO4SU2KwGlyZGftj5Ec79HAnoK8kICbwYhiMgJHoL22Y2LwIu+Qqc7h9zQJNZmBbjyffHlQySrJZZBkU2I0O3Xn2hLMi6IqFCip9h2AyrClAIC4nCtSBI9btaOUPBRRx7bEtgXcPosJYb9o22LDeHS8BxOLK/QyXcZ4/D9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxsPn56q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxsPn56q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B49C2BCB2;
	Sat,  9 May 2026 19:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778356367;
	bh=jDlnVk9hGSpRwarxytlyXyfzqc2cWz0vGBLdqtEZog0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kxsPn56qjeUfgUP40dFWeJlW5eYrxt5MjmX5VfO/SP6kaDM1cvNKg/DcMmbIu5KKs
	 DGN2rkzBx99vPqp/YVka5cv6GL9VhIvF6Bt9Chc+0P3BM3fYwCsWnNSOKV8iO8kwmX
	 8jOObz7Xi+bTaL/LERt4cNTnhG8vAuqnvKcaMH34CbLZjhrOI2VMmG/A+oDOok+aFr
	 myD6FduQqcMrkcMzFgwGSnrHIjLvV74/KtgzodtyFdyb1maCjoVzWOWeygzScxqaRo
	 QWZVBioofO8MlLM+r8w7RLObUXnnP634eNjremnGFRIT0JuKDXnujQZaZUDyKKoCMc
	 fB93kke9DTtbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 09/11] iio: imu: inv_icm42607: Add Wake on Movement
 to icm42607
Reply-To: sashiko@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260509191907.24734-10-macroalpha82@gmail.com>
References: <20260509191907.24734-10-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 19:52:46 +0000
Message-Id: <20260509195247.66B49C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Self-deadlock in inv_icm42607_accel_write_event_config() due to ne=
sted mutex locking.
- [High] ABBA deadlock in inv_icm42607_suspend() between the driver mutex a=
nd disable_irq().
- [High] Data corruption and uninitialized memory access due to using a __b=
e16 array for 8-bit regmap I/O.
- [High] TOCTOU race condition in inv_icm42607_accel_write_event_config() c=
auses PM usage counter imbalances.
- [Medium] Integer overflow in Wake-on-Motion threshold calculation.
- [Medium] IIO device is registered before its interrupt handler is fully i=
nitialized.
--

commit c90077c0769c3ddde8afd25e1494bccd1e0f18d4
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Wake on Movement to icm42607

Add support for wake on movement for the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> index f90ba46bd7e48..99aaa370bd124 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
[ ... ]
> @@ -209,6 +221,178 @@ static int inv_icm42607_accel_read_sensor(struct ii=
o_dev *indio_dev,
[ ... ]
> +static unsigned int inv_icm42607_accel_convert_roc_to_wom(u64 roc,
> +							  int accel_hz, int accel_uhz)
> +{
[ ... ]
> +	freq_uhz =3D (u64)accel_hz * MICRO + (u64)accel_uhz;
> +	value =3D div64_u64(roc * MICRO, freq_uhz * (u64)convert);

Is there a risk of integer overflow when multiplying roc by MICRO?

If the user-supplied rate of change exceeds approximately 18,446, roc * MIC=
RO
will exceed U64_MAX. Could this wrap-around lead to applying a miscalculated
threshold to the sensor?

[ ... ]
> +static int inv_icm42607_accel_set_wom_threshold(struct inv_icm42607_stat=
e *st,
> +						u64 value,
> +						int accel_hz, int accel_uhz)
> +{
[ ... ]
> +	/* set accel WoM threshold for the 3 axes */
> +	st->buffer[0] =3D threshold;
> +	st->buffer[1] =3D threshold;
> +	st->buffer[2] =3D threshold;
> +	ret =3D regmap_bulk_write(st->map, INV_ICM42607_REG_ACCEL_WOM_X_THR, st=
->buffer, 3);

Can this write corrupted data?=20

st->buffer is declared as __be16 buffer[3]. Assigning an 8-bit threshold
to st->buffer[0], st->buffer[1], and st->buffer[2] writes 16-bit values.

A 3-byte regmap_bulk_write() then reads only the first 3 bytes from memory,
which writes the first byte of st->buffer[0], the second byte of
st->buffer[0], and the first byte of st->buffer[1]. Could this write 0 and
misaligned data to the WoM threshold registers?

[ ... ]
> +static int inv_icm42607_accel_write_event_config(struct iio_dev *indio_d=
ev,
> +						 const struct iio_chan_spec *chan,
> +						 enum iio_event_type type,
> +						 enum iio_event_direction dir,
> +						 bool state)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +
> +	/* handle only WoM (roc rising) event */
> +	if (type !=3D IIO_EV_TYPE_ROC || dir !=3D IIO_EV_DIR_RISING)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &st->lock) {
> +		if (st->apex.wom.enable =3D=3D state)
> +			return 0;
> +
> +	if (state)
> +		return inv_icm42607_accel_enable_wom(indio_dev);

Will this sequence cause a self-deadlock?

This function acquires st->lock via scoped_guard. It then calls
inv_icm42607_accel_enable_wom(), which calls pm_runtime_resume_and_get().

If the device is suspended, this synchronously invokes inv_icm42607_resume(=
),
which also attempts to acquire st->lock. Additionally,
_inv_icm42607_accel_enable_wom() explicitly acquires st->lock again.

Since kernel mutexes are not recursive, does this guarantee a deadlock?

> +	}
> +
> +	return inv_icm42607_accel_disable_wom(indio_dev);

Does this drop the lock before disabling WoM, opening a race condition?

If multiple threads write 0 to the sysfs node simultaneously, they could all
pass the st->apex.wom.enable =3D=3D state check inside the lock, then
sequentially call inv_icm42607_accel_disable_wom() outside the lock.

Could this cause unbalanced pm_runtime_put_autosuspend() calls and
underflow st->apex.on?

> +}
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index ce59f9337ed9b..e5d031ca631d6 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> @@ -343,6 +375,112 @@ static int inv_icm42607_setup(struct inv_icm42607_s=
tate *st,
[ ... ]
> +static irqreturn_t inv_icm42607_irq_handler(int irq, void *_data)
> +{
[ ... ]
> +	if (st->apex.on) {
> +		unsigned int status2, status3;
> +
> +		/* read INT_STATUS2 and INT_STATUS3 in 1 operation */
> +		ret =3D regmap_bulk_read(st->map, INV_ICM42607_REG_INT_STATUS2, st->bu=
ffer, 2);
> +		if (ret) {
> +			dev_err(dev, "Interrupt status read error %d\n", ret);
> +			return IRQ_HANDLED;
> +		}
> +
> +		status2 =3D st->buffer[0];
> +		status3 =3D st->buffer[1];

Can this read uninitialized memory?=20

st->buffer is declared as __be16 buffer[3], so its elements are 16 bits.
A 2-byte regmap_bulk_read() populates only the first two bytes of the array.

Assigning status2 =3D st->buffer[0] reads both bytes as a single 16-bit int=
eger,
and status3 =3D st->buffer[1] reads bytes 2 and 3, which contain uninitiali=
zed
memory.

[ ... ]
> @@ -437,6 +580,11 @@ int inv_icm42607_core_probe(struct regmap *regmap, c=
onst struct inv_icm42607_hw
>  	if (IS_ERR(st->indio_accel))
>  		return PTR_ERR(st->indio_accel);
> =20
> +	/* Initialize interrupt handling */
> +	ret =3D inv_icm42607_irq_init(st, irq, irq_type, open_drain);
> +	if (ret)
> +		return ret;
> +
>  	return 0;

Is the IIO device registered before its interrupt handler is fully initiali=
zed?

st->indio_accel is initialized, which calls devm_iio_device_register(), bef=
ore
inv_icm42607_irq_init() is called.

Could userspace open the device and enable events or buffers before the
hardware interrupt is ready?

[ ... ]
> @@ -448,6 +596,9 @@ EXPORT_SYMBOL_NS_GPL(inv_icm42607_core_probe, "IIO_IC=
M42607");
>  static int inv_icm42607_suspend(struct device *dev)
>  {
>  	struct inv_icm42607_state *st =3D dev_get_drvdata(dev);
[ ... ]
>  	guard(mutex)(&st->lock);
[ ... ]
> -	ret =3D inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
> -					 INV_ICM42607_SENSOR_MODE_OFF,
> -					 false, NULL);
> -	if (ret)
> -		return ret;
> -	regulator_disable(st->vddio_supply);
> +	/* keep chip on and wake-up capable if APEX and wakeup on */
> +	accel_dev =3D &st->indio_accel->dev;
> +	wakeup =3D st->apex.on && device_may_wakeup(accel_dev);
> +	if (wakeup) {
> +		/* keep accel on and setup irq for wakeup */
> +		accel_conf =3D st->conf.accel.mode;
> +		enable_irq_wake(st->irq);
> +		disable_irq(st->irq);

Could this cause a deadlock between the driver mutex and the interrupt hand=
ler?

inv_icm42607_suspend() takes st->lock via guard(mutex) and then calls
disable_irq().

Since disable_irq() waits for any currently executing interrupt handlers
to finish, and the threaded handler inv_icm42607_irq_handler() also attempts
to acquire st->lock, will this deadlock if the handler is running during
suspend?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509191907.2473=
4-1-macroalpha82@gmail.com?part=3D9
