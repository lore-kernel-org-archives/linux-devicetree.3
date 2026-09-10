Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712F495501
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046993; cv=none; b=AbGgas8FZNWMEtRHAaG6wIR05ddow3jiYI3nc6vo74OcrAI2ZL1SBaL0hnO7EwLJsEKKUoMQpNCSpG9Oev1vpFTZseP8AtAPxakoTsQDMvxJhPPGiykB2UdQ0C//AvlvTRJP7xkfEHITKto5NaUDdM5ifuasFuaxejkYWufhYlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046993; c=relaxed/simple;
	bh=4hFD46MUKCvZ5rzT8q0pb50At3PVt8H1aRSAB1AJYWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AI9SiOdrICMhpcHLyBYAUMtmRwqd3/hTiMSMdA4NHqp5AHzeBsNerHFHtUKAsqF0NcbNmFoEXfSZ+noQWTzeKVOdJ7p5LlSiOrVP9833NgTHGMqlIYc2c45OMDXm+bHESRN7S7yHAcnTwaweSn6r60wgGsWgHe6DEvGXtIF9oDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X54AQ7An; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGwFFMk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X54AQ7An";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGwFFMk0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7emq1440462
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRz0hSTe+1rxWmrSb7wnLv/nlhvmpU6rdZ6EpPuRIlc=; b=X54AQ7AnEHGblxxP
	UpWium62T8HOjn4pDQ0Z481iy7/gtAZlPltN97EZkKjyQwr/HWS/MONnqfuCAdv4
	H3ljMrGOGWmZOBxJ7a0BX2OT3to99LsT0tqGe9G3LwNfruCTIvmBr0O/6e9ZjitB
	ApMCYm1x2zFBa7eeaershtP89jKacJwnavb4tJic7nnLD0EKLb4ftdaoBInwrEAO
	bM3Jm36+VgAtaeLJth7U/o5wU4N/Aa+UBNUcbQzrU5lrepngq+eFVUs3Nyw3DpiG
	dseNxfqgO0FdqncZa1FC4a6SIEnODXpS8biDGql4PScTPE/NXxyemxGM7a+vmRFd
	6YH6YA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvsf1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso7628576a12.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046988; x=1789651788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRz0hSTe+1rxWmrSb7wnLv/nlhvmpU6rdZ6EpPuRIlc=;
        b=XGwFFMk0QexxCa0pMKyGDObkV5Mw4W7gHcGnnNPfFp0IgDjlTsZ0tMhBPCayAAKtgY
         xVKGejguCrVdp7jia5xXHf2NjnFtUeYoJwzUR8Q6QHfVrFqtm8z8GJ25aYJWu2ecirbQ
         zQdghOg+IX/LTKVKtpXeKGYaTqN1kLgNYD7MSyUr+A1k4IxAlUQE0VvNY8Dai77630wZ
         OEGLxi77FrVrcyah6kvE/22KyfCHdOBT1oN7H5vD1QVvmBxyjKE0j5rxCLc8baDLEWpD
         0s4SysAaldxxRVl/VbCfZg51cyYGj9Zr7gjrBHt0TL+Ub0M2UyBJa6f9HQBQWWuqTgdy
         96zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046988; x=1789651788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRz0hSTe+1rxWmrSb7wnLv/nlhvmpU6rdZ6EpPuRIlc=;
        b=tTS9SnADSmSY4i8ELlaXgN1ZB3aZsvfTBtbDJlCL12ZlxuspV/LcBCw3LxJlfI7C4c
         NijyNPZSBgAs8z/6SgxjajdlYBiRO4y3bx61KuSSZHP6CyXWxMXcv4GFd+Xfl47YPVXJ
         r5IrbX6avCgnGm7lLxPawZcSGq95UfBOr8C3YdxnDK4okhjChMtdtWB19xj/LhWpN+wd
         bMvvryhG2SGNofWTc171+N8gBh9+RCYgSaUKvqDZ+AsEmElyonPMigIX5AQBFQM6KWQ0
         sB+4wPnUviCFHftoFAle1yIsOdujyEiTAybwlYLO1SU1nrImoQgZ6UWrb1XEEptTeVDe
         8RbA==
X-Forwarded-Encrypted: i=1; AKwUvBzg9+RXaQ24DBoO8utypyPCIhFxELcw/iWWaq4anVbxo8aeCKm9zGiJyoJc5LnzX47XBU04VJ+CsPPZ@vger.kernel.org
X-Gm-Message-State: AFuF++lnSvmRprZP0G9ln4xmii8CWAHhJb6LLUk1KBFY7DtbbPugtJKj
	etsuyf7JDq90dk0YWMo5SlCRHcThwKPzzoXmw4vHXUYz5V/adwIKAaTmR7wmHxKjJA2+W35FUO2
	mxygS4Dw7IVJHTVq5Pl8OM4qGFjMsJSON5ySfdfrIIs1IUG/j+jEbm20YTYWWIHqe
