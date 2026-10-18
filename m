Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9833BFE3C
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792319288; cv=none; b=JoSI8cmBYO7UDZXW5ceYFwyTQuBwO420TC5FsqJSXf6oG2iF7inPmyrwQtpYQ9MjylHAEtA6CpjHwL7ZdzIwkhHrRMwbMbB2IzRImfWQHbgCyEWCBqHUJQVrjozDa55GXklCZ9GSJdiGNYgiETgGT2xOBfxDg8dXcwxc5nAVcZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792319288; c=relaxed/simple;
	bh=20M124PwFYu8eLxpLRcfuokkQiW5hTKnoEfEBELNftU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DMX0e32u1uAdSADUdKPYe3dzN71XqmqZYtSoglhn9WtPRIE6KQJnubIHHSuSJj0N23oS7HnauBdPpHti8V4W2q96Z5M6xx5hLNcEE8B/MAUc5gZNgOiUU66PLAcKJlfaKOCyEtt62q6C1Qo5Vw2Yxsb/ZheUoqX5+I0758SSXQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PojZu34B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PojZu34B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E7B1F000C4;
	Sun, 18 Oct 2026 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792319287;
	bh=7Qd9v/fmkjSDP69O8Gyiu1nhcauOxATUSXZkinCUfto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PojZu34B0Ps5Mam5Mh5zdEe3p9RkE1tlPRw75F4s/bpiJvauxYlmstB8ZJZMgTyqO
	 tcFKcaKfnkYNoAVDledoAALWAORYkzAbhW1s/yJL45bcATrva83a6ojNZAck1EBjnW
	 6uThycUDfk4aJA69darKdY5PJ5gGuvbYYHsD1IblkzaYxudTgE8p/BMPwRCJKYPCf3
	 s+TozWRhfvNF1F9ndpQQCyKCjSF4vkkWPUrgvbsf4pWSNvke6kOMyY6VplaDVp2EVB
	 Kj1GC0BeTEjCfwMhU3dus4Q0qllT49PMnk6xf23FjutQ7FlfXMHo1uSkfYNdoxJZab
	 +3qBTqj1OlI/g==
Message-ID: <sashiko-outbox-176052@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: add documentation for adi,ad7816
Reply-To: sashiko-reviews@lists.linux.dev
To: wrmfwv@163.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018101921.36424-1-wrmfwv@163.com>
References: <20261018101921.36424-1-wrmfwv@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 10:28:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: iio: adc: adi,ad7816 omits required GPIOs, IRQ, and=
 SPI props
--

commit 30fcb41a84f071fc52e91564f9cf17b3f641d76d
Author: gtl-m <admin@micronull.cn>

dt-bindings: iio: adc: add documentation for adi,ad7816

This commit adds a YAML device tree binding document for the Analog
Devices AD7816, AD7817, and AD7818 family of ADCs.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> new file mode 100644
> index 0000000000000..0bbc52829b777
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> @@ -0,0 +1,43 @@

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad7816
> +      - adi,ad7817
> +      - adi,ad7818
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        adc@0 {
> +            compatible =3D "adi,ad7816";
> +            reg =3D <0>;
> +        };
> +    };
> +...

[Severity: Medium]
Does this schema omit the required GPIO properties, optional interrupt,
and SPI peripheral schema reference needed by the driver?

Looking at ad7816_probe() in drivers/staging/iio/adc/ad7816.c, the
driver unconditionally requires rdwr-gpios and convert-gpios for all
variants, and requires busy-gpios when chip->id is ID_AD7816 or
ID_AD7817:

drivers/staging/iio/adc/ad7816.c:ad7816_probe() {
    ...
	chip->rdwr_pin =3D devm_gpiod_get(&spi_dev->dev, "rdwr", GPIOD_OUT_HIGH);
	if (IS_ERR(chip->rdwr_pin)) {
		ret =3D PTR_ERR(chip->rdwr_pin);
		dev_err(&spi_dev->dev, "Failed to request rdwr GPIO: %d\n",
			ret);
		return ret;
	}
	chip->convert_pin =3D devm_gpiod_get(&spi_dev->dev, "convert",
					   GPIOD_OUT_HIGH);
	if (IS_ERR(chip->convert_pin)) {
		ret =3D PTR_ERR(chip->convert_pin);
		dev_err(&spi_dev->dev, "Failed to request convert GPIO: %d\n",
			ret);
		return ret;
	}
	if (chip->id =3D=3D ID_AD7816 || chip->id =3D=3D ID_AD7817) {
		chip->busy_pin =3D devm_gpiod_get(&spi_dev->dev, "busy",
						GPIOD_IN);
		if (IS_ERR(chip->busy_pin)) {
			ret =3D PTR_ERR(chip->busy_pin);
			dev_err(&spi_dev->dev, "Failed to request busy GPIO: %d\n",
				ret);
			return ret;
		}
	}
    ...
}

ad7816_probe() also checks spi_dev->irq to register an optional
over-temperature indicator interrupt handler:

drivers/staging/iio/adc/ad7816.c:ad7816_probe() {
    ...
	if (spi_dev->irq) {
		/* Only low trigger is supported in ad7816/7/8 */
		ret =3D devm_request_threaded_irq(&spi_dev->dev, spi_dev->irq,
						NULL,
						&ad7816_event_handler,
						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
						indio_dev->name,
						indio_dev);
		if (ret)
			return ret;
	}
    ...
}

Because the schema only defines compatible and reg with
additionalProperties: false, any device tree node that conforms to this
binding (such as the adc@0 example node) will fail ad7816_probe() with
-ENOENT, while any working device tree node supplying rdwr-gpios,
convert-gpios, busy-gpios, interrupts, or standard SPI properties will
fail dtbs_check.

Should Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
reference /schemas/spi/spi-peripheral-props.yaml# with
unevaluatedProperties: false, document rdwr-gpios, convert-gpios,
busy-gpios (required for adi,ad7816 and adi,ad7817), and interrupts, and
include the required GPIOs in the example?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018101921.3642=
4-1-wrmfwv@163.com?part=3D1
