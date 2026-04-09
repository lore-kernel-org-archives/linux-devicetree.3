Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE16278161;
	Thu,  9 Apr 2026 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741178; cv=none; b=nbncJHWzYvZPr+HxXvUpeB7eMTaYinz0mnduBw3tPioht1ti+4jeflw4Twt+GcElqcLEiNLQSU1CoQ8MxQ8iDYvda/mVayH0EKz/eIEXw0vFlHQsouBEtX5/JnUMS8LPBPU5Eep0iuv6lZ+hCUH2IctVq6hD4unGcaNT31Suv8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741178; c=relaxed/simple;
	bh=2b8e6KDRHUx557Zs9mpVC6mrg85/qR2iWiETxWm5GYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gly1Y7ei/LUXJ61kh7VrqSXZXjbOQRsVYiVZpKv42GP3ESth01ht/Z5p5u7oC1dSvMtJ/Lf9i3Y4/KCiq5EZlcj8pJyxldS3ugYRrflIEgjBvVHHSZxGVapkTjV/oKDNcVbzBwWkIRSBnWjYwa+PBUPVLGdhBCPu8dq03W2Io8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=iV0xX78R; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="iV0xX78R"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id C3BA51009C2;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775740684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FP0oUVRJTrSUxMu2T07s70jxaRLS0hdrFQ/m0Q/hA+Q=;
	b=iV0xX78RKUFysO0SCY6atUDJ50w1E4gjRr9piRQFNNUelEZZqUGIIIELa2i46AHEVAn2vU
	gkCgLa+xTPI1h9nOaky8G/A0ZtyblL13rfo8FFBc0qqm/QXyfm3QK4AUV2kvGKH4WZr26+
	TgAuH5YNtYn8+GP2l9q4FhzKKfMuU+o=
Received: from frank-u24.. (fttx-pool-217.61.155.21.bambit.de [217.61.155.21])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 9B1A5122703;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: [PATCH v1 3/3] arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling
Date: Thu,  9 Apr 2026 15:17:51 +0200
Message-ID: <20260409131754.121737-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409131754.121737-1-linux@fw-web.de>
References: <20260409131754.121737-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

The active-high property in base-dt cannot be overwritten and must be
set in separate overlay.

Fixes: f397471a6a8c ("arm64: dts: mediatek: mt7988: Add devicetree for BananaPi R4 Pro")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  8 ++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn13.dtso     | 20 +++++++++++++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn14.dtso     | 20 +++++++++++++++++++
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi |  2 --
 4 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 387faa9c2a09..a86fb313b1a9 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -47,6 +47,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-4e.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn13.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn14.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn15.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn18.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-emmc.dtbo
@@ -70,18 +72,24 @@ mt7988a-bananapi-bpi-r4-2g5-sd-dtbs := \
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5-sd.dtb
 mt7988a-bananapi-bpi-r4-pro-8x-emmc-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-8x.dtb \
+	mt7988a-bananapi-bpi-r4-pro-cn13.dtbo \
+	mt7988a-bananapi-bpi-r4-pro-cn14.dtbo \
 	mt7988a-bananapi-bpi-r4-pro-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb
 mt7988a-bananapi-bpi-r4-pro-8x-sd-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-8x.dtb \
+	mt7988a-bananapi-bpi-r4-pro-cn13.dtbo \
+	mt7988a-bananapi-bpi-r4-pro-cn14.dtbo \
 	mt7988a-bananapi-bpi-r4-pro-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb
 mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb \
+	mt7988a-bananapi-bpi-r4-pro-cn14.dtbo \
 	mt7988a-bananapi-bpi-r4-pro-cn15.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb
 mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb \
+	mt7988a-bananapi-bpi-r4-pro-cn13.dtbo \
 	mt7988a-bananapi-bpi-r4-pro-cn18.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
new file mode 100644
index 000000000000..973b76ba0cbf
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/* This enables key-m slot CN13 on pcie2(11280000 1L0) on BPI-R4-Pro */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "bananapi,bpi-r4-pro", "mediatek,mt7988a";
+};
+
+&{/soc/pinctrl@1001f000/pcie-2-hog} {
+	output-high;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
new file mode 100644
index 000000000000..90b2a64459c3
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/* This enables key-m slot CN14 on pcie3(11290000 1L1) on BPI-R4-Pro */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "bananapi,bpi-r4-pro", "mediatek,mt7988a";
+};
+
+&{/soc/pinctrl@1001f000/pcie-3-hog} {
+	output-high;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index 7f770a76775a..5c5d4e26aa56 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -432,14 +432,12 @@ mux {
 	pcie-2-hog {
 		gpio-hog;
 		gpios = <79 GPIO_ACTIVE_HIGH>;
-		output-high;
 	};
 
 	/* 1L1 0=key-b (CN18), 1=key-m (CN14) */
 	pcie-3-hog {
 		gpio-hog;
 		gpios = <63 GPIO_ACTIVE_HIGH>;
-		output-high;
 	};
 
 	pwm0_pins: pwm0-pins {
-- 
2.43.0

