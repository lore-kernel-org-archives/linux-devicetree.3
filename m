Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0533EB818;
	Thu,  9 Jul 2026 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588177; cv=none; b=hyNDKbCipZ51T9cXDp2mzbnwvPZfNGoBTHBKWcVy6L9Fv2O+GWp1LBdF1LU4Nk+cAzatCyIpQ1hzZeYe79akZCV1Gcdl/S18E0ZvQrk5cefbXX6UNb/eGJLIgquvgCvtxuFn6xrS6R2yeRkl97YL1NVoh79f722MrL+DXhb2Pqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588177; c=relaxed/simple;
	bh=IK1gy7Ppi9enq5CKWajmp1bn13CpXmC5UMPqV5WyMhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHGkCNaQxbolzJY/rfvdIu3V5q7jjJ4xE/JRNI/VJX/scM2xr8eWYRkE30OSYFD4oiKTtptff1xgVAOzWeQfTLXN+t3mWp0H5+lB2MK/NV8/UP4n45ANlcq3lod43/mYbuYTlKlHIhKG4RwT+DDMO3V/tTl4pwT/AxTRtBewQZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F0Qvh+4W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F0Qvh+4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783588174;
	bh=IK1gy7Ppi9enq5CKWajmp1bn13CpXmC5UMPqV5WyMhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F0Qvh+4Wa9CFE5fVSWEu7x28MVYPlMZpU1tUBBJf6QrJYuihDWiuYuGpJDvOXosda
	 iTOItCrVixeUdQSwTe/q8PRHT6VZk0hjT5hfEg2CPPKTfal8sWtFyn972HHyNzUoLi
	 SPHBlB8bu/51PrzPJo0UDuFaauc9ICfa+2HxxNYUhlm49URCdWXT+Vve9LYudOeaRP
	 P9Seuz0mZMYerePxMJOPmIfEJVvpk6jXXYEZXIvjGAkzcTLER4oMWWVZNUBzYGiqh2
	 KC/pGcXhaSC8ZwmjoiGnui/ToJw2dTtyAT7vKo9AmNyqhx8hS0h8HWPsDxHJzz9RY4
	 eRkDFf/8+Fcxw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EE9617E0D33;
	Thu, 09 Jul 2026 11:09:34 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com
Subject: [PATCH v3 2/7] arm64: dts: mediatek: mt8173: Add and use UART AP_DMA controller
Date: Thu,  9 Jul 2026 11:09:19 +0200
Message-ID: <20260709090924.27056-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709090924.27056-1-angelogioacchino.delregno@collabora.com>
References: <20260709090924.27056-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This SoC has a DMA controller (AP_DMA) that provides one channel
for each data direction (transmit and receive) for all of the
UART controllers in the SoC.

In order to increase the efficiency of data TX/RX over the UART
controllers, add the UART DMA controller and assign the right
channels to each of the four UART controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..18683d3b08f0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -673,6 +673,22 @@ gic: interrupt-controller@10221000 {
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		apdma: dma-controller@11000400 {
+			compatible = "mediatek,mt8173-uart-dma", "mediatek,mt6577-uart-dma";
+			reg = <0 0x11000400 0 0x80>, <0 0x11000480 0 0x80>,
+			      <0 0x11000500 0 0x80>, <0 0x11000580 0 0x80>,
+			      <0 0x11000600 0 0x80>, <0 0x11000680 0 0x80>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&pericfg CLK_PERI_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <8>;
+		};
+
 		auxadc: auxadc@11001000 {
 			compatible = "mediatek,mt8173-auxadc";
 			reg = <0 0x11001000 0 0x1000>;
@@ -698,6 +714,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -708,6 +726,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -718,6 +738,8 @@ uart3: serial@11005000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0

