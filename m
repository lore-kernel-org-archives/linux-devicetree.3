Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F60DF76
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647506; cv=none; b=JfkEKW0Qdw0ExYTE3cFTq1CGPdn76nzxrzFJbJKkjhhqyGUfnKCNRFci7CUtuwiHOKWH8xUSahrT1eKq9gqqOycCORW8yjGyCAkbaO41PopTzmx1abJecFdneFpbwmLg5W18/O6rWXjkvrY2/EE1eRX53XmgasGLYBgeEDIZo9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647506; c=relaxed/simple;
	bh=ehwP5axgI1yTHZkJk2xRmSYuhHQHUasCI+C5hilBWMk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P+AaI3l1OAlRqrvk061dc0Jh1nU4g9z/m6GgNxd15vPYhQfg8BuEGIBArcPDhQKTSHIVNYe93c0pKuuBwO0E/KbIAoQJ2/dklBqC1XUJbgpePa9PZrmkHMXswr0MRvY9NKRRuA1fAIITQ24+LyiwxP9WeDwrgPbqbKZOaKzsGKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9zNRujK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9zNRujK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778091F000E9;
	Tue, 25 Aug 2026 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787647504;
	bh=+nN8E1NeYFR918nk422/e+nsDkePGCcJMmfvy6jhhdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G9zNRujK/SsnDQwMIBybCmhbjl7/kvvApdx4N5pNn54fOuOtGX1ee4fab9AcPwZTN
	 /1Q0azMiBn1Hq+2AyFAvd5cXhQxTRYzpJ+ai8P95t/fCIvLEp6XX2Lqfw7jNE0Hkov
	 bXg4jM5dOujoe5zFDBKefzd3QirkZaBYA7yeWto8bd3iFp6aagZkWi5TVyiVf2k7Ka
	 sO9falmQrKc6A9BLqZ6OFD2GZKERbxXpeO0hu4T+KS8Tc2JncGEFNS9MyQf//OH6jv
	 Qi9oCBsydHIMzlFB7tX63yESYs8UtMvuPeenTCeQscq0DCWvFXnt5J17ngyyuPRRvK
	 NZUsfdSS34ILg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] iio: accel: mma8452: Drop unneeded lock acquire
 on read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825-mma8452-open-drain-v6-7-9b252804ee80@geanix.com>
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
 <20260825-mma8452-open-drain-v6-7-9b252804ee80@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 08:45:03 +0000
Message-Id: <20260825084504.778091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Removing data->lock exposes mma8452_read() to race conditions with=
 PM auto-suspend and event configuration.

Pre-existing issues:
- [High] Polling for DRDY before PM runtime wake-up leads to I/O timeouts a=
nd errors.
- [High] PM runtime usage count leak on error paths.
- [High] Device is permanently locked in STANDBY mode on I2C write failure.
- [Medium] Unprotected read-modify-write operations on event configuration =
registers.
- [Medium] Kernel stack information leak due to mishandling of short I2C bl=
ock reads.
--

--- Patch [7]: [PATCH v6 7/9] iio: accel: mma8452: Drop unneeded lock acqui=
re on read ---
commit 9c2b3fc538cb28ca3a39bb1585927926bb25f284
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Drop unneeded lock acquire on read

