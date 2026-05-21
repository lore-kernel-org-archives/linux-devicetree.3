Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81893E2AAD
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368892; cv=none; b=Xq68U+L4AEGnx5C+uxNad/DsbVigITgJrApHS9GomLsjspIglZnHVknI03fmjgp1MOvOPNxNtpQqkw0pUGvzailOUXBkAuzEyP5FLPiU3dbDIKgfzi42aGSTeVF4w0NNNrniq3KMPdDHQVWYV0EsIpFSe9maZhpC+GluR2z3nGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368892; c=relaxed/simple;
	bh=PxFeE4iE8H+mop4PjNTz4rASGopPuOb04tpGCfdaBGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEubehv4uBO92rodXtrCovqdQ3RBwbtRlwf+U6qhuw2zSXfXmoSd+4DgyxHHHdJry+YRtxDgjYNGHnrZI3f9V2t8jY+f5FfH+d5uyl/pXJzBR7LrGI+1kZUzT9Eus+ZpG1uAZydw+IFRgvNu+pD0VOfqfK1L6hnc+QfopjLI5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6MoWRiE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQj+0fZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6MoWRiE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQj+0fZA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nLQ3009516
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=; b=S6MoWRiEfJiaNvG0
	E8FOEtK5JKyFzHHsrwXQxX6l+IBVJgUyYLGFoqyvYyNHqGxzdnfRuI7xmyf1Lbka
	+2FheOJhwbIdJso+yBhscC3ohxlrW9ejf90ZHZEqAgzjCCbumE3Zu76+mq52Ktjw
	Y3TduMYTBJWtPmy+gu6WJGoTS5pPzvslV2u7BwsUXkRzzOJNiKm6+osgQX2dndMv
	xosCmmOUuLe2muTtdIwHX4fguPTzKwSrYFHcd6BVdHjs4YWnu9qFEpNHWlQ61LuR
	6GLxcNpwyR0IFXjWoP3ULS7eR+BKxMjqeiSwhXxPI+g7kEyepOLlaGRPMfO46e6r
	cTBwfA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr329vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:08:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c829586e894so3179146a12.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368889; x=1779973689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=;
        b=JQj+0fZAWi428ZLL6xgWskayeRUB1ja3D39ZGvkqJ/L2SvoWCuX8nSncLbFnuepXXU
         k6wQpWumf2eKtPCx/c8aSHKe63qCSMPaC5Qs6BvFQIRDaML5AdM4yTbQx+DYjOO4ST3u
         1UDXgw/UmwlF8h8etOQIs0vrtF9BrvX2I00Jh1p+BERZ5YhnEpv/YcgB4oUGdXZiITOK
         bveOXvbPwlE+/QAuT+cG4uiQKirQIjJfIP8tW8zYi1IZdffLYgitfY4it1qWe6wnPalb
         NgE48PPPTEs5hFw5EN1pFe01vg33fZDmYmJcesAxS4DjZ5frjBov3DPDtFfFuom3ZdPy
         LEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368889; x=1779973689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=;
        b=HU7xDHd4zZN2s4oNWW28MqjQCdXKkATxRrypwe5DZIWPeeuvl8TXNI/cJUhFk1FgXF
         WnI6a++y4iGXRsMYJjN6NESLQZExzDhciB/hkCgcGXtew5tJVFblmCD4Y8Faydj3GhG8
         z8mDTsCTbo5sFl3mDPSpy5IAGxw7X7XGfh1QPWa+up6O6DgfSPwHG58CHEz2na3leQtF
         Xv2h7bF1qbCY6tOKF7X/ESwSD4t7joT9pK0MVjizGLgDEdB5GHLWWpCahaFDxXmjfXwt
         4UZMzEhTMhh4OPhiZdU+XLtcgeUZOV00RqsTw/HS3cmK5owtILLdFUDNaBrbeoZjaM2l
         mYPA==
