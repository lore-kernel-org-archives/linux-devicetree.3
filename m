Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF1C45D5FE
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981670; cv=none; b=MEJVi63CKWfKGjqytUqSNo8nU++gXVb85PiiSL0FzvCgLAnnpd97txUbAGU5NJ3Q6pvDrOI+OohX+ihEJEJWsSaCIfwzTdAAEgYeBRoKuyyi8kpqOTDTCwiMbOyJXTFRSdF2m/bdEBpg2oaoWcYJXO0eSzENzf7ZYHsBBP61rQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981670; c=relaxed/simple;
	bh=WncuUMOrb+o1nLPTlnkYK/LlYBTttwBzacj96h5tcUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRDWASNZ39bf19x7bqGn1l3Hz4ZExOwc57QyY6meY7PA5xuU2yquY/NGIBLAhrp0ffmRoDuDahEzsqCA+7O3gA4al4aTiyCCEKbZZOg0dBY38Sg09KoPgs6+kn+E17RdBRZbDqrH6nBqQjA7PDXg91DKBXOeVZpXVzfr8OxuxJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=AtY/ST5I; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="AtY/ST5I"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so13516035e9.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789981666; x=1790586466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9P0bAkfacAdN+uMzT0rVC2aiF/z3uaeg9DH0YZC9Ng=;
        b=AtY/ST5IUNGGApmlZNbpNh50ApX7+7Fa53eHDZIfAE7R/MRAQa6x2DA0OM1HHeoQ7J
         IZGUQmWjjwXRGQzGh5DpVWkSJ67B/DRvUG2FiGxLbMAC7VLu0oCNm7TuYmkM1vwPRypn
         E4Bf0tFH6vnJm5m6+0T6qEn0f15oowHnz4kSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981666; x=1790586466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9P0bAkfacAdN+uMzT0rVC2aiF/z3uaeg9DH0YZC9Ng=;
        b=RBaIg7h4inkipBOJsQrXc+ci6J25aVwdv4fyGpriS3laDNsC/cOWTFdP5hBG6cuzQp
         zcQ+0zpPL51soa10jMyl0wV7PXoUNV9WZOLidjsNzwbowog94FQg1BH6dZ0X2721GLh3
         7lxdScGoY4v5z3zsTljNULA7afvDikmeo70KkFs9LV6NBJFG9dhqFlJ+JEwa30c3e3Z6
         IjakUcY0AvpIZzu7x7La3ImcBD/EoM6ebDThNYT0R1dSFLkN92A5ajdilMlGwZaxqJJz
         cN8AMlr/CvFPZCmo5bidpjbqz/JzpF8pWOqn/yDxPYfUORKWnpsoeFhcKDp04d5TjjnS
         CZNg==
X-Gm-Message-State: AFuF++lNpB4/zuh9kwzpktETCXyFubM4/UcZTE/Up+TVBpjUoA1o2l3h
	KuTtNycWC8f3VyJV0ytHnAB818J+yEuaAalYRxqkQW5ZohvnvzcV9GOTRfyhs/Oo7/c=
X-Gm-Gg: AYBFou0WVHM1UncDzcBwiw4ZXTJCk3qDb38O34C0D4KN+ij1Zbr8jlZQgYdmA33pTOZ
	ERbBw+J9rpR/O/4v3wBIyOBNwZy959mdHFfqI3q8lKngS5qQf80VefKs2uTefMjfGH99VV0+r4z
	UNIirXJ99JhNcn641N0NrbzoUeoDaBeTrWwwgiKa8xhLFu0nFm5+KG2LpxoyPEOPandAr4MCC+3
	0FSsJQDJAGdQ1CfYQCcjR+TlrPdKa/fn3iiigGGo9WgzGQpVgPlFsjb4ijW5kZu7QQXuYXj9b/W
	tgP1QwZ4zeL43vlCGdFfFKaPXcBhzdVVMcI/UOtXr5XTcU5n61UgDbwuYN1Rd8VxlIuSH0CmNf0
	kmGmz9sM1dFPSNNnmzB5R2wF/WJwYtrWsvLefB5qiQGn/vjceM9nfVRCqzU0mfAkPKPIoVBPmgJ
	Y315dh55AY7+sSqlFIezb/00HfG0zGn0t3ltgg3tNwzjDBe3yrgK5I4cHiDP2LGILGYP2MJ42tu
	q9pzDhSt4mdW8vy
X-Received: by 2002:a05:600c:6211:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49fc5728f84mr128229845e9.18.1789981665716;
        Mon, 21 Sep 2026 02:07:45 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm587218725e9.4.2026.09.21.02.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:07:45 -0700 (PDT)
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
Subject: [PATCH v7 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Mon, 21 Sep 2026 12:07:33 +0300
Message-ID: <20260921090735.3174292-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921090735.3174292-1-petko.manolov@konsulko.com>
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
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
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 123 ++++++++++++++++++
 2 files changed, 124 insertions(+)
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
index 000000000000..dae809c02adb
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ */
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Draeger M48 Cyclone V SoC";
+	compatible = "draeger,m48", "altr,socfpga-cyclone5", "altr,socfpga";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
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
+
+			portd: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+			};
+		};
+
+		gpio4: gpio@ff202020 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff202020 0x20>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
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

