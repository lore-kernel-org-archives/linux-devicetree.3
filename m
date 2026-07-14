Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CB72C15BB
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004111; cv=none; b=CBkaG4FNWaoH8a/EsmW5rsSvW4PZw8dJ2wawQZs3mFmEgpT4by2JVVe6wnXekxhGmnTyw7RdT/KFHeJuefYYqTNyTgBgBZbTG79hAfiyk4cUSY1TX1OpfU2Ys3sE+8hYVWyZ8cpWNaYxZMWeETnxLbPklUpPtlgQOALGbixqHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004111; c=relaxed/simple;
	bh=Y7UjFBm85smrzJ/ry1/wlcrpkw0E5epkTHwa3ZUdEIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QtmOCaP3jxZBvF5vM0cPb1pXdtfgFE4UPAqvAOyLbX/MprF9ZDjuXSJ2TzZuq+Gel+Ri0FgPg8/rABs0N/qIwNGPq73lXHudAPFyhHmZMlyaVxQjtO/+wVQ2dQWwwKp8y4fuKB73QL5rG78RnUv0S4TXwUGkxiXRhIaQGXAl1NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSNxqM2B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dL4zz33d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSNxqM2B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dL4zz33d"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Q7E3182473
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmpKAHUkU11crwmE+Dh25P19YtZXeAfFlBes9UjHb08=; b=GSNxqM2B8Zfu4Tdo
	pesWlpKxWHBP7lkIJf9DDWTW0gU+waBgncFbzrnxJ8/ur6e7+nVpzeQfyjN+9/33
	cvlOO67nbqt6zYM4VC3sKAUtAHMJhwQBeAc3f8g4ssvPfb2yoSwuZMTzKnPi9t9z
	D35uS1F4CpadjporyLdkcNWNp+oAvOlzt9NWbISQWUuiQrSd2djOfeKk3cyqyfT0
	36Ugt5kqOMo+7fZXF6SaS3AytUjzZ4GtHJhb04LUurTYvI+A2OB74+QYoIShGVB9
	TKTwwi0m51Vw2zOdnhmTj115snm3CsMHesTOHh8vHB6Fm6G1sXz9aa6yr7yysk7f
	MGh1Fw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4quwfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccbb61893fso88520175ad.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004109; x=1784608909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmpKAHUkU11crwmE+Dh25P19YtZXeAfFlBes9UjHb08=;
        b=dL4zz33dD8bM7FC/IQxBIntIw915aUedCkBv/oMy7QtxIxywgEGzDohRMIQe3E+gr3
         1iOTtUy+B3TPUDsa+VefRALM87HrB2DPqlFYdh1uqZtNuMtxIe63h/PC9PjMGGI1zNiG
         xinXoiQyn4vG3CFdN0MsqnPiuH0e5WR8oERU6+CxQZslMeX/XBIK4mF7iorwLAI3RcRx
         tgGWNC0+E5rxgmIZZOkBesiHLaPZsW5/sSvVjYhaAVYhJQTGEK00BQ0WpfdIQE5/J3Zx
         F8PQgLYcB6tyfCIh7DDwoGSxemQnQNlgNXL0VncBu8dNQ3rqvD204aUas/3vybU0dUkk
         jyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004109; x=1784608909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmpKAHUkU11crwmE+Dh25P19YtZXeAfFlBes9UjHb08=;
        b=j4DklI99N+/CbSUt3x0LqrSfB4jE2p5UGUBaGprc0+CTCAXnqHK4dVA4jSX2snZK9y
         rXBnIpMyLwiXaZRtc0WObWNbg1LuhgQKQMgRSWY9bYZvNshmDO12T8EAZ1Vck6tIGEN6
         14zW7GyfDYCgap4u6ROOO/uBpLvxKiXBFV9NVqkBIgvkaZL+yGkn0As7OrwrHFe1QHqV
         SQF8JyvNfTsPmTeMi6Ct4HY3ySp0rDSz96YaF267qxUGfv/RvFVvZRTAgzutV2etJgEM
         XUxgIxliO3a/cX7yk+XieteItzSNQO571Q8w3FsKvH5nfMOVgzDYufi0VBma1YzdM/S8
         Cdzw==
X-Forwarded-Encrypted: i=1; AHgh+RqW07QBGr/ow4JiKr1yKOuUK7EHjDExiPYwAmkoh52jORfrdTtOGgqOxXIDEyEQ9yPLSVmDlwCoG8a9@vger.kernel.org
X-Gm-Message-State: AOJu0YxphSAFGg3xqKkDc4pQBpEroF1luFC4x57A4dvB6u10UWQks3rc
	2edtsT9alNpehHy084Jz3RlVDWiy3T41373TKRyP7bgQ95IK03DwZaDpzNnNicpNDgmtDZnowab
	R1nApPYgzGUVU3CcoKfr+LG0hTb3PbK1FDf3T1fiYcThyjf0OprM77ULYNpzJchuus7VpjzUH
