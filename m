Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220787;
	b=XLZchrOdCoMOcSN9EQpDUGb2ioKchjzCrFCvduwmIodb73BX2BL5i0h2D959sCy0EYCj
	 BPn+qivVk8ymPjabq0btNljUUyLDouIv6mChg5q3b1fbhtX8dJhQcsrZ1UQeaDgHXYw2q
	 fq8dQfBkfcxnl061IHNxOl7NFGninbd8buWqi2RKewkYZFUxOcQEooGk3XGZmSQqcCRDx
	 Ik40y01Ry9GSJ2p23u3QfDcSfCNzdcMGXaGPSWvN/bRmqkAWNowgqyDZJVDtGr3N7qYjb
	 O97UrDIoAOlOcFDNSwO9iP4j6ROuVcQSvOGXpUPz6h3To2XvoVZ7q8dUfvvsLvMhIJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220787;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nsUPP4NpoIjFMvDCOJzLx7raBaIy7/AchEj5aNeMPQM=;
	b=T0l9e9EqRBFr8bqvHs+CUj+uWuElHXdkK0S4C0iShFTTJ98EAl+2iSqSITso45x2sphe
	 3QkPfdR/s8AnET8nljbQ/HD7bpiONRsTsPSgy64j5/+NNQWzJWM0r54EJH7/qDIr4fC6t
	 lttzYeqsi2kr+xDNsK8+6pFolnhIL9Cg9hi1FiPUKatqD34SukiJHIonyGp8QgX/CMTVO
	 QevGSnL+uIoJ0F76XsTWR3faQDnJ2IZf0GW/M/b1ylmwUjlwZSDuXifNhGjRgQ2ILWMX2
	 b/9vqgy0Sa/yFyJCkEkSpj8zitm13jvYJyGQsYYz7w8pbRDJeRSJDvS+jTxkMDW1f+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0hhv6U4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE40606A69B
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0hhv6U4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC281F000C0;
	Sat, 21 Nov 2026 00:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795220786;
	bh=nsUPP4NpoIjFMvDCOJzLx7raBaIy7/AchEj5aNeMPQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a0hhv6U4RLWjsSFvQVcEaXq7rwkTWq/2jyJtqh5R0Tf7WDw4f0q/orJlk8NL3m95i
	 kjnmuDCKSCt8gJVlSLzfvVZ8XuTs8M1JylxUl7G4rcBFJSI79mvTCg3LZLqmWAPNpg
	 X5f9EIWdJQkbb69S+wmoRLSFWTjr/D6nUyQ7Te0/yuXUmJ0Zx1qLlBXU6DBGeMFGO8
	 7vWj5v9UajGYlJre19Qr9PsKRGE4m97fsVafbg979wvsde6AYs8SCC12sLKgPP/UPS
	 meeTKPLp0dHvWAadNhcjZgs4/yGlSNghKfhc0MOvF+e6x6EkWYmh46UbuIjP8Asvku
	 9nEuLtGuLU6PQ==
Message-ID: <sashiko-outbox-226407@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 07/24] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261120002549.1908299-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 00:26:25 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: net: dsa: rzn1-a5psw: split ETHSW into separate
  schema
--

commit fd17f602fceb84e01bb997218c3f10610dbdafee
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW supp=
ort

This commit extends the Renesas RZ/N1 A5PSW DSA binding schema to cover the
ETHSW Ethernet switch variant found on RZ/T2H and RZ/N2H SoCs.

> diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw=
.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> index 30f25b06d62c4..c087291361760 100644
> --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
[ ... ]
> @@ -86,6 +158,46 @@ required:
>    - clock-names
>    - power-domains
>    - ethernet-ports
> +  - interrupts
> +  - interrupt-names
> +
> +allOf:
> +  - $ref: dsa.yaml#/$defs/ethernet-ports
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-ethsw
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 24
> +        interrupt-names:
> +          minItems: 24
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +        ethernet-ports:
> +          patternProperties:
> +            "^(ethernet-)?port@":
> +              properties:
> +                reg:
> +                  maximum: 3
> +      required:
> +        - resets
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 5
> +        interrupt-names:
> +          maxItems: 5
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +        resets: false

[Severity: Low]
Should the ETHSW binding for renesas,r9a09g077-ethsw and
renesas,r9a09g087-ethsw be split into its own schema document instead of
being added to renesas,rzn1-a5psw.yaml?

ETHSW does not share a fallback compatible with renesas,rzn1-a5psw, and
almost every property in this binding (interrupts, interrupt-names, clocks,
clock-names, resets, and the ethernet-ports reg constraint) has to be split
across separate oneOf branches and this if/then/else block.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120002549.1908=
299-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D7
