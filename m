Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DC137F75E
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154025; cv=none; b=e1bKJ5i+1lJClJ51AuyzOUTODnji/y2w+0WYXiwbhIHnTTeZtcdyaV7aPQ5iNwW2eEOnVA9PpUhJ9QgN2m6+DKpoTmTMlPYkj8TM7ShkVC/FDgZyh32tuPb0lzKHRKoevdIAIxjziVaJA7wq1AP1t6dudDcXLAHdNloqG3zbpqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154025; c=relaxed/simple;
	bh=tNZSB7ttTGLRExjkoXKtLnSqMi09OL11vseaCxqJ4Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnoDWxN3j9o4jJMauBlIvORz0g0ZCF3nyLX/Tr72VKIZ0VqmKR266nCJEFiaVuBRJJM30+qG1y/7j0JrH5uEf6pWvT6Z92RoJ30BQdYoCjOjJIzQxSrUCyoYBZJqniMt7ihM5A8LGN+7GLCjahFXdzNfONehKZDCeY1aZcqlYfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6YfKaWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j55ddWu7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6YfKaWV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j55ddWu7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0O2Xs3093106
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWxYl6U93+dVQ/VwWMZ0KU2Kb248kule1lQjCtQtzEg=; b=U6YfKaWV29k0rhDa
	7ykC/5vuE/oO5YhRW9E/DE3HU98x1LH+TtWKBJwLbYQJOj1jyoFhW2nY38A2b4Kl
	lFBEUD/uYgQB7tsLxFBObLA7G7g6FpxZC9TCm2xgYE6M6QtztYzW5dyX4PdwvyOG
	T9HZ/ra9KqLnUim37rzKJcxFSYlRdrJR7l8V1T3rWzhp4IzHdokM56FoBkBK25kD
	g6t4WAbH84hYv0rXoHpoDI+TkP8SP33coBufsqFyDVVc0f8zcDtTA3Exu+ZH+jrt
	UGNL5YXlFIFdFVtrvwM80dDWM6g1rXiMhO4pE1vU7Y7YMX+ggN/45kJa8O+Rgrll
	Uz6RJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6v9mka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so137238785ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154011; x=1781758811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWxYl6U93+dVQ/VwWMZ0KU2Kb248kule1lQjCtQtzEg=;
        b=j55ddWu7Ss4kp1i+5fz8IyCtsD5lmhAURgzhnSjc2rv6JtVLd6FxYv0ztX/T8OtxiJ
         xjT+YgnGWfhF7sA3xlH+AU/p1DZ2xrGfAOIwNUYtsxYbHwTHQm2i1l7fkoMczJopiWqq
         jTkpBXPZYlbesrYdVYcHh+ygKSz4+jBB8iofuhuhij8iqDuIJoe5Img4wPxPLFUdjSse
         6eI9aCTJEAJ/Drg6TYErY9ULNzivRtnqRlcUg4MN1SL6AVlLnXl4etvuPe2EE4Fa6hWi
         y1vLNgc78KA/tnHAo0J4jWUWn+PJqEnHjShHG9p5uJEXY5DAxISplHTArVR9DhjdTcko
         RLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154011; x=1781758811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eWxYl6U93+dVQ/VwWMZ0KU2Kb248kule1lQjCtQtzEg=;
        b=Vd3RUwnZ6KwtWE+qNNxomY0eaO4GJ2jHuSTtwr/7lAtVd2eHUKs8+6sssvucyUaS4P
         skTOW2KHToQwWU9oiOxbdLTPEdrwhrLtEi2ZOAipyrYUMCvlx2QtFIEMAbVlT7iqJKUl
         LDYPAAcxVA6SKlKspQblnFIxcQxIoQd1W3eDBt+RksW2uUoWbI7PFiFgqT5R0G312kfS
         EXbGIo1Xo5d1mLAILv3X84mM9ls1gnM6opt3NxyAtYXfzZc7VDPvZZu0ZX8vBVOBNEJx
         4Pcbo/P2koG9a7/LuvkQH9rSdeULeOa9iw/ZKUEaH6hOOYIAqIpQB+UnK9JFVzovqQCR
         VU0g==
X-Forwarded-Encrypted: i=1; AFNElJ8cwcd2gftMhnpgpjJCQrPkYPbGlIHepq5voABC4oE83ysIkBNC86mzVu8iJjt1L3kV+qv0dnnMdfr6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7L4XWRAFKgUh6NShr4F4y0nxLJHf3a2NCpUBxgtMS17iCqSb8
	Ld70ddRGVrDxo0JtCH7pn3GhYd7/OCQ2WDndRqmeJIQ1Y6iqiSfesvZ9dj9CJAVn35QbiIC0z4K
	GNtswSOFxGNL+vSLD2py5FPybUUYW85w6gfaYzNwkZ3yq1Ny8LaP9ZfDWDAu16p9+GGtFdKW7
