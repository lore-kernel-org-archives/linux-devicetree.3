Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7854E06E8
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646130; cv=none; b=l1XCugnAKDHfFmmLrm3a+nzQYiONYQqTdX8qhz+HRemyAezwrpPYcz/O2rBk+aoNipYRCAiy3X3c55DNIW4BPSQ1eRQ2hxwCknveNZkOTOmHmMAV43jB4a23YpcIGtBnlodI2jdjDdljSXzWqEopqCTZtVFyBU/eq/9oiwzgwTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646130; c=relaxed/simple;
	bh=4hFD46MUKCvZ5rzT8q0pb50At3PVt8H1aRSAB1AJYWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=epJ+G8GjS4spoWHVOuhMVZRfCCIC7mEFR67m4Wkke/0oHGYNvkhynHZWgX7IUjzN+tT5uEHx4M55Jdgd/mnqrrS2+IdvHwkXLCLuoH32VCyq20DINtZ//IfEOCv2gfRHyXlXrxxBQLAj+ayMuHFbKlXGrwWkMujsdjCOPpfmeTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9xnKR+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUdwpABb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9xnKR+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUdwpABb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zj7P1520183
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRz0hSTe+1rxWmrSb7wnLv/nlhvmpU6rdZ6EpPuRIlc=; b=k9xnKR+Dl1i4aK5O
	QXeZUj4+ZLs3C4A3yCgS6AJEWXs+htJsVAolSQ6nBI6LPdNtiNARzreeb/hXLQP+
	2YrOYOgKRy2MRm0myY4TTSXB2CKdUJCZVvG1SuHRcazkGpgdMJRuObM12pnT2Dn/
	y5ZEv6l/Mj22cWaiiQvjG7OlKfUPYS7EW96odbXlEsOvDkEflJT9BNlmMNEklnG/
	QvzmAqAltnUen/T85RhUTNQjirpEEBkL65CozMquTvbfVWOvc8NoPrn3VnFabPzJ
	QuF3HdzVQCR335XJ0DFsjcYUulVTeZ+9nml13ESbNOuyzqibbTbbpf9FQTcIHaon
	2pbQaQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hc3nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso1432788a91.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646112; x=1790250912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRz0hSTe+1rxWmrSb7wnLv/nlhvmpU6rdZ6EpPuRIlc=;
        b=bUdwpABbUJFVdFcGoBIhkMIgWRjY7KpTeFflE7HDVyMJ0KSgHVqq3DIVjcma4p+UPr
         efbAyvSjxRIcWvl4YMSqf91S1i29Otf90p7jRSe26CHKY1mWTpPmPlG/K/GW1nzYKBeQ
         ljz1UCelkxICwPTiOZSvxnx3sfjhHeo8x3UPMHj3+f/GeV1Az1DicNWa0MYZ5SUfcdil
         IVljhNSXGMzPrWXnc6QhRxz1TzvTj8NBN1LSugse7rmA/G+GBJq3Ej7lNQaqzvs0KBC9
         tXqP9RJv2Z4yuMEdKYZ4OLy28qfX5q8JSj6fOk8sI+6dp+UJ6kXW7M//1/jlomkAp2qJ
         rqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646112; x=1790250912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRz0hSTe+1rxWmrSb7wnLv/nlhvmpU6rdZ6EpPuRIlc=;
        b=jqYVhCErAg0ZSZ0n65QL7stX720YWlQb2dZ04oyW8lw+gOVJyNxvdnCHpRsgsE/WbB
         /hPrCsXanu756QXi1e7LD+699+Gg/5Kz0ZWYWfRfQfkwjFHoEUfSv/Ou9hhO0NB2GH1w
         CC4dlhj5paTPCi109+asBU6M8zwRO+dFdOj4yPxCJO2kuFQ0tVpnp9WiW2iP3MwZmJRS
         TQ4NBW6bv7ekFdk/qFvENa3HQasa0EEEcmlOr/VbN0h2Spo2bRbwN+K1D1r95SYd0rJ3
         YTuZXC+GDfoHwktpVndanrozlxhrXBSFLqK3S3LzOPe89uuRzeAg8SjGYGE5hOOMWVcV
         +Gqw==
