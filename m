Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3D4501F5D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793728; cv=none; b=FpH2atvbXsAuTtTnck2nVYeqcjzJxhnIIzNEqJJchah1pk0y0zXPY/D9AAxd5Z+gNVyhObw/QtYsZgeTi/qxT8Fk42nceXahHUDRUZidM5Nhpmhorio+97Im/1U77J0oJ/IRTuOLhNPtvi1kQeDVwLsAH/n+OHih+DhN0cHww/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793728; c=relaxed/simple;
	bh=JarFdXgchF6OcDmUwD14yIRDfTAXmnWO4BwYUcom+oE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G6IlKc43eCSI4OhMy+fiM9KrD0y82M4q5/xgapdG3nPXMEzW6pEjACesyltORJPvHTs7xuK8d9xiqFaoei6hr51pObmXrqVbn7DEX+iMlx8mgW+gvNEj2ZwHoCrhZACCsTe1BFarhxa5FeDJgNOX3gfOgWNz5JGXod46+Oe4+J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SoRPEUdj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SoRPEUdj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC741F00A3A;
	Mon,  7 Sep 2026 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788793726;
	bh=JCkEm5hM7qJGkhuYBacMkskX9jh/NQEh5XxcFkgx1Yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SoRPEUdjDAhqsPrYLeSb7/UQI/rrylKD0Ol//b99XNLowkBJV/3DqVlb3MzsguTie
	 6A9NjSbWDcmho39sQFN/dxbzlPfrxEIvD5CajYBaXfETMLpORwIVhCCMNhBaA/giJE
	 cox4wQ95yCm/jKy+mZErwOm4Yv8HfC90dMKizFnVryew0xcwmtbmUlKGjt+jug5H6z
	 ZqqSnI/proCAdxMgs78BfeC/IlIlEodIsPK3pJkH0QWnonSOsS/xAIg7bgFyDl6pKL
	 +kClQ8yUO3pwIGGfGDZK23vbvmgAU0s7gemc9CQFZk12Aq/f07QjEtlmdHLAO4P0mR
	 pzuqpURtoGDxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 9/9] iio: accel: mma8452: Support interrupt sharing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-mma8452-open-drain-v8-9-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
 <20260907-mma8452-open-drain-v8-9-c17407e22118@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 15:08:46 +0000
Message-Id: <20260907150846.8BC741F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] Writing to MMA8452_CTRL_REG4 to disable interrupt sources fail=
s because the device is still in ACTIVE mode.
- [High] The IRQ handler incorrectly checks `pm_status =3D=3D 0` instead of=
 `pm_status <=3D 0`, allowing invalid hardware access when PM is disabled.
- [Low] Mixing goto-based error handling with guard() cleanup in the same f=
unction.

Pre-existing issues:
- [High] Hardware access occurs after dropping the runtime PM reference in =
mma8452_write_event_config.
- [High] AB-BA deadlock between the driver's data->lock and the PM core's r=
untime suspend wait.
--

commit 3d8bf763b3ae36284346684babbd11058f68e68a
Author: Esben Haabendal <esben@geanix.com>
Date:   Mon Sep 7 14:51:04 2026 +0000

    iio: accel: mma8452: Support interrupt sharing
   =20
    Adding support for sharing interrupt line with other device requires the
    interrupt handler to handle runtime PM suspension properly, ignoring the
    irq if the device is suspended (maybe even off). And while at it, we use
    the PM reference to ensure we do not get suspended while processing an =
