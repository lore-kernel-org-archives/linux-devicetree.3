Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942B285CA2
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004107; cv=none; b=KnFrp74Hx0eK401lp4QnT5SM7GizShGdpDldiXzq7APRvG5+vDFnWTBb9IoI7/ycXtk2HNQ26KbJ3Q/+dK07+7qEVcJals/UuiuWTSW4Tz4opDuWFHuLTPvovYEgl7N9nuuavWx35OffLiXCaKKkp2kB7rVKZO6VPyqlS9G/5mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004107; c=relaxed/simple;
	bh=u2ixWtnDtAr9aUT3qCjGClLhN9bL29u99qfCFsvucWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jOqNUgyciutyaGgOGVuETUME5TUFSaR9g3JrzEzaSnfThR9sAAppYu+8vDELi3sZAWIv7AqzTmo6OJCUOQHr8Eoz2HkiUL7NThUXtY5vFDPVbYgAOp7ZfK+sQ25k9GxJJRycijUW1VfIiFAhy8UlIe0NfoiG2ifrPv26B/Lvw7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXsKtA5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQsue5Ec; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXsKtA5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQsue5Ec"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Ajk3181884
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wIE42hU1PxP/UvzOUf2JEBgCDG4Pw8YiJoQe70x7Odo=; b=OXsKtA5Y0iuf27dN
	jifBfm/7bqRUg66KDQqKnpc3zydv2aDmwQzNtgDK76HmDwCALkIwJecL4395i6K/
	aCsZ7KLLW2L3aCFAf8qGRi+wbMRXjWfqhXihaV7s3ZXvDuNCpnvMIOrzjyrkNCGE
	ej3Zt1icksf7OJu2GzWD1CfozOnm+Zy8mcWq5m7K1pkt1GqyVJDw8CfFqptnbAGW
	imfk5Qov8rOLr9qSqVqHIPdniRGIwn3Aju88sIlYkebpd8YdlBRGVObm86BU4CHy
	AHqfhVcLepnjLB16GaLEFR8YVSn7fo+ga1cnKBLZ6cF9YvZhrUlwhtzjc3kxsZk7
	kgd6WQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4quwfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso8955226a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004104; x=1784608904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wIE42hU1PxP/UvzOUf2JEBgCDG4Pw8YiJoQe70x7Odo=;
        b=iQsue5Ec5t2AJV72/1S2yR6B3bjk7mo8CCmV3P6wLE7Sqs6hgVgG9MXjG2bEFBZgvi
         WjjpiqtENnouxEQVm5wvdGbKkU3cD0C66nKcF5DkuBYmNT4lYcK4osLliruAb+6B63ww
         iwott/BzS/xGj60bsit54ocSYZLN00QosN4T56qowaT++/tgwx5PZzELrOEesATLftGx
         b9Ix40KPybJcP7gV4o8P3AaVd7X1c3GHT7jyZnVDtNtIbxe6K91iu/gaItF4NMfJgcdp
         zpAWQ62opiEy9rOKYc6cXc1jX8MEbiIL/L1J7QXWz1vfKzEI2ktCh0eLjp2k9qreJMEM
         71yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004104; x=1784608904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIE42hU1PxP/UvzOUf2JEBgCDG4Pw8YiJoQe70x7Odo=;
        b=ZfkhN4KIQVRUZn9Hk9Y+CxUdYwOF6n2+u5cNahkquDSNI69RFR7f2hibtvruZcMPSj
         e+QqvmMOwpFL9s7UiR2qzWZZOZbVYs6vaC6xlijgysJCzW8DoOkdKu6oYeeIPzQ9yWyT
         kXuafLzDunIwRjKgFTPfHpSl8GBvBm8Rvqs7jofI+g+a9mhYYEb3Ibdy3pbdAPBr/Cj6
         9F+xD6UmGp4yq+8ew0uLcuQMXkpFxVk1dS/IH0+XLLYl0AyYJTFub7QU2oe1Pe9RAlCB
         ZB+nGom1ZxyC1LKjHAgTjYR9BQauAC1z7qLuFbfunI7RWKx3lReXf3eOtz8jl2fgMD3e
         WEyA==
X-Forwarded-Encrypted: i=1; AHgh+Rqa3RPYoPg96eMjbyEqE+MOsx4CBgUxcGbup0FIBVMgGWDvokZ9gMiJc6hva/XjFT1xynXhW/NhAywn@vger.kernel.org
X-Gm-Message-State: AOJu0YyZC6BsZgBAMqc9E/3IWounA6uvmhZC86/hjxwNgyRXUNl9yOLP
	hS99Vv6ou5s+Ch+W+Qwb2zxn/3tDTxhuR42yGu5Nl0XdMFveS3l/QfiH93iNU2Pc9G0BdTpsqv4
	+SMdhVvQ9mJrDLwd1nzWeJhM9V/eQj6ExZQ3ZrsRCrHaNkugQ6/pXCXSIJUCBUnPlzp6jaZkq
