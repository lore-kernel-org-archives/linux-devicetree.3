Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A7840DB48
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128187; cv=none; b=TUIZ/iNrXwdA9Fm+BiHaJhI5qsX5yMnI/hVwqJ6lIqznK5VUQ1RyzTGGvxdK0xH4Bl5lVgzPnFvCoiStb57ZIwmPfJBx980Uk7+qdxByTcnTssO9+kYw1pQjtpk+js/6P900HqMiJpv2FQJlExpCqQ3hz5amfTFlJWtZrS6zL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128187; c=relaxed/simple;
	bh=qJ1QOs0FybaBEOTUcTfHpqUuVJfJJWePhNaDTSUKkAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ckSkJp9JDhmmJkV95RY533L9cwtbYFTJIBud+rpuzaEiIMbDGUM4WXCj4Uendh8Vei3TclhzbIUpZoHRorqP7aCrP81VhvInMpu84JXGA62MEaRsuSTfH6TMJMEdqSebf3v67fvVwn9frOjWWyINHoJ3dBs9MdgFuan30xIRfEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZIMTX9Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZIMTX9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29CA1F000E9;
	Wed, 19 Aug 2026 08:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787128186;
	bh=b07dUY+k9kkhD/C+/qlFgoEFWmXKqNj0cnUhuDtBsRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VZIMTX9QCvIM4D+PROUQZLpzHqDLS0aHYxopzuytr/2Ewn+bCAiEf60TsJ4JvZkc+
	 Ruh9kIxRuXK650DgcImRb9Ed5zViuitjSMluLQaK6f9hCt9LWCmrIGGPwsyGvAfUzE
	 X5r5VUUbeD2BidPY7wjtJQweUAZi43lX7D5xgJxiFKcUfHo0Y7a9kwxFV7RILBHc4d
	 T0/y4RjHQP56XxMtqofnL0PigVZ2r7/kYXfW4YPAMdCXlvuO1mFdKwBa9ke+oIMrWA
	 1nJrZ1R3g5EAIXl10PiujAThQg2M4JEMfSAzqRS0Tk0qcq4TlTELv9WO+qTPMLz9WE
	 6RZpsM1Fel4VA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v5 5/6] iio: accel: mma8452: Allow open drain
 interrupt pin configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819-mma8452-open-drain-v5-5-d8aa590d7c36@geanix.com>
References: <20260819-mma8452-open-drain-v5-0-d8aa590d7c36@geanix.com>
 <20260819-mma8452-open-drain-v5-5-d8aa590d7c36@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 08:29:45 +0000
Message-Id: <20260819082945.F29CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Hardware interrupt polarity mismatch.
- [Low] Compilation failure due to undeclared `client` variable in `mma8452=
_runtime_suspend`.

Pre-existing issues:
- [High] Missing restore of critical device configuration registers during =
PM runtime resume.
- [High] AB-BA deadlock between driver lock and PM runtime lock.
- [High] Unpowered I2C access and data race on `ctrl_reg1` in `write_raw`.
- [High] Early interrupt registration risks NULL pointer dereference.
- [High] Unbalanced regulator disable and unpowered I2C access during drive=
r removal.
--

--- Patch [5]: [PATCH RESEND v5 5/6] iio: accel: mma8452: Allow open drain =
interrupt pin configuration ---
commit 8b317beed417968ce06b604c39245c855aa368c3
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Allow open drain interrupt pin configuration

This patch adds support for configuring the mma8452 interrupt pin in
open-drain mode. It reads the "drive-open-drain" device property and sets
the appropriate bit in CTRL_REG3 during probe and runtime resume.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 25bb2dd69381e..060a6207e52d0 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

> @@ -648,6 +651,22 @@ static int mma8452_set_power_mode(struct mma8452_dat=
a *data, u8 mode)
>  	return mma8452_change_config(data, MMA8452_CTRL_REG2, reg);
>  }
> =20
> +static int mma8452_set_interrupt_pin_mode(struct mma8452_data *data)
> +{
> +	int reg;
> +
> +	reg =3D i2c_smbus_read_byte_data(data->client, MMA8452_CTRL_REG3);
> +	if (reg < 0)
> +		return reg;
> +
> +	if (data->open_drain)
> +		reg |=3D MMA8452_CTRL_REG3_PP_OD;
> +	else
> +		reg &=3D ~MMA8452_CTRL_REG3_PP_OD;
> +
> +	return i2c_smbus_write_byte_data(data->client, MMA8452_CTRL_REG3, reg);
> +}

[Severity: High]
Does this also need to configure the interrupt polarity bit (IPOL) to match
the requested trigger type?

