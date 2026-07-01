Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671D1480DC0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909344; cv=none; b=exrp6cRIkzDYFPJKcQierie72ptVRscNS8OF+Xm9keBSV8yuez5aBQDE8Ho+Qc2z3nRectbUK7wO44SDyKpCrqEI6K6cDowTMoFejXv6lKxZHbD4Np1O8AOFo86b/zy9o9DyuUkjuIPlZaRQbJ0PH04LradXUN6E16wRaetpITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909344; c=relaxed/simple;
	bh=XiGJpioeX/FXcfQfsSc+O8kBmCS9ikfYNtOYW8vm+ts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iaP6B6r8/TAsa3KEVvQm/dZ12dmJNUzNZ7r9xuQ6DxnqwNQl8xfXDjk9hkL7tL4D9n+23OQ63DalRsF0FAU15XHHJUTTHb3Swg107g5RWi/ehKEYDdiUmuO4tO6Z5jJgVyUKHq9JEhvp19E+Hc75GVnFqzrxXbTiYkRSz9Pnnf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbW19r7n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbW19r7n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45DB1F000E9;
	Wed,  1 Jul 2026 12:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782909342;
	bh=htKuE3oPE33YqvkfTuTlu34HOPzBmE8oCW2LP7RQdRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AbW19r7nVgI7z6gAKyKTJ6uY16Iy1U7MPASyHiw9/WysJyoHSkU7NK9uLE3SjzVzm
	 G2d0PjLPrSLW+OknR83W37rYv/ljgeGhFJ53coRr56UvK26nY/t/aF82KN8g88W7Pi
	 mkDfvbI1Yg6k5fI2/fjEr2D1gIrdFTvwykZlunHqsWa6QZGuR4DGWoSA9i+9ONKGiZ
	 ILcXr96w9qAL2jSALYXW/39aUA4AydzI7UMkDk91S4wY/F9kRpRxHvdrxUC1f4ezOC
	 CwShCdaQe1KmHejmInUPAIf1OFcwzFhBENMLXUiysoW1wllheY7mk8evi3a/ktPxle
	 sfsR5NNgL34qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: mediatek: mt8173: Add and use UART
 AP_DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701121929.19374-3-angelogioacchino.delregno@collabora.com>
References: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
 <20260701121929.19374-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:35:42 +0000
Message-Id: <20260701123542.A45DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Duplicate interrupt assignment (GIC_SPI 100) in the `apdma` node=
 breaks UART3 RX DMA channel allocation.
--

commit bbd069e5de2e64963276afa1f5a62fd9508627a3
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

arm64: dts: mediatek: mt8173: Add and use UART AP_DMA controller

This commit adds the AP_DMA controller to the devicetree for mt8173 and
assigns the correct transmit and receive DMA channels to each of the four
UART controllers.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8173.dtsi
> index 78c2ccd5be132..345098359aa58 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
[ ... ]
> @@ -673,6 +673,25 @@ gic: interrupt-controller@10221000 {
>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>  		};
> =20
> +		apdma: dma-controller@11000300 {
> +			compatible =3D "mediatek,mt8173-uart-dma", "mediatek,mt6577-uart-dma";
> +			reg =3D <0 0x11000300 0 0x80>, <0 0x11000380 0 0x80>,
> +			      <0 0x11000400 0 0x80>, <0 0x11000480 0 0x80>,
> +			      <0 0x11000500 0 0x80>, <0 0x11000580 0 0x80>,
> +			      <0 0x11000600 0 0x80>, <0 0x11000680 0 0x80>;
> +			interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 98 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 100 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 101 IRQ_TYPE_LEVEL_LOW>,
> +				     <GIC_SPI 100 IRQ_TYPE_LEVEL_LOW>;
[Severity: Medium]
Is this intentional to reuse GIC_SPI 100 here? The 8th interrupt in this li=
st
(for UART3 RX, channel 7) duplicates the 6th interrupt (UART2 RX, channel 5=
).

If the driver requests these IRQs without IRQF_SHARED, requesting the same
IRQ again for UART3 RX could fail with -EBUSY and prevent DMA initialization
for that channel. Should this be GIC_SPI 102 instead?

> +			clocks =3D <&pericfg CLK_PERI_AP_DMA>;
> +			#dma-cells =3D <1>;
> +			dma-requests =3D <8>;
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701121929.1937=
4-1-angelogioacchino.delregno@collabora.com?part=3D2
