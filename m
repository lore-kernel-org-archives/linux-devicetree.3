Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831693FBEA4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588622; cv=none; b=mA6PvA9uf0rMB5turQ00poZFyE0hOEi4qIoWvWl0oyaAiyMnAyNRKia9+ViDVhc9dx4M3XYgS0KHbnUMd9ZDxSwZoIYTkxtqJVMXyFQYXCzJRl9O1kCZFZSkzWFfkY1dGFDOBKYFXjQv1CLQ+CMR/vYpxIR4rD0kvF+dhtFIG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588622; c=relaxed/simple;
	bh=2hQtk3PLIWgMmDmTzKwDnjsAwTfZ/oMM1e4/tNbw9oM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ybv+Sy+XCW9y7IdEpHeY7ujdIBwikZrmXN7HWdvg/xMh1N/1aYJQJF4sRQBVKh0ytAZT7tOoR4rNWyqqUtll9a7dQIeIf4MMTNhgNcOteriKqPDgqRop4DBh2PsdTy/6hxMOo3yPVyFaPi1lbjFTwv/6Ki9BM+Dgrwz7XnaW784=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDrUYcvx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDrUYcvx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098811F000E9;
	Thu,  9 Jul 2026 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783588621;
	bh=/jKMthdhTARD7MKljzmOKcJ/tsf7y//qpWUdGQDUyhw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WDrUYcvx5lw6dphY+nuGBquWqUUxW97lnw0PqeTKO7ziDnr22uwKmv2HpmzDrbl0t
	 yJYluRi+nL2wBQHnCoKTabBFDqniuHA3HQNKHq/StJs/GCdC3YLQS0DVXxDpEfKkqH
	 XBALIc6Z527cH6U9otJt+xVYyNpCw6IB/T3tO0ywXU6VrxSoS0/lSuaim67gO73Hli
	 tuvCwNcFS7j68yu/D3lrRCkZDpQ+jkBUCQBFmSkMhc0SEOjPF80+R4igRLXfA3HORj
	 zoBt2IUsJoILqyLC0pNdHjN3snJJQ79fBVx003lP+OsZGRvixy1S+wbzYnxEDR0nx6
	 h++qvK2I/D0/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] arm64: dts: mediatek: mt8173: Add and use UART
 AP_DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260709090924.27056-3-angelogioacchino.delregno@collabora.com>
References: <20260709090924.27056-1-angelogioacchino.delregno@collabora.com>
 <20260709090924.27056-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:17:00 +0000
Message-Id: <20260709091701.098811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The AP_DMA controller specifies `dma-requests =3D <8>` but only pr=
ovides 6 `reg` and 6 `interrupts` entries, which causes the APDMA driver to=
 fail during probe. Additionally, the patch omits DMA assignments for `uart=
0` despite the commit message claiming to configure all four UART controlle=
rs.
--

--- Patch [2]: [PATCH v3 2/7] arm64: dts: mediatek: mt8173: Add and use UAR=
T AP_DMA controller ---
commit ac8a25e005302375b885a8325819560714cb8e2c
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

arm64: dts: mediatek: mt8173: Add and use UART AP_DMA controller

This commit adds the UART AP_DMA controller to the mt8173 device tree.
It also assigns DMA channels to the UART controllers to increase TX/RX
efficiency.

>     In order to increase the efficiency of data TX/RX over the UART
>     controllers, add the UART DMA controller and assign the right
>     channels to each of the four UART controllers.

[Severity: High]
The commit message mentions assigning channels to each of the four UART
controllers, but only uart1, uart2, and uart3 are updated in the patch. Is
uart0 intentionally missing?

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8173.dtsi
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
[ ... ]
> +		apdma: dma-controller@11000400 {
> +			compatible =3D "mediatek,mt8173-uart-dma", "mediatek,mt6577-uart-dma";
> +			reg =3D <0 0x11000400 0 0x80>, <0 0x11000480 0 0x80>,
> +			      <0 0x11000500 0 0x80>, <0 0x11000580 0 0x80>,
> +			      <0 0x11000600 0 0x80>, <0 0x11000680 0 0x80>;
> +			interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 98 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 100 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 101 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 102 IRQ_TYPE_LEVEL_LOW>;
> +			clocks =3D <&pericfg CLK_PERI_AP_DMA>;
> +			#dma-cells =3D <1>;
> +			dma-requests =3D <8>;

[Severity: High]
Does this dma-requests count of 8 match the provided reg and interrupts
arrays?

The mtk-uart-apdma driver iterates dma-requests times during probe. With on=
ly
6 resources defined in the reg and interrupts arrays,
devm_platform_ioremap_resource() will fail with -EINVAL when trying to map
the missing resources. This will cause the probe to abort, unconditionally
breaking DMA for all UARTs on this SoC.

Should dma-requests be 6 here since uart0 was omitted, or are there missing
reg and interrupts entries that should be added?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709090924.2705=
6-1-angelogioacchino.delregno@collabora.com?part=3D2
