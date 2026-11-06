Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959465;
	b=lS420c8AmsJ4W+6qGCJlr4YZAhHH4da9a8nGt38BL84dqi7imXrwkuVcfRzxQwN2EBPX
	 1rsHbZLEotv8aIObZJjBhJ4wjv1ieG+lci/4mdG18/au+zA3qSgYa3EvLfBp5CtDl59iX
	 JWUl5n+Al9yOGzoSL+exvOhQSF8FuZHnUCydF/dciEmu45LxusuPRX5S+lzYPRcHpq+nu
	 9+RuUYR6WlhfM7j63oW9mUGU+HsTNKNIpqH7rtoiceEEMAm25lFULO4L+MgEaR+l/LZ+U
	 0Ib7G/+WVzgjJb8T+CtVMO+MhfIUj9OXm3nGlWwViVEkWUNL7UQi11VCFck7iAIgxqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959465;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q/RLZlg/ZBO7YPpmSOQt/COnp0ZcO2IAWkQg2E90wJI=;
	b=hQTupG3/T/ij8oZvg847gMmbUS+z00oOkC/6pSuN2q3/yIjQMrZeO/0Nhy8y83mIFf+L
	 y7Gr9aN/CX2uJm9zEytO0ff6tajQvY13NCFOX0vuz75NzssAaJHXvb6GSgJW6sjhjgqIp
	 vv/FwwuQfedbqbV94xyFsV/FKeMSmpmvfntSSfyuEkLNNEFZ5ybWU6/AkRwou/HgRarLA
	 kDIuCkfo2qEbSVZK5HIDW/XH7RUOkwn8rE/KM9WpZu0Uu7TNupARkMWv3INpzExMVxlL2
	 aLUGhjCHtnQdA9rLZxla6hrilzmyWpvz5QIr8j7a0xjzquWGLnPgHIjMtQmINkgYJ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CzXuHUTe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA3606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CzXuHUTe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F391F0089F;
	Fri,  6 Nov 2026 10:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793959464;
	bh=q/RLZlg/ZBO7YPpmSOQt/COnp0ZcO2IAWkQg2E90wJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CzXuHUTe6d0CwTKfg2mlzAV1YK2bmymhwT1923fPtWP5xKL8eqaKhU6u89fBv0hoG
	 UzquI8ECDIJbPnCk2WFFhQODreFKX7edTy3wedbz04S29A16ja67oxEtutzvAaJ3NI
	 LUdbIqpx72zAgMtzT4nxGKfQDlby0kYwMpNn+M2pIrjWI5LcYuSGSNMD3f3B+E6kVV
	 TgnrYwea9r/K1N9U68klYh++KENGRaP43eXINawvmYd/m/gfqe41sXfnTGlOmQvJlV
	 jREFH8f1DNMUFvZ78NneJl7+ImSH8csTp9hRsNJEwucM40mitIytYSDoNLc7+Q/Emr
	 b/i74F2YCzKlg==
Message-ID: <sashiko-outbox-201171@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lucas Tanure" <tanure@linux.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261105100322.37816-3-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
 <20261105100322.37816-3-tanure@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:04:23 +0000
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
- [Low] dt-bindings: net: amlogic,meson-dwmac: unwieldy per-compatible
  conditionals
--

commit bc12f1675c9788e6cacf4400aec8cfab4ff91981
Author: Lucas Tanure <tanure@linux.com>

dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac

This commit adds the amlogic,t7-dwmac compatible string and its associated
clock and delay constraints to the Amlogic Meson DWMAC device tree binding
schema.

> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.ya=
ml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index e769c9bb70d84..ff5e50f651144 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml

[ ... ]

> @@ -84,6 +85,49 @@ allOf:
>          rx-internal-delay-ps:
>            default: 0
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t7-dwmac
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GMAC main clock
> +            - description: First parent clock of the internal mux
> +            - description: Second parent clock of the internal mux
> +            - description:
> +                clock of the pipeline stage inserted in the bus path bet=
ween
> +                the controller and the DRAM. Without it, the controller =
cannot
> +                complete DMA transfers.
> +            - description:
> +                clock of the register block holding PRG_ETH0 and PRG_ETH=
1.
> +                Without it, the block reads as zero and ignores writes.
> +
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: clkin0
> +            - const: clkin1
> +            - const: pipeline
> +            - const: pclk
> +
> +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yam=
l.
> +        # The RX delay line of this glue is fine tuning in 200ps steps,
> +        # added on top of what phy-mode describes. The TX side has no fi=
ne
> +        # tuning: its only step is a quarter of the clock period, the fu=
ll
> +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> +        rx-internal-delay-ps:
> +          default: 0
> +
> +        tx-internal-delay-ps: false
> +
> +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> +        # properties instead.
> +        amlogic,tx-delay-ns: false
> +        amlogic,rx-delay-ns: false
> +
>    - if:
>        properties:
>          compatible:
> @@ -106,6 +150,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
>      then:
>        properties:
>          rx-internal-delay-ps:
> @@ -142,6 +187,10 @@ properties:
>        - items:
>            - const: amlogic,meson6-dwmac
>            - const: snps,dwmac
> +      - items:
> +          - const: amlogic,t7-dwmac
> +          - const: snps,dwmac-5.10a
> +          - const: snps,dwmac

[Severity: Low]
This isn't a bug, but as reported by Sashiko on v5 [1], the amlogic,t7-dwmac
variant differs substantially from the existing Meson6 and Meson8b-through-=
G12A
variants in Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml:=
 it
uses a different Synopsys core fallback (snps,dwmac-5.10a instead of
snps,dwmac-3.70a or snps,dwmac), requires a different five-clock list
(stmmaceth, clkin0, clkin1, pipeline, pclk without timing-adjustment), and
disallows tx-internal-delay-ps as well as the legacy amlogic,tx-delay-ns and
amlogic,rx-delay-ns properties.

Rather than piling another large per-compatible if-then conditional block i=
nto
allOf and splitting the rx-internal-delay-ps constraints for amlogic,t7-dwm=
ac
across two separate if-then blocks in allOf (while also setting
amlogic,tx-delay-ns and amlogic,rx-delay-ns to false even though those vend=
or
properties are only defined inside the mutually exclusive Meson8b-through-G=
12A
conditional branch and are already rejected by unevaluatedProperties: false=
),
would it be cleaner to split the divergent T7 binding into a separate schema
document?

[1] https://lore.kernel.org/r/20261103163715.385394-3-tanure@linux.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105100322.3781=
6-1-tanure@linux.com?part=3D2
