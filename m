Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803113EB81E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443288; cv=none; b=Z7bdQRf4wGEe3I3YZ1agnGZIhEoAdTxTY/MxLstbWyXanV+vT+Q4xb9MOu30QNOahMeq7xFglWrd7M7JCbevFp1VJotwtsSxgOkVhEFU71jMCE/OPFoUYbYOB5r4V23WeiNiXqDtHaoePv9QCuq0lAL1a5aJJJHQTKUq7xtzHlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443288; c=relaxed/simple;
	bh=Y/CiuCVjqGmQyKj80ZWzJwu8tdi44mucP23U+RuuoFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qp0F/jetbMm8bt2SS42T6hamchAmDbsvgoPaMZkLEUnNIdsunbhNtkmsCuMqqfm0h3Zz4U4twGdP0KJazJaBP8SMeTBFvloWe1qnNXWomzmIBM/G+iOxdRfuV3rGOUyJuo253iZMcHCxOHJ4u2q4J5tSfwTNechkIyAzoV6GkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHduRPzQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHduRPzQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46121F000E9;
	Tue,  7 Jul 2026 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783443287;
	bh=m1xlQXfvVKRGjvfVRrWtzNBTeq8t67E9CPqokts+iho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WHduRPzQ9Uj10FJjL1q7cXNbhAOJTn0SOyl14KiZZwUCrXma+ck+/3N6Hd9X4YSnA
	 5RJ5M9Fc3bvgb0+pqF6dX01T2sHG6Dgmx20Wpub7QF8Q7f64FUEHPSMCDzQmfo8e4+
	 ZL2soOYuMaI+e17loU9SCdKQpsztMSNKe9k/tJmGOplgog/Zr35MdmHMemkR/2aijf
	 tgGFtz+GSOgnFsTGu8rAe4HbZFhKWYKK1OXBM0E6cefCrg7z78ZlW5k7llcVXHFmwG
	 vJgx5CbraMD5D5/n7VERiA+gsBeO+cVgA+Dhal7MvqVwRgKeAlcMOWQ7rkRT3frgn+
	 F+FTZuVkDg1Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: mediatek: mt8195: Add and use UART
 AP_DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260707154841.198870-8-angelogioacchino.delregno@collabora.com>
References: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
 <20260707154841.198870-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 16:54:46 +0000
Message-Id: <20260707165446.D46121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `apdma` node is placed out of order in the device tree file, vi=
olating the standard DT convention to sort nodes by their unit-address.
--

--- Patch [7]: [PATCH v2 7/7] arm64: dts: mediatek: mt8195: Add and use UAR=
T AP_DMA controller ---
commit a44a999701bce2338fffbb489d98050bb65e6842
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

arm64: dts: mediatek: mt8195: Add and use UART AP_DMA controller

This commit adds the AP_DMA controller to the MT8195 device tree to provide
transmit and receive DMA channels for the SoC's UART controllers. The UART
nodes are updated to use these DMA channels for increased efficiency.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -877,6 +877,31 @@ systimer: timer@10017000 {
>  			clocks =3D <&clk13m>;
>  		};
> =20
> +		apdma: dma-controller@10220880 {
> +			compatible =3D "mediatek,mt8195-uart-dma", "mediatek,mt6835-uart-dma";
> +			reg =3D <0 0x10220880 0 0x80>, <0 0x10220900 0 0x80>,

[ ... ]

> +			#dma-cells =3D <1>;
> +			dma-requests =3D <12>;
> +		};
> +
>  		pwrap: pwrap@10024000 {

[Severity: Low]
This isn't a bug, but should the apdma node be placed further down the file
to maintain standard Device Tree unit-address sorting? The node is at unit
address 10220880, but it is inserted here before pwrap at 10024000.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707154841.1988=
70-1-angelogioacchino.delregno@collabora.com?part=3D7