X-Forwarded-Encrypted: i=1; AKwUvBwCDrLb3dYLaCUhlqsRAhwA40gYNFqPAJga9hgYUDMbvVtPurk3m8xkLKNzEVKyuiES2pO1zdzNzlx0@vger.kernel.org
X-Gm-Message-State: AFuF++lruwNzRCzzujRnqD/Odzd4KnHKlWCHk4Pj+qqbA79sajyv3aSv
	3fgqMDZt3cRI9D0dXTzWFq3Pa9yWBVrU7jZDC8VYtpsvApR771aU/J2IY+Sg6HJG+C8xpYKNQ6J
	eO4veAMrS0XL6Lsj9+MCogSa4WkR58R5/BjWk7AjGSAyuSab1YLv3fGR9/3nrWrZO
X-Gm-Gg: AYBFou356qVgFO9WAqvjsOvtH/Rpse8rstIUydXUM9xbTRpMxwMgEkE42ys6VpDpkTU
	wqn08KrqiGxuRBCAu9osz8k/N3OfxjriEl6ci3s3TTVspZUNAY62ZZ9GXhuEPhOO4QtrxiD35uH
	U6s4lupcRj75UBSIQ7owRUSCk8rcaHejVLvULAcFyAY57SqknZFCNCpL292G98cEh8fAGl5beNS
	TOx+sHtumbgw2YnGop6D8O8WRL9R9tH0s8+4r3xty7Il4V+D7r5OnWbRf030BWV5osx72neI9FU
	mPYe26FwQyNibPRyYujgXVZouwU0XxPm3Tvzb5NUltHEWnto48piYEw/oFKItBkOuDqg+N0p5Ig
	7Rt83lItMtcOt9sGc+MVtt7VoPQVYiM1AvQ==
X-Received: by 2002:a17:90b:390e:b0:39e:8d5:fcee with SMTP id 98e67ed59e1d1-39e1e4d750emr17991962a91.17.1789646112376;
        Thu, 17 Sep 2026 04:55:12 -0700 (PDT)
X-Received: by 2002:a17:90b:390e:b0:39e:8d5:fcee with SMTP id 98e67ed59e1d1-39e1e4d750emr17991889a91.17.1789646111925;
        Thu, 17 Sep 2026 04:55:11 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:17 +0530
Subject: [PATCH v2 09/18] arm64: dts: qcom: sm8550: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-9-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=5324;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=4hFD46MUKCvZ5rzT8q0pb50At3PVt8H1aRSAB1AJYWI=;
 b=03ZNMuhqJASgFtuceKuM+9NkqUJYp4Ux5D8LZzXiqwMWhBHFxfRPMXYq/7yITCN9kvYiJXGwG
 cgAyd5ADj29CmBZrN3vlS0/bc+a/wPYTL8UHyalqEyfJJi6REvYGSXs
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXw9CkGR7apEwD
 xMUN/Rd0LJFsqXgDKt4Q9RwHBh6FU99DY+lDdty/9G4aKYKXQF9jeogKvrjzI/o4d50mK4AkAcw
 voAIRm03y9aVnvR+6kbk0QhBrEMK5SGrqfsRa8t2XWDhdEGY2bN+L5yfdHqgjQVmAjYvv6zx5tx
 l463uZnir0Wni2dz6ObIooMrRTbjjJvjH1G7Wg1Qbk5+0eqzA0HH6UyVc/oyv7I5KCEnTRgwgvT
 l69+zFoc/FFfYfXxb1gNEPi1JKhNoYRFaIQ2AqHoSIWQ9EcPT5lGDiERntN4vPCYTVUSfGMYfKD
 7tzu/ISzFTVQ9yaBO3yMPNR4TR0YLjdR07hugRyuf3Kp4TQC3B6odljdI/juSqXh6bSMS91lMjr
 9oQSNxMEhGDsld9rR2yiTC9FgZDtEzquRScXlSkOcgXB5CGbk1738IVAv1NruDzhiynQVTNRG/a
 GPKFzyZVw2r2gQNogig==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabd521 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hNZP5i6h11z2s_4BSHIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: HIaJnD1x3bu1ETybWZAgnLjLBzcDVsu9
X-Proofpoint-ORIG-GUID: HIaJnD1x3bu1ETybWZAgnLjLBzcDVsu9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX9y9rINFTHImu
 jTwN/tT4SfB7BTY/VAipE7mXaJ4itiWbcRbdLo9C5JIdkkmdqTfIX97jX0xWAfJHSMRhjh7bSOR
 yN04UmySJtOZWQwlUN/p5IXsBVDnn2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

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

