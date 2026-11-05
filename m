Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855685;
	b=3YvmWv4B/pU7Gmewi0IL5T8Wc6cuRG7/VHnNyRNTY9phJ7xGdYfYGgYT15xVqOJOIGDv
	 2sfhxpv1Ld/Fbl8iBuL6mMCol6OohxF42J8cHukpOlaw6fVwZHb6/xuWw36gl/xmGYhAP
	 BhfFFQmFFOHXQXwJlTVX60BB+tXd88u6jkTKBBWT9PfyC2QMAlnCjt2AxrdZ0QTaWUDvE
	 c8ZY2Lave8T0Q//NVkxBodJwB58TOBEdquhHqXf/KqiBsVLnyuDUvwA/Jlmcs5OaEOPc7
	 gD/bZez90jfsMr1pL0/xGxpTduiGW/jUItIViLA1Ifxm5xKuCvT41OyqcJ14OGJfEXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855685;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u5GY4Klv1SwgzdqOaVxHqGUvMWVJ2na6OVKsc4M2Ahs=;
	b=I4mhCkJAgWEfjH8GjGCztuRbrHWRlutyKmX+butKUsoizWtu2L8qGM/eGQJ3yQ7uCae6
	 bSfj8kBhwBRM2yzB/iqPo5pYyO7tK/PR8fJWwTcJwiWkv7VFVzfahEfEp538y8LAdwpOT
	 eCR/w+sUVVsn5myEljrGiMk3S4+mBwaZ4+zyuHFpMM6oBudi2a6ZcPjx11VMslkdnKt2o
	 5AIErMXi5hkOvNHVYXQKi9E2VPIcu+nVATQExIQK5msemlxphTIj/JhgvzQ2FZZCWuBeU
	 MI/R9DWF4mm1O6CqLOx6wFcE6ETjnb4OcV45xRJxWjSKFLLGvOq4avZnQYxN2vkU99Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E70Lwa1m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780FC606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 05:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E70Lwa1m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0A41F00919;
	Thu,  5 Nov 2026 05:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793855685;
	bh=u5GY4Klv1SwgzdqOaVxHqGUvMWVJ2na6OVKsc4M2Ahs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E70Lwa1mu59/9AFyEoElnO0ge/GY5Oot/xHxlitN4XMIwwx5dXEeMwFAVwqmBif2Q
	 bYiq2lU0BI4yz+3rhkqse32Br/1rkQ1ahcdZjm4RBHOiKic8jaci5f6i1WnLrKoTCK
	 U5c5KukdEd87a2tfnL6iuZ404zdoqlaV0gBA/lIpW4gGz7j2BYgoAMsP3t+V2PcqCk
	 SjoLdoxZjkwZvtGQlstxdR91bcHNOOVYF6RlLgpBQNSwyM73u40eNEXm/negU7ydA6
	 k4Z0idiRQbHy/8/smknMRpt74dRd/ZzK32ipHfVFzQTrTF16QhkHbAcT0vm/VBuc+M
	 B1oxTarYi1OoQ==
Message-ID: <sashiko-outbox-198579@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 2/7] dt-bindings: net: ftgmac100: Add
 AST2700 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-support_ast2700-v5-2-44057f4dde75@aspeedtech.com>
References: <20261104-support_ast2700-v5-0-44057f4dde75@aspeedtech.com>
 <20261104-support_ast2700-v5-2-44057f4dde75@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 05:14:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: ftgmac100: requiring phy-mode on AST2700 break=
s use-ncsi
- [Low] dt-bindings: net: ftgmac100: split Aspeed binding instead of adding=
 if-thens
--

commit 761317ab12f9bb253e49b616ba9665479d666ab1
Author: Jacky Chou <jacky_chou@aspeedtech.com>

dt-bindings: net: ftgmac100: Add AST2700 compatible

This commit adds the aspeed,ast2700-mac compatible to the FTGMAC100 Device
Tree binding schema, allowing the reset line and requiring the phy-mode
property for AST2700.

> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml=
 b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index c870dd0bda7b2..0a376b849a916 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -17,6 +17,7 @@ properties:
>            - aspeed,ast2400-mac
>            - aspeed,ast2500-mac
>            - aspeed,ast2600-mac
> +          - aspeed,ast2700-mac
> =20
>    reg:
>      maxItems: 1
> @@ -28,7 +29,7 @@ properties:
>      minItems: 1
>      items:
>        - description: MAC IP clock
> -      - description: RMII RCLK gate for AST2500/2600
> +      - description: RMII RCLK gate for AST2500/2600/2700
> =20
>    resets:
>      maxItems: 1
> @@ -80,12 +81,21 @@ allOf:
>            contains:
>              enum:
>                - aspeed,ast2600-mac
> +              - aspeed,ast2700-mac
>      then:
>        properties:
>          resets: true
>      else:
>        properties:
>          resets: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2700-mac
> +    then:
> +      required:
> +        - phy-mode

[Severity: Medium]
Does unconditionally requiring phy-mode for aspeed,ast2700-mac break schema
validation for nodes configured with use-ncsi?

In Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml, use-ncsi is
documented as using the NC-SI stack over RMII without an MDIO PHY, and the
first example in the binding specifies use-ncsi without phy-mode.

In drivers/net/ethernet/faraday/ftgmac100.c, ftgmac100_probe_dt() checks for
use-ncsi before reading phy-mode:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_probe_dt() {
	if (of_get_property(np, "use-ncsi", NULL))
		return ftgmac100_probe_ncsi(netdev, priv, pdev);
}

ftgmac100_probe_ncsi() connects a fixed PHY with PHY_INTERFACE_MODE_RMII
directly without consulting phy-mode.

Also, the commit message mentions matching the driver's probe-time
requirement, which in commit e655d4e27cbf2 ("net: ftgmac100: Require phy-mo=
de
for AST2700") was added to ftgmac100_mii_probe(). However,
ftgmac100_mii_probe() is only reachable when priv->mii_bus is allocated by
ftgmac100_setup_mdio(), which is only called for FARADAY, AST2400, and
AST2500, and not for AST2600 or AST2700. When phy-handle or fixed-link is
used, of_phy_get_and_connect() already requires phy-mode across all SoCs.

Should phy-mode not be unconditionally required when use-ncsi is present, or
is this AST2700-specific rule unnecessary?

[Severity: Low]
This isn't a bug, but since the Aspeed MAC compatibles (aspeed,ast2400-mac,
aspeed,ast2500-mac, aspeed,ast2600-mac, and aspeed,ast2700-mac) are standal=
one
compatibles that no longer fall back to faraday,ftgmac100 and diverge in
clocks, resets, use-ncsi, embedded MDIO child nodes, and per-compatible
allOf conditionals, would it be cleaner to split the Aspeed MAC binding int=
o a
separate schema document rather than adding more per-compatible if-then blo=
cks
to faraday,ftgmac100.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-support_as=
t2700-v5-0-44057f4dde75@aspeedtech.com?part=3D2
