Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503294848AA
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585003; cv=none; b=EZIMvIP/rifWtTR6OzeUumakad3BwYtNHJyOctaNxiLkMho/uP843WsxPtpxoJ1ObAiLhES2kS9tuZcH/CXyRTRqplBIOhKl5cxvKM33iuLi7aQiKXU5DuZJ3GqJId/7hH9uwlnIJEijxZdr8H0Kt3KdObYIjekkBoAUV4z99zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585003; c=relaxed/simple;
	bh=M4vqdyzGspQOcOnvz51Q0whpd44jKizSsGwqULSfEPY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m03mrLm5s3n6D4q5TF0cJ2e8b/qmHAFG1r0shiftv691Rxr24ibR24fUgpdjuaZVwQTvnzwUj5U+/j1MpATvQAn6BQaQPXdOdsHgfgB1ajvUtUTnj+hKOZK3zmJxcM8e3YaiHmjD/0C4e5IQoV7IXpXGK3QoAYrlveDkto0W+nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxEev+of; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxEev+of"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33EC1F00893;
	Mon, 28 Sep 2026 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790585001;
	bh=7raKdcJmPUUY21kwVJ8o5bikkoNr5UgG0hyrIdzI/Cs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KxEev+oflFnPn9nBuBd5dLqR0S93gi15MdOkcbEcDoLS9czDlzjHZWa9dJf18GWZv
	 T/AQRkt6JJ11HjD7WrwxiefC5QY3LzVuDbw0sPSoBBegvvBnBYSWXMiERXuPy1bpQZ
	 fLL4Yo/PpfK+ZPthq1bI4Iatr+hYU7ME/IBzOa7OOeWcUZiPwTx1l6lVnmF2/kTjsg
	 v79MZ95l5UPLEXmfqBKEGgRNhMU0hNJ7bYNcu3uam3V7pdid82RH2enjOnFl8yIVOO
	 KUV9TCMxZfNwe2KIc3iz1tK+CsYwfS7aLhT/by98cbEudTilKtueMD6NuZJRINrlNP
	 LeNODF3RjzYkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/10] iio: accel: mma8452: Support interrupt
 sharing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-mma8452-open-drain-v10-10-b906fb408386@geanix.com>
References: <20260928-mma8452-open-drain-v10-0-b906fb408386@geanix.com>
 <20260928-mma8452-open-drain-v10-10-b906fb408386@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 08:43:21 +0000
Message-Id: <20260928084321.A33EC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] iio: mma8452: interrupt storm during runtime resume and suspend
- [Medium] iio: mma8452: unbalanced regulator disable on removal when runti=
me suspended
--

commit f941a16ef4ad24cff1f76a14b03513af5d8ea4cd
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Support interrupt sharing

Adding support for sharing interrupt line with other device requires the
interrupt handler to handle runtime PM suspension properly, ignoring the
irq if the device is suspended (maybe even off).

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index dc8031e14c292..f05dd936b7f37 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1086,15 +1088,32 @@ static irqreturn_t mma8452_interrupt(int irq, voi=
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
> +		/* device is powered down */
> +		return IRQ_NONE;
> +	if (IS_ENABLED(CONFIG_PM) && pm_status < 0)
> +		/* runtime PM was disabled, possibly suspending */
> +		return IRQ_HANDLED;

[Severity: High]
Does returning IRQ_NONE here without clearing the hardware interrupt source
risk causing an interrupt storm?

The driver registers a threaded IRQ handler with IRQF_ONESHOT | IRQF_SHARED.
If an interrupt fires while pm_status is 0, returning IRQ_NONE without
clearing the interrupt means the core will unmask the still-asserted line,
causing an immediate refire and potentially an infinite interrupt storm that
hangs the CPU.

Additionally, doesn't returning IRQ_HANDLED when pm_status < 0 incorrectly
claim shared interrupts raised by other devices, hiding them from the
spurious interrupt detector?

[ ... ]

> @@ -1787,29 +1811,67 @@ static void mma8452_remove(struct i2c_client *cli=
ent)
>  #ifdef CONFIG_PM
>  static int mma8452_runtime_suspend(struct device *dev)
>  {

[ ... ]

> +	ret =3D regulator_bulk_disable(ARRAY_SIZE(data->regs), data->regs);
>  	if (ret) {
>  		dev_err(dev, "failed to disable regulators\n");
> -		return ret;
> +		goto out_restore_ctrl_reg4;
>  	}

[Severity: Medium]
Since regulator_bulk_disable() is now called here during runtime suspend,
does this cause unbalanced regulator disables in mma8452_remove()?

In mma8452_remove(), the driver unconditionally calls mma8452_standby() and
regulator_bulk_disable() without checking the runtime PM state or waking up
the device (e.g. via pm_runtime_get_sync()).

If the device was already runtime suspended on removal, its regulators are
off. Calling mma8452_standby() performs an I2C write to an unpowered chip,
resulting in an I2C error, and calling regulator_bulk_disable() a second ti=
me
drops the regulator usage count below zero, triggering a kernel warning.

[ ... ]

> @@ -1823,6 +1885,10 @@ static int mma8452_runtime_resume(struct device *d=
ev)
>  	if (ret)
>  		goto runtime_resume_failed;
> =20
> +	ret =3D i2c_smbus_write_byte_data(client, MMA8452_CTRL_REG4, data->ctrl=
_reg4);
> +	if (ret)
> +		goto runtime_resume_failed;
> +
>  	ret =3D mma8452_active(data);
>  	if (ret < 0)
>  		goto runtime_resume_failed;

[Severity: High]
Does re-enabling hardware interrupts here risk an interrupt storm?

During mma8452_runtime_resume(), the device state is RPM_RESUMING, so
pm_runtime_get_if_active() inside mma8452_interrupt() will return 0.

If an interrupt fires after writing to MMA8452_CTRL_REG4 and before the
resume completes (for example, during the sleep later in this function), the
interrupt handler will return IRQ_NONE without clearing it. As mentioned
above, this can lead to an infinite interrupt storm.

A similar issue appears to exist during mma8452_runtime_suspend() before
CTRL_REG4 is disabled, since the state is RPM_SUSPENDING.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-mma8452-op=
en-drain-v10-0-b906fb408386@geanix.com?part=3D10
