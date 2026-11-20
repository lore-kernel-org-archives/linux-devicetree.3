Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165191;
	b=Ion7MNu5elBdfdBE3/5pJ+dBOYmBY6QZZIGcxIXHPbmU376FeQEVLrINB946jXzBj7lv
	 irC1M03dIH3jOUz/WETpbbWcma4Lbhx9qchzid5Vc6Rat/NBOwrVJKfGlLdqEdmkpubFL
	 vJlJzmEP25558SZrSFPBaEtH/dyNbJc/FC0f81jZhoOIXPuzKom1z6NYkaE9b8kd7yOxY
	 otbr68PcAYybGYeQIrSfPj9jIiRP0lWTsYFO/1rU60tWJfsv1QrgwYHJtCQJ3HwdoGFez
	 WbRr2ACQUFtFQmKONkc9FXM9Y7U5Qwn2NFRWtquDuEXSduh/CfjVUoyRT6DJU/6et2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=;
	b=r6zmur8uXxZB7CBB4jPytlIdTB2p0wn+8R2eE/JzupMf+NuOmSjFs4MbcYnmQR96Wp8J
	 3rVNM4ZWk9O5DDYXegtNkhtE4M78aI1E51iQ/VZScfvG9g/SKJTCX0nHEZYsSOAkfJc2H
	 IU1JxMUB+AS+yTWj0jcde3+fsdwCSETOMr1hSEqdCXhEvUAVUobnFE6Ez2r5RGoHlSIvv
	 44M4olIABF94mmFSTTIgQKi5LDoXWhbze9Uca+hMtqJVjY3fdmuG7sK27RCns8UVXWAjb
	 CTmFUiJTUvcSdBGOin9gul0j+PWlHfZKg/NpVAa94BhRRZStDvH1v9cZu7Ei9TKPIAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mx1/h9ZW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESiwEdb4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B069C60A3819
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B069C60A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mx1/h9ZW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESiwEdb4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fMcW650388
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=; b=Mx1/h9ZWLe2XfjWf
	xfKdJj8YwiZbBc0W6qfOZe0q0ez5WDTvwbHHglOaAlRoerPVnLVz3F1Thd+wPhrJ
	PTzBY0Bb5C9ncOm5ZCx7bX3JvoRFB17p9h25oqiaNSLCWBtGZ3dNihgfowmPBrBx
	yiOMA1jeC2zKsbBT373AzW2a2Fq9ITeplauBWWKKitG98IV81AWhTrc4p1hUly6l
	dIbQvLw7wFfKtUIr6BBCw4ddfMy/CcekTXf5pQsimG0UxBEoZ2S7qJuLsMPZvKFh
	Xn2L5qNqYQDH+bbf8wtB0fL8yjo0CX925qp9BZrzcjzKdMDSM/8Fd41It0jO/ZgC
	QNuDmQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyjt7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:59:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1581597c88.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165174; x=1795769974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=;
        b=ESiwEdb44iytkewt3rgTyCeRIdxSnSb84NaSnNH2y+b3umQunV7qsNU2cX/hIlorSy
         N3lVtHMYVFSFIsEUwSm7pweecVHoIlsK5drQGONEX7dBM8XTMJx0wCQRxrjU06wNDCwN
         7gTYlrZOsh7tz85/fTKts+ywCCpI2uNsIYUy9R/VxgxOSCEMQEmlnbbFNcDtljRolblo
         Uokhc+7G/N4owXXNaz5P+EwJma8e5wCcXsKed1tqPI3aWyc8gIWNukh7t4lKA19pbJGJ
         KpB/SlPwVUthodKpdCB5qlzPsEe7Q0ehW/qUVZhx1Auo2Pws3xZO5Dhkzvc60TjWVp3N
         9Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165174; x=1795769974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=;
        b=B8mFcqohaOaoqQPcqNzzzfsW5xbnTEG1xFFEMrDYklMp+a+Pd1ra2ULpifMkg3qFmU
         YlJUTHtxcyJ8Q11HvIfGJTXIU+rrV8lxTDTFwt/bN0KBcr0rJI2a35oUgyu6v7sOxYwm
         mjUxp07CVemAT2jKIsq2JQvWvvEgEGUv06g2oKsRGrpzaeaDs21id9QezdN1q6soEBDV
         ot8IdJkaXEU7wqqFvEdGkLswbk/AnvYPKL1YCa3Hcv59SUOGYgdu8it3cARYGelRVdm0
         /1pAU/bs8UCrSwa/Kr5q4joM5ezP+kGCpxQeCdTwxK6DrPaCluhQJYP0p1Dqra2lJ8uD
         bHTA==
