Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A6035E1AA
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 19:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179395; cv=none; b=qcgq0mm9YXj8t654kAdaSzmBm5AXSQ2oI7rul8gyg499pLfqUC93Q/PTIeCExpI05VTanepNMt77/bkWxdloq8QgM4KBFr+PQp0XOgIvb5L0u/x3pJdXe+GKLQm17ZMAQOf9Tx/L7RUBBbZ/Y5LLFNf9B8wJG7WYd3HB/Jz/6Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179395; c=relaxed/simple;
	bh=Y+kxM+00FqHjRicplo65txQEt1JX0latt3e05mMcUgQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bgWAzztg0D5DMdOhnX1zUcrmFjUxp0zw/D6Mx6DPUGAsJwjsrngHzWDlywosLd5XHsDm0YH9KUaoSjjRxMs8EzzW770HCS92Bv52gtdXaFtzMZLw2zLbhL7+ZdhxF6QnrKNS+ujXaCYqOtmBJOKvepssP8xxvix5YDF7UrdzF3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUODYzAC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUODYzAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6681F000C4;
	Fri, 16 Oct 2026 19:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792179393;
	bh=sIrihEv3ef1cG4fKUIRf7goYvM2RasctN99iHELqOvc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VUODYzAC6z0FZt5dNU6b6eXziTMrExyU2OIC9Y1JSeeicXSHdZ5bXoO0JREpFeBRd
	 vKG2BV/CenxubQbTtBAuY9IpWJ0UNHweZXTjTwpoxzEwkaMYWpKdYHILWLoEAThP8f
	 z0XrTHQoAAi6WUjD////DCQ9vT1rxQLJ6W+oeMXNnYitouw6PM6KaksYJDtNMlIJ3b
	 U5TnNpniG4qeIcJD7ckmsfwVLsXE9ZxTggS9wh4GQh7cp/2WUfqRRnY+3gERdAwfL3
	 Mm7ei1xW6sPedMxthIESFH39JdKPAF5MT6Zef0xmS7A5AqZmTLX1RInqJ0PzH+VW1Q
	 VjckI8IE08TNA==
Message-ID: <sashiko-outbox-174864@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: Document Analog Devices
 AD5413 single-channel DAC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bruce Tsao" <bruce.tsao@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017-ad5413-upstream-v1-1-61f40c8fef25@analog.com>
References: <20261017-ad5413-upstream-v1-0-61f40c8fef25@analog.com>
 <20261017-ad5413-upstream-v1-1-61f40c8fef25@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 19:36:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: iio: dac: adi,ad5413: missing reg property and requ=
irement
- [Medium] dt-bindings: iio: dac: adi,ad5413: invalid maintainers and spi-c=
pol schema
- [Medium] dt-bindings: iio: dac: adi,ad5413: custom boolean mode property =
duplicates standard range bindings
--

commit b9fdb51ef057c689f916309a04134bf25c49ed72
Author: Bruce Tsao <bruce.tsao@analog.com>

dt-bindings: iio: dac: Document Analog Devices AD5413 single-channel DAC

This commit documents the devicetree bindings for the Analog Devices AD5413
single-channel SPI DAC, including power supplies, reset GPIO, output mode,
and slew-rate control.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5413.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5413.yaml
> new file mode 100644
> index 0000000000000..74e869304aab9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5413.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/dac/adi,ad5413.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD5413 DAC
> +
> +description:
> +  Analog Devices AD5413 is a single-channel precision DAC supporting vol=
tage
> +  or current output modes with programmable slew-rate control.
> +  The output mode is selected via the adi,chan-current-mode property.
> +  Optional reset GPIO may be provided.
> +
> +maintainers:
> +  - bruce.tsao@analog.com
> +
> +properties:
> +  compatible:
> +    const: adi,ad5413
> +
> +  spi-max-frequency:
> +    maximum: 50000000
> +
> +  spi-cpha: true
> +
> +  spi-cpol: false

