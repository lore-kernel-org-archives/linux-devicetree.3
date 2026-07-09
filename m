Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FC93A9637;
	Thu,  9 Jul 2026 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588178; cv=none; b=PKJj4PCOzL6pJF34s2zm0RREhVkyhfUJbJ2MC8U7g3qpGN7Gbc69JPs7yanNjcUj5oxZsfTR8RuG7cRwhPD2vJekf8dmm5w3GBxWl7lRHoErcM5/Fu+WpCB60hDCAh28otj6Y4Oa+fW/5BvxJa3s5/l+Ba+VwJ5V5tg7VlJk8AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588178; c=relaxed/simple;
	bh=4yj28qkcMVotuPHzrx68NXl5l3n1gcF9UxI2/VOlSXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFlBVJSnchlpBveumvaZ0vGFb0Fqj8b+Wq/GT5GRLfNSteo8kq7zhx4xljHIBX8BZkiWBgn9FwvmKteO2kF79qo8GrV+rPY85TBNXzg5xKbDPZKyRJcp37XQzK2Tj8VVp/y38ad6GYYv3DkHQZWNNvnRTTLDFmm+AJCaEKE0F2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gJMr4LIU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gJMr4LIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783588175;
	bh=4yj28qkcMVotuPHzrx68NXl5l3n1gcF9UxI2/VOlSXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gJMr4LIUQrXMkvq5JrzkESBoTywKaPq2HDNImv6LAP1TDroYGskYzgksYo5s0IGyT
	 9TTW93/z/59LdiO8KivpYFoG9BvXlJZibVzWuyOhQUhimGou4Re24+hDXo53qX7GIn
	 jQstqi1PrmTF7ouOoX2XwaNchQmbN0C80L2alB8k1CPdWEMj5MRllqRPngmnLflt09
	 4y4T2GdEoONiiLlDwYLAOWMWnvcBszgrhZybP+VNWg86ojkAWBMqa49lpav/UFfAsA
	 6lhaUJGhYvCnI4kVgY8GWawoyaLstU+Oy66pBKg/GV58Kn3b+9Q6cYqPW2OW9V4Wgh
	 apfHSsmhBLO1w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF8D817E0D56;
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
Subject: [PATCH v3 3/7] arm64: dts: mediatek: mt8183: Add and use UART AP_DMA controller
Date: Thu,  9 Jul 2026 11:09:20 +0200
Message-ID: <20260709090924.27056-4-angelogioacchino.delregno@collabora.com>
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
channels to each of the three UART controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 95cc06799533..8b0992548431 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1071,6 +1071,22 @@ gce: mailbox@10238000 {
 			clock-names = "gce";
 		};
 
+		apdma: dma-controller@11000780 {
+			compatible = "mediatek,mt8183-uart-dma", "mediatek,mt6577-uart-dma";
+			reg = <0 0x11000780 0 0x80>, <0 0x11000800 0 0x80>,
+			      <0 0x11000880 0 0x80>, <0 0x11000900 0 0x80>,
+			      <0 0x11000980 0 0x80>, <0 0x11000a00 0 0x80>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_INFRA_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <6>;
+		};
+
 		auxadc: auxadc@11001000 {
 			compatible = "mediatek,mt8183-auxadc",
 				     "mediatek,mt8173-auxadc";
@@ -1088,6 +1104,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1098,6 +1116,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1108,6 +1128,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0

