Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B784B1CEAC2
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662656; cv=none; b=O+eCAf0EqwB3G8y1Es6OEkLnDYDtsqXj0kTz11M20deM3pmOCZk8c/s22Y8kOIz44yXxgxqQ+70V5sp5A1X2+WfYDfmbsrPOcJQx/ktAspJeOoaPeR+tis/B8Mfr+TfJp5gbonze0Ryud/Ir8Q59LTyHhrKBC3dgltAneccja0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662656; c=relaxed/simple;
	bh=tr7VkaAL3sNZqCNlVoi3ku7slUFYYNp7KNAD4FCBKUE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aD21HvSmPx8FalIkPLslF7hXIGP5wfJk8+SqAX5MtAzZkGcQ7gTXMQWAkTnHEnd0IVNugQHYYiM7Ro3xFEP1Zwt4cW+UaSWTDFNxB30pTWVLAFYUf9xz7cTrOCYAr6Gu5OTLUpaNQ+0LUsz2EeaO0yp+eA24h5rRRmDGYo4ZHfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLkrPS+N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLkrPS+N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB721F00893;
	Fri,  5 Jun 2026 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780662655;
	bh=VrHtUBhhRj524XhJLmczbOBWLq3a44gef1IO3cRDILk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PLkrPS+N8tdEr01AQV0K4NpBm3XJzBchrQ0N7OJ3RVvy9lubyL8yH+5ESiqM0jWWF
	 bp15CJ3mJFuB69OcLpgu8ai5OTtuIImvgvyHV5PmDo/zFh2DzuuTbeEjdMqKQSRDXg
	 204jPou9PiRnUFkIaMHnx43N6dKnnjFbpsIedJpdVZn6/lxRo18r0jOFZY5Lpl0om0
	 YYPMhfUPukfRoiMF447Ud47mXftBKnIzmuuO0uQGwT0OvdwAAnvSlqjJq7PTUwGv0V
	 xpgE+o0AwIMODkxeTmqORnDTmat7E17mbT6sfF3VYwZnKLB/cXfDU6WZYkcE8PVlty
	 2wZzNf2Vl30VA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605121955.105661-2-phucduc.bui@gmail.com>
References: <20260605121955.105661-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 12:30:54 +0000
Message-Id: <20260605123054.BBB721F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Contradiction between the strict positional order defined in the `c=
locks` index descriptions and the flexible ordering permitted by `clock-nam=
es`.
--

commit f8c8566ea84f655cc7929bfa8c21e1ba2f97abe4
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: dt-bindings: renesas,fsi: add support multiple clocks

This commit updates the Renesas FSI binding to support multiple clocks to
properly describe the hardware clock tree. It includes the SPU bus/bridge
clock, CPG DIV6 functional clocks, FSI dividers, and external clock inputs.

> diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/D=
ocumentation/devicetree/bindings/sound/renesas,fsi.yaml
> --- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> @@ -38,7 +35,32 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Main FSI module clock
> +      - description: |
> +          SPU bus/bridge clock. On R8A7740, this clock must be enabled t=
o allow
> +          register access as the FSI block is connected behind the SPU b=
us.
> +      - description: CPG DIV6 functional clocks for FSI port A
> +      - description: CPG DIV6 functional clocks for FSI port B
> +      - description: FSI dividers for port A used for audio clock genera=
tion
> +      - description: FSI dividers for port B used for audio clock genera=
tion
> +      - description: External clock inputs for FSI port A provided by th=
e board
> +      - description: External clock inputs for FSI port B provided by th=
e board

[ ... ]

> @@ -69,6 +91,31 @@ required:
> =20
>  unevaluatedProperties: false
> =20
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,fsi2-r8a7740
> +    then:
> +      required:
> +        - clock-names
> +
> +      properties:
> +        clock-names:
> +          minItems: 2
> +          uniqueItems: true
> +          items:
> +            - const: fck
> +            - const: spu
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> +            - enum: [icka, ickb, diva, divb, xcka, xckb]

[Severity: Low]
Does this flexible enum ordering conflict with the strict positional sequen=
ce
defined in the clocks property description above?

The clocks property specifies an items array with 8 distinct descriptions
that enforces a strict positional mapping (e.g., the fourth slot is the
functional clock for port B). However, this clock-names constraint permits
these optional clocks to be specified in an arbitrary order.

If a board omits an optional clock but provides subsequent ones, will
dt-schema incorrectly map the provided clock to the wrong description since
DT arrays do not support skipping elements?

>  examples:
>    - |
>      #include <dt-bindings/clock/r8a7740-clock.h>
> @@ -77,7 +124,11 @@ examples:
>              compatible =3D "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
>              reg =3D <0xfe1f0000 0x400>;
>              interrupts =3D <GIC_SPI 9 0x4>;
> -            clocks =3D <&mstp3_clks R8A7740_CLK_FSI>;
> +            clocks =3D <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
> +                    <&fsia_clk>, <&fsiack_clk>, <&fsidiva_clk>,
> +                    <&fsib_clk>, <&fsibck_clk>, <&fsidivb_clk>;
> +            clock-names =3D "fck", "spu", "icka", "xcka", "diva",
> +                         "ickb", "xckb", "divb";

[Severity: Low]
Can this example be updated to follow the positional sequence defined in the
clocks property?

The clocks definition reserves the fourth position (index 3) for the CPG DI=
V6
functional clock for FSI port B ("ickb"), but the example places the extern=
al
clock input "xcka" at that position instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605121955.1056=
61-1-phucduc.bui@gmail.com?part=3D1