X-Gm-Gg: Acq92OHqED+vqT7ek3DTXfNgRHybQbBhjC56Oy/izrzqmajxc7DttDNNRJMKmpmeJhl
	dyV8pA0X3/duDU81WnXXDxHhVzXi9joKV83/SPMguvB35Y6TT+/FE0B0jam/Q1JsMvi1LPIt2sT
	feIiGgyVnz6qwoPcA2LI7F+jNoFbYaxcGjZ80O4gZw6J2BjENn8hN8bJpt7jgRewHDMIrYHyR2N
	1+iaaX6860t9lzfqVGed2Ml/M8Kq0y9mr7ZmOK3feijPApnPSZCA6tTJ2jtCzb86o6g5LvztCKX
	uLQ2oJS7Qn7Tly0HFL2uLIIUNxkCsMvFaCIizdXb8puG932FI1o5dQx14O3rTGF72yl53jk3+W8
	wlsSKok5B9maCGsEvoExLIH4qq65AQZEsOUvkv5imSWBpN0/skuxvGLFyc6fYD0SwvxQ=
X-Received: by 2002:a17:902:ecc6:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c2f0638230mr14325045ad.9.1781154011261;
        Wed, 10 Jun 2026 22:00:11 -0700 (PDT)
X-Received: by 2002:a17:902:ecc6:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c2f0638230mr14324635ad.9.1781154010732;
        Wed, 10 Jun 2026 22:00:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:10 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:55 +0530
Subject: [PATCH v2 19/37] arm64: dts: qcom: lemans: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-19-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=4233;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tNZSB7ttTGLRExjkoXKtLnSqMi09OL11vseaCxqJ4Jg=;
 b=JhyRZJABmVcn6gBaSRHhJPWozg8/PBD+mhP32b2q4BNebJTj8bROjQyaPDSYEutyGNzFZ5Z8k
 HCV/nsCWse7BcqBCx5I06hD5OPynwMK8Y36IWRyCnKtAGcoCqRw8UY+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: YpGDYvgOYzsF0X95UmICwblVD8L9Mvgz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX7pP+L7Wh6Ipk
 fBLR2cQi4HPSg2rOc0rzuQbSP9RJv0BL/YnyeIu6fyS7+bRF1hqdzNABzohHbEJCvMsq0sH/jjw
 UkLwh19c8QSQh+GJDKPQfpcrFoqH0A8=
X-Proofpoint-GUID: YpGDYvgOYzsF0X95UmICwblVD8L9Mvgz
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a40db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JsWMq0r1082Yio6m23QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5OLZonsaw0kH
 9H/7Bubsn2NdVMH8IoNlfg2lsnZwzWc3/hnY/ycfmgSZuSicmp2RQV6x0VebHFZXmKxwKxnaSmU
 ewgnwPWmDyEV9v6xHte013N20Cuh/a+sarXoWKdnUnvpP6gI9aFVK+OOtg01xoSbXr/WnsRQvHA
 CecMTXBsFWsFgUDfq8IX//Ach3h9n9fSAItaStPhYb8Nw97u5E9AMswDIQyLVgaWuEfLkfgzKvb
 IAFa4dRs9cI41JBeou6whHE/RAIhnZnOpnbRj38iEQWZWmxppwBway6qBdLCL0yHDw9qJBK4csM
 AN8hOrAnyfMQf8TbKzX+XSFODL0XNJK1L/4KUZaHxbCJnesCYPMjW1vj/zJ1zoBetgDU0vMd3c2
 iUZu4g5QkbbQZzrTiIlCbpjIRtkzNUTkD1Unq2VuogYt/txmNZBFMSNMAdUr95hOMsKMV6xz1Pi
 miCNC0pchKbC9Uy8TfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcieport0 and
pcieport1. Add the missing pcieport1 label to the pcie1 root port
node to allow board-level overrides. Move perst-gpios/wake-gpios from
the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
&pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 12 +++++-------
 3 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index fe9a2cd325d4..f492a294ee5b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -702,15 +702,17 @@ &mdss0_dp1_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
@@ -719,15 +721,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport1 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 3a6d73b485a9..d6c5a8b49fa5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -853,25 +853,29 @@ wake-pins {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+&pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcieport1 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..48d50a0dc05f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -8678,9 +8678,6 @@ pcie0: pcie@1c00000 {
 
 		power-domains = <&gcc PCIE_0_GDSC>;
 
-		phys = <&pcie0_phy>;
-		phy-names = "pciephy";
-
 		eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
 		eq-presets-16gts = /bits/ 8 <0x55 0x55>;
 
@@ -8691,6 +8688,8 @@ pcieport0: pcie@0 {
 			reg = <0x0 0x0 0x0 0x0 0x0>;
 			bus-range = <0x01 0xff>;
 
+			phys = <&pcie0_phy>;
+
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges;
@@ -8851,19 +8850,18 @@ pcie1: pcie@1c10000 {
 
 		power-domains = <&gcc PCIE_1_GDSC>;
 
-		phys = <&pcie1_phy>;
-		phy-names = "pciephy";
-
 		eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
 		eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
 
 		status = "disabled";
 
-		pcie@0 {
+		pcieport1: pcie@0 {
 			device_type = "pci";
 			reg = <0x0 0x0 0x0 0x0 0x0>;
 			bus-range = <0x01 0xff>;
 
+			phys = <&pcie1_phy>;
+
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges;

-- 
2.34.1