X-Gm-Gg: AfdE7cmni3/+YqVVmOs8enBR0WMuUGb6v/2/sHYdSmHJE1iiqB3ycjYgYGx3OoK3Z/7
	GCs7WKyGImdT9oL2VDDOCfS8DgBZdMsSGImboGbyJguLgHS8nTNu0vRmVxNEhP4CKgX5pJpOmqP
	eDvHmBKK/CJ0hf9Wl5e8BATu5IHkXfYZ2FgDKXqNy2PIWt8qAgTwl7y5/tMzYSk1oxDmIEfNh+i
	B6X4JcCdY4A/dEAV3iNgMRL+2W3keh1ciu8LqFikOAdE8mhhue3MQsnFbFzDgpeuiWs+IrOjk/A
	m6RExgNwDNHivAPk/OA8Q65ZOUPbJU1YmDmqO+EXvSJm8fMxAEDBAZoViq19hA6ewdqzmG8BBxE
	F1fumVKOJVJaYd/EV8loxoFNJDeBQwk+pzyLb5iELFTJeFGMjXo+Wta80/sQCfOvUR106j/NoqO
	GT5bYKlL9gBkd5kaloY8Nfrekj9QIsX2XED+79ONDzJgyO+A==
X-Received: by 2002:a05:6a21:6915:b0:3bf:6c08:4ec1 with SMTP id adf61e73a8af0-3c357232ce1mr971973637.54.1784004104522;
        Mon, 13 Jul 2026 21:41:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:6915:b0:3bf:6c08:4ec1 with SMTP id adf61e73a8af0-3c357232ce1mr971950637.54.1784004104098;
        Mon, 13 Jul 2026 21:41:44 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:43 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:11:22 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: ipq5018: move PCIe phys and PERST#
 to port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-pcie_move_to_new_binding-v1-3-6bb25887a0dc@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX9wsvHE/rY5oi
 b5uYuwfvF35iUiOz/Y9uNlOZQEmyzudK/o1VOUtKpyboG4PwM39J5pRVavedOpzNsXlYaZsLJHS
 y6QwYY6D+j6XOjXZs/gylp7C2aO3HlEwhKb9K3uG1hLhfa+3ZqTuP3f7VNcz15wRxtK1/gyAKZc
 oNLXptzWnRTO/Vydb2cBaIYGANqhIeZqr/jXypSIV8jEPDv/igolkbVOVC9te2VTs7Cnur+9wZk
 CotGFb49QHm+BtQl9sJr9n4sL38xQ/ltiSobvLf297cBtwplFD8fuXXvtIrXm2GJv5vTPYK2djJ
 hp5+ZgIJRUb1Ng9BA0UfhcIFQvPYoCchDzT0BpuivD+25Hw4K2akQ8DP8pnSqriuJFmMEmpZ0sG
 jJwtCnQmbbtOiEXoEyDi1XP+vfmMELi5iIICjLLdLewIY1T1F+OL2sQOqWEOHUKEJCUx9fEqunu
 jmvw+g9OsnYCkk49nwg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a55be09 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Omk4C1WFANfwtcwxkRAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 5qyJPhUkQPiMR9k0v12-pMerEkY0xy3X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX4NO6dAv6lyxp
 u8vTWYLUtu1TpIRh/6At8CqlJ2nNdKXvlozF5V2V1VhL4RzQSosp5B0aQSdGQc5npT/5wfQkreq
 exQkAN9WvYbyisaqLH+0Q4yYi/26v4I=
X-Proofpoint-ORIG-GUID: 5qyJPhUkQPiMR9k0v12-pMerEkY0xy3X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140045

To align with the newer style of binding, move the phys, PERST# to the
port node.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts |  8 +++++---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi          | 12 +++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index df3cbb7c79c4..33eef92b19b1 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -34,9 +34,6 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -44,6 +41,11 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
+};
+
 &sdhc_1 {
 	pinctrl-0 = <&sdc_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index b5bfd5dcabad..4fc627b47fe7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -758,9 +758,6 @@ pcie1: pcie@80000000 {
 			/* The controller supports Gen3, but the connected PHY is Gen2-capable */
 			max-link-speed = <2>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			ranges = <0x01000000 0 0x00000000 0x80200000 0 0x00100000>,
 				 <0x02000000 0 0x80300000 0x80300000 0 0x10000000>;
 
@@ -829,6 +826,8 @@ pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -859,9 +858,6 @@ pcie0: pcie@a0000000 {
 			/* The controller supports Gen3, but the connected PHY is Gen2-capable */
 			max-link-speed = <2>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			ranges = <0x01000000 0 0x00000000 0xa0200000 0 0x00100000>,
 				 <0x02000000 0 0xa0300000 0xa0300000 0 0x10000000>;
 
@@ -925,11 +921,13 @@ pcie0: pcie@a0000000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

