Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0B250B8D2
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982965; cv=none; b=lLNfqfmv49XwZs4VCVTSus/koMBeuOM1P6sp0dsppoH0JRFLuMcXf2QnrSFavtsCazeoiF6gsD/kefIFIHpUaPZsJ6i4ujLXGSrRVNBSvyBupdt+HyxMVUt0BXI7e8/+/+iBVxVBGZOWHcWwA+chef5U2dtpRjhOZbTby2NOvgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982965; c=relaxed/simple;
	bh=4FdlLBJoqpDFYA6HjvNHnqM5yD09QQJ4fKl32c09zsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lK1YS5gjHTw01+mTjwLJEajZFG8Hh1a2MUJvc6LFG2qKslQKCCF9ZXrT9cRtzIiepRjdDPvR2zQi66gZD6dMgwqkVLuRVEz7f2ssehXWgwyc2itRgLcyknhd/QUX99u28k0UPMgF8dE1itn8F4JeUaeTHpyKRwgjiPp1VuCJwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=LB2lEkVI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="LB2lEkVI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso29455305e9.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791982959; x=1792587759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzolvO3m4kvSEWLa664TtxJM99Sg9wbekRZaNIqbzEU=;
        b=LB2lEkVI8SSDysZgU2wVSUFE9yLba3GLpVQj+D+iTyDLN5z4u0VCHPY+GnXw/bhIDj
         WGT7WqoHpZH2ifQR1y/IvvjfxsIIqD3eTZXt7d70Ukiul9ihnCP38lY3bRNoa25ASkbo
         WGeyIbwe3MI/QQw7wkPFT2Sd9Xr8PetJHPulo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982959; x=1792587759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzolvO3m4kvSEWLa664TtxJM99Sg9wbekRZaNIqbzEU=;
        b=EBCi5lyRLyeIbR1r9gTaqx2LekGptaDVDT+QzrAkxmeqKGItipgDode0kyPc9md/1h
         H0rcw8A6Ztw27YJsNERY5efh4UhhvhFe5p8iRyCFqSh39b+OAvFRUDu5arp4650WuNBW
         WngopIjXmKHk++GIcWeoWj+3lZq1DqBTqL4jqe3dPCh1XdZ+SR9cmRFJ65yMjtVawaJG
         owqNIwCV1fJCrNkcYoCl+sMoPwgQ8LnTKww6tHIahILCW9HPoeKSZ845VcLKsjp36Hk9
         Nqj5Yx5efTornvylm42gCEHfA2nCo3y5ZAu/yKCag/3RmM9jYsyopNeli3qQ8jJk07VO
         uKkw==
X-Gm-Message-State: AFq9FYIAqrnk5kbmi4JVIykshSrKmQLTUs+9n77jqqAaA1ZXhAvWlmRB
	9GUAi9E7VQvK11MiIExS/84of2VIKtOVzGCAIPAq2HlfySHJea5mI/P93TDAgkHP3EQ=
X-Gm-Gg: AYBFou0gi7fVFIUSJG4b1vKz0CfAzAbwivGfSiTeE4Uq9yrz/xf65JaijEjf+HpkbG2
	jzr3FegZ+lb1iXnuS8O0m0kTHpHvm5x+RTlQQEdOq9p5c+ruIS49fG45o85b+yOmmnR57J+vamY
	pFsQJDTx1YW6ZAvzF+NhUGnMNPcDKccHta2by2bOozJpgdO1fIDRkbZuSySwTTJ+NJufOvUFJso
	YSohcKGTBs0Tt8MifPAiYWcp4cpd/nU2BmPBjKnyYxDyGlc9DL3odUguRj3Kc8k1+KKc5Qd4M2h
	LJgnG+rA4UexoX/C5CyiQcGvvge0IEXZ2fD2oZp+JWIfRPV1N7QdGlr0m/9fZ/jskWJ1EAPbMLs
	VUw2Z9Be2UXNMBqX/bGJCZoNrPJnXcI9uP6PPAavCtrCDqklmyIxgpNWqaObyHspWEEagirDCu+
	PGUCwqmqDEXLxl/GO1XZspzFoBXhTvkJr1FgDQT3d2XxRY1d35ogPRYynwYyGgEECPhTd7Hj1jy
	+Egzk6b+1oNtyQ=
X-Received: by 2002:a05:600c:820d:b0:4a1:65d2:7912 with SMTP id 5b1f17b1804b1-4a18e47b302mr284953305e9.8.1791982959485;
        Wed, 14 Oct 2026 06:02:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm12608292f8f.30.2026.10.14.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:38 -0700 (PDT)
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
Subject: [PATCH v9 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Wed, 14 Oct 2026 16:02:26 +0300
Message-ID: <20261014130228.2780803-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014130228.2780803-1-petko.manolov@konsulko.com>
References: <20261014130228.2780803-1-petko.manolov@konsulko.com>
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
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
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
index 000000000000..bc1909126e19
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,100 @@
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

