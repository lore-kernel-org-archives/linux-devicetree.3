Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C4A3FAE02
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179434; cv=none; b=Vhhx2/MsRPt4lU/ziC08JsjTVEtg23jNsvF/UiJur7GA44ga5zHyOcCjQOm+gdlBEX19qDICNnuYT/YXPKlSHeh8ZGGKNXSy4APsJb7kIls2oTrUcUQNNqtwG/xIrxlliPMXX9eUDYQxZ7IZ3EBf2YG38bB1ko5x1Oe0G+eCgk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179434; c=relaxed/simple;
	bh=/cRAv3BrVXbjYIJ3NmZZzCLC612Gb5I5Ld2HgcBVqww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sQGuQIog0BM/KzjXp+4XCYuLmP/Tdcjs8Rtw9q8SnTQ4l/5yBzNqQRMqPHhacdc4IRlmvymKghuA7aC0O9CwHw25dKWUq+fuw9YKYIiUkv+CvtuZ2sOVZ9rk8fLBYIVELdbzSODuy7k/xd+Qd6yVzofqrSuslgcAnerDNX2T7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKCpVs9N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKCpVs9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962331F00ACA;
	Mon, 31 Aug 2026 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788179432;
	bh=SXJrucssh1oxqwX9DMdzvL1lRO6lhgieyQXFXleX1Es=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dKCpVs9NwS3Q/sQ8HGblGAOwPNT/VT1HstWbVSyidRBbWAi4QJ7Rjnw/NHwmqEANk
	 VHhumjX9YyL5nRknwLgE5w6fd3G0BSm8w8JRhL/zN8ZMLGrr2vw6GjmcaELzmBg0Hl
	 7aIYhybenA9I5M6ouSCmbYPJ0oCNQ7sLGnUwgRwga19I11T09dzi6bMUmbZ4jcTC1f
	 vQqKT9+dPlqqzeUW4/fV3KKBOpXlAhwIFFoKfBmzghu4iV5mcKidYVChyy/ywzcbY2
	 xl70T2ebufQGbtE1Zj6SqpLRVvHFdVHDiFiKsZRRmpwW9jzopfcxqZruyhK61xj9yo
	 seXqJzLoWnBhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/8] iio: accel: mma8452: Support interrupt sharing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-mma8452-open-drain-v7-4-22946812c928@geanix.com>
References: <20260831-mma8452-open-drain-v7-0-22946812c928@geanix.com>
 <20260831-mma8452-open-drain-v7-4-22946812c928@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:30:32 +0000
Message-Id: <20260831123032.962331F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing rollback of `data->suspended` on runtime suspend failure p=
ermanently disables interrupt handling and breaks device operation.
- [Medium] Unconditional call to `synchronize_irq(client->irq)` may incorre=
ctly synchronize with IRQ 0 if the device operates in polling mode.
--

commit a488fa629f355995847b3d4e006a55add5fc9ce7
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Support interrupt sharing

Adding handling of rutnime PM suspension in the interrupt handler allows
sharing interrupt with other devices.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 1fb43c5b0b72f..936eeb2efb2dd 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
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
If mma8452_runtime_suspend() fails and leaves data->suspended set to true,
won't this cause all subsequent interrupts to be dropped here?

[ ... ]

> @@ -1774,6 +1790,10 @@ static int mma8452_runtime_suspend(struct device *=
dev)
>  		return -EAGAIN;
>  	}
> =20
> +	WRITE_ONCE(data->suspended, true);
> +
> +	synchronize_irq(client->irq);

[Severity: Medium]
If the device operates in polling mode and is instantiated without a hardwa=
re
interrupt, client->irq will be 0. Calling synchronize_irq(0) on architectur=
es
where IRQ 0 is a valid system interrupt (like the legacy timer on x86) might
needlessly block execution waiting for an unrelated system handler.

Could we check if client->irq is non-zero before calling synchronize_irq()?

> +
>  	ret =3D regulator_disable(data->vddio_reg);
>  	if (ret) {
>  		dev_err(dev, "failed to disable VDDIO regulator\n");
>  		return ret;
>  	}

[Severity: High]
If regulator_disable() fails here and returns an error, the PM core will ab=
ort
the suspend transition leaving the device in the RPM_ACTIVE state. However,
data->suspended is left as true, and the hardware is left in standby.

As mentioned above, since data->suspended remains true, won't the interrupt
handler unconditionally return IRQ_NONE for all future interrupts? This see=
ms
like it would break the device's event handling until the module is reloade=
d.
Should we revert data->suspended to false and restore the hardware state on
this error path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-mma8452-op=
en-drain-v7-0-22946812c928@geanix.com?part=3D4
