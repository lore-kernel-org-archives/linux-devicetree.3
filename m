Received: from mail-m32109.qiye.163.com (mail-m32109.qiye.163.com [220.197.32.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDCD3659F7;
	Mon, 27 Apr 2026 06:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777269685; cv=none; b=JASjbOG/T8mnynQT9YeDrdPkV2P+NPDtOibFRiuRqo8OUi9Ce8SWNIO4DIJnXq8PSxTqPGpyUu6CtBpsDq6pUZMaSEau0p2v3xd4O9qr4zjyi5H8do6b1JjpMG+g2cwk88EDcGqizGwLOcJnzxcFp5STOXXiSlrRYPqzpR+EBEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777269685; c=relaxed/simple;
	bh=hzIoHfnPdYQMF9GtwItmBDS7TD1MqyYSOUvBP3HWYXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDeuPO4E7uGtYkgWecybTm73qL4fUZudxCmFJRac5Fq4LR2CSkkRGb9k5ln6TVsg9BEgXD3Nj8slS00snXaPwNFUQ9Uo2zaho6bklxKu6z4pzC1v+40GODvC0yjoktxkPYKpeoDV9g/5kcvDHHFxjw81m+tQZR2GwQnErMHA3II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=FiwJccJU; arc=none smtp.client-ip=220.197.32.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="FiwJccJU"
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c3fc5fc3;
	Mon, 27 Apr 2026 13:55:59 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: gordon.ge@bst.ai,
	krzk@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/2] arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
Date: Mon, 27 Apr 2026 13:55:54 +0800
Message-ID: <20260427055555.3693459-2-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427055555.3693459-1-yangzh0906@thundersoft.com>
References: <20260427055555.3693459-1-yangzh0906@thundersoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9dcd82449e09cckunme57a9fd319e3ec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSRlLVh1CGU1KSkNDSUhDTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=FiwJccJU1lre0+qwXTRnz6yGGzFb3rDtoi5pwvpF/Ob9z1pEzguNaet98BKrZVHOaqLZEOKrDW6vCLyVwY+1ZP0Enw7WxdMZEh6XjfaHNx1yPInbCFpO0W2JX0/N9LyU0Pjkc5/1A3FSmcbigNXYb0pWG43lt5aAcUYQbTsZ44k=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=I/Qf+Jt8jBH61yX/14Jp1btkMWzHWiNR5UF+Cn43c64=;
	h=date:mime-version:subject:message-id:from;

Add eMMC controller support to the BST C1200 device tree:

- bstc1200.dtsi: Add mmc0 node for the DWCMSHC SDHCI controller
  with basic configuration (disabled by default)
- bstc1200.dtsi: Add fixed clock definition for MMC controller
- bstc1200-cdcu1.0-adas_4c2g.dts: Enable mmc0 with board-specific
  configuration including 8-bit bus width and reserved SRAM buffer

The bounce buffer in reserved SRAM addresses hardware constraints
where the eMMC controller cannot access main system memory through
SMMU due to a hardware bug, and all DRAM is located outside the
4GB boundary.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
Acked-by: Gordon Ge <gordon.ge@bst.ai>
---
Changes for v8:
- Collected Acked-by: Gordon Ge <gordon.ge@bst.ai>
- Rebased onto v7.1-rc1
- No code changes

Changes for v7:
- No code changes; resend with corrected recipients

Changes for v5:
- Split from platform series per Arnd's feedback

Changes for v4:
- Change compatible to bst,c1200-sdhci
- Move bus-width and non-removable to board dts

Changes for v3:
- Split defconfig into dedicated patch

Changes for v2:
- Reorganize memory map, standardize interrupt definitions
---
 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    | 19 +++++++++++++++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 18 ++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
index 5eb9ef369d8c..178ad4bf4f0a 100644
--- a/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
+++ b/arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
@@ -17,6 +17,25 @@ memory@810000000 {
 		      <0x8 0xc0000000 0x1 0x0>,
 		      <0xc 0x00000000 0x0 0x40000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		mmc0_reserved: mmc0-reserved@5160000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x5160000 0x0 0x10000>;
+			no-map;
+		};
+	};
+};
+
+&mmc0 {
+	bus-width = <8>;
+	memory-region = <&mmc0_reserved>;
+	non-removable;
+	status = "okay";
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/bst/bstc1200.dtsi b/arch/arm64/boot/dts/bst/bstc1200.dtsi
index dd13c6bfc3c8..9660d8396e27 100644
--- a/arch/arm64/boot/dts/bst/bstc1200.dtsi
+++ b/arch/arm64/boot/dts/bst/bstc1200.dtsi
@@ -7,6 +7,12 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	clk_mmc: clock-4000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <4000000>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -72,6 +78,18 @@ uart0: serial@20008000 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@22200000 {
+			compatible = "bst,c1200-sdhci";
+			reg = <0x0 0x22200000 0x0 0x1000>,
+			      <0x0 0x23006000 0x0 0x1000>;
+			clocks = <&clk_mmc>;
+			clock-names = "core";
+			dma-coherent;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@32800000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x32800000 0x0 0x10000>,
-- 
2.43.0

