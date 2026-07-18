Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20E733EB0E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 07:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784358172; cv=none; b=Dh0WiB6XfgYrqaDfkteNBbAyYnn5kCjGfWiIf7sXKxCmmQ8hD4dhftl0vYfBBUcDCVTu2L+T6pH1JvarEadgBA/+DRrHj2yMy/EXWxN9HyZLurWScnmqABjmIXQFJN7lBagj6WzJFH1ud08vjFG6HOhGVOKMkQNBdYcG69atg2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784358172; c=relaxed/simple;
	bh=cr55FIB+eMGeLzhVNgqdwlNjFjG6uA9gynx+KWYBhOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TjdSrSUM3iIIwIpc/8pieCAb+uBtxhaTvoYmOjd7iD+f+JeI3ze0WdMWutBMS/KPMu6q5FBWOmUUkkaldL/fIA2PysbHeTxBE6DTmMJ/DjQfbxBbrBHTxTwFIwGDcyVV2moSTWNZFPAxygq/4g88lBHYF7/WE0UKRcyoPQX18CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwCE+wFG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwCE+wFG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1141F000E9;
	Sat, 18 Jul 2026 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784358171;
	bh=xTG9vrYXYW6dDU9vACvdLK9ELklpqClJmajAC+U4hzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IwCE+wFGMKOg220U7hVFxJWTLViOIelqFmrm3VckE/lSWD1/UMMXImfHSfiDKaUsp
	 IssMbs2JpvlZFLcKuvW3sB1AXjh4ror1Fs3BDxk5C9IXx+lK8pN9ArJNB8WJnVSwHW
	 uxDhYxN+0x3EjN6DlZbIotId6aW4DZYL4YwcTydXkJqgf4OvhTWFwwjWvKU55v7oyL
	 2Z1Nadr6gd5iEaOjsY88nDd51PNOUvBMtPSLUcNozxUMPIjP6p23CtIqh+xuCBtYS5
	 R76fELq6XCsgSk88qEYLxTzNySaJ1eBB5L/WvDSETnaNCrA7H0ttEcQFm/jOc3VaEk
	 iGx1vMbC03ylw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260718065900.755631-2-hrushirajg23@gmail.com>
References: <20260718065900.755631-1-hrushirajg23@gmail.com>
 <20260718065900.755631-2-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 07:02:50 +0000
Message-Id: <20260718070251.4D1141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new vendor prefix 'vicharak' is not documented in vendor-prefix=
es.yaml.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaam=
an board ---
commit 83c52c932b9201d9be9114ede15a03da032999a5
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

dt-bindings: arm: rockchip: Add Vicharak Vaaman board
   =20
This commit documents the compatible string for the Vicharak Vaaman, an
RK3399-based single-board computer, in the rockchip bindings.

> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
[ ... ]
> @@ -1306,6 +1306,11 @@ properties:
>            - const: turing,rk1
>            - const: rockchip,rk3588
> =20
> +      - description: Vicharak Vaaman
> +        items:
> +          - const: vicharak,vaaman
> +          - const: rockchip,rk3399

[Severity: Low]
Does the new vendor prefix vicharak need to be documented in
vendor-prefixes.yaml?

When introducing a new vendor compatible string, the prefix must be
registered in Documentation/devicetree/bindings/vendor-prefixes.yaml.
Without this entry, schema validation tooling will report an error
when make dt_binding_check is run.

> +
>        - description: WolfVision PF5 mainboard
>          items:
>            - const: wolfvision,rk3568-pf5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718065900.7556=
31-1-hrushirajg23@gmail.com?part=3D1
