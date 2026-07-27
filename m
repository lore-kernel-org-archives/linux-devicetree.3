Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB4380FD4
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176426; cv=none; b=j+Xqhk6wg/HdCnXQQ5OkNzK1ST2wZybGR1G1ZAzyg9D2hyQdRk7wow8ZQF8Qticmwf/Myhd3kBEi8inV6sMsiZM6+4F2wejpyIAYb/nPZ/OvIZM6I30m7KcSBBQGig5cJJMF41TBWlUpvSxnxQhQMUGoBvQce9mYgdNKCr28Y3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176426; c=relaxed/simple;
	bh=HCj+zF4G/91sFC18a4wy+ufZ2tUq30AdNVR8AmC+2SQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bVQkXoQCP2+RHSQh8tUJ0V6iFGpSLA0yd3HK6990RVc7WmOcdf7+bcH4iNK40FNPyH+6CoZn6EXRh5vnmVptc0dLJCaEn2wa9UATNnWUEAD2adHqxEzgcuDpo9YcT50keo3Cd+0MBAQahv+k2NgxYKWvHLDj1tu0wBCPNlPST8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lt7DXQBU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lt7DXQBU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C566C1F000E9;
	Mon, 27 Jul 2026 18:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785176425;
	bh=AyfcrHPQZNPcbwctAJ4wga2aYXMXrg9gtSKxMNBSSTc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lt7DXQBUlSKPLct0UFVcQ3tAxDVvUqYGP8rsL5eCYLhFtvCZJbAb+R5iQbjWOZHc2
	 lPegAb5QzKRbsxIvfc4Pae0446H2veh9heKV5x/kmsnV1oPyAATbYisajU2r49f1KA
	 mq6OoAoZQDBtNDlwNpXsCX9DxgiOTmRP0XkcHXG5WY1jlio5qD0GizTQHW+GfK689/
	 jHNwXz2Yr2DH5lHEeB3FkzCkQFXfrbaS2zThEiYunY5CQU6jKX3LISiICCmzGgssKx
	 5qf4kTXQv+kB8TSowmydWGGeQGppU4X1AF0pbpE+HkZh4uAzUW9zf8TNlUHkaTDt2N
	 8Hn2E4eWCgosQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 33/35] dt-bindings: pinctrl: airoha: add support of
 en7523 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727174141.664933-34-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-34-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:20:24 +0000
Message-Id: <20260727182024.C566C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The `gpio-ranges` property is functionally required by the driver =
but is missing from the `required` list in the binding schema.
- [Medium] The `groups` property incorrectly uses `enum` instead of `items:=
 { enum: ... }` for multi-pin functions like `pwm`, `pon`, `mdio`, and `phy=
*_led*`.
- [Medium] The `airoha,chip-scu` phandle property is utilized by the driver=
 code but is not documented in the schema.
- [Medium] The schema uses `additionalProperties: false` while also importi=
ng standard definitions via `$ref: pinctrl.yaml#`.
- [Low] The 'drive-strength' description erroneously uses Xilinx 'MIO' term=
inology.
- [Low] The example uses a deprecated integer syntax for the 'drive-open-dr=
ain' boolean property.
--

--- Patch [33]: [PATCH v8 33/35] dt-bindings: pinctrl: airoha: add support =
of en7523 pin controller ---
commit 4bab62ab4565097d36cb334e8d39b5c03b4424c9
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: add support of en7523 pin controller

This patch adds device tree binding schema for Airoha EN7523 SoC pin
controller.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.=
yaml
> new file mode 100644
> index 0000000000000..db8e39af1a152
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
> @@ -0,0 +1,375 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/airoha,en7523-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha EN7523 Pin Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +
> +description:
> +  The Airoha's EN7523 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: airoha,en7523-pinctrl
> +
> +  interrupts:
> +    maxItems: 1

[Severity: Medium]
Should the airoha,chip-scu phandle property be documented in this schema?

The driver code in airoha_pinctrl_probe() appears to resolve a system
controller regmap using syscon_regmap_lookup_by_phandle() with this propert=
y.
Since additionalProperties is set to false, would users who provide this
optional phandle encounter a schema validation error?

[ ... ]

> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"

[Severity: High]
Does this list need to require the gpio-ranges property?

The driver's airoha_convert_pin_to_reg_offset() relies on
pinctrl_find_gpio_range_from_pin_nolock(). If gpio-ranges is omitted in the
device tree, wouldn't this cause internal callbacks like
airoha_pinmux_set_direction() to fail unconditionally with -EINVAL, even
though the schema validation would pass?

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

[ ... ]

> +          - if:
> +              properties:
> +                function:
> +                  const: pwm
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> +                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gp=
io13,
> +                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> +                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> +                         gpio26, gpio27, gpio28, gpio29]

[Severity: Medium]
Should the groups constraints for pon, pwm, mdio, and phy*_led* functions
be defined using items: { enum: [...] } instead of directly using enum?

The groups property implicitly inherits string-array from pinmux-node.yaml.
Applying enum directly to an array requires the entire array instance to
equal one of the literal string values, which will always evaluate to false.

Using items: { enum: [...] } (as is done for uart and spi) would correctly
validate the elements of the array and allow valid device trees to multiplex
multiple pin groups in a single node.

[ ... ]

> +          drive-strength:
> +            description:
> +              Selects the drive strength for MIO pins, in mA.
> +            enum: [2, 4, 6, 8]

[Severity: Low]
Is the reference to "MIO pins" accurate for this SoC?

This terminology is typically associated with Xilinx ZynqMP bindings, while
the Airoha EN7523 uses standard GPIO pins.

[ ... ]

> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:

[Severity: Medium]
Should this use unevaluatedProperties: false instead?

Since this schema imports standard properties via allOf: - $ref: pinctrl.ya=
ml#,
using additionalProperties: false will improperly reject standard properties
like pinctrl-0 or pinctrl-names if they are used on this device node.

> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {
> +      compatible =3D "airoha,en7523-pinctrl";
> +
> +      interrupt-parent =3D <&gic>;
> +      interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      gpio-controller;
> +      #gpio-cells =3D <2>;
> +
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +
> +      pcie1-rst-pins {
> +        conf {
> +          pins =3D "pcie_reset1";
> +          drive-open-drain =3D <1>;
> +        };
> +      };

[Severity: Low]
Is it possible to use the modern boolean syntax for drive-open-drain here?

The core pincfg-node.yaml schema marks the integer assignment form as
deprecated, preferring just the boolean property form (drive-open-drain;) to
avoid dt_binding_check validation warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D33