[Severity: Medium]
Will this schema pass make dt_binding_check?

In the maintainers block, the entry uses a bare email address rather than
the required Full Name <email@domain> format:

  maintainers:
    - Bruce Tsao <bruce.tsao@analog.com>

Also, in the top-level properties block, spi-cpol is set to false. In DT
schema, boolean false property schemas are only valid inside conditional
if/then/else blocks to disallow a property defined at the top level. Since
spi-cpol is not defined in spi-peripheral-props.yaml and this binding sets
unevaluatedProperties: false, should spi-cpol: false simply be omitted?

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Optional reset GPIO (active low).
> +
> +  avdd-supply:
> +    description: Analog positive supply (AVDD)
> +
> +  dvdd-supply:
> +    description: Digital positive supply (DVDD)
> +
> +  avss-supply:
> +    description: Analog negative supply (AVSS)
> +
> +  adi,chan-current-mode:
> +    type: boolean
> +    description: Select current output mode. If absent, voltage mode is =
used.

[Severity: Medium]
Should the output mode and range be described using standard IIO DAC range
properties rather than a custom adi,chan-current-mode boolean?

In drivers/iio/dac/ad5413.c, the hardware supports a 4-bit range configurat=
ion
field (AD5413_REG_DAC_CONFIG_RANGE_MSK =3D GENMASK(3, 0)) with multiple vol=
tage
and current ranges, while the driver currently hardcodes only two of them
(AD5413_RANGE_PLUSMINUS_10_5V =3D 0x3 and AD5413_RANGE_0MA_24MA =3D 0x9) ba=
sed on
this boolean.

Could this use output-range-microvolt and output-range-microamp from
Documentation/devicetree/bindings/iio/dac/dac.yaml (or adi,range-microvolt =
and
adi,range-microamp as in Documentation/devicetree/bindings/iio/dac/adi,ad57=
58.yaml)
so the binding describes the hardware capabilities rather than the current
driver limitation?

> +
> +  adi,slew-time-us:
> +    description: Output digital slew control time in microseconds
> +    minimum: 0
> +    maximum: 1000000
> +    default: 0
> +
> +required:
> +  - compatible
> +  - spi-cpha
> +  - avdd-supply
> +  - dvdd-supply
> +  - avss-supply

[Severity: Medium]
Should reg be defined with maxItems: 1 under properties and listed in
required?

The binding references /schemas/spi/spi-peripheral-props.yaml# under allOf,
which defines reg with minItems: 1 and maxItems: 256 and does not mark reg
as required. Because AD5413 is a single-chip-select SPI device and both
examples specify reg =3D <0>, omitting reg from properties and required lea=
ves
the chip-select count unconstrained and optional during DT validation.

> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        dac@0 {
> +            compatible =3D "adi,ad5413";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <1000000>;
> +            spi-cpha;
> +            reset-gpios =3D <&gpio 0 GPIO_ACTIVE_LOW>;
> +            avdd-supply =3D <&avdd>;
> +            dvdd-supply =3D <&dvdd>;
> +            avss-supply =3D <&avss>;
> +            adi,slew-time-us =3D <125>;
> +        };
> +    };
> +
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        dac@0 {
> +            compatible =3D "adi,ad5413";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <1000000>;
> +            spi-cpha;
> +            avdd-supply =3D <&avdd>;
> +            dvdd-supply =3D <&dvdd>;
> +            avss-supply =3D <&avss>;
> +
> +            adi,chan-current-mode;
> +        };
> +    };

In both examples above, could the standard properties (avdd-supply,
avss-supply, dvdd-supply, reset-gpios, spi-cpha, spi-max-frequency) be plac=
ed
in canonical natural-sort order after reg per
Documentation/devicetree/bindings/dts-coding-style.rst?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-ad5413-ups=
tream-v1-0-61f40c8fef25@analog.com?part=3D1
