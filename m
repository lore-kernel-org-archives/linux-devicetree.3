Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A26C145A1F
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194519; cv=none; b=Z7kdmZdgtUakRL7QvkORGhFj9Y38IUumc6L/L807/Yf+K3oqSOW9XTqtCNxcRh8XNaCMVDB0AikOrVs4ZvM6HVZVkBv4JTUss05uO6rrnoh1wNZQr35Np4ewOoXl78+/VfW64UHvslc7HeSpeutPhaj58jueMJb7zJqcIK647Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194519; c=relaxed/simple;
	bh=MQluaJGw9n2HNIXkhN1ZjTS36+9IvxesyPgKgyyAUnc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sqTSGr8dJKKhNUgrMSWF5r3KF6HsNYouI/xn59P417aPSR93zprZrI4zafdNckLLaJgG0+u9ZOPzYA7yk+kyiKBj/LlymLI/9xYakVV3lz/jCksp2rUKMO/OrJo7NER3XlBCG5u9Kt0P3809Q9RNLD+nYgVniHrLe05GqfdqqIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXGR344d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXGR344d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7519E1F000E9;
	Thu, 16 Jul 2026 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784194517;
	bh=a7z+0cPVGBT90fkjIxSj0ysC5eqVmwdQ5TxY0mCyO6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gXGR344dodaKM6FJcH4IdkKAn9UUKFEoTcYG8cFQPO3OwhM1E8+R5DRMkxWSeGSQa
	 OeMZhqS2uxdy3g7zmTl7R1euYx+vkfwCPLXrTlX1DQlmEFrUzTwv6yAkEQLdhtADJp
	 Vd2c+sTl0QWjdalc02SdqlBRQirkMp0qCHThK1BsyI5fcDZUNvVpOasX5ngIR1xPMq
	 L/mbjHXnjLb4sM//MYTW/lIaZCrm1ac0P4eKa4whUqDumQJVSnIW+9k09OlNDYMfJ6
	 lfW6p7saiR6oKIQTFXS68V+jj0nlRSVaEB5mav6gVuqrwmbB6kl2kYnUOa79PzJ2Qs
	 oFEWFZDrOO1Dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260716092859.512306-2-hrushirajg23@gmail.com>
References: <20260716092859.512306-1-hrushirajg23@gmail.com>
 <20260716092859.512306-2-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 09:35:16 +0000
Message-Id: <20260716093517.7519E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly introduced vendor prefix 'vicharak' is used in a new comp=
atible string but is not documented in vendor-prefixes.yaml.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman =
board ---
commit 64f97a8b2f6425cd87099ddd140688e38540d5e4
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

dt-bindings: arm: rockchip: Add Vicharak Vaaman board
   =20
This commit documents the compatible string for the Vicharak Vaaman, an=20
RK3399-based single-board computer.

> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 1a9dde18626d0..7cfd3687768cf 100644
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

[Severity: Low]
Does the new vendor prefix vicharak need to be added to=20
Documentation/devicetree/bindings/vendor-prefixes.yaml alongside a=20
description of the vendor?

Using an undocumented vendor prefix will cause make dt_binding_check and=20
checkpatch.pl to generate warnings or fail due to schema validation errors.

> +          - const: rockchip,rk3399
> +
>        - description: WolfVision PF5 mainboard
>          items:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716092859.5123=
06-1-hrushirajg23@gmail.com?part=3D1
