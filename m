Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC4038330F
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647354; cv=none; b=ZCRyYJ9I8GYSmow1FYG+wibU3wdyKRFAyZJ1l9EzoUXSSc1x4PwP6jEsrEkKwPkrW/Q6REbsmXAVqyBKgK8YOe10cxW+sZMae+AUluYIzEXeWQTaSyWIhZeXRZm8e+5b17LsfOE4nwLOyWZYF/1LtKgTHd2OljBpeImWTzfJ9mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647354; c=relaxed/simple;
	bh=urNJC14AUy/yPkhnZYVZUGrkLR+3xz8OdbgPMPrslkU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cxa4TwyeD+RTn6z/DgwMRcd/DhevdhD7igAy3mM7IY62tkAyjY3y8RGiQogF07D+yBfCIaAz57GeaFIf/Yd3KKOIEeo+ttapGYgRbfKFbJ+hnjiKDL60EML7bJGYlMJuA77Rd6li2nEGKml6CQLw3EVmE0pSV7IfewO8GsDTLI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWEfUm7A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWEfUm7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01211F000E9;
	Tue, 25 Aug 2026 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787647353;
	bh=7VqgW9qWQln3ARyR/st8MW7HEWZjWWg0NgRrU+PprYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UWEfUm7Amui6CbA+6IDlN3xicJwjAny8YxbH6uWIbximOULQmr01xRMxUFE8Thnt4
	 0u+WDnanolhmpZajQPcL4xNsKOo2DN+xb1NuQoV9Qfem7vOqHDq8yNLA3xE5ApP1RK
	 p5uIzwHMAPbX3zJh5crQNilVVLHT0K+PbFlwn9Mzra6yWysCyT5zMGHSiuIfemfTC9
	 UW6C8phYu5ysPpULxZFvZjy5Xszmgy6l7CvRrEow4YYtN2r1kF1GwP9lRYKNX09gvI
	 sJBEknnBqQ9RjUFzXVHIZjQlbClNKIWyUhPQjnmkCSTwU38EbEfgZ5lP89VQT5Uepb
	 hEoI5BEzJ9pAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/9] iio: accel: mma8452: Allow open drain interrupt
 pin configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825-mma8452-open-drain-v6-5-9b252804ee80@geanix.com>
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
 <20260825-mma8452-open-drain-v6-5-9b252804ee80@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 08:42:32 +0000
Message-Id: <20260825084232.C01211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Critical device register configurations are lost after a runtime s=
uspend/resume cycle because `mma8452_runtime_resume` fails to restore them.
- [High] Sysfs read/write callbacks and write_raw paths access the device h=
ardware over I2C without waking it from runtime suspend.
- [High] The `mma8452_remove()` function accesses unpowered I2C registers a=
nd causes unbalanced regulator disables if the device is runtime suspended.
- [High] `mma8452_runtime_resume` modifies device active state and configur=
ation registers without holding `data->lock`, causing a TOCTOU race with `m=
ma8452_change_config`.
- [High] Read-modify-write operations on I2C registers in sysfs operations =
are performed without holding `data->lock`.
--

--- Patch [5]: [PATCH v6 5/9] iio: accel: mma8452: Allow open drain interru=
pt pin configuration ---
commit 0eb3a6b1fa62842d47690cc795da7896eb5b7153
Author: Esben Haabendal <esben@geanix.com>
Subject: iio: accel: mma8452: Allow open drain interrupt pin configuration

This commit introduces the ability to configure the interrupt pin of mma8452
chips in open-drain mode. It reads the "drive-open-drain" property during
probe and updates the hardware configuration accordingly.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 8eb97e6793d6f..d1e8eb2a4ad3a 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
[ ... ]
> @@ -1829,6 +1853,10 @@ static int mma8452_runtime_resume(struct device *d=
ev)
> =20
>  	WRITE_ONCE(data->suspended, false);
> =20
> +	ret =3D mma8452_set_interrupt_pin_mode(data);
> +	if (ret)
> +		goto runtime_resume_failed;
> +
>  	ret =3D mma8452_active(data);
>  	if (ret < 0)
>  		goto runtime_resume_failed;

[Severity: High]
This is a pre-existing issue, but does mma8452_runtime_resume() fail to
restore critical configurations?

When the device autosuspends, mma8452_runtime_suspend() disables the VDD
regulator, which cuts power to the chip and loses volatile register state.
Upon resume, only CTRL_REG1 and CTRL_REG3 are restored.

Are essential configurations set during probe (like DATA_CFG, TRANSIENT_THS,
CTRL_REG4 for interrupt enables, and CTRL_REG5) lost after the first
autosuspend?


[Severity: High]
This is a pre-existing issue, but does mma8452_runtime_resume() introduce a
race condition by not holding data->lock?

The device state is modified to ACTIVE outside of the mutex lock here. If a
concurrent sysfs write checks mma8452_is_active() and sees STANDBY, could
this activation occur just before the I2C write executes?

Would this cause the hardware to silently ignore the write since the device
was unexpectedly transitioned to ACTIVE mode?


[Severity: High]
This is a pre-existing issue, but do the sysfs read/write callbacks and
write_raw paths access the device hardware over I2C without waking it from
runtime suspend?

drivers/iio/accel/mma8452.c:mma8452_write_raw() {
    ...
	if (!iio_device_claim_direct(indio_dev))
		return -EBUSY;

	ret =3D __mma8452_write_raw(indio_dev, chan, val, val2, mask);
    ...
}

Functions like mma8452_write_raw() and mma8452_show_hp_cutoff_avail() do
direct I2C accesses without wrapping the operation in
pm_runtime_resume_and_get() and pm_runtime_put().

If the device is autosuspended, will the unpowered chip fail to ACK the
transfers and return -EREMOTEIO?


[Severity: High]
This is a pre-existing issue, but does mma8452_remove() access unpowered I2C
registers and cause unbalanced regulator disables?

drivers/iio/accel/mma8452.c:mma8452_remove() {
    ...
	mma8452_standby(iio_priv(indio_dev));

	regulator_disable(data->vddio_reg);
	regulator_disable(data->vdd_reg);
    ...
}

If the device is runtime suspended, the vdd and vddio regulators are already
disabled. Since pm_runtime_disable() does not wake the device,
mma8452_remove() unconditionally calls mma8452_standby() which will time out
on an unpowered bus.

Will the subsequent unconditional regulator_disable() calls drive the usage
counts below zero?


[Severity: High]
This is a pre-existing issue, but are read-modify-write operations on I2C
registers in sysfs operations performed without holding data->lock?

drivers/iio/accel/mma8452.c:mma8452_write_event_config() {
    ...
	case IIO_EV_DIR_RISING:
		val =3D i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);
		if (val < 0)
			return val;
    ...
}

In functions like mma8452_write_event_config(), an I2C read of the
configuration register happens completely outside data->lock.

If two threads execute this concurrently, could they both read the old
state, modify different bits, and serialize on mma8452_change_config(),
causing the second thread to unconditionally overwrite the first thread's
modifications?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-op=
en-drain-v6-0-9b252804ee80@geanix.com?part=3D5
