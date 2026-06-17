Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CC13803DB
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694813; cv=none; b=T9ENDPL4DWPjV26hkWZ3mWW0ploVc4sAa8XQkCVdoCHdrxhv6/YnZHbICpV885gVyDuPIikwJg0GZTXydCIo547Rqu9m93jA+hkLuoOeesb88E7J9ygmJmx9DP2hd6jYPk/s7YLcmhSj/PRDnf2uf7+4APtMLe6ANYAh+kOoKto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694813; c=relaxed/simple;
	bh=B3VMWKNzvRyN+s43pyE9q49QxqSQxGojgGwKqa65X7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MQU8pxDbqzatqJCEt/TLbOy8Rb2Cb80I+0RdMGfdAzQ40oW6bypDhdn4x7hAg4b5sdnsdWuFG/N4CufQEBBkd6zbf64pOfJ2+uwMTjAWBLSMqQ18gOlP1Dlvl/CaJJrJCgzk1LCdSxw+h2AfsTGUf3wC32cZRpnItpkFfwaHZ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kj8hxfDZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kj8hxfDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB671F000E9;
	Wed, 17 Jun 2026 11:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781694812;
	bh=L2FqbNDAR7EIkI573qd24umVLDgtXhDDGP8+p3mn/Pw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kj8hxfDZ74NZ0HgFH7hk+4id4VYfay4jL8ctWFxSrv/YwJHXxPXHy8/nXt75arHLp
	 cVKOOVTByJclYKjo6oxK6B6II/59T1Yh7h/K4zUW6r6vmTcDkWNN3fAxCB5m3xsIO4
	 /bdUXN0x6w935QE1aDELxVuFNYPxJQpYaem/OXqhQLEQTXktEde5qyZn31kSWin5Lx
	 ResgqusEGIJ+8/+V0iWPvh+cNTjst8EB2B+VEJ4ixQjGAi8SoxjiMe6qv63vOFbUQN
	 otfZk97YtfcfhYLC3+v/1ZFKm8CAgjKkegbyAlyiv+xS3/rMuO7mgHALXDwXiAIaij
	 WqY05YqmQnXJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260617110355.1591844-3-lakshay.piplani@nxp.com>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 11:13:31 +0000
Message-Id: <20260617111331.7AB671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The binding documents GPIO capability for target ports but omits=
 the standard GPIO provider properties, violating subsystem guidelines.
- [Medium] The binding fails to include compatible strings for the 4-port v=
ariants and unconditionally allows up to 8 ports.
- [Low] The unit address in the I3C example does not match its `reg` proper=
ty.
--

commit af3b77595fece3e15864b37b9b683be835a0e1eb
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support

This commit adds device tree bindings for the NXP P3H2x4x multi-port I3C hub
family. It supports connecting a host via I3C/I2C/SMBus to multiple downstr=
eam
peripherals across up to 8 ports.

> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Doc=
umentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 0000000000000..c080eeb0eeaa8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> @@ -0,0 +1,291 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/nxp,p3h2840.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP P3H2X4X I3C HUB
> +
> +maintainers:
> +  - Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> +  - Vikash Bansal <vikash.bansal@nxp.com>
> +  - Lakshay Piplani <lakshay.piplani@nxp.com>
> +
> +description: |
> +  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
> +  hub devices that connect to:-
> +  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to mu=
ltiple
> +     peripheral devices on the downstream  side.
> +  2. Have two Controller Ports which can support either
> +     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
> +  3. P3H2840/ P3H2841 are 8 port I3C hub with eight I3C/I2C Target Port.
> +  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
> +     Target ports can be configured as I2C/SMBus, I3C or GPIO and connec=
t to
> +     peripherals.

[Severity: Medium]
Since the description advertises that target ports can be configured as GPI=
O,
should this binding include the standard GPIO provider properties like
gpio-controller and #gpio-cells?

Because unevaluatedProperties is false and there are no child node patterns
defined for GPIO ports in patternProperties, won't adding a GPIO child node
fail schema validation?

> +
> +properties:
> +  compatible:
> +    const: nxp,p3h2840

[Severity: Medium]
The commit message and description state the binding supports the P3H2440
and P3H2441 4-port hubs alongside the 8-port P3H2840/P3H2841.

Should compatible strings be included for the 4-port variants here as well?

[ ... ]

> +patternProperties:
> +  "^i3c@[0-7]$":
> +    type: object
> +    $ref: /schemas/i3c/i3c.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        maximum: 7

[Severity: Medium]
Does unconditionally allowing a maximum port index of 7 cause issues for the
4-port variants mentioned in the description?

It seems this allows invalid configurations that define non-existent ports
(4-7) for the 4-port hardware.

[ ... ]

> +examples:
> +  - |
> +    i3c {
> +        #address-cells =3D <3>;
> +        #size-cells =3D <0>;
> +
> +        hub@70,236153000c2 {
> +            reg =3D <0x70 0x236 0x3000c2>;

[Severity: Low]
Does the unit address in this example match its reg property?

The reg property combines to a provisioned ID of 0x236003000c2, which appea=
rs
to differ from 236153000c2 in the unit address. Could this mismatch trigger=
 a
simple_bus_reg warning during make dt_binding_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617110355.1591=
844-1-lakshay.piplani@nxp.com?part=3D2
