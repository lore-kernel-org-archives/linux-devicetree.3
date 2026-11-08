Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166843;
	b=GgCfr8v5GhZkzfIY8IVw3m4Uwp5mjKXK0jVqkMrrF5eqIueOudcRab/VChiUqcIwZ5VA
	 /XkSP97BaGKUaxb3ky4T6zNNzPVcMJGYd72wHqCg2uqN83bJmaYHrU4rdcLPhOYQupl8G
	 EsjCodvaZ0w5ZGQmrpGdh+CIPfLdqm1FMHmAnKiHJj19HTFxs755BFOXPbrj2yDobU67v
	 /LnYmLtG112DTknIs4NI2GR36qZ7y5Aiwyk59kv7EIKz0Tv1HuLE4+vAvUyz2IZOgEpZZ
	 khMbhcPG8Lnx5SvXzLqRSNRRH1K0ezrCLdsl99fNAyekQhK2ScoZnT8IB+ZdtjMAjMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166843;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aIh1Z1lavvEJmqjJ1YbPbeWLzAgydDDZDJQrrhxt1MI=;
	b=Vgm3DkzUkmmQotYNMYMzXn58GVsFBAoC44ezF1nfVKCw3LwxaFo/PX0mqm/pFyWQY39Y
	 5XRuReBlib8IwTexVidDgSK7gf/4pG7T4D8rYI2fYepqPzuUPESAJxfRZSVSZBT0T3tai
	 vPGlIs1UWr8WdkpxtlVazdZ2NY8KJd+ugEQtVO4Blq/zb+PyGr/lqI7v4+tiO0oFAau/m
	 opEUav0YlmZyW3qXB24JJ/8WgMeinBoKxqAkVVfGEMlwSIT0dUWiUEiZhMCcC1/aJ5Lcy
	 UDeWuPrYHBK8wmlXINZE0dtbA9zCqLTyXn80gLlv6BkjpudW4huknw6+0JVGxCo88ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAgnKi2o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD4606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAgnKi2o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0368C1F0089F;
	Sun,  8 Nov 2026 19:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794166842;
	bh=aIh1Z1lavvEJmqjJ1YbPbeWLzAgydDDZDJQrrhxt1MI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KAgnKi2oBw9vFSIF8EsFl+q7cvNFo9xuw/4J9+yPELJe6tVDe8afAR7svBAY80zN/
	 7OVTXTJgJHqcZpw+YwVcuSqD7rfSdDIVGdSPx8pOsp9sZytHJ08DZjt09gvb8tMXZV
	 va+o48LQ+HaxGzw9D5qn7tn3QH04mBIL9iKkLJQY+AGHtI5V07VFnUlJvE7AfFU9gi
	 uzkxeW+jROrhxp8+Fw5MTlf6YZ8q055i3FCHXDFRrDvPierAZlg+dkpIwXEgeEv8tL
	 5y0txQNsMJ5aDSp1r8ILxuWT+2SpcdqAg8d2uMEDW8i/Z05FY5ucdxDaffyY5jYb1/
	 mQbfK0jARhjzw==
Message-ID: <sashiko-outbox-203987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: omap-l3-noc: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-ti-l3-noc-v2-2-509e8485a1f3@gmail.com>
References: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
 <20261109-ti-l3-noc-v2-2-509e8485a1f3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 19:40:41 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] dt-bindings: bus: ti,omap-l3-noc: split omap3-l3-smx into
  separate schema
- [Low] dt-bindings: bus: ti,omap-l3-noc: restrict ti,dra7-l3-noc reg to
  2 items
- [Low] dt-bindings: bus: ti,omap-l3-noc: fix property ordering in
  schema and example
--

commit 4bcc6989fce18ef0d819b57aac84df28a2100f89
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: arm: omap-l3-noc: Convert to DT schema

This commit converts the TI OMAP L3 Network On Chip (NoC) binding from text
to YAML DT schema format and moves it to Documentation/devicetree/bindings/=
bus/.

> diff --git a/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml b/=
Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml
> new file mode 100644
> index 0000000000000..7dab336347b2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml

[ ... ]

> +  ti,hwmods:
> +    description: hwmod names for each NoC domain.
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    deprecated: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,omap3-l3-smx
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        ti,hwmods:
> +          maxItems: 1
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,omap4-l3-noc
> +              - ti,omap5-l3-noc
> +    then:
> +      properties:
> +        reg:
> +          minItems: 3
> +        "#address-cells": false
> +        "#size-cells": false
> +        ranges: false
> +      patternProperties:
> +        "^.*@[0-9a-f]+$": false

[Severity: Low]
Should ti,omap3-l3-smx be split into a separate binding schema rather than
combined with the Arteris NoC variants?

On OMAP3, the SonicsMX interconnect (handled by drivers/bus/omap_l3_smx.c) =
is
modeled as a simple-bus parent node requiring #address-cells, #size-cells,
ranges, child device nodes, a single reg entry, and the legacy ti,hwmods
property.  The OMAP4/5, DRA7, and AM4372 NoC nodes (handled by
drivers/bus/omap_l3_noc.c) are leaf device nodes with multiple reg entries
and no child nodes.  Combining both into one schema requires declaring the
bus properties and patternProperties at the top level and repeating the same
exclusions across three separate allOf blocks, while still leaving ti,hwmods
allowed on the NoC compatibles.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,dra7-l3-noc
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 3

[Severity: Low]
Does ti,dra7-l3-noc support 3 reg entries, or should this be fixed at 2 ite=
ms
like ti,am4372-l3-noc?

In drivers/bus/omap_l3_noc.h, dra_l3_data defines module 1 as
L3_BASE_IS_SUBMODULE sharing module 0's base address:

drivers/bus/omap_l3_noc.h:
static const struct omap_l3 dra_l3_data =3D {
	.l3_base =3D { [1] =3D L3_BASE_IS_SUBMODULE },
	.l3_flagmux =3D dra_l3_flagmux,
	.num_modules =3D ARRAY_SIZE(dra_l3_flagmux),

drivers/bus/omap_l3_noc.c:omap_l3_probe() {
	...
		if (l3->l3_base[i] =3D=3D L3_BASE_IS_SUBMODULE) {
			/* First entry cannot be submodule */
			BUG_ON(i =3D=3D 0);
			l3->l3_base[i] =3D l3->l3_base[i - 1];
			continue;
		}
		res =3D platform_get_resource(pdev, IORESOURCE_MEM, res_idx);
	...
}

Because omap_l3_probe() skips platform_get_resource() and does not advance
res_idx for L3_BASE_IS_SUBMODULE, the driver only ever consumes 2 memory
resources on DRA7, and a 3rd reg entry would be ignored.

[ ... ]

> +examples:
> +  - |
> +    l3-noc@68000000 {
> +        compatible =3D "ti,omap3-l3-smx", "simple-bus";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges;
> +        reg =3D <0x68000000 0x10000>;
> +        interrupts =3D <9>, <10>;
> +        ti,hwmods =3D "l3_main";
> +    };

[Severity: Low]
This isn't a bug, but per Documentation/devicetree/bindings/dts-coding-styl=
e.rst,
reg should come right after compatible, followed by ranges, standard
properties (#address-cells, #size-cells, interrupts), and vendor-specific
properties (ti,hwmods) last.  In the top-level properties block above,
ti,hwmods is also placed before #address-cells, #size-cells, and ranges.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ti-l3-noc-=
v2-0-509e8485a1f3@gmail.com?part=3D2
