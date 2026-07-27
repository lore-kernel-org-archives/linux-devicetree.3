Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267263E2AB0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139621; cv=none; b=ASKlCwtjPwVi501xLx5t9RZigExB7CR7zLDSZWprHIGZFnGqPAzzCZk7tBv9MRsrTsy/uKogk3PhaNrfG9Leh2OR2OIOAobIZLnIlUdZgMIy1o1NA3jzYSzgDvQAtTeof3LwITVGSRXZFYxHmDZuJNEVDxzB9gP+6kFY0ii7VZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139621; c=relaxed/simple;
	bh=rG8PocnY2nMfp/k3fXR5dT3voNlO7QxmJLbJW4h19Ic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pLYTS/7RpOVn3TJhVRXsLv7wHs5P7GNQoRrYxSSzFaTrFla6y6NoxhTl+y7G5jNjqHlHJoHP8u/4kJCdNQFhxIYGhjNi1qQrGSbrIalHzfy324bO5KlKEWsvk00Cdm6fxEE8IdThhnG4GcwNDgsWLDbvUJwFKl/jC6L0TGE7B4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAvZ7dMv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAvZ7dMv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946C01F000E9;
	Mon, 27 Jul 2026 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139619;
	bh=00Q/7yZ8rlYy8vleopGVN6t1dhjtYjE2da+fxe6d7o8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bAvZ7dMvTVukvxiI+Ariud++v7xXFn/Fsl9kyjkTEssGzWKIDC5P4pjvJFBhzt4qu
	 o+LnMNB92qNoBL4UJWQQk1L+ZR2LwSBKt6gfWLWNNj4boz4kciZH0fhofG6VfAp8ot
	 2X3Dcvi/0tHKL3oLA/Y/TDcV7R8aiKm2CtE3sAlPWZhBomBSwrFzF9c9QKSjYSLGEb
	 pvvMXt4eBmtcMefampBsczLi8nZjvHnCHjiaX9KJctcsZXCOD9sME7svNJlaax47hk
	 i/AoXaOAZNr8/aCt9eB9KrPpTPVO+bQtr1odbLur93KAy8TMMJ33Al8Db3hnk0WmOC
	 o4+Wn9WmUwHFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 32/34] dt-bindings: pinctrl: airoha: add support of
 en7523 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727074234.3761170-33-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-33-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:06:59 +0000
Message-Id: <20260727080659.946C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] The binding schema is missing the 'airoha,chip-scu' phandle prop=
erty, which is explicitly parsed by the pinctrl driver.
- [Medium] The dt-binding example misleadingly presents the pinctrl node as=
 a standalone top-level device, which will cause probe failure due to a mis=
sing parent regmap.
- [Medium] The 'groups' property constraints in the 'allOf' conditionals in=
correctly use 'enum' instead of 'items: enum' for single-item arrays, which=
 will cause valid device trees to fail dt-schema validation.
- [Medium] The top-level schema incorrectly uses 'additionalProperties: fal=
se' instead of 'unevaluatedProperties: false' when including a reference to=
 'pinctrl.yaml#'.
- [Low] The example node incorrectly assigns an integer value to the boolea=
n property 'drive-open-drain'.
--

--- Patch [32]: [PATCH v7 32/34] dt-bindings: pinctrl: airoha: add support =
of en7523 pin controller ---
commit 995063565828879967b4a8fd673a347a158aa81e
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

[Severity: Medium]
Should the airoha,chip-scu property be documented here as well?

If a device tree includes the airoha,chip-scu phandle, which the driver
specifically looks for via syscon_regmap_lookup_by_phandle(), it will fail
validation because the property is completely undocumented in this schema.

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

[Severity: Medium]
Could this cause validation failures for valid device trees?

It looks like groups is constrained using enum instead of items: enum for
single-item arrays. Because device tree string-arrays are evaluated as arra=
ys,
using enum for a scalar string expectation might cause dt_binding_check to
reject legitimate configurations like pwm or pon functions. Is this same
pattern present in the other conditionals?

[ ... ]

> +    additionalProperties: false
> +
> +additionalProperties: false

[Severity: Medium]
Will this top-level directive reject standard pinctrl properties?

Since the schema includes a reference to pinctrl.yaml# in its allOf block,
using additionalProperties: false instead of unevaluatedProperties: false
might cause the schema to reject standard properties like pinctrl-0 or
pinctrl-names on the provider node.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {
> +      compatible =3D "airoha,en7523-pinctrl";

[Severity: Medium]
Would placing the pinctrl node at the top level without a parent syscon cau=
se
probe failures?

The driver relies on device_node_to_regmap(dev->parent->of_node) during pro=
be.
If users copy this example and place the pinctrl node directly under the ro=
ot
bus, it appears the driver will fail to find the parent regmap.

[ ... ]

> +      pcie1-rst-pins {
> +        conf {
> +          pins =3D "pcie_reset1";
> +          drive-open-drain =3D <1>;

[Severity: Low]
Does assigning an integer value to drive-open-drain violate the core schema?

The core pincfg-node.yaml schema expects boolean properties to be present
without an assigned value, but the <1> assignment creates an integer array.

> +        };
> +      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D32
