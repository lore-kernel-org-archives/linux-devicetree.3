Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BA74028D9
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886900; cv=none; b=iJWb7UZGQpTmPeYkBi4JWDT6hF4xc0wKpdPGudv/eZ71v7Yx352cM+GdxxWprwxnSVE4C45wTLrCNlFDgdHA10CMZCkaREnMbGYi69gDsq8emM3LZ0qlvlCd3N9OsXdsIb9/X8MI27YGV6YgMIZLyuIUQBcPnhmVncgD2n+xxoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886900; c=relaxed/simple;
	bh=qcVLJczhLVF77VjvKP3+H0o12u0hwIN/GBWxg/eWzGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBoQ4QAhkv5r3JEeT/3KYPacIj8oO0oaH6Q9cKFe6YonOqZrKzXzyVG1vdmSLp8Ej/QB91DiYa9Ogoxf3MQsMNl95X4A1pIUnhgaT5bCCbCQN7BBD5gKIx3Jp1heXozfZMnodmgPZEh8HRo9fmAfD9evkVEdKYzJLkI8j7WJAvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxFIYv3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFlkdjUE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxFIYv3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFlkdjUE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lUo61510162
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJ+XG8fKARImpjXxnXkd7ors2tn1d27g2wgp4VBamlo=; b=ZxFIYv3qVWW6oXEs
	adkORp+bL4RY51VpA/lXOTtn/j/7GnXHSycD0uaplDA8S8lz2TLUetVGc0SqoWQW
	qP5NEnY9BEBQh4PvRj459KKqlLvci36vOrGoVj07MR8FX8XRaW1dakIgKSXZTJ8A
	kcKdFMJ9rO4ZHAeWFRzVlYSVlkKIzitzq3dpFVboPvCXFLXmGFz5BoTmaPPZw1S+
	nRDAOlTMEjERq8m8p10xHZGnAQlXMv1QIoykVbxb3bWJgeZFHSOx5YocwGEfjkbe
	RY1gpAmRCVNJbt6Egd0AHiKMbzc0XcReZdy/uo8jLuhZ2Z22Wr+f7ATCthMhrls0
	C0Gxww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrt36j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:54:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so321695a12.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784886898; x=1785491698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJ+XG8fKARImpjXxnXkd7ors2tn1d27g2wgp4VBamlo=;
        b=QFlkdjUEJ7XYywRAi5zPqMf107bP2op5i8mJ0x7qR3//NGs1mSj2babG9rbzsrBqiK
         mqD/6FFpZASy3YOoQ9c0/14LzWvq2JESZRN4xdKeQGSuL0rUNoppFh4+anwtlaGWnsYT
         fNF9bvtAgzP9l7Qc78LRWsktN0PpqnvSsPym/t+jxRtWsMUgPH3akoJ2zD66gYyv32eb
         N6YgQENFIGRSdRM5PG2f+8IFxU/LRTiLDbCSkX+N2Vv2hyOniQbbonFd2S13+MvEeeoz
         q6XBoZIcQqIVqE91pzGTPXRwLInHtNU7kDbB0SJpJhF+ZahmC2SvWtl5J7wBWSyxn5JX
         LAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886898; x=1785491698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJ+XG8fKARImpjXxnXkd7ors2tn1d27g2wgp4VBamlo=;
        b=VWdOtHp83MlwcTJMWWjHyLplSjTiR2DmNlwyoCgzkucj0Fep+JPOtuCVNcl8zZy+gp
         3hics4pE7DTJjX2PX6n5yUSw/UgdoSgjPaiqUz00fV6LzuWtuVSva1Yo+tlRiWh8DHvn
         A2ZNYLoshv8CrPOBQesKS8ApCkaY7baQbINQSsr2GPd0EvcVNb2XriPvrBayV5rCjIAU
         kCg4kBCPD1laZV1OFJGwEni26IRCkU7ZTtalRCDUt1gohDH0862s6KWYbXi/Eko9S1GP
         W3USiT93rxUYBqx4+/rKa0C0comeucOh7i5xRnXts2zDQ9SXvzWB4n7zet5QXQiLUf4B
         KyDA==
X-Forwarded-Encrypted: i=1; AHgh+RpnUxb8Spe0Bq231Penpt4Px3b29y953vYYAD8vPQrXUQVOqj5Utibn2+/o0zKWgYbKUs46zS1EWx98@vger.kernel.org
X-Gm-Message-State: AOJu0YxGceZ9gmNpwcL10F1XSztZsIDe/bUSqDe7+XAnnG4d+AIG3B6Z
	4kBBzeV4+gQhzc9NVvmWIrIglnYNfwr9ZriyftQAY/ZyfFfnETKFR9hipbXCKtUJZrYbQQV+Jiq
	746K1xzLdEckq9Am5kW0xFkOMPSs1qsnXYaxQ5ZJrXH91YQ67nM2OFA6glrQRDJN+H3Cq1BOE
