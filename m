Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108223BE62B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139822; cv=none; b=RJZPTFtHBIDe1VVLJ2yHTN4MgV9D8GGHqTeUhdcg/D6cb8SJkhu1JDDJki+k/iwaI3rXalVRgm0NSxZVPc3fk4sdql6lJLpLwCMOQ093b5dEZUpq2GKW/gwzYRsTu0YXJkbrAzyYnBIFcTihS9Yx+AQDvjNnxSWxiIkL7iKo+Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139822; c=relaxed/simple;
	bh=J2vJKImmCQuwOaSlcgettivEjwvA8+fZtkY8Eevf1tg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ytndpn3RvsqM0MIkgvVgHsDKcn23uinzphImU44EJwdnY9I261sLV7ZCirFOGvBC60X5D3tITpLGUN+Ls1Es02OafGgyRcm8+UbGgLhCHOQVakTyBNDas9JP+tvN1qmUW1s5Kv2dK3kXvI2W1fT/gXLYdUK7JYiNeMV7sNCSDZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IagC3zX+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IagC3zX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9F51F000E9;
	Mon, 27 Jul 2026 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139819;
	bh=f1VA74y1ACjiFcLZO5nbQtYhc9yiL+GiGNedU9KxaCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IagC3zX+ReywA+2VD6GYoeqJb/+qMPlLF2t3C6v5gBR5J4ePwVmX/0v/LQh6zlKHi
	 2E35YrBq2yyT3e2noK5+AZl6Dm6syhL0aphYhlolasftduErdW8TrE4ygrUiU9kSkg
	 VppHUPHiOSQxemKJMmjYfI7xiryAiJqB7nvAtwrzhx3mr7ThfBPOA1/m3TfvFqloyV
	 fMRPaDLJiCS5gtNW9Qrn4/3Ibr0kTEw03i0/IOqkAfFli6BDzScErLXZCe8WUDhVr5
	 m25yYnX0sqM9fvyQzW9DW0m9uU7jhkA0XSN34++4r/bNj0CURI7EY7APf0CGwdStXW
	 vnKSapbqMES/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 34/34] dt-bindings: pinctrl: airoha: add support of
 an7563 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727074234.3761170-35-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-35-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:10:18 +0000
Message-Id: <20260727081019.6C9F51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The binding lacks a parent syscon relationship or `reg` property=
, and omits the required `airoha,chip-scu` phandle property.
- [Low] Invalid and deprecated integer value assignment to the boolean prop=
erty `drive-open-drain` in the device tree example.
- [Low] Incorrect JSON Schema array constraints for the `groups` property i=
n most multiplexing conditional blocks.
--

--- Patch [34]: [PATCH v7 34/34] dt-bindings: pinctrl: airoha: add support =
of an7563 pin controller ---
commit fedf510207cace3632698b52e7e3162470e8e08a
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: add support of an7563 pin controller

This patch adds device tree binding schema for Airoha AN7563 SoC pin
controller.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.=
yaml
> new file mode 100644
> index 0000000000000..e626d34661285
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
> @@ -0,0 +1,348 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/airoha,an7563-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7563 Pin Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +
> +description:
> +  The Airoha's AN7563 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7563-pinctrl

[Severity: Medium]
Does the schema need to document the parent-child syscon requirement and the
airoha,chip-scu property?

The driver relies on device_node_to_regmap(dev->parent->of_node), meaning
the pin controller node needs to be instantiated as a child of a syscon
node.

It also expects an airoha,chip-scu phandle property in the pin
controller node. Both the schema definition and the example omit these
requirements.

> [ ... ]
> +        allOf:
> +          - if:
> +              properties:
> +                function:
> +                  const: pon
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pon]
> +          - if:
> +              properties:
> +                function:
> +                  const: sipo
> +            then:
> +              properties:
> +                groups:
> +                  enum: [sipo, sipo_rclk]

[Severity: Low]
Is this enum constraint structurally correct for the array?

Since groups is defined as a string-array via
/schemas/pinctrl/pinmux-node.yaml, applying the enum constraint directly to
the array instance means the entire array object must equal one of those
scalar strings, which will fail schema validation.

Should this use the items keyword to restrict the array elements, similar to
how it was done for the uart and spi functions? For example:
  items:
    enum: [sipo, sipo_rclk]

> [ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {
> +      compatible =3D "airoha,an7563-pinctrl";

[Severity: Medium]
Will this example node fail to probe if developers use it as a template?

As mentioned above, the driver expects this node to be a child of a syscon
node, but the example shows it as a standalone top-level node.

If developers use this as a top-level node, device_node_to_regmap() will fa=
il
and the driver will abort probing.

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

[Severity: Low]
Is it intentional to assign an integer value to drive-open-drain?

The core pincfg-node.yaml schema defines drive-open-drain as a boolean
property, which should be declared merely by its presence (i.e.,
drive-open-drain;).

Assigning it a value of <1> violates the schema and causes dt_binding_check
to throw a type error.

> +        };
> +      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D34
