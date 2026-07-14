Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C402C0268
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004099; cv=none; b=lbHq2Dzlq2T5znH5UXYSxnWnFbPqNPvJhKphdhE72ODiK4++T0N8+gLPE5mwx2mE9CTSzAu25bNY4miRvUNlcB998yR0Z6/uM7yaAF2AsxeFvY5kju2+O8AhNhpfwxrsxxLCmyoxUuUQZDcM4dlYI5lBftZtLO0OPtn4JhLTKzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004099; c=relaxed/simple;
	bh=nk3J6ULBW7xRPLEpb1kRSoS1Jdi4oOsCT33ipHKyZew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkvU6i7VN9qKvPS9wlI0qEO6/CAnkruFuES98sQgH0eyYEh42xOZtstxOhQijikEwN6SYbWmXDAnio0kGHsQvma+K3ubILnlAOdI5+pqaF5GBcUmk/SWqg30djxZ795tIpwbj1Dn/dqhpr4epAVhTxxVk7MnUpSbNH2V2dAPnAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUHiQmXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpdMVATq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUHiQmXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpdMVATq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38d1e3303476
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qeU1S8dCkIKOoGuAuPRYb/kTmM23L+Oo2ErR2SaYoc=; b=WUHiQmXlj73TklWS
	dzqT4KbIBVGRRvUiv10JAEIkyf7rF8n9fPSYAhDY7ioIibNN2lJLLVFoSMXtI2aB
	d+oT+QEO5DdugObxHBSgtAsZRQUdI3/S3rxUeayjmi610bdm5bGc0FfjB3sZDSEb
	oExumhe4I9ywdHNo8FLbmbrsvfXGv6lR0fu/krWSZN52nMaPPafh7c/a0RWJ0DjY
	FqwQoUVR9DJYUQWG6gnt6F212IUKAg5WPabhyzwkOkBdCTnM9RBRImKITCIOjLs1
	3BMEXF0ehbXJDIx3V1GKcmIQoRVgpgdpI3EypFS9D16nQSCCRQTYP87f+vBOrAeg
	YZD7Hw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p1x3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso518006a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004096; x=1784608896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qeU1S8dCkIKOoGuAuPRYb/kTmM23L+Oo2ErR2SaYoc=;
        b=KpdMVATqpjX5jyJnkqBQNUsse8hW+bD1YAxbttDzuFt1LU1RSJ+HrbS6hF4zW+CniM
         NwH7Hl8PSsWJaiEoFUzco7/vhxE0AP62+3EFfl5pgB3oY9orBzqeYkJUCxdDZ1I3+yCi
         wsFLSbHpc32Vw05bxIUju7w/PMP42Br9fVqyrMiSfbAiN7clsop+KyzPRXuHRgWaD6Z0
         7Sxzjq0+MnnTGFUktUu4MR+LEqw3gITw/ZoXX3Mhyhnt2UfRCmDjXczqNtlCdQK3WpJV
         9y184mM/xTI/4MsxnN1rmq6PaQH+honyxyWaT1klFNb6+zTFZpolVVgDzor3wOo/D0HS
         tXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004096; x=1784608896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qeU1S8dCkIKOoGuAuPRYb/kTmM23L+Oo2ErR2SaYoc=;
        b=X5Xw/iloYxgmcwPMGybc//SA/Ve4Xo6ti6t1hwPOdvlz5U87BmT2yyPn5TRA5a6ggi
         GaMdQDyK/ZzsbzdMX62EFGhDxFt9tTzPKtuIpHM+I+yTapz9iMARfJ4BWIgY+9d+3SZh
         g3vBIO+gMRqeQ+IDViCcDynaxMJz6vMv/Q0NjJXjZ0Z2IhGlC8eXFHg4DMkVyQ98U5I4
         amBzhWqDzzUJw0rIA6wJhON5IRfjIRLDMyHXndoihwzOtOlR0zmo0UEPkIePOAR/BRyN
         qULhoSNGO7e/wDTbZRJFQ9FgZL5Q+fpgSR+S+kpUJcwX57dUEaEUwVvrdkTX2oeCOUYo
         JmsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGAlBcF7eNHKH0pFaQhVK/CNIhWP5UkSRg28MqgKtcGNyJipU+rQzOnu90cUXXtnsliq00C4a2Oyxl@vger.kernel.org
X-Gm-Message-State: AOJu0YzLEPkI4BY4DQhsAWJN37wU6r+Jac4zpNaqw/rb1Ee3f9Vzf7Yu
	sX2DYlNmkCcxS6ZX2K63DGdJWRxPLbDFAUD6ixcW4iV6ltiLjjXDObFKyXeoXQXUQjMCYCRARHb
	dVTSwhC9biz7FWOlx5neZzb7VwfzukFnDM4BJydDl1rab0pgE6drPy36RqvEtfOK5fxmQY/N4
