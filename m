Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A122841DDF8
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925882; cv=none; b=ARX3vrl+UHVfLgtylmq3C2AyqjRDdnAHLIZe9AuVzY7c+EY07LyW39q7CVWO3ueAPFKx3Ot65vNYNyK2Ebdo7K/mrjlHyeujUKt+c7VFRokfvTRbn4vEJ5XfCHbxFYkpPypmKel3x0aH5mjzPBs6liG/GNbYn3u9+bXWUi2sQek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925882; c=relaxed/simple;
	bh=RpCeLzOb8oUsf3cplSbUopiRi4IIPCUSGeBAwhm1X8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d5lkwIUHJGeGZCe1ghj13PSAa5gEOcaVq+plCYv7hvMn/nGAGh+7OH8MGPqQHgoMUwRHc0qSoqXHEeW19BNRwC9+36SCAxzpq3tIst9TxicX78tA6N3SXoUrQSMcYS7SyRVBvBLkxTg55Gc7m+3KqiN0iLRJAPvQfYgNXF2t2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVSND4sY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3VIdA88; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVSND4sY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3VIdA88"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dHV62468181
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 10:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FnVwsZz7S/l99Dx+lUg5DbaKBgMiqNs7LuM9k7GvdJQ=; b=UVSND4sYRudXRGFb
	zDgnyTLLhwikihlrImfpUHpY1FRXYrh54P7CZbgt/Ne0wRrtL20IWN/kvgH/p4Hf
	bNv7TNyQSSYYmEAvC2++J/E3UP/FqYGhP9ltacymm+cr2NIk5E6yQKCMvQHvgCta
	b6vOnlijiVhjo0u9w7AlYVZRUiWZtzjT1gQqsh2aOKZKpfCjhyaEqw1TDS9mQudm
	Riez3PMLb2F4jazQy91PChYCrTBfhoykSm20DZgjhB7/JM+DWQOX82gNuAo3AG+s
	fsAJlbOuXBYe6BP5ArWgM9xFuUkc01/LdNAJ6drrsVZ6ovsliAOWCk4zrZuSSmAN
	dziKSw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56m494-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 10:31:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ea75996387so15511526d6.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 03:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785925879; x=1786530679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FnVwsZz7S/l99Dx+lUg5DbaKBgMiqNs7LuM9k7GvdJQ=;
        b=i3VIdA88Np/0itP9C5KP6FbX93R6NGdfZDeHg6ibavoqOkhz92xm3PXD9JF3FuE3Q5
         JAAg7uewmny+E530akRAODAiqZAarEms+3Z42UBLghGe+rH3zGMxu1fSP5J7GKjTGvc1
         AhKNzBXQ1KxCp0xLsuv/k/UwStfB6kNKjbONNJ0HTcL2kf0VM3E9rkKNtXn2JT2Eg0pY
         gSA0L8+WL5cMqf9bFssEhIikRbNe+nENNK9p+hYDMngRX5W6ObyMCN6oo82vvnmMn8ZS
         l0pHNe1lHx6t4JLyI3Ul0dpF9eHCx7atsjIouhQ0UyI4QuO6LOaezM2pc7loTJPBihyG
         wMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785925879; x=1786530679;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnVwsZz7S/l99Dx+lUg5DbaKBgMiqNs7LuM9k7GvdJQ=;
        b=ANexQZ0CD/NbDXhRzpLcfIFeZvc3qG/RF0Zb/Q3zO4qAjZQKe5lFuSdO4Hz2rGa4n/
         dlrCtydb9/NfcNwkGnMx8Xdc9iu5P8oi2eGjnVG7QaMWy5evz6dcVkawhU0MAeftfA8e
         09tnGje3aoGaeCUeys34wDbEAwRfnMhaKkHqNUbhYbyVFzAB4bRfyBILE1/OsawwpZWT
         8Hi41u2qdepugPvJz6j1bH6DkZAp3lP+n+wfctyVifUaJjOx5Kp4iCgWV7DVdc8x2vIH
         uy5nzcrYKTH7RcqF3cGX8jwzodePTFxc9tD2GklNl1v3ViPZjNoiIMbm/0Dx2fuxXPQR
         yH1g==
