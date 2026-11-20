Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175148;
	b=j/EbR6QrYpy4Y0OzyRMFDEJDtvHPZ7ZnGD0oMkSu9xtpOckfx6PlZElqjohckkq6FtV/
	 58cSWgLi33K9LBX/i03NVkleaEcuwq2IcQjvJlC8TPqm2KqTPLzgyplWj+iGorjDFYSoN
	 8QEgv8jTYmILWOVZgGelBUhq8HUNDkTlVY34ZS46sRIudGot5aZbLW/QRqrUDswgk5fFd
	 SgmAmBRY+nN9K9aGFeBVIf/MbnLybeuYeFo9CRS/nPLM17+uYJ5vF3arjteWkb2lxHZ8k
	 ns9DntLJfaKPa15SP5xmnRkSNgvSx1/lX+Nr6Vbfiq01D+eHJIeF5jhJG3eYH34zhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175148;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qFJHCYCBH2HdGEWOK8mNKRJIMaXl40/vMVYTvjR1Mj4=;
	b=pDb7OhE6mXfEUHhI92ymAUBySma5WPtboYj+HykzXrKJlDbc9eUz0nGFa6z54eWCaMG0
	 2fIeE51xtIFa7+eqmpZ9jJM0lf4LQUX2y7yunquJ0RVw0Llm6HGtwz4HUZZsTlEMWY2w1
	 gqvCZxaKKi6P1N1UFdQ8bXuB7QgFHKXNynRZTjiLuvkHOpY+jqmk1hmSDchp41tS5Ctir
	 leOLn5kFNjbO+gbci1eAdcoXgw4R6oLNSPp+Puffd2comXoRbzJk2u7Y58NQIEoFK9rBw
	 z4svLi5QIvdFTWtPPl0XXAYg9/Zy1otTvTFHsz/N8XiBZXZvM7opKU4GOR3ZIKaUaLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3HPSi1c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C167460A2610
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3HPSi1c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E901F000C0;
	Fri, 20 Nov 2026 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175148;
	bh=qFJHCYCBH2HdGEWOK8mNKRJIMaXl40/vMVYTvjR1Mj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l3HPSi1cVz6ym+H5d3naV1oO4HajPOe8vOT6VMlhEf63NsUi+nnocGT/Hd6oD1hhu
	 5tCPzErTNsdenoaFDsTewgqmRscHImbYX9mq5AUT8fTfUvhfBi2LIwTITeXPZ+mb35
	 H4m8Qrk/ZaY+k1KjSN7KmauyZmuTIJpgj9TpaQhJNNG/CzeSkN8GKeg5/ScxWwACDY
	 RfX96afeq9oRYYYXHhqRqF7KwpY6QItIBQIQMosE446Lk3tjxLoOJZ6SbpsLACZqj1
	 eq+hDL5YO2IFEP3Fw59FOjsQI4d1BoqztwSfXLASlTRwFHvHB4Geq0ZkwCSLmwYpCz
	 c3cBhdzB4dHBQ==
Message-ID: <sashiko-outbox-225093@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ad_sigma_delta: support devices without
 RDY interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "ILYAS NHASSE" <ilyas.nhasse@skf.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-ad7124-no-irq-v1-2-7826c5c3fd25@skf.com>
References: <20261120-ad7124-no-irq-v1-0-7826c5c3fd25@skf.com>
 <20261120-ad7124-no-irq-v1-2-7826c5c3fd25@skf.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:45:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] iio: adc: ad_sigma_delta: ad_sd_init() rejects missing rdy
  IRQ on named-IRQ chips
--

commit 87e803058ca4873e10b22ef0a9b56f4fa07e3e6e
Author: ILYAS NHASSE <ilyas.nhasse@skf.com>

iio: adc: ad_sigma_delta: support devices without RDY interrupt

This commit adds polled status-register support in direct mode and
calibration for register-based sigma-delta ADCs wired without an RDY
interrupt.

> diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_=
delta.c
> index 119ddc5a13e27..546135995bbf7 100644
> --- a/drivers/iio/adc/ad_sigma_delta.c
> +++ b/drivers/iio/adc/ad_sigma_delta.c
[ ... ]
> @@ -816,12 +845,18 @@ static int devm_ad_sd_probe_trigger(struct device *=
dev, struct iio_dev *indio_de
>   * devm_ad_sd_setup_buffer_and_trigger() - Device-managed buffer & trigg=
er setup
>   * @dev: Device object to which to bind the life-time of the resources a=
ttached
>   * @indio_dev: The IIO device
> + *
> + * Nothing is set up for devices with registers but without R=CC=85D=CC=
=85Y=CC=85 interrupt:
> + * they only support direct mode, with polled conversions.
>   */
>  int devm_ad_sd_setup_buffer_and_trigger(struct device *dev, struct iio_d=
ev *indio_dev)
>  {
>  	struct ad_sigma_delta *sigma_delta =3D iio_device_get_drvdata(indio_dev=
);
>  	int ret;
> =20
> +	if (!sigma_delta->irq_line && sigma_delta->info->has_registers)
> +		return 0;

[Severity: Medium]
Can sigma_delta->irq_line ever be 0 on register-based devices that set
info->has_named_irqs =3D true (such as the AD717x and AD411x parts in
drivers/iio/adc/ad7173.c)?

When the optional "rdy" interrupt is omitted in firmware on those devices,
fwnode_irq_get_byname() returns a negative errno (-EINVAL or -ENODATA) and
ad_sd_init() aborts probe before reaching the polled path:

drivers/iio/adc/ad_sigma_delta.c:ad_sd_init() {
    ...
	if (info->has_named_irqs) {
		sigma_delta->irq_line =3D fwnode_irq_get_byname(dev_fwnode(&spi->dev),
							      "rdy");
		if (sigma_delta->irq_line < 0)
			return dev_err_probe(&spi->dev, sigma_delta->irq_line,
					     "Interrupt 'rdy' is required\n");
	} else {
		sigma_delta->irq_line =3D spi->irq;
	}
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-ad7124-no-=
irq-v1-0-7826c5c3fd25@skf.com?part=3D2
