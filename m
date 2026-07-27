Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C715F377AB7
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136135; cv=none; b=j0xbcpcX2tZNYS69mNDfeR4oltPPoXPNURT1+wuDjJbo/vPehJaKbgOtxjIcagVrkTI+RsYvtb5BRuysNaAY0sMp8BdaXwoxxSTuoycSqhPxwOC2b1KUoG2RNiZbFeXIrk6iDxk+4nyxKvKiAGyOgYqJSuilA7f7x3kl+pJaliw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136135; c=relaxed/simple;
	bh=twagioRdj5u3/xO0H1aHI4KeYj3p0rE+xd5vR4npmSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXlxXgrJuwf9edBN2qpV8kJpJZGW8/WD9d1qbafaM7SREOm0An+/Od/cxkk1ONCErVGYdFRFD58miEP/V68e/Rzp46XJlOJJVPaaeLrMmO2hgdUOLJEDvvuL9B3bGsYJjqj92QWWrICODNYZhZMQndiO21QN7cwnoQRq9z/nANQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkgoqhPe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoEIjDFf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkgoqhPe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WoEIjDFf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fi5J2239933
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=41UrwuY56K8
	Y7TuW8jERGpcIANnENE9wq4kghuHCYIE=; b=KkgoqhPeuL8pnk+UV1Oeq1Jkm23
	WBK9uq58o/NAIKV2NxqM/w5aXCzv4lsnzSS/cIZmkkpmWa5lcY47yDgBMojx2saR
	tlenhlkjVojoIqtn7VUgI7VQspW65yhEweCAP/R+xMGdg6JU+NzUVyEYJ8SoUU39
	tuim51jrli8BY5/5YcR0x4146lOypJhGXPOkBKtK4MZtDdCBn/m2mHucNyWp/bdP
	W9BAo6vLeLbf2+sikTgL21BImgu15FNmgGEJsnSgdBzYfFy+E7lY7+NVk/c2PXvI
	bx21BlDypa3LsxYkae4UGRcKoJuyWC+lgiC8BF7+9LdM3rzPFKIzDEYNEcw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs18e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:08:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907c59bd65aso25504386d6.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785136132; x=1785740932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41UrwuY56K8Y7TuW8jERGpcIANnENE9wq4kghuHCYIE=;
        b=WoEIjDFfVd3sMZi8Sn6lrKbHXAXvJr8U9EP9eNwZESg6Skf9V6T5JOb29xkZy/2Z8n
         lyJUxj82oOiE53u1MexaXxS6Pt1yLhOMU44erlJCnYEm7d7alTaUnhbvnOTCLYEC6Lrr
         E3N9YXMqDV14XzFRDTLuevFQRpNYMmrXuTFf92NEXqnyv1fnHPrcYGMNJ2VsO545BoRH
         vmzKvY8Ma+dErPrPvNW4ebf5O1AP0V1d/UqbbW53TCdZd+adt16+ZyNSZ6aM57SeZ80P
         xWrRUVPDMKIv26Fmp9ozEMsl83zDOCWE7NiQIx10oQU1ASua6cG8AQenQQM1thsuVVjd
         ZvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136132; x=1785740932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=41UrwuY56K8Y7TuW8jERGpcIANnENE9wq4kghuHCYIE=;
        b=KumWGNOoquXQuXJqvq8+lZ3Ldo2CV/b23aVPDnYNJW4nT2isOpcjAiiHypsK+E1ChT
         1/A/R9VkXsilmppKK34Z3z/NMNMErZBnEM0A1suM5A0IWZWb4OF/HoQI+LYzR4wZFYym
         jGEVr3+OzrSmSjLGoLjevrBzuQFzn2KxiG7gUfa8jxZPLkvIY3JL9g13Ee6GqJSWQ4OE
         5LLg74avW+OcolpIEJcDC1LepCYk+w7DB6Tvr6tkMVpFTKNAtM2tWoLqOA71vZyUtSdr
         qq/lzpRJfyvMzJaI0RxE1XiTcpQDbOBTIkv4V3oOGeibabHwdKtzx0bJ/tuMf63VKrpO
         OoAA==
X-Forwarded-Encrypted: i=1; AHgh+Rqyy3THCnkIjzC0vCxbW/eHvRHle3+UkFgRDmRdoNbL/KC0ZJcx38llkzA0187LMbCYSFggdVTaQOE6@vger.kernel.org
X-Gm-Message-State: AOJu0YyTIi9p+mgVMprznXYnww1Kvq2YBSjaOAKVhDVwqEkw4c83Tr5o
	dGsYaXwc2ZrhN3HhafOKq2azKQWi6r4KHdz4VHkLpu3AUO9G2lYrpqjfHqlw09E956VYMoKH3PI
	D+Wj8F4HcHy639PUyAfoVM0yAY8uWLDPQQXlkz01ybkWeoyE/qxiOZ8S9AbbRL3+v
