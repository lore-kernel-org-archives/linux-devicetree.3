Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50813DA5BA
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010607; cv=none; b=mfZqBi9v5dJVzQiSpo614KM4mAPR5pRxk/yqUEtcgAK+8ucbsIUe6hd9uze4Cnqz29V2+fc9DGXzICXgbffAUNNyEN6GQTGFycroWb5gECuWYP5fkm3mFMp+wSLkgh1lN6Zce1gChOsF2gNZXoA8Uku/6v/Wulpg5cQU4Bgl97U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010607; c=relaxed/simple;
	bh=kpkTpTopNDweDsgKS+PEjJqyuuAbbG9C8ut+gYEVh3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ASEGLMZgx9i1LwCJecIt0gj1nqaiL5o7J8u01E/pZmjR6Mi0y6ObWkbfu7jwbjrRsbjRgVZCyKb9GglKEvYIrRIqObuCiz54dh+Ztbj0B8CZDh0e9pEh41MZhSURB7LFEvlFEML3r/pNXYe/DJDU8k9SBDm6BoWO1x5NHUyLL+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ysi4MW2T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ysi4MW2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B50D1F000E9;
	Tue, 14 Jul 2026 06:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784010606;
	bh=BYpPUi/lHKhAiKvP69pT8j5943TCg4tBwFSHCFcCVH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ysi4MW2TebvrhWWq29b4KghehXKrtJC0UZsSduB/nk2q3lEDMdgHMJEj7PHo9ewDz
	 Qn+wfrL4w2Ea7X1neNbKRZdwDlzkgF3R663XWiS+0furoEZ92dossFYJzYTEBtOdqR
	 jMRHTd4QaxOXXe65KmhI4qrvEGFSGXaxmurZ+Ai8sNUfYEhkNBUzEvZUZrl7O8Y9wO
	 ZgRCXZ3DrXX35zbtZPLo/7fRezhtMyEtFqhlcL+axobxKHARc3WLD9KeGbMYWjCnrI
	 NkqmQusZ9gZd5ICQxSj0wf/IJ2Al3C4ikD7VJr/wgulSE8/eyIzEuEiaodOukmW7Wl
	 dgBY+Xao0Jt3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] usb: typec: tipd: add read_power_status callback
 to tipd_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714061820.537792-3-radhey.shyam.pandey@amd.com>
References: <20260714061820.537792-1-radhey.shyam.pandey@amd.com>
 <20260714061820.537792-3-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 06:30:05 +0000
Message-Id: <20260714063006.4B50D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing cancellation of queued delayed works in the probe erro=
r paths leads to Use-After-Free of devres-managed memory.
- [High] In `tps6598x_probe()`, a failure in `tps->data->connect()` causes =
probe to fail in polling mode but silently succeed in IRQ mode.
- [High] Multi-byte raw I2C data is read into native integers (e.g., u32, u=
64) without endianness conversions, breaking bitwise operations on big-endi=
an architectures.
--

--- Patch [2]: [PATCH v3 2/3] usb: typec: tipd: add read_power_status callb=
ack to tipd_data ---
commit 5bbdcd3daa173c06fcfc36de1b9d3a33bfefea78
Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: usb: typec: tipd: add read_power_status callback to tipd_data

This commit converts direct tps6598x_read_power_status() calls to use an
indirect callback through tipd_data. This allows variants to provide their
own power status reading logic while keeping existing behavior unchanged.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index b6335b36d3846..9097b0d40a71d 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c

[ ... ]

> @@ -1026,7 +1027,7 @@ static irqreturn_t tps6598x_interrupt(int irq, void=
 *data)
>  		goto err_unlock;
> =20
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
> -		if (!tps6598x_read_power_status(tps))
> +		if (!tps->data->read_power_status(tps))
>  			goto err_unlock;
> =20
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_DATA_STATUS_UPDATE)

[Severity: High]
This is a pre-existing issue, but does evaluating the unswapped 64-bit I2C
data cause bitwise operations to check the wrong bits on big-endian CPUs?

When multi-byte registers are read in tps6598x_block_read(), raw I2C bytes
are copied directly into native integers using memcpy(). Because bitmasks
like TPS_REG_INT_POWER_STATUS_UPDATE are applied to event1[0] as a native
integer, the driver may evaluate the wrong bytes and malfunction on
big-endian architectures.

[ ... ]

> @@ -1839,7 +1840,7 @@ static int tps6598x_probe(struct i2c_client *client)
> =20
>  	if (status & TPS_STATUS_PLUG_PRESENT) {
>  		ret =3D -EINVAL;
> -		if (!tps6598x_read_power_status(tps))
> +		if (!tps->data->read_power_status(tps))
>  			goto err_unregister_port;
>  		if (!tps->data->read_data_status(tps))
>  			goto err_unregister_port;

[Severity: High]
This is a pre-existing issue, but does probe silently succeed if partner
connection fails in IRQ mode?

Slightly later in tps6598x_probe():

    ret =3D tps->data->connect(tps, status);
    if (ret)
        dev_err(&client->dev, "failed to register partner\n");
    }

    if (client->irq) {
        ret =3D devm_request_threaded_irq(&client->dev, client->irq, NULL, =
...

If tps->data->connect() returns an error, the ret value is unconditionally
overwritten when client->irq is present. This completely masks the
connection error, leaving the device registered in a degraded state without
a partner. If polling mode is used instead, the same error correctly causes
probe to abort entirely.

[Severity: Critical]
This is another pre-existing issue in tps6598x_probe(), but can the probe
error handling path cause a Use-After-Free?

If probe jumps to err_disconnect after delayed works have been queued
(e.g., tps->wq_poll or cd321x->update_work), the error path executes:

err_disconnect:
    tps6598x_disconnect(tps, 0);
err_unregister_port:
    tps->data->unregister_port(tps);
...

This cleanup completely omits canceling the pending works. The devres
cleanup will subsequently free the tps structure, but the delayed works
remain active in the system workqueue. When they later execute, they will
access the freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714061820.5377=
92-1-radhey.shyam.pandey@amd.com?part=3D2
