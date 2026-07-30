Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556743839B8
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429479; cv=none; b=hlval/q9/d3MununZ4DqnzdTEE4JPWXlNaKdZf8raeFmxXCclkRwAYB3a+Yrzw7wcrd//cPl21uIxujFFTAgu3DMHPJ/q7TXNQvHak8mgiBIkDs5CyOaSdOxWDarMpbfv15j83EB4O328g966t3XYMMfzhGq3c4u2rEG4SaZ0so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429479; c=relaxed/simple;
	bh=5dIlJGKv0W+3Qcagf4SMrVe4dyUOsrEASrpZL78kU9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=urnEgXzRMofoBOdq/1VNAAia8zSG4uH4CqH5l5DMfYCeqyGeFaX+1ofFTqsbJ1ZgJd9TxeD1BjEZrA9mGBHU4+r5lzHBd0LFoC3qtNHKuzBKH58a0iFq3rJ3sRakuKupR6BGuEWOss4d7Y7U06oRfuLFjWg7MzpELsfhskjPKRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+7iSvPl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+7iSvPl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40901F00A3E;
	Thu, 30 Jul 2026 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785429478;
	bh=6gBO+6iEg3mdhM5nX/mczsPQWJTdtf8v0QFDHX+3unU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y+7iSvPlj56HxNIebHKcZOk/Cv7iVaos+AoJf1wYWsb1Z69WwdoEAtlzW1DVlosBd
	 9Y5ueAdVs1vux3jPDHQF1jOHFYnnqjozeEAdkZAht1ASLDITzO0/S2W5IKtJuC22kS
	 iUv8RKzqJmD8rKsNz2KNy6zMBNb6uOMybAVPmO0N4pBBBnhz9nv8b51qLLXqoB5KnU
	 gJTBFF1GsKGCgOV3XVPkV4a9NKZ3PueTHGMpm1pNw9QgAbP5tdK7fqArSE+AloAEEC
	 /8hUJb2SM63/Oj/bR+fBfW1xBczkVzZuDKzxlHC+4+a2w9FreIR3ePk1Rvb751yuNI
	 vSQySco8om4tA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: Add SoC-e switch IP and DSA
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729-devel-vstrassheim-soce-dsa-ml-v1-2-be569dae1b20@linutronix.de>
References: <20260729-devel-vstrassheim-soce-dsa-ml-v1-0-be569dae1b20@linutronix.de>
 <20260729-devel-vstrassheim-soce-dsa-ml-v1-2-be569dae1b20@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:37:57 +0000
Message-Id: <20260730163757.B40901F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Medium] The `mdio` bus models a Linux software-synthetic topology rather=
 than the actual hardware layout, misusing `reg` and inventing custom physi=
cal address properties.
- [Medium] Setting `unevaluatedProperties: false` on the child `ethernet-ph=
y` node breaks validation for vendor-specific PHY properties.
- [Low] The device tree example in `soce,switch-dsa.yaml` fails to compile =
because it references undefined phandle labels (`&soce_switch_ip` and `&gem=
3`).
- [Low] The device tree example in `soce,switch-ip.yaml` provides a 4-cell =
`reg` property without a parent node specifying `#address-cells` and `#size=
-cells`, leading to validation failures.
- [Low] The `ports` sub-node pattern property description claims to define =
vendor-specific properties, but none are actually listed or defined.
- [Low] Unnecessary `#address-cells` and `#size-cells` defined at the root =
node level, causing dtc warnings.
- [Low] The `soce,num-ports` property is missing constraints that are expli=
citly stated in its description.
--

--- Patch [2]: [PATCH 2/4] dt-bindings: net: dsa: Add SoC-e switch IP and D=
SA bindings ---
commit 28c590589436788e107ab82bf7fbd0fdcad40087
Author: Vasilij Strassheim <v.strassheim@linutronix.de>
Subject: dt-bindings: net: dsa: Add SoC-e switch IP and DSA bindings

This commit adds DT schema documentation for SoC-e FPGA switch devices.
The binding is split into a switch IP node describing the MMIO register
block and a DSA MDIO node describing the DSA-facing switch instance.

> diff --git a/Documentation/devicetree/bindings/net/dsa/soce,switch-dsa.ya=
ml b/Documentation/devicetree/bindings/net/dsa/soce,switch-dsa.yaml
> new file mode 100644
> index 0000000000000..a04e2838d14eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/soce,switch-dsa.yaml
> @@ -0,0 +1,195 @@

