Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EECA4854F5
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793481; cv=none; b=IJh5e+31wag85rHps9RcszDNe/tF8UM3abZCWe/EGg5sEqNskBaDckz2stmGmcji2pDJfKRXIMWmvQR2Ie0sKC9Tzdpn8Ttl3fwYqrG/8PxBwi6fjSvbPBA2zmGR+aasHBlRV5xCgW4vqgNdDrzsNzosh7fJa8NHEsxG2eRizUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793481; c=relaxed/simple;
	bh=rICPP0tWv+S1wFDH47YWHeiHDT+To1voCXQ+G5ovqew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G1ZLCKt57RFanek5XoaEjFUQULh1AtvikRSxEOhI6amzHrOa7uXDF075z2U7um0v3yxRf8wizeK3W50+h50J5Be/fWaN+nOrdGP4E1tWX2psKCO5s7d5PY5vwOq1YzIBpVEWVr/3xL7USGu35VEjcFWCent86zngpuoGkpDiGCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2hpEYag; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2hpEYag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE271F00ACA;
	Mon,  7 Sep 2026 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788793480;
	bh=BqjlVg2CwLgkKKOuv+5XjvYQbbq3+C2IADr0qp4G0LA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2hpEYagM7aBHpT4o5vIuhOxNtMnPp6S1RMpEjFNXcz0fVoNc3TCUozWy02WQToSC
	 yxXjJYi793jzrJxuWR6n/lULDsfryAVmCPNq0rJaweTrE7vV6fPhhWa8TE5Crizn6N
	 mXBux0GLkfbry59/eVI5X9J2wCVj3w3lv0JgxvUo0CO2fjNltUdLvm3Q7WgGYSHMlc
	 f3HKdomyJTjrv+sUzOKKCJ4tNFA4dlKqQQgpRJGy0nYtz5olb0YoMBLhRqc0D+e2V5
	 aT8/QjrFukSe3JatoWWwwhmXGx2AdvPnWZozB4/g+fIDmWaJKEWV7zrsgJyesKHQzl
	 G7lyfnQ9Ybx+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/9] iio: accel: mma8452: Fix use-after-free bug in
 error error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907-mma8452-open-drain-v8-2-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
 <20260907-mma8452-open-drain-v8-2-c17407e22118@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 15:04:39 +0000
Message-Id: <20260907150439.CCE271F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing runtime PM synchronization in mma8452_remove() leads to un=
balanced regulator disables and I2C access on unpowered hardware.
- [High] AB-BA deadlock between data->lock and PM runtime suspend
- [High] PM runtime usage count leak on I2C read/write error paths.
- [Medium] Missing device standby transition in the probe error path leads =
to a power leak.
- [Medium] Unsafe hardware access during probe due to lack of runtime PM re=
ference.
- [Low] The driver unconditionally assigns its dev_pm_ops structure to the =
driver.pm pointer without using the pm_ptr() macro.
--

commit 503a115bc0b7e45c93abce9002f8c8156306a6c0
Author: Esben Haabendal <esben@geanix.com>

    iio: accel: mma8452: Fix use-after-free bug in error error path
   =20
    If mma8452_probe() fails in iio_device_register() or later, we could en=
d up
    with runtime suspend callback being called with a now freed device poin=
ter.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index fe62a903f0e22..a937cbd84f300 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

>  static int mma8452_read(struct mma8452_data *data, __be16 buf[3])
>  {
>  	int ret =3D mma8452_drdy(data);
> =20
>  	if (ret < 0)
>  		return ret;
> =20
>  	ret =3D mma8452_set_runtime_pm_state(data->client, true);
>  	if (ret)
>  		return ret;
> =20
>  	ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
>  					    3 * sizeof(__be16), (u8 *)buf);
>  	if (ret < 0)
>  		return ret;

[Severity: High]
This is a pre-existing issue, but does this code permanently leak the PM us=
age
count on I2C read error paths?

If pm_runtime_resume_and_get() increments the usage count via
mma8452_set_runtime_pm_state(), but the subsequent i2c_smbus_read_i2c_block=
_data()
fails, this returns early without calling pm_runtime_put_autosuspend().

A similar leak appears to exist in mma8452_write_event_config():

drivers/iio/accel/mma8452.c:mma8452_write_event_config() {
    ...
	ret =3D mma8452_set_runtime_pm_state(data->client, state);
	if (ret)
		return ret;

	switch (dir) {
	...
	case IIO_EV_DIR_RISING:
		val =3D i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);
		if (val < 0)
			return val;
    ...
}

Does this permanently break power management for the device on any transien=
t I2C
bus error?

[ ... ]

