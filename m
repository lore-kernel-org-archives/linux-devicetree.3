Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1F5525A85
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865829; cv=none; b=qp6CbSzEZRsPu0d1GMTMQSfFa8VPokR06vcdv7yYIRtYrfK3bG5f4312uXISKwOWHsrSkwkkfM59JpVW7vfPeG8jpD8BXFcRXC70i2y0mJRTBJHXZpfREFFpDdYfJXgJkz2loxrhu0W/vZb6yHvE4TpFBCw1WmfPHZmlcwESzFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865829; c=relaxed/simple;
	bh=RfAAa/ezxcoTvltT1sgPf5b6PR4/MQAxo6ei5Ly/z2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LchiNmVe7nJwnvHvb7fSmCPtC5vwYJc0X8ztyu5omAUMkJKLu+53KQ29PPRA2YGISGtjrP4mPfOYaQOmrNh8bDjg1iNWi4xd8wtgkojrmHVc2+xgS/zywHM3FFOSmC36Gg7AgN+ZXhXAOtZgQFVpqzSu+bfqwUnpXrdnmB56+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Ch/a0EKF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Ch/a0EKF"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-485850cf499so2948652f8f.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 04:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788865822; x=1789470622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dV1cFa0SmiOJFSUVittr8PT+5fPSzY0p/A7pJa5ekQ4=;
        b=Ch/a0EKFrg1UtV1RA424XcWEJu0UL8nz0z0R3Ex7HuDC3I5plgXSrHjF0Hn2xd4RXZ
         xOE+2VDmHSu68VuxmIiQCAEP0UOBcV2PhypeSTyA4szuun8V3CsX4BZZFtv4JbtnoO0g
         c+/9xGHlhd3tZJxAbDALmAivXrBsJdLXqJIYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865822; x=1789470622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dV1cFa0SmiOJFSUVittr8PT+5fPSzY0p/A7pJa5ekQ4=;
        b=X+LKvsiUQOvskOAxhipRhMjYNTIlfcKB19a4lnqgZ7k0dmHWnbPPkbMOY4earmzOOS
         W0xpr0xIz6zHuIs9XcvVIge/esZ+vOaths7IqcA2y96gPI1kwRLELYebtYCRvGE+S00c
         UHvEJ2cPtYHltGBP1Zw/EpexV7a+c3D6NWKPMAT48878jyP0RY9q24Ry0bjCLaDbEwwB
         lxyDYpfwTL6IpHUXSw7DE9OGskgNGUcsIOP6N1LEqI+Ma6qgwZqHWpzpooSpQWv+wDfy
         5hAMTOTCYNei1s288U3WyCeY+Bpv24kBdhRirnfmm4Fplgk9nUlmJpzz/ZzA2x7P+zZF
         Lx7A==
X-Gm-Message-State: AFuF++mb368qKBPey0vvG2E6tUrA8tiNsVXkGy0uw5Y3vQL47b13xwkj
	UeNrSGzZpFNrud/yR2VnQbm2uIO1whc6yKLN2WGn1QPEwZ6h9a4dFKxMRqoWH/4ctGc=
X-Gm-Gg: AYBFou1yyphzWCa1H8ziLp4dj3zdES9xvL/ujxY3TIGbUgU5la6BjCPFJIoFcP3xbg6
	amLjwpIvN+gNphLVSh7yfJ4VuycYfxMR5gjNP3i00QyGpapr9Wa2lUu1mktPv/GBcM9LOtOczgJ
	xW3h47NdQi7rBORWw9zF8hSJnlKNyL0n0x6y6nDnmw0bvdnK/LJA44dEEl8Nec+sijxFLIhbwEV
	WNe2wWqO8hVjwIXSH4E3ttp9AiELVX0JjvmtsF06i6U1QRcTj+deLDkeFn0wsRxkUc5+69eyVjp
	zU26TYdLr78qPgMZ/lKbeG6vWscQ8rulo8EFRqoxaKgxQ7csRnFqArTWMY/L3bol4ViXGJ574sn
	QaVxK9e2gauGbXlZKzQvgqojXXXFlHy+7aGKfAK84DVmRYY2vd30iMK7lWsvkl1qvj3vSg+9afX
	3CTAIL+1aehkIit2mNq/tNW+juEqH4pNAZtzrvHjJ5K59LkypOJyatl8m/tKjLW79ggSSlq3uRm
	+fMTg==
X-Received: by 2002:a05:6000:208a:b0:485:8c17:9763 with SMTP id ffacd0b85a97d-4858c1799c0mr23168185f8f.37.1788865821270;
        Tue, 08 Sep 2026 04:10:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm26855073f8f.15.2026.09.08.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:10:20 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 1/1] ARM: dts: draeger: Add socfpga devicetree for Draeger's M48 board.
Date: Tue,  8 Sep 2026 14:10:00 +0300
Message-ID: <20260908111011.960876-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908111011.960876-1-petko.manolov@konsulko.com>
References: <20260908111011.960876-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 .../devicetree/bindings/arm/altera.yaml       |   1 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 130 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..8ed1ba733510 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,M48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
diff --git a/arch/arm/boot/dts/intel/socfpga/Makefile b/arch/arm/boot/dts/intel/socfpga/Makefile
index 8df0976da01c..cdcea11abdfa 100644
--- a/arch/arm/boot/dts/intel/socfpga/Makefile
+++ b/arch/arm/boot/dts/intel/socfpga/Makefile
@@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria10_mercury_aa1_st1_emmc.dtb \
 	socfpga_arria10_mercury_aa1_st1_qspi.dtb \
 	socfpga_arria10_mercury_aa1_st1_sdmmc.dtb \
+	socfpga_cyclone5_draeger_m48.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb \
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
new file mode 100644
index 000000000000..423c76cd1d4a
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ */
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Draeger M48 Cyclone V SoC";
+	compatible = "draeger,M48", "altr,socfpga-cyclone5", "altr,socfpga";
+
+	chosen {
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+
+		/* 1GB */
+	};
+
+	aliases {
+		/* this allow the ethaddr uboot environmnet variable contents
+		 * to be added to the gmac0 device tree blob.
+		 */
+		ethernet0 = &gmac0;
+	};
+
+	soc {
+		gpio3: gpio@ff202000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff202000 0x20>;
+			status = "okay";
+
+			portd: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+				bank-name = "SYNC_I";
+			};
+		};
+
+		gpio4: gpio@ff202020 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff202020 0x20>;
+			status = "okay";
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+				bank-name = "SYNC_O";
+			};
+		};
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	rxc-skew-ps = <1860>;
+	rxd0-skew-ps = <0>;
+	rxd1-skew-ps = <0>;
+	rxd2-skew-ps = <0>;
+	rxd3-skew-ps = <0>;
+	rxdv-skew-ps = <0>;
+	txc-skew-ps = <900>;
+	txd0-skew-ps = <0>;
+	txd1-skew-ps = <0>;
+	txd2-skew-ps = <0>;
+	txd3-skew-ps = <0>;
+	txen-skew-ps = <0>;
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	eeprom_mac: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&mmc0 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+
+	flash: flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "micron,n25q256a", "jedec,spi-nor";
+		reg = <0>;
+
+		/* chip select */
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		cdns,read-delay = <4>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+	};
+};
-- 
2.47.3

