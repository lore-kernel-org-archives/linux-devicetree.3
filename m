Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA02778F2E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778809779; cv=none; b=XPgCfqwXeGfsQ0bJ7B2SuEZ7ragJC2Axy9LZ6H6y5p/hAOs0+l7LGzAgauZZEIDjR7u7nYlhSQL/p1Wc+FcCVJ1keotZ9FAbxZBjAffcred9R1gOM8iPWrQ2n7M3LK5mDyrK0MF+mw0j/p5pmUvQTcnl7Pqv22QRt0nXM2HJWtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778809779; c=relaxed/simple;
	bh=L59JW44XVIhL+S+tjUNvJXGcEBIIK+gNiIc64Q9lnu4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p+0WerJIb156xqeS+llU0WdnBzzM4ATCzoqRkiCk5t4H6B9Px9fbKkZkgsfBwI/mtstBHATi+Ilxns+3O6HVKcayucZqK5XziK4YUJLJuwmRkoyXRY4hhfOpgYu1WRXRBN6vnz9b4I/HfOoK949ZzxcTwTYI4NnAWBUgYUq/2F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+twWfC4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+twWfC4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540FDC2BCB3;
	Fri, 15 May 2026 01:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778809778;
	bh=L59JW44XVIhL+S+tjUNvJXGcEBIIK+gNiIc64Q9lnu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=m+twWfC4iz3ocN7oyRm7+3XtLaCUIPvzR7hRXpMLRt/nekNkODkoY/787UDoL/F9d
	 uUrDVZGo9gnMK2G3ewxmYk1cQAKDx02l13oYOKrSa9m9Zo+xLvsZvAx+zYG5/pSE7B
	 3M+dIWmyDxe5LNWQHXlt8Cno7vB+UlQku4dl0V6zQqBqlCFp6W6LN1FhTvOxq5ghpV
	 ZuqeH60TInSmZw9CXscDpAJnrdrzuWT0c/oLN9gkjQVHfpDl6CwI/Hpc7yCZiHGudh
	 vlCZh0/Z+PSZ8fxUnmdM2wRZBeHN11HSTIERmH14p3Nh71dg9lTzyUeaBZRBVFptLW
	 XdU2x2m2Bfq0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang via B4 Relay" <devnull+wangjia.ultrarisc.com@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 01:49:37 +0000
Message-Id: <20260515014938.540FDC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The schema lacks a top-level `required` block for mandatory contro=
ller properties.
- [Medium] The binding introduces custom legacy vendor properties and magic=
 macros instead of using generic pinctrl properties.
- [Medium] The `maxItems: 32` constraint on the legacy array properties all=
ows structurally incomplete configuration tuples.
- [Medium] The schema incorrectly uses `additionalProperties: false` alongs=
ide `$ref` inclusions, forcing redundant property definitions.
- [Low] The documentation incorrectly describes the legacy properties as a =
`phandle-array`.
- [Low] The schema fails to enforce the hardware limitation that `func1` is=
 unsupported on `LPC` pins.
--

commit 20f50ac043d77ef903b805d0902034551c955519
Author: Jia Wang <wangjia@ultrarisc.com>

dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl bindings
   =20
Add bindings for the pin controllers on the UltraRISC DP1000 RISC-V SoC.

> diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-p=
inctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pi=
nctrl.yaml
> new file mode 100644
> index 0000000000000..c7ed1f96382af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.=
yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ultrarisc,dp1000-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UltraRISC DP1000 Pin Controller
> +maintainers:
> +  - Jia Wang <wangjia@ultrarisc.com>
> +
> +description: |
> +  UltraRISC RISC-V SoC DP1000 pin controller.
> +
> +  The binding supports two child node styles under the same controller
> +  compatible:
> +
> +  - legacy DP1000-specific nodes using phandle-array properties
> +    `pinctrl-pins` and `pinconf-pins`

Is "phandle-array" accurate here? The schema defines these as flat uint32
arrays, and the examples show raw integer arrays without any phandles.

> +  - generic pinctrl nodes using `pins`, `function` and generic pin
> +    configuration properties
> +
> +properties:
> +  compatible:
> +    const: ultrarisc,dp1000-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pinctrl-cells":
> +    $ref: /schemas/types.yaml#/definitions/uint32

Should there be a top-level required block for compatible and reg?
Without it, a device tree node omitting the reg property or left entirely
empty could silently pass schema validation.

> +patternProperties:
> +  '.*-pins$':
> +    type: object
> +    allOf:
> +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    additionalProperties: false

Should this use unevaluatedProperties: false instead? Using
additionalProperties: false alongside $ref ignores properties imported by
the references and forces redundantly redefining generic properties locally
in this file.

> +    properties:
> +      pinctrl-pins:
> +        description: |
> +          The list of pins and their mux settings that properties in the=
 node
> +          apply to. The format: `PORT  PIN  FUNCTION`.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32

Since the format requires 3 integers per tuple, does a maxItems: 32
constraint allow structurally incomplete configuration tuples? 32 is not a
multiple of 3, so it rejects a valid 11-pin configuration (33 integers) whi=
le
permitting an invalid array ending with a partial tuple.

> +      pinconf-pins:
> +        description: |
> +          The list of pins and their pad configuration that properties i=
n the
> +          node apply to. The format: `PORT  PIN  CONF`.
> +          CONF is a DP1000-specific encoding of pull and drive strength =
as
> +          defined in dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32

Is it appropriate to encode distinct physical characteristics like bias and
drive strength into a single integer using a macro? The pinctrl subsystem's
architectural design typically models these as individual, human-readable DT
properties.

For a new upstream driver, shouldn't it rely exclusively on the standard
generic pinctrl framework rather than introducing new custom vendor propert=
ies?

[ ... ]

> +      function:
> +        description: |
> +          Mux function to select for the listed pins.
> +          gpio maps to the hardware default mode. The default mode is
> +          GPIO for PA/PB/PC/PD pins and LPC for LPC pins.
> +          func1 is not supported on LPC pins.
> +        enum:
> +          - gpio
> +          - func0
> +          - func1

Could the schema enforce the hardware limitation that func1 is unsupported
on LPC pins? Adding an allOf with an if/then block would prevent this
invalid combination from passing schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ultrarisc-=
pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=3D4