X-Gm-Gg: AYBFou3ZMa4jQ36PLN7Xf96tYDk0GgcioGkT8lq+AQOMN8Y8oOs76zTiMQo2G3Td21d
	UM2ocFj1GV7HE1wbzD13nIGOwjpbNjn/JmBIzWya5q0ktWUC/FqMrc8dGVD858oIEc4UwNpxa0p
	0PD3HkEduWMJqs2AEGkegwB55eUVDxkP/drdGPr/bkkXFXzhTLNxnQCWV/bezwvlajJkzKS774G
	eY87ZJUvzSQXnSHo1FTRmdhc5GK3+VHR7Aq82LmrlQa/CQvuINwblwL1Yj51OQ+F1XRI0vdeYnu
	9KW7Yt+B3iYBFu0XDQP/a1d343w9tefyOO34iH67UM3iXhRurtUO2VKs83Fj0YdpHMEue4uxIfr
	1UVNZbj/WqXk5uZ61MvE6i7zIEj/v7r+PXds=
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr57135836a91.11.1789046987765;
        Thu, 10 Sep 2026 06:29:47 -0700 (PDT)
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr57135750a91.11.1789046987156;
        Thu, 10 Sep 2026 06:29:47 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:58 +0530
Subject: [PATCH 09/34] arm64: dts: qcom: sm8550: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-9-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=5324;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=4hFD46MUKCvZ5rzT8q0pb50At3PVt8H1aRSAB1AJYWI=;
 b=FyP/6M9CPq3JW1KzM4sdsO1EH4+crl0H1ZhasJJRkTDv6jNUHfCnqkaHwT3jt1VU71WoKYjhs
 GZWJEBuzIohC1uLQBeGh0OoH3i+SRN2zdyNyDShcJO4X1IcMjIcZL5R
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2b0cc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hNZP5i6h11z2s_4BSHIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXw5oJDekbhC7z
 JhHcSidIXUZIj0yExb+to7SEtjTf9oa2gYYI2w9I8Wgw2+iqLI/Bs0fz+tTDanrMq1IUGgDcPbA
 h2lOUb0x+m7YpIfnzEMA+S+zrOULZ2GbKlf+X6gwdqRpkiHyJCDr6np7444FI+7YfVwda0NtoGK
 z2515XJJ6H6LlFNtDlW49+uFgrhtSHoFYWU5bjpGZNKIHhMxMJOa6DxGFocbgsKzESiE9Qzs0ey
 IFRVWUdy6h3hkfpBaFEhOlfXPHbAw+YA/Hu+KREoamhXlTlku/rkfbK9dde1jRuW4nnKLRTff0+
 8qgc0xcn3ZQIFIRvexfeRYRVssb8HQUNWF+yMpMOqJDRRx6mkmKAdH8fVVtUfnoLch3PtG+H5ay
 dkyHtu1ay9DGhBABtpSl7DzM32n58GCFXmdPwlpBOAWx1gLxs0QemYQgBc8FVI+JqVGpdOcEHhj
 4lz03Oc8I+1HAtaHz/w==
X-Proofpoint-ORIG-GUID: _bWl6vNy_IQ4htaj8ERkWKT6LdGLCkHJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXzeAK0Vnx9Jz6
 KRe6lq65375zNBYhXBNn8FWSjuLsjFQK73O3V1Jd5S8gbMUSqBHTRSADOvTOB3aViGJBgiRUS0u
 KYZ3ErZnknXB3p39Lt9EBbocZGek7NA=
X-Proofpoint-GUID: _bWl6vNy_IQ4htaj8ERkWKT6LdGLCkHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts                | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts             | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index ae301d78e071..aaf5eb57ce23 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -336,7 +336,7 @@ &mdss_dsi0_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -349,7 +349,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
index 9df8dcd6c62b..41b09ab43d0c 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
@@ -1045,7 +1045,7 @@ &mdss_dp0 {
 &pcie0 {
 	vddpe-3v3-supply = <&pcie_upd_3p3>;
 
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1146,7 +1146,7 @@ pci@0,1 {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 82fb10ed6b6b..4777c908c4d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1087,7 +1087,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1121,7 +1121,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 7c634572c6b7..eb1de33e5ba5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -739,7 +739,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
@@ -756,7 +756,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 473ec4e27daf..13cdb5b0ce40 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -987,7 +987,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 81c02ee27fe9..cf4e4e9d9e26 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -510,7 +510,7 @@ &i2c_master_hub_0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index 367f6eae5e65..9f347bea6c74 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -584,7 +584,7 @@ cirrus,gpio-ctrl2 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

