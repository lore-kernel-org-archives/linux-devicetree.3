Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB8438022
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953742; cv=none; b=VPh0gN3fepjIdP31WuSYgn5HlLVdWxICBI+TyXqLdXPJ/Z5v5xQ1OHV5ac+1NNhLhaj/567BOJ+mO26+inrB6+tEMwHjp+ozcj85ALRTeGtaiPrf6T1iaMFcmK8fY4qPTcePKcRN3tt7SWzxRphF6pfICURh+xhMqCWhAc+Jmxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953742; c=relaxed/simple;
	bh=A3nAgZCcILRZihtlf1hSZPiEwEHWmCux4P7TVKnPVf4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P8cyA7RB9M3nwrUYP2zuaGRj87dbcrwMQZ6xQzGvEanqMCizM/38pK3WTU9njB+XG9UEWk3Z9X4C4toeZPWBykK8Q/ob0vFuS9HmcR5ZUXExE8v+PFuL+8avDJ2AdaP0BnQGzSkQGOkQVkNhxOaOifVifdgd3YgssLDcAHAdKmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1dWm8LZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1dWm8LZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4F91F00A3A;
	Mon, 13 Jul 2026 14:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783953741;
	bh=Ndyus4C5pLtwG8sU+06pp+DBs92OiWXZdXuF0XPFvvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S1dWm8LZN1Od1U2Oxen5xddFLVClqI2e+Kk5+TMw64VwxbIyWTtViLqLfX34L2LiN
	 R/1YkvtPgaoNVB8ovY5OlU/ZMuCJzihfaXPmODmeC7Nqh1LKqcoonR00Hx0FtuP/qH
	 mECmGD9fAmQMEDEVKJWT+UTKWasqwP1WjjlY8OtY6/CqJL18qvhknPDMNaLhpGqWcm
	 HKFhrRAJeS799rCEnACAeqy6e01SerAI7VdKz7w3ZvRyjN642gCyGvXcoHFT9za2xe
	 8Xu9bTdEYoT3RGMlX9iwJk5CcBpzPXSFe1J0+/tA8a9BJbbX8K613u43kO+p7S+Er4
	 HMN+nlwpJn9Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/10] dt-bindings: display: mediatek: wdma: Add
 compatibles for more SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260713142746.40259-10-angelogioacchino.delregno@collabora.com>
References: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
 <20260713142746.40259-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 14:42:20 +0000
Message-Id: <20260713144221.2C4F91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The compatible string `mediatek,mt6893-disp-wdma` is incorrectly=
 added to the standalone enum instead of the fallback items list.
--

--- Patch [9]: [PATCH v4 09/10] dt-bindings: display: mediatek: wdma: Add c=
ompatibles for more SoCs ---
commit 8001f83833ae9c684be67bc719c7aaa056f90763
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs

Multiple MediaTek SoCs have the Write DMA hardware in their Display
Controller. This commit adds the missing compatibles for Dimensity 1200
(MT6893) and for Kompanio 500/520/820/1200.

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdm=
a.yaml
> index 97d052b0fb614..c3ed867d058d9 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> @@ -22,11 +22,16 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - mediatek,mt6893-disp-wdma

[Severity: Medium]
Does this incorrectly place mediatek,mt6893-disp-wdma as a standalone
compatible string rather than in the items list requiring a fallback?

If a device tree uses compatible =3D "mediatek,mt6893-disp-wdma" to satisfy
this schema, the DRM driver will not probe the device since it only matches
mediatek,mt8173-disp-wdma. If the developer instead provides the fallback=20
compatible =3D "mediatek,mt6893-disp-wdma", "mediatek,mt8173-disp-wdma" so =
the
driver can probe it, won't the device tree fail schema validation here?

>               - mediatek,mt8173-disp-wdma
>           - items:
>               - enum:
>                   - mediatek,mt6795-disp-wdma
>                   - mediatek,mt8167-disp-wdma
> +              - mediatek,mt8183-disp-wdma
> +              - mediatek,mt8186-disp-wdma
> +              - mediatek,mt8192-disp-wdma
> +              - mediatek,mt8195-disp-wdma
>               - const: mediatek,mt8173-disp-wdma

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713142746.4025=
9-1-angelogioacchino.delregno@collabora.com?part=3D9
