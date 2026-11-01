Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793522264;
	b=XLFQnWpepSMgCUhUSENLLzTplOdLijSeN0lm6YggRPbyuzAMo4igtT1ZwwRk04fudoi/
	 YJGao/q/y4U3ZnUNISe5tbxQHDw6S9Sg9H6GnG65i9ZjjdEG5Gh0G935w3SiWTw94l4zY
	 NQcQY8+3NoN/muDP0r90njuwPphJShQUbHamAcsaI1xYYv562F16gKcU+Bc/bfa87DrXD
	 5dvwsUzB8HsHhpRlozig0LCl8FUcTBQAf0L4RNam6Etx56qhxt2O5HOAX3zufFrgC4+sf
	 AZnvU1F4CVetZfL3gSH265GZxlhdNN8JCXXGfBwp6SpM6nV8a+Aa4EByz7EUV6Qu2ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793522264;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s8ynbOzbDYPDsC94LHqxD8cYq8ZNmPgFJ74SCas7Q/k=;
	b=jviBVz4X4+kmSl65LOVK1XYYuVnC/lfP85KmFFHuPehl4L9v85BROOFOBxbmXrECW9jt
	 yEqLIpL1RiiU4oCTP4YXFSvG+6r4tp4zqd8TF5wHpHhv/1ghg//GdI5RAjxIVFQphHX5R
	 kcIYZC90qLEL7ay0KxDMKr6+GzUDFbGbdNauj0POPUI3S6Ay6vmVBfAR7kIQLe0tn5cqH
	 Iyymu0Okk8lEh0X8L69NsJKuS6cNNMzsyq4mYeDcLksttqjtZx70nXQUmyh0iwUxOvmtA
	 GFP7aQTG2nlRqp4iUqNfEu39lg0AzQqut32lz1ZttY9mIBDZgOZ8K6FYsd+OPcvLVrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UicikaNG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3499606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 08:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UicikaNG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2371F000C1;
	Sun,  1 Nov 2026 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793522263;
	bh=s8ynbOzbDYPDsC94LHqxD8cYq8ZNmPgFJ74SCas7Q/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UicikaNGfHPT6G95+Zo2yjTvS2h51KZ8Mfo8nZERNV50WTXmuOfBmtqVEvzjhPvFJ
	 XUWAU8X/rQH8mOKU9kFRSyyjxV7qVGniygWS9CjVouueZ2JD3w9L2vn5BI+qYkr/Kf
	 cOZZf2LHH26zXCyXH88rNvZ9nB/HcSALz12GS0XnwCYdE4bEgRWqFQ5J1d9eJpTW8E
	 Wm4wU2KHKjmuL2Qdjp94GjoUc75J72+LMie+lQN4Yf5YU1ukZrkMxzFzGpWBYbfa2F
	 RIXa5iXOM1QPbveprycrLwTC8llK4EnScICc9n0mlTZFfTMdIxJJWxXq2M2wx32nbQ
	 GyTxRLv3RSfww==
Message-ID: <sashiko-outbox-192335@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 06/15] dt-bindings: npu: rockchip: add rockchip,
 rk3576-rknn-core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101082307.151957-7-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
 <20261101082307.151957-7-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 08:37:42 +0000
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
- [Low] dt-bindings: npu: rockchip: unwieldy per-compatible if-then-else in=
 rknn-core
--

commit 64ea8c4aa2d26a009304ed33c9932abdd0a2a97d
Author: Jiaxing Hu <gahing@gahingwoo.com>

dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core

This commit adds the rockchip,rk3576-rknn-core compatible to
rockchip,rk3588-rknn-core.yaml, widening the top-level resource properties
and constraining each SoC variant with an if-then-else block under allOf.

> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> index caca2a4903cd1..3b611b64c8aa0 100644
> --- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml

[ ... ]

> @@ -75,7 +83,40 @@ required:
>    - resets
>    - reset-names
>    - npu-supply
> -  - sram-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-rknn-core
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          maxItems: 4
> +        power-domains:
> +          maxItems: 1
> +        resets:
> +          minItems: 2
> +        reset-names:
> +          minItems: 2
> +      required:
> +        - sram-supply
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 6
> +        clock-names:
> +          minItems: 6
> +        power-domains:
> +          minItems: 2
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
> +        sram-supply: false

[Severity: Low]
This isn't a bug, but adding rockchip,rk3576-rknn-core to
rockchip,rk3588-rknn-core.yaml requires loosening the top-level definitions=
 of
clocks, clock-names, power-domains, resets, reset-names, and required, and
then overriding all six properties in the allOf if-then-else block.

Since the two variants differ across most of their resource properties, wou=
ld
it be cleaner to split rockchip,rk3576-rknn-core into its own binding schema
document rather than adding these per-compatible conditionals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101082307.1519=
57-1-gahing@gahingwoo.com?part=3D6
