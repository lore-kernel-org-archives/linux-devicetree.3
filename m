Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D1446C18
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666083; cv=none; b=rnKbbeImfEYUuE5R/c2KwZc2DnZxyD7c6n1D/8/vRNvURb9c8lOfWGYk9m6zFlawo6tuwx9xFq/cFo8Ngf5WpJEbO7hyYYHu9Pqi/9m56CMTjPpVpmmDlcabh1QiPEcVLxJsvJPDnaglzhwTc69mhHV9FyV5F00O6E7E16ubrk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666083; c=relaxed/simple;
	bh=O954oCb/X6zJFFKR9J1IhOMsbO2BftkbFDfdzjj0t24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxZeUd5g3sY+bhg9uoBQC+4TACSEM7BoerLP/zA+MCMUoVEcSzdTqqfvZ3IV5JaFnP4qV9hUGsS0MGsTNqiMksJAcYYMqUFt616iYKEcdIZYZm6NUnAtpAIkllwb7As+3DFYoGtSvHSwXvMn+DXI+y4GYigBezEPyiI6zdtnBmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Ko3+aQfP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Ko3+aQfP"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c167aa9500dso732182266b.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787666080; x=1788270880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCkLszOPb6Hb/w5Hz9VQzAO60/GLzuXIDg2ZoU++UGk=;
        b=Ko3+aQfP8Vga2Drb/pP8vXLbEmlFeo8P0hmeKaDgDtSb8t4t9usPZmMPYh4iBmiXE7
         j2V0YXCS5UoBLZk16qxrsJ7nl8B9XAW77CGhZTZEiNbya3lf23i68x2s+CsX3M4FlWTq
         m2jMealxia3zwIpS0qlxLu0q2ycNonm4q0UJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666080; x=1788270880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCkLszOPb6Hb/w5Hz9VQzAO60/GLzuXIDg2ZoU++UGk=;
        b=RjLDHmhB1uo1OgPYNFH0HHclQXSvzmS6b4bML7JN2nEepoPSL8dtjCfOwIPsMYxz7g
         cQJoZedhlPoKBz+JycRlH4ftnonTWNwVNFdYH7fkrKx/z7yXU5dtnvm+cyzz49Y4rO6a
         1YMsDWWzC0el5SJ5xxYC0mn6uZCtK1RI9bQBaEwGVATHXuxAtOugQZ4OrmCTrr/SJVuh
         vp8s4DrbzWqyV0Ks+XFQ8XoUgMvVj9kXKRCcCzh7gF6OM4y7qJutSTOduuwdqdH9CEj2
         gQd0TeyhAu9O7afgC39cWLqwepSVVFxD+GQmudcHK7BdtUgUXlh1l84ZXSlrv5AVPkTj
         +Kew==
X-Gm-Message-State: AFuF++lvF7+PW/IntnQbNagMGl4o/YY1c8UQ8S/+fjU12ak4be5fZIzV
	qYtNu1ptW2S6mGU4Ab9pBJ7060KMHOQ2HPnuH9lfmWowLWZlQ+uXOPnINjtp3k+OyBc=
X-Gm-Gg: AR+sD11FezBBsSRMYISK4Ab/UNYcmJKEsV9fpHT70blvJuAIzrzz1RYSxnBhnhLkd6+
	7RI7j+hmnFdU/WHxxS4WpOsctvklVAaRgnxEwZ1+Y8yyv200f57vNWIG7sQSczx99xzPESVe9B4
	hZ9HkLpyYMcGVDlYKFIdL9B5FUX4a8vfj0VNthrStUxlUBbnBvzxARbtDe69kbnT97E+/u/i931
	geTl6+h0V81JL0zPsnz0vGbZos0MKSAcLHsGefjgpaF9ISaA1i6pzche091IZYgLVS1TUhvtT/C
	LJlDQ5bh4nsIfjjt1BF6mF6OpbfTxacHr+n1Yd54ESNZdotRSZ9oopYr83ge2r7ApB3s8Jjj2pQ
	PrNEC8OT55LBGpdtnVUbeEtkWAPiwQpxSA7RMBf+boqApDQ66MQ1C0yPzlTuR+MJs1IQXOub4UO
	dwJfj+mQs5iUCc6o3Z5DlP7m+BTf8rcymHtD/dg7NUpC9DYzVlxBugYwd+BkDGfHAoln6sWQK+i
	WTm7Q==
X-Received: by 2002:a17:907:3e16:b0:c16:3074:657f with SMTP id a640c23a62f3a-c246a4ce3b8mr3890086666b.9.1787666080385;
        Tue, 25 Aug 2026 06:54:40 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a336fsm1819330866b.60.2026.08.25.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 06:54:40 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 1/1] ARM: dts: draeger: Add devicetree files for M48 Intel/Altera SoCFPGA Cyclone
Date: Tue, 25 Aug 2026 16:54:25 +0300
Message-ID: <20260825135426.3967333-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825135426.3967333-1-petko.manolov@konsulko.com>
References: <20260825135426.3967333-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
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
index 000000000000..fd597f15c0d8
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ */
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Draeger M48 Cyclone V SoC";
+	compatible = "draeger,M48/socfpga", "altr,socfpga-cyclone5", "altr,socfpga";
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
+	/* this allow the ethaddr uboot environmnet variable contents
+	 * to be added to the gmac1 device tree blob.
+	 */
+		ethernet0 = &gmac0;
+	};
+
+	soc {
+		gpio3: gpio@0xff202000 {
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
+		gpio4: gpio@0xff202020 {
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
+	flash0: n25q00@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "n25q00";
+		reg = <0>;
+
+		/* chip select */
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		cdns,page-size = <256>;
+		cdns,block-size = <16>;
+		cdns,read-delay = <4>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+	};
+};
-- 
2.47.3

