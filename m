Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0F1351C2F
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780166315; cv=none; b=GSt4k3WdhJWqw9hhmGnZOhWnXx48+5ybFL8HxvsCg0rxGwU7iq1sYg9jCqr3JKNEX9jqSCBu1W5Yn9K5eCeFO7yGteb7vYvAgQAZWSQOM9eITVCY3ASucwx4MAFE7YKjghtgZfDNlv3OjvRhJFXN5dP5QLQxa7DJvJQjJEZNSr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780166315; c=relaxed/simple;
	bh=RiY49/SBP/RtR2jfcP3p+3H3wzSVxIbUYzTfhULQMIw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nTgrz2E9NouzDUl0tAnAEZHTxWB0WqAEwkW781cx5NPTDUUjnY9Ixg+dn9iy34jzopZ37cKh9Poy9SVYerQtrCJhsH0HsBceWV6Yj0Q3ceM3UtwO0vo6NSIIgGHosbH6fK3ysIy3u6Om/uvBgSNRMP38VcMQ/8l1p/CqQAnFXww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQoSz5QT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQoSz5QT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161CD1F00898;
	Sat, 30 May 2026 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780166314;
	bh=yzZWhDeNU0sUJkj64pPxWiNq2iVJ79RI5nZDibjp558=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kQoSz5QT3vuSryF6HTYnzcED6kDTqxO0z8de+MUVGQ0gwp9H65JYv+CisHQGfN6G+
	 yG7QzicfHP0UMZhxl7ekV15T9vIRwsMvzcbOx3yE8SpYg365acDR906DDAFPDAzXJy
	 OvoogmLAMQGbMnVSohEeMWTWDhOiO8fdrOrJ65uouLpAka6jFGSC9vcLHA9FS2t4cx
	 iq29AKB+ve2X8v2FawqfZCtq3zxj92F5nA7cnYeP93K9ywYRNt6lgUa6hgGg1vr4kX
	 oOk9emD8UwxUxtNNty6f++FrLFKFOPe1Ok83sv/dWzfVTeS5sbvL/XHhtLWGrkA243
	 UfmpVH4ZWiV+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] spi: dt-bindings: describe SA8255p
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-1-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-1-17574601bd63@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 18:38:33 +0000
Message-Id: <20260530183834.161CD1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unchecked `device_get_match_data()` return value causes a NULL poi=
nter dereference if bound manually.
- [Medium] The DT binding example provides `dmas` but omits the strictly re=
quired `dma-names` property, and the schema lacks structural dependencies f=
or it.
- [Medium] The `qcom,sa8255p-geni-spi` binding strictly requires a single `=
compatible` string, rejecting the valid `sa8797p` fallback array.
--

commit a89af5cc4b98b3af1b2a30423bbe32d7faf13e17
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: dt-bindings: describe SA8255p

Add DT bindings for the QUP GENI SPI controller on sa8255p platform.
SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocols are
utilized to request resource configurations.

> diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.=
yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
> new file mode 100644
> index 0000000000000..8c6825b8ddb41
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/qcom,sa8255p-geni-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GENI based Qualcomm Universal Peripheral (QUP) Serial Peripheral =
Interface (SPI)
> +
> +maintainers:
> +  - Praveen Talari <praveen.talari@oss.qualcomm.com>
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-geni-spi

[Severity: Medium]
Will this strict constraint reject the qcom,sa8797p-geni-spi fallback array?

The parent QUP wrapper binding (qcom,sa8255p-geni-se-qup.yaml) explicitly
defines SPI child nodes matching "spi@[0-9a-f]+$" to have:
compatible: oneOf: - const: qcom,sa8255p-geni-spi - items: - const: qcom,sa=
8797p-geni-spi - const: qcom,sa8255p-geni-spi

When a device tree node for the sa8797p variant provides the multi-string
fallback array, dtbs_check will fail validation because the array does not
match this strict const constraint. Should this be updated to use a oneOf
block containing the fallback array?

[ ... ]

> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx

[Severity: Medium]
Should there be a dependencies constraint here to enforce dma-names when
dmas is provided?

Without a constraint like dependencies: dmas: [ dma-names ], it is possible
to configure dmas without dma-names. Since the driver requires channels by
name, missing dma-names could cause issues that structural enforcement
would prevent.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/dma/qcom-gpi.h>
> +
> +    spi@888000 {
> +        compatible =3D "qcom,sa8255p-geni-spi";
> +        reg =3D <0x888000 0x4000>;
> +        interrupts =3D <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas =3D <&gpi_dma0 0 0 QCOM_GPI_SPI>,
> +               <&gpi_dma0 1 0 QCOM_GPI_SPI>;
> +        power-domains =3D <&scmi0_pd 0>, <&scmi0_dvfs 0>;
> +        power-domain-names =3D "power", "perf";
> +    };

[Severity: Medium]
Is the dma-names property missing from this example?

The spi-geni-qcom.c driver requires DMA channels by name and acquires them
using dma_request_chan(dev, "tx") and dma_request_chan(dev, "rx"). Because
the example configures dmas but omits the dma-names array entirely,
developers copying this as a reference might silently fail to initialize
DMA and fall back to PIO mode.


Additionally, regarding a later commit in this series ("spi: qcom-geni:
Enable SPI on SA8255p Qualcomm platforms"):

[Severity: High]
Does spi_geni_probe() safely handle a manual bind?

If the device is bound manually via sysfs (bind) or uses driver_override
without a matched OF/ACPI node, device_get_match_data() returns NULL.

The function sets:
mas->dev_data =3D device_get_match_data(&pdev->dev);

Followed immediately by a dereference:
ret =3D mas->dev_data->resources_init(&mas->se);

Will this result in a NULL pointer dereference panic under those conditions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530-enable-spi=
-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com?part=3D1
