Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810504;
	b=OxoOOJYhUy+6hvcYihhxJGINDXy8hC0EWRicIGfe/ealz4fXzYTt6i9P+/0a3MfBdDes
	 TNvaD6WbsXhEy5w58//3e+hS72kJDzp0PWLQFo23U7gUSsZCfWrWAShFEcnK2x6xS/jcu
	 /Sr2H/JnxtkjzTUqylPHnqCawFaF1HW2tTDeauYE6mMGmLjrbyVhf+nX//U3uPKck7V4L
	 i1jB7rIHmf7mrZP2hnulZhO2kyHux170pPKj5f0KgYY6uDNZWzGgrIImWOJoKUTZY5/XL
	 BVUiH4WFI3EdpOgI2g+r7RTqV3OdhFW82NMMkD7g3gnMZz7XwPWPzFUTdzwLnvnLBIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810504;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rYvC6+49TX167R0ReJbHBPyR2n96oGtOYT7s7nqBIX8=;
	b=fOQwP2IXBaoIjo18lCSAyC1uana+QMvPm0igRlkW8kKgg5Vh3O+ZbBer9cgSdY6q/jpR
	 NgIrWgEXgw6fktUlv9gAaMreWxPEK0/dHAqxCPQyK3SvFtCb2cFZWGx9FR2vu2NaxmHML
	 vinHK8+GbP5x/OQ1ZBDx1/xDMQ+FxVFzi0dk9T46iq/dl7O5sytVaai3c/mBdoosN5/Y6
	 tg+CoCQL7DcS6I2MtVC4syjYijGRWD3ti0WuIOCC9tLzhPZ3uvN4uKjH+zci0tNeTP3kg
	 NrFuFNyh8KRwsihIxQX9zzhr9uXCm8vDbhAmhV7Szs4JU0DmZnBzhvNdmf/F8/6oKPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+q3ivEn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C493F606A338
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+q3ivEn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1199D1F000C1;
	Wed,  4 Nov 2026 16:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810503;
	bh=rYvC6+49TX167R0ReJbHBPyR2n96oGtOYT7s7nqBIX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K+q3ivEnCbKwTNfzgmQETIF7/vpJrZ1/8wtp5IG5UeyYq00ZZNXYWtGrW5CJTBU3C
	 uA+Lkbxlut//MkKPBeQiIDX6z6sJx+OS3h/fzLDtbnUFyMkqFpvXuhAskz+jVInahv
	 0cP95CCEUYF6MC1OHivmlypmnJGKHo7e7vPf6vj+SeqWuNRwiQEGeWnHq8R8D0b93o
	 mPnoGoSscUt97uj5U3zqqgzfNDudMoZNFM3ho/UjTwjnU42lJC3uDFSis+lHxmfmIg
	 G6bfH32i7P7wtEm0HYaW4uGqK2xZPoq+cg/9eQdLtugXxmGrhoAnScjDKyVygjqup5
	 /5fRmMbjCMW1Q==
Message-ID: <sashiko-outbox-197643@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lucas Tanure" <tanure@linux.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261103163715.385394-3-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
 <20261103163715.385394-3-tanure@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:41:42 +0000
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
- [Low] dt-bindings: net: amlogic,meson-dwmac: unwieldy per-compatible cond=
itionals
--

commit bbd012595ac6470b2960164c914c68e801ea5738
Author: Lucas Tanure <tanure@linux.com>

dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac

This commit adds the amlogic,t7-dwmac compatible string to the Amlogic Meson
DWMAC device tree binding schema, specifying its five-clock list and
restricting its delay properties to rx-internal-delay-ps.

> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.ya=
ml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index e769c9bb70d84..6de013e3e8f63 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml

[ ... ]

> @@ -57,6 +58,59 @@ allOf:
>              - const: clkin1
>              - const: timing-adjustment
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
> +        tx-internal-delay-ps: false
> +
> +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> +        # properties instead.
> +        amlogic,tx-delay-ns: false
> +        amlogic,rx-delay-ns: false
> +
> +  # Delay definitions for Meson8b and newer
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8b-dwmac
> +              - amlogic,meson8m2-dwmac
> +              - amlogic,meson-gxbb-dwmac
> +              - amlogic,meson-axg-dwmac
> +              - amlogic,meson-g12a-dwmac
> +    then:
> +      properties:
>          amlogic,tx-delay-ns:
>            enum: [0, 2, 4, 6]
>            default: 2

[Severity: Low]
This isn't a runtime bug, but the per-compatible if-then conditionals under
allOf in Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml are
getting quite unwieldy with the addition of amlogic,t7-dwmac.

The T7 variant differs substantially from the older variants in this bindin=
g:
it uses snps,dwmac-5.10a instead of snps,dwmac-3.70a, has a distinct five-c=
lock
list (stmmaceth, clkin0, clkin1, pipeline, pclk without timing-adjustment),=
 and
disallows tx-internal-delay-ps as well as amlogic,tx-delay-ns and
amlogic,rx-delay-ns.

Inserting the amlogic,t7-dwmac block into the middle of allOf also splits t=
he
existing conditional for the five Meson8b-through-G12A compatibles into two
separate if-then blocks with identical enum lists:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - amlogic,meson8b-dwmac
              - amlogic,meson8m2-dwmac
              - amlogic,meson-gxbb-dwmac
              - amlogic,meson-axg-dwmac
              - amlogic,meson-g12a-dwmac

Furthermore, because amlogic,tx-delay-ns and amlogic,rx-delay-ns are only
defined inside that second Meson8b-through-G12A conditional and not in the
top-level properties block (with unevaluatedProperties: false at the bottom=
 of
the schema), setting them to false in the amlogic,t7-dwmac block is redunda=
nt,
while leaving rx-internal-delay-ps: default: 0 inside the Meson8b-through-G=
12A
block omits that default for amlogic,t7-dwmac.

Would it be cleaner to split amlogic,t7-dwmac into a separate binding schema
document rather than adding more per-compatible conditionals to
amlogic,meson-dwmac.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103163715.3853=
94-1-tanure@linux.com?part=3D2
