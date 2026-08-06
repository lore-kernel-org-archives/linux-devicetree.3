Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2C842B746
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055655; cv=none; b=FQhKgBSLqLfMUu4SW+Kki2R+0xIfr0CNBf9jSWErKQsDIgjtlYac+bgccEMfWFsujvlCDoJhesqBNuGvedP7P8g4t8mXpvfUQ8AD5+lsn8mOr3oCCBO5GPIYJhlGrFlhF1wHrW7I7mQ/kLC6fOYwAklInOdNF11WLXDYITaB3gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055655; c=relaxed/simple;
	bh=87lNsvfjJHS0SrWBpILjjY31pVz+ZHZxZ0HVh4HKD54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fUtAlpMFzvEbBrDwDNF/1abixOjRA8zsts7WtcbpRIou510RK7VmT9xw9NSJbrlwYlo+0xLzySYo0npE6kqMY8AezOpmTLxOqeZZDgGEvU5EZw4K/phzj+CrvZdqz/8ETlOVEBn6dVZD9XG4bUDRwBnPUBS2SUnLPLoEx0qF/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWb/cAzX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWb/cAzX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297F01F00A3A;
	Thu,  6 Aug 2026 22:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055651;
	bh=uvcwYkGjYacADPgB/rt3CVNKS7Sy8vvByYoexBkkt7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GWb/cAzXWRxtRvqmy8e+dlDPblv1eOon6c0cTXjK93tGupkjT84yGOOSrznwZh2oT
	 mguBZyw8g1aXjWQ/xWKSrvndxfQnRx/5lrh5HC+x9qr/EPBYadcXUZ3gcyZFrWOsPO
	 xAIPKmvVmBDaUpyJc57u4x8jclSxkMwSlNLsuTitj8WkjRZUX0xS8e0dD8UHwFVr70
	 VZt6zTckZ9yprUiBGd+JfWkDJI94+jcOsyznx5oyJjNyETzFu+Jm7jXVeJGC5Vq8Ye
	 KVmxVx5hFJFHKg+QzMkB4wHYrZW1sh4pzM/WoUXfMTUAR2uO8pK45Tbiva9gMLQxtX
	 j8UC20q8CKaFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 33/37] dt-bindings: pinctrl: airoha: add support of
 en7523 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806220615.4078303-34-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-34-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:34:10 +0000
Message-Id: <20260806223411.297F01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] Invalid use of scalar `enum` constraints on the `groups` string-=
array property.
- [Medium] Missing `reg` property or `syscon` phandle for a memory-mapped h=
ardware block.
- [Medium] The `gpio` function groups suspiciously omit `gpio0` through `gp=
io27`.
- [Medium] The `pins` property enum in the `conf` node is missing `gpio28` =
and `gpio29`.
- [Low] Use of a deprecated legacy property format for a boolean property i=
n the example.
--

--- Patch [33]: [PATCH v11 33/37] dt-bindings: pinctrl: airoha: add support=
 of en7523 pin controller ---
commit 0f787c98b7d55d5b83a2bca3f277b8fb38b7b78e
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: add support of en7523 pin controller
   =20
Introduce device tree binding schema for Airoha EN7523 SoC pin controller.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.=
yaml
> new file mode 100644
> index 0000000000000..599f80e94432b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
> @@ -0,0 +1,378 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/airoha,en7523-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[ ... ]

> +        allOf:
> +          - if:
> +              properties:
> +                function:
> +                  const: pon
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pon]

[Severity: Medium]
Will this fail schema validation? The groups property is defined as a
string-array in the core pinmux-node.yaml. Because the parsed instance is a
list, applying a scalar enum constraint directly to the array property will
cause validation to fail.

Should this use the items keyword to constrain the array elements? For
example:

                groups:
                  items:
                    enum: [pon]

This pattern repeats for most functions in this allOf block.

[ ... ]

> +          - if:
> +              properties:
> +                function:
> +                  const: gpio
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio28, gpio29]

[Severity: Medium]
Is it intentional to omit gpio0 through gpio27 here?

Because these pins can be muxed to alternative functions like pwm or phy
leds, device trees typically need to be able to explicitly mux them back
to their standard gpio roles.

[ ... ]

> +      '^conf(-|$)':
> +        type: object
> +
> +        description:
> +          pinconf configuration nodes.
> +
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pins:
> +            description:
> +              An array of strings. Each string contains the name of a pi=
n.
> +            items:
> +              enum: [i2c_sda, i2c_scl, spi_cs0, spi_clk, spi_mosi, spi_m=
iso,
> +                     uart1_txd, uart1_rxd, gpio0, gpio1, gpio2, gpio3, g=
pio4,
> +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, =
gpio12,
> +                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpi=
o19,
> +                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpi=
o26,
> +                     gpio27, pcie_reset0, pcie_reset1]
> +            minItems: 1
> +            maxItems: 38

[Severity: Medium]
Does this pins enum artificially restrict pinconf properties for gpio28
and gpio29?

The gpio function block above requires these groups, meaning they physically
exist on the hardware, but they are omitted from this list and any attempt
to configure them will be rejected.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {
> +      compatible =3D "airoha,en7523-pinctrl";
> +
> +      interrupt-parent =3D <&gic>;

[Severity: Medium]
Is the example missing a parent syscon node or a reg property?

The Airoha pinctrl driver relies on device_node_to_regmap() on the parent
of_node to access registers. This requires the pin controller to be
instantiated as a child of a syscon or MFD device.

The schema does not document this parent constraint, and this example
defines a standalone top-level node that will fail to probe.

> +      interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;

[ ... ]

> +      pcie1-rst-pins {
> +        conf {
> +          pins =3D "pcie_reset1";
> +          drive-open-drain =3D <1>;

[Severity: Low]
Should this be an empty flag instead of assigning an integer value?

The generic pincfg-node.yaml defines drive-open-drain as a boolean
property, so this assignment violates the boolean type constraint and
will fail validation during dt_binding_check.

> +        };
> +      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D33
