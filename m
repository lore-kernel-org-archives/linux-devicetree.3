Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B56C385529
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765906; cv=none; b=EwmOMPKQM/BIB3OZXRQT8zE2nPmOaktaNyhRyAG+5leLbH/VmZo6eEw5tJ0Y9Bb1QjVZyTz3vR6lGyhv1jX7mjkL/zmXeziAdvbuV/xzeeGTy37t2s2bDEj+aGgg24vXcEvecz0EKl6ThmALmYndDtePRjgybzVZpdS6Yt9L4JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765906; c=relaxed/simple;
	bh=aJIj5JExM5sY09SSZPiyVUZFc+MFFT+kqdEpBRBeVyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H252HHAg7WogBOI7UL1INHKImuBGRFkxsboDrc2/t5kgKoe4CFA48iLWlL/1gVaCggW28jUXFO/vGhkkx7mpmHkrlp9MxHVGmMjZhpnyAYyplOdlpw8AOL903JAawqx3x1RZrjdiA1mRiLqRT2+VduxEY4BJsEDrq/P01C2Hi7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhkZLkXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtOn/NHc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhkZLkXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtOn/NHc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777J0C4161130
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 07:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfhCoj1XTvjxsCXlZq/cebP5nYcSLluRQvcl1GWh4Yc=; b=HhkZLkXzIN0Utxmq
	ud0iWTT0dIaYyB9hrfzpofIO2oYHIsU1mfVLVr8Xq/jGtYGb6z4Fcu8uL/ehiIhE
	/nydE7yaR6FxkbHP6eUTWoIkrXCr26IcQWe8JXvxcbFwe9QzzwLS9jIHlLZzK5H9
	+ySkRg/T1zfTC5TYJx0F25VOeUb4dCVgQrv5YJM/4SfeNDaumB8t2NnHEr8aP/6A
	CKxT+P6Nanjy8KwW+2zt3L3bz4LIXNm5REc/Kzt0NAEF10wIwFAFacAYiVyVJ/W/
	JzKt8Ix7aTeT+bkA04dfD7d++FHx+ARgS51lXxq1dMG6Ds5O0GNEgwertngw93BD
	oTzxhw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjhe26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 07:25:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so3713465a12.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 00:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765899; x=1789370699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfhCoj1XTvjxsCXlZq/cebP5nYcSLluRQvcl1GWh4Yc=;
        b=WtOn/NHckv+iD2Yox2bg/HA1pdMyyIvDynsA3Mr/4VFxYribkVkBkRANkcLWs27CC6
         GVGNOGFYfXp46GkZsvKMmEVQafuvR9hP49j4TUGomECL17LdrYuUyvlQHqrP1eFfHpYZ
         KNU0MHKRtR1z1DRdx6f3GykDzPaNt6xCjdTxtceuQqJ9jVpRwQLWNJb7nIhXTqg/x5rX
         qivg4g35u1aIQBBSEVw5XO+h6zjMWu+KgeMD7rnfNx4t9JhZ+gGO/TOrgCvPmF9jcqwo
         Sjc4jtbZpa4pUYZd2nbW7YlRxMQ+4XPpuqakHrLs06x9Js8CD26vBQS8TadpJqAsYHUn
         XtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765899; x=1789370699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfhCoj1XTvjxsCXlZq/cebP5nYcSLluRQvcl1GWh4Yc=;
        b=q/0+G4dkgqzyPGYfjVN5oA9PRRtw+3T0u6qdCwEMzMwIjPD/aR6DqabTGf0OHNnX3h
         OoUpnOCd4wKGuBfkDS92lAItnWF612lbP+I8mhneCMjagb5rwKAF2/RJXFGF9WNkS4T0
         lkQdqxwpLT9gUNltXHDgGhvu/gjYgBBl92ezb9O1ygBjCzE11yi/ujp5/j18yHW/V7Y1
         Px4t+LgBTeAah4fhlkNyOFdC9T6zD8Pv85Q7E99wP5SJcr98rGVx/7WApqzb/0S+DI+J
         TQgVPw+xpVRv1RfzDgfNdyA4wS8KtlMbwILKYrWhr6glTVX5vpG2+gvPjYltsSdcYh+K
         nZrQ==
