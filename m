Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C23195FC
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171312; cv=none; b=E6QAOk1VHffdAUKKjumNhrcujcVvF9LVQXqi/2k4zroym9TdP74nj5A5ceMMAtqm3S2MId7kU5cGcfllSOi2LdBMxJw6j8pvtxMmg+iTkaHX21WrhuMDRd7a6Lz65UrSq3pxh9jNTplSIklrX/gpPxWu4BnYmfQ8VUpe1kSCLf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171312; c=relaxed/simple;
	bh=d5evMYJEyqW09q3MWTsN8RAQKKXeMF5B0uZ6YrfTpLs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NhTO7r0CupsssF90vNUsbjagq2QG0qnloqPyFM+87wmVHNoi1BFo1MrdbSqdY4z8TqlkkcztWTezVNuyzCcIJT/Q81PzuAA+kRARNBC/qIiiVD+z08ZulTnEGdYqw9LTJLHd1QITOtJfj9TblC1rXf+85rRBV31h3ish39Ya4nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVxdWq0O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVxdWq0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57082C2BCFD;
	Tue, 19 May 2026 06:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171311;
	bh=d5evMYJEyqW09q3MWTsN8RAQKKXeMF5B0uZ6YrfTpLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uVxdWq0OBmCak6a0HVBwUhcvEB1adrXo+QDCamQByYd9HdEJtM61mMXUyGcj2PqeE
	 EAn0c8ROzq+VHSVSGR7LuUT4UjxsJL51m+dq/eTVCSItUXQ4QaB5JNadoMvuh4gj6S
	 5AWyT1+EPy1MF95XT0H4Mvylqi1ru8O9DBZKJvNakTVcIl6MTAfzvW/N4f3qY4bePy
	 GRAJ2QMswZENrS2/BsZW5vyBDG73tReKUpMbKlAi4VwmbJf67nRy5go+5U/xMImn65
	 i/KTGuET0Lmx7zizkdq65SWhZaa3uguW3XM7+FiZggMsL2IVJpLXnxNnjb/1avg8PA
	 tWbLlhnBfJ1ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: verisilicon,dc: generalize
 for  single-output variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519055114.1886525-2-a0987203069@gmail.com>
References: <20260519055114.1886525-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 06:15:10 +0000
Message-Id: <20260519061511.57082C2BCFD@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing explicit array length constraints in variant-specific cond=
itional blocks.
- [High] Generic catch-all compatible string enforces SoC-specific limitati=
ons and leaves array contents unvalidated.
- [Medium] Incomplete schema topology enforcement allows conflicting 'port'=
 and 'ports' properties.
--

commit e03be5624915d85b3073bbb37ac0fe652c0887cc
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: display: verisilicon,dc: generalize for single-output variants

This commit updates the verisilicon,dc display controller binding to support
single-output variants like the Verisilicon DCU Lite. It transitions the
schema to use an allOf/if-then-else structure to differentiate between the
existing dual-port th1520-dc8200 and a new generic verisilicon,dc compatibl=
e.
The top-level constraints are relaxed, with variant-specific rules intended
to be enforced in the conditional blocks.

> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yam=
l b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> index 9dc35ab973f20..3a814c2e083ee 100644
> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml

[ ... ]

> @@ -75,9 +69,75 @@ required:
> -  - ports
> =20
> -additionalProperties: false
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-dc8200
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: DC Core clock
> +            - description: DMA AXI bus clock
> +            - description: Configuration AHB bus clock
> +            - description: Pixel clock of output 0
> +            - description: Pixel clock of output 1
> +
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: axi
> +            - const: ahb
> +            - const: pix0
> +            - const: pix1
> +
> +        resets:
> +          items:
> +            - description: DC Core reset
> +            - description: DMA AXI bus reset
> +            - description: Configuration AHB bus reset
> +
> +        reset-names:
> +          items:
> +            - const: core
> +            - const: axi
> +            - const: ahb

Does JSON schema validation require explicit minItems and maxItems here to
override the top-level ranges?

At the top level, clocks has minItems: 2 and maxItems: 5, and resets has
minItems: 1 and maxItems: 3. Providing an items array inside a conditional
block does not override those top-level ranges unless explicitly redefined.

Could a device tree node for the thead variant incorrectly pass validation
with only 2 clocks or 1 reset, completely bypassing the intended strict
hardware constraints?

> +
> +      required:
> +        - ports

Since the top-level schema now evaluates the port property globally, should
this branch explicitly forbid it?

Without rejecting port, for example by using properties: { port: false } or
not: { required: [port] }, could a malformed device tree node for the thead
variant define both port and ports simultaneously without triggering a sche=
ma
validation error?

> +
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock that gates register access
> +            - description: Pixel clock divider for display timing
> +
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: pix0

The top-level rules allow up to maxItems: 5 for clock-names, but this block
only lists 2 items without setting an explicit maxItems: 2 constraint.

Could a node supply 3 to 5 clocks with unconstrained, undocumented string
names that completely bypass standard schema validation?

> +
> +        resets:
> +          maxItems: 1
> +          description:
> +            Reset line for the display controller.

This branch represents a generic fallback for verisilicon,dc, but caps rese=
ts
at 1, which appears to be a Nuvoton-specific constraint.

Will this cause validation failures for future hardware integrations of this
IP that require multiple resets?

Should this binding use a specific compatible string for the Nuvoton hardwa=
re,
such as nuvoton,ma35d1-dcu, instead of enforcing these limits on a generic
catch-all string?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519055114.1886=
525-1-a0987203069@gmail.com?part=3D1