[ ... ]

> +properties:
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

[Severity: Low]
Are #address-cells and #size-cells necessary at the root node level?
Since the only allowed sub-nodes (ports and mdio) do not use a @
unit-address, compiling device trees conforming to this schema might emit
avoid_unnecessary_addr_size dtc warnings.

[ ... ]

> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +    description: |
> +      Optional child MDIO bus exposing PHY devices attached to switch us=
er
> +      ports. PHY nodes referenced by port "phy-handle" properties should=
 be
> +      placed here. The PHY address seen by Linux on this bus is the swit=
ch port
> +      index, not necessarily the hardware PHY address selected internall=
y by
> +      the switch IP.

[Severity: Medium]
Does this model a Linux software-synthetic topology rather than the actual
hardware layout? Device tree bindings are expected to describe the hardware,
rather than modeling internal software abstractions like Linux's synthetic
MDIO bus mapping. Using custom properties for the hardware bus index instead
of natural mdio subnodes might violate core DT design principles.

> +    unevaluatedProperties: false
> +
> +    patternProperties:
> +      "^ethernet-phy@[0-9a-f]+$":
> +        type: object
> +        $ref: /schemas/net/ethernet-phy.yaml#
> +        unevaluatedProperties: false

[Severity: Medium]
Will setting unevaluatedProperties: false on the child ethernet-phy node
break validation for valid vendor-specific PHY properties? Device trees usi=
ng
specific PHY hardware with valid vendor properties (like ti,rx-internal-del=
ay)
might fail schema validation because the parent schema strictly forbids the=
m.

[ ... ]

> +  ports:
> +    type: object
> +    description: Container node for the switch port sub-nodes.
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^port@[0-9a-f]+$":
> +        $ref: dsa-port.yaml#
> +        unevaluatedProperties: false
> +        description: |
> +          Switch port. In addition to the standard DSA port properties
> +          (label, phy-mode, ethernet, fixed-link) the following
> +          vendor-specific properties are used for data ports connected to
> +          external PHYs.

[Severity: Low]
Could this description be updated? It claims to define vendor-specific
properties used for data ports connected to external PHYs, but the descript=
ion
abruptly ends and no such properties are actually listed or defined.

[ ... ]

> +examples:
> +  - |
> +    /* Excerpt from a Xilinx ZynqMP design (ARM64) */
> +    mdio {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        soce_switch: switch@10 {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            compatible =3D "soce,switch-dsa";
> +            reg =3D <0x10>;
> +            soce,switch-ip =3D <&soce_switch_ip>;

[Severity: Low]
Does this example fail to compile? The phandle label &soce_switch_ip
does not appear to be defined in this example snippet, which might cause
dt_binding_check to fail when dtc attempts to resolve it.

[ ... ]

> +                port@2 {
> +                    reg =3D <0x2>;
> +                    label =3D "INTERNAL_PORT";
> +                    ethernet =3D <&gem3>;

[Severity: Low]
Similar to &soce_switch_ip, the &gem3 ethernet controller label also
appears to be undefined in this example.

> diff --git a/Documentation/devicetree/bindings/net/dsa/soce,switch-ip.yam=
l b/Documentation/devicetree/bindings/net/dsa/soce,switch-ip.yaml
> new file mode 100644
> index 0000000000000..ba9bb396235f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/soce,switch-ip.yaml
> @@ -0,0 +1,54 @@

[ ... ]

> +  soce,num-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Total number of switch ports (external/user ports plus the CPU upl=
ink
> +      port). Must be greater than zero and not exceed the selected IP va=
riant.

[Severity: Low]
Should there be explicit JSON schema constraints (such as minimum: 1)
added for this property? The description mentions it must be greater than
zero, but invalid device trees specifying soce,num-ports =3D <0>; might
pass validation without the constraint.

[ ... ]

> +examples:
> +  - |
> +    switch_ip: switch@80020000 {
> +        compatible =3D "soce,mrs-24-01";
> +        reg =3D <0x0 0x80020000 0x0 0x10000>;

[Severity: Low]
Will this 4-cell reg property cause a validation failure? The implicit
parent provides #address-cells =3D <1>, so this might parse as 2 items and
exceed the maxItems: 1 constraint. It likely requires a parent node
(e.g., a bus node) defining #address-cells =3D <2> and #size-cells =3D <2>.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-devel-vstr=
assheim-soce-dsa-ml-v1-0-be569dae1b20@linutronix.de?part=3D2
