Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930170;
	b=QYNuj0XjaBQNlNSKj5j8uB9nIlbbsVwDtKfkUbQltiG3ny5kKgO7CRJBk1k2d6M7tiJi
	 6rsZ+7SRQe6gbREsQLSh1JzdgsCUl9nQ9wGfTjT5X7ZRvHWYCdhr+9mpo5k9R3pL82uOO
	 8d0TWEo9396Qs2bGQaOSFAJiQshXGdzzCGkx3IavJyKNoecIvzfvd9+LtV6kMGIs9fHVz
	 TJq1k6Ac6BtUVcobUO6n9Gi0FGQVf9q5kKd9JkaH8DSt1KIXLFJtXzXwhNglcKws0eYM4
	 RXgZGeRU4VFryUGrII6yIgWYMZpVFX8XPUX9LDQx7hXUB/u4xxbuRpuZ7P17q8+FBHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930170;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oxCMTX2ipRj8XtPAQ39UyCucIcbg/w2OmQAPrLbnTjc=;
	b=ZaiFSQpYaHAwTUJQFJdbObuhPuAfAEQJBjbk6mn7VfJJnrYH4MwDfpQdvTXexqzpGmQ9
	 nGBT9CNQ0+9WLaaFE2v3gxjsEz5LtUlzYtkF0QYphx5DiBwyvaUKgAnJURZd7l7bI0zCh
	 AIBazfYRYerWbZixa7Inf/Jy/ZCYRuJOuYiehYu5Y3CTaWxKE+7FHpZvkkUdZkPXbbz8Q
	 qCTbqFQtFAB2d0FkLh5AqNMgkB9rbRkHsAH3BaEcwgDCJCuPrn18fsxzPnCErIu+Lqy+p
	 qpe6rHK7xw3MksKniW2262vyW6uEol/3yWWEJIagbYxPsZvE5WuUWJFg0T/MPjx/NLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uur9NZUZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7B606A330
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uur9NZUZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2128C1F000C4;
	Tue, 17 Nov 2026 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794930170;
	bh=oxCMTX2ipRj8XtPAQ39UyCucIcbg/w2OmQAPrLbnTjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uur9NZUZo+9CVD8A0LHwnHfd6/ou7c5cdhP+wE5CTirWx/A5N01/LBPM0Q1y7jalu
	 fkNYb5RmBDJILreO3Ts5xjzirfbhThyAYl+nG3JFPAab7YUbPquVfQH6Zi0Z3cnXPo
	 GVmNKUu+7t67rfLi97Acp7j1YGRIwdnRqffryVaRanpW/3mGkZR6i9fmA6irZ1RVF6
	 9JqHU8XkPPQWMBqkBpwXVjq029Rm/HY7jURQIVuBGaX0s3k85pXHBm36E8JV6JW2g+
	 RStjWoVrhG8ACOS+4F1P5F/3PEvj0G1KQLP1W4Dat49LpM35ZLK+pIR2SSjMsCGkRP
	 LU16fgY//Hubw==
Message-ID: <sashiko-outbox-219099@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: devfreq: event: rockchip,dfi: add
 rk3576
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-2-32ff1546b0e4@collabora.com>
References: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com>
 <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-2-32ff1546b0e4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:42:49 +0000
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
- [Low] dt-bindings: devfreq: rockchip,dfi: unwieldy per-compatible
  conditionals
--

commit bdcd31ac4a26427ac56de242bbee17f5338ad380
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

dt-bindings: devfreq: event: rockchip,dfi: add rk3576

This commit adds the rockchip,rk3576-dfi compatible string and its two
required per-channel DFI monitoring clocks to the Rockchip DFI binding
schema.

> diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi=
.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> index d6e06a9bea19f..964f1827496ad 100644
> --- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> +++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml

[ ... ]

> @@ -68,6 +69,28 @@ allOf:
>          - clocks
>          - clock-names
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-dfi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description:
> +                clock driving the DDR monitoring logic for memory channe=
l 0
> +            - description:
> +                clock driving the DDR monitoring logic for memory channe=
l 1
> +        clock-names:
> +          items:
> +            - const: pclk_ddr_mon_ch0
> +            - const: pclk_ddr_mon_ch1
> +      required:
> +        - clocks
> +        - clock-names
> +
>    - if:
>        properties:
>          compatible:

[Severity: Low]
This isn't a bug, but each SoC variant in this binding now has different
clock requirements (one clock on rk3399, none on rk3568, two required
per-channel clocks on rk3576, and four optional per-channel clocks on
rk3588), and this block duplicates the per-channel clock descriptions and
clock-names items already listed in the top-level properties and the
rk3588 conditional. Would it be cleaner to split the diverging variants
into separate schema documents, or define the per-channel items once at
the top level and only constrain minItems/maxItems in the conditionals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-rockchip-d=
fi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com?part=
=3D2
