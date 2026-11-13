Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559175;
	b=dvZqVi3J+HzUyJ9pA627N+0qr+jEzT6/vuuJbEiv8U99G3JH/AV2bkwGy/B9sSmJooBa
	 DCsEOO78ydNZE1T6dHmB9gzpbXoi03SDrSgikxJe63G6VQy6HvtILvHesygyZ1Xs7p3ch
	 hd/YZy5TlI4YkrahfLRQQRIvSEUSSIqfKE40OyYBz23QzLh/RZ6DqWC/S3GPsDLtwuAhm
	 7Y70/VnKKHuZkMWCCOQNDFbSGwIQqojPcpfjRemObVd39KYw7nGtClF0kIAJ9/V6QlxEe
	 T3FX8cD58u/bgOjw+mmUZ60irCmWTGeDrEtYhSNij8xaPj5a0/C1+FZw9iXGi1bwl/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559175;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uMHInBa+1d5mMtRd9ettUVokTEkOHL6sNnxedM/XEQE=;
	b=u8lXmiQ0BwPVFg/Oz245DEOTlptLn93mQnoS98otqCQAV3HL0XWJy17BuIdcxw1s97S+
	 IP7j384fkp82GkZQBx1XA2syXP61TlqscVTSRZyPfGsvo/+VJLmPrhnUwBNfmvhzAAxyJ
	 ScH0XMs+3GlTv3kTJgRoBwZPCEDHaNFcR8SzqR/qyIhQMiCq4j9zux0p2MevJufqM0zQV
	 UwmV2yNQ/X8zK35e6FvSCAcphzm27T4Y0ZEShKbu0AI6CRM2ZP15FTe1zlN6ub4SSW4LC
	 R+Y3ou55qJd6hMcG6umKRkRBlGh6YwA1Dw4oCS6VHIY4rt1M2dWAIfy2ScicExpdrTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C7ZJDlD7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F122A606B1DC
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C7ZJDlD7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5696F1F000C5;
	Fri, 13 Nov 2026 08:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559174;
	bh=uMHInBa+1d5mMtRd9ettUVokTEkOHL6sNnxedM/XEQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C7ZJDlD7TD9tE5gSWCxaWJl61R03mkswAz/dCHKI6H6zVGWXO1cONyrfOwELHYDOc
	 tVh1bumYii5iSUlsfkBG/QEldpqavS/WZwnZlRTry1BnpQC4w792FnrC3ELMpcej8h
	 ktfDa91CTH/wXJFReaTAvEKo0ESZO/QmkTAx1d/vklIBE9+sXJjzpMJAo815nOpyU5
	 dc/tzrE+V3Fayo7vEvHbLkdnL+oAi2RzpwdlPHNHlLWHFayaKInaILb4FKE0BpB2B5
	 fyjNak0oNrUk+rNfp0GGWD4AQVPDrGF3gckO6m6CoaaLV5t/uF1syT53x/v5Q0sOho
	 +dVGooJQmNa0Q==
Message-ID: <sashiko-outbox-212429@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 2/7] dt-bindings: net: ftgmac100: Add
 AST2700 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Chou" <jacky_chou@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-support_ast2700-v6-2-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-0-238020bf46cf@aspeedtech.com>
 <20261112-support_ast2700-v6-2-238020bf46cf@aspeedtech.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: net: ftgmac100: requiring phy-mode on AST2700
  breaks use-ncsi
- [Low] dt-bindings: net: ftgmac100: split schema instead of adding more
  if-thens
--

commit d4c79ebecc8b3f53e3b3064e58bdd5d5f51b3ece
Author: Jacky Chou <jacky_chou@aspeedtech.com>

dt-bindings: net: ftgmac100: Add AST2700 compatible

This commit adds the standalone aspeed,ast2700-mac compatible to the
Faraday FTGMAC100 Device Tree binding schema along with its clock, reset,
and phy-mode rules.

> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml=
 b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index 9d352e3686aaf..613d4f1caa4fa 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml

[ ... ]

> @@ -79,12 +80,21 @@ allOf:
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
Does unconditionally requiring phy-mode on aspeed,ast2700-mac break
dtbs_check validation for nodes configured with use-ncsi?

The binding allows use-ncsi without an MDIO PHY or phy-mode (as shown in
the schema's first example), and ftgmac100_probe_dt() handles use-ncsi
via ftgmac100_probe_ncsi() with PHY_INTERFACE_MODE_RMII directly without
reading phy-mode.

Also, the commit message explains this rule as matching the driver's
probe-time requirement, whereas bindings should describe hardware
constraints, and the check added in commit "net: ftgmac100: Require
phy-mode for AST2700" is in ftgmac100_mii_probe(), which is only reached
for legacy MDIO bus scanning on AST2400/AST2500/Faraday.

>    - if:
>        properties:
>          compatible:
> @@ -105,6 +115,7 @@ allOf:
>              enum:
>                - aspeed,ast2500-mac
>                - aspeed,ast2600-mac
> +              - aspeed,ast2700-mac
>      then:
>        properties:
>          clocks:
> @@ -124,6 +135,7 @@ allOf:
>                  - aspeed,ast2400-mac
>                  - aspeed,ast2500-mac
>                  - aspeed,ast2600-mac
> +                - aspeed,ast2700-mac
>      then:
>        properties:
>          clocks: false

[Severity: Low]
Now that commit "dt-bindings: net: ftgmac100: Make Aspeed compatibles
standalone" decoupled the Aspeed variants from faraday,ftgmac100, allOf
uses five per-compatible if-then blocks to partition resets, phy-mode,
clocks, and clock-names across the variants.  Should the Aspeed bindings
be split into a separate schema document instead of adding more
per-compatible conditionals here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-support_as=
t2700-v6-0-238020bf46cf@aspeedtech.com?part=3D2
