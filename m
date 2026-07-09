Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E406401494;
	Thu,  9 Jul 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588180; cv=none; b=c3GVueBYOxO7MxnQ+O0LQRjZ4sFphxlStyUGpHrcgHvV5YngMqPM1hE5sWtGAhE5od+pic8SC/B3zfEPUKTxyO55yt2eYm1ZgjRMmWA5pogP9ugJtiYSsHDV1CYMV4bvar1VU6IUI+Scw3cYlf17s77i3PTBl3djQbC/pVwFZjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588180; c=relaxed/simple;
	bh=qfM2bjSy0XQ0F9o83ydlK8vIjfChnYdT8NE1+GUDV7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0YLODvVCgcEIaQFvBaKtB4rDo7OkW3GpKyScPXqD0r/HZvfP38fYMlwB3CSj+KlZXDeS0X+coTxYUvAFUcX8tgTubs84utB4W6DqZFsViHtEUosDMzmAh4zMONrG2Q+KfFGhYW5qfITDZak107x/mgIDW2rCSo5EZ1dmQBykoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dwSdDo61; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dwSdDo61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783588176;
	bh=qfM2bjSy0XQ0F9o83ydlK8vIjfChnYdT8NE1+GUDV7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dwSdDo61HxcqadSFfC/cNL0Dq8Sjv8AeDG/Tjlr3tuJuDEeGuCA8d9T6mg2vcI0D5
	 qbrUXF/pEJslknmdqHN7pPjcGgBc0uXf763etTRJJ/72+CX5Fk1dJ4Jv3TCpQIS+2T
	 hVOo/7V5oBb19buoD3o/FzXGSrYHeoQJaA0ptNf8FjXdUkKsfCiqr5d3SjE8UdPIVf
	 n3oOXINyySqdGGzWSFqlypo7t56vLcj+u29HyEYQmoYuXHOmpZjUipDh4EEryaptyj
	 E7ygVz1a6VxgDlRIyZpLevZ604xNaFF25hP9Kz1eC33t5wm1hq2d9HcCeGc6hbG/Yd
	 jzApluP80ufgw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1372917E0E04;
	Thu, 09 Jul 2026 11:09:36 +0200 (CEST)
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
Subject: [PATCH v3 5/7] arm64: dts: mediatek: mt8188: Add and use UART AP_DMA controller
Date: Thu,  9 Jul 2026 11:09:22 +0200
Message-ID: <20260709090924.27056-6-angelogioacchino.delregno@collabora.com>
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
channels to each of the four UART controllers that are declared.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 75133794cec3..14a320f0c70c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1360,6 +1360,31 @@ spmi: spmi@10027000 {
 			clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
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
 		infra_iommu: iommu@10315000 {
 			compatible = "mediatek,mt8188-iommu-infra";
 			reg = <0 0x10315000 0 0x1000>;
@@ -1512,6 +1537,8 @@ uart0: serial@11001100 {
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1521,6 +1548,8 @@ uart1: serial@11001200 {
 			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1530,6 +1559,8 @@ uart2: serial@11001300 {
 			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1539,6 +1570,8 @@ uart3: serial@11001400 {
 			interrupts = <GIC_SPI 723 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART3>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 6>, <&apdma 7>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0

