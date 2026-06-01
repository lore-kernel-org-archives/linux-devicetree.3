Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FCC3AE1B1;
	Mon,  1 Jun 2026 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322521; cv=none; b=lOmLh6/AIRdMzZJf+WDv2kO36LtbxR1U/Sbser/FXMw4vyKT49TQuaQsg0URj9foUne+YAEeV965CVbOY+2R/TGL6vENlEEOwFYM1QBLfroAbEAjxFCs3HgKsDN0EBDTud5Opiv8qDHu9cX1UamcSis1FIu+a/uwhJYPR/G7ick=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322521; c=relaxed/simple;
	bh=Cra9fmD3c/tZ2nrGUFTy1mewwpByps8ZrH2TKYpIQ/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GUlxA/kU+Gr2ShVTYmHTvf5q90paUUB+m9UTy9TIpj8AQWd4v9qgHmkm2GUKmqCnDMyUzJXeuOWo80+xli0wj8CnjgM3Yrn/ZEqdXo0aAlSad4ZxwhxzfBwBdqmeNvvsswy4vMmsBhQXdyxjWWGM7LKx/eV4W6jQqzaNOV3zal8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=xSKIwsHT; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="xSKIwsHT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BWbTpayQTM0Gx96Gg+SvhuaJwtUEzeScK/94+YHwkXM=; b=xSKIwsHTmTtIJ6L3wEy+XknIH4
	9MBclto9aEnpLIX5yR8h7wsgjAJGlFl45ufb+IJB1ihjF8qdXbejGjjYse9C7FBoBYz6772sqnYhd
	HBRtzPkpi3oeCtHQGwgjVK5ZSz4W2GRlfqv9Ob5fcK+GnhH6s/EEaDNkGHzhvpr32sKZ7bprEOwns
	NKxvwaBG57kUEDF6WEB/UwCwP+75q0wUrwyYFb2OBsti981mnVQgAmcQpmo+T3pXd6njW45K5J0RE
	F5uf5HXeojR0ewvF4ynjCWZRtHx7uTKrt8LDutFCw9lnDl1GPj5LXvs+fNkHhkU2c9B2+d+RZq0O9
	9caWjf/w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject:
 Re: [PATCH v2 2/2] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon, 01 Jun 2026 16:01:50 +0200
Message-ID: <13821740.F0gNSz5aLb@phil>
In-Reply-To: <20260601132529.139172-3-hrushirajg23@gmail.com>
References:
 <20260601132529.139172-1-hrushirajg23@gmail.com>
 <20260601132529.139172-3-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 1. Juni 2026, 15:25:29 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Hrushiraj Gandhi:
> Add the device tree binding for the Vicharak Axon single-board
> computer based on the Rockchip RK3588 SoC, and add the vicharak
> vendor prefix to the vendor-prefixes list.
>=20
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>

I do believe those also need to be separate patches.
One to add the vendor-prefix, one for the binding.


Heiko

> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml    | 5 +++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 1a9dde18626d..b023d4cc9842 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -1306,6 +1306,11 @@ properties:
>            - const: turing,rk1
>            - const: rockchip,rk3588
> =20
> +      - description: Vicharak Axon
> +        items:
> +          - const: vicharak,axon
> +          - const: rockchip,rk3588
> +
>        - description: WolfVision PF5 mainboard
>          items:
>            - const: wolfvision,rk3568-pf5
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66ae7b..504a691a33b9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1791,6 +1791,8 @@ patternProperties:
>      description: VIA Technologies, Inc.
>    "^vialab,.*":
>      description: VIA Labs, Inc.
> +  "^vicharak,.*":
> +    description: Vicharak Computers Pvt. Ltd.
>    "^vicor,.*":
>      description: Vicor Corporation
>    "^videostrong,.*":
>=20




