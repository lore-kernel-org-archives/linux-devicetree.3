Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649B13E3D8C
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852543; cv=none; b=H4KHGxDUN/VcmeVYN6FWt0p7qrgJwT9I4+lb/zHxu2EXWK+UIuUXNamNTD343bYc02cFKFv7OklbuU2WIPOVpgeraAw7H+2ZmSgFEm4jyY9SIS4X6MHc/tOQnVWXSkKYFIBE60yINZeWZsN8SGlNoH0kneeV7pXTs77OgkAI0LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852543; c=relaxed/simple;
	bh=AGHZ46JBn5h0r1Nugm8jUZbGkkYQfCRH0uM1pUv42wY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GyqzJf+htTvQHm8MdZRD/eaPAuWAFxpjpST2gZ9kvaIHaoztnmiC+L2AtNFgYXIEJ++QHE9Xkc90xuabxhZ3aEyYmE+LdrLlQ0jjyhJBR1n3BfsAKjhDKmyMxwko6tCcx2r9RHGKujYZbdgpWjAvGxRdRGYJjHuyGx9LC7VwaAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ccc1VfVu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ccc1VfVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFD5C2BCB0;
	Fri, 15 May 2026 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778852543;
	bh=AGHZ46JBn5h0r1Nugm8jUZbGkkYQfCRH0uM1pUv42wY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ccc1VfVuQKIAg5s0ACi4a9KE5QfHvIg5Hyi266qXIuusnKcXdreWxVbiDoq4M2DVc
	 CXHixbk+FIj4CxoyU/wQ1clxA6U7WIHRF/MrzrSN8KOBfSWMlnTwohSv3upjH/v8yr
	 k1r75tUihrg+Dx+NmFzWEWWgKcN64kxB1XTVKd5RJygZcnux9xNujML4OtiKBqRPaX
	 eBsZ1Oov5QJr/VcSmCzOmeuyjKKZHpzh8NZ7ZHQify6ieCW/0UM0lnAMw5GrBpewRh
	 jgGpJesyHqEKu2LY+oeoqkvioJKYFBnV0IWaCbBs5XKezfDjTeaY+QthOIsLUs0aoy
	 FYxa9fbsRTtxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V7 09/11] iio: imu: inv_icm42607: Add Wake on Movement
 to icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515130018.237378-10-macroalpha82@gmail.com>
References: <20260515130018.237378-10-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 13:42:22 +0000
Message-Id: <20260515134222.CBFD5C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] TOCTOU race in event configuration leaks PM references and leaves =
sensor permanently powered on.
- [High] Disabling the IIO buffer unconditionally powers off the accelerome=
ter, breaking Wake-on-Motion.
- [High] Deadlock avoidance in `inv_icm42607_suspend()` allows the threaded=
 IRQ handler to access a suspended bus.
- [High] I2C failure in `inv_icm42607_mreg_write()` leaves the device trapp=
ed in the wrong register bank.
- [Medium] Error path in WoM enablement leaves the accelerometer's software=
 state cached as ON, causing a permanent power leak.
- [Medium] Error path in ODR write desynchronizes the FIFO watermark and ti=
ming state from the hardware.
- [Medium] The driver leaks a runtime PM usage count if unbound while the W=
ake-on-Motion event is active.
- [Low] The driver silently ignores WoM threshold configurations for the IC=
M42607P variant while returning success to userspace.
--

commit 38592461f791657cf708b555278a27f572c997e7
Author: Chris Morgan <macromorgan@hotmail.com>
Subject: iio: imu: inv_icm42607: Add Wake on Movement to icm42607

Add support for wake on movement for the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> index b354a84fd2ed4..504245b0282bf 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c

[ ... ]

> @@ -209,6 +221,181 @@ static int inv_icm42607_accel_read_sensor(struct ii=
o_dev *indio_dev,
>  	return 0;
>  }
> =20
> +static unsigned int inv_icm42607_accel_convert_roc_to_wom(u64 roc,
> +							  int accel_hz, int accel_uhz)

[ ... ]

