Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793343338;
	b=KK3gTeoRBAeJgB8p7wAjtMl2QU3S8IEZsXYaD7aoKJStsWQY784pHHMm9sJ/IUyJDlat
	 TDGJsVuCn4S57YEu5v4qOdZWBmr5SW0Ykq09yvKCPzUjKvpy1Q4jad1VfMv7hvHjeHtZ/
	 93IG0a6vVZUMEEe4M8EwaTb5mxjR5b0a2dyxmikMbt0r0rmrQG4DdLAiLFwKgg8Pt72sO
	 M+CL+stsx79Nj1cRySSwrxttAQVF7x8cpNIhihTo+H72qagMyBmPo3rFT30mIClXUtKUo
	 W1yHjoj85ByDJcTOuUB+gDrDSV+Be3eaQB0lvRkSvEQYgJshXtpBaYOIcprxdAF6VgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343338;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P9QrYaq/DkHGTDvTpt/LwceNqoTYAZ3bEDsNS1lBDO8=;
	b=SFyi6mDDyMVhbB3z/LNskFZEFTftKpIjRA0fGeAL11+kUb0VrOCR6OeOuxge+55u5Ojq
	 ZBDgl0B4DZG+uvT5OZ6J1UhWBEYShOWGuIXXakbP9YFfw4G9HbJ2qOZUWzz2prH7oSy8i
	 t/lplghTc/lgd98fabDvSEhLSk1Vq1hRiGf27EJkoegAK3230Qz17hMD3AW91Ek2M7q2u
	 3HaY1j5QIlG0j4AjMcbA7kcb8+3PbY6FJTvoOJNiGviNKU85iAzlhyzJi1tGG8QKZCVd4
	 AfhPigib3agL15Un0AsvwIucfbQnp7aIV91FaXAjwdQ+/4NIJeLT2k7/n//EkTUgJrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0L+1KCU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB6606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0L+1KCU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45781F000C1;
	Fri, 30 Oct 2026 06:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793343337;
	bh=P9QrYaq/DkHGTDvTpt/LwceNqoTYAZ3bEDsNS1lBDO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N0L+1KCU7gD0tUR70kHsd7E/hhsFrzeVs0qPM38fcNUO+u/N8H1EEHjllXNrcWZt0
	 7zkohh73xFr5X49vYoPcbZBcokmeVhuvm2TBQ9+cHUhAkDRpTUViHG2M0+yMShk1v2
	 yM53I+29/DI6vp5fZ1kHQU2luINy2Re77+JkijAyvWtu6LkqP6E9hCeY7ZYbNw2QFb
	 QtGyv8scIy91NYsnn+Jq1ZrvGQjeBPRxWYvrOn16akdSpcIKQnriD2hxJVh7vkMw2S
	 RTH3FQt6nwGufAsvgxOhQ53s9QRbHcVfnMG+Qdv7VnHfMx26Me+K7n2s2/iPqeezYl
	 R5VlD2U/lMgHQ==
Message-ID: <sashiko-outbox-190620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3568
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261030064905.2248999-2-damon.ding@rock-chips.com>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
 <20261030064905.2248999-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:55:36 +0000
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
- [Low] dt-bindings: display: rockchip: unwieldy per-compatible conditionals
--

commit 53ce09e99c75e142a328f4bf2e7535fad7dadeb9
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: display: rockchip: analogix-dp: Add support for RK3568

This commit documents the rockchip,rk3568-edp compatible in
rockchip,analogix-dp.yaml, making rockchip,grf conditional and adding the
avdd-0v9-supply and avdd-1v8-supply properties for RK3568.

> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index 6548f157fd966..f3e70cc3a1236 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml

[ ... ]

> @@ -61,11 +72,25 @@ required:
>    - clock-names
>    - resets
>    - reset-names
> -  - rockchip,grf
> =20
>  allOf:
>    - $ref: /schemas/display/bridge/analogix,dp.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-edp
> +    then:
> +      properties:
> +        rockchip,grf: false
> +    else:
> +      properties:
> +        avdd-0v9-supply: false
> +        avdd-1v8-supply: false
> +      required:
> +        - rockchip,grf
> +
>    - if:
>        properties:
>          compatible:
> @@ -100,6 +125,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - rockchip,rk3568-edp
>                - rockchip,rk3576-edp
>                - rockchip,rk3588-edp
>      then:

[Severity: Low]
This isn't a bug, but with the addition of rockchip,rk3568-edp, allOf in
Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
now has four separate per-compatible if-then blocks governing almost all
Rockchip-specific properties (clocks, clock-names, resets, reset-names,
rockchip,grf, avdd-0v9-supply, and avdd-1v8-supply), with
rockchip,rk3568-edp matched in two different blocks.

Given these growing variant differences across SoCs, would it be cleaner
to split this binding into separate schema documents rather than adding
more per-compatible conditionals here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030064905.2248=
999-1-damon.ding@rock-chips.com?part=3D1
