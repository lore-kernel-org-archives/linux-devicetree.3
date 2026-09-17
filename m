Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4644E80CC
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648008; cv=none; b=EiDAry7WPkRl4mbQ8TirfRqVen3F5exuD45lldpHtj2wgD5qVdMcrPjh6rRYyfmo3tNG+cA2dSSQbez/fv+wR65vAgnw/O92aCQqhg3LbqQ/F8OvXyQ1fEgp/NK/hmoyZrWOfX390eX+med88EdftDTL/xEpd8LbgfSpFOVG1+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648008; c=relaxed/simple;
	bh=Em9eWTjZcc6PBbXmIITyyYYMe11RMrj7Sq6RRXVEqnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mX4FOX4TCRQLKAJZqpRcBhuNwDuyNol0TNF5KjCjS16a/NCJ8sZM15yjhT1o/hBvXSGHuLCQeApoTrPrCcRwwMBlHmBnVI8oEsXV1noDx2hnkAfFf3wYRH4NegXN3vcAWC/ctPbqHXqzcywXFfD/8HsbuziCQszNLIXy1tE3qBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEIXVVE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fiMZYCva; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEIXVVE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fiMZYCva"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZbtX2410452
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+bZ0Vr+OJgyuqFHk3BUt19ejeK0tc9bm/BlUXqLxzM=; b=jEIXVVE7Kwt7Bn7l
	1HbZ9SdwBioWEGl0mYa1OON2umXpH8DW6vd+PXYql7ItXmSrZIl8l/TN5o83Z7N/
	OFN4OluRO7y39xraJDqCgijPIuYGtYIOvIok+15qWXs2hzo5tvifwQFrEPr3Rp3o
	espcd3XvnUqDlPq52AZp9m+D96QOp0oAhixUGe3N5ESwH9TD83PYJeN80gngr7/d
	NwVNqUXSo6qy4dtY1lrFHVG7YK9Kb7obimTeCss5ryhTTdY1+DEjsldpzeTh42RJ
	TUusypFcIDy+YvCCX+YsFeYfND4uCAkHHZT1Ftb4igqYPDIqbjFBb5PQ9Gbugr79
	H+sdCw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gqv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so870041a12.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647986; x=1790252786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+bZ0Vr+OJgyuqFHk3BUt19ejeK0tc9bm/BlUXqLxzM=;
        b=fiMZYCvaqKR8vmqMZodY43eizLVlK8sy4I0v25knPt9oS9r2OkkqXCCxjveqEZpD7v
         NligIDWE+FgPHcwrJCcExTtOPVHy79ygN6/UacnekaKjp3jyONyAqO2rdsbs3bA0IxgY
         6gIz2tAAn+fFdB1K2OAVS0s3yLJLIBss/6EjRh9pzmCAOgBdKCbOWZVJu0gVNPtkZuGH
         QfPmIM9foAD2c1X/CsJL0aofvx5BFO2SeDXrcmaxJm/8DyymbzjRIbeeomi3855BtK+I
         T4pSIaB/DsYX8huL+DoGykWlvcuRWS9ghnCXhJDOHnnpkOq3jXkGoJ3wJKjF2bemMKRX
         f7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647986; x=1790252786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+bZ0Vr+OJgyuqFHk3BUt19ejeK0tc9bm/BlUXqLxzM=;
        b=vFbABYfEYE2vISf00pjka5m6hf+hSHSOvFyxRiV/MCAZeVjNbhVKlVG/a4QvX2cZon
         /5XmXOnPgowcfZn5SxQDebrRYj6/ejoJA7q25jaWPIXBpSRSWqVevgzlgH98QuAGJLxL
         t6JcGYHBYoJTA8tGEmu5wwRRH+rQUam2JSH6wPS1GPpLDOaFIW2iQnlyT6djFfztSkna
         jowxqaIJy56icLtpTnCTPSkcy4DpkrRrKgns2O2ZY9gUe96bJX09bUWAoZrvaHyVZSpq
         QW9RhvbCN6ht+EVxs+2biczjesSKhVwlMCl+0ntliRdiKWH9s48MQbF5TFc/voUHZM0F
         vXXg==
X-Forwarded-Encrypted: i=1; AKwUvBxqW6fryAyXhDpHOVJvw+6u0GIL6zn2IF24p/pBsuGs3zlyE2cskba0ByCd49x9zF7QLXnvyBn1BNdY@vger.kernel.org
X-Gm-Message-State: AFuF++mH4aYUiMh2u8UNhu/mhe4hTCbkeUBqIEx96ESukid9JNzeHcQP
	EuHjhF691NVTKePIGgBJHJKXQWJ1FP6BasicrCygUF0NBmAOZdh3o+b3Iu3EDXnczUkh8JS/2xY
	VL1t/FXYwTQc+hwJ5VSTY3S7ZpBeMg4+Mk0WRahJ1Wm9NNPm8qZm4o0CPhbsbAb27
