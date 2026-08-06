Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4475D433BD9
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009535; cv=none; b=EukPmMEz/evrmv3rZXetE02ltaEDOk+IHZOaubi/Z5U+XAlUKxSN7A+u8RiQlDWOFv0gI1sYhFBHlKPNGkai0FDcKLSxH1bdWUgX08vG35pCpOy9i/9QCmsU2PbUTZMhUqi7LYc20KinZMXsmBU0htBrkUzPnswu7gXbBiTEcoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009535; c=relaxed/simple;
	bh=c+W8myewj7pyfR23u5QXtDPVGAira3P9g+5WwHrZVF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BVCTLUlD8FyCPgCltxmn4WaB8VPykA5Gs5l7FEaIXarzwmRd1+SsKPKIIphSZhw9tCOv8BN0e2hzzeEDZTSB87E19IUHNHF9lz84ulb1+3ZlPOemM+ROlZMUy0ENbGaLBGFGuJVvaBqq0iTKPMRV222jfA0rIKHlR0rMRCx1mkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMh/jazf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P0tFtKPI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMh/jazf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0tFtKPI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ett31851453
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 09:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qasgy5G3Yr9QcYiLTFAQm4J5GvF01WXjDrxJH2y8vNA=; b=KMh/jazfMU90C3Wp
	HUdeqcHwpdZNOnopSb+nza73UQaQkbxzBM5PWvvkBLiJYlLmoo4Uf39cN6q6vhgR
	KXbRSBNtwvFXkcmBWoFc0/+lmgronPG7VhKVh4A34sKZ7saOLMIOUEwRFgiDqAZM
	ar3U6rSPlqy4/gk88bbjnEzPD0RC+SDlwPCq7h88KMI6gbI3Xpu3NeF+n/9bUnq1
	XXdrwcdK6iaZGdlXogqG9ZVUg++gVa2s3MKznuAvn6AlkhsruqtbF1eXjaj6EYTN
	wBmEbZ9ulrnFdAuGU9roQJ0x/Jf7jU31dKv9V3uVUynH5QtKjhod5FPvd+moX6Ay
	O9snFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud1bnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:45:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b6bdcb4fso261134885a.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009530; x=1786614330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qasgy5G3Yr9QcYiLTFAQm4J5GvF01WXjDrxJH2y8vNA=;
        b=P0tFtKPIM/xqJc5Ft+E/eseDkhSKs9KVNlHs5FbqEGOci0fPiFXkGLy/whneEK9alS
         zOptUGlbj6iHUh3Aklnso66cRzeF7stAEZIKYqkfoeYE0DVxQyOzAhALpdDYu90vOLuM
         xpk4uTV/aLfi+0eLBOrZENxFwdOx70Kzn7UpcpLht1KzbuYjITKSTZg32I2fIA2b8K/O
         oXU+7lH/buhXGCb+KnNL9xsbfJ5LchDu0ZYnrr/zDf1yTW+UbytSJ0Ay4Do4FECIW4jm
         LgpVg8WKUT7/JajNu7YyZEQAarQz2rmAUcZNIsUDJpk4c2sS6rJXnLWVXG9QB6+xilD7
         DHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009530; x=1786614330;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qasgy5G3Yr9QcYiLTFAQm4J5GvF01WXjDrxJH2y8vNA=;
        b=PJD9Z+iHUSVt6jBSubPsLlZznTqfAIOc7Zcof3pK97eL4fr07aCjze0SDvN1D5wOjI
         F/NWge5OTOHm+fdVDSINqlpm6L3VZ1FPbTdKOp+Qg/1bYqQamk6iN5ovPhBQV0n8tfnO
         WUBSTBTHuQl6TSeiO68FII7yGKuJdX4+V+8E8/ssLu+TOyFV8pcBmsvv/vvuNEoXkZ87
         fCwlUYDjIpTUf4C5csiS/qRJAuMW5uf1L0MaQsbSWCBnlSbjT4LIenpSdfftmK18DvGB
         qydDKXk7MYEpmBFJXhyhOtAkfaxJhry73ybVFDa9Fqo6huvTFUPqZk81Sc/aP00FwvKN
         HCmA==
X-Forwarded-Encrypted: i=1; AHgh+RqicOR6eZ+fKppFIgsDcyPEsLhyr/NH8hHfq9BugWd35cYFxGkCGpYLe2gQmceKQNOaBfSLy2UBlAxv@vger.kernel.org
X-Gm-Message-State: AOJu0Yydpp5wWxQVDo7fcW6T9qmZMmRhkekWCpbdD3mccTDgcXhnr5DH
	eEPsseCFobchiM654uY7r+iEL/hnM0WDjGjGceLgXtCVAMR8g6FtkbbkbsPa3tdTQ70CFgvXONr
	sTfS+lxczbd1s8+ETU4v6gRP1ZIIZA5HOIPGNQjsXp2vikt41xV919fAfzmqXteXZ
