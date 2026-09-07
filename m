Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FF64FC8EA
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793274; cv=none; b=YyL5Pakw9YMGw4rT/Es/9IgHtDMbUtE5Evsra7zs1N63uGNnMaQIC5C1a9kjCOSiuyx66UKT5Xo9qlUQ1CebVP4SAkAVtnSgpwUlCXY04+iupzlcIEnUMBknquDWVjTusWGJKQWCcM0xcDAJZpqy4nc9PC0bx9oVzasKlrJModo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793274; c=relaxed/simple;
	bh=ytBM62+q4XC8pDr2Fc8qYwZ2LPc+2lQqTtkhBX8bdxM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CA5mR6DY2RdWIdd3dJhVv+twRtR01p2rs55jjMUwbPi+2RAC2/bhDNetOy14faOyLdaveWBpUMbrhQZdNUe8hevwswra2E35kXmgmQUij7GBynvok7lvkLEdD3WiLub9S4eSj0EUy55uvR6uoVCs8xhgSX3FQAL6ekETM7jWGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDYF2AEH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDYF2AEH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F411F00ACF;
	Mon,  7 Sep 2026 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788793268;
	bh=XLyrGstskUWEIxg8vv7i2ZgHSpaCYh4BaMs1Wex3cbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BDYF2AEHAQL44MUdohWsKq06qzwWIs4yptG/+nD6Z1cFu1rRuchuMqd2t4SeTb27x
	 AWhsbI8pEbTibFS/AywJTvYmkIizfSLzVBJ4qZxwR0f1aitdz7meumW+OGPUkYFzAZ
	 XeujDgaVzehlcsYkKPYgC6bzezsUseuz9OM4RTlQyeW7EEEpiR3R7eoRZLF+L4AJDA
	 ylcBaxGPKcNHWPplrkTYIcOZNZBnr6RFH78w6uU5Nw694yPE2vvqyIIlrwwxNIRXvl
	 1fiPlQQoksdBDt8yet5fhAuf78HECoMvjgGJ9+onDpWwkTjwY5m1XgomCCnXF7ZU1Q
	 y6/BenzcKU/GQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/9] iio: accel: mma8452: Only apply trigger type
 when not set by firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-mma8452-open-drain-v8-4-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
 <20260907-mma8452-open-drain-v8-4-c17407e22118@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 15:01:08 +0000
Message-Id: <20260907150108.97F411F00ACF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware configuration mismatch for active-high interrupts
--

commit cc23812be1f638568d4c39e30f713017f6ba0b47
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Only apply trigger type when not set by firmware

Instead of unconditionally overriding the trigger type, it is better to
only apply a default when no trigger type is set by firmware. This should
be reasonably backward compatible, and should only potentially cause
problems if systems exist where firmware specifies an incorrect trigger
type. With a bit of luck, there are no such systems.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 6c5a8d65c8a42..05851274596e5 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1665,9 +1665,16 @@ static int mma8452_probe(struct i2c_client *client)
>  		goto trigger_cleanup;
> =20
>  	if (client->irq) {
> +		unsigned long irq_flags;
> +
> +		irq_flags =3D irq_get_trigger_type(client->irq);
> +		if (irq_flags =3D=3D IRQ_TYPE_NONE) {
> +			dev_info(dev, "invalid irq type, setting default active low\n");
> +			irq_flags =3D IRQF_TRIGGER_LOW;
> +		}
> +		irq_flags |=3D IRQF_ONESHOT;
>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
> -					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> -					   client->name, indio_dev);
> +					   irq_flags, client->name, indio_dev);

[Severity: High]
Will this cause a hardware configuration mismatch if the firmware specifies
an active-high or edge-rising interrupt?

In mma8452_probe(), when the firmware specifies an active-high interrupt
(e.g., IRQ_TYPE_LEVEL_HIGH or IRQ_TYPE_EDGE_RISING), this code passes the
active-high flag to request_threaded_irq() and configures the host
interrupt controller accordingly.

However, the MMA8452 sensor hardware defaults to an active-low output.
Without explicitly configuring the IPOL (Interrupt Polarity) bit in the
sensor's CTRL_REG3 register (0x2C) to match the requested firmware trigger
type, the sensor will continue driving an active-low signal.

This mismatch will break interrupts for systems that correctly specify an
active-high trigger.

It may also regress systems with incorrectly specified active-high device
trees that previously worked because the driver hardcoded IRQF_TRIGGER_LOW.

>  		if (ret)
>  			goto buffer_cleanup;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-mma8452-op=
en-drain-v8-0-c17407e22118@geanix.com?part=3D4
