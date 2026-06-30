Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2835C3988F9
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803450; cv=none; b=D7FjQyBzEmoVNHDpSwIMxBUeEM4g3LFPjp9+YwXcwsdcMNB977AbP20GHbiITbae5wRKcvz6lj76X/QBdytF8e/CgEYGLtSbjzMMf3Cr2Fu1rrIPknuTm0O8qw0Phv3Hgllu9XdxUid+LO/v4ll4k383mPt06qsk6dxh162xslk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803450; c=relaxed/simple;
	bh=gimclyRf2l8zKgltM6nyu6KRx9qmaAy67XR0saKf0jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwWEnxJYQSJp3yvTZEQFmBZDiivvrhJ4lE1B28JzWxgmEcsMS8V9N/VdfhNriQdiXhuWIQnWNdJjp9vlnx8vvIRFYLBlPnDtThbLXMRb5jWEPiZ+EEXbZqiTdNsnn5ZztYt3gCPiTNoAv9lrQmJzmfqUqQ5HIO/LpJzqOR/1qoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqjhJza4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsCeNKNP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqjhJza4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsCeNKNP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CRae1097902
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=isELQ6kAQUg
	Ee6wg+omWtZPPGG1axsxltur1lpQHZZM=; b=MqjhJza4ECcUkGXzD40K/kLRREb
	biUH649bCsMMx5ngyNh9IHmCFCak9M0pgPdk0Eh0IVWNQPUJQ9BWyuGnYUyZzlGA
	9EaoO88f2s+v2KZji33OGWzOQo6JcON52YyY9xUZgZmEdvPvLU1EhesxNGYaz+uA
	EfUr4AeacAKWJ+y4lG8E4J+5SE07plxii1iXnQd0mNSoiONUCUHz9Lht4eqRPjA7
	2eeAu2GjZ8Aq6347BKam+tgO238IZKnxh2v1ZJyVIbVRIoJWIw+YdOE5X45ZubNg
	2XDoT9eN9lWzEjmUu5s0DVevBpnD+SGXTPd1gnJKgXHFmhvduvUkoHTLMPg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1ctcru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:10:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eec6acbe21so79525366d6.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782803447; x=1783408247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isELQ6kAQUgEe6wg+omWtZPPGG1axsxltur1lpQHZZM=;
        b=JsCeNKNPgftb+CR3UpgiefYEwRPeTABVI0PwmU/SytOfU3DcnXT4CNeBiuwA9FVUv3
         62SHfNhiWROlMEQsOmT1eddLy5v0GVJabou+3hg9iv2kCw6QKaGbY5z39a7OcXQ0t9Yc
         vwjkgXCBOPziPmZfp0VqP7MYZM8J1qnN72+h3eSjJSedhOql3Wc9mVgHQHw840gDaqk0
         T4dwlgtlMLm4AMdPvXs88sAmo7oTDD+SzMKbINQUl7jzJi0SKZ5jT/podpF2Kgw1A4na
         BSwAo6V1SVP8rrGdVVeGg3frUuT4xElxG/zfI2glNDYk18NpNeU1XJ7A3zZhE7EvX9vk
         NoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803447; x=1783408247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=isELQ6kAQUgEe6wg+omWtZPPGG1axsxltur1lpQHZZM=;
        b=RBEpplzR9qzvZ5b8+eC/Eij28dZLKUve3SuZqPocd/6GEfKjZEbElWZp35Inc4Im3Q
         NmvMuwvsk+hxL3rdlWP9tYq9TxCW/B9D8WPNdBoZXYqCrO+2a/F1iFVtJCVnxOqx13pb
         ObVi4QieB513oEaH8/Or4P7LnCZ/gES0Mayp9uZcHCr7S9S6uN7NyLknWtbcEr7ESIY9
         Lq8yO7Kp607oRsh2sLfbjk+WBvQ3qVsySaylsTIlPQJvBOt2HDImH9szq2wF4PPeEdGi
         NIE9TpzOetYWpeMoqhayaMYLJwjbDzwlgr8gdYQugd9QskAuqUeLDfVSfBbxbM9HRboO
         c7Eg==
X-Forwarded-Encrypted: i=1; AHgh+RqTnooS5DhKmb9L7FarpDpF6NeUWmP+4tL5fb0YVaNj7Eg/7uJp8KPbLrs8MCBsMJutKtasl/K99hr0@vger.kernel.org
X-Gm-Message-State: AOJu0YwILISwx7Re5YcwRuDQfy34MgOzdCZq02cEx9twdPpKVUPFqxX2
	9pzkPyi4kU/VcjTiNbY4PnZKgDbxrbeGrhhdSwn5na7pHS9wI22Om4mA/CbGoKbY2jDIvmt2gF0
	Qkv7HMPhEHJFWrub0Pn4MBlZelbrhAhbNKq1+ajQWn6+VJDZ/LOP7Oy3afqSmsVUH