X-Gm-Gg: AfdE7cmlUOAqNEZ9Egq8b0BVrmCUbBseRQH2F9i9umSGrFEYA1uZy0KrnYQzIaex11i
	df1zH6vKDQm17nY3HQ/RoDuN2R3HJ3n+OkUj6phDUlGyWskU676bX0BioaCVNzAh+JFopiRDaST
	yK3Y62ivZQD9umbNX+6o5z3fbE26SOTBFMhEocIqxwWOzTsI9r9N8V0kGAMSk2Y9wJjrmB75Ws/
	c5jGROvuZZyqWNviCYRPwerWP8lfkJYEbCx1yIkZSI+S3H2/MVkqCGV/p351J0GvZWJvKth9j8I
	uWbYLPTdo0QfVvAdixtw1zFnQo7KHbroyRrKSHm9hIl4m3FtJO4hMi9wwfYiGgovWADyuHs/4j9
	Ara76GjPmMEQOdaOpTbzjAhxH4XUyfGuv1eK5mdzDycji+SLRm7IzO95VGo5mUzgPrEtsAd5sR0
	6EXr4Q8v5GeepQBeweyw8bfC46zrciWH68XwCd9pc2rg1nkA==
X-Received: by 2002:a05:6a21:3a94:b0:3bf:63af:84c with SMTP id adf61e73a8af0-3c110a74037mr13266579637.41.1784004096514;
        Mon, 13 Jul 2026 21:41:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a94:b0:3bf:63af:84c with SMTP id adf61e73a8af0-3c110a74037mr13266544637.41.1784004096072;
        Mon, 13 Jul 2026 21:41:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:35 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:11:20 +0530
Subject: [PATCH 1/5] arm64: dts: qcom: ipq8074: move PCIe phys and PERST#
 to port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-pcie_move_to_new_binding-v1-1-6bb25887a0dc@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfXx29qN5J9Nc7i
 kiGiJZJIEVnqLwLuzwJnq4Zta2j6/O3mT3gYu3RfEnYjckS952otr9L5wbJQjd7KL1ApWuDnSPa
 zYCvu1YtLiWLC+FBvB7z3h1uvfoYszA=
X-Proofpoint-GUID: lwJIRdD3h6w8qoHEhmcxnJ7WvMBSoOws
X-Proofpoint-ORIG-GUID: lwJIRdD3h6w8qoHEhmcxnJ7WvMBSoOws
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55be01 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EB9RAXnpC53JDDx6CxUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX/WUneiHvmsHr
 g9fGia+1nJPwYZi2q4ityvAa5vz1un7Nw058+pI4JsZnjxRsB0qQCTzfWXFPR9m7ur5ZLEo22Z9
 xWy/sJoi/X4FvcKawx68iCMHumVRKzaUAqIRML0wpEPVPzmPBzQcEP+fVhha3CPS5Ossth/85Yu
 3SwEuzdWz7bqt8fD9CMthYoyHLsKorTfNNB4SOxvIny4r70Sxy8GAaE+LmnW35QpfgQg5nIUtHn
 jzbxEhXeMBXn6RA06ru/M1IhdCYhdXUBK72AL4TpIJwcw9g5kAbdCJ3S40PuO+5aN2RM1uWXqJ7
 6HNohS557Ve3cvSyjUr6Tl9IOOO1aw6i/c3O5OEi/CfoTcnDUfz9ckqpNethUrXPNkfqsd1Z8kZ
 w3REgvkef3qrSQg3FBSX5AXJD4N/bz3+f1zDjcJ4p/xoMPwfWHhJSSgBtm4pI4LCnoglqUwhpK1
 s35cAikUdDl1j8fa5Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140045

To align with the newer style of binding, move the phys, PERST# to the
port node.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts  | 10 ++++++++--
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 10 ++++++++--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi      | 14 ++++++--------
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index 5cf07caf4103..dea5ece600d4 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -54,12 +54,18 @@ &blsp1_uart5 {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_qmp0 {
diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
index 34e2f80514a3..f5c125e20ada 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
@@ -40,12 +40,18 @@ &blsp1_uart5 {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_qmp0 {
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 256e12cf6d54..75a5ae30d966 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -841,9 +841,6 @@ pcie1: pcie@10000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			phys = <&pcie_qmp1>;
-			phy-names = "pciephy";
-
 			ranges = <0x81000000 0x0 0x00000000 0x10200000 0x0 0x10000>,   /* I/O */
 				 <0x82000000 0x0 0x10220000 0x10220000 0x0 0xfde0000>; /* MEM */
 
@@ -902,11 +899,13 @@ IRQ_TYPE_LEVEL_HIGH>, /* int_c */
 				      "axi_m_sticky";
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_qmp1>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -929,9 +928,6 @@ pcie0: pcie@20000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			phys = <&pcie_qmp0>;
-			phy-names = "pciephy";
-
 			ranges = <0x81000000 0x0 0x00000000 0x20200000 0x0 0x10000>,   /* I/O */
 				 <0x82000000 0x0 0x20220000 0x20220000 0x0 0xfde0000>; /* MEM */
 
@@ -993,11 +989,13 @@ IRQ_TYPE_LEVEL_HIGH>, /* int_c */
 				      "axi_s_sticky";
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_qmp0>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

