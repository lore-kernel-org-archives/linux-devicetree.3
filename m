Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F239D3F1AB7
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787127949; cv=none; b=tuTTyGjqJJmEtOWld4Fp1jVYrZAs+7ZKu6VtDiprxFCHxdHW4erDuBaiGZri9ZzvK5/pRyEwXLprpixEDAYYpZ48Nv4WBWNQc/aPLG3q9o1Lqm4BAklhmBGPOyDQF7/ixyG5kFKHowfW+TF1VD3Eels/QHegoPGZggyumcfKklI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787127949; c=relaxed/simple;
	bh=14i3TjZZiRy/vuJ/TEXDdP+K5kqQtHA7m94zaLlZPmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lmZeQcLfRqDPGo+fn9yXLEmwwFdtqPmTnQy9prCb9i1rg0jk37JgeOQRqif/P6mtb6Bt6tgVyV3z4uriQk7oWS4cXx5zksOnKIsJitlJtW3xchSCDU2hrtT7jM8imYGv25IMM+/LCqK332BZNOF1OMe4P/GjbHpZpr10VEGe5GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIhV2PRa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIhV2PRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783CD1F000E9;
	Wed, 19 Aug 2026 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787127947;
	bh=o5+8nHPuD5WNsyFG3Aeog+G71dfEyxHHbWBJsemIPDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HIhV2PRa4YlCvoAmCmH2Bz3ZBvePRKxqN/y+A31wBgB4vcAkLBxKLoCH6pEhgbB+2
	 FVqPzZy3J6qmGyRyUqP085ZEyJLmgWlMmajy2W2NeGv7Unnf3gh9E3mLKUtR2PqTUV
	 Z8ToBGEXrFt2b93GJF3kVt+bvY6LiZYAGorleXdltJr0FxiVQxuNtVrYcy++UKuGbc
	 NsFAZN/eezJYRELURZ2hRF7sCqCaXDKeqHDAaBbPQIATMJMdK00yIfprGZvCc+lOwn
	 UWFxMsHKuhFu9jveXabFfim/wyAjm2d1PSo5utHQex/IGowNQpm7pGU0N5ba8AFFFO
	 I8rqx/dF1RpYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v5 4/6] iio: accel: mma8452: Support interrupt
 sharing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260819-mma8452-open-drain-v5-4-d8aa590d7c36@geanix.com>
References: <20260819-mma8452-open-drain-v5-0-d8aa590d7c36@geanix.com>
 <20260819-mma8452-open-drain-v5-4-d8aa590d7c36@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 08:25:47 +0000
Message-Id: <20260819082547.783CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Failed runtime suspend leaves the `suspended` flag set to `true`, =
causing an unrecoverable PM usage counter leak and a potential interrupt st=
orm.
- [Low] Compilation Error: undeclared variable `client` used in `mma8452_ru=
ntime_suspend`.

Pre-existing issues:
- [High] Unbalanced `regulator_disable()` calls and I2C writes to a powered=
-off device in `mma8452_remove()`.
--

--- Patch [4]: [PATCH RESEND v5 4/6] iio: accel: mma8452: Support interrupt=
 sharing ---
commit 79ad9089167d804daaa97086d058cd3a0e2f4199
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Support interrupt sharing

This commit adds handling of runtime PM suspension in the interrupt handler
to allow sharing interrupts with other devices. It introduces a suspended f=
lag
and uses synchronize_irq() to protect against race conditions during runtime
suspend and device removal.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 1fb43c5b0b72f..25bb2dd69381e 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
[ ... ]
> @@ -1056,14 +1057,19 @@ static irqreturn_t mma8452_interrupt(int irq, voi=
d *p)
>  	struct iio_dev *indio_dev =3D p;
>  	struct mma8452_data *data =3D iio_priv(indio_dev);
>  	irqreturn_t ret =3D IRQ_NONE;
> +	int pm_status;
>  	int src;
> =20
> +	pm_status =3D pm_runtime_get_if_active(&data->client->dev);
> +	if (pm_status =3D=3D 0 || READ_ONCE(data->suspended))
> +		return IRQ_NONE; /* device is powered down or being removed */
> +

[Severity: High]
If mma8452_runtime_suspend() in drivers/iio/accel/mma8452.c fails and
leaves data->suspended set to true, can this early return cause a PM
usage counter leak and an interrupt storm?

If the device is kept in the RPM_ACTIVE state after a suspend failure,
pm_runtime_get_if_active() will return 1. Because data->suspended is true,
the handler will return IRQ_NONE immediately.

This skips pm_runtime_put_autosuspend(), leaking the usage counter. Also,
by returning IRQ_NONE on a shared level-triggered IRQ without clearing the
hardware interrupt, wouldn't this trigger an interrupt storm?

[ ... ]
> @@ -1768,12 +1778,15 @@ static int mma8452_runtime_suspend(struct device =
*dev)
> =20
>  	mutex_lock(&data->lock);
>  	ret =3D mma8452_standby(data);
> +	WRITE_ONCE(data->suspended, true);
>  	mutex_unlock(&data->lock);
>  	if (ret < 0) {
>  		dev_err(&data->client->dev, "powering off device failed\n");
>  		return -EAGAIN;
>  	}

[Severity: High]
If mma8452_standby() fails, should data->suspended be reverted to false?

When returning -EAGAIN on failure in drivers/iio/accel/mma8452.c,
leaving data->suspended set to true creates the inconsistent state that
breaks mma8452_interrupt() as noted above.

> =20
> +	synchronize_irq(client->irq);
> +

[Severity: Low]
Does this code compile?

There is no local variable named client in mma8452_runtime_suspend() in
drivers/iio/accel/mma8452.c. The I2C client is available via
data->client or to_i2c_client(dev), so using client->irq directly
appears to cause a compilation failure.

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem during
device removal in mma8452_remove() in drivers/iio/accel/mma8452.c:

drivers/iio/accel/mma8452.c:mma8452_remove() {
    ...
	pm_runtime_disable(&client->dev);
	pm_runtime_set_suspended(&client->dev);
    ...
	mma8452_standby(iio_priv(indio_dev));

	regulator_disable(data->vddio_reg);
	regulator_disable(data->vdd_reg);
}

If the device is already in the RPM_SUSPENDED state when mma8452_remove() is
called, its regulators have already been disabled by
mma8452_runtime_suspend().

Because pm_runtime_disable() does not resume the device, calling
regulator_disable() again will underflow the regulator enable count. Could
this forcefully disable shared regulators and cause system instability?

Additionally, mma8452_standby() performs an I2C write. Is it safe to
unconditionally access the hardware when it might be powered off?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mma8452-op=
en-drain-v5-0-d8aa590d7c36@geanix.com?part=3D4