X-Forwarded-Encrypted: i=1; AL+hErFhmQ/J36u3ihi3juAvhLdEiAvmmxk2rVDhpPKrWtuiYAg/P6JJnbjc7VbpZVmfikzy/XXlvCjcuewY@vger.kernel.org
X-Gm-Message-State: APuU4Z/XPqkHmAD01oXWrACP1auuqMrTKYvykmN18q3fTa8+ofgRZNR3
	+iNflQzdvsfH3KQ4tz5JHY/TpUjsxGpFO0TYnMmB3zaaJHB+fh6U12pyh9e9/+rrMiKQgiPvZsK
	548YDA/h/jOXXP2YvK50BKbZJhV43E22hZkxdX2cQ6qWrYMMtsCjxUrrRRS/LLcqU
X-Gm-Gg: AYBFou32rln0xRsyRMqPQZYZu+VTGFIwByU1mrIDY15ugPk6CrCSsO5EcX2DWSywIOT
	g1KjI37cyu0U8u+VypZaqfMbYzdeaTpycRnxrGMfyiU4JGNA4FJp0va2XHp6Ds9U/4AzgcPmlx+
	fgD2a2EiHrrWJjKdR31BlPkfQJ2xLzpMSVcO++JGxECRABRAOwp3SmK5w2+GCG60KJk7BuhJkkA
	EyENihxbAPPrKX3cgWR4g9r1dsAXnvMe1bliAU8bWIgBx0fa6lNqhC6urL/BUM+xC6BqtCABXCr
	7Y3eVMyt94PxOunarOcu/JfNXKROa3DjsxlMjdsDxB3lk8E5/5UgBtZ0mk/4usgGvmm2mL01HUQ
	XmXMJkzAGoed9g5bKW0F+rHgOUyg/hv+ax0dRhV1i410nnuek8H13L+hO8tGK8DnlghXgwygYKp
	CD2aTYs0ejGc0bRcTHVgOgwJKJC6ATvp1la1ndoAXF4+SxQRW4wzgjSECt8yiirJHkQxD+UYyZy
	DXBqjPi+6Q=
X-Received: by 2002:a05:7023:a41:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b556894f1fmr2412818c88.16.1795165174154;
        Fri, 20 Nov 2026 00:59:34 -0800 (PST)
X-Received: by 2002:a05:7023:a41:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b556894f1fmr2412798c88.16.1795165173655;
        Fri, 20 Nov 2026 00:59:33 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm9490658c88.9.2026.11.20.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:59:33 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:29:07 +0530
Subject: [PATCH 2/4] arm64: dts: qcom: ipq9650: add RDP488 common DT file
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ipq9650_various_devices-v1-2-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
In-Reply-To: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX02OzOykt0KtQ
 S3dfwSOFuA23eVqUiO/Ul58+R6PG4QogvYFc/DCB1WtBImANEXaYQvfIRpRaN7PRw8KobESHpSs
 YKf4YRg8JnFTOYth58B0xGeVOQqIL3Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfXz/pLQiU2FsVD
 K+v1PtvYhQ1Pt5i1twJwYB2dQWQ6IPGV5nD/1fXlaGi6l1Su45fWJMjtdXCWlO5DhVZwG3QvULH
 3BjdpIrkJ1nKV3FL2/i9QpzuRWK7+ql9mzNY9bKlqvxV7SwF8XcY2y6WMotIqYiCopSyOIID6h9
 LEOXBB6k4aw8/DjjFgy9RUGO7hQ77R51fSzKz7u3ZXz3W44Zc4fy1u+jf1Nk6LnteLqI/dgmi4i
 xD4rQgNRGSgSPbm3VoPu55CDbb4wIuzlSIqXQwka4Gpiv11hlpLhecKfIacTqFai2zjiADCybwU
 KKyJYVriSigFfEcfVYJ5PmvfRMFNX1F0kC5VajRFYGN+LkwXnPC+/WtNJx23TTtDBcND+MetnbB
 1w0SRkIYjL8j11JaY4j7M/M+oaZwuzU84DiZ1YX4i+44gaPktLHz7RfO8NV/S82AlTMWHAcAxs5
 vy8ZMaAL1bei5cRJGuw==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b000bf7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0v5-D9jr3w84b_CrZXgA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: gcMGo0KpsJD2hthMKHJG_vLLihpZ6UtF
