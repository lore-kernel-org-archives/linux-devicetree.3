Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD5329396;
	Tue,  7 Jul 2026 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439327; cv=none; b=Us6c38QbWX41zLFFtQKVkfmj2TdqyALEpRul2ByrPURZUPFA/F5jJS/O7agPzT2gY/Ye3VuOAOBSdQ6+1Hb5H6+6RAMzuZ8XGCBK9xHVZByIzyNnM0jTGkmg38Lz3UtkIszx13aZ7zyZC0ObVHD2kxA6C3RLPfN/Hz+9uLDZLSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439327; c=relaxed/simple;
	bh=II6SFzuuk7WkGZfpfWQMzQDI5fqsswHw62V/n/62Nc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjF8e+//5dWh8pR6vTpETY4K5n912nKLc8dlEVeu5TwE4hLr8qlM8Q+QvcrpCwRRqUjNrCOgrIaV98lU6emQ8IW2OXQDOzGcDmq3hk9j7PpEADD0XWgGf9m0h+iLR72CGT9W75sMML7y6tDV6vqQ5dyP2IsQiqKRznNfhaPoCEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jyUDKjOZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jyUDKjOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439325;
	bh=II6SFzuuk7WkGZfpfWQMzQDI5fqsswHw62V/n/62Nc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jyUDKjOZ4YKvm888R6hOorUiQyJE8hT+Td6r+jdt347CTWLSnV6XwDUAng5cDgNEF
	 042+5lGeR+c1eBv17Vzpyi/tW1xq5ed7xB9lJjEBArqaOnOAbW35qX8zQSW7GkG7jl
	 xnhoWSHoi8IYVDEzM9VlCGIa6gxSibtdYRtseXcOh++tU0GJCpby3IZf9eGP9hFXP2
	 uPhSXMdF8Pydq1qYa3IDGWwaVY7EhulfPgOwSrjZlPKHig9x1RTKcp6Rwe87atScwJ
	 3D7MmAP9YjNKO9QYoMvizFyw55wFZbR2EVF5hjGoCHYnClWq8pXhr+TQhmMMO4k6FM
	 CDhvAlDcDd7Ig==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8665E17E013E;
	Tue, 07 Jul 2026 17:48:44 +0200 (CEST)
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
Subject: [PATCH v2 2/7] arm64: dts: mediatek: mt8173: Add and use UART AP_DMA controller
Date: Tue,  7 Jul 2026 17:48:36 +0200
Message-ID: <20260707154841.198870-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
References: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
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
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..7297225f61c9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -673,6 +673,25 @@ gic: interrupt-controller@10221000 {
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		apdma: dma-controller@11000300 {
+			compatible = "mediatek,mt8173-uart-dma", "mediatek,mt6577-uart-dma";
+			reg = <0 0x11000300 0 0x80>, <0 0x11000380 0 0x80>,
+			      <0 0x11000400 0 0x80>, <0 0x11000480 0 0x80>,
+			      <0 0x11000500 0 0x80>, <0 0x11000580 0 0x80>,
+			      <0 0x11000600 0 0x80>, <0 0x11000680 0 0x80>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>,
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
@@ -688,6 +707,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -698,6 +719,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -708,6 +731,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -718,6 +743,8 @@ uart3: serial@11005000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 6>, <&apdma 7>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0

