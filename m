Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992687;
	b=KbLAXUgZ3GW9ed0cCClSA9anvtMrGP4TdxM3Pkyx47kSlWHrkGL7EkNMODpUP6vyLeLe
	 HxNJPq5O2/Xy8XRvGlpyqvQgfoJtAPCexHws5NPzViTwr26lq8b4u2lswUKQpxZnf4JEe
	 HWK65iL/Ko5L1F5fiARXK8UxIsRkvuqlNakjv99VYSWwJoF2Mm5WDD8NxEeZE1caiVY6p
	 fggRl243wnQ0h30Gj9dfddIwUHUgyRKuyBijkexey5WaQ256gNYJcBKJs81pDA7rVBBfM
	 VHVNMWGin5xAaJi5xed7PIoZ6JkcwbsNQ+hojl/aVU2wFqErv1Tz9wmMP2T1PViewuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992687;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lKtGfND7ReA7G8QzOujn+8ETfdlUDZsWx5/6cm7cKXI=;
	b=PiuLIH4gyid1ztr8n3zAgbLALlW1mwb4ro371v0M6QzrayVr2Wzt+6wo/418m0kQLKbY
	 ZwzuKsaD6qpaM6cH0cBUH0PzX7+NgqxoVEabar50QEbIUxbQWNwwJpbCdUwYoKBJyXr08
	 QvukMvJxZHJxg8GvnjqTas6YyxayHO4hWxOMo/ShTzijCZ1nEAyqKn7hwOE93f35rD6c7
	 cCSo4KL95B4Ccqh9azf+/GUOLAkUURMPbOzcrd1WW9d399yMKwKh6hCzNCGWcupCXp8IY
	 iV7D7/n/bshaPVaotXnojHb2EodL7bTI+PRAgsjmdF9KeZ6dhnz11nI1vZ6O/BGxJWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q1Vm5RAZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C08C606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q1Vm5RAZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C141F000C4;
	Wed, 18 Nov 2026 09:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794992687;
	bh=lKtGfND7ReA7G8QzOujn+8ETfdlUDZsWx5/6cm7cKXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q1Vm5RAZaQM7dsuYu+qPzdxmeq5AOK3mTyIfdfJSpc5gO3+QtD4qy9RbNgx7WVOGj
	 NY4c1rceFfGYJaWcMlxefFiDHcLhebD1NhpbuJPK1KoLj/rL/zkzjulv2i0GA+E7Y8
	 IC1b6MaO5spEGxaIMbpWqS5T4zFYoif0aRfQZ9S+LTsIGYcvUOn/mZ+OSaTIYLz4Ea
	 GWVqS5x/370qGKBOPdPRG85iMbt8xXrnkA2OepEu2aO0SLBlNpnzTUrKI/YHoBmcvA
	 NPI48BCQ8kNfxlZ+sgGlmU05ESI9TOWvoE85PhL+Mr/HgRg6YrJo4cHhrUYzPcqZ1T
	 plKyXQBlxmS8w==
Message-ID: <sashiko-outbox-220526@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: rockchip-dwmac: Add
 RK3572
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunhao Lu" <1579567540@qq.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-add-board-ok3572-c-net-v4-1-4e9da569395a@qq.com>
References: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
 <20261117-add-board-ok3572-c-net-v4-1-4e9da569395a@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:04:46 +0000
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
- [Low] dt-bindings: net: rockchip-dwmac: unwieldy per-compatible
  if-then blocks
--

commit a665a5efbe3f2f5557e38aac986038f5502fc0a1
Author: Cunhao Lu <1579567540@qq.com>

dt-bindings: net: rockchip-dwmac: Add RK3572

This commit adds the rockchip,rk3572-gmac compatible string to the Rockchip
and Synopsys DWMAC binding schemas, requires rockchip,php-grf for it, and
deprecates tx_delay and rx_delay while disallowing them on RK3572.

> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/=
Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index e8dda1961ab31..d7b7bb0082357 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml

[ ... ]

> @@ -141,11 +145,22 @@ required:
>  allOf:
>    - $ref: snps,dwmac.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3572-gmac
> +    then:
> +      properties:
> +        rx_delay: false
> +        tx_delay: false
> +
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
> +              - rockchip,rk3572-gmac
>                - rockchip,rk3576-gmac
>                - rockchip,rk3588-gmac
>      then:

[Severity: Low]
This isn't a bug, but rockchip-dwmac.yaml already covers 16 SoC variants
across multiple IP generations and has accumulated several per-compatible
if-then blocks in allOf for rockchip,php-grf, clocks, phy-mode, and
pcs-handle. Would it be cleaner to split this binding into separate schema
documents rather than piling on more per-compatible conditionals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-add-board-=
ok3572-c-net-v4-0-4e9da569395a@qq.com?part=3D1
