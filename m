Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD5236655C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440982; cv=none; b=tS+1TFcz+L+8o4w7R5SkObqW83I6PZj4EPlTyVks5kO9efLsarnuYy5sYJ2UnjFJ1iDFEbdGC6Aa1CP9GIq4ZuyCuN8OQ1DwZZK6mC9t/XX4t6yFB0Lr9CP00OkvvJCV6HCHlOd5x6Td+o7M4Ax+Tll65ambaUvkf4hubgFcgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440982; c=relaxed/simple;
	bh=PB6CeJCCAbphxzQzju+kDtwCmGWlByPIFR5OUHf3U/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iLWRHkSinEPMzlhLIexr0p3Q9+GKXRFicKWUVlP1LfKGlA/LIh54pPx3oxYW7NVlBZRUozoFjaHIJ2XFq7lW1UiIrnEhAoPwXkcrNz47lu1AEv5gNqGbBk6x2sJJyb4joNKV5mgvMxNRvYTygFq8O3R44kqC91eu96QmuCvbVQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDK8lqg4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDK8lqg4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8AC1F000E9;
	Tue,  7 Jul 2026 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440981;
	bh=Mg7Z8Rn4ql3XRuKRcOckcQxgJ2l2T0lrqiEgjNBCJAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FDK8lqg4ET4LWQ5fQB6bSdMRt5JeOtPiLYIUSild0Z4Cw9S52XtHnXjoMrsy7e8ZD
	 cP+CqvH0y/MSokVqDCYaz6PJhMAPMjtqGKYdEC5kb+aUkYmof0hocaz5Vcw2cezubq
	 nse72K4x+0Jf1nw+9cejtReqV8yzKZbP6dx9XIQcNfKVjyOMNIwtjozDNR0lCUuMyI
	 /vu+SaGlDopDlTVyW6XvQ4jK+X/4dgjAaFekeutS6dew98M8T7kCmWv2rCRxA7vicc
	 Y63IHI0Gcaywe9Iex9VR6dTWbQlXq2zd8kF4NTvmv5pK1Q4smqDihYKBOlB505YcPX
	 fmsjJnTYF7xGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] arm64: dts: mediatek: mt8173: Add and use UART
 AP_DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707154841.198870-3-angelogioacchino.delregno@collabora.com>
References: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
 <20260707154841.198870-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 16:16:20 +0000
Message-Id: <20260707161620.CB8AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added `apdma` node uses a `reg` base address that overla=
ps exactly with the DMA channel already assigned to `i2c4` (`0x11000300`), =
leading to guaranteed probe failures for one of the devices.
--

--- Patch [2]: [PATCH v2 2/7] arm64: dts: mediatek: mt8173: Add and use UAR=
T AP_DMA controller ---
commit 02e7bfa1531235c71580128c63236a6715a1e297
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

arm64: dts: mediatek: mt8173: Add and use UART AP_DMA controller

This commit adds the UART AP_DMA controller to the MT8173 device tree and
assigns its DMA channels to the four UART controllers. This is intended to
increase data TX/RX efficiency for the UARTs.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8173.dtsi
> index 78c2ccd5be132..7297225f61c99 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -673,6 +673,25 @@ gic: interrupt-controller@10221000 {
>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>  		};
> =20
> +		apdma: dma-controller@11000300 {
> +			compatible =3D "mediatek,mt8173-uart-dma", "mediatek,mt6577-uart-dma";
> +			reg =3D <0 0x11000300 0 0x80>, <0 0x11000380 0 0x80>,

[Severity: High]
Does this node's first reg region conflict with the DMA region already
assigned to the i2c4 controller?

Looking at the existing i2c4 node later in the same file:

		i2c4: i2c@11011000 {
			compatible =3D "mediatek,mt8173-i2c";
			reg =3D <0 0x11011000 0 0x70>,
			      <0 0x11000300 0 0x80>;

Since both devices claim 0x11000300 and apdma is not marked as disabled,
would request_mem_region() return -EBUSY and fail to probe one of the
devices? This could break i2c4-attached devices like trackpads on
mt8173-elm boards.

> +			      <0 0x11000400 0 0x80>, <0 0x11000480 0 0x80>,
> +			      <0 0x11000500 0 0x80>, <0 0x11000580 0 0x80>,
> +			      <0 0x11000600 0 0x80>, <0 0x11000680 0 0x80>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707154841.1988=
70-1-angelogioacchino.delregno@collabora.com?part=3D2
