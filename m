Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167179;
	b=utIJEp9jpC9zFNEHox5dYbeYmFWrIXEMJruhyfNHZdIpVWTTdfLRv57Ma9cNOPGynTnj
	 iIikb5qCPpzj1Wt3p6xG3qDgTSKorzcHP2OWlaMnFpfypxWr/RPUp7teA2akIYADWoJsR
	 sD1CvsRZTnJtaDnOgawW/ocE1GPMFoGtRUcqa7lq5ARm0rCKN3JIWTREgcZ/q0HSKiCIS
	 HRjOTEN934KNTJHy2DuCvATVk+6FokjTqemyv7hZ6++PDLFb9qrjKFWd32fCqOntSXe1m
	 Fiwt2deh7ZM46rKk7eYF8VK9XuWt6GEql26vzBMQtNHA+HeuOpKEVWLZ/qTD9GHTLrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167179;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j83YISU8SYQ7THy+mAwc0gQYTgSkFXxCa7hRqpV/rqI=;
	b=nXGifxYrdgYJ/4S4sKUWxQXWiNkq+KJFyaDTxFpeSOoebUghxgK2YZ6OaxDra5thR2yd
	 pHpmcam0CBGBYmGwFVWKBuLn3yBlYeYzrbNvs+rl51PT8E9sVGDAYRCw2MiP6rshG15gE
	 I8M4jKsMwCAu8ny6DyQu0oZWCoIv6reJXdHLPQOTq1MqyFPdaGSQr1MNiGZizwKwLqYe6
	 cgMNQ51EDE50gVqi1NlxUFSrtNq0YtJC0TQXrGOLiCNzei2Sk7UsG7Mk2Nrq7Wk++821s
	 U76fsCdRwtdTGE0dZkU6fQKsrxVQPkf7pSH0HjRnVaSLMtYf7Teqd8xeQcsHQBCWXRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mU1VE1b5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836D6606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mU1VE1b5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230BF1F000C4;
	Fri, 20 Nov 2026 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167179;
	bh=j83YISU8SYQ7THy+mAwc0gQYTgSkFXxCa7hRqpV/rqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mU1VE1b5EXAlsy8zapJufn8YrzOOASDm08hzgU3Qb+6utZsTpmlaQM3xJowsWkrHX
	 yUFKxdCTEtCZVn7G3zvNi1kivwmXJK1dqtOdp9onsrtqFW0tywnxTmVOmKugMHSOdy
	 sDxaf4KoLsWCDPKo/kP3Jx+KUQzuZykZFAfBDm9ECat/wkSGkNcB42/6QPkdMR9IaW
	 dA37eaJaZQKU1IqxTmK4PLrct7J/EETSxEb8MRD9bDTrmZ+JLkA9vbjkRA6Jo829E5
	 zot0rIJmOX63cjdu3hWE5nEFD69k3umhUm1+ixx4lD4DixRA9ELLb5bPDfYQGsRNu/
	 TxeDDS9wKkvVA==
Message-ID: <sashiko-outbox-224854@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 1/7] dt-bindings: net: ftgmac100: Make
 Aspeed compatibles standalone
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-support_ast2700-v7-1-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-0-33c8ca2d0dd7@aspeedtech.com>
 <20261119-support_ast2700-v7-1-33c8ca2d0dd7@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:32:58 +0000
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
- [Low] dt-bindings: net: ftgmac100: broken two-clock conditional in
  schema
- [Low] dt-bindings: net: ftgmac100: unwieldy per-compatible
  conditionals in schema
- [Low] dt-bindings: net: ftgmac100: inaccurate DMA mask claim in commit
  message
--

commit 9fe0301cae72065a7d7965c7e6fd35afb67ceddd
Author: Jacky Chou <jacky_chou@aspeedtech.com>

dt-bindings: net: ftgmac100: Make Aspeed compatibles standalone

This commit updates the Faraday FTGMAC100 binding schema to make the
Aspeed MAC compatibles standalone and constrains the clocks and
clock-names properties per compatible.

> The aspeed,ast2400-mac, aspeed,ast2500-mac, and aspeed,ast2600-mac
> compatibles are currently only valid when paired with the generic
> "faraday,ftgmac100" fallback: if a node ever bound through the
> generic entry alone, ftgmac100_probe() would set
> rxdes0_edorr_mask/txdes0_edotr_mask to BIT(15) instead of the Aspeed
> BIT(30), skip Aspeed clock setup, and leave the DMA mask too narrow.

[Severity: Low]
Is the commit message claim about the DMA mask accurate for these three
compatibles?

ftgmac100_probe() configures the descriptor ring end-of-ring masks and
Aspeed clocks for FTGMAC100_AST2400, FTGMAC100_AST2500, and
FTGMAC100_AST2600, but does not configure a DMA mask for any of them.

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
As reported by Rob Herring on v4 [1], does removing the two-string
compatible combination break DT schema backward compatibility and cause
dtbs_check errors on existing device trees?

All MAC nodes in arch/arm/boot/dts/aspeed/aspeed-g4.dtsi,
arch/arm/boot/dts/aspeed/aspeed-g5.dtsi, and
arch/arm/boot/dts/aspeed/aspeed-g6.dtsi still pair the Aspeed compatible
with "faraday,ftgmac100".  Retaining the two-string entry (with
deprecated: true) alongside the standalone compatibles would preserve
compatibility without introducing validation regressions.

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
This isn't a bug, but now that the Aspeed compatibles are standalone and
do not share resets, clocks, or clock-names with plain faraday,ftgmac100,
would splitting the Aspeed MAC binding into its own schema document be
cleaner than piling per-compatible if/then conditionals and duplicated
minItems/maxItems constraints into faraday,ftgmac100.yaml?

> +  - if:
> +      properties:
> +        clocks:
> +          minItems: 2
> +    then:
> +      required:
> +        - clock-names

[Severity: Low]
Does omitting required: [clocks] from this if block cause nodes without a
clocks property to require clock-names?

In JSON Schema, a properties constraint succeeds when the tested property
is absent, so a plain faraday,ftgmac100 node without clocks matches this
if condition and hits required: [clock-names] even though the previous
rule sets clock-names: false.  In addition, because clock-names allows
minItems: 1, the then branch needs properties: clock-names: minItems: 2 so
a node with two clocks cannot pass validation with only a single
clock-names entry while ftgmac100_setup_clk() looks up the second clock by
the name "RCLK".

[1] https://lore.kernel.org/r/20261020181441.GA510274-robh@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-support_as=
t2700-v7-0-33c8ca2d0dd7@aspeedtech.com?part=3D1
