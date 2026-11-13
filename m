Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559173;
	b=oSIUSv9w3edE2oI3nNkFOqIQVnuT3MWga3l00ah9g55Wz9Run6Q1KAs5AlToh1dHFUiG
	 4st/W+IXw2cjgIP6EhAW+M6wYmhvY+WnL1Xx250B/YUZdd8ZV3HBMpa/zKdMcjt3mdE8f
	 lWxe8+XCMUH7eLJ9u9ccxEHf8i27vzba9w+4od74mpeXy723Em6mUBJSsKIjQv1bvlXiC
	 fiESrW0wLGPw41rDCrudliAnGohdcBeJrDCoqwrVy4cbbWHrz1wgOFZJA2PhWyTqZdKbt
	 xXa95VP72U0UMfVDhgp+b4Kra9bb161GnY6diqXbVxJM2lBgtkLgNlLwffx65NvQjZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559173;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pUvpbqMIh0v4KHvh2DKwlonGSZxTKDZI/Lkml2nVAno=;
	b=SiRuq/tZHDKvm5kzgTGEExovSnNeKUOaQ5HCBx8Kvw+0PaRaeoVCnVGdMB7Ma6OC43ho
	 z46V8qoCnuL9TR34yqb0W/+zhIWREWJLgeOQ16twZ1iCGaGc8mDgXG9FvjEenk3iImvHn
	 55pevm/ibStibEIJtXjl3fK2Ely4TFsNEdzXHVQlXEdkqeNu90R4OH+8SJ6LHvPvs13xa
	 XaPK9nklO9JPym5OwXA0/WkaMUXoQ/3VjnUvqRfdWS7cLiknsMTtht/bF4QcDr9i7TBNO
	 kRyH74r7rvrWh+uOvURJ7tsPEO3kqKu56yHZ3lnVoe3rWcw+vnlMC/8zZpDwFQMMysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ThzUIiYU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0081606B1DB
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ThzUIiYU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FA21F000C5;
	Fri, 13 Nov 2026 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559173;
	bh=pUvpbqMIh0v4KHvh2DKwlonGSZxTKDZI/Lkml2nVAno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ThzUIiYUu6Nh5b7LIpzCpuyMWkLsoh+E61d+qfQ0dRqyOsDmhlwz8hKZ6s8HPYMJU
	 +aZMY27zny92bIonXRxhx6Q6UUwWe2CeTyd98QJn2lk8MnvcTHB/Q+ItgwIZTTFP2F
	 eje8IKWNmu/EA8/HdBeBzcXeVUxHN8dIia0hc+BBjMWLv5tqRjE0KNu4Y0F+xno4g2
	 bAH2Yf/uvaBO/plGPKueGEc5zyFCyGgdUGUDklxYgTuo2tbkAXHchNGuV5tFb+4Jk/
	 MQuzdXcWqbnnI9NYC3x7FP+xlz0rtJ6Hx+rjpzFINgjZ8cixYON7yCoSvR/QfHLri/
	 vgpUEYlLURsAw==
Message-ID: <sashiko-outbox-212428@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 1/7] dt-bindings: net: ftgmac100: Make
 Aspeed compatibles standalone
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-support_ast2700-v6-1-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-0-238020bf46cf@aspeedtech.com>
 <20261112-support_ast2700-v6-1-238020bf46cf@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:39:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] dt-bindings: net: ftgmac100: dropping fallback compatible
  breaks dtbs_check
- [Low] dt-bindings: net: ftgmac100: unwieldy per-compatible
  conditionals in schema
- [Low] dt-bindings: net: ftgmac100: inaccurate DMA mask claim in commit
  message
- [Low] dt-bindings: net: ftgmac100: incomplete clock-names constraint
  for two clocks
--

commit 8d20c693d9736c24e1fec0cfa5f5df1d9636e586
Author: Jacky Chou <jacky_chou@aspeedtech.com>

dt-bindings: net: ftgmac100: Make Aspeed compatibles standalone

