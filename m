Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4FF430303;
	Tue,  7 Jul 2026 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439329; cv=none; b=JI+jOlLvLcddhxMMxXzml+pHNXhrfOZRdGbkyhWtoad+ZgW9LVkIWHIBP3EsZxY+Xb0XnZ8L8x7kOEOfSUgdJhO7rsF0Ee8HUDlf4McPsK72KFT0bcCiKkmK7+ifoF1xvYdO4AWTbhqU4IgUncFXgk/Hv36Dr1LW7V49LXi5ZoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439329; c=relaxed/simple;
	bh=Wi+pjJ04jdpYMqQlHXj7Rh2kBrwW+ijBZ7HQHCOQ/XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c96ugZiscUXmfFd6Z12ZBYX0Dn0opdounWTj+2sPK1pPT9D8CwhxPXKZF6dB+MFgLNTqqevo3vYWVFkvur3wHM+Dva+X3XOxe7wqSjlvJ6fLEPKul1O4WlUk6St44qay6TFT3CA1r68uAc6ITsyyd/7xkbYzTrME7+fTcGRgDeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IXSBO860; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IXSBO860"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439326;
	bh=Wi+pjJ04jdpYMqQlHXj7Rh2kBrwW+ijBZ7HQHCOQ/XE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IXSBO860ERmOkmyUI7RRdxLIHTtZoZLmNi5DSTCjGOhb1edx5baGSuV2PrRIxgdQp
	 xV1cMrCyaWY8RgvlOJEKjPf5EevrrpCE6XQJmcGsCTWD+rJ7RBvK8+IVw/BS0OsE9c
	 l32qEAm1z25Zyss++y+I/xwGTFUO/Oo2Kojf1MoayytxssmPEG8QifxUotzseEpcqc
	 R6JMnhGkWGqJpO7W1wWEEaOH4FG2tZ9wlUqcWZKJIRQm1HI0zbNaEo/47pVmEc6+E2
	 F7Kv3E3Y56KazeTEah+LpKu5ZCucjENznnl9i8ezwil8Iii5QLy4Xjmcil0egFetXh
	 +tdZyza+vVp5Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF35117E0DE6;
	Tue, 07 Jul 2026 17:48:45 +0200 (CEST)
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
Subject: [PATCH v2 4/7] arm64: dts: mediatek: mt8186: Add and use UART AP_DMA controller
Date: Tue,  7 Jul 2026 17:48:38 +0200
Message-ID: <20260707154841.198870-5-angelogioacchino.delregno@collabora.com>
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
channels to each of the three UART controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index fded6345d422..9fe60dee0b79 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1142,6 +1142,22 @@ systimer: timer@10017000 {
 			clocks = <&clk13m>;
 		};
 
+		apdma: dma-controller@10200d80 {
+			compatible = "mediatek,mt8186-uart-dma", "mediatek,mt6835-uart-dma";
+			reg = <0 0x10200d80 0 0x80>, <0 0x10200e00 0 0x80>,
+			      <0 0x10200e80 0 0x80>, <0 0x10200f00 0 0x80>,
+			      <0 0x10200f80 0 0x80>, <0 0x10201000 0 0x80>;
+			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_LOW 0>,
+				     <GIC_SPI 377 IRQ_TYPE_LEVEL_LOW 0>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_LOW 0>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_LOW 0>,
+				     <GIC_SPI 380 IRQ_TYPE_LEVEL_LOW 0>,
+				     <GIC_SPI 381 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <6>;
+		};
+
 		gce: mailbox@1022c000 {
 			compatible = "mediatek,mt8186-gce";
 			reg = <0 0X1022c000 0 0x4000>;
@@ -1218,6 +1234,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1228,6 +1246,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1482,6 +1502,8 @@ uart2: serial@11018000 {
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0

