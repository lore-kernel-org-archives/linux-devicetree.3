Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247F449B1D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580941; cv=none; b=NOHyL1QLDqyQZpLNAzBNmvD8Gw24lSIXom/UPtwLpqGuZ8OATa7PQ1OQae6+1pNYCftEks9j5qeyboO1Teo58UyeQbVhgYpobMqsmepU//+XpFT1f8W6IO02aUBirnzIFsk9BWBjUnS9E6NR+cTm9wxpNAiyRKEswxqJX41I9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580941; c=relaxed/simple;
	bh=uKCzJh/GxJPz1koyJChv8ILgLR4j1JyYXF7foLgE0Is=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rjiXY+0gHWzo8XvpFNLIOia3e/VPnzU4GkA9UVlWogAGBEdFxLr608LUte1kEHdVArvlVvGAQujo3SD2eysWxfdlU8DX+H5UafWwioBX2BXUW+3ZLzF594ppCJqW9FmDckf8M3uJtW6Ao6jsteQ3tgE66koFwstc3Y8WplqbnjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkxHE9Kb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkxHE9Kb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D4C1F000E9;
	Mon, 20 Jul 2026 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784580939;
	bh=qjy8YKfESnHflI5sWScZNy9xFkUSNC/RXF01jRbliXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YkxHE9KbU83dWQTDg+pGCu4la6fvHoMDhLCXrtBXeOTxiSXEQr0rT7SmyX8xaOm34
	 XXU0ZMYclFZKebUfy9RkcIPoEaHzb5hRXNxw5HWTffK9FZ4jvUshYeQF8V4jLs/XDy
	 PMWtB+kDANkXW1fEwv8sXwODV2GcMgsQ+y1fPj0BqNPF3K6s3Ir5IW+PhXPi72LpuU
	 HfuH/6Jz+i74IF99W3iNkRe8863sbb2+vJjIQmfU3bTveUhoZRUE2FX32SeBEJC6Pq
	 hclA/6lamoPlMqHffCHYrNhi9Ar8+SG4DxHJ8nteR1R2BFWBA7HTkZbDVAd2WM9cAe
	 jbiT356Ycervg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: power: Add MediaTek MT6858 power
 domain controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolai Burov" <nikolai.burov@jolla.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720-mt6858-pmdomain-v3-1-8966d8de93c8@jolla.com>
References: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
 <20260720-mt6858-pmdomain-v3-1-8966d8de93c8@jolla.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:55:38 +0000
Message-Id: <20260720205539.52D4C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Relaxing the global maxItems for access-controllers weakens vali=
dation for older SoCs, and the MT6858 block lacks min/max constraints.
- [Medium] The parent SCPSYS compatible string for MT6858 is undocumented i=
n the related MFD binding.
--

--- Patch [1]: [PATCH v3 1/3] dt-bindings: power: Add MediaTek MT6858 power=
 domain controller ---
commit 2af17e3001f2b4860c3cbd850866a2a03694b597
Author: Nikolai Burov <nikolai.burov@jolla.com>

dt-bindings: power: Add MediaTek MT6858 power domain controller

Add a new compatible and document bindings for the power domain
controller of the MT6858 SoC.

> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-contr=
oller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-control=
ler.yaml
> index 070c6e5666dc0..d03e4a9251635 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.y=
aml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.y=
aml
> @@ -25,6 +25,7 @@ properties:
>      enum:
>        - mediatek,mt6735-power-controller
>        - mediatek,mt6795-power-controller
> +      - mediatek,mt6858-power-controller

[Severity: Medium]
Since this power controller is a child of the SCPSYS system controller,
shouldn't the corresponding parent compatible string (e.g.
mediatek,mt6858-scpsys) be added to the parent MFD binding as well?

Without it, a complete Device Tree declaring the MT6858 SCPSYS parent node
might fail schema validation when checked against
Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml.

[ ... ]

> @@ -56,7 +57,7 @@ properties:
>        faults while enabling or disabling a power domain.
>        For example, this may hold phandles to INFRACFG and SMI.
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 6

[Severity: Medium]
Does relaxing the global maxItems constraint unintentionally weaken schema
validation for older hardware generations?

Previous SoCs relied on this global maxItems: 3 because they lack their own
specific if-then blocks for access-controllers. Now they will be permitted =
to
have up to 6 without triggering a validation error.

[ ... ]

> @@ -156,6 +158,23 @@ required:
>    - compatible
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt6858-power-controller
> +    then:
> +      properties:
> +        access-controllers:
> +          items:
> +            - description: handle to INFRACFG register block
> +            - description: handle to IMG_SUB0 register block
> +            - description: handle to CAM_SUB1 register block
> +            - description: handle to CAM_SUB0 register block
> +            - description: handle to IPE_SUB0 register block
> +            - description: handle to VLPCFG register block

[Severity: Medium]
Does this block also need explicit minItems: 6 and maxItems: 6 constraints?

Without them, JSON schema will fall back to the global minItems: 1, allowing
incomplete MT6858 device tree nodes specifying fewer than 6 access controll=
ers
to bypass strict validation.

> +
>    - if:
>        properties:
>          compatible:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt6858-pmd=
omain-v3-0-8966d8de93c8@jolla.com?part=3D1
