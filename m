Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD283E024F
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647292; cv=none; b=gERQFNtfD1A69QcP35gXfQF8ujEtYcm5PBFJHIoO7v7p248eUj/3Gr77ySJ3gr68L1zllQ0ulYzxuLflTWwPHXd8yEE0vLick/5ySbH/l5pkiL6bfk5m+iO9/RJ10dS7RbkLAMsnJR4VcoSLBbsAwlF9FqgkostjzVhQ7g3NwqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647292; c=relaxed/simple;
	bh=0QeedXAxxWcz0afOlnadrRILDDL/uzqEaWcfgvoyb0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DEVga9z2zGS0Y2+eBd5Jj+dhBII07RLl1wl4yRZ3J+CHMHwCmt+z7wJws5Wmevuf3Ra4mu5GUogLu9b8Gk2gnrVS5c4xc7B0LcVkIE8UJ3MTOiILxMf1OjQJH5VvxKND7tCMX8x7Mb7htfGqfTjGWoyUInZ4mN8Xcn+Ym6DPNzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9HdTyeN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9HdTyeN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DBB1F00A3A;
	Tue, 25 Aug 2026 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787647290;
	bh=jdztuDqc4PQLH/N5H9c3Kri5TmRkJC7Or6C1nnoBrQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g9HdTyeNOb5CnFxBCFEyHMU+CueIKPRyuNlBgRGqaEba570zZPPP5423OWGzEp7a8
	 eebxHjzHcUw+zgg8m4x3II6Y5xy6yMYtxKOO6e/pidIuUscjOtcyBWlvhduaJy2skF
	 1j1RnAVHuvbsqMEcuJf2QNsR0exUE54wJeE7oyno9LxjZ40PxCOSwO2iBhYXjPLB7K
	 WahcInx+io22BArR8Oio9jun6PMy2mwcNtlb0mR8YXIRhwKhcVQBckZYSZyznWCDbN
	 XtJm0PLXgPGFuup6j4qHX+S0BXY8JRz8YBuCkrtW4FeC6jwwuLQWAv/FERt07iTquc
	 AQiFjsJkr/ksg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/9] iio: accel: mma8452: Fix use-after-free bug in
 error error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825-mma8452-open-drain-v6-8-9b252804ee80@geanix.com>
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
 <20260825-mma8452-open-drain-v6-8-9b252804ee80@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 08:41:30 +0000
Message-Id: <20260825084130.89DBB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The device is left in ACTIVE mode on probe failure paths, potentia=
lly draining power and asserting interrupts indefinitely.
- [High] The driver leaks the PM runtime usage count on multiple error path=
s when I2C reads/writes fail after acquiring a runtime PM reference.
- [High] In `mma8452_runtime_suspend()`, if disabling the second regulator =
fails, the first regulator remains disabled but the PM state is left as RPM=
_ACTIVE.
- [High] Time-of-check to time-of-use (TOCTOU) race condition during read-m=
odify-write of I2C event configuration registers.
--

--- Patch [8]: [PATCH v6 8/9] iio: accel: mma8452: Fix use-after-free bug i=
n error error path ---
commit bad43bbf94c93f7ecf6436d8c780a1207e0288f4
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Fix use-after-free bug in error error path

This commit fixes a use-after-free in the mma8452_probe error path.
By adding a runtime_suspend label, it ensures the runtime PM disable step
happens before the IRQ is freed, avoiding callbacks with a freed device.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 9ae2c3e605761..4a1eb196589ab 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1743,7 +1743,7 @@ static int mma8452_probe(struct i2c_client *client)
> =20
>  	ret =3D iio_device_register(indio_dev);
>  	if (ret < 0)
> -		goto free_irq;
> +		goto runtime_suspend;
> =20
>  	ret =3D mma8452_set_freefall_mode(data, false);

[Severity: High]
This isn't a bug introduced by this patch, but is there a data race in
mma8452_set_freefall_mode() called here?

It looks like mma8452_set_freefall_mode() reads the configuration register
locklessly before modifying it:

mma8452_set_freefall_mode() {
	...
	val =3D i2c_smbus_read_byte_data(data->client, MMA8452_FF_MT_CFG);
	...
	return mma8452_change_config(data, MMA8452_FF_MT_CFG, val);
}

Since mma8452_change_config() only acquires data->lock during the write,
could concurrent modifications via sysfs overwrite and discard each other's
changes? A similar pattern appears to exist in mma8452_write_event_config().

>  	if (ret < 0)

[ ... ]

> @@ -1754,6 +1754,10 @@ static int mma8452_probe(struct i2c_client *client)
>  unregister_device:
>  	iio_device_unregister(indio_dev);
> =20
> +runtime_suspend:
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +

[Severity: High]
This is a pre-existing issue, but does this error path skip placing the
hardware back into standby mode?

If mma8452_probe() fails and jumps to this runtime_suspend label, the
software resources are disabled, but the device might be left in ACTIVE
mode. Could this result in the device indefinitely asserting a shared
interrupt line if it was previously activated, since the IRQ handler is fre=
ed
shortly after?

Should there be a call to mma8452_standby() in this error path?

>  free_irq:
>  	if (client->irq)
>  		free_irq(client->irq, indio_dev);

[Severity: High]
This is a pre-existing issue, but does mma8452_read() leak a runtime PM
usage count on I2C errors?

If mma8452_set_runtime_pm_state(..., true) succeeds, but the subsequent I2C
block read fails:

mma8452_read() {
	...
	ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
					    3 * sizeof(__be16), (u8 *)buf);
	if (ret < 0)
		return ret;
	...
}

The function returns immediately without rolling back the PM reference.
I noticed similar early returns in mma8452_write_event_config() and
mma8452_data_rdy_trigger_set_state() that might leave the device permanently
active.

[Severity: High]
This is also a pre-existing issue, but is the regulator state left unbalanc=
ed
if runtime suspend fails?

In mma8452_runtime_suspend():

mma8452_runtime_suspend() {
	...
	regulator_disable(data->vddio_reg);

	ret =3D regulator_disable(data->vdd_reg);
	if (ret) {
		dev_err(dev, "failed to disable VDD regulator\n");
		return ret;
	}
	...
}

If disabling vdd_reg fails, the function returns an error without
re-enabling vddio_reg. Since the PM core keeps the device in RPM_ACTIVE
on failure, won't subsequent suspend attempts call
regulator_disable(data->vddio_reg) again and underflow the enable count?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-op=
en-drain-v6-0-9b252804ee80@geanix.com?part=3D8
