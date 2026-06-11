Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9656369D56
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153984; cv=none; b=utBuu4TPPQ/GXdpiqtb6LFn9mK/gj83pnZ5RUrNNTcyGe9rOjEOTSLcmxAB4gHVZK2a3cXOUvffiEuAQj2LMimdu/rE5IiG4Z0eB05GH/HdWEbQpQN1TbU6gBH6A2SPcLrm2fJlYCoi6tbWjDSjulJr8KZFF/GTCs/b9IBWd/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153984; c=relaxed/simple;
	bh=kHfEKHzK5YZNeEUlQiJCSZQWWRkBf85mjselEiAzb4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bVJrXVO0EaeNAJzWV7sRIFoZzyIV72QVfeW+pmTmZ4WFMMEJcNO/x935Sz1YRsTJomwB7NUzjBoVx+lxExzLnA5Duc2hJvXfBM2F8BmSCyhhhW52clLpRBKzxr5TFquwvbwqbepO/4ZP8eY1LHbt53dWjbtjpCvVdXvZocnRnR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7zJhaOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xslk6t80; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7zJhaOv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xslk6t80"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NmOW3082981
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=; b=e7zJhaOvalx32FaR
	5trEjje1WWYDund1D/VjrRUuQcLiPQsh0zSrapXww2+/BSYkXintuxtOS8uZI+Yn
	f+o4y1dPqfv7ptBDh0/zG2q2ASVuX/HEgRP+NhkiGoZuCsjbXR/0ULrcS76TFAga
	UVIURX0AIHf3V3/tB0tDtVT04qwUEDBJhLule4Jb74HqLnwasNJefcetVkw3aLa+
	gtreAZnFWwmiYNbI1XI28RgfJoxtrmOrd15BLhHSjtrae6bz6APOx4M3SQNeUckT
	fonw0U+e8i52KTMcl+X10dg77oKvAQIm2O+K9OfoZWBYLHch3xY0dbRruqBDZ5DT
	3P/XdA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9nm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso129946695ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153970; x=1781758770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=;
        b=Xslk6t80qERY595Lnkk6LKGu7q0q925Tg+kg/mf2//n798oj8xFco9ygm4se1BmTcm
         5H95Os/ndm24/0xivqyIZTshNrSum5No+tdKps1rHuqNRIzObFsjyoWlf0SkNQFHEFf4
         8Gd/WqlrqL7Wx82gYwWptLhwQzMiMZFumZKnoGQVTHmVsBtoxP79sA2yRoQJBoq+AMNj
         vai9K4YDMrA8WJrii40wFrUJuQKe9G3Ep+cdVZG6enlXAgBlp9M+GqoBcSEiP79X6MKL
         ObN7kPSwcTSRWqv/5SZB1J0piS6X8BIotkgL7v2HH4ZUW1/NgdAeTckJQVoJzl4wtK/H
         kwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153970; x=1781758770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=;
        b=MAe36ME6OHwg13rRy1SHwPgQJmHj2z2hm9eaNjPBG4+k8ottnmnvh+v092C1oQS+Gd
         DG8tjXMvsQQOAQYyih1CelA6OwXwtwq/ajh5yyjca/aBE3iZPfIy1dRhBfpC5WlD8SX9
         44kYvMtTu/YRVqlQO2GciLd2KfTOAolVQ+NaB0RXu+jp+dOiuqose5y1XYOxaVdQvT99
         pk1UdmidJQMd1h6vSea7YlsjWd4G0elvwKpbozIYP0BbpgvFCar8fJvSzbfWveSRY9WQ
         1oAEDu80fgLUrCp52xD1pEzBfiy8z2p7t2kWAj49cCeBpSKjNivx0tvbDQlhQhf0zbwW
         zHHA==
X-Forwarded-Encrypted: i=1; AFNElJ/o6BK4bvDND9pe5cIT2zT0eYZ08QCuRRK9D6+nWX5hpwiy9mNWRknxz+6S4yIyFUzqlDT+GupcwrhI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw499pCBOqG9TY9fjwdIIxQtwwIcFM0+kjrWHi1/JCYK7MNha6k
	/y+X0rujBtXi3NctNyson8jqTf09uAf6kh2l6CkuNydmcZoWIthTvweKvU6WPxJ5oOF8fyIO6fH
	1boOsIuWCnev886rMjKKE+66eI3PozkNR1eyXRHZ4eTBJH8ZwcQc7I1DVjMf9pgT5
