Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A49385D64
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462627; cv=none; b=sAat7PUJf9l2DA2oKlMeWbt6YvVrjYVDMNtzNR7nCtYHnu+tarMT6RJqXuYPJ48WAR0ZLUk8JRcyO2BWbZXlE1VzMIAPjsIoqbTgWs7RBiBetUhm3L5OT/As2ILZ6y4WD242DBJxfMHiSH/FcokaLKWDWHQGSdNydVLML8wmgR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462627; c=relaxed/simple;
	bh=ozRgD4+sccGInMFNRbW34oDIp+onlvJZ3Pep3pCP/QA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jp3txBoJ1sWXiuncPaq2sYo52JWafsFPgVYARqxev3xNzynYOLMkA/vMoK+/iePBFlX3dvtDbRho/fGyecX1YBYcCwMJu0NqBldjNEjzrBE5J0GqLNr5dWp5f3ZygbQ5/j/rOf9gGyJ3Exy2/Uhp4vwKLR/yVwuRKs0h2IEX7AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afOQ7FnA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afOQ7FnA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4421F000FF;
	Tue, 15 Sep 2026 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789462625;
	bh=JfTSHi+Nv6zPc8um5FBAk5XspUmAQX4Uqkbl5zoxT10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=afOQ7FnAHNLbffgbW8nPv0GTXFfaqsl5Xl7L9owviAv3N4U1Hb5mF1gqVP8pEb5Uy
	 xN8MxUH3xYxRlekKZRQGhU3of4XPVXo8mhTmwN5DZULI7kmEtK78H2tFS/YEwqCnvs
	 6mI9uPxwFe3lJKjzMbITC/Nsvld+WqpQckFsIttMuFbc0qiwMldgxsJ862e7ndjFW+
	 AzurpUvSiQYoiMzKcw1s3NfcohFRhNJC6GxLgJUVvPPhsohjhbURAaZO44lCYlcmGJ
	 S+ZVpZS3XR8NYmDalAZBXgFSY3dT9DBEyXwF/XUaaF5QSOfsQujSUpErgVWguXGRW4
	 qAbTUI49D+s5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 12/13] dt-bindings: display: mediatek: wdma: Add
 compatibles for more SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260915084148.11385-13-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
 <20260915084148.11385-13-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 08:57:04 +0000
Message-Id: <20260915085705.3E4421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: mtk-wdma: incorrect mt8173 fallback for 34-bit IOVA S=
oCs
--

commit 9abef195ff9795774aad1384f098d2674d2e411c
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs

This commit adds missing device tree compatible strings for the Write DMA
hardware in multiple MediaTek SoCs, including MT6893, MT8183, MT8186, MT819=
2,
and MT8195. It also specifies that MT6893 is not compatible with MT8173 due
to its introduction of destination addresses larger than 32 bits.

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
>        - items:
>            - enum:
>                - mediatek,mt6795-disp-wdma
>                - mediatek,mt8167-disp-wdma
> +              - mediatek,mt8183-disp-wdma
> +              - mediatek,mt8186-disp-wdma
> +              - mediatek,mt8192-disp-wdma
> +              - mediatek,mt8195-disp-wdma
>            - const: mediatek,mt8173-disp-wdma

[Severity: High]
Does using the mediatek,mt8173-disp-wdma fallback for these newer SoCs risk
silent DMA memory corruption or IOMMU translation faults when writing to
addresses above 4GB?

The WDMA hardware in MT8186, MT8192, and MT8195 uses 34-bit IOVA spaces,
which is indicated by the IOVA_34_EN flag in their IOMMU platform data.

When the DRM writeback driver configures the WDMA, it will be handed 34-bit
dma_addr_t addresses. Because the schema specifies the MT8173 fallback, the
driver binds using the MT8173 match data.

Since MT8173 only supports 32-bit addresses, its driver data configures
reg_wdma_dst_addr0_msb =3D 0. This causes the driver to write only the lower
32 bits of the destination address, silently dropping the upper 2 bits of t=
he
34-bit IOVA during normal display writeback operations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915084148.1138=
5-1-angelogioacchino.delregno@collabora.com?part=3D12