X-Gm-Gg: AR+sD1296Dk3en6Uj+jK98VKpm/Kqg+BMl2v7iuCzuV4ObI58k6qAFb0MV471YtOZze
	/k0D75Wbb3X0CHjpG39dvqzzED9swSUqysyOMStDQn6Ff19GeHjhpl3/ykAw4JqnAdaO0EGkma/
	F/0prTarNKrqZbTsGhWgSIE4KaivE8vHWQ+lvtgAMV6NNdRISYyuyK/sABHbTGx3jtihgNMF35f
	DensKzfCXAPbzWKMnZucPLK1H3fG7kXbW1x8tkS5oDdbSJouqST8G1NCRmYacFm3RFwCKqsDuaA
	/sml6oQ4ag1Il3Q5qUal/vCbM+VCyHwPhYZtEZQkO+zgr+Sm/sSazpp+UVLn/t30nBa0O9RF9CZ
	LSnd2WGUCbb+lS9Gj++V2lgROviBj7YIESZ3ry8aNGw4pL8bEjLNifI29LBduwKyPwdAsvCaUc6
	qMbJqNSxDi3+Grguh/5x7xQjmESBBuLA==
X-Received: by 2002:a05:6a21:e8b:b0:3bf:6011:53b with SMTP id adf61e73a8af0-3c44b18c993mr7612953637.38.1784886897585;
        Fri, 24 Jul 2026 02:54:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8b:b0:3bf:6011:53b with SMTP id adf61e73a8af0-3c44b18c993mr7612929637.38.1784886897132;
        Fri, 24 Jul 2026 02:54:57 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm28975093eec.28.2026.07.24.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:54:56 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:24:45 +0530
Subject: [PATCH v4 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504 common
 DT file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-08-dts-v4-2-65e61a1061f0@oss.qualcomm.com>
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
In-Reply-To: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MCBTYWx0ZWRfX1kyaFAyTZ85w
 EjvnBFmYbsQlRsp+Mvf/LrtHds2x5mLTpagDWlnZmuzSXYbFNSSAW0WYoDjCz6FXP636QAKgIsi
 UbmsifG0Cyf7KHw4qVh0FjDrlwmjM5A=
X-Proofpoint-ORIG-GUID: YutKztO0aDAecN__6Zou5k1tVYdP3F_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MCBTYWx0ZWRfX6bXlZ4n4OPpR
 dlobTcojNkB2wRCkGTidnQ/V4tzIVJf8stlTYws60HRSDP8VC+QjJmp5udYcY++/KP3+NT/km6Y
 Snx0goxeR2XQN/AnDWNH2Z6LNYcfMfuAggutL9Eb9PPLlDYYJFTcrdOY3bsC/Rg0ie9CgWhNl8+
 czeMR1u9O6/XbED5/ybtyIx6Agqo3PHdtwSWUUYaN1loio09w+0LDEqm1ubkFZ4fZ9H3QBTVdZd
 P7VofEy0iG7SJaUOdiLpcWjjOo8YIr5LLOIXxuIc634Vu+lD5oBgEjDr9pjxN2pIKOv9c7LCcSl
 VRUT3rA01MdWgnky91XYLIuZWE2plMT5GMZ7LqBJAo9EI+Yin/hz83ElPIdAjE7iQuu7z+T3qYp
 p5YmYSVcLWfD7QWUHDbVtJK1zii0Qg0cUP7fZivSj8hHZ6Ul5utQwsqbyObxHLcSoteRm0+uFQt
 /oV+1G1k3XH6/2v5JyQ==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a633672 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sBhH8NEu279NYU_71NoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: YutKztO0aDAecN__6Zou5k1tVYdP3F_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240090

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Remove ipq5210-rdp504.dtb from Makefile to avoid build break.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 -
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  79 --------
 3 files changed, 209 insertions(+), 80 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..88c898d8ac3b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -25,7 +25,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
new file mode 100644
index 000000000000..30c8560822b5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "ipq5210.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	vreg_misc_3p3: regulator-usb-3p3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "usb_hs_vdda_3p3";
+	};
+
+	vreg_misc_1p8: regulator-usb-1p8 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdda_1p8_usb";
+	};
+
+	vreg_misc_0p925: regulator-usb-0p925 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <925000>;
+		regulator-max-microvolt = <925000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdd_core_usb";
+	};
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
+};
+
+&qusb_phy_0 {
+	vdd-supply = <&vreg_misc_0p925>;
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_misc_3p3>;
+
+	status = "okay";
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&ssphy_0 {
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-supply = <&vreg_misc_0p925>;
+
+	status = "okay";
+};
+
+&tlmm {
+	pcie1_default_state: pcie1-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	qpic_snand_default_state: qpic-snand-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs_n";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		clock-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio38", "gpio39";
+		function = "qup_se1";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usb3 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
deleted file mode 100644
index 941f866ecfe9..000000000000
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ /dev/null
@@ -1,79 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
- */
-
-/dts-v1/;
-
-#include "ipq5210.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
-	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
-
-	aliases {
-		serial0 = &uart1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
-};
-
-&sdhc {
-	max-frequency = <192000000>;
-	bus-width = <4>;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	pinctrl-0 = <&sdhc_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&sleep_clk {
-	clock-frequency = <32000>;
-};
-
-&tlmm {
-	qup_uart1_default_state: qup-uart1-default-state {
-		pins = "gpio38", "gpio39";
-		function = "qup_se1";
-		drive-strength = <6>;
-		bias-pull-down;
-	};
-
-	sdhc_default_state: sdhc-default-state {
-		clk-pins {
-			pins = "gpio5";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio4";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-};
-
-&uart1 {
-	pinctrl-0 = <&qup_uart1_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&xo_board {
-	clock-frequency = <24000000>;
-};

-- 
2.34.1

