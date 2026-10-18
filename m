Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722263AD516
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320705; cv=none; b=Pf/XpbT88APnHL44swGeEmKCfxKgNyscpf+gbXUJFLhuVla55lYQgax6sth6xG7zs2AywLYOy8aZX/8Ve9FdnTU/mYokyjySlSnEmWYuc8kQDGTRtMQLZcVKtAHYEAgsXzlKxfyHkGCaVENdcQOlEYiZxB0xMRxjq3VtKZTphUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320705; c=relaxed/simple;
	bh=KmXqbSS9ezd7fahW/LlJe1SO3R9iztBHfALROmAlfHs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gNpEZV4qi1PIBmBButDI/TDys6b+Z4KVw9hG0TsPNCFfNVjxZLjtby2Jm7qLagTyWXTShNmbDgA3LYSFUCeMS8cgOyNlzI6/Ev+MuAlhmlOYpOKRtOywkiOOS1D43l7UMGuLsEJnVMU5MkoB/9AzfTt6fU7aDBDWlaYHhgICDTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMFbDt1p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMFbDt1p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65C81F000C4;
	Sun, 18 Oct 2026 10:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792320704;
	bh=naCLQuyG6aqYpu0aDojls35pKXxFrcmCrQiHuWMn4N0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZMFbDt1pdgfGwe3h+CquID6SlLtc2/jXn/h4/XcaakgBFdhFKDO3awZtpuSalcpET
	 juUrekgWUmeiqAbx3pD4Y7n10GXUzA7vGcgU7lrtSaeeVPQqHOtZLXVC9G0mWLuqVB
	 Bk+aPvoQRDIVOlaHUJSrekFCxUA59lcdx5kPPxgg8O4bbinb/kYJ6kG1/Q73OQptVN
	 ViitMyZYYdqVQvFizs1F2pUvO/q8lrYZgRxlDsedRzbvYOu2fdsdFEqw4VOS91aptG
	 kici8vwXcYE03U35HxZSJWJbIjse1fSgSVQ3Tk/SfktSV6eOv5tRQLZtf+K9aetZl7
	 kwy0gPaCQS8sA==
Message-ID: <sashiko-outbox-176059@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: iio: adc: add documentation for
 adi,ad7816
Reply-To: sashiko-reviews@lists.linux.dev
To: wrmfwv@163.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018104358.38255-1-wrmfwv@163.com>
References: <20261018104358.38255-1-wrmfwv@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 10:51:43 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: iio: adc: missing maxItems on gpios and ad7818 busy=
 constraint
- [Medium] dt-bindings: iio: adc: missing spi-peripheral-props.yaml ref in =
adi,ad7816
- [Low] dt-bindings: iio: adc: wrong IRQ trigger type in adi,ad7816 example
--

commit 172592494e92c865cd70820f7a6919506c5b2b75
Author: Tenglong Guo <admin@micronull.cn>

dt-bindings: iio: adc: add documentation for adi,ad7816

This commit adds a devicetree YAML binding schema for the Analog Devices
AD7816, AD7817, and AD7818 SPI ADC family.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> new file mode 100644
> index 0000000000000..d23ef9163e61e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/adi,ad7816.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD7816/AD7817/AD7818 ADC
> +
> +maintainers:
> +  - Tenglong Guo <admin@micronull.cn>
> +
> +description: |
> +  The AD7816/AD7817/AD7818 are 10-bit ADCs with on-chip temperature sens=
ors.
> +  They use a SPI interface for communication.
> +
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
> +  rdwr-gpios:
> +    description: GPIO connected to the RD/WR pin.
> +
> +  convert-gpios:
> +    description: GPIO connected to the CONVST pin.
> +
> +  busy-gpios:
> +    description: GPIO connected to the BUSY pin. Required for AD7816 and=
 AD7817.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Optional interrupt for over-temperature indication.
> +
> +required:
> +  - compatible
> +  - reg
> +  - rdwr-gpios
> +  - convert-gpios
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,ad7816
> +              - adi,ad7817
> +    then:
> +      required:
> +        - busy-gpios

[Severity: Medium]
Should rdwr-gpios, convert-gpios, and busy-gpios specify maxItems: 1, and
should the allOf conditional block disallow busy-gpios on adi,ad7818?

In drivers/staging/iio/adc/ad7816.c, ad7816_probe() requests a single GPIO
descriptor for each line and only requests busy on AD7816 and AD7817:

drivers/staging/iio/adc/ad7816.c:ad7816_probe() {
	...
	chip->rdwr_pin =3D devm_gpiod_get(&spi_dev->dev, "rdwr", GPIOD_OUT_HIGH);
	...
	chip->convert_pin =3D devm_gpiod_get(&spi_dev->dev, "convert",
					   GPIOD_OUT_HIGH);
	...
	if (chip->id =3D=3D ID_AD7816 || chip->id =3D=3D ID_AD7817) {
		chip->busy_pin =3D devm_gpiod_get(&spi_dev->dev, "busy",
						GPIOD_IN);
	...
}

Without maxItems: 1 on rdwr-gpios, convert-gpios, and busy-gpios,
dt_binding_check fails meta-schema validation against meta-schemas/gpios.ya=
ml.
Also, because the 8-pin AD7818 does not have a physical BUSY pin, adding an
else branch setting busy-gpios: false would prevent dtbs_check from accepti=
ng
busy-gpios on adi,ad7818 nodes.

> +
> +additionalProperties: false

[Severity: Medium]
Since the AD7816 family are SPI peripherals, does this binding need to
reference /schemas/spi/spi-peripheral-props.yaml# in allOf and use
unevaluatedProperties: false instead of additionalProperties: false?

Without referencing spi-peripheral-props.yaml# and switching to
unevaluatedProperties: false, device tree nodes using standard SPI properti=
es
such as spi-max-frequency or spi-cpol will fail dtbs_check validation.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        adc@0 {
> +            compatible =3D "adi,ad7816";
> +            reg =3D <0>;
> +            rdwr-gpios =3D <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +            convert-gpios =3D <&gpio0 2 GPIO_ACTIVE_HIGH>;
> +            busy-gpios =3D <&gpio0 3 GPIO_ACTIVE_HIGH>;
> +            interrupts-extended =3D <&gpio0 4 IRQ_TYPE_EDGE_FALLING>;

[Severity: Low]
Should the example use IRQ_TYPE_LEVEL_LOW instead of IRQ_TYPE_EDGE_FALLING?

The Over-Temperature Indicator (OTI) output is active-low level, and
ad7816_probe() in drivers/staging/iio/adc/ad7816.c explicitly requests a
low-level trigger:

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
	...
}

> +        };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018104358.3825=
5-1-wrmfwv@163.com?part=3D1
