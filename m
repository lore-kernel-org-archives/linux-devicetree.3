Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A594B0495
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595915; cv=none; b=m3kGlLN9Y7r9OxIRqKTjuuCCdNIcz685AG2BvvRcUMJ7uHhslnlKrE7O0kSE4oDr79GA+fp4kXgJddXyimEplMTmxE0htvdX+IOAqrIQx27qWYE3odH4PKDpZ5rLO5CXuGun/FSN3ZlzZOes4YG03TwVM80Nx7GnmIby4+jmHTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595915; c=relaxed/simple;
	bh=bMF9y5bCDe8euu3Y1VHzVscrDwhEN7VUHkJg8I8rFTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GBuWcgm1KlnbGEN/cz4+BaBcdENBmARHXJ6h/rRPfmSj/Rcxgq3hQkT0uRmbf2hboYrAUBEDOOjz2CPqVg0Hk1zj3aoGSDcS+81sqyNorWsSq0TQwoW/B1jMCmrOoOaFHsUK23JAbp3UAufVQS8DMcYc2B+OZlsvbTDNWNNDi74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zx73RhXo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zx73RhXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7541F000FF;
	Mon, 28 Sep 2026 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790595914;
	bh=S/BI2i8bwkL7AQdY9NrIJasT/ttW/2J1HKDpsvslWIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zx73RhXoc954ZjL9hDVTX8EGW4eglxsjydz5bsDpFCqAgv7a+k4URA7NPwtJ+ywqc
	 WPHPDgsBkPTABlfCTr7x7+gvqlfB8OI0WVqSIiqy7Lh11I4Emi9ETuLmBNqkzDSjfi
	 A9pBh7s7F3W22OXH8NYdaZMjfaNu6HCqMim79Pk5G+Qm1SjzxjPl3LU/xmrYl6OtF6
	 JgoFJST1GSVGVZJScCP0aLF0QhR7LWCpsY471HSYh4p9zvcqtPztwNx/1szOhh5L5O
	 Tngdyvod/zdhqqxL+mt/9sHIacfkmY5LqElY82k0TEO8nH7yjeCmW1WwLUUIZo6/s6
	 y/Wa/KMkoUTjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] SoC: dt-bindings: asahi-kasei,ak4619: Add PDN GPIO
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Koch" <mail@alexanderkoch.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260928114019.1441752-3-mail@alexanderkoch.net>
References: <20260928114019.1441752-1-mail@alexanderkoch.net>
 <20260928114019.1441752-3-mail@alexanderkoch.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 11:45:13 +0000
Message-Id: <20260928114514.4A7541F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing gpio header for GPIO_ACTIVE_HIGH
--

commit 8c4430d8f688f6a14fffa90ba8e9b1227185a45b
Author: Alexander Koch <mail@alexanderkoch.net>

SoC: dt-bindings: asahi-kasei,ak4619: Add PDN GPIO support

This commit adds documentation for an optional pdn-gpios property that
enables operation of the PDN pin during initialization.

> diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.y=
aml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
> index 2e81947bb8dd9..bc173811a8c46 100644
> --- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
> +++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
[ ... ]
> @@ -49,6 +55,8 @@ examples:
>              compatible =3D "asahi-kasei,ak4619";
>              reg =3D <0x10>;
> =20
> +            pdn-gpios =3D <&gpio1 0 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does this example block require a #include <dt-bindings/gpio/gpio.h> direct=
ive
before using GPIO_ACTIVE_HIGH?=20

Running make dt_binding_check extracts the example into a dts file and pass=
es
it through the C preprocessor and dtc. Without the header, the undefined li=
teral
causes dtc to fail with a syntax error because the GPIO_ACTIVE_HIGH macro
remains unexpanded.

> +
>              clocks =3D <&rcar_sound>;
>              clock-names =3D "mclk";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928114019.1441=
752-1-mail@alexanderkoch.net?part=3D2