X-Gm-Gg: AR+sD12bprXh3KTC0329RtvZjPymRxSpgqBLFCNhRCziO7guKD70+RMrNdjqf2vqDUu
	pdCjudTsJmvXIe5o86FGvvZfT+9DwqxHTHpn/TAzmozH9AovrhEOaNxcNoVkeJPUuwoO4bCisXM
	gCe0R7GxCxwONka0SL0qRn61vl164VGHcA6u2kViuCONdrX9eEk3gefwDQ5IMCCoTtNjBAU/fpq
	VFW5WpPZ0xGALVD3Q+vGZSnQBtScrrdcmY5t4Dj/nNvuZ9v4HQEjqpqFr9qB2/9c8OYEyAa6JXt
	YvZBBt2cwV4Dd8Gd2sumu79bgWTUAki2DF3QHA9nxyijwTZLK9zhxkYbGTdG20vXrvy3mNCcnL3
	Xcyp5xc18iAbuzB2fmPe/9MeZ3J5zIQHV2KVruB9sxI1D5GS30rwn/GqFAZg=
X-Received: by 2002:a05:6214:5c01:b0:8fd:6e32:1aa7 with SMTP id 6a1803df08f44-907ec954226mr89398176d6.65.1785136131883;
        Mon, 27 Jul 2026 00:08:51 -0700 (PDT)
X-Received: by 2002:a05:6214:5c01:b0:8fd:6e32:1aa7 with SMTP id 6a1803df08f44-907ec954226mr89397986d6.65.1785136131422;
        Mon, 27 Jul 2026 00:08:51 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e8522e88sm58884446d6.1.2026.07.27.00.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:08:51 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Date: Mon, 27 Jul 2026 15:07:17 +0800
Message-ID: <20260727070758.528-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX2tzRyb9duvlk
 KCOi0MoHchwhs9s0TMws+2Xqyx5Yy1iI/CpOELVAnrTRsV71wy30ajHKewdCPJcdwYiEU+bz21v
 uDan2Hh8IorTR33Dx3uTuTedmN1SeQE6pgdWe9Hhh3Uruea/FhHjK+zG/Gzk8zSLCb/pomIzlgQ
 jMiICg9P/vlk1nT0oaVFVBiEC2lcqGMGpUTkCb2cHMJSZdeqOhwkNNd/Hy4LY/+D0tSPN+rVJEq
 lXQTISDBG3f+EXIgsrnnWqiqF/o5rS0tX8OqQLAtX6ro5s6YmBftf4UoR4aC07mbuLOtNDlCGOV
 0YjTwbUxSaE4yejOeU5/W4IlN/oUYbXf79D2f5+NxxKOAUyf+9ezWLAzhM9wBhDocRk1hUkKYXs
 /mL27VrtofA4isGL9g6sedoEYl5QoeVoHUNh2nWohYkibFZ7IRU0oiNTpwCMPIFUlpFYnx2Af5C
 ge1XGCe4akwW/E+KCOA==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a670404 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=lzBAuNTtmfptpNFdFGMA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: L5lT8kcZ_Atbwlq13aNdGdFFmhbqTp_K
X-Proofpoint-GUID: L5lT8kcZ_Atbwlq13aNdGdFFmhbqTp_K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX8+v/cn/71FmX
 BqyXdHlrP05UFYb8jYsqhHiK4VT9OMJMrKFGCbMDwn+t+49Nh39VHtP2zoxpbe4t5OuUd0d65eC
 4elXExRyp8JhEcOSI97VY6g5aXNM10k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270069

Add the initial device tree for the HAMOA-IOT-COME platform based on
the Qualcomm X1E80100 SoC.

The platform consists of a system-on-module (SoM) mounted on a carrier
board. The SoM integrates the core system functionality through a SiP
containing the X1E80100 SoC and its supporting components.

Hierarchy:

    Carrier Board
        -> SoM
            -> SiP
                -> SoC

The COME SiP hardware is effectively the same as the SoM used on the
Qualcomm HAMOA EVK, while the carrier board provides the platform-specific
peripherals and connectivity.

Compared to the HAMOA EVK, PCIe controllers 3, 5 and 6 are routed to
expansion slots, while PCIe controller 4 is connected to an ASM1164
SATA controller. The platform does not provide a USB Type-C connector.
The eUSB repeater (TUSB2E111YCGR) is configured through hardware strapping
pins and therefore requires no software control.

The initial device tree includes support for:
- UART
- Regulators
- USB
- PCIe
- Pinctrl
- ADSP, CDSP
- UFS
- Graphics
- Video

Regulators, pinctrl, graphics, video, ADSP and CDSP support are
inherited from the common hamoa-iot-som.dtsi description.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  52 ++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 116 ++++++++++++++++++
 3 files changed, 169 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..09847b4ff337 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -17,6 +17,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-come.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
new file mode 100644
index 000000000000..d8d9765be64b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "hamoa-iot-som.dtsi"
+
+/ {
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&usb_1_ss0 {
+	/delete-property/ usb-role-switch;
+	dr_mode = "peripheral";
+};
+
+&usb_1_ss1 {
+	/delete-property/ usb-role-switch;
+	dr_mode = "host";
+};
+
+&usb_1_ss2 {
+	/delete-property/ usb-role-switch;
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
new file mode 100644
index 000000000000..735a2b4efd97
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "hamoa-iot-come-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Hamoa IoT ComE";
+	compatible = "qcom,hamoa-iot-come", "qcom,hamoa-iot-come-som",
+		     "qcom,hamoa-iot-som", "qcom,x1e80100";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart21;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+};
+
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
+&thermal_zones {
+	gpuss-0-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-1-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-2-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-3-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-4-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-5-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-6-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-7-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+};
+
+&uart21 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};
-- 
2.43.0

