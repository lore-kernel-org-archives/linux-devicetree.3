Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855685;
	b=eyjaCI7h1NCIGE1njb68hQAL6OSnOAx8iIRd+1yl7SY3nNspO6KFCU0VIC4upwz7R47g
	 LHeaLj+Um+dUqim316JPfwhg7fxCaXeKZxwjcItY41Tor2fV7PRfBD6bCMzshIAqc0l3R
	 Zgi58edxs44ne7folfoCaaSkh0yl0Duru52EhxhEmMg2MjQ7f/883EtL+X2Ea6XcZ/XGS
	 1FZzR4Oxdbs92BJ9SCx2yB7SCehflr9jKSJQfHlRKsVrAV/MiPEjGFILRTmddrU1mBBWL
	 YbEqZBCgLDarP3IA6rvMcQAODZE5FmXUl5frHn3lZEwYrjy5EegO7y16tRiRSLdjioA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855685;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f0A4kXfW2s9gJhPBUFF5dnmLkaj7W3w4Hek5lKP4wnE=;
	b=Xc9WNdaUKytQDnf6J2Az1t675xzhh3nNWEqPhtMfni/jl/a7SPZc/qH3CG7Em/Zgr7XK
	 Rqrfbjb4mDve13b4id1qLuLaGyYVjkGiHjE5A7dfyKaycwngnSY/qg9GobH6AS6dCu13z
	 z7drmF2lGGGhxqnXyzBtLKHwOozdE50fLxX48x+tzyrro7hGrsuWuReGPeW5oyI0J76B5
	 7mxx/UqwaVzZU/3c148AQWkBhcw6xndAP+7j6mYYclGLGl2OILo757UtJUHb0sQyp4mXj
	 jBnPFK1sGTu1hixeQFWnha7LxI5ufFnK28fH1fO+ag1eHfP89eHaQ8NM8vGmv7c3q2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJ8N1wgr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25388606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 05:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJ8N1wgr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E3B1F000C1;
	Thu,  5 Nov 2026 05:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793855684;
	bh=f0A4kXfW2s9gJhPBUFF5dnmLkaj7W3w4Hek5lKP4wnE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cJ8N1wgr7UQk28q6RV8w9SkJlb8Wy52E5/hkDmuOcpFZim7GFmMiZARp/snhJ/gxc
	 SYs1owdADduj6WHrmOEy0kxdOE3VSFsfx62H00sf6b32OdLDDquq03vT4LAFll6clP
	 SrjHCsGU0o0F2gPKIIofN/lkdpVVffMFbbsIlHe0Bzv7B6uInfOEQBhzYxEkDp32c3
	 SOhRv1ZLA1bJN2brERy5sZgfsOoguMgsdTXgZHon5TNOLdUOxgxQR4sQ29bbrOF9YQ
	 BhGZ/O8j5RZl17dpi9mJLRkaPCvZi1VlB8P6qnm0L+eu7duHXTlrK/wmU2AmruKp7E
	 ZpJW+Ft5fk/Mw==
Message-ID: <sashiko-outbox-198578@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 1/7] dt-bindings: net: ftgmac100: Make
 Aspeed compatibles standalone
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-support_ast2700-v5-1-44057f4dde75@aspeedtech.com>
References: <20261104-support_ast2700-v5-0-44057f4dde75@aspeedtech.com>
 <20261104-support_ast2700-v5-1-44057f4dde75@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 05:14:43 +0000
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
- [Medium] dt-bindings: net: ftgmac100: dropping fallback compatible breaks=
 dtbs_check
--

commit 95571d7f339ca9cf43fcba9a2d07a1737a0162eb
Author: Jacky Chou <jacky_chou@aspeedtech.com>

dt-bindings: net: ftgmac100: Make Aspeed compatibles standalone

This commit changes the Aspeed MAC compatibles in
Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml from requiring
the generic faraday,ftgmac100 fallback string to being standalone compatibl=
es.

> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml=
 b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index d14410018bcf6..c870dd0bda7b2 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -13,12 +13,10 @@ properties:
>    compatible:
>      oneOf:
>        - const: faraday,ftgmac100
> -      - items:
> -          - enum:
> -              - aspeed,ast2400-mac
> -              - aspeed,ast2500-mac
> -              - aspeed,ast2600-mac
> -          - const: faraday,ftgmac100
> +      - enum:
> +          - aspeed,ast2400-mac
> +          - aspeed,ast2500-mac
> +          - aspeed,ast2600-mac

[Severity: Medium]
As reported by Rob Herring on v4 [1], does removing the two-item compatible
entry from properties.compatible in
Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml break DT schema
backward compatibility and cause dtbs_check regressions for existing device
trees?

In-tree device trees in arch/arm/boot/dts/aspeed/aspeed-g4.dtsi,
arch/arm/boot/dts/aspeed/aspeed-g5.dtsi, and
arch/arm/boot/dts/aspeed/aspeed-g6.dtsi still declare their MAC nodes with =
the
two-string compatible form, such as:

    compatible =3D "aspeed,ast2600-mac", "faraday,ftgmac100";

When running make dtbs_check, every board that includes those .dtsi files w=
ill
fail validation against faraday,ftgmac100.yaml because the two-item list is=
 no
longer permitted by the schema.

Should the existing two-item compatible entry be retained (for example mark=
ed
with deprecated: true) alongside the standalone enum so that existing device
trees continue to validate cleanly without introducing dtbs_check warnings?

[1] https://lore.kernel.org/r/20261020181441.GA510274-robh@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-support_as=
t2700-v5-0-44057f4dde75@aspeedtech.com?part=3D1