> +static int inv_icm42607_accel_set_wom_threshold(struct inv_icm42607_stat=
e *st,
> +						u64 value,
> +						int accel_hz, int accel_uhz)
> +{
> +	unsigned int threshold;
> +	int i, ret;
> +
> +	/* convert roc to wom threshold and convert back to handle clipping */
> +	threshold =3D inv_icm42607_accel_convert_roc_to_wom(value, accel_hz, ac=
cel_uhz);
> +	value =3D inv_icm42607_accel_convert_wom_to_roc(threshold, accel_hz, ac=
cel_uhz);
> +
> +	dev_dbg(regmap_get_device(st->map), "wom_threshold: 0x%x\n", threshold);
> +
> +	st->apex.wom.value =3D value;
> +
> +	/* 42607P cannot set WoM threshold. */
> +	if (st->hw->whoami =3D=3D INV_ICM42607P_WHOAMI)
> +		return 0;

Should this return -EOPNOTSUPP instead of 0? Returning 0 updates the cached
value in st->apex.wom.value and signals success to userspace, even though t=
he
hardware configuration isn't changed for the 42607P variant.

> +
> +	/* set accel WoM threshold for the 3 axes */
> +	for (i =3D 0; i < 3; i++) {
> +		ret =3D inv_icm42607_mreg_write(st->map, INV_ICM42607_MREG_2,
> +					      INV_ICM42607_REG_ACCEL_WOM_X_THR + i,
> +					      threshold);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int _inv_icm42607_accel_enable_wom(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	struct inv_icm42607_sensor_state *accel_st =3D iio_priv(indio_dev);
> +	struct inv_icm42607_sensor_conf conf =3D INV_ICM42607_SENSOR_CONF_INIT;
> +	unsigned int sleep_ms =3D 0;
> +	int ret;
> +
> +	scoped_guard(mutex, &st->lock) {
> +		/* turn on accel sensor */
> +		conf.mode =3D accel_st->power_mode;
> +		conf.filter =3D accel_st->filter;
> +		ret =3D inv_icm42607_set_accel_conf(st, &conf, &sleep_ms);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (sleep_ms)
> +		msleep(sleep_ms);
> +
> +	scoped_guard(mutex, &st->lock) {
> +		ret =3D inv_icm42607_enable_wom(st);
> +		if (ret)
> +			return ret;

If inv_icm42607_enable_wom() fails here, does the accelerometer remain powe=
red
on? The earlier call to inv_icm42607_set_accel_conf() enabled it, but an
early return leaves the hardware in the ON state without reverting
st->conf.accel.mode to OFF.=20

During system or runtime suspend, this ON state would be cached in
st->suspended.accel, and on all future resumes, the accelerometer might be
redundantly powered on.

> +		st->apex.on++;
> +		st->apex.wom.enable =3D true;
> +	}
> +
> +	return 0;
> +}
> +
> +static int inv_icm42607_accel_enable_wom(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	struct device *pdev =3D regmap_get_device(st->map);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(pdev);

Is a devres action or remove callback needed to disable the event and drop =
the
PM runtime usage count? If the device is unbound via sysfs or the module is
unloaded while the Wake-on-Motion event is active, the PM usage count might
be leaked, keeping the hardware powered on.

> +	if (ret)
> +		return ret;
> +
> +	ret =3D _inv_icm42607_accel_enable_wom(indio_dev);
> +	if (ret) {
> +		pm_runtime_put_autosuspend(pdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int _inv_icm42607_accel_disable_wom(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	struct inv_icm42607_sensor_conf conf =3D INV_ICM42607_SENSOR_CONF_INIT;
> +	unsigned int sleep_ms =3D 0;
> +	int ret;
> +
> +	scoped_guard(mutex, &st->lock) {
> +		/*
> +		 * Consider that turning off WoM is always working to avoid
> +		 * blocking the chip in on mode and prevent going back to sleep.
> +		 * If there is an error, the chip will anyway go back to sleep
> +		 * and the feature will not work anymore.
> +		 */
> +		st->apex.wom.enable =3D false;
> +		st->apex.on--;
> +		inv_icm42607_disable_wom(st);
> +		/* turn off accel sensor if not used */
> +		if (!st->apex.on && !iio_buffer_enabled(indio_dev)) {
> +			conf.mode =3D INV_ICM42607_SENSOR_MODE_OFF;
> +			ret =3D inv_icm42607_set_accel_conf(st, &conf, &sleep_ms);
> +			if (ret)
> +				return ret;
> +		}
> +	}

Does disabling the IIO buffer unconditionally power off the accelerometer in
inv_icm42607_buffer_postdisable()? If a user enables the Wake-on-Motion
feature (which requires the accelerometer to remain in LOW_NOISE mode) and
subsequently starts then stops the IIO buffer, it appears the sensor could
be physically powered down, preventing the Wake-on-Motion detection from
functioning.

[ ... ]

> @@ -329,6 +516,10 @@ static int inv_icm42607_accel_write_odr(struct iio_d=
ev *indio_dev,
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D inv_icm42607_accel_set_wom_threshold(st, st->apex.wom.value, va=
l, val2);
> +	if (ret)
> +		return ret;
> +

If this fails, does it leave the hardware ODR out of sync with the driver's
FIFO timing state? The earlier code updated the hardware ODR, but returning
early here skips inv_icm42607_buffer_update_fifo_period() and
inv_icm42607_buffer_update_watermark().

>  	inv_icm42607_buffer_update_fifo_period(st);
>  	inv_icm42607_buffer_update_watermark(st);
> =20

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
> +	}
> +
> +	if (state)
> +		return inv_icm42607_accel_enable_wom(indio_dev);
> +
> +	return inv_icm42607_accel_disable_wom(indio_dev);
> +}

Does this introduce a race condition? Since the lock is dropped before call=
ing
inv_icm42607_accel_enable_wom(), if two threads concurrently enable the eve=
nt,
both could pass the check and execute the enable function.

This would call pm_runtime_resume_and_get() twice and increment st->apex.on
twice. A subsequent disable operation will only execute once due to the same
check, leaking a runtime PM reference and keeping the device powered on.

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 1e685451f7850..8ab8b5f739f2b 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> @@ -17,6 +17,57 @@
>  #include "inv_icm42607.h"
>  #include "inv_icm42607_buffer.h"
> =20
> +/**
> + *  inv_icm42607_mreg_write() - Write value to user bank

[ ... ]

> +	/*
> +	 * Write bank, register, and value in one bulk write. Then pause
> +	 * the required time according to datasheet.
> +	 */
> +	ret =3D regmap_bulk_write(map, INV_ICM42607_BLK_SEL_W, buffer, 3);
> +	fsleep(INV_ICM42607_MREG_DELAY_US);
> +	if (ret)
> +		return ret;
> +
> +	/* Switch back to bank1 and pause the required amount of time. */
> +	ret =3D regmap_write(map, INV_ICM42607_BLK_SEL_W, INV_ICM42607_MREG_1);

If this regmap_bulk_write() fails, will the device be left permanently in b=
ank
2 or 3? Returning early skips the write to switch back to INV_ICM42607_MREG=
_1.
All subsequent generic register accesses (such as reading INT_STATUS2 in the
IRQ handler) would read from the wrong bank and receive invalid data.

> +	fsleep(INV_ICM42607_MREG_DELAY_US);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

[ ... ]

> @@ -466,6 +668,9 @@ EXPORT_SYMBOL_NS_GPL(inv_icm42607_core_probe, "IIO_IC=
M42607");
>  static int inv_icm42607_suspend(struct device *dev)
>  {
>  	struct inv_icm42607_state *st =3D dev_get_drvdata(dev);
> +	struct device *accel_dev;
> +	bool wakeup;
> +	int accel_conf;
>  	int ret;
> =20
>  	guard(mutex)(&st->lock);
> @@ -482,12 +687,36 @@ static int inv_icm42607_suspend(struct device *dev)
>  			return ret;
>  	}
> =20
> -	ret =3D inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
> -					 INV_ICM42607_SENSOR_MODE_OFF,
> -					 false, NULL);
> -	if (ret)
> -		return ret;
> -	inv_icm42607_disable_vddio_reg(st);
> +	/* keep chip on and wake-up capable if APEX and wakeup on */
> +	accel_dev =3D &st->indio_accel->dev;
> +	wakeup =3D st->apex.on && device_may_wakeup(accel_dev);
> +	if (wakeup) {
> +		/* keep accel on and setup irq for wakeup */
> +		accel_conf =3D st->conf.accel.mode;
> +		enable_irq_wake(st->irq);
> +		disable_irq_nosync(st->irq);

Could this lead to an I2C/SPI access on a suspended bus?

If the threaded IRQ handler is currently executing and blocked waiting for
st->lock, disable_irq_nosync() will return without waiting for it. Once this
suspend function drops the lock, the PM core proceeds to suspend the parent
controller.

The unblocked IRQ handler would then acquire the lock and attempt to read v=
ia
regmap_bulk_read(), potentially causing a timeout or kernel panic on the
suspended bus.

> +		ret =3D inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
> +						 accel_conf, false, NULL);
> +		if (ret) {
> +			enable_irq(st->irq);
> +			disable_irq_wake(st->irq);
> +			return ret;
> +		}
> +	} else {
> +		/* disable APEX features and accel if wakeup disabled */
> +		if (st->apex.wom.enable) {
> +			ret =3D inv_icm42607_disable_wom(st);
> +			if (ret)
> +				return ret;
> +		}
> +		accel_conf =3D INV_ICM42607_SENSOR_MODE_OFF;
> +		ret =3D inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
> +						 INV_ICM42607_SENSOR_MODE_OFF,
> +						 false, NULL);
> +		if (ret)
> +			return ret;
> +		inv_icm42607_disable_vddio_reg(st);
> +	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515130018.2373=
78-1-macroalpha82@gmail.com?part=3D9
