Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A4852ED43
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689273; cv=none; b=k+vMFaI2ctxunz8+Ye2zgMg4zasD5JrPXxMcRpm5zGkfbyoBEKkptM0Huo7eycCw9qIweVvJspL+1AUiOjfgcC2XjBpnjvv1qyQB7jet19Du4H4fqKBJbVEVzKULCLkFNXxl9h6d+kBaoxqvmIh3WbJn7m5iOYBToXH7D12AvsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689273; c=relaxed/simple;
	bh=u68RXmT/Sqpj774qbZttK750ZjXFsc8Kd5cz8NV2MSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XanGl9TJKxA9qR30GvU9flx4WlA0V6J2S93nbbxMp6o74BsKcxYF81YQxH+ZD5B/NRlTtQl61xWfXuN/B3EKsJz1vMEXq8/DnDut5DT4PWyKnhksjeP6MNuehCV82pk6SJbEIbkzOiA4JkiuWFrpx7gO6ZY65oE6T8Bn3gpawr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=akp5e2k7; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="akp5e2k7"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso2377700f8f.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790689270; x=1791294070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROyJEnjBCwjimM7c0QNu2igXzZ8L2z4GWuRsYUdhFyU=;
        b=akp5e2k7UJRgaFSb/x9b8qAMNyuOorBayacrlWudcZaIVlTSTv+H3ZsIjpnVK6t2aY
         E5TYQDwRoYsT2+8bs9xBDmo+YQaz96sxN35ZWdd9kAsLSo530GdcCnNiAidd7OBaIibC
         hoQ9WHo118JkRlb2EnTm2ir4e+KzewL4HDMG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689270; x=1791294070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROyJEnjBCwjimM7c0QNu2igXzZ8L2z4GWuRsYUdhFyU=;
        b=D69+15m0Fyp2Aw6GZjR6VC70UDamQMvlhnzNeA4ggYWi0bT0BKd5fCJHdWmEtFsN/t
         gDEfx1nm5ELQN7chU0Oce7HhaSBRSiXQGh6HYMrA3zjHOn/JVUTRGcwI8zJ2+8g3GtXd
         HAAorW6Ta9j7dsOW8RlXC8qQ6XLGI0L+wc2w36CbpRR2IJ6lO/uBleG+rv5/BQR63dvz
         Ic3IepNiIOV8hyh+UwiCy7lB2E62BDW7g7A0WhENNJoZXDqcEdEHOnEZ9c68GJ8V/bDB
         KpiTbdXQ2hH1jYxJZTWcFFsqAsgOXRqb6rMRL2viAaqNFEjBcVnBV35SgJrs7Xfezb7h
         xBJg==
X-Gm-Message-State: AFuF++kXV1MABFR6GOPFntgFn5vx3V/g6ThVYBM3fcEnQuXfl1hvxP53
	dTW3kFQYn3H02Kz7xp351UfiTlMDbaKrgAkIyuCQBUevnBVSYOhzUG+Q/55jdj57CEE=
X-Gm-Gg: AYBFou2uzSLieMFjO2RkErk5luBV+67FZtrDJUBWW7IqFIhF+Jg1zPlnACDlUIvygwr
	7AopKKNDQGtgFElavRzfXH7W+ps3i3V4/0mfMui2wjMNJcDmIBxw/oZ/j35PWN8fdRbreUYkiPK
	ytY4YwksDO5rzp5s7DLtzjHpFcSg9Bfit67GPtJdV8nM/uwwHQKqB65QDr66j8Xj0jDSjp1PLpJ
	f/cCzeYXXeXilkRMfDjGDCPknj/AbsNHsZc7spbfkxFFXGdKxrNAoD9PaHdeNfN6JrQ+vAA/bLH
	z38FDxKW78M42+IHhLmqO0KaqK4as10o7B5L3lTunbwDVaY0kDPScbSaYmfHzfQ6/RaQ2FAs5iC
	Br43U4/SnDWqGgy7taHs5RCykrmoAy3TFlJhRs+TGGZvBUz71OO9P3Un3fyIQJkbw3e4/7HO/Wf
	sSG9hNcPLA/GkJ8coWFmbfdHtqsDy/eptLz1twT+zX9M+eask/Bx1mfUBMQJ8GCrml64fMUGeE+
	7XSbrsR2f5XtsQ=
X-Received: by 2002:a05:600c:3494:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-49fff7399f4mr136125885e9.18.1790689269703;
        Tue, 29 Sep 2026 06:41:09 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d1011d9sm91835165e9.15.2026.09.29.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:41:09 -0700 (PDT)
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
Subject: [PATCH v8 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Tue, 29 Sep 2026 16:40:57 +0300
Message-ID: <20260929134058.819371-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929134058.819371-1-petko.manolov@konsulko.com>
References: <20260929134058.819371-1-petko.manolov@konsulko.com>
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
 arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
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
index 000000000000..85daa839c314
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,91 @@
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

