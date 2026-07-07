Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4631F430CEA;
	Tue,  7 Jul 2026 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439329; cv=none; b=DWPIQ/sL92y4zisQenq1Q7zU3RbQWZpnmcdjw9jxL8JyD47KCBhXJboP7uLjr6fEKjkLZ63oMrL6InHGufxIhaZida3XpdbsgKveUY60AonyftNEyjOemx4OaWsE3W4LguK1K0xud1FVSypUi+Usw0XSA3ynrz1DWoD16NfA+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439329; c=relaxed/simple;
	bh=qfM2bjSy0XQ0F9o83ydlK8vIjfChnYdT8NE1+GUDV7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0TL9LFJUnLZ5E4ya56DOpHUOQQhUsuXLL8h0oIATXaWp4MHJCV7rUUvLtKb1eNytSUs5zoxp86s0c+Cj7I7lEkwlMs7TOfNGM0fBSQ7L0ikm71WZ2iZtlKqy+yG8j8ig0KS4nIcNJUZNQvgvLlVodRVRWDs3eB5xLNch04EZ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HgV+7fDR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HgV+7fDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439326;
	bh=qfM2bjSy0XQ0F9o83ydlK8vIjfChnYdT8NE1+GUDV7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HgV+7fDRR9UbiIYkwFfiXMMZgQxRHmomi2DoANWbUN2VnAE+Nt0uSrGScjjuXUtP4
	 ZERpN1WzncjzzaE75BE3zRoljErCZ7jGAbgHZeOxT7GJqDz8tCIhv0yDi0tgeeRhXg
	 EJFoYxAuC+kg7YLp+V2R/7lOAD2vl+m74VUg4QCTZPUbFU7VsnT2rIQS8nyFJ2Rq00
	 rd05Fo+koXnkEHgCukRvIPxJmPrDaqN8/ab/WrL8fu8SahfxIP0nFfb9C9QI7iKZGl
	 u1HukDb48lIK7S4rMDE6g8lsxad+jQVgW5ueAJ0wbzCQ6oD1+NT6cVOapaqyiJ3EbP
	 IwJGQfuKRd5tw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48BAE17E0DFB;
	Tue, 07 Jul 2026 17:48:46 +0200 (CEST)
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
Subject: [PATCH v2 5/7] arm64: dts: mediatek: mt8188: Add and use UART AP_DMA controller
Date: Tue,  7 Jul 2026 17:48:39 +0200
Message-ID: <20260707154841.198870-6-angelogioacchino.delregno@collabora.com>
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

