Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF1637F73A
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099549; cv=none; b=MoMCQ7PF21vo4Bjn/NPjc/SHThxI7xdrMyOWCZVZHjvBQ/q90jXr1YHCIpGlIm0qQHanO9GuY0uVTsU8zUrqAFDYTcZ+q7Su348jZ0jxd9i0JVTtmOfEI0l0xuFKYvjWT7ky0MWcPwDyrevWFPaqz4u1QdWyqz4JmfyWxiH4NQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099549; c=relaxed/simple;
	bh=JQA+v1EfIB+ku2V2nhFxmDsNU3E92/C24KpbpGghiOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skbuLX9Yi8fTx2p0M/esQd3Va88nU4HApvB9ENggieuyysbF/1kBn/AxXyuYbYJqUIZwpV8SiXtWQ3MjEM49x8ygTI2XB3dh5Jtokg1sTCInYzjpwZCMeNmziy0Bw+P4Ldq1l7WuN66r+fTR/3oH0BDf2+9BWHTKKdBRHDXP3xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMeSQb+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCHXLWPO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMeSQb+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LCHXLWPO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lSji2555696
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=; b=FMeSQb+y5QtC9p/d
	tw7bDmmkTe9S8wbN1mkXAV8s7bWcvxvlnFBuaVbD9xPTeeWAI5QCmAXcD2aPX7Kf
	cBFKmZq7sVYiGkPofR+Cgtw8neCcFHuZLS0qfywvUg/aPIgneiTvvGRT3vp5v7+Y
	QZxe7YYj/LPAAgvadCMzpADXyNkhgUrWLf0hk3WOLJ2IFMTfXyvRMnfiTUjgx/D0
	5+sXqy2s4PRniQXmYTVG/gwZmQK0yOBXcjydG8xxdHIPIjD1A7ZO4BnR7vJOODeU
	WrN3VN02+h/7iyZKoTsaMyk54KTTB+M/ka0xOXi8ZMCQv4Erc6EruVwwWwGw79Ih
	hAjuYw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9ktfgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:12:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so2034332a91.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784099543; x=1784704343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=;
        b=LCHXLWPOEi29SidzCIyPS+1POZFz0Tb+jR9vfvm+JWjG+dnmOGQKeoWruRNEKjWu/X
         aS60G6//w4QwIz2s/rymFxssrIvsKakja3fLS1+64h7o6QOFeP1TuMkW8za+O5Qe6TJi
         NEBxnTMRS6m1J5gP/tpimPuBgYkKHNPw/SyMz2QZinNzr8kb1xtCD3PXq9odt1N8Y+ZC
         gAimsZHQOVlTMwoPSJ5CNH8GySkYpeWUSoxNzeh2Rf7GCx00WamQrHznrar64OJADAVE
         +jLEll/zdKhGs5Za4a5NOAm9+CQE1TOCtwhZ0wIto1VYkT3hfFUI1G1OwmMiajoFjIdD
         UR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099543; x=1784704343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=;
        b=WWF8x4OqdfXarSMIDK38i41aH/x8+lthbE7Ot04kTR5iblY87yh6peHzLZpz1cf9Ip
         y66gMffalYS6XmawPy9fHF0KvkeZK+0op2/QhD1pFARawtTCAOMHepEnwXbk+HrqS/U5
         zxgFjFjNiTAiDUgMUoDw5LAv0a8bQbomELhIVeDl6x8T9/ycF7VsCTu1wZxwtgphpS2A
         ggyFvfXcR5mN4nZvV4n72FnhgWiOCWnfLug+Gd/VZf/OwQb7VIhSi3a8IQPYqvgH3s+y
         8eFuDW8uhBvOldxo8aBKI8t84KIet7Z/QCMKSEwyck+hbmCfG8NkxO8j4XLPRP2vHIWN
         cvFA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+99nVzMB0Y7jr+vLThAYz8lyqLhcXDQ6MzAWe67vAgKFY6AcGu98wGAtkcFMmNV19kXBm1Ymc1I+3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrwc4szTIZVs6J6hidB9aiNTBSs69TkCdsAyOPVvslJ2B0bqyl
	Pa+PmSMvQWvRDhsyHfZmuZoKev7sZ5COypdxlHYhKhq5EFagIPd4fZ1txsanSODLL+QGeyFvFoI
	vbA1/LUvUpihm+ENVIC3zfpK9+j1DjH55HL1woQ2YAjGeRFeEWB92ck74iJyOm4xQ