irq.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index fda29df5d1097..e521dca37f768 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
[ ... ]
> @@ -1083,15 +1085,21 @@ static irqreturn_t mma8452_interrupt(int irq, voi=
d *p)
>  {
>  	struct iio_dev *indio_dev =3D p;
>  	struct mma8452_data *data =3D iio_priv(indio_dev);
> +	struct device *dev =3D &data->client->dev;
>  	irqreturn_t ret =3D IRQ_NONE;
> +	int pm_status;
>  	int src;
> =20
> +	pm_status =3D pm_runtime_get_if_active(dev);
> +	if (pm_status =3D=3D 0)
> +		return IRQ_NONE; /* device is powered down */
> +

[Severity: High]
Does this check fail to catch negative error codes, allowing the handler to
proceed and access unpowered hardware?

When runtime PM is disabled, pm_runtime_get_if_active() returns -EINVAL. Th=
is
can happen during driver unbind or removal, as pm_runtime_disable() is call=
ed
before free_irq():

drivers/iio/accel/mma8452.c:mma8452_remove() {
	...
	pm_runtime_disable(dev);
	pm_runtime_set_suspended(dev);

free_irq:
	if (client->irq)
		free_irq(client->irq, indio_dev);
	...
}

If a shared IRQ fires concurrently after PM is disabled, this check allows
the handler to proceed, leading to I2C bus timeouts or system hangs.

>  	src =3D i2c_smbus_read_byte_data(data->client, MMA8452_INT_SRC);
[ ... ]
> @@ -1784,29 +1796,62 @@ static void mma8452_remove(struct i2c_client *cli=
ent)
>  #ifdef CONFIG_PM
>  static int mma8452_runtime_suspend(struct device *dev)
>  {
> -	struct iio_dev *indio_dev =3D i2c_get_clientdata(to_i2c_client(dev));
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>  	struct mma8452_data *data =3D iio_priv(indio_dev);
>  	int ret;
> =20
> -	scoped_guard(mutex, &data->lock)
> -		ret =3D mma8452_standby(data);
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D i2c_smbus_read_byte_data(client, MMA8452_CTRL_REG4);
>  	if (ret < 0) {
> -		dev_err(dev, "powering off device failed\n");
> +		dev_warn(dev, "backing up CTRL_REG4 failed\n");
>  		return -EAGAIN;
> +	} else
> +		data->ctrl_reg4 =3D ret;
> +
> +	ret =3D i2c_smbus_write_byte_data(client, MMA8452_CTRL_REG4, 0);
> +	if (ret) {
> +		dev_warn(dev, "disabling interrupt sources (CTRL_REG4) failed\n");
> +		return -EAGAIN;
> +	}

[Severity: Critical]
Does writing to MMA8452_CTRL_REG4 fail here because the device is still in
ACTIVE mode?

Since the write happens before mma8452_standby(), the hardware ignores it
(as modifying configs requires STANDBY mode). This leaves interrupt sources
enabled. If a shared IRQ fires, the handler will return IRQ_NONE due to the
pm_status check, leaving the interrupt asserted and causing a level-trigger=
ed
interrupt storm.

> +
> +	ret =3D mma8452_standby(data);
> +	if (ret < 0) {
> +		dev_err(dev, "transition to STANDBY mode failed\n");
> +		ret =3D -EAGAIN;
> +		goto out_restore_ctrl_reg4;
>  	}

[Severity: Low]
Does this mix goto-based error handling with guard() cleanup in the same
function?

The cleanup subsystem guidelines state that mixing goto and scope-based cle=
anup
creates confusing ownership semantics.

[ ... ]

As a side note, there are a couple of pre-existing issues in this file that
are not introduced by this patch, but are worth mentioning:

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-put in
mma8452_write_event_config() when disabling an event?

drivers/iio/accel/mma8452.c:mma8452_write_event_config() {
	...
	ret =3D mma8452_set_runtime_pm_state(data->client, state);
	if (ret)
		return ret;

	switch (dir) {
	case IIO_EV_DIR_FALLING:
		return mma8452_set_freefall_mode(data, state);
	case IIO_EV_DIR_RISING:
		val =3D i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);
	...
}

When state is false, mma8452_set_runtime_pm_state() calls
pm_runtime_put_autosuspend(), dropping the PM reference early. The subseque=
nt
i2c_smbus_read_byte_data() accesses hardware while the device could be
concurrently suspended, potentially causing I2C transaction failures.


[Severity: High]
This is a pre-existing issue, but does mma8452_read_raw() create an AB-BA
deadlock with PM suspend?

drivers/iio/accel/mma8452.c:mma8452_read_raw() {
	...
		guard(mutex)(&data->lock);

		ret =3D mma8452_read(data, buffer);
	...
}

mma8452_read() calls mma8452_set_runtime_pm_state(..., true), triggering a
synchronous PM resume. If a concurrent PM suspend is initiated by the PM
core, it sets the status to RPM_SUSPENDING and calls
mma8452_runtime_suspend():

drivers/iio/accel/mma8452.c:mma8452_runtime_suspend() {
	...
	guard(mutex)(&data->lock);
	...
}

The suspend callback will block waiting for data->lock, while
mma8452_read_raw() blocks waiting for the RPM_SUSPENDING state to clear,
resulting in a deadlock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-mma8452-op=
en-drain-v8-0-c17407e22118@geanix.com?part=3D9
