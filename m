Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957B63FF1A9
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666560; cv=none; b=hCGSXL4gxOX8SMyEp105pmPejiUAMmla7lD96Bx8nmk8IghscmLHl7IwiuBTW+nFvmB65zt2g1eqLb9Bhu3u3p0S4xDD4u31SOjEmhFdiwTwqem6dGfK3G1azjd5q7nXFs8DMgAyJ8XCfHJ2lV8+9MjM7SltNwHUWGexwHe+qUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666560; c=relaxed/simple;
	bh=O954oCb/X6zJFFKR9J1IhOMsbO2BftkbFDfdzjj0t24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZ0OhOvJtmiI80iaSE7Ez4cgs1ZETa9QVqzjrxyjex6C4rKgveBLFORjg25ve/QfgeUmwU2vyaHjEWql6vsJPhidGiuJ7wnxHM6thaD20qrmAhBlamHVwcgEYZN82074OiEdA9z3uh8PTSa9XB8GArPkkltTFGeeWJNcYX4NxkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=XB9Dmah3; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="XB9Dmah3"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a157f90752so8049491a12.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787666556; x=1788271356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCkLszOPb6Hb/w5Hz9VQzAO60/GLzuXIDg2ZoU++UGk=;
        b=XB9Dmah3ltJEcbre1kkqGMxu83QofFUm2yrux4EQpfUENXSuLhca4HnWfq/WvDOyS9
         c/huTG6ZGpMpGbhXy/dIUqfiu9wCmhYnHyiNzdZijAJB8xG6b5/PXm5ZceTJZ+XzVdwq
         N2lJReQs+g3acAZEmb5c5zwnv250DPdaOdtX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666556; x=1788271356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCkLszOPb6Hb/w5Hz9VQzAO60/GLzuXIDg2ZoU++UGk=;
        b=gNBDPE7ZVCK+i8j6bCdHJ7wLahS44DQCSfOx78JAw5AjhiNlh/JDdFzat9vIjesn5Y
         W2jYFvM9X0n0iO1o6aCJNxSjLCDFjIAozLxKwWJMkYI0T5lla0y5KpvChIMh+1JtPAGV
         sU6odetMt49zL+IWVwlYySTQGT32RX2CIT5sf/dgShJWtVOwqJ5D9t0PGQAfAhcc53dm
         /gjc3lajzWWfQlqYKUAiks9x87UGxA5l0n5+05hVXMaiq+J1ujYKaGR+u9RYeoySxJ/6
         v8v0KA/1ST1GWAO9ZB9jQnqRDLsoFQjs8IxRtbLxkTHXFq4NhDfsNvqJe7SZOufPnUS6
         XHQw==
X-Gm-Message-State: AFuF++n2BUNKRvXfyWnX1ZkdnLZjbBsIk7YwPWlv/388v2YpUeO1iMil
	SLgpbwwoaGRQWedDfFiLO3Fio8kzhdNk22tx8nB96FYS9NebLg5NSq/VTfB2/xV6LT0=
X-Gm-Gg: AR+sD100y6CiIYC9PAKrItAIiQjx4V9nS7tGOwZSoh0pfwNYnxfpcltlz5Xe4sVQilc
	tlGvbtPsXAGHYtHTUW9K8HuAko2UIylDC+Crffss2vIeZZzqwJVs9hUQ3Wm95+0VdGuinvLCghY
	3ozwQ28+ofdWKd+3kx+L7Xabeb6eJQhiHnfZo4c+C8gM+cRWp3l2sA9V78DbU8+ql7dGFkI73Qo
	Y+fWTdCNCPRof/MJKVIgH8LMLuGduYtzrJJGB6oZ35MTVxPQo/DDtsR1kVGbD9/2qbrRHAdWtP+
	5fIfZisXdaocw/fypZmwD+j7m4A102h2+7NV4svJKpGRNsXDR3iDrrNpEjxrNsPbQ2+JqKV16i0
	/8rrN4maL2hK36qlMgdXD7o/eFfRh5NT9pID3wa4skiJMuWJ0mVivb5FeIi1TGwspTEB+WseIt4
	RuNP29syntsbbleyRRiShgPFMcp/uI+1sxqrB8RfnWUKY5NN9ubZSOJ+ziuuAzPZr89bMNml/jn
	wP5Wg==
X-Received: by 2002:a05:6402:1f0d:b0:6a1:bff4:645d with SMTP id 4fb4d7f45d1cf-6a5c409f22cmr8077327a12.2.1787666555707;
        Tue, 25 Aug 2026 07:02:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm17187878a12.1.2026.08.25.07.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:02:35 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 1/1] ARM: dts: draeger: Add devicetree files for M48 Intel/Altera SoCFPGA Cyclone
Date: Tue, 25 Aug 2026 17:02:22 +0300
Message-ID: <20260825140225.3968019-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825140225.3968019-1-petko.manolov@konsulko.com>
References: <20260825140225.3968019-1-petko.manolov@konsulko.com>
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

