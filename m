Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C423346E72
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103375; cv=none; b=AiNRQudbUjqJ5QA6rOpUzbxyrJF8oJTKxFOrk4Btku3j6V/MfjLx3hFf/K7VR7c4FXLB36/Y7WB9RrORKwRNWG7xNtYE3Ljl5w/iL7i+OYYVs+kYSLdV+dwWw+wucf4IZUcgV3igLIrUvW54X7Hl0HvGFcSBoEpXweQISeFtqwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103375; c=relaxed/simple;
	bh=TQut0DS7xtVnXUPjf/tOFLv0cbFWMCPL3CcJYaDpoQ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZIOJTA98SChTvojFWbhJZWI92zMANPZbny1TnWzFG9CAT8EFOzk7ve0vgYjDt7e+k52vUSGSWgDsxab7cpq38Zia6ntrbJjBRAHiG6lwbnqlZAZ6rs+R6u/XpPuMqnxGpT2FrKo0sjNmi+zDrr+XIZ8GDk1LpwLAmw2d89HdvJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4+basZp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4+basZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C575E1F00A3D;
	Wed, 15 Jul 2026 08:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103374;
	bh=TANXyBxWzVSjRn5Sl7Y0+Od0mTpjQS5vHiMGp9+FeBg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d4+basZpLZr1CQhCkXr7EKF0JnnceArwma43ktbqAsppO5JbxagY6zqgDD5h+nwq+
	 M7NtbFeOuU7pQTOinhIUNznypAdIoDAiqqN/8pvI0ekfbUMHGlkAkuLTGb34tKAfBk
	 ySgaR+fpqb1sOXRiJErbRmbvM84JjhryugQR592aHp5VmRin1P5Qb8ReSqyByCGMVr
	 BFuHynKFoeILs95CRKRGN7lpvxBG8VxBvkyy2xAOFdxgBUD2+kxIWQg0PlsyJTnv4I
	 H3VGZLNQowiX2XTw/jH4gvJIHef3zVXCgWHsSe0pkOZJt9e/uL6YBaliXR5LnBH9Te
	 IytMZ0L+xkTcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: accel: mma8452: Allow open drain interrupt pin
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-mma8452-open-drain-v1-2-b1dd2a440c60@geanix.com>
References: <20260715-mma8452-open-drain-v1-0-b1dd2a440c60@geanix.com>
 <20260715-mma8452-open-drain-v1-2-b1dd2a440c60@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 08:16:13 +0000
Message-Id: <20260715081613.C575E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Operator precedence bug in irqflags expression strips mandatory IR=
Q flags, causing probe to fail unconditionally.
- [Medium] Ignored return value of mma8452_set_interrupt_pin_mode() in prob=
e can lead to silent hardware misconfiguration.

Pre-existing issues:
- [High] Critical hardware configuration registers are not restored during =
runtime resume, breaking device operation.
--

--- Patch [2]: [PATCH 2/2] iio: accel: mma8452: Allow open drain interrupt =
pin configuration ---
commit 1663cfc0dcf3fd1e1271945ad142ff5a049c2fc1
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Allow open drain interrupt pin configuration
   =20
When sharing interrupt line with other chips, the interrupt pin most
likely needs to be configured in open-drain mode instead of push-pull.
If this is needed, you must add drive-open-drain property to the
device-tree.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 7d683686dd9d6..a20c02ce0b9cd 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

> @@ -1666,6 +1685,9 @@ static int mma8452_probe(struct i2c_client *client)
>  			goto disable_regulators;
>  	}
> =20
> +	data->open_drain =3D device_property_read_bool(&client->dev, "drive-ope=
n-drain");
> +	mma8452_set_interrupt_pin_mode(data);

[Severity: Medium]
Is it safe to ignore the return value of mma8452_set_interrupt_pin_mode()
here?=20

If the underlying I2C transaction fails and returns an error like -EREMOTEI=
O,
the hardware interrupt pin will silently remain in push-pull mode instead of
being configured for open-drain. On a shared bus, this could lead to=20
electrical contention.

> +
>  	data->ctrl_reg1 =3D MMA8452_CTRL_ACTIVE |
>  			  (MMA8452_CTRL_DR_DEFAULT << MMA8452_CTRL_DR_SHIFT);
> =20
> @@ -1683,7 +1705,8 @@ static int mma8452_probe(struct i2c_client *client)
> =20
>  	if (client->irq) {
>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
> -					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +					   IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> +					   data->open_drain ? IRQF_SHARED : 0,

[Severity: High]
Does this expression evaluate the way it is intended?=20

In C, the bitwise OR operator (|) has higher precedence than the ternary=20
operator (?:). This means the flags expression evaluates as:

(IRQF_TRIGGER_LOW | IRQF_ONESHOT | data->open_drain) ? IRQF_SHARED : 0

Since the condition part of the expression is always non-zero, this evaluat=
es
strictly to IRQF_SHARED (0x80), entirely stripping away IRQF_TRIGGER_LOW and
IRQF_ONESHOT.=20

Because IRQF_ONESHOT is mandatory for threaded IRQs without a primary handl=
er,
request_threaded_irq() will reject the call with -EINVAL, causing the probe
function to unconditionally fail for any device using an interrupt.

>  					   client->name, indio_dev);
>  		if (ret)
>  			goto buffer_cleanup;

[ ... ]

> @@ -1800,6 +1823,10 @@ static int mma8452_runtime_resume(struct device *d=
ev)
>  		return ret;
>  	}
> =20
> +	ret =3D mma8452_set_interrupt_pin_mode(data);
> +	if (ret < 0)
> +		goto runtime_resume_failed;
> +
>  	ret =3D mma8452_active(data);

[Severity: High]
This is a pre-existing issue, but since this patch modifies the runtime
resume handler, is the device state fully restored here?

The driver uses runtime PM, and mma8452_runtime_suspend() disables vdd_reg,
the main power supply. When power is removed, all volatile registers revert
to their power-on defaults.=20

During mma8452_runtime_resume(), power is restored, but it appears the driv=
er
only reconfigures CTRL_REG1 and CTRL_REG3.

Are vital registers configured in probe(), such as MMA8452_DATA_CFG (full
scale), MMA8452_CTRL_REG4 (interrupt enables), MMA8452_CTRL_REG5 (interrupt
routing), and MMA8452_TRANSIENT_THS missed during this resume? If so, the
device might stop producing interrupts and return invalid data after the fi=
rst
autosuspend delay.

>  	if (ret < 0)
>  		goto runtime_resume_failed;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-mma8452-op=
en-drain-v1-0-b1dd2a440c60@geanix.com?part=3D2