The driver parses the IRQ trigger type from device properties using
irq_get_trigger_type() and registers the interrupt accordingly, but it
doesn't seem to program the hardware to match.

Since the hardware defaults to active-low, could this cause missed
interrupts or interrupt storms on systems that specify an active-high
trigger?

[ ... ]

> @@ -1677,6 +1696,11 @@ static int mma8452_probe(struct i2c_client *client)
>  			goto disable_regulators;
>  	}
> =20
> +	data->open_drain =3D device_property_read_bool(dev, "drive-open-drain");
> +	ret =3D mma8452_set_interrupt_pin_mode(data);
> +	if (ret)
> +		goto trigger_cleanup;
> +
>  	data->ctrl_reg1 =3D MMA8452_CTRL_ACTIVE |

[Severity: High]
This is a pre-existing issue, but is it safe to register the interrupt
before the iio event interfaces are allocated?

In mma8452_probe(), request_threaded_irq() is called before
iio_device_register().

If the hardware generates an interrupt immediately, the handler calls
iio_push_event(), which accesses indio_dev->event_interface. Since
event_interface is only allocated during iio_device_register(), could this
cause a NULL pointer dereference?

[ ... ]

> @@ -1823,6 +1847,10 @@ static int mma8452_runtime_resume(struct device *d=
ev)
> =20
>  	WRITE_ONCE(data->suspended, false);
> =20
> +	ret =3D mma8452_set_interrupt_pin_mode(data);
> +	if (ret)
> +		goto runtime_resume_failed;
> +
>  	ret =3D mma8452_active(data);

[Severity: High]
This is a pre-existing issue, but does the driver restore all necessary
hardware configurations during runtime resume?

When regulators are physically disabled during runtime suspend, the hardware
resets to defaults.

It appears the resume path only restores CTRL_REG1 and CTRL_REG3, leaving
configurations set during probe (like MMA8452_DATA_CFG, MMA8452_CTRL_REG4,
and MMA8452_CTRL_REG5) uninitialized.

Could this result in a permanent loss of critical sensor settings?

[ ... ]

[Severity: Low]
In mma8452_runtime_suspend(), there appears to be a compilation issue:

drivers/iio/accel/mma8452.c:mma8452_runtime_suspend()
    synchronize_irq(client->irq);

The 'client' identifier is used here without being declared in this scope.
Will this cause the driver to fail to compile when CONFIG_PM is enabled?

[Severity: High]
This is a pre-existing issue, but is there a potential AB-BA deadlock betwe=
en
the driver lock and the PM runtime lock?

In mma8452_read_raw(), the driver acquires data->lock and then indirectly
calls pm_runtime_resume_and_get(), which waits for the device PM state to
change.

Concurrently, if the PM subsystem is executing mma8452_runtime_suspend(),
it holds the PM synchronization lock and attempts to acquire data->lock.

Could this lead to a system hang when user-space reads sysfs attributes whi=
le
the PM autosuspend worker runs?

[Severity: High]
This is a pre-existing issue, but is there an unpowered I2C access and data
race in the raw write path?

drivers/iio/accel/mma8452.c:__mma8452_write_raw()
    data->ctrl_reg1 &=3D ~MMA8452_CTRL_DR_MASK;
    data->ctrl_reg1 |=3D i << MMA8452_CTRL_DR_SHIFT;
    ...
    return mma8452_change_config(data, MMA8452_CTRL_REG1, data->ctrl_reg1);

This modifies data->ctrl_reg1 locklessly and accesses the hardware via
mma8452_change_config() without ensuring the device is powered on via
PM runtime.

If the device is runtime suspended, won't the I2C transaction fail?

Additionally, if a resume occurs concurrently, mma8452_runtime_resume()
reads data->ctrl_reg1, which seems to create a data race.

[Severity: High]
This is a pre-existing issue, but are regulators disabled safely during dri=
ver
removal?

drivers/iio/accel/mma8452.c:mma8452_remove()
    mma8452_standby(iio_priv(indio_dev));
    regulator_disable(data->vddio_reg);
    regulator_disable(data->vdd_reg);

If the device is already runtime-suspended, pm_runtime_disable() does not
resume the device.

Calling mma8452_standby() performs I2C writes to a powered-off sensor. Then,
regulator_disable() is called unconditionally on both regulators, decrement=
ing
their use counts below zero.

Could this cause I2C transfer failures and kernel warnings for unbalanced
regulator usage counts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mma8452-op=
en-drain-v5-0-d8aa590d7c36@geanix.com?part=3D5
