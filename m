Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6403515E6
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915663; cv=none; b=Xve3s7ER11AhWii1e9vtNJkxSq++SKFqNKgMXszlUOQKTBbP02u1Jh0IrOtrmTzTNq4IAiK6LSmHklu7DC1qITOJayUHRQ6/pIv5TUrJH2xRs3gkOnrAxqJVmpm7U+N/2kG5WE6QMYKkUPK8L6HQS/KxjyUbMCugF3HTfvMD9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915663; c=relaxed/simple;
	bh=NnNdTKca/p5BWUKCrIC/yl7YkYtvzTuz7hoK7eNl2tc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XtXc2qUhWGC61z08BRfxyWEFtDL3p+RKP8svcIOpZYx7ZnAXg2EOWb+qDujKkDKjBqUjEPAeXPR4xSk4wfMns0PqMdeVrLZ+eFEDlYbr/borlsNQsAAphGpRYJcZSVyoeORN7kgJ8RsK1gBUQ4y2acMSNnghwMQH469TRC3q7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrYtVfpR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrYtVfpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8AC1F000E9;
	Wed,  5 Aug 2026 07:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785915662;
	bh=jo7erI5uclSWFbTdEEgDBQFscfowIYWY888K2eJC7uU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PrYtVfpRr4xQOVTj6ArAdpkGRYF3JrTZp9rSQw+EoKzrOyqbTMBC8UzqxhEUS7pEy
	 vMyPJOH8mTaoZNANJ9QK+gVYu4mTwWyIHPz1ELv+i8tmirgPxuf03TbYJ8rdLEaxqY
	 Dcs6QhBZAXF0jZKrNgd7H03ym2wHoq7h1Cg3s+Qtcboo6BpbfPzsfCEXVFFrFqtAAD
	 xwcIF5Q4G99s61ptxSbGFcOAIgfT105jUaH7jPicP2uWFRYEDtBI3eRpCgvqSD+IkA
	 a4TjsRCxILkSyct6BeFsGSdY2GemIkqNxiRIIPEogRbh6YqjnLy4MG54utOqya5Ftk
	 LjnMMpXaoQP+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] iio: accel: mma8452: Allow open drain interrupt
 pin configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-mma8452-open-drain-v3-4-6149f406a409@geanix.com>
References: <20260805-mma8452-open-drain-v3-0-6149f406a409@geanix.com>
 <20260805-mma8452-open-drain-v3-4-6149f406a409@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 07:41:01 +0000
Message-Id: <20260805074101.BB8AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Shared IRQ handler unconditionally accesses I2C bus while the devi=
ce may be runtime-suspended.
- [Medium] Incorrect shared interrupt handling falsely claims unrouted inte=
rrupts, masking spurious IRQs.

Pre-existing issues:
- [High] Volatile register context is not fully restored after PM runtime r=
esume.
- [High] Unbalanced regulator disable and unpowered I2C access during devic=
e removal.
- [High] Sysfs callbacks modify cached state and access I2C without a PM ru=
ntime reference.
- [High] Reference count leak of the IIO trigger device due to unbalanced i=
io_trigger_get().
- [High] The driver ignores the requested IRQ polarity, leading to a hardwa=
re/software mismatch.
--

--- Patch [4]: [PATCH v3 4/4] iio: accel: mma8452: Allow open drain interru=
pt pin configuration ---
commit 6358f754e42af1003c7e9459771157fe3985f6bb
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Allow open drain interrupt pin configuration

This patch allows configuring the MMA8452 interrupt pin in open-drain
mode. It reads the "drive-open-drain" device property and sets the PP_OD
bit in CTRL_REG3. It also adds the IRQF_SHARED flag to allow sharing the
interrupt line with other devices.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 723ca3d9cb96b..fa0915530f953 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

> @@ -1688,7 +1712,7 @@ static int mma8452_probe(struct i2c_client *client)
>  		irq_flags =3D irq_get_trigger_type(client->irq);
>  		if (irq_flags =3D=3D IRQ_TYPE_NONE)
>  			irq_flags =3D IRQF_TRIGGER_LOW;

[Severity: High]
This is a pre-existing issue, but the driver appears to ignore the requested
IRQ polarity.

While mma8452_probe() retrieves the requested IRQ trigger type to configure
the OS handler, does the driver ever set the hardware IPOL bit (bit 1) in
CTRL_REG3 to match it?

