Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3914C481243;
	Wed,  1 Jul 2026 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908375; cv=none; b=BF1c7vGNiw0fcH7v9+JbL3H1alqYee2PU/tTLt6vQNIfjYYy5n/r8jbh+yp71xaLnpCWt41DjUYyQNwNkRCs9Vt+qB5LCIJuR46vO1RYDh4+wISiT6Qy/nrKNLsIvD6MPELz8zWcIqaT3PSh7ZjcUtQR1P2m/4mLYEe+Zn7mjhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908375; c=relaxed/simple;
	bh=FP4PyTvgp8XB6N3XqeaC/sT6Tr0nsSIcWUYH3AkEMlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwwvdAq/YOqwIiDbWFto91YslvrFyvmatyAlHws3YU5YOco5hcW331YQAkJ0DF/5zo+YRvnwV6uPHtzpEDANtTWVdhTQgA1eAkvGLyMRpiyE0n0RdkwJkVO5TnMd7VYSR1S7ZOLrpdvzzXE0x19cDTnFi42zc/2W5mBSRQd4yhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OcOWkjUQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OcOWkjUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908372;
	bh=FP4PyTvgp8XB6N3XqeaC/sT6Tr0nsSIcWUYH3AkEMlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OcOWkjUQKWqQYRgXsnf5FPTk9JOuD8+SHjfVcCSbCZ+JC5l5lo4SEdmiltcKKBmns
	 YB/whWE7SOUTK8lF9OijckzQ4z6mKZQaZ4yAdvXAplCyEY6fnt/k5w81njxktUZL/k
	 vSR1+iRA3Lwx58o4k/2DiOAyPLzJGHfea0BiQnc8BNgmKvLyzxyMo7Jiy6eg3z3uiL
	 hny3vj2KUPkvV8ga1esWNaOWpTgb1voaWk8TINh5hSTmzrtf8H+kbWvxFlLpR/KktA
	 yliEAlvBBVo6GBkcklLHbp2zzRtei7HHplDvmH02FGebFAhhsOI57ttOZPWYWLSIJk
	 LaxlQP+0OLwYw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 538F317E0FB0;
	Wed,  1 Jul 2026 14:19:32 +0200 (CEST)
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
Subject: [PATCH 3/7] arm64: dts: mediatek: mt8183: Add and use UART AP_DMA controller
Date: Wed,  1 Jul 2026 14:19:25 +0200
Message-ID: <20260701121929.19374-4-angelogioacchino.delregno@collabora.com>
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
channels to each of the three UART controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 174aa8175ad6..6faaccbba580 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1059,6 +1059,22 @@ gce: mailbox@10238000 {
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
@@ -1076,6 +1092,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1086,6 +1104,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1096,6 +1116,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0

