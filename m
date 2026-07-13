Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21AE41930C
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948442; cv=none; b=J/YR3VEJgJg9PqHb3zroHkSicGKtZ8odZOQdhS7JLaFoJa7+yr8yr9ooGoF/DAswExwWubnor8Wm0gc/6+951e/HrjW/0vwXTyNG/jvQN6heD5P9kmnU2mhnuuaNO+DiFd77C5nLckhQEUiHvEVtUSRuZY1rgypAL3Nc9Fu7fkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948442; c=relaxed/simple;
	bh=JuILF2cgHfEq6h9x+JRgvcWbdX8rXwB5atc5mVC/L2s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OcFCswy7EOAXRiiQnulGuzl3FimI00mbvu9YnCK2BFmuMqXMxsT6Plp3exDjbf9ie7iJDY9qVPHKJghvjFEY1GmMJRub5+hIeKKZE35obi4G2Xf4PcCY5WrBqpn/N2EewcvGxST3kSycXxmEEQVQUxYkMaHanzAS0HwVB1OhtlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHknMkhP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHknMkhP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A3A1F000E9;
	Mon, 13 Jul 2026 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948441;
	bh=PRLHanZMxbEdUq6B1EYlA36V+3uPBczIeUx2vKsLZfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JHknMkhPYcwdgoeZtKmaTjbZoGMg95r9f6GU2OWbt9M+0xo/wuxsLmIQCk/7UfDae
	 XDJitCBGVLpjNCZ/SaLWNTC8k6DozhdNfFRl0J8cwim5k7kBVaUbzIyMUz+j83/RxE
	 /1y6NwLtGvSaAQq62wdR0oEpjTt5aQf+rsvCKQ2jkfp1Nuglfjrhx6Zc7aubbFi8/x
	 HfJCNQfnxSjLU73WiuEZxlb3afVwP6VAmiXKQsfF0Me40SskhyVJ+9uOF0jOplQu6P
	 ejWWSU0798rkpyASwUixThlbxj+y5bXVZArXSYqQB6srsoVPxtLBTyw8ScCCtKrng7
	 5QP/AiTgaf/QA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/10] dt-bindings: display: mediatek: wdma: Add
 compatibles for more SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260713130103.34654-10-angelogioacchino.delregno@collabora.com>
References: <20260713130103.34654-1-angelogioacchino.delregno@collabora.com>
 <20260713130103.34654-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 13:14:00 +0000
Message-Id: <20260713131401.02A3A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The compatible string `mediatek,mt6893-disp-wdma` is incorrectly=
 placed in the standalone `enum` block instead of the fallback `items` bloc=
k, which either prevents driver binding or fails schema validation.
--

--- Patch [9]: [PATCH v3 09/10] dt-bindings: display: mediatek: wdma: Add c=
ompatibles for more SoCs ---
commit c59d6955686a17afe19c1a5b4dee46c913103970
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs

This commit adds missing compatibles for Write DMA hardware on Dimensity
1200 and Kompanio 500/520/820/1200 SoCs.

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdm=
a.yaml
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> @@ -22,11 +22,16 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - mediatek,mt6893-disp-wdma
>            - mediatek,mt8173-disp-wdma

[Severity: Medium]
Will this cause an issue for device trees trying to probe the mt6893 hardwa=
re?

Since this compatible string is placed in the standalone enum block instead
of the fallback items block, a device tree node providing only this string
will pass schema validation but fail to probe in the kernel, as the driver
only matches the mediatek,mt8173-disp-wdma fallback.

Conversely, if a device tree provides the necessary fallback string to
enable the driver to probe, it will fail schema validation because the
array of strings won't match this single-item enum block.=20

Should this be moved to the fallback items list below alongside the other
newly added SoC variants?

>        - items:
>            - enum:
>                - mediatek,mt6795-disp-wdma
>                - mediatek,mt8167-disp-wdma
> +              - mediatek,mt8183-disp-wdma
> +              - mediatek,mt8186-disp-wdma
> +              - mediatek,mt8192-disp-wdma
> +              - mediatek,mt8195-disp-wdma
>            - const: mediatek,mt8173-disp-wdma

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713130103.3465=
4-1-angelogioacchino.delregno@collabora.com?part=3D9
