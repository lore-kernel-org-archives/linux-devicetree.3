Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEC03BFE2D
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792258848; cv=none; b=AK9rgb3/ZGtDGd9zUvKoa1Ar40tZ8hFVrUMqp9oFWRHrUs1S5fEtfJNkRhBRnPHhXqslR6jaHKLBk/YBc8dKqVHZ1uYJ0B7LARuLNxmMujGu5aNc4ceRxnOoZWvnIqsO28OKqOxpgxBZnpQu89b2fVaeSqirD5y9cyUS4tkGJLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792258848; c=relaxed/simple;
	bh=6WZTYId3x/irsnLNnHa7ZH9vdJqtsgYU1h/U276p2Hs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qiKsNsZ+8WfySrI+7Z90nf46Mcmq75zmIif9oDQ2bOxkKepYXSlQ0J95l9KbEW94WAojGMW73WoPfVcTSIKyCpyPeojJIUgKBS5uDVL66KbH9bIX+ck05qmxXbxULYLjgMGdQOdve0sk9nB2rSPbMG4jZxDNVvpV1XqQYgaGc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdKouXTF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdKouXTF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9681F000C5;
	Sat, 17 Oct 2026 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792258847;
	bh=uMKbZqECC7VXIaFDw0jxIiGE4sWqMrJJQ9VdFfzoBjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IdKouXTF8QGplcb4BTs/MdiFmPtKCegTL5t6Ky9Nd56jMmDkd8tsB/LgDSxFu4dH3
	 y0TchF/nHK3jvShL8t9xbarceZGGOLRodRDe7QE+lMNVS0Is94IqJLznST7cXphlXD
	 j90iVV17TRUzefu8XS7EqXHXep7y+HDm/AoQLlRvYrDKaGRQqMpBFoGWa1hyOVKvmk
	 /mYL+wxe9CmglEi28EnCSrekqJw5+P4d469+4TSdua/A/0Layo5Vlca+xVsGDX4cIs
	 OIvdgTbnR7PlTCWa82jLW64MlHsPRyzc8vKHYKHs9hm8miesLYjUV8N24kC3ovWXff
	 CoXnH/92JkhYg==
Message-ID: <sashiko-outbox-175712@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] iio: light: gp2ap002: add led power supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christoph Rudorff" <chris@rudorff.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017-iio-light-gp2ap002-v2-2-d6879767a446@rudorff.com>
References: <20261017-iio-light-gp2ap002-v2-0-d6879767a446@rudorff.com>
 <20261017-iio-light-gp2ap002-v2-2-d6879767a446@rudorff.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 17:40:46 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: light: gp2ap002: regulator_bulk_disable() before unregister=
 in remove
- [Low] iio: light: gp2ap002: missing colon in struct gp2ap002 kernel-doc c=
omment
--

commit 1b407693e15c0943285ade4ca753202aa66cebe1
Author: Christoph Rudorff <chris@rudorff.com>

iio: light: gp2ap002: add led power supply

This commit converts the gp2ap002 light and proximity sensor driver to use
the bulk regulator API and adds support for an optional vled power supply.

> diff --git a/drivers/iio/light/gp2ap002.c b/drivers/iio/light/gp2ap002.c
> index de29081fd3b20..5e4599e403761 100644
> --- a/drivers/iio/light/gp2ap002.c
> +++ b/drivers/iio/light/gp2ap002.c
> @@ -123,12 +123,26 @@

[ ... ]

>  /**
>   * struct gp2ap002 - GP2AP002 state
>   * @map: regmap pointer for the i2c regmap
>   * @dev: pointer to parent device
> - * @vdd: regulator controlling VDD
> - * @vio: regulator controlling VIO
> + * @supplies bulk regulator data

[Severity: Low]
Should @supplies have a colon after it so kernel-doc does not warn about an
undescribed struct member in struct gp2ap002?

>   * @alsout: IIO ADC channel to convert the ALSOUT signal
>   * @hys_far: hysteresis control from device tree
>   * @hys_close: hysteresis control from device tree

[ ... ]

> @@ -632,9 +650,8 @@ static void gp2ap002_remove(struct i2c_client *client)
>  	pm_runtime_get_sync(dev);
>  	pm_runtime_put_noidle(dev);
>  	pm_runtime_disable(dev);
> +	regulator_bulk_disable(NUM_SUPPLIES, gp2ap002->supplies);
>  	iio_device_unregister(indio_dev);
> -	regulator_disable(gp2ap002->vio);
> -	regulator_disable(gp2ap002->vdd);
>  }

[Severity: Medium]
Should regulator_bulk_disable() remain after iio_device_unregister() in
gp2ap002_remove()?

In gp2ap002_remove(), pm_runtime_get_sync() invokes
gp2ap002_runtime_resume(), which powers on the sensor, initializes it into
operating mode via gp2ap002_init(), and enables gp2ap002->irq.

Calling regulator_bulk_disable() before iio_device_unregister() cuts power
to the sensor while the IIO userspace interfaces and the threaded interrupt
handler gp2ap002_prox_irq() are still active.

Until iio_device_unregister() completes, userspace reads through
gp2ap002_read_raw() or event configuration changes through
gp2ap002_write_event_config() can run after pm_runtime_disable() and access
the unpowered sensor:

drivers/iio/light/gp2ap002.c:gp2ap002_read_raw() {
	...
	pm_runtime_get_sync(gp2ap002->dev);

	switch (mask) {
	case IIO_CHAN_INFO_RAW:
		switch (chan->type) {
		case IIO_LIGHT:
			ret =3D gp2ap002_get_lux(gp2ap002);
	...
}

Similarly, gp2ap002_prox_irq() remains enabled and can fire (including if
the VOUT line glitches when VIO and VDD power down), performing I2C register
reads and writes on the unpowered chip:

drivers/iio/light/gp2ap002.c:gp2ap002_prox_irq() {
	...
	ret =3D regmap_read(gp2ap002->map, GP2AP002_PROX, &val);
	if (ret) {
		dev_err(gp2ap002->dev, "error reading proximity\n");
		goto err_retrig;
	}
	...
}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-iio-light-=
gp2ap002-v2-0-d6879767a446@rudorff.com?part=3D2