X-Forwarded-Encrypted: i=1; AFNElJ8lb7AQUg1DTett6fenrpIqSVQ6aBJ47MfFmQoYxiqyVG9GgUGv/m/WOmjRipuvNi7e7lnYWsa62xyX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yq/82zm5M/6EMNDlf2JRcrvPwZbXw6PQyFfQPkkdkBbaa1U0
	0/ztBUsTDNikhrr6X4VMHfICtX31levALzLpVF7o4/slev68GZQ5JjlSETfCYT6rLRo5iuuS8p3
	LrF4e7rPM22fZVD/Emb4fRLe13i0z9Sdjcknx6/fx2jLIZXK4eOFbMLu0bkx7VpLG
X-Gm-Gg: Acq92OGIH5mu0r8ZOycpLZZuLUdl8sGhER5atkdMu7MSBYYdQ4n/Z6qyHRzCm3DV9Ci
	qUjBZzrL6A74iITbyOrZPC9/otJR2FS7LGdf5303JcKMSel4OT3dirB1RgJZuwVvUWu2ONgFl4J
	QR1KQdTHxqM14TXwwe7v5FVngDV2rVe6WILPT+h1h8PTOxNKaHeblcLQeKGbjRe/NsSnV0i1dsR
	YqTbXm/fEWSH34BqQcEX7iuZrgA9tqYUPc2okpm4NPoLrr6/DiIA4QAzVZiIeClOC1arHy9Zrqt
	yubqrywGO2eQwM3bSM3HYO1EJ4Wb14m9PyneGLvKXeZMLsdqej9wZ5BdHU3SASrHX3QuvZ/LTFj
	8D/yhyGvxb0yC1kZiQ3AT5wBbhxwH0K2knmRMYFZm9DYWXgGY0hxhPTOg
X-Received: by 2002:a05:6a21:6d88:b0:39f:acae:f12e with SMTP id adf61e73a8af0-3b3085dcfeamr3604300637.22.1779368888886;
        Thu, 21 May 2026 06:08:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d88:b0:39f:acae:f12e with SMTP id adf61e73a8af0-3b3085dcfeamr3604259637.22.1779368888402;
        Thu, 21 May 2026 06:08:08 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:08:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:51 +0530
Subject: [PATCH 18/18] arm64: dts: qcom: talos: Fix PCIe wake GPIO polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-18-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1536;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PxFeE4iE8H+mop4PjNTz4rASGopPuOb04tpGCfdaBGo=;
 b=6TCGJrr+ZfZzhC2d+ja/wZwsj3bPsczKKCSr13V8+Q0j1FCmaPMhWkSIzOe2FKGTwJoKCzye3
 h18aPT8VtAJDgnijkDKrmz1S9guP7uAI2sJXQYNI9WjFqPHCtpCuTuA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: rG5WXkHNMQqk4-tS3Y1Ilarn_tZsb_58
X-Proofpoint-ORIG-GUID: rG5WXkHNMQqk4-tS3Y1Ilarn_tZsb_58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX5P+1F2huJGRB
 j/F5ocX04loCj7ALmOTEKibG6n10dZLUtvQY93UOLJyYID4L0LFbezxfXgYG1wEZE26Yv2iQwFX
 L778SBvK+j1SHpJs2jnq3VI8WFdvJ34zGP9vbQkEn6m4xW1Z2mds+pT1lVKBiLsp4lqaMVjy47d
 SaUOBsVMpv8GUWGedWtePZOrH0DOb2XWQ2AiifOXs3tQRmgXa7jYG61fngqEXhKm0B2TolwDuU8
 JbcC4hM2iCuawI5SOQCGdCeAFH4FZ8wBYzXMzEHVGezu54tXtC4vF0TWucSCPcD8Np/SfGwfDkd
 FS3POjorCtaaRcpxcQSul5mr9A/mt6luksgTHMz3DcJKW7nhhVdjPwR+CzJDLuI0UAFYCSHfMxL
 y95S4zSMjARbfuYDL6oA18cYuudXVp+2cek3AgWEeVK5L77hZZNwZYIxb8S2BDXkR6EGF4Z2Tku
 I5LBWRTngYDmHE1X7Gg==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f03b9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 7e05f873194a..d89548a2a3f1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -445,7 +445,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..6eca3791e2b9 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -359,7 +359,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

