Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3674D41F36A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057843; cv=none; b=jizoTzd/8H8s9GWkOUcEd5Lj5YAnx3LVTv0DBFatkVZ67PnB867Fy4krnZDw4xsF8wwmfywxxzzjDZwxOf4A1BB6Hc3PX9g4KCRWAyNZk7rSfhJ4Dks4Kopj5WWKeS+t4hZEF4HPYsrcY2SL+rMG2Z1mrd9kRFohEL+XI2qr+rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057843; c=relaxed/simple;
	bh=RcNwpd85Y4K1LZBQy6uneTIwFk1yZcB//Sg3XtDkxXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNKuKUD9cfIEyO0WsxPbe/oHwNY8qxmmzWUBk9AKRvbiH2OLslqMaS6JHvrt2nbdpGtlVZxdp/x2tAiFdaB8bxKde01FX0bxS9TvmZ77O1l1bAKYgvwVGtcyGMQhIsiQCsc6J5RFNYLXUtIUsHd7ToZCsDuQe5NzkWxEXUZZwKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QJYswsrz; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QJYswsrz"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb63dbd229so996085a34.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057840; x=1784662640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=;
        b=QJYswsrz7jn/wIpM/sWGCiy4rEZ/RFf6ANWNdXY9EJeQw0xbqyyZq271fa2TAjCVHJ
         0d8yWNktZs3iHNVQDVqWbom82Tyio5tezriD5PbPPEwhBRe4a8YADBWcVlAIK4wUZ0zn
         +Ru9tfNeqjhGXlUpk14BXcoFMVZcUMO2ymbSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057840; x=1784662640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=;
        b=Dyrnd/lJ4+mkLEahbgLTcy7um/yidhTRSw4FFos3YuDOR4LB4ss0ylE70eZ3GTt+ZH
         yzzPM+hAlsHe3efzqS6gV71rCL6qOzRTUOkKvfkLLC1t/IduYxqUp8VZl+nu51ccIviT
         5v/H6pYwtBOwe9r/DVy3H5d/zjo70eT0gZWv+fUzZPU5kj4Nxyay7DwACUAOPodSs2vK
         D8dneE+SnPpdjY9ITERrcE/0+E5zcrPvjbji0jdybnpc7sW7a94chbP1grRumUHBC2Tl
         wh1woZA8OXOgs4Ivheo5mwY3rFbtXs38R9qZHO2h6sYn0vXVA02YgGAb2LTmndAgoOCJ
         +pZA==
X-Forwarded-Encrypted: i=1; AFNElJ+Xo8lmxubzVbngZLeOZxK4Hyl2BaJjn3wl/yr6vBNDoh5p+BlytBWx9PpxSTIU4g2kheNiyKgWyBUf@vger.kernel.org
X-Gm-Message-State: AOJu0YyFd96Fmqg68A6AHWlzcrql1VS5pCKCMpN8WbVlF+OXRoGq5WWl
	tBl8o5F5yQZgiVIRgvw49QuGfI2hK18D/GRPoe66jXWSdx6worLUNNhWREhmoFj7Ng==
X-Gm-Gg: AfdE7ckvk81BPh23XjrU7IkLv2fSXbz48ZqZl/tr598HrEiWEfSy2vvEtAzp6DHf7k6
	0ZbeeifyCWdxq7lvX5+QK+dCY/QWYiK0A6078nzS4RjiQ+mtKuyn1HuSs+K1BQ3S93Imw2zuLnE
	APUsRgYLTfjxkzBtM30EZOvG2Qa4GG1LpCAfFq5XaP72VLORYjYxmN3DbqRx/IHLMZK0avFW7N6
	G13HBN/GA96QQidLbtPaLPnQ5fc+lTTlOkAohVMTXEnGqz4QFJDD7bAE1LeJo9IL3bxbHDQ3CI6
	+yOhW3I1BPNSuBGg9leZZHZRlGXTlVzate0pvTwv4gh113nbszJ83v6SDSJO71SvWZKTEuuV/Kr
	QJQyvjY9sXKPMfsGnS7WswZiOYlMn005etc2R8UI0On0VZZW0ttU7qBJhlI5YlL1ew28BRkG54H
	gGPc0vjOU=
X-Received: by 2002:a05:6830:60dc:10b0:7e9:e9f3:266c with SMTP id 46e09a7af769-7ebf28741f7mr7407329a34.14.1784057839868;
        Tue, 14 Jul 2026 12:37:19 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf742e1sm16004026a34.8.2026.07.14.12.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:37:18 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] ARM: dts: rockchip: Add Luckfox Pico Mini B
Date: Tue, 14 Jul 2026 13:36:43 -0600
Message-ID: <20260714193656.2196447-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714193656.2196447-1-sjg@chromium.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
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

(no changes since v1)

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

