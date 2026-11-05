Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902892;
	b=sFmcPFvKJTm2FK2eZ3VHuYB/rAKlb2F+3VfInO02xhDRHZJZ8J+Ka+kODnXKSAy2tvFt
	 vXN2Lv8dUGziwzDD64MS28bJubecgHk36frVGkl2jTlg5kwMPbYyKdIpputD4qWYHDJ9p
	 kcEMoHME9R8qUh9TmXxnUinTo2tnuNRw6BIG8iERW/CgfJ59X1AUKqgCWoz385ggW+byy
	 /MtePhq3ZNXK7m955YOaxdOJ5o2Hf5JIvU/Wh3PiPk94HA6bOdt1JW9P92LLYgBE521as
	 yjK2rySHd7M8robKjIhy8lSslHkGn8YjmatimCyuQbZNmXbp+vAJ5YOg17alMEbIZ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902892;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7989xDUOUdBPBSC7JHpEFaJqf09JXWDpJBv6B8F0ozo=;
	b=kIflSovxbEhOPFIqIRjzlAysBRO77wxs2p4uj4kNyjMwA7BGgPbBfSNBxulKPBFCMXy/
	 6ZzuTXmZwrPC33hTcsN1+fOFC9reWWIs87GCsx5/04RNzFjqLYyrw4kggfghLc2K6lgVV
	 HhvNpdHmPSX0mVLWZ8jwbUi1mFh5p8Qpi8W1FdM5FtRJEcBmGM9Gx3CtLAVb5g7PFKkOh
	 hjMWD+6vpzaprpjc0MftzzQ5GwuDf0VLKE8Fhgo0nXo3zNAzCEHNLdwfxW2bUqAsT6sNv
	 vV+qhtS29jwsPR6iwEQvB86Mr+xHlx/ki5fPdr6fZljXA0uPxmwqdR8z4ztBsdbKvRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYiLi9we;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6AA606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYiLi9we
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D901F000C1;
	Thu,  5 Nov 2026 18:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902891;
	bh=7989xDUOUdBPBSC7JHpEFaJqf09JXWDpJBv6B8F0ozo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QYiLi9wen/p394pFKQGpWXTEDmGZcgdj1OQSiBZUw0NgY+Mvs9HFG6Go4DYQEU45X
	 xs2A2e+ktb7tAvWkTAdDT7Q4z23F0B8jkuJZ/qsddIK8VicruVxsn7CBoRGXWgi6Zr
	 8YLqOdi7DaRXHQott/DnL9JjyhFwT8R4bA9SmFkh1VHrfI8msZRBAP6m5El++Mn3qS
	 uy1qRXq9/eoLKddX5PKxmPoj20URQ8CNsNW4Ec+EPttg2EGXIzn59XbK5K/5vRSFm6
	 NmrKqSCPU6kFBw5NwaVvFKs7n7UgmB/LoIM3XL35Oq8xOdhS+e6CibwWqHeIFVZpQf
	 NAWO8y0lb1uJg==
Message-ID: <sashiko-outbox-199731@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 06/14] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261104182105.1102555-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261104182105.1102555-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 18:21:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: net: dsa: rzn1-a5psw: split ETHSW into separate schema
--

commit 58ade097798a6648dae56580c5e1d16da26de07a
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW supp=
ort

This commit extends the Renesas A5PSW DSA binding schema to cover the ETHSW
variant found on RZ/T2H and RZ/N2H SoCs, adding compatible strings and
per-variant constraints for interrupts, clocks, resets, and ports.

> diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw=
.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> index 250c59e58439b..338e499b42b1c 100644
> --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> @@ -4,43 +4,108 @@
>  $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Renesas RZ/N1 Advanced 5 ports ethernet switch
> +title: Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW Ethernet Switch
> =20
>  maintainers:
>    - Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> =20
> -description: |
> -  The advanced 5 ports switch is present on the Renesas RZ/N1 SoC family=
 and
> -  handles 4 ports + 1 CPU management port.
> +description: >
> +  This binding describes the Ethernet switch IPs used on Renesas SoCs:
> =20
> -allOf:
> -  - $ref: dsa.yaml#/$defs/ethernet-ports
> +  - The A5PSW (Advanced 5-Port Switch) found on the RZ/N1 family, which
> +    provides 4 external ports and 1 CPU/management port.
> +  - The ETHSW (Ethernet Switch) found on the RZ/T2H and RZ/N2H families,
> +    which is derived from the A5PSW IP with some register layout
> +    differences, additional timestamping support, and a total of 4 ports
> +    including the CPU/management port.
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r9a06g032-a5psw
> -      - const: renesas,rzn1-a5psw
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a06g032-a5psw
> +          - const: renesas,rzn1-a5psw
> +
> +      - const: renesas,r9a09g077-ethsw
> +
> +      - items:
> +          - const: renesas,r9a09g087-ethsw
> +          - const: renesas,r9a09g077-ethsw

[ ... ]

> @@ -94,6 +166,48 @@ required:
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
> +            "^(ethernet-)?port@[0-3]$":
> +              properties:
> +                reg:
> +                  items:
> +                    - maximum: 3
> +            "^(ethernet-)?port@4$": false
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
This isn't a bug, but would it be cleaner to split the RZ/T2H and RZ/N2H
ETHSW binding into a separate schema document (such as
renesas,r9a09g077-ethsw.yaml) instead of combining it with
renesas,rzn1-a5psw.yaml?

In Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml, the
ETHSW compatibles (renesas,r9a09g077-ethsw and renesas,r9a09g087-ethsw) do
not share a fallback compatible with renesas,rzn1-a5psw, and nearly every
property in the schema differs between the two variants:

- interrupts and interrupt-names have different item counts (24 vs 5),
  names, and ordering (switch then dlr on ETHSW vs dlr then switch on
  A5PSW), requiring separate oneOf branches.
- clocks and clock-names have different item counts (3 including ts vs 2).
- resets is required on ETHSW and disallowed on A5PSW.
- ethernet-ports allows ports 0-3 (disallowing port@4 and restricting reg
  to maximum 3) on ETHSW versus ports 0-4 on A5PSW.

Because the allOf if-then-else conditional has to override almost every
property in the file, splitting ETHSW into its own schema file would avoid
the per-variant conditional complexity.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104182105.1102=
555-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D6