X-Forwarded-Encrypted: i=1; AKwUvByqM0BT4/n5cAmQpF+f7eocQSXVWfa0VvuzhkKum1QenvtsVdANoGGwnZ44kEkxtiQsE7wNadJVFJO5@vger.kernel.org
X-Gm-Message-State: AFuF++kiZ1Hne9+VRqkp3YHVh/Jr26WbtWh9zkkr/wh8ZT8lzTv/o6n2
	mujNrOsCMx3rXXDjI1OpcGXXeoVpTYyL0EZixoQ8h5Vbdc2zjoKUy0RThxV7mAbAlueK42tRrjP
	217fgzvepeoVGgreZ91zSv8umx5sDh6klPulxjI33wP7WTfnF/YbbGgtG/ZPrjFka
X-Gm-Gg: AYBFou12DoVS/LIzn8poRsnqR4faYmvUJ8jZVW9JP1n7gQ2nd5RTNZECRTcfFEEjmCo
	GNmvPe/fNZ/MghBD21VvFg3nSOJ0zSEYv5oxP1QAkmD5shh6MWoiST8r2ctzcHf4YQI+5ds+cVQ
	fsVt2u5bwtCx2Dy892cPDRHKcVa4R8M0Vgf9T3QFl5qw2HXOx3DJ1okt/sWiiGGvf0xGKlXiaWl
	PccVFcm9gXF3pGU91OeMdwjPm3MEN9Hqln5YV0FotYiBQLTJU0ENnmJraSiq/4yLwl+5b6jUwjW
	3wcq9+7IvUyi86ZDq9NyUWUFLXF2LltGCnljrHCmZuSqkpV6ta8clGZMgD4JAS9mi18sOpH0ijz
	k4VAq5WvX84uhYjMSxiq3I36QeSGyqO/5fHtWg8QeooBjN4fuFf3mzZWeE3IPIqelYQBu/9zZ4O
	FnLSSuvbfmfqwbFemRn5pWh+h9Y+wcnw==
X-Received: by 2002:a05:6a21:487:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3da39b71849mr33270978637.6.1788765898846;
        Mon, 07 Sep 2026 00:24:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:487:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3da39b71849mr33270909637.6.1788765898404;
        Mon, 07 Sep 2026 00:24:58 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm26161861eec.27.2026.09.07.00.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:24:57 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:54:38 +0530
Subject: [PATCH v5 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504 common
 DT file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-08-dts-v5-2-584e5ab50b40@oss.qualcomm.com>
References: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
In-Reply-To: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX0QzVfG1slkHT
 oQhYg29XCyLKopYH+gvfSMrmxYObLc7itTyw/MqItRbgfHk69wEa/6S8n4u9VplpvbHGYvB2klT
 Dg2S3Zvq4tlxN4jW6Gh9OIawsJ9woTM=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e66cf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=H1h1Rys4rTy22MHYZdwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: _yu2QJ7xF7I5vL4S-ONK_htXPBSeO2g4
X-Proofpoint-ORIG-GUID: _yu2QJ7xF7I5vL4S-ONK_htXPBSeO2g4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfXxVOjjddESKra
 3E3No9OndMuXQ3q5v4nqvR7Ci9S1IF8RRBv3DgmOqPfvEHltiCwLpEOXi86FgV3PPwATrgdtW0V
 aad8/dR+Sk9knA5llJs1YFpQSW/YRkU3uiIOk/5vYrB4+07IzC8wG+Vsr1sSu0r7qww+AyeVDVU
 58xeMO0AzBxV/+fKKRbZ7Oo5LJWdVZe+k4EF867hes+7FkBR1yh18vA6uAYYbkDsjWMbimA2Hin
 lZvjliyCZ9D48SJKWxbwvGcPG4cN0PaQ4t6hx1yUL3+BuZ2CtLCqfLIgvnzfrdFt/v38r1Z2ypK
 fUc6HRzn/AZvPZoesdJH6ELYC0BAmmlBJvYq9GCX7hockGfh8mzHF5FVuS3/7ska6YOmWVH8RYT
 2P7qeMQ/aEZpnAqY1IYaq+O1VMKflDNdPavb/8sEgJEnqJR8XPnPKY+qIrfEYOXGlRbzxMoYvOD
 hc7i+67yqIi/sQ/BcYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070078

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
 2 files changed, 211 insertions(+), 64 deletions(-)

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
index 941f866ecfe9..e5f2f9217f3b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,75 +5,13 @@
 
 /dts-v1/;
 
-#include "ipq5210.dtsi"
+#include "ipq5210-rdp504-common.dtsi"
 
 / {
-	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (eMMC)";
 	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
-
-	aliases {
-		serial0 = &uart1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
 };
 
 &sdhc {
-	max-frequency = <192000000>;
-	bus-width = <4>;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	pinctrl-0 = <&sdhc_default_state>;
-	pinctrl-names = "default";
-
 	status = "okay";
 };
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

