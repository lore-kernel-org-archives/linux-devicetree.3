Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE47035E92B
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786263355; cv=none; b=bP/WSyTk0dUDWIQBECc6uhgHw2jjEu7xOYfLeqIFdkYV90G8yFffQJUbOx67l/vntkslBP9dEOeJgliI+2uDCQzZOrq0JBzL9RPxXYx4Rj7LCay224NhxCa1dYZaRdNa9bVGCSya+RuQP0zNsKhQDfZ7fu4ACkXXMVCj+++Y+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786263355; c=relaxed/simple;
	bh=zghFNpqwqSZFT/KP5D85pj9Zw2zZpLC5OpbE3NRuv4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tcqV07rELLfqgj0FX3amfOd3no40AYcpAbEcHy8JGdj0dnrTgwsQZSrJD30o3wKKtVypnr/TDVAT4yCLx3q3O6dNdgk5wuUsegOlCEOSTJR6b2rK2Z/cO6LbAAKQDLJwRhYO3CWqqNkE7wDYSsIe5Kjv2n4sbZDVCnYRR2c0i6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAvKc8jl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAvKc8jl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388851F000E9;
	Sun,  9 Aug 2026 08:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786263353;
	bh=mTlsON+xVw/VA+E0zMos74F5jhcWTNLbdc79AAFwdbw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YAvKc8jlQ08eCvziF4upSNR8TRlae1p3uRLdUuHUCO1XtC2hfr2Aoyj5K3j0/MeE7
	 5BRXSJXFgN38uRyQv3HcQkts2VuMlVOSn0Dr9Ue/xtBF+JK/IQyu0C0/LyQq2fvtSr
	 CPScrckWFYxEk8k/ULo7ihuPzrE3XcJsh0k26Osixnt49tcmaIzAlnfoCD/0Py0okW
	 mpYQ+PWo29/bYJzHdbmbee1crmcumTIfo5KSMhmBepGP21w2z8E60snSVnhfgG1fN4
	 AyGBL/bbZMkT55wvU/zzPTAwFpFI4sVKrmUpN2XWpInwVSxtB80bNitdSXPIMvFkzR
	 nV3FQPLVbyy5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Naseef" <naseefkm@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
References: <cover.1786262697.git.naseefkm@gmail.com>
 <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 08:15:52 +0000
Message-Id: <20260809081553.388851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Top-level `additionalProperties: false` incorrectly used instead of=
 `unevaluatedProperties: false`, violating schema inheritance rules.
- [Low] Missing node labels for `&pinctrl`, `&chip_scu`, and `&gic` phandle=
s in the DT binding example.
--

--- Patch [2]: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin cont=
roller ---
commit 416526d5ba1573bed48e64c8f0fa2557dff04dcd
Author: Ahmed Naseef <naseefkm@gmail.com>

dt-bindings: pinctrl: Add EcoNet EN7528 pin controller
   =20
Add the binding for the pin controller found on the EcoNet EN7528 MIPS
SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
pin configuration registers have a different layout, so it gets its own
compatible.

> diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.=
yaml
> new file mode 100644
> index 0000000000000..574285939c9d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EcoNet EN7528 Pin Controller

[ ... ]

> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible

[ ... ]

> +        required:
> +          - pins
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +additionalProperties: false
> +

[Severity: Low]
Does this prevent the use of common pinctrl properties? Since this schema
includes a reference to pinctrl.yaml# earlier in the file, using
additionalProperties: false at the top level will incorrectly reject valid
properties inherited from the referenced schema.

Should this be unevaluatedProperties: false instead?

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pinctrl {
> +      compatible =3D "econet,en7528-pinctrl";
> +
> +      airoha,chip-scu =3D <&chip_scu>;
> +
> +      interrupt-parent =3D <&gic>;
> +      interrupts =3D <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      gpio-controller;
> +      #gpio-cells =3D <2>;
> +
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +
> +      gpio-ranges =3D <&pinctrl 0 0 42>;

[Severity: Low]
Will this example fail dt_binding_check compilation due to missing labels?
The phandles &chip_scu, &gic, and &pinctrl are referenced here, but they
are not defined as labels within the example snippet.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786262697.gi=
t.naseefkm@gmail.com?part=3D2
