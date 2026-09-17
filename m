Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692E84DAF8B
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646131; cv=none; b=QFmefkkQWbRkCFl2QwYL+a7CMYZiSJrjB8kMc+vajYVc4Th9SUp21LTy2YbOXUCStit9fX7GDrlHKcsmlp9QI26a0MYS1yGrDlOYunwiEw9Z9Uo7o5d+H0YN6mNuouXxqyKvgHEG1w0mcY0uo/QWlxpqvSH53FcP2T8Afo8plAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646131; c=relaxed/simple;
	bh=TvZ3UJw/XqPpqBoCMULDKlU4Aw/aUNZqlZm8Hc+4xlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0jghlZJ7c7JH/q1uhcbDo/QgddUr3LoJ2aESzJcXw5Ky1xcwW7aXZCe22k6Yj8NTxVwSf/EjZZd1Du1gLMRYmBQk8zHg6mZBP5vdU4Fi2b35YRluniCoaUypQ6N+PRnrGWJJ3qyRiB7ZrLk5HQ5iamkFyD/3E28T5phnnW9BdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poIlPd6L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3rmGcMZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="poIlPd6L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3rmGcMZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZlLa613560
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=; b=poIlPd6LB92pTAEn
	eWLBsd+v8ovcyKtAs4Y+t3J8TpGs7Y3p3xWeLpmeLpTcvTkdqgJ4Y1Nzvic4miOQ
	JkfZobOnPZVdGDTLw1/SQBV/3y38XNPNN/216tKwN1XGqYYtGiR0b1yrfMOV0orN
	6wS8Mvd6I4kMd9kR9YArDhaV5Si49yFj8AIQfSBI0Y7Le53gPPQX5NQ38E3Da+Y1
	l9/nZ1inRdPbyCBsAyYeVVMwokecuiOWAVrH3Sw4w+xeS83PVmrttSfTnTAhl1JO
	6G5aI3gmt3zaXs/QEBSdQXHq+hzdwSju2P04uk7xPeLll3ky5tP5/XP49ISyRSYf
	4WT0kQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0rxhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1594457a91.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646117; x=1790250917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=;
        b=N3rmGcMZebQ6kmtbaqKfXoLlOSNhbzGvO1H5hnsaJmmEniU5FQn4A70cdlr9Fkt82H
         qVimtihbgbw7O5duHSnAfwPwTvUC0DnDzhIolWyUPd0ojkDh6czNECm65NINyctM/Uw5
         SpkoPxb5qxfXm0TTX8v7nLDx3W+gazKc1ZDGKWvKyVQksVKVgZblxuyCjXTE22awRyWs
         Ynn2uMToYps1IWC43vW2KDVOqdvz5PMdhmkGhp/UjN4+nEQQy1d92d2K5TBeZVN1o2AS
         +bKOi8uhb3rrqmfp2QYHWE3+tCzsb3Sp84BSTWNXslfGob2ICcDYrt8AyuanvEWHcBBq
         VdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646117; x=1790250917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7evclX5UWEZnODhkzybq2sou9ss0Uk3K+XjUMQlwErc=;
        b=ln6XbyDZmr/qD/wJ2DINE5MFIItC+q0IDEz6/9oU5XBNPEf5v4XlQHxceW2xGn+xjF
         y9LzMfedhHJxoYbim5NL9hKHhosFGdiGbULw467jf0Sg/onT2SVveM192Hq/K6BObGOM
         f5YFrG+sGbtmfPyrRm2oYCyGh+9fYV0hNJhidBs894tVnea/KN5PZLDEnbX2qrTjYD1C
         Yl6tnOSYBp7vt2595QE9m6ICPYHYUs/mqXxllsrWz07HFpQBbQaWSjgIE0d021D2UHeG
         qT9qcWUI7WHyWHIj0A08SulvQ/MZmwsbJ1U4yUlY1oZlXYPEGRlGfu0dCUTVCN/uklKB
         zIyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOY/UcZC3XESWT4LwK452Eve7sLljxBOtxdPjUfxkjDRbbdlpM6iQo5Zxb+ozQp/pAW9h3jKTaVia5@vger.kernel.org