The chip defaults to active-low, which might prevent interrupts from being
delivered if the platform specifies an active-high interrupt.

> -		irq_flags |=3D IRQF_ONESHOT;
> +		irq_flags |=3D IRQF_ONESHOT | IRQF_SHARED;

[Severity: High]
Does adding IRQF_SHARED here make it possible for the interrupt handler to
run while the MMA8452 device is runtime-suspended?

When another device on the shared line triggers an interrupt,
mma8452_interrupt() is invoked and unconditionally reads MMA8452_INT_SRC
over I2C:

mma8452_interrupt()
    src =3D i2c_smbus_read_byte_data(data->client, MMA8452_INT_SRC);

If the device utilizes runtime PM and powers off its regulators when
suspended, would this unpowered I2C access cause transfer failures or lock
up the bus?

[Severity: Medium]
Additionally, is the interrupt handler equipped to properly reject spurious
interrupts on a shared line?

With IRQF_SHARED, mma8452_interrupt() will run for other devices'
interrupts. It unconditionally checks the DRDY bit:

mma8452_interrupt()
    if (src & MMA8452_INT_DRDY) {
        iio_trigger_poll_nested(indio_dev->trig);
        ret =3D IRQ_HANDLED;
    }

Since DRDY indicates data is ready even if the DRDY interrupt is not routed
to the pin in CTRL_REG4, could this falsely claim unrouted interrupts and
mask IRQ storms from a faulty shared line?

>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
>  					   irq_flags, client->name, indio_dev);
>  		if (ret)

[ ... ]

> @@ -1806,6 +1830,10 @@ static int mma8452_runtime_resume(struct device *d=
ev)
>  		return ret;
>  	}
> =20
> +	ret =3D mma8452_set_interrupt_pin_mode(data);
> +	if (ret)
> +		goto runtime_resume_failed;
> +
>  	ret =3D mma8452_active(data);

[Severity: High]
This is a pre-existing issue, but does mma8452_runtime_resume() fully resto=
re
the volatile register context after a PM runtime suspend cycle?

mma8452_runtime_suspend() disables regulators, cutting power to the chip.
When resuming, CTRL_REG3 and CTRL_REG1 are restored, but are other volatile
registers like DATA_CFG, TRANSIENT_THS, CTRL_REG4/5, and FF_MT_CFG left
unconfigured?

Could this cause the device to lose its sample rate, thresholds, and
interrupt routing after the first auto-suspend cycle?

While reviewing the PM runtime and cleanup paths, a few other pre-existing
issues were noticed:

[Severity: High]
This is a pre-existing issue, but does mma8452_remove() safely handle
removing a runtime-suspended device?

mma8452_remove()
    mma8452_standby(iio_priv(indio_dev));
    regulator_disable(data->vddio_reg);
    regulator_disable(data->vdd_reg);

This unconditionally writes to I2C and disables regulators without
guaranteeing the device is in an active PM state via pm_runtime_get_sync().
If the device is already runtime-suspended, the regulators were already
disabled. Could this double-disable regulators and cause unpowered I2C
access?

[Severity: High]
This is a pre-existing issue, but do sysfs callbacks like
__mma8452_write_raw() modify cached state and access I2C without a PM
runtime reference?

__mma8452_write_raw()
    data->ctrl_reg1 &=3D ~MMA8452_CTRL_DR_MASK;
    data->ctrl_reg1 |=3D i << MMA8452_CTRL_DR_SHIFT;
    ...
    return mma8452_change_config(data, MMA8452_CTRL_REG1, data->ctrl_reg1);

If the device is in auto-suspend (regulators off) when user-space writes to
sysfs attributes, would the I2C writes fail and corrupt the cached driver
state?

[Severity: High]
This is a pre-existing issue, but is there a reference count leak of the IIO
trigger device?

In mma8452_trigger_setup(), an extra reference is acquired:

    indio_dev->trig =3D iio_trigger_get(trig);

However, mma8452_trigger_cleanup() unregisters the trigger but does not
appear to drop the reference with iio_trigger_put(). Could this permanently
elevate the reference count and prevent the module from being unloaded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-mma8452-op=
en-drain-v3-0-6149f406a409@geanix.com?part=3D4