X-Gm-Gg: AR+sD13h17Bodqic5p9Z1VOY+bcJvfyTrt//KywVjsSJVA3Nt5SmQoQXd4i8P7+gdXR
	IfLVkpLiPNTJK31ps+RPKP696JGmeGANZXD36GEcLNq6oBk/upSfpTo2IxQogRFEGNr5V+XFkgT
	Ij7YWUfo6Cr9hAAEJRQJBzlovJv+uZO/BaG/1HXPTFrXq+VohiLOBTBmtmxTosKVAe+kSKEwe2Y
	ptOUsRi4yObyih62yv3gEM8nWs4YhQqDNXt3sbvLEthzkr2x3+1h0cz/ie2SnoYE6i+xIvDEsVh
	tIgE/bF8FE7mUlpz1YFoB9juEA1S1DcYyD9lklfyZV4zGJIvmJ4xndc4FBxuogy4oHwyAqKHdUf
	YtAqR/KCRWL7t9B2l9th1l6Kb46WuAjeH95NCPPGXKrgEoK/xiwDC1w38BRo=
X-Received: by 2002:a05:620a:2255:20b0:92e:5554:a80e with SMTP id af79cd13be357-936491f5d43mr1030757885a.39.1786009530445;
        Thu, 06 Aug 2026 02:45:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2255:20b0:92e:5554:a80e with SMTP id af79cd13be357-936491f5d43mr1030754385a.39.1786009530031;
        Thu, 06 Aug 2026 02:45:30 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a570fa9sm358566085a.38.2026.08.06.02.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:45:28 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: Add Advantech SOM-DB5830
Date: Thu,  6 Aug 2026 17:44:47 +0800
Message-ID: <20260806-hamoa-come-v4-v4-2-706021d4bc8c@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
References: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX2C1qHGI/OFl5
 49knVJdaAW1zl7y/r7YvlCEUa3lbkiWoqg2OI47HKKg5DukuRJ5Zyt+2yIHtQntKMPw0BMU8AJq
 t5KqWLBPInb3U7RFlxiCNjqLPQF7gAdXFvcQ2xOVohBELQFqk+wkSaKi/2o0RHise85EUNsLAd6
 5o8kzY9IStDP3G3wbioudrKsJ7gILDBfuH2JJuMlKaCPYHPBXx/b/EWMyP5CDWdqYkWf2sWYL2r
 4Ut72pZ5FuYNNYyA6yi65T0bhRgrMGylP3bgONEJj6OW8vRwm0XNrt+MhwzrSd9kSn1iTKGYHOI
 EL/N9YI7h/LhHpnA0oO+N77rSF/0ADsCU31DHKyg6ON72JZqNTMJjy4Xa/atVCY7oL8QNljv25F
 iLvsAZC66NRDkOP355MdiHoMaq9d0vk2uBmS8GfJeHQWVapOJJOP+EVSxH4ayw6WLcBO83D+eHb
 s8cwX2bjyidpLtAWLGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX29EBE8Xo/RFG
 3IrYoRxrbWfbVtaz2NGi7vka2viQ71SP3oRo5fx6RqgQhUn/Gy0DaARpJfonBmKA96Iju4/tXwS
 DnRhW6j6tEXCgMWH5HMEVZ4ueUZvglU=
X-Proofpoint-GUID: Gue3-YxXXJm-rZMYnDs3hiLfdnE8A61B
X-Proofpoint-ORIG-GUID: Gue3-YxXXJm-rZMYnDs3hiLfdnE8A61B
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a7457bb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TJUqZQk6AAAA:8 a=EUspDBNiAAAA:8 a=8c9qzvNhB2lAFPWjGvoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Q0W1slMkcave-rSCEGgY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060075

Add the initial device tree for the Advantech SOM-DB5830 platform based on
the Qualcomm X1E80100 SoC.

The platform consists of an Advantech SOM-6820 system-on-module (SoM)
mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
components.

Compared to the HAMOA IOT EVK, PCIe controllers 3, 5 and 6 are routed to
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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi  |  54 ++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts | 119 ++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..0b5909115c22 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -24,6 +24,7 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-som-db5830.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi b/arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi
new file mode 100644
index 000000000000..fec6c4d0b927
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SoM: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
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
diff --git a/arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts b/arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts
new file mode 100644
index 000000000000..1697e908fc39
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SoM: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
+ * carrier board: https://www.advantech.com.cn/zh-cn/products/1-fc23ff/som-db5830/mod_16b1a718-27d6-4a4c-8684-e8f2a8e9c57b
+ */
+
+/dts-v1/;
+
+#include "hamoa-som-6820.dtsi"
+
+/ {
+	model = "Advantech SOM-6820 on SOM-DB5830";
+	compatible = "advantech,som-db5830", "advantech,som-6820",
+		     "qcom,iq-x7181-evk-som", "qcom,x1e80100";
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
