Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED17481AA0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910643; cv=none; b=oxK3flCJAu5zwxHSqHKuf2TsW5ss61OZWOSE3bObgYcbK/DMAY6etefOmyLnHQIzpZB5lv2TGi4RiYPIl4rixoCktC89piIS5FqC4ObkzUitOMcsE1NGAavZaaNECFirKcB4ZCHJ768UB5YF3/uisbRba/TDd5BBKz4Ljju3S18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910643; c=relaxed/simple;
	bh=3Jn8Ed94RWbe0AUf5k5nE4v6KJoNjNJR60jrCJr9btU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cWOgnl4BcW6NyKPdk/Binz4atlnGWkAt3574Uy7TDmA2ZNP2WPOTNAFkPwxmFwLEXULgWITL4fpLEuUUT+QrFwKaPpLaIEygsaoZvmZHZvc5Xno8//jNp1qZqLHt7vNhw6X+pw8lxFDMdyA+93lrMzvVtNI/b16n7XZpTrlgCGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zs6NrQu+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zs6NrQu+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734DA1F00A3A;
	Wed,  1 Jul 2026 12:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782910641;
	bh=gazRUy4HGPt5KoErkyQUB/LDfEuNgJSSN8L0Vu0YSzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zs6NrQu+rYcw2/7Fm4HNFX9kiI8AxFtfPjgNA704hmrU6tabMPliAte1ilFvtWgIr
	 6k6u+W16Knf6ci6NWJ8+KYA3bVKf2PCBSkb6+ymZ0HCb7x61U2QKZ/TeTZ3V+YQJsH
	 PQzQBEJi07Hg8aWHQNiXbElFNYvHWcMahCFvSqEqUAu1/n3osjLMhmJoAmPqOqDMtp
	 Nq0GgyMnS/PVSzRz0GbZCMfYq0ZvtSFLb/PgozSuBDT/tsCUpxOVb0WZXCHAKruK8j
	 lvePtWbdsgrfSoRuYjywOQUcdBvlBI947vRqPB3zZhUNFFb9FQgBd2wl+XYWTB+um0
	 4SOjZ+KY9RWjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: mt8188: Add and use UART
 AP_DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701121929.19374-6-angelogioacchino.delregno@collabora.com>
References: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
 <20260701121929.19374-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:57:21 +0000
Message-Id: <20260701125721.734DA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The apdma device node is placed out of order based on its unit-addr=
ess.
--

commit abad4b5e77dac5657d316ab360e0ca880d69701b
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

arm64: dts: mediatek: mt8188: Add and use UART AP_DMA controller

This commit adds the UART DMA controller (AP_DMA) to the MT8188 SoC.
It also assigns the respective DMA channels to the four UART controllers
to improve data transmission and reception efficiency.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index 75133794cec38..8f01d95e6d7d9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1338,6 +1338,31 @@ systimer: timer@10017000 {
>  			clocks =3D <&clk13m>;
>  		};
> =20
> +		apdma: dma-controller@10220880 {

[Severity: Low]
This isn't a bug, but should this node be placed further down in the file
to maintain ascending unit-address order?

The unit-address 10220880 is placed here after timer@10017000 but before
pwrap@10024000 (shown below), which breaks the numerical sorting convention
for Device Tree nodes.

> +			compatible =3D "mediatek,mt8188-uart-dma", "mediatek,mt6835-uart-dma";

[ ... ]

> +			#dma-cells =3D <1>;
> +			dma-requests =3D <12>;
> +		};
> +
>  		pwrap: pwrap@10024000 {
>  			compatible =3D "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "sys=
con";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701121929.1937=
4-1-angelogioacchino.delregno@collabora.com?part=3D5
