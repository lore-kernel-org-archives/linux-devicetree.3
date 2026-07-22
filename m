Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F92248B4
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724256; cv=none; b=k8cGsHxcMWc3G+JoqCM3Mv4ANlXnnPh3D2Vz09OSL9yukej8Rf6LhCEEbrtolEC/exQKDK1yLc5x2YFw2FSx+uGgLCXi9VTykP9H9BBqXCq2vuaxQdr3w9GATJ8K0fFgnLr4ZycdD8L20ta0LDY943bTqEA8xebyku5Jlx2X02U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724256; c=relaxed/simple;
	bh=q8wDs9eYdcTa3J8XKxkzJoluCgJFooaK5nyoC6e8Hxk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZCeYu2pTctJJjCP0eAWKrNfIjW7Z+f+4qp27zRTgdJBVt0AO52AvkGqO4v4buhqzuQmO9cy2pWWRnGi/ayrEaQNTdwPP3wnVD7h2ESxQ+N3QNOxTLxXPRYX91g2C4okl5HNCwgRRBlj4y9FpmNF2Z5jmdv8SvxXR442ggca8C7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0ahKPYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0ahKPYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DD11F000E9;
	Wed, 22 Jul 2026 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784724255;
	bh=FVmjafi3jAqDqAfuQm0li92ZWFvK0ZXGQwxz68VWTLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C0ahKPYzG5DD1QoTNTmRWzdbyv1LZoBU28SfsMUs7FpcRXku/WvxABNmUVIESsmST
	 YqHI7XifseOytI2Tv5YGXN+EbBgMya5re+tTAF1IutKpx6vGvN+fwYhzKAZH9sll4n
	 KcjuxDWH7USjFMPrZIYKyGaGj1fGJozunEXo4Pr/y6m0BqWkpNiwHkgccfAGL6yIaq
	 yMs044GOqUkuRknw9W+qi7SZOaDN5WjsdVzJGHqMS3HP0RPxpU/ulx9pPRi6zniYfa
	 5Bchw+aaKhNJp4Ybgj/0SkUVQm9fNKS7YFqXSkO/tREsPJuhbxwxmXKZC43yApn6i1
	 TjrHWdp8piJMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722123243.341346-1-challauday369@gmail.com>
References: <20260722123243.341346-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 12:44:14 +0000
Message-Id: <20260722124415.63DD11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The top-level `additionalProperties` logic using `oneOf` silently =
accepts undefined non-object properties and breaks validation for standard =
container nodes due to injected `phandle` properties.
- [Medium] The `$defs/pin-node` definition bypasses all type and constraint=
 checking for standard pin configuration properties because it fails to ref=
erence `pincfg-node.yaml`.
- [Low] The removal of `#address-cells` and `#size-cells` from the schema c=
reates a mismatch with the existing `pic32mzda.dtsi`, which will cause `dtb=
s_check` warnings.
--

--- Patch [1]: [PATCH v4] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl=
: Convert to DT schema ---
commit 238b9bfa23edd44c05fbb35e962f0ab9f0bb9f25
Author: Udaya Kiran Challa <challauday369@gmail.com>
Date:   Wed Jul 22 12:32:43 2026 +0000

dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema
   =20
This commit converts the Microchip PIC32 Pin Controller devicetree binding
from legacy text format to DT schema. It consolidates pin-node properties a=
nd
updates the schema layout to support nested or direct pin configurations.

Link to v3: https://lore.kernel.org/all/20260719183431.124061-1-challauday3=
69@gmail.com/
Link to v2: https://lore.kernel.org/all/20260707144223.120417-1-challauday3=
69@gmail.com/
Link to v1: https://lore.kernel.org/all/20260705132521.159522-1-challauday3=
69@gmail.com/

> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzd=
a-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic32m=
zda-pinctrl.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinct=
rl.yaml
> @@ -0,0 +1,107 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: microchip,pic32mzda-pinctrl
> +
> +  reg:
> +    maxItems: 1

[Severity: Low]
Even though the changelog mentions removing #address-cells and #size-cells
from the schema, aren't these properties still present in the
pinctrl@1f801400 node in arch/mips/boot/dts/pic32/pic32mzda.dtsi?=20

Will their removal from the schema cause dtbs_check warnings for the
existing in-tree device tree?

> +
> +  clocks:
> +    maxItems: 1
> +
> +$defs:
> +  pin-node:
> +    type: object
> +    $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +    properties:
> +      pins:
> +        description: List of pins to which the configuration applies.
> +        items:
> +          type: string
> +        minItems: 1
> +
> +      function: true
> +
> +      bias-pull-up: true
> +      bias-pull-down: true
> +      input-enable: true
> +      output-low: true
> +      output-high: true

[Severity: Medium]
Does this bypass type and constraint checking for the generic pin
configuration properties?

By assigning these generic properties to true without also including a
$ref: /schemas/pinctrl/pincfg-node.yaml#, it looks like the schema
validator might silently accept any value or type for them, missing
mutually exclusive constraints like having both output-low and
output-high present.

> +
> +      microchip,digital:
> +        description: Enable digital I/O.
> +        type: boolean
> +
[ ... ]
> +    required:
> +      - pins
> +
> +    unevaluatedProperties: false
> +
> +additionalProperties:
> +  oneOf:
> +    - additionalProperties:
> +        $ref: '#/$defs/pin-node'
> +    - $ref: '#/$defs/pin-node'

[Severity: High]
Will this oneOf construct silently accept undefined scalar properties?

Because the first branch lacks a type: object constraint, a typoed
scalar property might trivially pass the first branch and satisfy the
oneOf.

Also, for valid child container nodes referenced via a phandle, the
devicetree compiler automatically injects a phandle property. Since
that injected phandle is not an object, won't it fail the $ref type
check here and cause spurious dtbs_check errors for perfectly valid
hardware configurations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722123243.3413=
46-1-challauday369@gmail.com?part=3D1