X-Gm-Gg: AfdE7cmp5QMzo28tHOfgf400TAqjQb936qzOLYcKn3WhV06HIAPHRLTfeZPTUY+/Smt
	uI6Peq7yVOgQWzVSDvc2bj2hVaWAL08LXM9ocf1I9gxMiMDVGa2laoBe6DCNHVo/spbBHfAXs3o
	IZck3bm9NXpRu4YI6Qzb+4QH7i6Z1XWdw5NyEuHxyv7fxOdACXJNeryN+xP7GQMpbXUMSjisGvF
	OzQteejE8n3VLURLeoXYaLrFZJdEv9VW4rj/IMu6L/nwqqy/J0QyOp0WSvgmFJS1bZuOnOb1T32
	ewtxAztdPjl7AzjdICLtVylucfMXhtUbdUGfkPnnMDK2Ay7uGI6OZlcC5Wvr2wgF4RMDAN7YmP7
	lvmSkNj2rT+tjqgs/lZ85cTYT+goBtP3KeB4ZnynpHXFd5wfkGc6dyxw1gepVxfsNzuMzow==
X-Received: by 2002:a05:6214:128:b0:8e9:f5de:d614 with SMTP id 6a1803df08f44-8f1bbec28c4mr27529366d6.51.1782803447177;
        Tue, 30 Jun 2026 00:10:47 -0700 (PDT)
X-Received: by 2002:a05:6214:128:b0:8e9:f5de:d614 with SMTP id 6a1803df08f44-8f1bbec28c4mr27529156d6.51.1782803446592;
        Tue, 30 Jun 2026 00:10:46 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f19f770c41sm17471956d6.0.2026.06.30.00.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:10:46 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Date: Tue, 30 Jun 2026 15:10:12 +0800
Message-ID: <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfX7qVw57BDLCzI
 LJqbiOp1MimCuU7oqI0+QdPfw+ph1EG/5CXMwD8MFeGC+J9d7VJxb/AG4lrlGKiGnyTiEfSwSVW
 YbEMitm62hSiCJWO96hW44ZSVumhz2qRlbwsnjsAGfN9q4E7bJeJi1f676Gbl9r82KVcfWqMyxZ
 S34ZMvPdiE1MIwD+3ZH2yaKna2uRmkGxfz5VT6WnaPG+Z+Cy4tREnBJIsZYGFNk6jAgO40BETgl
 /yA4m1o4g+3C/txLqOSNN0t0HLgpLE2MUY+Oc/v1a3vz8rHhAESqeY695XPw1kMevHps5S54ILp
 P9GK/yoljtdrT/W587u0l33aIO+VINQfzRkIxCTG4zfg4PvuBZeQcbd0hqld+r7qHUXRBt3bFJV
 wrlRVLwsqByNye5pZ9LdhbQaLoLYZQ22Wt4Hxzw0Si48T/RWYnFApGqkDq42BAODq3mhYdydwC7
 QqF9Zl3KyUnwgiY5wbA==
X-Proofpoint-ORIG-GUID: I9bvK1N-rY2wuXGQpArJXznGMyWyvE4l
X-Proofpoint-GUID: I9bvK1N-rY2wuXGQpArJXznGMyWyvE4l
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a436bf7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=L-xlEkxGLorroyIPGu8A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfX9D7ZDuw3aw+T
 T11LPSGN9TwyekyYJxXq1TiRcGoLI8Y/846zc82HTpcLT/inKii5wFZLFKQDvfK3i0V2LR51w8V
 C/7lL/qbVp9/vjd0f12Y44AOZrbOcb4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300060

Add the device tree for the HAMOA-IOT-COME platform.

The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
SoM integrates the core system, including a SiP that contains the SoC and
related components.

Hierarchy:

    Carrier Board
        -> SoM
            -> SiP
                -> SoC

The SiP on the HAMOA-IOT-COME SOM is equivalent to the HAMOA-IOT-EVK SoM.

The initial device tree includes support for:
- UART
- Regulators
- USB
- PCIe
- Pinctrl
- ADSP, CDSP
- UFS
- Graphic
- Video

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/hamoa-iot-come-sip.dtsi     |   9 ++
 .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  38 ++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 108 ++++++++++++++++++
 4 files changed, 156 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..549287e3eeba 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-come.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
new file mode 100644
index 000000000000..935af96c2b85
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "hamoa-iot-som.dtsi"
+
+/ {
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
new file mode 100644
index 000000000000..5c6475b34cc6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "hamoa-iot-come-sip.dtsi"
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
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
new file mode 100644
index 000000000000..99c47cd953b8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
@@ -0,0 +1,108 @@
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
+	compatible = "qcom,hamoa-iot-come", "qcom,hamoa-iot-som", "qcom,x1e80100";
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
+	vreg_pcie_12v: regulator-pcie-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pcie_x8_12v>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3: regulator-pcie-3v3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8380_3_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_sde7_main_3p3_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3_AUX";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8380_3_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_sde7_aux_3p3_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&pcie3_port0 {
+	vpcie12v-supply = <&vreg_pcie_12v>;
+	vpcie3v3-supply = <&vreg_pcie_3v3>;
+	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
+
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
+&pm8550ve_8_gpios {
+	pcie_x8_12v: pcie-12v-default-state {
+		pins = "gpio8";
+		function = "normal";
+		output-enable;
+		output-high;
+		bias-pull-down;
+		power-source = <0>;
+	};
+};
+
+&pmc8380_3_gpios {
+	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
+		pins = "gpio8";
+		function = "normal";
+		output-enable;
+		bias-pull-down;
+		power-source = <0>;
+	};
+
+	pm_sde7_main_3p3_en: pcie-main-3p3-default-state {
+		pins = "gpio6";
+		function = "normal";
+		output-enable;
+		bias-pull-down;
+		power-source = <0>;
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

