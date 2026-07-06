Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324E93D891A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367987; cv=none; b=YfSSliI8EH2+UZihm+mmz2jyIdA2CTke+6yyCh53ubzAJuTiPCt8VCA3l1N4alPGQ9hgSZLdXYvHdGmwVySrLUB7mIO8tN7cT8TdhztSsmN4/ySpDI/nZglQX7smv5PhBrqCf8ogQm7nrpgHVnWNW+LhbJw0jOXFXVVAyOXgoAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367987; c=relaxed/simple;
	bh=gS65853yWXLovTrWd/3f8yjHdKSfUqFB81hVxi/mS5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbCMloZo3D/5OL7t2EKLICbJsY4VIS/Hi59dIrFRfUEsGufT37Tea/hS7gbuFzenL+zWNvR7UNkenYkipdTK61NDT96ZWUurBvkHPM90uB/xtZV9uXy91xVqm8A2p2J08U7NiUpi22DHco1L/TOMj41FikXQ3Di3F3OY+GBG5qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fNLvQr75; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fNLvQr75"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso3024639a34.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367980; x=1783972780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OrIWzKlthBSIE9zhLtGuPFvJioePjr2EjSPr8Ts66c=;
        b=fNLvQr75Dw/h/yQ+9aFeW7yGWq4E7nSc2urJTrmJVKyHLg4qyfKx7Ab8CHOFGGf6LI
         VkPzKqiQ2a85e8LXz0BtPx6onLisbQtGeh62dwf23Lv0jmrZHIBZbOsYJJ0x1loXhQsJ
         guXytEFjqR6juAQUyojgKj7UKztBe4QUw9s/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367980; x=1783972780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0OrIWzKlthBSIE9zhLtGuPFvJioePjr2EjSPr8Ts66c=;
        b=X5dCsEldrObjbbWYNUzBMIHMg1YyZih5IbjxLX22lgBv8smEWzIFNdETeweTD6yz1f
         08u5M8z04hCDvzVQGnc+AANkWdALB36VZfd52Vb5wQ7fgObapDt+ufHWl+oc5kMWfHJp
         CsF+Sggth6gewScDRcE4tebENunwjXw5P36deas/+qcjtpcbLk9JGAP0aVSOWS4roPFx
         rbWPXqTCfQltFQQ6QA8wuE6f5GbWUNb9DnEb7zxx4TMHUsXTDHF+I9XqKajR8aNnhOy7
         B8NpIUFtqEFm/O/IiyuJ0ppMtFJd41LQpFuOSlea44QxVBWM+pAICXwVABmxMn2dVyl+
         e4+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/BrAO739RqP9eUE/f7AqkHPb1bHjQ9M0xGYTKI2NYHarZN0fqo3l+lZvSWhJbjAxTWv27OwIaXCtbd@vger.kernel.org
X-Gm-Message-State: AOJu0YzyzPQtgmne2cKBET3VNGlaH2PbH+/3PuWlCd0NdKFUIMC0Bt7p
	GOJQMfVzc/k9JASoItiUHEJ2m+jApJcxiQihgpCxbPW4kRQBqnOGdoh2YFGDhObmDg==
X-Gm-Gg: AfdE7ckVH7EGgpjtGy47ycl2GwOtIybm5/Ye28h2o3bJ4wL91cGWP4NP0UsvF9th2rz
	GKoOloI/olc+Sls/syH9Gmsjh1djTW1gQVurgrRwTBpcaKG7EPuZWLcWOgPxkuQ+88cJ938lKRf
	n4A38OEHRWKMk+vuk2e/LSX3M6fmQ646cd6Sh0U8EGHqGMim2YP3cwrzg/sg/HYL5C2Y4N8psgG
	l7brTIyyp0bVsknCYFFr+OZL4RLdkU+kvwmX8IPH16FFRsciGqznpQ6LbYMxRyNZLR2TdSj0Q5W
	odE05iXz0cVfNv8Ri1SBE0Q5173NV2nWsvutejcvj32fVQAhPpvMRviltsYhx+VSu842Xj3CW9d
	8vjECUZO5REoXO0IOe0s1TRmk4eZJ6u+k/JzC++woBth8r6gU/LrgV52plfquPUHYn7Cty7bbx1
	iNsfKvwtY=
X-Received: by 2002:a05:6830:6ae8:b0:7e9:b4d0:5399 with SMTP id 46e09a7af769-7ebb239a3femr1194548a34.26.1783367980231;
        Mon, 06 Jul 2026 12:59:40 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:39 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] ARM: dts: rockchip: Add Luckfox Pico Mini B
Date: Mon,  6 Jul 2026 13:58:08 -0600
Message-ID: <20260706195818.3906949-13-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the devicetree for the Luckfox Pico Mini B, a small board using
the Rockchip RV1103 with 64MB of in-package DDR2, a 128MB Winbond SPI
NAND and a microSD slot. The console is on UART2.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/boot/dts/rockchip/Makefile           |  1 +
 .../rockchip/rv1103-luckfox-pico-mini-b.dts   | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index d0154fd7ff24..62a2ed96dd9b 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ROCKCHIP) += \
+	rv1103-luckfox-pico-mini-b.dtb \
 	rv1103b-omega4-evb.dtb \
 	rv1108-elgin-r1.dtb \
 	rv1108-evb.dtb \
diff --git a/arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts b/arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts
new file mode 100644
index 000000000000..287dbf1307e8
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2023 Luckfox Electronics Co., Ltd
+ */
+
+/dts-v1/;
+
+#include "rv1103.dtsi"
+
+/ {
+	model = "Luckfox Pico Mini B";
+	compatible = "luckfox,pico-mini-b", "rockchip,rv1103";
+
+	aliases {
+		mmc0 = &sdmmc;
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x04000000>;
+	};
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det &sdmmc0_bus4>;
+	status = "okay";
+};
+
+&sfc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fspi_pins &fspi_cs0>;
+	status = "okay";
+
+	spi_nand: flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <75000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "env";
+				reg = <0x00000000 0x00040000>;
+			};
+
+			partition@40000 {
+				label = "idblock";
+				reg = <0x00040000 0x00100000>;
+				read-only;
+			};
+
+			partition@140000 {
+				label = "uboot";
+				reg = <0x00140000 0x00100000>;
+				read-only;
+			};
+
+			partition@240000 {
+				label = "boot";
+				reg = <0x00240000 0x00800000>;
+			};
+
+			partition@a40000 {
+				label = "ubi";
+				reg = <0x00a40000 0x075c0000>;
+			};
+		};
+	};
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2m1_xfer>;
+	status = "okay";
+};
+
+&wdt {
+	status = "okay";
+};
-- 
2.43.0

