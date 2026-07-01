Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D333F481ABA;
	Wed,  1 Jul 2026 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908376; cv=none; b=QWZAm2NiAOJHLIR+J/RSKArx+r7hOXyBQsg/A7TyRu/atmMPMBm9zVEOgYc2Y4AdfJHTejvA0hgfsUrpARHfNlsSQiJufn/1qoGazwHn1o/Qx+mkky2dyVnlUcId8AfT08sVWHKaG5j2AOslQsZ6OAnkPWsQRkQMRVHp8a6xiMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908376; c=relaxed/simple;
	bh=E1CBk7APT/eenltiF4Kqbk0fUMyDWyiwKz3ErWVdHxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOiMLIwo32Wlbe/YrnmXQBNo1jlLbpvWQAe8CRkTLOcrBJHf47gw15tjo68ip4CVjtcMrlv6YGEqE3sUgGX+Qp+iR7EL/Yijoj0OH5PVYMfKjCQhKE+UTPytX0/Aie0v/efi8qGotp+nDk80mM5Vgx6Xa53/kRDGMg4t883YdzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OXWkJBtg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OXWkJBtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908373;
	bh=E1CBk7APT/eenltiF4Kqbk0fUMyDWyiwKz3ErWVdHxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OXWkJBtgYUjAz+A2EaCfYJg8FPKgJ2dp5Npivukgi+7imoGSRFNq07oR3hlyAkEpB
	 7M/zELTldgZ4ZOh49GIunPR0K8x8Ru6QBw92XH0N0A/oY+W6FWdMj/JInn83ByE9rp
	 FOCALyttzH+s258kiBzBA20+j0bj5iewk0dP5nzrxso8EGdjBmXDo0I6JwXXxH3l0i
	 DvcV8Z1+JJodtt0l2AeG5IZdd2ja75GMOCBjv5B5sGWcBpmZL/qJqw6xAyiSZNgslA
	 7oiIQkLpXiSChMwS0WWNMLxF8NrniaAzNaQEIZMXr9N2hvz+V8PcWX4ut/DjQeg9m7
	 G3T0F1Qukoe6Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EACEE17E116D;
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
Subject: [PATCH 4/7] arm64: dts: mediatek: mt8186: Add and use UART AP_DMA controller
Date: Wed,  1 Jul 2026 14:19:26 +0200
Message-ID: <20260701121929.19374-5-angelogioacchino.delregno@collabora.com>
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
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 3fa85185e2c8..3784c1f38620 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1134,6 +1134,22 @@ systimer: timer@10017000 {
 			clocks = <&clk13m>;
 		};
 
+		apdma: dma-controller@10200d80 {
+			compatible = "mediatek,mt8186-uart-dma", "mediatek,mt6577-uart-dma";
+			reg = <0 0x10200d80 0 0x80>, <0 0x10200e00 0 0x80>,
+			      <0 0x10200e80 0 0x80>, <0 0x10200f00 0 0x80>,
+			      <0 0x10200f80 0 0x80>, <0 0x10201000 0 0x80>;
+			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 377 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 380 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 381 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <6>;
+		};
+
 		gce: mailbox@1022c000 {
 			compatible = "mediatek,mt8186-gce";
 			reg = <0 0X1022c000 0 0x4000>;
@@ -1210,6 +1226,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1220,6 +1238,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1474,6 +1494,8 @@ uart2: serial@11018000 {
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0

