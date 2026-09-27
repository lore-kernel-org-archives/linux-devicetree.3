Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A35A3E51F4
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513212; cv=none; b=X/JgWmVmRXgbmVCEpdYg4Qok+BeloXqMfTV1e7PAvxQZ4/QOKOgdgpxO8rLQoe/3u/eitcw4vd5Bd8XAOz/3k8qY1NsuMVUCs1/3/AePnm3lqtkfe11QiOmGMtwBkEyln4jCfkKKWR1chplURrJxyXI8Jq5uercn3ckJVSkCCrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513212; c=relaxed/simple;
	bh=aO0jfTeBBUtrn88kIm9oVPFxK0MaKaOchSL/DtYqXIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvlkRCYzCOpqmPS9hnFQNOVk+S/ldViPf1cg/esNK8ReSyrHOmG70XsC6eQ6SR6WfCEg+acPYePUcQn547oWF7+OsIyrPY1LEuVU+q1fBoFITGZYCBMeGY2OqQ6C9zWhBixgH5u4zpDOXM5lqbOU7rqICRtNSsIs/vZGzCpXLVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqbaPmn6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqbaPmn6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so16093615e9.2
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 05:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513205; x=1791118005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2qVhNq/ulYcGTI2MPiVjpYeX+WOZy3cqFCk18HRP7A=;
        b=FqbaPmn6Lm9f8lZii9+3mU5O10k1Q98K/dHayTjaCgqy/NwId2jJMcoFZREwJKLW3Y
         13K2EH71K8HYN6/p/dw9qSSxO42OwNjxuH/QjKkJi4SvNjDFfJ17BoXpBCbngXXZJSs8
         +wt4ae6juc93hN3QYJ8kFxC9eeiPXo6o/8NsLN4DpCUgtnRat1ZJbQm4rY/Uuau82KAG
         x9EKO+T2cxNUt2/1oO41YFyWKB5ipmSzpvwBU+YjNcM6nafphPzEkcpWAr63ZxJk++Og
         LfmdQRl5+vGwar9LY8v8QeUUnKWM33tylwC1UMGxrJzlZJ4uIH57rYUL7OyUy7UnmjN9
         g/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513205; x=1791118005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2qVhNq/ulYcGTI2MPiVjpYeX+WOZy3cqFCk18HRP7A=;
        b=jcBZZc1XbEtxxMP8Snc7SyOBu6RQufc0ynjv3h+Ml5CDrG4VWgpxFnvIYxf85ZwUNF
         HxwbK3kMFvb1pO9wVvaki+nrGRXWwtKEZydJGiq3qAQZGQ2r9zRHbmcfyopZN6ePdIuN
         2N4Qiz8M7GXx7yTlThpVc+plEEmJCEpHa1Cily67RH3+WE1WR/kTb2Ei/1dKChtQaOKZ
         nbc4feAkuXKSbLtDWrBNs5Kmwt/hdVtP3prNRzY6/ziR4ic0yFgiz+8nMOCkmhzEIDbY
         if/Y/VEZl18xNmY9GFodRXXtjaQmJOUPkIr3N65UIhd1sAfbE5pODz8cToi2cyd+DXoB
         nBMg==
X-Forwarded-Encrypted: i=1; AKwUvBw4o2H13pvEnY9bOIz399WQV1imsawPKPYlbYsi02SUihvn6QNl7JlCPWa61gU0Osp8c3sE/5ZBuWUH@vger.kernel.org
X-Gm-Message-State: AFuF++nlCf1xqO0N+wWkGEaXuzhyPRDtyjUhjjiTxwIuZv/OCJxL+SZI
	Jt0NMCLvDy43/XoRvRQIDJr6xWNtkE0rRiNA23N+VdsLsureNZ9ZXGuT