X-Gm-Gg: Acq92OFfZwG6epqEE1t2t86GhnJd5ojqwRNzKgzSFgTyVu+NV6/Itc/CwuSmi3Dou2z
	Dyuq0d2beUqzzCBLh/fSuQ2VSmjgsEgM4X18/cWEhaV5tslMMWjMWfmcMrQHN7jfcRoGW/GHDmg
	pxyMyUVgNJuJU1c7i0lAbP3lPmxFb7SI0xqt44kqDc+Slhx65OlXsYarxxqr7RfLklMQhs7coFY
	eMIM24YmK0CwZGLBF2UI5tEaW8FFUo0OEu93T6916xi7mZmfjYtz0H0FJuTwUZybpXpNbuycoHn
	LdSFGnFV15d2Hjv7VIsQoR6d6FFu8hy3MSS9ZCcwbw+7eadSI7EvZNBhTmq2w2fjF75axF0Sz/A
	XVKUp9QSM6BsSDSaVRdc6d8Gp8CZqkmfU/5exAWWMI38aDEy7zkWjZ2AkmlIrqxUG5sk=
X-Received: by 2002:a17:903:247:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c2f09323a8mr13063255ad.15.1781153970224;
        Wed, 10 Jun 2026 21:59:30 -0700 (PDT)
X-Received: by 2002:a17:903:247:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c2f09323a8mr13063045ad.15.1781153969810;
        Wed, 10 Jun 2026 21:59:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:45 +0530
Subject: [PATCH v2 09/37] arm64: dts: qcom: sm8550: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-9-2744251b1181@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=4508;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kHfEKHzK5YZNeEUlQiJCSZQWWRkBf85mjselEiAzb4Q=;
 b=3GD5k+588Uv+wL91q08mxwgXUGuPN9Qo9AC4/idKOPkk+CW8nkhucZ1KmRfJag0iLXFb6tp1B
 WipfYPoXUoCAlV6NA0WqbmEh5xmKI4VAvZj63YWp/XRWD1NPyQ0HGCE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX34t8aQJJNE8D
 +Y2GuuXYvuBylWZJp0yoEptsinMGBI6KdaLBFlHDh45KUZ26l+WmhJrmQ3RAOyJSQ/sOmE1k9dm
 HeJqaGolaiN9NjQD3UupBxsN8UuFrDM=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a40b3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=A_fZCR7qwrwYhkduS1cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX4hyKt4PfbdiC
 pGMWEYwUyctv3Eg2dLtaizCcIroi2xjzYholZ7dIVJjWehLYlI9JzJDY40uSkn7vDc470TSqjqV
 qkTsjMv4bb3b1GbrNUMJ7NJ5ahk+rMIwFRmjI+MnrW58nT1+YIgQZuHt/1QHRuyCG90MR8aJvM/
 WgIeXgP8KO5bx7Jsy7ECHKtpjBH6eE6U+XbKT4TYwzS5JKfWOrgUMZ1hbm1fU+2nN7M98PTGPXZ
 HX7pJRSK0PdysakrkQ96XavTu+FeysNGECDhjd375npyDCvDUlOCZfHloEl3QV1JvPVFh9WKWup
 2fk6lziSrhvWKdwS5w2lN6X/trG4cLmGjneCJCEvz9SbY1aznUGc0bOH7JiFiSU9wicRSpH0uHT
 FQfovALzhCWpe2zV030rxfitjUn/2igZMiQmKjJKj+kxuRy/PghPHSA1OZBdEtZcKqQW8rUlSxl
 vzvTIKTtJMWmx7P4Dww==
X-Proofpoint-GUID: zMHIckADQ7bT62EJTd0s1YzBdyqW7aQ_
X-Proofpoint-ORIG-GUID: zMHIckADQ7bT62EJTd0s1YzBdyqW7aQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts             | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index e6ebb643203b..5eb4626c6129 100644
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
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..4709eb34521d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1003,7 +1003,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1037,7 +1037,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5769be83cfbd..7703ebfc1b67 100644
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
index 2fb2e0be5e4c..5ce81ac3ab4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -903,7 +903,7 @@ &mdss_dp0 {
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
index 0e6ed6fce614..d23fe714bd27 100644
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

