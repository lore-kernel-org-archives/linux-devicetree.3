Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC0648EBFC
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332206; cv=none; b=ArnnTmDDqJxlT825rxgXuLjxvxZsGFzLLV1nV2aYEQGtcKaOKCO07CEiFlVNz2dtctsfnY4LMzc+/yFUGbDIlO8/0McLh7zGhtKTO8xFVnXlHv+r+x81ZhtRI8I+lKtRD+kQGyrynU7QQcDdpPfdhKxTtoS0TtZTRDZ4j2l0Yf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332206; c=relaxed/simple;
	bh=RcNwpd85Y4K1LZBQy6uneTIwFk1yZcB//Sg3XtDkxXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKDQ449pU3D3BPZkMpt5mIRBC4gJjg26LTJnqFFUJsOsZf1qkgO22H7WvTlBLyCluopg8IZxDWhHuGUBw40QuPuo/C22tt8r06+ZmfX4r0MkA6yA/TYTt5jik4OyXdeGniw2gyaWaVzEPelRVacIUiF8F2JJy9TOK1RSrTYEWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Co3oysYS; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Co3oysYS"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6aaf2f9ce3dso436176eaf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785332196; x=1785936996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=;
        b=Co3oysYSjO5TxZE/1XhkASnoHRGSncX9R9MgqMsg06pPIg6zaJPFF3fntHPGtf86/A
         LsQKhBek82ClVZmpS03PxtfED5wxabORq93zlLQ54IUnfpNEE/qhAKHq6ZveIkVuSNN5
         sg4p+gK8B4aZ3UOnqTc2btj38t91iMas1RNVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332196; x=1785936996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=;
        b=eVNPOWPFetK86Ee3U76ZsGBjKSbUc7afUmaFgPcapYKQbSp6dl6y34asFWRZFvaeoT
         fdlujxIHe920xmkOFbXv4ilW6GN3qghTS4vtadN3ZMN15cNyfxY0ZgPtO3TwNoapcwy3
         ZCPD++acdfUvktLKKpi4CHq6Jt2lbQlck1SMU2OgqqmFnNDeaNYOv7Qu/2xa3QeB/zu1
         T84Om4oPL41zXkvAkrJdDgDmHz54ys91bdn+cMj38mInp2ioUI09aj6R8qOeCV7sYEsn
         RHuA7geucMhT7X04Af0+QeojVC+m8D/ZyHWc4mqlkTdxjNkRYzoSX2+FBSCfORRDYh8s
         Jr1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rql+0pG2azBQM2FmP37NGDBN/ldd38DPVTSSFQavwHXtvuArMqZ9El6/LXwhCK3foUcKuYDW+5QSDVq@vger.kernel.org
X-Gm-Message-State: AOJu0YwILadsH+o4uqkEfOsF3alUIQ2ABAbZaE6CEuGYNvgzjJpy+zXk
	CuBJLh3J8UkvFIz3PMMS/u6bhbdWbggpBK054hlL7FayvwG75tz35DpeWSUjNNtXlA==
X-Gm-Gg: AR+sD12PeSd9LsIFhJmBGQwvBMzeOvYqJFIev6RlzP6SoM//87ztdVlMIZ3fRis32H1
	qf/PtebmFFtljXIiJQZA7C5rW9WIJcDD81QOfb4Pa776U5gp2Snq54H0Q7UJ040QBR65+T6wP7I
	invlt0edkgjyvIQmJ5LwB4uICA7JdmM0+A85+8cs/laWemTew9I5Thd4wRVOntdrrk62/b48Sjs
	dTqDxtORR9J1qnSB8vudA0By31Ih/rf8ryrKZ6ScWA6SmM/MJJUV3zr1hF2aNSOanQqULS49b9F
	oZ8AlHaIFdjK+A64loe4iGB9ewiEzx+wlwaDfmJYNWU4sL2Uf8beV9oMMfwzFcAwUF8SOo+97dH
	hNRcK591I9Z+I/F33nmBaJOr4JbPoGZzQFiT1l+iWkBnaeAmau8P88rk5XSc5lkj9ZJtsefekMW
	IWceDZWBKWjcbQfsf4J+0zVoUS5bl1caM6wRN6U/ICuPh3ZQKa9860IoY=
X-Received: by 2002:a05:6820:1ca2:b0:6aa:fc67:1b4b with SMTP id 006d021491bc7-6ac9699da00mr3333562eaf.12.1785332196270;
        Wed, 29 Jul 2026 06:36:36 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm1956196eaf.6.2026.07.29.06.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:36:35 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] ARM: dts: rockchip: Add Luckfox Pico Mini B
Date: Wed, 29 Jul 2026 07:35:53 -0600
Message-ID: <20260729133609.3465563-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729133609.3465563-1-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
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

