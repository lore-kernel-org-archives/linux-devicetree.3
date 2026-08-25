Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C94A38A706
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647344; cv=none; b=Kaqa1qc5EW5G4HYH7QM5SmJKue6YO1kaZJZ5+uTtmZBpl551FFNvsUkwlgOB+1QPHUBZew9Kt9OEkyhAg9neTZDE0/jN86l15g4XH/CCgxd5G3sjysbiLTAbW6etQng8UX4RzZEnq7CPpiHD5yiHfdaLx+hxY/2KfFqAXGrEduw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647344; c=relaxed/simple;
	bh=HhxSeu3T709hty4cYnwAreZmhAnto1AppKCU4cXVSno=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d03cnkYb1yvacmTcEwTVlZlSuCkorgiM2rHxFFlznWUaJLR5mL5Y+jnrNX8p8SGF+mEeQnZ8ihMnIY6fWwTdJizmt8rUbqr+G5b+KZgmojQMQkVqZuYh9ekLzfAyYpuh14os2xQ98M1L+xLpZMkC+A2Pk9nmELAYsLrzbvvntOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLmo0Reu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLmo0Reu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582281F000E9;
	Tue, 25 Aug 2026 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787647341;
	bh=d0qXHNRa8gcetXD5e1C+ZkuNy39wwUG0Du/riNNo0nk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eLmo0ReuB80mvhDW6LxyBCHouiMi6rVtsu9uiR0YyNOA89D33MqKvFokI9GUcHviB
	 pVvfn8qe+VapSzqgzJg1zhEva+UogCk9HJvRQzGZhML9ZiGDG3VIxEz1s9a3GCp73p
	 7P3VQYFCvdIM1RuPgj68V4IPWSpJt+JFtd6OaHCJbPZGd0V+X8Rz208b53OviLgc6M
	 a6CCxD3B29lnlApkKY/cZ6OYqCW/FSfqZiGwRlDtrPv0OMxBT7XHZRidkmQP+ytK2F
	 mIOFS8O8FOWkIAt+FZ9NFxHvv+o02B1dpTtCLY1gZ15JVJTAMEwFngRpVeE6X5O4D9
	 RS0WvO5tjbKoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/9] iio: accel: mma8452: Support interrupt sharing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825-mma8452-open-drain-v6-4-9b252804ee80@geanix.com>
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
 <20260825-mma8452-open-drain-v6-4-9b252804ee80@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 08:42:20 +0000
Message-Id: <20260825084221.582281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] If regulator_disable() fails in mma8452_runtime_suspend(), the dat=
a->suspended flag is not rolled back, leading to a permanent IRQ storm on s=
ubsequent interrupts.

Pre-existing issues:
- [High] mma8452_remove() does not wake up the device before disabling runt=
ime PM, leading to unbalanced regulator disables (underflow) and illegal I2=
C access while powered off.
- [High] Registers are not restored after runtime resume, causing the devic=
e to lose critical configuration.
--

--- Patch [4]: [PATCH v6 4/9] iio: accel: mma8452: Support interrupt sharin=
g ---
commit 5bc641da9d60875f38db9937a3a1dae1afd9a94e
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Support interrupt sharing

This commit adds handling of runtime PM suspension in the interrupt handler
to allow sharing the interrupt with other devices. It introduces a suspended
flag and uses synchronize_irq() to protect against race conditions during
runtime suspend and device removal.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 1fb43c5b0b72f..8eb97e6793d6f 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
[ ... ]
> @@ -1056,14 +1057,24 @@ static irqreturn_t mma8452_interrupt(int irq, voi=
d *p)
>  	struct iio_dev *indio_dev =3D p;
>  	struct mma8452_data *data =3D iio_priv(indio_dev);
>  	irqreturn_t ret =3D IRQ_NONE;
> +	int pm_status;
>  	int src;
> =20
> +	pm_status =3D pm_runtime_get_if_active(&data->client->dev);
> +	if (pm_status =3D=3D 0)
> +		return IRQ_NONE; /* device is powered down */
> +	if (READ_ONCE(data->suspended)) {
> +		/* device is being removed */
> +		ret =3D IRQ_NONE;
> +		goto out_runtime_put;
> +	}

[Severity: High]
Is the READ_ONCE(data->suspended) check reachable during normal suspend?

Since pm_runtime_get_if_active() returns 0 when the device state is
RPM_SUSPENDING, it seems the handler will return early before reaching
the data->suspended check.

[ ... ]
> @@ -1774,6 +1789,10 @@ static int mma8452_runtime_suspend(struct device *=
dev)
>  		return -EAGAIN;
>  	}
> =20
> +	WRITE_ONCE(data->suspended, true);
> +
> +	synchronize_irq(client->irq);
> +
>  	ret =3D regulator_disable(data->vddio_reg);
>  	if (ret) {
>  		dev_err(dev, "failed to disable VDDIO regulator\n");
>  		return ret;
>  	}

[Severity: High]
If regulator_disable() fails here, the function returns without resetting
data->suspended to false.

If this happens, the PM core leaves the device in RPM_ACTIVE. Would this
cause a permanent IRQ storm since the next interrupt will see pm_status > 0,
but data->suspended is true, causing it to continually return IRQ_NONE
without clearing the level-triggered interrupt?

[ ... ]
> @@ -1808,6 +1827,8 @@ static int mma8452_runtime_resume(struct device *de=
v)
>  		return ret;
>  	}
> =20
> +	WRITE_ONCE(data->suspended, false);
> +
>  	ret =3D mma8452_active(data);
>  	if (ret < 0)
>  		goto runtime_resume_failed;

[Severity: High]
This is a pre-existing issue, but does mma8452_runtime_resume() need to
restore other device registers like MMA8452_CTRL_REG4 and MMA8452_DATA_CFG?

When the regulators are disabled during suspend, the device loses power and
these registers are reset. If they aren't restored here, will the device
lose its configuration and permanently disable hardware interrupts since
CTRL_REG4 defaults to 0?

[ ... ]
> @@ -1822,6 +1843,7 @@ static int mma8452_runtime_resume(struct device *de=
v)
>  	return 0;
> =20
>  runtime_resume_failed:
> +	WRITE_ONCE(data->suspended, true);
>  	regulator_disable(data->vddio_reg);
>  	regulator_disable(data->vdd_reg);
> =20

[Severity: High]
This is a pre-existing issue, but if the device is unbound via sysfs while
runtime-suspended, will mma8452_remove() run into issues?

drivers/iio/accel/mma8452.c:mma8452_remove() {
    ...
	pm_runtime_disable(&client->dev);
	pm_runtime_set_suspended(&client->dev);
    ...
	mma8452_standby(iio_priv(indio_dev));

	regulator_disable(data->vddio_reg);
	regulator_disable(data->vdd_reg);
}

Since pm_runtime_disable() leaves the device suspended, won't
mma8452_standby() attempt an I2C write on an unpowered chip? Also, won't
calling regulator_disable() here cause an underflow since the regulators
were already disabled during runtime suspend? Does this need a
pm_runtime_get_sync() before teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-op=
en-drain-v6-0-9b252804ee80@geanix.com?part=3D4
