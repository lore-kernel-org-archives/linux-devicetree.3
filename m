Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F83D5661
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847049; cv=none; b=kUkzQKjfKTv8+cNYiGYmbjn4wXzUgWt740A3nD9rYDOOFF4Zf2SMut8rZtncka6/Gj5UplYOLREO+KvhXfLF5HTx0rMIO91GZRIY5gAb2wbMcZHe96zf5uwAaESLJAuTg/LJqa0/2NDfakYRP6s7I+IIEmDjBCagQvALczILQpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847049; c=relaxed/simple;
	bh=Vfb52PFpKBllGr/TPSZrDH/QK8XLnLbiHKiIqLz8yKs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iJNO0dpjWNbkaH10wlZwrRoR2ttJ8bLrHFl08gEGtZkLMGsadBCTSJmSWPKjqzsVaBOttdltfh1U5Friyo1IYj0U582k5j64P5cSEBDt4tbfmzTCFIi+5v/OXkILFj1tieGJ+99Nr1DGF7oy1ksLAGe7SwdtmRSoJkVb2SfgxDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+Mow9Az; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+Mow9Az"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18568C2BCB0;
	Fri, 15 May 2026 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778847049;
	bh=Vfb52PFpKBllGr/TPSZrDH/QK8XLnLbiHKiIqLz8yKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=C+Mow9AzqSKTsKm4QlnB758LkT7VQeCVIA91x2RiIOQpCXR1fQipNepIW3IQqsMYU
	 U95ea7og2MUm3aXjtJORyUnjZcXLt2yIM13/9/jCSCig+buMACUanTZgcldAolmBId
	 sS5lg6RZL9Nr/46iADBbAZufyOmmgwRfcrjS2drfu/AMQY+PCQw/YrX6WV/UxfV48Z
	 L0uDyBiuT+8Hfuaht8rQBq638bWrwCXZZIzzHcwSBN0DDBIuzArsKMc7kBxNAXxhO2
	 bju0bZx/dkT5XZH/B0zbwfXqFGSiwlSs9/sYnQyL9KsXrA11mcj4Hkqdde6OFqLgCT
	 99CYyvblQl6iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add
 RZ/T2H and RZ/N2H support
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260515115202.1515577-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260515115202.1515577-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 12:10:48 +0000
Message-Id: <20260515121049.18568C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The new SoCs claim fallback compatibility with `renesas,r9a09g04=
7-xspi` but provide strictly fewer hardware resources than the fallback sch=
ema previously mandated.
- [Medium] The `else` block enforces a known-incorrect `minItems: 4` constr=
aint on the base `renesas,r9a09g047-xspi` compatible, contradicting the har=
dware reality described in the commit message.
--

commit 53ce1d0b1afc85c1adf4f55123b53c081bc04767
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support

Document the xSPI controller found on the Renesas RZ/T2H and RZ/N2H SoCs.
The patch updates clock and reset constraints to handle SoC differences,
noting that the RZ/G3E hardware actually only supports a single bridge
channel despite manual references.

> diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas=
,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/ren=
esas,rzg3e-xspi.yaml
> index 7a84f5bb7284e..cdeca4c795f3a 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-=
xspi.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-=
xspi.yaml
> @@ -30,6 +30,8 @@ properties:
>            - enum:
>                - renesas,r9a09g056-xspi  # RZ/V2N
>                - renesas,r9a09g057-xspi  # RZ/V2H(P)
> +              - renesas,r9a09g077-xspi  # RZ/T2H
> +              - renesas,r9a09g087-xspi  # RZ/N2H
>            - const: renesas,r9a09g047-xspi

Could this cause a regression since the new SoCs claim fallback
compatibility with renesas,r9a09g047-xspi, but provide strictly fewer
hardware resources than the fallback schema previously mandated?

A fallback compatible string asserts that an unmodified legacy OS driver for
the fallback SoC can successfully drive the new hardware. Prior to this pat=
ch,
the schema for renesas,r9a09g047-xspi mandated 4 clocks and 2 resets. The n=
ew
if/then block restricts the new SoCs to only 2 clocks and 1 reset.

While the current Linux driver handles this gracefully by using
devm_clk_get_optional_enabled(), Device Tree bindings are strictly
OS-agnostic. An older OS driver written strictly to the fallback's original
schema might attempt to acquire the previously mandatory axi/spix2 clocks a=
nd
aresetn reset, resulting in a probe failure.

Could the fallback's constraints be relaxed instead, or should SoCs providi=
ng
fewer resources avoid claiming fallback compatibility with a more
resource-demanding SoC?

[ ... ]

> @@ -109,6 +121,34 @@ required:
>    - '#address-cells'
>    - '#size-cells'
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - renesas,r9a09g077-xspi
> +          - renesas,r9a09g087-xspi
> +then:
> +  properties:
> +    clocks:
> +      maxItems: 2
> +    clock-names:
> +      maxItems: 2
> +    resets:
> +      maxItems: 1
> +    reset-names:
> +      maxItems: 1
> +else:
> +  properties:
> +    clocks:
> +      minItems: 4
> +    clock-names:
> +      minItems: 4
> +    resets:
> +      minItems: 2
> +    reset-names:
> +      minItems: 2

Does this else block introduce a regression by enforcing a known-incorrect
minItems constraint on the base renesas,r9a09g047-xspi compatible?

The commit message explicitly states that the RZ/G3E hardware actually only
supports a single bridge channel, matching the RZ/T2H design. However, the
patch adds an else block that strictly enforces minItems: 4 for clocks and
minItems: 2 for resets on all variants not listed in the if block. This
cements a known-incorrect hardware description into the schema.

When the RZ/G3E devicetrees are eventually corrected to reflect the 2-clock
hardware reality as promised, will they immediately fail schema validation?
Would relaxing the else block correctly allow RZ/G3E to use either the lega=
cy
4-item or the correct 2-item configurations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515115202.1515=
577-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
