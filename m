Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8DD2E175F
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471047; cv=none; b=TtPr75YFSoN1WRgNtbPcnIhSsO5kqfc/OG8BVqZN0iBZopYXXm/O6SvBbZ0cVoGcqlhcn2zOLi3afOliew9+40MFIX0J+zFoZ/324WRtzplrF09tYKbGjx1KPArvs7INQCX5u27lbcCYDF76RMqhgIiRCLb8fZeVdz7CxHkZo6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471047; c=relaxed/simple;
	bh=gGk1cuRh5R6nn8Nt99YcR4IXdl6kUEHJN5Vhj/i9vC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYfkTbai8WbfqUEHL7gJyd/A1zX+8RBpGNRAuGU8uKRTEDjdPuBLwpGfYSMOx88hFA1khqkn226tunp6NjUoLEvgVhlYEBn1TztS1tjNMHZbbupabXSrB8riq+TRye0Xm10prlm9XF22wO4kzxE70IqReKA2UCyVhQCMW8aJFvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=deviqon.com; spf=pass smtp.mailfrom=deviqon.com; dkim=pass (2048-bit key) header.d=deviqon.com header.i=@deviqon.com header.b=J9SUQNf+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=deviqon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deviqon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deviqon.com header.i=@deviqon.com header.b="J9SUQNf+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ad135063so115597715e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google; t=1777471044; x=1778075844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ei2I23cxbDY7cAitx1gRFwNnFrB/uSmdwFv7/9roIc=;
        b=J9SUQNf+2qTMaDgHCsYX1LDOxl8/Xxm4mhM+tfckihwkL6XVDZnVzZBGoazsKMJ7Wy
         W9+O4C0AlniE50RWRXuhkQtN7vQBcibkUnkm1AYy0aDZOTx+I+uPjegb44W/fZllrjto
         UFGiNr8x9QvUmpXtTQCYJt4yttGvZKaA5nc/IW/O4uyyh6UE2B9ott12VK8rwkWFNK6R
         GeZ0q4FogHML/w+/pJ0TaH0J1oCnDLRRRp1S7xaGbrUvq+dVQTASuSdaHcOlH5ArRYx/
         NWc+x0EZm3z0tki8pTWkHkWuUyxut6wDXKNXJxWnDgyUpqbXnw3/GPFb2gx2JJhhf5NJ
         6UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471044; x=1778075844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ei2I23cxbDY7cAitx1gRFwNnFrB/uSmdwFv7/9roIc=;
        b=JcZ7LwSPogQiDpmMb+zKizWcJjz02ExEXOx1euU6mv+esvrsZ2roMnD9EoEi2Hy1AZ
         S6CEEuDEN1PDAIXVOhnKuECWrkGmr/cyBUhPKECqVX3Jk2OnIPMxVlIBdmpCltEp520G
         b8uqjxFadsJgXSboFA9e0s581MPo5kd7kU9QMFdeZ9SU5m0Az2GysuY1Fxl+ih5CvadH
         ghrjbQzhkowyKjI5Bt5eUuaqpWXHqHZ3E0rj/mrC/g6jiw8QXbr/MD1MbJhPeqYhh0bo
         tLHIT5ZpWxQeQl7IHtFCnlVtKrFBskfgVN/aHfkxSUA2BTwSpW+t24FPMmkBqkNvjyiJ
         g2Yw==
X-Forwarded-Encrypted: i=1; AFNElJ9iTBQ48uV9IY2pgbRn+sFTViqrECCnce6ydLZDrbEymfc4rRpCFubFIeavCGmVNYFD5jSMVnFz/mMv@vger.kernel.org
X-Gm-Message-State: AOJu0YzFLsLfNhsF/CxlnncR7qGk9VJYY0pW4XJZAdcmYhXGbY7EeJ5/
	D84d/OfoHHmea9Cw36qkJnDmu9msFx1+mS2u9AX+D6BpT3ZdDeaEBB+NNQrtNM6u+yk=
X-Gm-Gg: AeBDiesqb1+sfYSyYRHP8STl3QHTrAX4KXMbS9LkHnly2fb2Q9Mu1qJNcOMhHM3Cjhc
	P5pfO4x7ZQ9V5urv7baVEt/D3z5LXlySvlrx0amu37gXv5kSkyuxvnzDfsbjFIarxLFVmYZs8hG
	/bWHigeNszcqaSUnCsPl51j62S7a4HO5s0EYZC6B8WVy4prx11ZTofTNbguVU89qPVzrdwqLjvJ
	wbLNO91o1nofd5unml+RjoIm65Er/IONcor1DzW9i9Fv2rRJdEDQaVusKxsurLXtuWhY67pJnag
	ZrO2dDy8cqJh14NsXZqiCy7ug18l9MS6BsTIYTJVdkpMBOduJhzVyqPm9ySym9AjiYwbdE3ciAe
	33d3EzBfFZe8v6tmLAn6hO/CbGI19NEkwJuLcjDj2L1uuAkWSF23LoDnqvc9JiuU/rpL2Cdv+Qj
	JjXPwsjI2xquS/VkKohLirVelWVl6WNS5B
X-Received: by 2002:a05:600c:4e91:b0:471:700:f281 with SMTP id 5b1f17b1804b1-48a7b54b1c7mr69612835e9.25.1777471044190;
        Wed, 29 Apr 2026 06:57:24 -0700 (PDT)
Received: from mercury.. ([188.24.13.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc1cbfesm68516515e9.4.2026.04.29.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:57:23 -0700 (PDT)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: festevam@gmail.com,
	kernel@pengutronix.de,
	s.hauer@pengutronix.de,
	Frank.Li@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Alexandru Ardelean <aardelean@deviqon.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: [PATCH] arm64: dts: imx8mp-frdm: add support for SD-card
Date: Wed, 29 Apr 2026 16:57:17 +0300
Message-ID: <20260429135717.178982-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8MP FRDM board also has an SD-card slot, which is useful during.
development.
This change picks it up from NXP's BSP repo:
  https://github.com/nxp-imx-support/meta-imx-frdm

Adding Xiaofeng Wei's as he is the original author of the DT.

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
index 55690f5e53d7e..84034b0ccb12d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -42,6 +42,17 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0xc0000000>,
 		      <0x1 0x00000000 0 0x40000000>;
 	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &A53_0 {
@@ -237,6 +248,19 @@ &uart3 {
 	status = "okay";
 };
 
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
+	assigned-clock-rates = <400000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
 	assigned-clock-rates = <400000000>;
@@ -289,6 +313,12 @@ MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
 		>;
 	};
 
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
@@ -305,6 +335,48 @@ MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
 		>;
 	};
 
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
+		>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
-- 
2.43.0

