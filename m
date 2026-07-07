Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426343149C;
	Tue,  7 Jul 2026 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439330; cv=none; b=Oe5HobW7L4gFU4fvLM6Q2AkfMeXOufCylzzhW0j652WzOclWWkxMgoXbL71bbORWNRUFBjOG0Xo1pLQoCWJlcDs7BsbNxwCjvxMaSllLsWJAX3Dvw918hAbH54rcAgJdZGDKOeJ7pMTk4bnGvKjZGJ2BQfN8AjinRwbaanURO9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439330; c=relaxed/simple;
	bh=e25H5Na1/muGraQAVFfOJYCZXZYjdwCnio/1tbgHD50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7ijkIZwJyZMRTC7zkbaOXVPq4eq1tiR9yEXyLwHKx8rS11YqwclVIksHUx6BCVRxLQuv1tRYZHAHZlK4WrQZzDbGcRg3s22d1iCT7/NYixMKjsCAqIYGqJRFnAzMFcLIwqcvynu94dCIJfWc76SNICliTwew/9HfwJRfLyHytA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xkt0+L5T; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xkt0+L5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439327;
	bh=e25H5Na1/muGraQAVFfOJYCZXZYjdwCnio/1tbgHD50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xkt0+L5TYJmtPyA+k8eVQvKG6uuwcV/1k9Aoq2iC3Cs68pBsifKGMTmCsLGe+e9nn
	 kf/sYRxuFZH/Ulrfa6CYQcuabrGAt94rw/YttxNpUVfO4HavAiV75luEg46nRgQfWx
	 IvmqC8m2kPOWi8evooz59H582kyIHpsJXFIODmUD+SY1CXMSb6NnztZBe2WzdPu8pU
	 kfkCCLWP4klv6aJPD1GG7JIevZEMuu7Cg2hWMgNtwlc/c36XeArRVZSNsqR/ihbUKO
	 zVmICCPw+Nn2XGH6zgEbOEEKUE9HH/7D1P0O16PiJYpntYqUnjGfGPaO7kaDS+CYUk
	 l2Db6mcM1/TIA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D94CB17E0E95;
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
Subject: [PATCH v2 6/7] arm64: dts: mediatek: mt8192: Add and use UART AP_DMA controller
Date: Tue,  7 Jul 2026 17:48:40 +0200
Message-ID: <20260707154841.198870-7-angelogioacchino.delregno@collabora.com>
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
channels to its two uart controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 9f8f115edd4c..898953acdb61 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -741,6 +741,19 @@ spmi: spmi@10027000 {
 			assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
 		};
 
+		apdma: dma-controller@10217a80 {
+			compatible = "mediatek,mt8192-uart-dma", "mediatek,mt6835-uart-dma";
+			reg = <0 0x10217a80 0 0x80>, <0 0x10217b00 0 0x80>,
+			      <0 0x10217b80 0 0x80>, <0 0x10217c00 0 0x80>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <4>;
+		};
+
 		gce: mailbox@10228000 {
 			compatible = "mediatek,mt8192-gce";
 			reg = <0 0x10228000 0 0x4000>;
@@ -765,6 +778,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -775,6 +790,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0

