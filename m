Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5304A48380E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154070; cv=none; b=hIF+WITXQMXmnqW+vk2a84MrboMZPZ+tpyOw0dOrtaP8DEGkRxQccQ46wbum5lvO+0A1pcj4dXLtIH3bvuc1FMeQDwUXKOqG2RD+SXSyv602/RlSS6SE8swf48+V51e0CLfVMTBR0gvCXxsfyC67XzAXXiL3QTT+ZXFAcIa6Duo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154070; c=relaxed/simple;
	bh=OLNSZrzF/eaqutZvktMtyMNI2nbpbIOVNRJswO6WqSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K59Uqpw1s/KH1kInpeB6ev5NV038mwYYYHYfV7iuB7iRS/EtDx9PCaxCEYtc6BazELCF5WWBEUNUwmxS14lylfnuf4+Ba7dg3ESiM9MvAz9pesExlr3KGIFsVovTtnSc8gN9i3pd6/xUc3nMJJgsUBZ3/SuSQKaIcXyHm8uN7f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Chz9sf/8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Chz9sf/8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso41876215e9.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792154067; x=1792758867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoH3FFcfZAjONuLiIkivXi4hnxqhQZd4Qylq+O8iD0Y=;
        b=Chz9sf/8zlmMwdCOxB9cgzpzAAiCQ9yYtypuiAz2+V6fUEx/KiQtoDrV9bSJRf7Jr5
         Ap4PO8DW3tcNyLL8ukPOZIVUIFjkyrEQgBHqXACAr/X7U2NcGU57yEtf0K0WKhqtyX/7
         Y38MHgaQxnXt1aCQGt6k0ZtefKyVVbhgdISSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154067; x=1792758867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoH3FFcfZAjONuLiIkivXi4hnxqhQZd4Qylq+O8iD0Y=;
        b=AsIBFETA+jedM4asS6E2u3qTvlQl8BPaSiESQUr491v/Dx4gstQb1uPGvYHol8AWXy
         sjLVSGlcqUTjWWnYszJLCSmaOSO9zoqYfOJ2ALkcLBKpS2KLCkQj7+eEFYbwk7CIzA4k
         J6OidJJ9zvG4QyFuI2Ajtgqq7TGzQBQ6i2vL2DaKwFPcbxGhL2E11P25AN9jXZc+Sp6w
         rfNxFgbMTKweiLlsY6a13xQOTC5stDCdUK9hqVK8eWJtfTcc+7mFcZmIIiymI1fXcdLt
         zGe0/Obbo2GXnog72ftDnsRmy2D4ca8rv7q6ZW3F9KMnVZwUpNgeby8LQ/2Qbp5UwUSS
         3v1Q==
X-Gm-Message-State: AFq9FYIFvZdAEKTpgQnJbFQJDmQQ8HhtLqPl/8EoTgV43ep6S9KYQxCI
	HYMVmr9ZkSdR+weA0FhSu4H0sZivyojU/68tmdYcW0tv/FOfeli893Fdr1sBaqCZmdc=
X-Gm-Gg: AYBFou1R94tlKZbdyW9xv5F6xm/Zy/WK/DtYbySqamDcZfy0h7faLBpc3VXUYQq47hy
	lwTwaMgY0BSD/To10rUv0w23w7FeCj2PvUL4bzScnFUmSPjz6BQ/FN/uSagEtuIsA11b2jrdQwZ
	f97jM/TJG79Pk+h+WKHNFfr0w8TVUGPOTvzAl01ldWWa6G0w5zvKsOU9R63ZsqtLOvyjbzsFTkL
	dCSSMj48JlpztFX5eNlRHl+kvNXSEyl4RLH9wmzCZmCgQ/c+B2rRm7Hja1ULvi5+Q1moOjrpqEQ
	dNpWwyTBn1Ufh/0UapelitKc0cELRjsr2Lg2M8QSFac2JTDBNj6fiv2vDeFOMwqdp5buCNuf2G0
	ahscjMEKyRuUeXVwLt/DyTtoQI3RMd3c7n2iDezs16zZ1GniN3/adFy4+BWoCBEuWuAYjgG5vgb
	Md3NbMUpUnsoa2th+VGMqc+bhZhI22If6zAbojW8ZyOUFwQOoBUg6oCg5ONvU0Kwl7kCQ5VVX28
	e1Px4tSOpdysZk=
X-Received: by 2002:a05:600c:6990:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4a18e49c43bmr470046445e9.6.1792154065843;
        Fri, 16 Oct 2026 05:34:25 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm110564045e9.1.2026.10.16.05.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:34:25 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v12 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Fri, 16 Oct 2026 15:34:14 +0300
Message-ID: <20261016123415.3272046-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016123415.3272046-1-petko.manolov@konsulko.com>
References: <20261016123415.3272046-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

This one adds the DT for the Altera SoCFPGA part of M48.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

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
index 000000000000..e38590c4630e
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ */
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Draeger M48 Cyclone V SoC";
+	compatible = "draeger,socfpga-m48", "altr,socfpga-cyclone5", "altr,socfpga";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+
+	aliases {
+		/* this allow the ethaddr uboot environment variable contents
+		 * to be added to the gmac0 device tree blob.
+		 */
+		ethernet0 = &gmac0;
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		ethphy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			rxc-skew-ps  = <1860>;
+			rxd0-skew-ps = <0>;
+			rxd1-skew-ps = <0>;
+			rxd2-skew-ps = <0>;
+			rxd3-skew-ps = <0>;
+			rxdv-skew-ps = <0>;
+			txc-skew-ps  = <900>;
+			txd0-skew-ps = <0>;
+			txd1-skew-ps = <0>;
+			txd2-skew-ps = <0>;
+			txd3-skew-ps = <0>;
+			txen-skew-ps = <0>;
+		};
+	};
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

