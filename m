Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704E7481FA0;
	Wed,  1 Jul 2026 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908377; cv=none; b=oIi2QuBYuxwh2Jv0U4sZhdZavRPNOwxPvqcmKrKqUxFRkkPyrTkEYF9Q26XkHfWQFc+rTa1XMtH3RUGmJOHf5KoQpJKnVcNKTg3ukKYtW60vZvpx/6IcbXmsK1+p3g9xPhbTzGbY+7djSrJet9RQOq89uOvppGx00qC36gvrCS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908377; c=relaxed/simple;
	bh=I+wvzTrKlbn7sLArrrngqZBjfAUOokyf0OTvsQ9/JH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9M7XmPdNVZVw4oiFtMCWxFTExkvxu73O/eEL0OOcRdNr5MCyx6wps9qamaKm5EgCoFPF2eQ5VTw99WQ3sspnU4B3UaUG2T8WnxUclFEbAcBbZmrwaBuRHNUvQHNErioCEwbBCC/2bOJFSLzQ16RZ/gNJZIY5BfoBRO7jNsEMGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BEaqRgyJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BEaqRgyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908374;
	bh=I+wvzTrKlbn7sLArrrngqZBjfAUOokyf0OTvsQ9/JH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BEaqRgyJ6iSoAlHpfyLaX0EcHsbOC8BKgJK0sWuowL+K6+BOUUBXSZq1VAg9K+/ON
	 1gauzMBBlHLgkvqYBsluLi/GiWsqxgZjOEIp6xuMimAdHhG+8g+XiFugI6+yxrvdjT
	 8ZswY74Jw3IPATcwBCU6qgRdR7+8224Nip02nfN2FJm1POIPf6RZOUKoKEc93s8pmL
	 E0BgtA8nkZTWY1vp4fY3SYccTk4rNCHJfX1CdrCQDAJiujeArvGoYD4iq+PdEN6ZGW
	 LcJ9JsfVWESi8WL53wv93LBVvchFepXC6QZ+J6CwKpx9Nams41rpoB5ZGD1Ym/X4wF
	 BOv2XhOM9SkUg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F5BC17E0F44;
	Wed,  1 Jul 2026 14:19:33 +0200 (CEST)
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
Subject: [PATCH 5/7] arm64: dts: mediatek: mt8188: Add and use UART AP_DMA controller
Date: Wed,  1 Jul 2026 14:19:27 +0200
Message-ID: <20260701121929.19374-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
References: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
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
channels to each of the four UART controllers that are declared.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index abf443e34112..cdc549f6c0b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1319,6 +1319,31 @@ systimer: timer@10017000 {
 			clocks = <&clk13m>;
 		};
 
+		apdma: dma-controller@10220880 {
+			compatible = "mediatek,mt8188-uart-dma", "mediatek,mt6835-uart-dma";
+			reg = <0 0x10220880 0 0x80>, <0 0x10220900 0 0x80>,
+			      <0 0x10220980 0 0x80>, <0 0x10220a00 0 0x80>,
+			      <0 0x10220a80 0 0x80>, <0 0x10220b00 0 0x80>,
+			      <0 0x10220b80 0 0x80>, <0 0x10220c00 0 0x80>,
+			      <0 0x10220c80 0 0x80>, <0 0x10220d00 0 0x80>,
+			      <0 0x10220d80 0 0x80>, <0 0x10220e00 0 0x80>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
+			#dma-cells = <1>;
+			dma-requests = <12>;
+		};
+
 		pwrap: pwrap@10024000 {
 			compatible = "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "syscon";
 			reg = <0 0x10024000 0 0x1000>;
@@ -1493,6 +1518,8 @@ uart0: serial@11001100 {
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1502,6 +1529,8 @@ uart1: serial@11001200 {
 			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1511,6 +1540,8 @@ uart2: serial@11001300 {
 			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1520,6 +1551,8 @@ uart3: serial@11001400 {
 			interrupts = <GIC_SPI 723 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART3>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 6>, <&apdma 7>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0

