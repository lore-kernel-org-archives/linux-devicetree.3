Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0572476072
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548900; cv=none; b=PikVGObfLSefZXB5jma/38zxbp4lYzPHCE0Tbvkgnt/bHUd3zS/Dl3WcdA/qi1Qz4Sis5EBZ+rQZ+VtDr+DqaI4P4s2IRZPlnJQ+nG5PNokxXgpGe20+WFRXEBJdCPL5yWzh9Y88ox8OIl/6/wJmbu1QBhhCg5HGYWUJ07Zfph0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548900; c=relaxed/simple;
	bh=vkuIIQJwedM1ohFIttH4vJIZ+14wQV2TUc1uo1drY+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j4MTLrh70+5v5yududEpoqEReYxhlsHvyTmRKFar4jenylaIgS7SDBlcVvt/CJHSjw972H1taJ66CKHdmoooENEE4ifNylHhPbNOhRNrnb13rBajQW/V5u8JjWP5NRHut6X8yVt6vc89yEIph/BJErHiHOfPOyeuzWYVfgEiews=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIsBSOhI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIsBSOhI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DC91F00A3A;
	Wed, 12 Aug 2026 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786548891;
	bh=R41Ja1h9IoBouZjTYOU29tG6a5gRuLJqMdCw6wiXqlU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MIsBSOhIHGwR7X/AdoyvPolRNPRxpw9EVXRIC2gN2LI+g80So7Xb1sTMw8TEj/7t+
	 CVH//2xMAIwUghBZwg0wAVBKU3QuidTF/EQ42+b028LX7sQJUpBWO6lc2xX5KzStC9
	 kPtwhfFj3+snh00uvk/cv/XKASlOHNKf9LO1SMD/+N9aaEj9JHyhiZovPOAqFNNoQv
	 CJqy2NVSqB0aqd+8BBNeB3VGFnOsWkj136tZ3MU61JC1wpDkvCWXs+UdhCM6CzS0OC
	 nDfoXcBr7uk++fPT44QNoqi3XKpSQTjFRtRFG3l29v9+xnk0aW1+AnzWKbnW9s+t2q
	 kNocM+KvME0Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] iio: accel: mma8452: Support interrupt sharing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260812-mma8452-open-drain-v4-4-bfca15d02b59@geanix.com>
References: <20260812-mma8452-open-drain-v4-0-bfca15d02b59@geanix.com>
 <20260812-mma8452-open-drain-v4-4-bfca15d02b59@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:34:50 +0000
Message-Id: <20260812153451.55DC91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The interrupt handler incorrectly checks `pm_status =3D=3D 0` inst=
ead of `<=3D 0`, leading to unpowered hardware access when Runtime PM is di=
sabled.
- [Medium] The runtime suspend callback lacks a call to synchronize_irq() b=
efore powering down the hardware, violating PM subsystem guidelines for dev=
ices using shared IRQs.
--

--- Patch [4]: [PATCH v4 4/6] iio: accel: mma8452: Support interrupt sharin=
g ---
commit ae80b7f558736b5e80920be8e31037e5cc8645ba
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Support interrupt sharing

This commit adds handling of runtime PM suspension in the interrupt handler.
It also adds the IRQF_SHARED flag to the interrupt request to allow sharing
the interrupt with other devices.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 1fb43c5b0b72f..106cdd904dbfd 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1056,14 +1056,19 @@ static irqreturn_t mma8452_interrupt(int irq, voi=
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
> +

[Severity: High]
Does this correctly handle the case where runtime PM is disabled?

When pm_runtime_disable() is called during device removal,
pm_runtime_get_if_active() can return -EINVAL.

If a shared interrupt fires from another device during this window, the
handler will see a negative return value. Since the check is explicitly
for =3D=3D 0, the handler will proceed and attempt to read from the I2C bus=
 while
the device regulators might be disabled.

Should this check be <=3D 0 instead?

>  	src =3D i2c_smbus_read_byte_data(data->client, MMA8452_INT_SRC);
>  	if (src < 0)
> -		return IRQ_NONE;
> +		goto out;

[ ... ]

> @@ -1690,7 +1699,7 @@ static int mma8452_probe(struct i2c_client *client)
>  			dev_info(dev, "invalid irq type, setting default active low\n");
>  			irq_flags =3D IRQF_TRIGGER_LOW;
>  		}
> -		irq_flags |=3D IRQF_ONESHOT;
> +		irq_flags |=3D IRQF_ONESHOT | IRQF_SHARED;

[Severity: Medium]
With the addition of IRQF_SHARED, is synchronize_irq() needed in the runtime
suspend path?

The PM subsystem guidelines require that drivers using shared interrupts mu=
st
call synchronize_irq() in their runtime suspend callback before powering do=
wn
hardware. This guarantees no interrupt handler is executing mid-flight when
the regulators are disabled.

Would it be safer to add this to mma8452_runtime_suspend() before the device
is placed in standby?

>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
>  					   irq_flags, client->name, indio_dev);
>  		if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-mma8452-op=
en-drain-v4-0-bfca15d02b59@geanix.com?part=3D4
