Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44A479885
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584622; cv=none; b=Qsv8KcEv9IOvkM+Oq8pBCKawptWae95oO8w7edFvagddoQMN6uxF8DNgtIP7jv8GXmPHZKJNJ4EzYilJoVYrLGheB+Rh1/xADMZNEkYg7UDvCOThov/zvWN1FzBEHV4VM3E8S50q5jsU9MUpVsMztMyfzLgHb22vrxE3TG1vVMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584622; c=relaxed/simple;
	bh=nCbAFuCpygbIZxa65yWR3Pom7kjsTNjFdWfS3uzofNA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Od6p2BqHMPJ2LjIzFJ4OuuRz+wM9FRSxGahOmyKMJa7rF2etXzneNONO6Ka3hXylAau0dF7uiSaMLxoTdKWhLQaRB/8xgctb1RRtj91LHGX3A93ZXGgIPAfjKTkLUj8oz5sm3sWJa4v10QSaZZQ8Rdaqmx+4lkn/fpDfPDuCgfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQ/4WPw+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQ/4WPw+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9ED1F000FF;
	Mon, 28 Sep 2026 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790584620;
	bh=hBDZ7dzq2v+0/DAqASPL3t2lHGmZwbFnliczZkowSDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQ/4WPw+Bn74JiKafYxIceMZ8/4MMfa3YSyFcfqePSyeiJGmYLz8gTMLc0swgJFV4
	 7VUxjuA8jlsX3HrideGm/OHJ9KlOWFUMQ0gM8QiRxKtke75d6OmFr1txb+sJIsmgUI
	 2ISCnLKJdG5FXTde8M0i1zQyLD9qhvOPT0M3AHDbduHdYEXoa5O6sFyDraZ+G6qs8e
	 ZO+mTF6o7XTHkMtpNmA0UbpwyBknhSU9h+WJxke/ciIlYkRts1toAChJEWfvn5KlKn
	 ++Bhjhbzr2Iwqd917qW8/WSw8rs8Dztvtky/IHbRkQvdZVPZyYOTYaVAPo7H9M5Kto
	 NBB+jmsQ31i+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 05/10] iio: accel: mma8452: Only apply trigger type
 when not set by firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928-mma8452-open-drain-v10-5-b906fb408386@geanix.com>
References: <20260928-mma8452-open-drain-v10-0-b906fb408386@geanix.com>
 <20260928-mma8452-open-drain-v10-5-b906fb408386@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 08:36:59 +0000
Message-Id: <20260928083700.4F9ED1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: accel: mma8452: IRQ storm due to unconfigured hardware interr=
upt polarity
--

commit 24f5b1347bb4e1832201e80435a781ee363c54e3
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Only apply trigger type when not set by firmware

This commit changes the mma8452 probe function to read the IRQ trigger type
from the firmware instead of unconditionally forcing it to active-low. It
falls back to active-low if the firmware does not specify a type.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 8d70fe89110cd..72b4ab32775a6 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1669,9 +1669,16 @@ static int mma8452_probe(struct i2c_client *client)
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
Does this risk an IRQ storm if the firmware specifies an active-high trigge=
r?

By dynamically applying the firmware's IRQ trigger type to the host interru=
pt
controller, the host configuration might no longer match the hardware defau=
lt.

If the firmware requests an active-high interrupt, the host interrupt
controller will be configured for it here. However, the driver does not app=
ear
to write to the MMA8452 sensor's CTRL_REG3 register to set the IPOL bit. Th=
is
leaves the sensor's physical output polarity at its active-low default.

For a level-triggered interrupt, this mismatch would cause the interrupt li=
ne
to constantly fire. Since the interrupt handler returns IRQ_NONE when no ev=
ents
are pending, could this result in an infinite loop?

>  		if (ret)
>  			goto buffer_cleanup;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-mma8452-op=
en-drain-v10-0-b906fb408386@geanix.com?part=3D5
