Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3A1436342
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548233; cv=none; b=U5JFZVCkObl5yre9O0MKz/XOA1HAnM37UEEwB4DOxk+DmYdkzNvnPzR0n0M5X3yIaq93+nHFu7MkmW9cR4PvhmXho4knpbwu+IwTSepvKT2PMr50vDPqlaQQ7k+CpbedBCWVsSbpE69CCznccTYe7d2IG57YkgYAEDcWyLywv5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548233; c=relaxed/simple;
	bh=LuCKyOhQ7eO5becPGXZmxJlicLtnPVIXBJKRP96SzdQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LA9r1AJUvm+aTVDi8SJeascPY1sINwEaImMzvovTdjOSFQPdqo0ybBiHj5bamDU2JJfo8mB1MIHcpJ2lHN7L2ib+L56L8+YgluIoy75+LkcTw3ohZtMt4NUORTjRroJ22qp/Skwy/OXWuqRXm9IIUy2Hj9chgVXy59Bmtv1zxj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5eAQqaB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5eAQqaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6D21F000E9;
	Wed, 12 Aug 2026 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786548232;
	bh=9mK5ZuPS5GfCHwbr4w/unVWk08YAGU39uUjRKenvno4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J5eAQqaBzAnvI+HNGNoMci1LwH+8kKPE+plTEWwNh18hLEIaqQXmCHiNLk+8FvqbH
	 B1Zo6vBtyTLKa4cA6Wi8uEMu8NXhzZgfJf1yEfMTAfh0ItdX0iHErbidCYaM19UGIM
	 q+kllOnyegKKimDlsQgezagjWTsqmUEypTUOuhpDdtIP+qrd1zR4iqpmL+15NPaHuj
	 CGlFIy6ZmHx4Szm9m92RMQsxReG/6PUfbqp6rQ6BOmsOySMMFYbSqfg6XASOD0zKW1
	 u51j8nBJf/m0F2SxJWLM6T0cI6qbh5rdxw8PzDmXk6pu2EVaeEU5jPz43A+eNCW9Ap
	 JJystSxESGUPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] iio: accel: mma8452: Only apply trigger type
 when not set by firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812-mma8452-open-drain-v4-3-bfca15d02b59@geanix.com>
References: <20260812-mma8452-open-drain-v4-0-bfca15d02b59@geanix.com>
 <20260812-mma8452-open-drain-v4-3-bfca15d02b59@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:23:51 +0000
Message-Id: <20260812152351.DB6D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unvalidated and unconfigured IRQ trigger types from firmware cause=
 interrupt polarity mismatch or hardware stalls.
--

--- Patch [3]: [PATCH v4 3/6] iio: accel: mma8452: Only apply trigger type =
when not set by firmware ---
commit 6463a4aeb8274414532a847585e92a3f1c4195b9
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Only apply trigger type when not set by firmware

This patch modifies the driver to use the IRQ trigger type specified by
the firmware instead of unconditionally forcing an active-low trigger. It
falls back to active-low if the firmware does not provide a valid trigger
type.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index f645a5c6fd1c2..1fb43c5b0b72f 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1683,9 +1683,16 @@ static int mma8452_probe(struct i2c_client *client)
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
Will this cause an interrupt polarity mismatch if the firmware specifies
an active-high trigger?

Looking at mma8452_probe(), the driver calls mma8452_reset() earlier,
which forces CTRL_REG3 (and its IPOL bit) to the hardware default of
active low.

If the firmware specifies IRQ_TYPE_LEVEL_HIGH, the OS interrupt subsystem
is configured for active-high, but the sensor continues to assert active-low
because CTRL_REG3 is never reprogrammed to match the firmware trigger type.

Additionally, can passing edge triggers (like IRQ_TYPE_EDGE_FALLING) to a
strictly level-triggered I2C sensor cause a missed-edge race condition?
If a second event occurs before the interrupt line is deasserted, this could
permanently stall the sensor.

>  		if (ret)
>  			goto buffer_cleanup;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-mma8452-op=
en-drain-v4-0-bfca15d02b59@geanix.com?part=3D3
