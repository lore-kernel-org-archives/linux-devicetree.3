Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B58A450F2
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781141571; cv=none; b=Dehn7qxmh26vXC6kKZpoQxMyaUEfUkgHElsq+o3RtkDqr6/8+Z1b5pIibTpVIyf/o/nn283UUHegQb+yEP8QmEKWWxN0LFQrlBS+n7qGt7tbvyD2/bhtIl7wDvxhBSecB042FZE6jVtDHgLpIRPLL7q4GhxXL4D7ydVMA3mvEhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781141571; c=relaxed/simple;
	bh=bFnBxkkma2BGYEw4iDuNEgr7ryBODbF3GGrt3XcCZwA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YRowDOi2NH0yEexV9A56y3M92jjE9hq/7EHpVBulFicSJISBCcCh8RN/jcCvSQqedroS1goGlqEfyS1Ze0VzT21C+mclueLY+iGu9eJA7leUpNBEXWsfDoqNUSsiQOOrU31ahE3Ga0oZvdetq6ivZwDKnqpSIAz9mmcPLe4CVR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDCxZPlI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDCxZPlI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03641F00893;
	Thu, 11 Jun 2026 01:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781141570;
	bh=lEAyT7t+VlP9JknEnBM0Xt0PcUefAyMIvunciMYN7lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PDCxZPlI7neVGPcxIDtEDG6KaOm1lN77XczW+Vr8yC6dn2q8+9YO5326g3OK/A/v3
	 m/hHWMgoSAhOMgGvy7IYByI5S0Mpje3KWl9+kt5bJLJmm4XzjXgJQ7rCZQ8FQoMbOz
	 ImOWRcbmB8o5F9wZyt1sow5gFcgL7PFn71pgwSf/K07orHdrNZeZ7TWP1z/M6Q2jTX
	 E6MflpL0O/9Naq/bPGbLEX5Tvoo9tNCt1s0wlBj59FuX5Ow1x56VUYu9RPHPZUIl8Z
	 40EB5wIZwLpylbHCA71o4cRp/6k0BmzskH1OqrllRXFhskv4JqI+LzYGJU6hU2uHKQ
	 WlTBAddxwxuxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 2/6] dt-bindings: ethernet: eswin: add
 EIC7700 eth1 RX clock inversion variant
Reply-To: sashiko-reviews@lists.linux.dev
To: lizhi2@eswincomputing.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610012907.894-1-lizhi2@eswincomputing.com>
References: <20260610012907.894-1-lizhi2@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 01:32:49 +0000
Message-Id: <20260611013249.E03641F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Using a top-level `oneOf` partition for `compatible`-based const=
raints breaks schema extensibility and violates dt-schema conditional patte=
rns.
--

commit c1875936c193e91a73baa1d661559e819f16e710
Author: Zhi Li <lizhi2@eswincomputing.com>

dt-bindings: ethernet: eswin: add EIC7700 eth1 RX clock inversion variant

This commit adds a new compatible string for the EIC7700 eth1 MAC variant
to handle RX clock inversion requirements. It introduces specific
tx-internal-delay-ps constraints for each variant using a oneOf block.

> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml=
 b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> index 4e02fedae5c67..8cb7545c56e87 100644
> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml

[ ... ]

>  allOf:
>    - $ref: snps,dwmac.yaml#
> =20
> +oneOf:
> +  - properties:
> +      compatible:
> +        contains:
> +          const: eswin,eic7700-qos-eth
> +      tx-internal-delay-ps:
> +        minimum: 0
> +        maximum: 2540
> +        multipleOf: 20
> +
> +  - properties:
> +      compatible:
> +        contains:
> +          const: eswin,eic7700-qos-eth-clk-inversion
> +      tx-internal-delay-ps:
> +        minimum: 2000
> +        maximum: 4540
> +        multipleOf: 20

[Severity: Medium]
According to the device tree bindings subsystem guidelines, YAML binding=20
schemas typically use allOf with if-then blocks to apply different=20
constraints based on the compatible string.

Does placing a oneOf block at the root level create a mutually-exclusive=20
validation partition that will break schema extensibility?=20

If a new compatible string is added to the enum in the future, it looks=20
like it might fail the entire oneOf block by not matching either arm,=20
causing the whole document to fail validation.

Could this be rewritten using allOf and if-then conditionals?

[ ... ]

> @@ -67,11 +89,6 @@ properties:
>      maximum: 2540
>      multipleOf: 20
> =20
> -  tx-internal-delay-ps:
> -    minimum: 0
> -    maximum: 2540
> -    multipleOf: 20
> -
>    eswin,hsp-sp-csr:
>      description:
>        HSP CSR is to control and get status of different high-speed perip=
herals

[Severity: Medium]
Is it intended to remove tx-internal-delay-ps entirely from the main=20
properties block?=20

Removing the property from the root properties block is usually considered=
=20
a schema anti-pattern. Should the base property definition remain here,=20
with only the range constraints being overridden in the conditional blocks=
=20
above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610012727.848-=
1-lizhi2@eswincomputing.com?part=3D2
