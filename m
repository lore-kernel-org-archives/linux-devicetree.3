Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E4A440A1D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547480; cv=none; b=b0OpEjcrNqunl2NX8JEGwgmZryX4RIMulJwj4i220xSyxEho256d6SQNAryMh7TVjzX2NVfbdDfZ2WIfLS8mmegga79aNKKNsihFjaVzesKEccDwbTqHBe2kjYgFTNMvv+w2+ROIWgH0oxJD/BZCEmOhjZg3UNu8bKcyr5XOFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547480; c=relaxed/simple;
	bh=1Emp/nME9jdWRLmAYDiSqMywKvSLGcXv09Xl0RonBp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iTf+8Zv/DPpG7Q7+1CJ/z0coNzdvW4tv++i3iyuylt6jetPxmN8ANTiOjt9JfUgcA4CRKPa4J0OX/XwGK7MyDcAGSoOojzfuOm9clgu/a6ulcxbqDhU3dpbpSlKC11bSapygiTQ2HY2O6bJIbpS9o+DBkdyZD4cHem5j/bfCWeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPWLNMXM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPWLNMXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A8F1F000FF;
	Wed, 16 Sep 2026 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789547479;
	bh=tV3lzwhta2/0MjHjDXFvr+HK9EYsGx1KjT0LB1lyqwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MPWLNMXMIatDlifx79NzP1IiTBA6jIn5lfV59tuUFAcL+KX9enCelpHeeCSu2bjYW
	 E9lSU9AiStz1rSfm275tyfs8O1o9C6CuD+ALNezeZjWLbdrdue61/5kjZYJ5TTerpT
	 A+CFEwTMKNt1RJLSDZFuSxTcmiMsNB/QKGYoSY8DCKtBhaTt2/zOaEEwVOD1Jfy7xm
	 ce6iYvEtnQRzs6GaWmaG5r6vmaNGK3t75kWEuvSJX5nPI/z0Yfw6k0zFYsCBp7LVdu
	 4fkETwjDIvCtSu4en+56R4TgoiGZUhZan1AnTVL7Nn+0c9aVsy0XpgrqS31RNid9ng
	 +I6KlohkOtOGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/10] iio: accel: mma8452: Support interrupt sharing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916-mma8452-open-drain-v9-10-0dd24fa2f3d7@geanix.com>
References: <20260916-mma8452-open-drain-v9-0-0dd24fa2f3d7@geanix.com>
 <20260916-mma8452-open-drain-v9-10-0dd24fa2f3d7@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:31:18 +0000
Message-Id: <20260916083119.03A8F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] iio: accel: mma8452: Interrupt storm livelock when IRQ fires d=
uring RPM_SUSPENDING
- [High] iio: accel: mma8452: Invalid I2C access during system suspend due =
to mishandled -EINVAL
- [Medium] iio: accel: mma8452: Race condition in probe error path due to p=
m_runtime_disable() before free_irq()
--

commit bf19c63685f6fff116a3a5358196fd66dff6090a
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Support interrupt sharing

This commit adds support for shared interrupts to the mma8452 driver. It
modifies the interrupt handler to check the runtime PM status and ignores
the interrupt if the device is suspended. It also updates the runtime
suspend and resume paths to properly disable and restore interrupt sources.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 5aea6bf3312af..2a980c0c2e03a 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

> @@ -1086,15 +1088,28 @@ static irqreturn_t mma8452_interrupt(int irq, voi=
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

[Severity: Critical]
If the device asserts its level-triggered interrupt when the PM core is
transitioning the device to RPM_SUSPENDING (e.g., when the autosuspend
timer expires), pm_runtime_get_if_active() will return 0.

Does returning IRQ_NONE without clearing the hardware interrupt here cause
a permanent interrupt storm? Since the IRQ line is shared and unmasked upon
return, the still-asserted hardware interrupt might immediately re-trigger
the handler, potentially starving the worker thread that executes
mma8452_runtime_suspend() and hard-locking the system.

[Severity: High]
During system suspend, pm_runtime_force_suspend() disables runtime PM,
which increments the disable depth. If a shared interrupt fires during this
window, pm_runtime_get_if_active() returns -EINVAL.

Since this check only catches pm_status =3D=3D 0, does this allow the handl=
er
to proceed and perform I2C reads on unpowered hardware? Per subsystem
guidelines, should this check for pm_status <=3D 0 instead?

> +
> +	/*
> +	 * pm_status is now 1 or -EINVAL. If pm_status=3D=3D1, runtime PM is en=
abled
> +	 * and device is RPM_ACTIVE. If pm_status=3D=3D-EINVAL, runtime PM is
> +	 * disabled (e.g. CONFIG_PM not enabled), and we can/must assume device
> +	 * is active.
> +	 */
> +
>  	src =3D i2c_smbus_read_byte_data(data->client, MMA8452_INT_SRC);

[ ... ]

> @@ -1771,11 +1790,12 @@ static void mma8452_remove(struct i2c_client *cli=
ent)
> =20
>  	iio_device_unregister(indio_dev);
> =20
> -	pm_runtime_disable(dev);
> -	pm_runtime_set_suspended(dev);
> -
>  	if (client->irq)
>  		free_irq(client->irq, indio_dev);
> +	/* No irq will fire beyond this point */
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);

[Severity: Medium]
This correctly fixes the race in mma8452_remove() by moving free_irq()
before pm_runtime_disable(), but does the same race still exist in the
mma8452_probe() error path?

If mma8452_probe() fails after pm_runtime_enable(), it jumps to the
runtime_suspend label:

  mma8452_probe() {
      /* ... */
  runtime_suspend:
      pm_runtime_disable(dev);
      pm_runtime_set_suspended(dev);

  free_irq:
      if (client->irq)
          free_irq(client->irq, indio_dev);
      /* ... */
  }

If a shared interrupt fires between pm_runtime_disable() and free_irq(),
could the handler attempt to access unpowered hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-mma8452-op=
en-drain-v9-0-0dd24fa2f3d7@geanix.com?part=3D10
