Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4505A3C5837
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839694; cv=none; b=htQiIqdaUZQ7QW+cahGl3ZAXwPcReqlaCTH1oRi/s8xAECJYpRXQxqJmOJsMhiBXpqk08ZlD8rFGl8iBNwnAqtt/ipHMc+xGZ6Nvo9CdSixQOmywXjR/R4wmnnl0hrRZaRgvbfNfZ9mVK7MjaOTibYHXqGTMIwx9FxDDcuERvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839694; c=relaxed/simple;
	bh=ES7qA1WnyHdAEaDAZQahh7dvYPpmgDXZ2+S9Mq0ZC+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fK3JgMqINh9Qy9rHUy3hWsnm0NaqGeM04SVYQoNC85oftxaM/Rh1s8GTo5EEKO0yBcQeoehx86envseQV2hf0O11EQh0CyXfU8CWJG4Id2MMe/9yvIsBgi4bIGjAqWXEyQnzGWwe+U8Dy5rxv0VasYNfXq44LpiDdb4c8/mNGP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvMNWzPL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvMNWzPL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B81CC2BCB0;
	Fri, 15 May 2026 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778839692;
	bh=ES7qA1WnyHdAEaDAZQahh7dvYPpmgDXZ2+S9Mq0ZC+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VvMNWzPLLiauYcoUMc2Rnk/Xvk5gD9rvMAEhYSTdvf4478zOtUTyZQ85IVKVuqFHI
	 /GxuGMYlX/6o/1XewtkOsEXcz7apMn3WU0Obqz9W0sKTMicURGIeNzo63l9l7gT6tq
	 LUwf6ylVeQd4MWsSkoCyYyQlLO3HgoZMViX64Qz2rXemc+Xyf0EXG2y1CI0J3pVkWP
	 2A9IXN20hwBHTlD+k1ekJeDALZTNazt/zTb4cK1ZWZxHjoSaab/ZN9NW/GeH7vCTVq
	 2p7hwEM4OLJ+T9vqLzf2ZGvxmTmzgK2+mBznXNloxgk3DLQM8U1YpBTsp6yI5hYr+z
	 1qOH2cJyTEqbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc1-pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260515-pinctrl-single-bit-v3-2-e97da4312104@aspeedtech.com>
References: <20260515-pinctrl-single-bit-v3-2-e97da4312104@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 10:08:05 +0000
Message-Id: <20260515100812.9B81CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Schema uses `additionalProperties: false` alongside `$ref` instead =
of `unevaluatedProperties: false`.
--

commit f22ff0791aac86f631d0cc5f4662941db457d162
Author: Billy Tsai <billy_tsai@aspeedtech.com>

dt-bindings: pinctrl: Add aspeed,ast2700-soc1-pinctrl

This commit introduces a new devicetree binding schema for the ASPEED
AST2700 SoC1 pin controller. It reuses the standard pinmux and generic
pin configuration schemas.

> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc=
1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-s=
oc1-pinctrl.yaml
> new file mode 100644
> index 0000000000000..76944fd14e2c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinct=
rl.yaml
> @@ -0,0 +1,760 @@

[ ... ]

> +patternProperties:
> +  '-state$':
> +    description: |
> +      Pin control state.

[ ... ]

> +    type: object
> +    allOf:
> +      - $ref: pinmux-node.yaml#
> +      - $ref: pincfg-node.yaml#

[ ... ]

> +              - pins
> +    additionalProperties: false

Since this block references pinmux-node.yaml and pincfg-node.yaml, should
this use unevaluatedProperties: false instead? Using additionalProperties:
false might cause standard properties provided by the referenced schemas to
be incorrectly rejected during validation.

> +
> +    properties:
> +      function:

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +additionalProperties: false

Similarly, since the root level includes a reference to pinctrl.yaml, does
this also need to be unevaluatedProperties: false?

> +
> +examples:
> +  - |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-pinctrl-si=
ngle-bit-v3-0-e97da4312104@aspeedtech.com?part=3D2
