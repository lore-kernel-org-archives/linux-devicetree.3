Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE393D88E3
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165139; cv=none; b=McV/9BqkCalCo7tKtYuOdwOoDWoGK6+rpwOi0mc/NmuUz7a/+tD3+HqS+Aa5Y242Fxmil3M0+/BFd6g59ZUssxKA8LioU5iI2iueGKbAQtGuYN2BnKcdVYjl2uNpBpsEafh4RMB3ijmhxOMjlhKa36/To1Vtz08saWfBOjqtXXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165139; c=relaxed/simple;
	bh=4HjoHeQzjR7/rSMAWTE/o1gry4WUmIPEOJ/HxkCcQ8w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aBCBXMbEtE6rmpe57URIY5+OZYYJ8iq7GtCvM5jqDoeUYKNmVowUza/Q9HxaicIJZGVdd1rD0BixDdzNnlGSb0kWzgaUpAkmFngwTeL+ehOvtgAOW25QyQc3Pq0VSDFZZaDzoZYt+tNMygmLgXdHGnLWrLDXxoLGFSi+V0CaPbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVoxIorJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVoxIorJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B271F000E9;
	Mon, 31 Aug 2026 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165132;
	bh=UqmN2g4i1QfTRNrh4hYhJjRbRe9hDrdnXsq1it2S9BY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jVoxIorJchGXCMXb0ot5p/U1aVAtCcJ7Cr2tUj1nBHxp25/MXQM48ZyYmshIwVaY5
	 +ehnwYFkiCztpWOm46bh69XGdl3jVsCsyQN4wGXvomUitNLd/BBv4hevsvFIMHPvAl
	 WWybvUJJnwbKKxwIxrI11X28a2PY+l770jcu61Mv5EN9KhVVeyzMTbjyBfCfLhHPGu
	 Adlq1zWHJLJAbHToGodyQsuH6BCszgMES8LGNQu8f/LAabDV5AebFHgzsLhQTR0SB1
	 KfAP2Hz1NWu7DHbZVm4OWKy/A9PS7wEtPkSgdZ56hsGtD81ckadnftiJBNMGNhDx+Z
	 XYTSP4hOkBrTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: Add CIX Sky1 USB bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260831082309.3854507-2-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
 <20260831082309.3854507-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:32:11 +0000
Message-Id: <20260831083211.E4B271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Custom devicetree properties do not follow standard naming conventi=
ons (missing vendor prefix and using underscores).
- [Low] The unit-address in the example node name does not match the first =
address in its 'reg' property.
--

commit a013b6f9b48698942425d14e2f091ce0c4c04f8c
Author: Hongliang Yang <hongliang.yang@cixtech.com>

dt-bindings: Add CIX Sky1 USB bindings

This commit adds device tree bindings for the CIX Sky1 USB3 PHY and
Cadence USBSSP controller glue layer.

> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b=
/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> new file mode 100644
> index 0000000000000..47202ff5b9e57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml

[ ... ]

> @@ -0,0 +1,153 @@
> +  reset-names:
> +    items:
> +      - const: usb_preset
> +      - const: usb_reset
> +
> +  cix,usb_syscon:

[Severity: Low]
Does this property name follow the standard devicetree naming conventions?
Standard convention strongly prefers hyphens over underscores in property
names (e.g., cix,usb-syscon).

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the Sky1 S5 system controller used to program USB mode
> +      strap controls.
> +
> +  axi_bmax_value:

[Severity: Low]
Does this property need a vendor prefix and hyphens instead of underscores?
Custom hardware-specific properties require a vendor prefix to avoid
collisions with standard properties (e.g., cix,axi-bmax-value).

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x7
> +    description:
> +      AXI bus maximum burst length configuration value.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        usb@91c0300 {

[Severity: Low]
Does the unit address 91c0300 match the first address in the reg property?
The Devicetree Specification requires that the unit address in a node name
exactly matches the first address specified in the node's reg property.
Here, it does not match the actual base register address 091c0314, which
will trigger a simple_bus_reg warning when the devicetree compiler evaluates
the example.

> +            compatible =3D "cix,sky1-usbssp";
> +            #address-cells =3D <2>;
> +            #size-cells =3D <2>;
> +            ranges;
> +
> +            reg =3D <0x00 0x091c0314 0x00 0x4>,
> +                  <0x00 0x091c0400 0x00 0x4>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831082309.3854=
507-1-hongliang.yang@cixtech.com?part=3D1