This commit updates the ftgmac100 Device Tree binding to make the Aspeed
compatible strings standalone and adds per-compatible constraints for the
clocks and clock-names properties.

> The aspeed,ast2400-mac, aspeed,ast2500-mac, and aspeed,ast2600-mac
> compatibles are currently only valid when paired with the generic
> "faraday,ftgmac100" fallback: if a node ever bound through the
> generic entry alone, ftgmac100_probe() would set
> rxdes0_edorr_mask/txdes0_edotr_mask to BIT(15) instead of the Aspeed
> BIT(30), skip Aspeed clock setup, and leave the DMA mask too narrow.

[Severity: Low]
Is the commit message accurate about ftgmac100_probe() leaving the DMA
mask too narrow for these compatibles?

In drivers/net/ethernet/faraday/ftgmac100.c, ftgmac100_probe() does not
call dma_set_mask() or dma_set_mask_and_coherent() for AST2400, AST2500,
or AST2600.

> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml=
 b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index d14410018bcf6..9d352e3686aaf 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -11,14 +11,11 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    oneOf:
> -      - const: faraday,ftgmac100
> -      - items:
> -          - enum:
> -              - aspeed,ast2400-mac
> -              - aspeed,ast2500-mac
> -              - aspeed,ast2600-mac
> -          - const: faraday,ftgmac100
> +    enum:
> +      - faraday,ftgmac100
> +      - aspeed,ast2400-mac
> +      - aspeed,ast2500-mac
> +      - aspeed,ast2600-mac

[Severity: Medium]
As reported by Rob Herring on v4 [1], does dropping the two-string
compatible entry break dtbs_check and backwards compatibility for existing
device trees?

All MAC nodes in arch/arm/boot/dts/aspeed/aspeed-g4.dtsi, aspeed-g5.dtsi,
and aspeed-g6.dtsi, as well as existing device trees in the field and
kernels prior to 03a2aba50b2c ("net: ftgmac100: List all compatibles"),
declare the SoC compatible followed by "faraday,ftgmac100".  Retaining
the two-item compatible entry with deprecated: true alongside the
standalone enum would allow the new standalone compatibles without
breaking validation of existing device trees.

> @@ -88,22 +85,76 @@ allOf:
>      else:
>        properties:
>          resets: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2400-mac
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +      required:
> +        - clocks
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - aspeed,ast2500-mac
> +              - aspeed,ast2600-mac
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 2
> +        clock-names:
> +          minItems: 1
> +          maxItems: 2
> +      required:
> +        - clocks
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - aspeed,ast2400-mac
> +                - aspeed,ast2500-mac
> +                - aspeed,ast2600-mac
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false

[Severity: Low]
This isn't a bug, but now that the Aspeed compatibles are standalone and no
longer fall back to faraday,ftgmac100, their property requirements diverge
enough from plain faraday,ftgmac100 (which forbids resets, clocks, and
clock-names) that piling multiple per-compatible if-then blocks into
faraday,ftgmac100.yaml makes the single schema unwieldy and duplicates the
top-level minItems/maxItems constraints on clocks and clock-names.  Would
splitting the Aspeed MAC binding into its own schema document be cleaner?

> +  - if:
> +      properties:
> +        clocks:
> +          minItems: 2
> +    then:
> +      required:
> +        - clock-names

[Severity: Low]
Does this rule still allow a single-element clock-names array when two
clocks are specified?

Because clock-names permits minItems: 1, requiring clock-names without
also setting properties: clock-names: minItems: 2 in the then branch lets
a node with two clocks and only clock-names =3D "MACCLK" pass validation,
even though ftgmac100_setup_clk() looks up the second clock by name via
devm_clk_get_optional_enabled(priv->dev, "RCLK").  In addition, since
clocks is not required at the top level, the if branch needs required:
[clocks] so nodes without clocks do not match this condition under JSON
Schema evaluation.

[1] https://lore.kernel.org/r/20261020181441.GA510274-robh@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-support_as=
t2700-v6-0-238020bf46cf@aspeedtech.com?part=3D1