X-Gm-Gg: AYBFou3eLZsS/PndExVSRIathBPw3QyjfdUPAXJO0pH0bOU0QSf4YtkK3nOzEYExuc1
	2ZL1vwzMX81SSxk6nuz8GmJdblMXf3MjFM1COYRSi0lnTXze4TnemS8WbpG1133M28g0Od7D3SS
	JFh2dFCMwGW+ZIKGi+wXm3BhH05fPjlc32g/COrFSJ4ugM8Cprw9XaoInEvXzu5bgTGC60rX2m4
	G82N1CShF7//tbCX86yiit1TPzBcku8vMiBnfubZA9OvCv/pcbe3Zfa6jE0fBZbTIQFspgXJVat
	HMDrrgQ4n8ge4aJ+Ypb3jbhONWwbZY2dNHsa0VtlnsHXbqy0T9vnUdCTVdyCCuzAPj6jj69yBow
	alTpFa/43SrD3iD53Yvd4wtqIrF5GMq7tyV9RyG4gfSAvJDtBV6TKJH6dqIpaPWQCMT5bgY27ED
	j/GuHWTdOzc3WWP4+D2lAe4rsZFmtMCh2hIorx2AabcSOsga0VpfOkksRTN2nDeQc/Fl6ZrN67L
	5dgv8jIpcoZmU92szPAD9ed6VZiXKGHKQIJ3z1s8CxeaeKx1Oe/COE/LnD7f1bMjKJyJzZvQ1YF
	lF1QXhDFqTHGomQ6mT5jtQ==
X-Received: by 2002:a05:600c:628c:b0:4a0:f4:1c76 with SMTP id 5b1f17b1804b1-4a000f41d51mr30627785e9.4.1790513204572;
        Sun, 27 Sep 2026 05:46:44 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:43 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 06/12] ARM: dts: imx6ul: Add Variscite storage and wireless files
Date: Sun, 27 Sep 2026 14:46:21 +0200
Message-ID: <335592bb96129d875cf77bd87cabb77f1f9476da.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add shared DTSI files for eMMC, NAND, Broadcom Wi-Fi and NXP
IW61x options on VAR-SOM-6UL and DART-6UL. These options have the
same descriptions on both modules, so use one file for each.

Keep the module options independent of the carrier board so each
board DTS can select its assembled storage and wireless devices.
The IW61x SDIO host has no child node, so it needs no address or
size cell properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Share identical eMMC, NAND, Broadcom Wi-Fi and IW61x DTSI files
   between the two modules.
 - Drop address and size cells from the IW61x SDIO host, which has no
   child node.

 .../dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi  | 32 ++++++++++
 .../dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi  | 63 +++++++++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi | 42 +++++++++++++
 .../imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi    | 43 +++++++++++++
 4 files changed, 180 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
new file mode 100644
index 000000000000..26c8ca8f21a0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	bus-width = <8>;
+	no-1-8-v;
+	non-removable;
+	keep-power-in-suspend;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_usdhc2: usdhc2-grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x17059
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x17059
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x17059
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x17059
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
new file mode 100644
index 000000000000..1522b5d7e092
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand_1>;
+	status = "okay";
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "spl";
+			reg = <0x00000000 0x00200000>;
+		};
+
+		partition@200000 {
+			label = "uboot";
+			reg = <0x00200000 0x00200000>;
+		};
+
+		partition@400000 {
+			label = "uboot-env";
+			reg = <0x00400000 0x00100000>;
+		};
+
+		partition@500000 {
+			label = "kernel";
+			reg = <0x00500000 0x00c00000>;
+		};
+
+		partition@1100000 {
+			label = "rootfs";
+			reg = <0x01100000 0x3ef00000>;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_gpmi_nand_1: gpmi-nand-1-grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
+			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
+			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
+			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
+			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
+			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
+			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
+			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
+			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
+			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
+			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
+			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
+			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
+			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
+			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
new file mode 100644
index 000000000000..d7952233a1ee
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	reg_sd1_vmmc: regulator-sd1-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&tsc {
+	status = "disabled";
+};
+
+&usdhc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
+	keep-power-in-suspend;
+	vmmc-supply = <&reg_sd1_vmmc>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+&iomuxc {
+	pinctrl_32k_clk: 32k-clk-grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT	0x03029
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
new file mode 100644
index 000000000000..d2f116bc8d70
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	reg_sd1_vmmc: regulator-sd1-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	iw61x_pwrseq: mmc-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio5 2 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&tsc {
+	status = "disabled";
+};
+
+&uart2 {
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	keep-power-in-suspend;
+	non-removable;
+	vmmc-supply = <&reg_sd1_vmmc>;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+	status = "okay";
+};
-- 
2.47.3