>  static int mma8452_read_raw(struct iio_dev *indio_dev,
>  			    struct iio_chan_spec const *chan,
>  			    int *val, int *val2, long mask)
>  {
>  	struct mma8452_data *data =3D iio_priv(indio_dev);
>  	__be16 buffer[3];
>  	int i, ret;
> =20
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW: {
>  		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
>  		if (IIO_DEV_ACQUIRE_FAILED(claim))
>  			return -EBUSY;
> =20
>  		guard(mutex)(&data->lock);
> =20
>  		ret =3D mma8452_read(data, buffer);

[Severity: High]
This isn't a bug introduced by this patch, but does this create an AB-BA
deadlock between data->lock and PM runtime suspend?

If a userspace read via mma8452_read_raw() acquires data->lock and then cal=
ls
pm_runtime_resume_and_get() (inside mma8452_read()), the PM core will wait =
if a
suspend is in progress.

Concurrently, the autosuspend worker might execute mma8452_runtime_suspend()
and block waiting to acquire data->lock:

drivers/iio/accel/mma8452.c:mma8452_runtime_suspend() {
    ...
	scoped_guard(mutex, &data->lock)
		ret =3D mma8452_standby(data);
    ...
}

Could unprivileged userspace trigger a deadlock by repeatedly reading raw d=
ata
while the autosuspend timer expires?

[ ... ]

> @@ -1681,7 +1681,7 @@ static int mma8452_probe(struct i2c_client *client)
> =20
>  	ret =3D iio_device_register(indio_dev);
>  	if (ret < 0)
> -		goto free_irq;
> +		goto runtime_suspend;
> =20
>  	ret =3D mma8452_set_freefall_mode(data, false);

[Severity: Medium]
This is a pre-existing issue, but does this allow unsafe hardware access du=
ring
probe due to lack of a runtime PM reference?

Because probe does not hold a runtime PM reference (usage count is 0) after
iio_device_register(), userspace or a concurrent PM transition could suspend
the device. This might turn off regulators before mma8452_set_freefall_mode=
()
performs I2C access, resulting in a bus error.

>  	if (ret < 0)
>  		goto unregister_device;
> =20
>  	return 0;
> =20
>  unregister_device:
>  	iio_device_unregister(indio_dev);
> =20
> +runtime_suspend:
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);

[Severity: Medium]
This is a pre-existing issue, but does the error path miss a device standby
transition, leading to a power leak?

If probe fails after iio_device_register() (e.g., mma8452_set_freefall_mode=
()
fails), the device is left in the ACTIVE state. The error path disables
regulators below, but if they are shared with other active devices, the
regulators stay on.

Since mma8452_standby() is not called here, could the device remain active =
and
continue to draw power indefinitely?

[ ... ]

>  static void mma8452_remove(struct i2c_client *client)
>  {
>  	struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>  	struct mma8452_data *data =3D iio_priv(indio_dev);
>  	struct device *dev =3D &client->dev;
> =20
>  	iio_device_unregister(indio_dev);
> =20
>  	pm_runtime_disable(dev);
>  	pm_runtime_set_suspended(dev);
> =20
>  	if (client->irq)
>  		free_irq(client->irq, indio_dev);
> =20
>  	iio_triggered_buffer_cleanup(indio_dev);
>  	mma8452_trigger_cleanup(indio_dev);
>  	mma8452_standby(iio_priv(indio_dev));
> =20
>  	regulator_bulk_disable(ARRAY_SIZE(data->regs), data->regs);

[Severity: High]
This is a pre-existing issue, but does missing runtime PM synchronization
in mma8452_remove() lead to unbalanced regulator disables and I2C access on
unpowered hardware?

If the device is runtime-suspended during module removal, its regulators are
already disabled. pm_runtime_disable() does not resume the device, so
mma8452_standby() attempts an I2C write on unpowered hardware, causing bus
errors.

Additionally, regulator_bulk_disable() would be called again on an already
disabled regulator, which triggers a kernel warning.

[ ... ]

>  static struct i2c_driver mma8452_driver =3D {
>  	.driver =3D {
>  		.name	=3D "mma8452",
>  		.of_match_table =3D mma8452_dt_ids,
>  		.pm	=3D &mma8452_pm_ops,

[Severity: Low]
This isn't a bug introduced by this patch, but should this assignment use
the pm_ptr() macro?

The dev_pm_ops structure is unconditionally assigned here. When CONFIG_PM is
disabled, the PM ops structure will still be referenced, creating dead code
and violating the PM subsystem conditional compilation guidelines.

>  	},
>  	.probe =3D mma8452_probe,
>  	.remove =3D mma8452_remove,
>  	.id_table =3D mma8452_id,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-mma8452-op=
en-drain-v8-0-c17407e22118@geanix.com?part=3D2