X-Gm-Gg: AfdE7clGeIVOcopHPuQrGGahp/9HLzZp29xzDUvqsgKRmprBUdiAnoGsmUIjkPKV+Xi
	rZ9u1YC9qg8LLAVT5QsunykA6blRyU+NhOG6ZAQ+rRzTF/xSx21ls0jkkvV3jkz03U1jFuvpSeE
	SDnqhUzM36WzOWM8ppEUdbYpwj+XJ0kdStlFDVvvVd/qPEVHQuFDSi8BH9AgLkoCl4SlreAOysQ
	k9UkFVXNhj/MckMKgkYhOQeS7RG1rWxoKcQvof0jTA0czhusZ+cFTjonjVT7S5vOR3cSehGMm2y
	96U5V5wp2L2g0K8pUcf1hjs2FhHyiwz5UZxrBw8JP+HL6D/siVPi9F86cuhcP3dtfaVhSavR79U
	HHDOC1I/zyAmsRtuoRAkaV1DELUYlnoDqOjVkzl8RWIw1y9RFezbRYwYLHApg2MNsDz8pg+iEkJ
	OzO4/+cFRo2ofw1Ie1JnN+PAOP4Cudb+zOxCE8MW2u
X-Received: by 2002:a17:90b:3c83:b0:389:42e7:991c with SMTP id 98e67ed59e1d1-38e17dc80d5mr5305216a91.17.1784099542627;
        Wed, 15 Jul 2026 00:12:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3c83:b0:389:42e7:991c with SMTP id 98e67ed59e1d1-38e17dc80d5mr5305194a91.17.1784099542143;
        Wed, 15 Jul 2026 00:12:22 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm80216146eec.9.2026.07.15.00.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:12:21 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:41:40 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: ipq5210: Enable USB and PCIe on
 RDP504
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-08-dts-v2-2-b060b68e0256@oss.qualcomm.com>
References: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
In-Reply-To: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a5732d7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WPSE4gBbNDprgx3kWUIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: xM213hkBXqzzPaJa2o722svlrxbHBp81
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfXwT7lhGPuVRSj
 Wm7D4u+niWq3/hP9MBj9N4NTN963taY77LSMC+NUHDZKxWWmA74+qLjiYG8CEvvDpwgB3EEErft
 x5HDbxzYNUC5IxN20mnoe89ac0ZeRL4=
X-Proofpoint-GUID: xM213hkBXqzzPaJa2o722svlrxbHBp81
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX3ckh8dJbemPG
 pxHqmYJBzFVZMWdjLxE1jxRmzaE2kusd5UGLV8P6mXF3UDazpy6YAYE+vMRX3PcpAKZcGbvOeDS
 UWtDAInaqnn7cphUlEmdV0nEKkEcAhanl3gSkNuznTxqsvawm8AUK7EModn24ylWFJaBu3g9n1P
 qWRXhVOv5TVFNyDhrPpA1ozRxsBxBxDvIMz1EzWSK7IZdKFLQ8bCW8vSoNeOcpPBi6MY/nx9ibj
 3KbRR/zxUoBywY3Wj90DGyaAzjpVNnhdJwaPXIgrFyWbIfUIJ06fMlZJAqZEo1L5hIw3NO8PApB
 d2HRa2UEtYWsJHePmXSsHTWu8GLWUkW17G7W5pHtX/IT8wIEE8kxzC1QekyGRtg7WToUuSJceoH
 e8ukQv6BF25X3eWuGK9nQCyS+AmQ4IkSErbftcNi9bSA3Moty5tJXArLPy3pcK56Rn2t2jDkri5
 bFT4u0A4owSTA9zKefg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150067

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Hence add the NAND node but do not enable it.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 131 ++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..c47e18eabc98 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -18,6 +19,88 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
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
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
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
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
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
 };
 
 &sdhc {
@@ -35,7 +118,51 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&ssphy_0 {
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-supply = <&vreg_misc_0p925>;
+
+	status = "okay";
+};
+
 &tlmm {
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
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
@@ -74,6 +201,10 @@ &uart1 {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <24000000>;
 };

-- 
2.34.1

