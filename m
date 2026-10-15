Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8D03D45D5
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076300; cv=none; b=rHlqiHQURHbMja0zbOW8Cvn/gYSdQaO6pHmCRS6SRHTZZHgEjMJrHHBxA0fVx5tAMA16rSUoDPZLedGNCRH9qgzwrEHSSfcOsxfyIM0CdYdH4NRFqTeuXSy3QAMabRXw9P+wuFu3+kwNyRMAA/qVZcWfCc5x5R2C+verMjmVZVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076300; c=relaxed/simple;
	bh=M0cMsCZ02U77183RUkE74lsRpwml0sDNx7C3ANSra1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gAJoYpahRvhvpio4Onx7D6dGEc9/SoNX7orPexP2twNJv+SNhWOKn4dOfNz/sxdTcIiSrnkbQPya2yi2A1dUhpcEv5hG9uR21jffnCO9EyPnwbV/Dv6Eqk06Hw/Bfb3OEcWrI12osIdBzDoSqq+Lih2s7cZM84NHHm5u054GuWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=XCoydP7n; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="XCoydP7n"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16c399641so52262235e9.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792076295; x=1792681095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULoHMGCXXt8+sjvVncJ7Ytp+FPxeGBVxIqJ27YF1NHo=;
        b=XCoydP7nMfUDz3OjRd5rQftGWenP03kMuc20BEVKMK4qwzWSzSNjrQ/GlUA0gfKAmZ
         Wet9YlGBwbfapjW+NTAIOvso7B3sGs4POplyhEuuGHFpY9JC1Pe8qbPKG4gmx033OgiL
         F99LNgeZ/fVnbIHdANra/udGveOCwomSBk1GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076295; x=1792681095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULoHMGCXXt8+sjvVncJ7Ytp+FPxeGBVxIqJ27YF1NHo=;
        b=oNXbLUrlBsER24l4mQQrCvwg4DvDlAC/jNHH9JrpdsVPBihw7fGj8grZQkPPlH805T
         0fc+QY8AbeToDGo7MOPnC/wUeKeRJQjSt6hIutg26OkVut+Fw5BA08Gxe15fiAeRl1JH
         mjI2sZgBMICojLV79OvRVrbt80FcsWoWhMjPRMJg+XeXMBqmg+yK12nElP+kp4kgvhkh
         GMJg0bXFietFCBdDaqVC2MIr8aXt7hXxusNp/qKXU3xEUZv5Ls0nWXAMjy5E5djSUWU/
         QXcz5+CYuBqUkvgEteGPf1H8821z1Ak4/RK46y67mxDuwgo6PClsGpyEPh9wmgdTZIlQ
         QX4g==
X-Gm-Message-State: AFq9FYI20AV72TJbuvSxYlu2akeHKQpUbmXqMex3/9Tu/m0GsxHYuneM
	fkSDnMUKP4bxNISubin0ABYDw64YPxW9f6M8fD/q7+CxxJ7l1r6PxqmFbIF7Er7Kd7dZctE+0xM
	vuUjW
X-Gm-Gg: AYBFou0N5M4cdiolKsFLEnIJWpcInVp0Sj8HEKvBmVP9SkPjAJI74oe2eVTqArJ1NZR
	TM3SuSRXaGp/kSgAU9ctW3IY/iBa9Zuh/Njiuf1Q0a38Xu5Ah23N1exOSC4RvBTAb1MYOU89wJF
	cl/+RjRdfuu28yfK37afzRy+v/vV+FqyA11iBtzcvTsH88dogu1IyOqtDCap6roMwiY+OJdm9h/
	Jq0xRh0NkPXNoQi3GMarlUOXaCktkpovqo0DqZob+fn+/B6mnvEqulydQmNioqwottxagHq9C+h
	Hx6LOxJapFADySR2iKO1WSeGaWXwo4yumrs/C86fUv/U09Jmqw6qfF+a3fRnVoyNNDCnLk7yF9w
	657vy8XMpcRJeKkexeBKoxkY7pybSVpcy4HpD3/BGIxxEybpd+jw55kLeDtz8IEkUcp/7LqLsvV
	ISy9dCV/bQcHSlU4j+fMge1HOVfyj6Nnp9UluNod0Cw7HouyrGR4Q02dSkZ6wGKcP+dnbtRn9y0
	pIkpKszgZnR3QeR7nsbn4O0Dg==
X-Received: by 2002:a05:600c:46cf:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a18e47ad5fmr428103185e9.10.1792076295305;
        Thu, 15 Oct 2026 07:58:15 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ed33sm88053985e9.5.2026.10.15.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:14 -0700 (PDT)
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
Subject: [PATCH v11 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Thu, 15 Oct 2026 17:58:03 +0300
Message-ID: <20261015145804.3632839-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015145804.3632839-1-petko.manolov@konsulko.com>
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
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
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 101 ++++++++++++++++++
 2 files changed, 102 insertions(+)
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
index 000000000000..314930a52de5
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,101 @@
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

