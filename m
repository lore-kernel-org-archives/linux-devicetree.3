Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122A236195A
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915230; cv=none; b=EUFKBaaHNebcMowjFlhQ31Xvv7yayLuJnTe3r87RS/GBZlMr27lkK/XW5nOml5TD7YAyLzWuRJZEZY49F8H7FkNnELN36DR4JuwsrKvxiM7aGkucq0EukwVmRhfcrHAD8x/gPI7FIMS2txtcWSbQw4Ngl6vs3VviCL2a+J+A5Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915230; c=relaxed/simple;
	bh=4bMXjVR33vszR1qj50LWni2lVKWWU646nVpxnXQsGM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QBmUIGZkwXBDnBPQvtpF4umLPqFJ7pBDAE3XhHfur3PQ20MbaBosghDmZFX4nXJ4/ymGESGbtbIdW5LpqykxIieNbOqRJk7sSNnYoXJNWryVYSOr/C6IbE28v0acP67KkiA/ckjZ96DHgZdNJhUODOMcx9LIn3sONaZqjEpoYRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtVQQ101; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtVQQ101"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BBD1F00A3D;
	Wed,  5 Aug 2026 07:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785915228;
	bh=EWrB0LiFW23zgD0nblmqcpYMj62YHVdsGTjm++DLpOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XtVQQ1010SNff41/kMX+KsBX2Cl5Z6/13czR+LICz1LFwyJgnaWK38AXITZJl/z3I
	 Qz4wow37pEr9F+o6RZ8afGccl/46otSuVZvQyJqt0x4Y4yMK+Y99WllyA1LnxnDUrO
	 rjtOWT4HPFE6P4ZyHnQADj3BpAOGmkapQay2XgTgcBnqWv113T2tBxGM2KXxa/r4K1
	 amm1tfO9GlQFFMiy7V0m07HnAeCCJhjNCMgwlRsbD3QoG5zl2HKGhgZQa2jOn7mPIF
	 sc1ucsEtMJKXzOugD3ZORIDORgn+dTSytz05/4pCHAnS/rts378dWXL2bB5S1FRyFI
	 YUwbMxB+ETr7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] iio: accel: mma8452: Only apply trigger type
 when not set by firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805-mma8452-open-drain-v3-3-6149f406a409@geanix.com>
References: <20260805-mma8452-open-drain-v3-0-6149f406a409@geanix.com>
 <20260805-mma8452-open-drain-v3-3-6149f406a409@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 07:33:47 +0000
Message-Id: <20260805073348.60BBD1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver applies firmware-specified IRQ trigger types without co=
nfiguring the sensor's polarity to match, breaking active-high interrupt co=
nfigurations.
--

--- Patch [3]: [PATCH v3 3/4] iio: accel: mma8452: Only apply trigger type =
when not set by firmware ---
commit 15bd5e2afb9b0b1a0a93c58982fed1331a0ecfe5
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Only apply trigger type when not set by firmware

This commit updates the driver to respect the firmware-provided interrupt
trigger type, falling back to an active-low trigger if no type is
specified by the firmware.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index f645a5c6fd1c2..723ca3d9cb96b 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1683,9 +1683,14 @@ static int mma8452_probe(struct i2c_client *client)
>  		goto trigger_cleanup;
> =20
>  	if (client->irq) {
> +		unsigned long irq_flags;
> +
> +		irq_flags =3D irq_get_trigger_type(client->irq);
> +		if (irq_flags =3D=3D IRQ_TYPE_NONE)
> +			irq_flags =3D IRQF_TRIGGER_LOW;
> +		irq_flags |=3D IRQF_ONESHOT;
>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
> -					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> -					   client->name, indio_dev);
> +					   irq_flags, client->name, indio_dev);

[Severity: High]
Does this cause an interrupt mismatch if the firmware specifies an
active-high interrupt?

Looking at mma8452_probe, the driver requests the IRQ with the
firmware-specified polarity, but it doesn't seem to program the sensor
hardware to match. The MMA8452 sensor defaults to active-low interrupts
after a software reset.

Because the driver doesn't update the IPOL bit in MMA8452_CTRL_REG3 when an
active-high trigger is requested, the sensor will still drive an active-low
signal. This mismatch between the IRQ controller expectation and hardware
output could lead to missed interrupts or interrupt storms.

>  		if (ret)
>  			goto buffer_cleanup;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-mma8452-op=
en-drain-v3-0-6149f406a409@geanix.com?part=3D3