X-Proofpoint-GUID: gcMGo0KpsJD2hthMKHJG_vLLihpZ6UtF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200035

Add a common DT file for RDP488 to share the common definitions
between the eMMC and NAND boards.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi | 190 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        | 185 +-------------------
 2 files changed, 192 insertions(+), 183 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
new file mode 100644
index 000000000000..e51d75bb9576
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "ipq9650.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
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
+	reset-gpios = <&tlmm 28 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	pinctrl-0 = <&pcie2_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	pinctrl-0 = <&pcie3_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 41 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
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
+&tlmm {
+	pcie1_default_state: pcie1-default-state {
+		clkreq-n-pins {
+			pins = "gpio27";
+			function = "pcie1_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio28";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio29";
+			function = "pcie1_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	pcie2_default_state: pcie2-default-state {
+		clkreq-n-pins {
+			pins = "gpio51";
+			function = "pcie2_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio52";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio53";
+			function = "pcie2_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	pcie3_default_state: pcie3-default-state {
+		clkreq-n-pins {
+			pins = "gpio40";
+			function = "pcie3_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio41";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio42";
+			function = "pcie3_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio43", "gpio44";
+		function = "qup_se6";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
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
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
index f6411a55c81e..1ec4c5b91780 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
@@ -5,194 +5,13 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-
-#include "ipq9650.dtsi"
+#include "ipq9650-rdp488-common.dtsi"
 
 / {
-	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488";
+	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488 (eMMC)";
 	compatible = "qcom,ipq9650-rdp488", "qcom,ipq9650";
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
-&pcie1 {
-	pinctrl-0 = <&pcie1_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie1_phy {
-	status = "okay";
-};
-
-&pcie1_port0 {
-	reset-gpios = <&tlmm 28 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
-};
-
-&pcie2 {
-	pinctrl-0 = <&pcie2_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie2_phy {
-	status = "okay";
-};
-
-&pcie2_port0 {
-	reset-gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
-};
-
-&pcie3 {
-	pinctrl-0 = <&pcie3_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie3_phy {
-	status = "okay";
-};
-
-&pcie3_port0 {
-	reset-gpios = <&tlmm 41 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
 };
 
 &sdhc {
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
-	pcie1_default_state: pcie1-default-state {
-		clkreq-n-pins {
-			pins = "gpio27";
-			function = "pcie1_clk_req_n";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio28";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-
-		wake-n-pins {
-			pins = "gpio29";
-			function = "pcie1_wake";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	pcie2_default_state: pcie2-default-state {
-		clkreq-n-pins {
-			pins = "gpio51";
-			function = "pcie2_clk_req_n";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio52";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-
-		wake-n-pins {
-			pins = "gpio53";
-			function = "pcie2_wake";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	pcie3_default_state: pcie3-default-state {
-		clkreq-n-pins {
-			pins = "gpio40";
-			function = "pcie3_clk_req_n";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio41";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-
-		wake-n-pins {
-			pins = "gpio42";
-			function = "pcie3_wake";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	qup_uart1_default_state: qup-uart1-default-state {
-		pins = "gpio43", "gpio44";
-		function = "qup_se6";
-		drive-strength = <8>;
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
 	status = "okay";
 };
-
-&xo_board {
-	clock-frequency = <24000000>;
-};

-- 
2.34.1