There is no need to acquire data->lock when calling mma8452_read(), and
dropping that makes it less likely to end up in an AB-BA deadlock
situation.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 7ef1a9a91c31f..9ae2c3e605761 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -504,9 +504,7 @@ static int mma8452_read_raw(struct iio_dev *indio_dev,
>  		if (!iio_device_claim_direct(indio_dev))
>  			return -EBUSY;
> =20
> -		mutex_lock(&data->lock);
>  		ret =3D mma8452_read(data, buffer);

[Severity: High]
Could removing this lock expose mma8452_read() to race conditions with PM
auto-suspend and event configuration?

mma8452_read() can be interrupted by the PM auto-suspend worker, which puts
the device in STANDBY and disables regulators while mma8452_drdy() is activ=
ely
polling over I2C. This can lead to I/O timeouts or errors.

Additionally, concurrent sysfs writes to event configurations invoke
mma8452_change_config(), which puts the hardware into STANDBY to modify
registers. The Standby transition flushes the hardware FIFO. If this occurs
between the mma8452_drdy() check and the i2c_smbus_read_i2c_block_data() in
mma8452_read(), the block read will fetch flushed or stale data.

> -		mutex_unlock(&data->lock);
>  		iio_device_release_direct(indio_dev);
>  		if (ret < 0)
>  			return ret;

[Severity: High]
This is a pre-existing issue, but will polling for DRDY before PM runtime
wake-up lead to I/O timeouts and errors?

In mma8452_read():

	int ret =3D mma8452_drdy(data);

	if (ret < 0)
		return ret;

	ret =3D mma8452_set_runtime_pm_state(data->client, true);

If the device is in auto-suspend, its regulators are turned off by
mma8452_runtime_suspend().

The I2C read in mma8452_drdy() will communicate with a powered-off device,
resulting in immediate I/O errors or timeouts.

Should the PM runtime resume be performed before any hardware register poll=
ing?

[Severity: High]
This is a pre-existing issue, but is there a PM runtime usage count leak on
error paths?

In mma8452_read():

	ret =3D mma8452_set_runtime_pm_state(data->client, true);
	if (ret)
		return ret;

	ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
					    3 * sizeof(__be16), (u8 *)buf);
	if (ret < 0)
		return ret;

If i2c_smbus_read_i2c_block_data() fails, it returns the error code
immediately. This bypasses the subsequent call to
mma8452_set_runtime_pm_state(data->client, false), permanently leaking the
usage count.

A similar leak occurs in mma8452_write_event_config():

	ret =3D mma8452_set_runtime_pm_state(data->client, state);
	if (ret)
		return ret;

	switch (dir) {
	case IIO_EV_DIR_FALLING:
        ...
	case IIO_EV_DIR_RISING:
		val =3D i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);
		if (val < 0)
			return val;

If this I2C read fails and returns early, the PM runtime decrement is also
missed.

[Severity: Medium]
This is a pre-existing issue, but are the read-modify-write operations on
event configuration registers properly protected?

In mma8452_write_event_config():

	case IIO_EV_DIR_RISING:
		val =3D i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);
		if (val < 0)
			return val;

The initial I2C read is performed without holding data->lock, while the wri=
te
is performed by mma8452_change_config() which does hold the lock.

Since IIO event sysfs attributes do not hold the IIO mlock, concurrent writ=
es
to different event attributes can interleave.

Could two threads perform the unprotected read simultaneously, resulting in=
 the
second thread silently overwriting the first thread's register modification=
s?

[Severity: High]
This is a pre-existing issue, but can an I2C write failure leave the device
permanently locked in STANDBY mode?

In mma8452_change_config():

	/* config can only be changed when in standby */
	if (is_active > 0) {
		ret =3D mma8452_standby(data);
		if (ret < 0)
			goto fail;
	}

	ret =3D i2c_smbus_write_byte_data(data->client, reg, val);
	if (ret < 0)
		goto fail;

	if (is_active > 0) {
		ret =3D mma8452_active(data);
...
fail:
	mutex_unlock(&data->lock);

	return ret;

If the I2C write fails, the code jumps to the fail label, bypassing the cal=
l to
mma8452_active().

Does this leave the device stuck in STANDBY mode, which breaks all future d=
ata
measurements?

[Severity: Medium]
This is a pre-existing issue, but might the mishandling of short I2C block
reads leak uninitialized kernel stack memory?

In mma8452_read():

	ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
					    3 * sizeof(__be16), (u8 *)buf);
	if (ret < 0)
		return ret;

	ret =3D mma8452_set_runtime_pm_state(data->client, false);

	return ret;

i2c_smbus_read_i2c_block_data() returns the number of bytes successfully re=
ad.
If a short read occurs, it returns a positive value and passes the if (ret =
< 0)
check.

The subsequent call to mma8452_set_runtime_pm_state() will overwrite ret wi=
th 0
on success.

mma8452_read_raw() assumes the stack array buffer is fully initialized and
processes the uninitialized bytes, which are then returned to userspace.

Should the check verify if exactly the requested number of bytes were read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-op=
en-drain-v6-0-9b252804ee80@geanix.com?part=3D7
