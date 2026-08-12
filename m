Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD000359A6B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550198; cv=none; b=h0YvBp/pcJCOkGzY0bM83ZDT1lB5+Ll/25wrigrhuZ9ctOxjMeDetjO0AonAwAJhzjH2EsXpjW0dpXtbYaCl2OyeVgmme4e28/kWaXfKnsoar4rNwTAOaqb1nbfccQEJkUOEg187nU3H5FxzC5OltzKLxLWvWX/z5FDA8Goa6NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550198; c=relaxed/simple;
	bh=xhmab4d6t3263TsZEjffP0jmfPNDunr79TZiIuePY6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TeogCba6A78MmQa7mWAK92om2b1/SJMlK/ObZRw/bZxeTI4sy2M19GoP+vr4ORVUo2tr8PCYSbCC95fam5ZyLw2e7JS0Z9bNwBbWdr49f6SSAWiCvh6bZnFgXlt/u+in74inZAuYMhBps+6oYWHBf4PpyoHgHthIjyxr7pIwtuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hk2ubbbx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hk2ubbbx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EF71F00A3A;
	Wed, 12 Aug 2026 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550197;
	bh=EcsXrCd9xdMFyq537/HoIvEF/jIcDCdGO8VmMWNJU10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hk2ubbbxre75LqeRI22aMme0QlbvQHPCWgmJwwLfIkWSFLe/4kBLbzC28mbDfadWO
	 ZVIKf51HD473BV2wkXI5/h1BFWc+U6dAYnzCPlHTZ61xAMkPK0RBRxYrkBtjOdPVuJ
	 qzd180VS4SZi0z2bSb6/xN5FJpN5fowwJa8cQH28tiSwzarJOjpzsTSpP98f0PCNu4
	 fc4p2GI3cJf/g0X2MVm/TizOWtu5ypRkHZSsF+O66A5Tc/cMCw9DTtlz9fucSgBpdl
	 lRsbt7i6ESQ6o1hQOaWqcP9duQpE7Kiy1T5TRbJRGQvG/P9f6zy+M+9s8c/kqDCQco
	 rQwVKcWQOFcJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] iio: accel: mma8452: Reuse existing dev pointer
 in mma8452_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812-mma8452-open-drain-v4-6-bfca15d02b59@geanix.com>
References: <20260812-mma8452-open-drain-v4-0-bfca15d02b59@geanix.com>
 <20260812-mma8452-open-drain-v4-6-bfca15d02b59@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:56:36 +0000
Message-Id: <20260812155637.38EF71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing synchronize_irq() in runtime suspend callback for a shared=
 interrupt.
- [High] The IRQ handler incorrectly proceeds with I2C reads when the devic=
e's PM runtime is disabled.
- [High] Unprotected I2C hardware accesses in IIO callbacks without waking =
the device via PM runtime.
--

--- Patch [6]: [PATCH v4 6/6] iio: accel: mma8452: Reuse existing dev point=
er in mma8452_probe() ---
commit b1acc18af426345046769c66c8ed674e254ba4d0
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Reuse existing dev pointer in mma8452_probe()

This commit updates mma8452_probe() to reuse the existing local dev pointer
instead of repeatedly dereferencing client->dev. This simplifies the code
and improves readability.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 7992f9e388180..2fbf9f9ed9d75 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed an issue in
mma8452_runtime_suspend():

    regulator_disable(data->vddio_reg);
    regulator_disable(data->vdd_reg);

The device requests an interrupt with IRQF_SHARED, but regulators are disab=
led
without waiting for shared IRQ handlers to complete.

Could an interrupt fire for another device on the same line, causing the
mma8452_interrupt() handler to execute while this device is physically
unpowered? Should we add synchronize_irq() before disabling the regulators?


[Severity: High]
This isn't a bug introduced by this patch, but looking at mma8452_interrupt=
():

    pm_status =3D pm_runtime_get_if_active(&data->client->dev);
    if (pm_status =3D=3D 0)
        return IRQ_NONE; /* device is powered down */

The strict check for 0 ignores the -EINVAL error returned when PM runtime is
disabled. If pm_runtime_disable() is called before free_irq() during driver
removal, pm_runtime_get_if_active() returns -EINVAL.

Does this cause the handler to incorrectly treat -EINVAL as active and proc=
eed
to issue I2C transactions to an unpowered device?


[Severity: High]
This isn't a bug introduced by this patch, but I noticed unprotected I2C
hardware accesses in some IIO callbacks without waking the device via PM
runtime.

In mma8452_read_raw():

    case IIO_CHAN_INFO_CALIBBIAS:
        ret =3D i2c_smbus_read_byte_data(data->client,
                                       MMA8452_OFF_X +
                                       chan->scan_index);

And in mma8452_read_event_config():

    case IIO_EV_DIR_RISING:
        ret =3D i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);

These branches perform direct I2C reads without first invoking
pm_runtime_resume_and_get() to ensure the device is powered.

If userspace reads corresponding sysfs attributes while the device is in
auto-suspend, will this result in I/O errors and bus timeouts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-mma8452-op=
en-drain-v4-0-bfca15d02b59@geanix.com?part=3D6