X-Forwarded-Encrypted: i=1; AHgh+RoiUsUX6hfFyuB3T2XSsPwBVmc1SdP+7RT+lwYmbgKfhOJms40FSTTaFQ6XPfHvvIGCaYJzLe7Yg1TG@vger.kernel.org
X-Gm-Message-State: AOJu0YzudXD+E1xGEnPfFq/2rEhU0Us0qX4mMvTBZRp6acyYfl8oELHD
	4yxwc865yFppwnnrptK3vTo8CK2lnheAAnf2E0Tw+/Gthd2ZZc+7lDgYrLQYF2a21Ktm9sicriP
	pAKcdWU1/mcWf1GD+eP1Z7qeoAvmJZ5E5ZL1IGTYW/65Be8J8qwHZ4cuCzEr7uWkh
X-Gm-Gg: AR+sD128M2r2tFl5fr1rBhHBsX3+kLjgfNiGSmYjGteScANYn/l+NDZJsNsqOAUIVxW
	m/iemoqNGhrOEz6gpKtC07xZX47f0Do7pL+ZjwDlKCEvcAl5jcbiyUF3lb2m2brl3e1Bi5yFNdZ
	ozmHWdI0sK+B6tRNzdwyDY0c5t7jzNbbWN3vB5UAr0HpN327Ni7k6Bs5Hic376km9pNCM50Osn3
	3RoYE9YA6ZmxjF44x67ywCvbgIoTVc1ryN0p0bNVbt+V3Co28UHqQERjN29EG7StbeRvmldOJz/
	6i+hMqyOoPV38ZYdTqW/QnptGiJsQOXH1DiWraj+GB0FcARs4RKiCd3q6iYmyDneoJ2VNgvQctk
	SdYt1liEJawyZj/w/4Aog1B7bAK1Da0f2GtdsfNWessefvBRLnlR8v2QyMh4=
X-Received: by 2002:a05:6214:407:b0:8eb:326f:9515 with SMTP id 6a1803df08f44-908811b4a45mr66512186d6.8.1785925878799;
        Wed, 05 Aug 2026 03:31:18 -0700 (PDT)
X-Received: by 2002:a05:6214:407:b0:8eb:326f:9515 with SMTP id 6a1803df08f44-908811b4a45mr66511196d6.8.1785925878028;
        Wed, 05 Aug 2026 03:31:18 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d814sm22259706d6.10.2026.08.05.03.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:31:17 -0700 (PDT)
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
Subject: [PATCH v3 4/4] arm64: dts: qcom: Add Advantech SOM-DB5830
Date: Wed,  5 Aug 2026 18:30:03 +0800
Message-ID: <20260805-hamoa-come-v3-v3-4-20463c43eae1@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: igIf5zbxE61s1EJmCLgWREdegzBMiWo6
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a7310f7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=TJUqZQk6AAAA:8 a=EUspDBNiAAAA:8 a=8c9qzvNhB2lAFPWjGvoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Q0W1slMkcave-rSCEGgY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX9Ya/Edp3yIrt
 V4E5qiIGr0k5cV3hNw5EqtvW+bi9ZgRz3BSRcszHUqSYhCYIU2j5va8NdzB+6+fURNh9yPtXEif
 70VnqPhhXCLWyd/QuM+lOR2wTDbeDpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfXxOVBlT05xFFP
 mw2V4R84FFjyJlwzQATNK5H7AO+KsPA4+xQa1qclZXLXeavBAYV5S1bsbchtF05ELR+Z7y6iR2r
 RIELev7Ib40tt9bfx4xEtr98OeEe+GBI7ZK4X+o/QM7zucW1J/5vUfAoqxNp/nV0GyuahUtRuI3
 DsvNYt3qwv3vmPQaWJ1mwyz6arWcDNHJygt7+XUHKDxgko0U9gsrj74rdS/ad+JFZEjTiwyjcGJ
 GgqWVQIPwIpq/uyxt8PQ2nlK9vn0usft9ZmDa0itR0NYn7153u5AcIcGtRuVFvG/prIe/y6478J
 4tnmaYENpx2jb1qAS0Fo4tQC5rH9aQaojbOmbJXBZHlj/Sckge7ByPn23z5osywVAKejBKhiZzK
 ag1l7ig+WASQaweyUpGWc3ThSw2HhVPyJX5mndQyvEH8J+Dq6qhih/u4Vukqol8X5jUM1sDanhU
 0gLSKMUCcC8vLLxyoYA==
X-Proofpoint-GUID: igIf5zbxE61s1EJmCLgWREdegzBMiWo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050083

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
inherited from the common iq-x7181-evk-som.dtsi description.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
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
index 000000000000..cc7609c33057
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
+#include "iq-x7181-evk-som.dtsi"
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