X-Gm-Gg: AYBFou3lHuTqlTHpMe439dWt7QrarAtqQ5B3D/udVrZE3rLn7FH4QOhFUUb8BLkVIpX
	M7VSBz9K8fg0XRBXLdgYp7hbSGpeNWVl6qGLnfAWYrrQcvCEoXmZyIxiA3xo4u0/uvuD2K27vet
	HJGNh7eX3aiOpbtJQ77zplFlgiRe7slWtBWHjUV905/baqsO0TcFLpCPelaUbNcZd2Y6j5tH8MR
	K/TIveExYImHB3g6RiQZg192s24wNADNKJSPJBY7QJukbjrMGy0BxfaRJPhp6eZPEDSrmUELdUj
	ch6EPZ3JDji5XttfrjHGu2F56n+jXSpzjH7qNCVMKYfuzRZwWofwxJGKUDkWkrlQQMnQdpOiaP3
	bGZ64MmjJf055TJ7EhHTEzUUFewC/SpNpqpY=
X-Received: by 2002:a05:6a21:9090:b0:3d0:e034:a26f with SMTP id adf61e73a8af0-3dd5f5d8672mr17718883637.17.1789647985906;
        Thu, 17 Sep 2026 05:26:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:9090:b0:3d0:e034:a26f with SMTP id adf61e73a8af0-3dd5f5d8672mr17718824637.17.1789647985375;
        Thu, 17 Sep 2026 05:26:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:28 +0530
Subject: [PATCH v2 14/15] arm64: dts: qcom: lemans: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=4183;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Em9eWTjZcc6PBbXmIITyyYYMe11RMrj7Sq6RRXVEqnM=;
 b=0GpA4PW0U57T/LiAHqtOf/HhFwulNj0+6EBv/aTpO+SQOcB2PfH9pZ0j+cfI01d4XA/hisMnl
 UCXFCBIzKxQA7NB26yjFqBvlAa9C0pOTwur6//mDmJjmoKVFRWd1pL/
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: RFzzEtQTSduT6aX-omkOn8hGYIiWUR-y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX3BZxIGuJcSso
 I+NA8aYMTFlLsDjERneEosc3uIKDz+YygCEBlQ/Mf9blgmgw9XCkB68V8/YANxYRPjljseb2Rgc
 aOWre/1PZ/I+GpP8KQAI8J4F7pMmPzWX/EvRU+xIW9U0M27THJ0lbs0bM6l48Su+cUSCs8jJDsY
 svHzUW32w/JYQuPCBuyENyxyTm7G74qYp/pdg9J+I0MsBDT9dQgYitF/wsWEGt4T1dL3mQM0i1R
 bfNdOAdEZExPM0HbFvZUSXw2imywefJIdfwIPoAHLYGxbAam8Xlmk8SKRxg+uTklhwhyWaRu15K
 vSyp+D2NvklKTTw06k72PwgLQkENZOd06Oq4AVJQ9FhagL1SnQPy4QF2cqENwugXLXGbnmLNBJq
 OL+8Z6X0vJgJxO32KNpSg/VYlJmWwnJepWn5PxOLLCKR5E77SW3JQmn4D3SivNta+XyU4K6dYFm
 Mx1Yi1qRFvs08UN5ECg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX9otFwuM7Dvy0
 Om61ci7Mhe+y29bDS9S/n6IVTFSm9jjPNjtP0gLHDW5Y3YVLhEKvZxHnHBgUmGc4WM8TIkNBmxD
 OhONKuccv8SyUuWiIzp4qeTb0bxSUmc=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabdc72 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xTuWgevKKEmUOcCBws0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: RFzzEtQTSduT6aX-omkOn8hGYIiWUR-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcieport0 and
pcieport1. Add the missing pcieport1 label to the pcie1 root port
node to allow board-level overrides. Move perst-gpios/wake-gpios from
the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
&pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 13 +++++++------
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 13 +++++++------
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 12 +++++-------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 194e114a12a0..89c721eb532f 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -839,9 +839,6 @@ &mdss0_dp1_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -856,9 +853,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
@@ -872,7 +866,14 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 	port {
 		pcieport0_ep: endpoint {
 			remote-endpoint = <&m2_e_pcie_ep>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 3ecf3d464dd7..6b540eb318d4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -961,9 +961,6 @@ wake-pins {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
@@ -971,9 +968,6 @@ &pcie0 {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
@@ -994,7 +988,14 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 	wifi@0 {
 		compatible = "pci17cb,1101";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..7ae08f29d974 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2753,9 +2753,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
 
@@ -2767,6 +2764,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2927,19 +2926,18 @@ pcie1: pcie@1c10000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

