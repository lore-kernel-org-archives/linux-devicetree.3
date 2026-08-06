Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99C3346E6D
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 05:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993282; cv=none; b=bd9VVxuEoRCggTTxtJ95+wbXmuODxCZBfUXf8PhYVXuW55HcBjcsd2WGT3CWeAmAkylnCL1ltSb1Lrg8RDAyfj/6A3j6htmWwTnx69xbhTjIOsD3sdsgX8MqyX5UEctFO4kbLOyGI9IppBsXqDSvuXipb8pFML1E+VJqQ6WWfhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993282; c=relaxed/simple;
	bh=W6fiLxelsG4dJVR7kD9oO1SIfm/O3D8v4/BiuyhxOkc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H5I7wG/bpUCvnezWcqJM5BWGCFCX1vbq9yF7RyYwSq/Bj25OQRgcZxE9OjG9jnqPiVFx7rWLg7XLOa0WqgDPH+KwfNH+eHqCusY1510lXGkQ0POFFf/d2MmogRu8WAtP5e7b/+//prUpI7J1F7D4dV/Mm6j2nxUVM8Xmv4VaQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgN8XUX4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgN8XUX4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549081F000E9;
	Thu,  6 Aug 2026 05:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785993280;
	bh=3JE6wBEYz7A/fQJZr6PHnWNyxDsOSYnRdGhv7lya7Iw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HgN8XUX4R2s6wesFdcueItqgpS+LzBHoqO0pN2A+/l4SsW9ffWK+Wr6y5PFOo0tYd
	 s9TViBki3T/Y2iYL8ih+a6lFyGL7tjbHAkA/wY2lb8FaELz9YdcRpSbKLNyQQFmnHx
	 XAos96WuA0/WpX6HorjXu37CSRsn0FxY6kIAJzJmHXLMEtai8/yGhCNJBA/A6/g3Ka
	 M3WIXlZTYphOnaj2TLd3XziGkdUbhdWOS9jS5wnqtjoXN1dgGGzioICGYFiYYaUb5D
	 OC0f5DyAxzhXBNNv2JP8pO2hyq1hHcfKHj4C9NW/Z400UwHWJGFkTqfIuBRKEeEx0y
	 +BC70hTsRWCvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
References: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 05:14:39 +0000
Message-Id: <20260806051440.549081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The compatible string list does not include the generic 'snps,dwc3=
' fallback required for the generic platform driver to probe.
- [Medium] The flat DWC3 controller binding fails to reference the common D=
WC3 schema and incorrectly uses `additionalProperties: false`, which explic=
itly rejects standard DWC3 and USB properties.
- [Low] The `phy-names` property uses a scalar `enum` on an array type, whi=
ch causes a JSON schema type mismatch.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: usb: dwc3: Document Renesas R-Ca=
r Gen5 DWC3 xHCI USB controller ---
commit 4cc09ce41f0476bc2f778f2624aafad6ed1dfffc
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

dt-bindings: usb: dwc3: Document Renesas R-Car Gen5 DWC3 xHCI USB controller

This commit introduces the device tree binding documentation for the Renesa=
s=20
R-Car Gen5 DWC3 USB controller. It specifies the properties required for th=
e=20
glue logic and the controller itself, using a flat binding approach.

> diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3=
.yaml b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
> new file mode 100644
> index 0000000000000..9f48f90d6df85
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,rcar-gen5-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Gen5 DWC3 xHCI USB controller
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r8a78000-dwc3
> +      - const: renesas,rcar-gen5-dwc3

[Severity: High]
Is the generic snps,dwc3 fallback required in this compatible string list?

The commit message notes this is a flat binding for the generic platform
driver, but omitting the mandatory snps,dwc3 fallback restricts the schema
to exactly these two items.

Without the generic fallback, the generic DWC3 driver in
drivers/usb/dwc3/core.c will not recognize the Renesas-specific compatible
string. This regression will cause the USB controller to silently fail to
probe when booting with this schema.

[ ... ]

> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    enum: [ usb2-phy, usb3-phy ]

[Severity: Low]
Will applying a scalar enum directly to the phy-names property cause a JSON
schema type mismatch during validation?

Because phy-names is typed as a string-array by the core device tree schema=
s,
limiting its items with a direct enum implies the array itself must identic=
ally
match one of the string elements. This type mismatch introduces a regression
leading to validation errors during dt_binding_check.

Should this be defined using items: enum: [ usb2-phy, usb3-phy ] instead?

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - interrupts
> +  - maximum-speed
> +  - phys
> +  - phy-names
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false

[Severity: Medium]
By setting additionalProperties to false without a reference to the core DW=
C3
schema, are we blocking all standard DWC3 and USB properties?

If a device tree attempts to use standard DWC3 properties like
snps,dis_u2_susphy_quirk or usb-role-switch, the schema validation phase
(dt_binding_check) will reject them because only explicitly listed properti=
es
are allowed.

Could a reference like $ref: snps,dwc3.yaml# be missing here to allow the
flat binding to accept generic properties?

> +
> +examples:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806050422.3244=
35-1-marek.vasut+renesas@mailbox.org?part=3D1