X-Gm-Message-State: AFuF++lbGx+D4e4YzDhcJG8NWrxd1CiiDZmc3NL+MIoyeTEub0sfPZ7V
	G+Ntt9ElCJ4k8IJanivwuxrnwjLA3HIQVq5pmp6M6nUNi9NHQZs5rbtlqiKaK+bmJSSHJBkAyvk
	Nk14d5oaeCVI7pHtaUn0Pzn8Vo0pEfY7dDcnNuigLKcMr5oRv7XfD0H1sT1T6MMzm
X-Gm-Gg: AYBFou09+0ncfQlLP7aIDI3kuELJpGn+NlhwYrepwqKO0cdcPpngelrwUiUplwcBNmi
	/orCvy7pM+uPfrmMoI80zTCJOgGK5iVA4KSrEcQGlNyld2i84dSgLzmkmnGkWd6t0j4smxmL8/2
	py7vVy00NHrnnjMWthTc7+lg3W+TRrVXF44pesCsNhg5UDjT0FRgK7e7i9ueWIsNcDPbVuMc+Ng
	XML+CmcE/WOrHFVbprjxM+OH6jrPWU1m/RWSxxAV38jfomOiTMkEu2NeuFtMlzSUyyw4yvLxZai
	5li7tGFhsab82RtTGEQWgLvx7k2JbmAxkp8LQDdz2DbtkiOex41qCd7n+wBR3pJ6NJD3AeAkRW9
	vCqjQ4nEfoYnZGIguSSns+ODE6D8FYI2lhA==
X-Received: by 2002:a17:90b:3c91:b0:39b:370e:c807 with SMTP id 98e67ed59e1d1-39e1e4c5116mr15236818a91.17.1789646116374;
        Thu, 17 Sep 2026 04:55:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3c91:b0:39b:370e:c807 with SMTP id 98e67ed59e1d1-39e1e4c5116mr15236743a91.17.1789646115864;
        Thu, 17 Sep 2026 04:55:15 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:15 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:18 +0530
Subject: [PATCH v2 10/18] arm64: dts: qcom: sm8650: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-10-0d627d0856d5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=3279;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=TvZ3UJw/XqPpqBoCMULDKlU4Aw/aUNZqlZm8Hc+4xlE=;
 b=y1t/u2vej7pWpWwen8wxtSTOoTLBAd6lWC7qWUimUi06faYsiMLPAzHl7g6O7FU/wbm1rl8TV
 LgG/HYhz5P+BNeGLTTownas7p5emNpwiM2QiUZ7ECbvojf9HWQUN1oi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 24eB-qyQ2pPrvn7xdEZ_bMJC54tLI6Hs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX/EcUqwOr1vTb
 rBstaCXjoNplWSW8u7vOvfQEFw1x16+Z7yeiTttbAgYNELuhRApWdcaIyl39FxJ9Kk6QsJWbqgL
 xiDsJ8hhpew5V+09QcNpaMicd7wIZO0=
X-Proofpoint-GUID: 24eB-qyQ2pPrvn7xdEZ_bMJC54tLI6Hs
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabd526 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX6aC7accZHPIY
 WgxAwenAWwzP2Pofjpc116FBCrxEkIOu+z/E2CyA7rmUBwchNPbKCNL5bv5VEy+u88v7qkJo50T
 KGg2Nx82MS11XGhSsX/TQSfP5AVtmRnp+zNF2mnSleXTtiWyD8Q04rTZGMJAB1ByLI1+q91GUpo
 MZLkdZhfIUpwX2IYB0mXHpRz3XW9D8wbyM6dl3SddSp6tSbdxg9oLyLmi53m6UWn5umcJ4W21BP
 EL3rrJEZ6bV9lT/a5IrFRN/bUapzPR0dbTKucuB3sFhNXfNgbZrgK7jK+VFxUgiRle/IpWpZtFZ
 JcabzissLNpUuym5KvalL3DH4Mnlg5jNaN7UtK87HNPAFPPhRGE3RFLQJ5oYk4ZPrrhJnTpYTYD
 VRO0aHfFiTWv+bJsDuEJdp1AHJgDTZ9Q4mtI/8yeKgMobjTfS3hYm11orhJXLs/eUPlZESIKsMZ
 v6T/N3HzfLiYSPtDWMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 6ddf30ecabfe..668c183bc177 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,7 +1074,7 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1108,7 +1108,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 41d0c7edc433..b73ad7861eb4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1027,7 +1027,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1061,7 +1061,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 26045430d34a..1332c864801f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,7 +642,7 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -659,7 +659,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 1fb78588a504..2e874f046a0e 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1021,7 +1021,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

