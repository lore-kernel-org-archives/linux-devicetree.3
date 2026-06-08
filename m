Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37EA33EAED
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899285; cv=none; b=WrsoK7AybIuZUn3T8R1+DoBumIkbSzQq4FT33aRc6DUH28uHEaa4hNT1txZ305erKE3uuvvM4DjDOiZYedr75DakCWTQPOMOQQ4YkoFTtexd8IBgaHs/IAmlzkHbsi5jBKj3LVbPy08f93mG5msyEkteY3Ebhi5KTqMdX23bMwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899285; c=relaxed/simple;
	bh=+0KZUmF8n25iPmGGl2LYZ+qG1xoVrR1EV0cl6iQaODM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b87pPN6Nc/y8d95X93clt+wyaamwVAw8zsv539CKbMtIChADhD5zW0s30s7viS3grrtmhV1duZ6vLCebbnWePjFaWWaDLqNPVL5QMj6QCzbpu5x4za+8BCn2pCP9+a7fPGvxSuGdfl67O04aUz6Id2zO+VEqO07RrltPypB6yvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtIGDBey; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtIGDBey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32351F00893;
	Mon,  8 Jun 2026 06:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780899282;
	bh=DX56CF1Sw/0nfXttnIA8rXQ/zQI3VxIUoa8PrEjQwZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OtIGDBeyaaFzafazQ2Xjm/tAKaUr+WnOr7J4Heg52IryMIDSvPoZQStZPozhOWPeq
	 qQTNsKEGAMVRESadZeoTP9Xq1ZAHyEZzjJ1Zxtb7XC2ppP5bcjm87la4CO+SfK7Uqo
	 0eXtPXlUcNUi/tHSlAcOsJ87MI500/7tnQZct44pD3ovXfW2Ti9NiLy1T2HD/xYePt
	 RGOcfwVGQdYpnjGLbLTyW0n7JPiPhq4j7LvSvFCTH8LOmC12hYkptXZ/ZaRNV0tWYX
	 wV3bNMjgWYhV6LrUk1q3GjsUhH3Qbalj30lGH8mzFxvBTQ1P0gk8mt+Vg9BkGvhwYc
	 Uql4pVebdF95w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: rockchip: add Vicharak Axon
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608060940.52549-2-hrushirajg23@gmail.com>
References: <20260608060940.52549-2-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 06:14:41 +0000
Message-Id: <20260608061441.E32351F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The 'vicharak' vendor prefix is not documented in vendor-prefixes.y=
aml.
--

commit 251502e367242a8cf17898614f2b1bad4718e71f
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

dt-bindings: arm: rockchip: add Vicharak Axon board

This commit adds the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 1a9dde18626d0..b023d4cc9842e 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml

[ ... ]

> @@ -1306,6 +1306,11 @@ properties:
>            - const: turing,rk1
>            - const: rockchip,rk3588
> =20
> +      - description: Vicharak Axon
> +        items:
> +          - const: vicharak,axon

[Severity: Low]
Does the "vicharak" vendor prefix need to be documented in
Documentation/devicetree/bindings/vendor-prefixes.yaml as part of this
change?

It looks like this introduces a new vendor prefix. Without registering it in
the vendor prefixes registry, it might cause a schema validation warning
when running make dt_binding_check.

> +          - const: rockchip,rk3588
> +
>        - description: WolfVision PF5 mainboard

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608060940.5254=
9-1-hrushirajg23@gmail.com?part=3D1