X-Gm-Gg: AfdE7clgFc5MXfUTkp+etJSRDDZ1M5fKgW0om79Cx5ab54C8v8oJOCYTLwknJqoquyr
	XaYgJyb+RI3omJIEIOhBpaDpzB4A951Gq30EbaF6e9qNKOnN1338K9+IKeb3XxPrj3zUxLkZJ6u
	qfMY/qUGeGB2VqjVX/s/fRVkfFHBAOJZfj0Ba+Uv2J2m+zl0MPlW01l0k84hqxf2wMnR5Dzssah
	PMV3yoLZtMIoWThhTbJsXyy96bxEheNvQR1Ywjy5EvC2lxreuMCmCIKlqgCWKwf58PKMP73pptN
	bUVI6RXa1TPhUW18cUzV+Kfx1qbaSlCd/JYENkKK+hAWLiMry1WUg1aaIHr4fe6YU7K31a/gJPd
	rtWfY+vKVGrSP2dodCAXnxf0T8Q4ALYvO/4QhJ8NFoVhYkkk6c3/G0XMyK/VVjGrGrtJFZUfmHm
	Xokwj/rd9/NV+fN3MiDvDVG1tpGtdA3OuP6bb5GR1fBYUjow==
X-Received: by 2002:a05:6a21:6d87:b0:3bb:2200:f67b with SMTP id adf61e73a8af0-3c3571d035dmr862600637.40.1784004108565;
        Mon, 13 Jul 2026 21:41:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d87:b0:3bb:2200:f67b with SMTP id adf61e73a8af0-3c3571d035dmr862563637.40.1784004108114;
        Mon, 13 Jul 2026 21:41:48 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:11:23 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: ipq9574: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-pcie_move_to_new_binding-v1-4-6bb25887a0dc@oss.qualcomm.com>
References: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
In-Reply-To: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfXy3glykufZ6be
 tjmeV4WK66gl1v8DLNncBGKrgaxpakGUulF2fxZp3a46wH+lkIyr9TAKNouPROieQKtmkZP+5Lh
 /KacnTUaDQ4jtrqpXgYQuaxCv16Sda5TSYFldgCeGmrNrnvdPjMZsKkhl1bavsCDRdp3MJIDtO1
 rQYGUv8UW2/bWVo2jqEv6oY/Nfq6AfYIIKtQAvy+2cX7qbK/BKUafWGsWZUZeLeeMGx7KGp5SBN
 F7CXvAwbh3OCKxpyX6XZ9/gBrQlvxt+3VDcjesxasObtITf+FZ+kLIYBDARk15BOGMqC/L+AHMO
 DFqUvaBPQlDQVux+y7Eh9bMTB/2QFCo8KO9e3EL4nm4mbTB48G9V9Re3/Ka/Q1QwOfNbPzvoZ79
 Z3hA6nQ0Kw1UQkNs8sKZpfrKsmttQJhvPQALBxIO99ljrf4It01WiHp6vXZ7J60O4a2xJAVvuYQ
 OfqW23CULOystfy8Tcg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a55be0d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s1t8nmxUu40s4NX6_nwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: bEzTveIX4tov2tInHf-nIEE0a6aC7StI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX1Uj3c/XZRXFs
 lL7DG0UXTQi8YSiHf2Y940FI0E0EI1glK6x0HGtLfFtRC05xVv5jxh4dA8MTaEwajv/V/7ctlwI
 f2uX3pIu3UoqSTK95ajzAivZQXTvmDA=
X-Proofpoint-ORIG-GUID: bEzTveIX4tov2tInHf-nIEE0a6aC7StI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140045

The PCIe host bridge is connected to a single PCIe bridge for each
controller instance. Hence, add a node to represent the bridge.

While at it, to align with the newer style of binding, move the phys and
perst to port node.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi | 33 ++++++++-----
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              | 56 ++++++++++++++++++----
 2 files changed, 69 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
index 3422058ac480..ad3a82c50e22 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
@@ -6,45 +6,54 @@
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-&pcie1_phy {
-	status = "okay";
-};
-
 &pcie1 {
 	pinctrl-0 = <&pcie1_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 27 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
-&pcie2_phy {
+&pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 27 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2 {
 	pinctrl-0 = <&pcie2_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
-&pcie3_phy {
+&pcie2_phy {
 	status = "okay";
 };
 
+&pcie2_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
+&pcie3_phy {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+};
+
 &tlmm {
 
 	pcie1_default: pcie1-default-state {
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 451c2076f6a7..5a5bda5f21a1 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -1004,12 +1004,22 @@ pcie1: pcie@10000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE1 &gcc SLAVE_ANOC_PCIE1>,
 					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie1_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie3: pcie@18000000 {
@@ -1092,12 +1102,22 @@ pcie3: pcie@18000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
 					<&gcc MASTER_SNOC_PCIE3 &gcc SLAVE_SNOC_PCIE3>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 			status = "disabled";
+
+			pcie3_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie3_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie2: pcie@20000000 {
@@ -1180,12 +1200,22 @@ pcie2: pcie@20000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE2 &gcc SLAVE_ANOC_PCIE2>,
 					<&gcc MASTER_SNOC_PCIE2 &gcc SLAVE_SNOC_PCIE2>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 			status = "disabled";
+
+			pcie2_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie2_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0: pcie@28000000 {
@@ -1267,12 +1297,22 @@ pcie0: pcie@28000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
 					<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie0_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		nsscc: clock-controller@39b00000 {

-- 
2.34.1

