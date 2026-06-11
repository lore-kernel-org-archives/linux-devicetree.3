Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C13451D6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154061; cv=none; b=sTSVRg2QsZYumpJ41IeGw7rkQ177pgSM4SC0TQm6HVu4fFgJqUMW4dCMAiY5+JhJmokVwFFx63BgShERmKU3aCFDjSc/D7lDf0XSfSt2rSFbdRpJufKWdkz09eG12rv0VYessIeuzIPSVCWDzPU16xSHyLp6+2QsYAXzOz+St/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154061; c=relaxed/simple;
	bh=L80h2On4bfqSssntkfNzGZ0RvyjR3lO+HJKD+5e5HFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8EbITTFpbt4U6wnZ7/UAVDqaHF0uCH2CIijx91S1wHlCE8tz9I5Gg27MW0w+GeHqFRaSXl/oy90zg2Wa6IzJflwxl/B5e4rkOfEIADLsN6GaXqOwdBf7fC93YNH1CeNklCxk0XwLXw8FRQeKR+GaxIBWKcwlwYjn+CXXXy2bUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaRqZXd5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHsJJrFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaRqZXd5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHsJJrFP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NcKl3082800
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnEzl92G1eF7x+XcmO9TZ/YqDsaNnSCiMQYI09qQBs8=; b=oaRqZXd53DrhaIjO
	owQftyRzR329Vuxp5jSIcU3c8/3nesEzkxuJ4E2OOHjm6c0PU+iSzAGApxleinIY
	T5LFQgcOE/sEuOhhKlO72PTnuku6qNRLqJ5kEe/ti3xUbTutqAoRFwvD9dRagntv
	xLldp3y16pUT2lWd5qWReVH2WdBUrs7oYhptSnGApB9HRCCCFby8lolGLbhgSWJn
	0b6A4fxv4+J/nePpwowM32SuSwbDJhV1D6pMftYR3ceI0Dzb01HMpbyL56zzSZkK
	PsyHRsV6zQQ72nyNCNg6eL8TljB2CHmLKDRgqaHpqE6soykxRJYdEmIf7KTvs6qO
	xxyotw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9nrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf160f7191so45032725ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154046; x=1781758846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnEzl92G1eF7x+XcmO9TZ/YqDsaNnSCiMQYI09qQBs8=;
        b=YHsJJrFPxR0ztBrGH1vz77qN7mtE9jhY61F+smjzWyqb0rKTS71Mo8O0W827NE+8Nu
         kkSyfE+7BKl0tUK1SKJkHq3prgfB6Zodhzra8qtQkpRH8iKP6wInLlbcucNAXGCZTnaR
         ClpSKSICeQscyhyv1xPRXZtloWVyMOUGsJE8u4vK+kQzRM7IYQtPmcdAgrZh6yFYVoXw
         dyCVOW6WaS6dFM3W76MZiyRTra/UvhBNFOIjT/yk61n5jaNH8IB+TdJ/wd1pEddVDmh3
         U/3YpmZ/r7hT42qb6+zitJAaSf8IW490RvMx3EU1GiGrOvTRYRo2VWll6mWhpRTE9LNg
         l3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154046; x=1781758846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mnEzl92G1eF7x+XcmO9TZ/YqDsaNnSCiMQYI09qQBs8=;
        b=O07IY+cxxI6sTNv1ic7p17nXZqltnnHYeICSioADggOcITn1a1gnu8Cn/UZYubE5Eb
         SsSf5gw1zIsONid6pn0Dm96nY1Y9hU87MhLGAaBL8sKg6P8MCVO1ZZ6exSz9TCK9Gyp3
         WESGMi8E78q8DYnO59I06qiujZD5FOHpDNeH5qVhYYZ9MrAS2hI9aYhjMqE0V7fOLLIs
         UIE63HcVpu8Pv/VGv+Z3dGM2et5Rj0YEmOuTBaUKSu33ri5eGtIHflDMREb+1PQK32/F
         PBebCOHgajDwG5C5BH1PzpIiglIhWmEWDuE3dyrU7yMxuCK/X8SY6LehPT9fCsOejuJE
         gwbA==
X-Forwarded-Encrypted: i=1; AFNElJ8PZ/ZcU/R7gfjgVBWELkR/dW7UIARKU2rWOSq1TgAZ1KJtlCGJRqLcdiMIm3plKW0uXhdvELnJuQoK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb7WxvNlWjTrT0Sit9ImGWaWDmKbhjGXKkYhgE77x4geu1h5Nf
	TcEMQiwSdKTYzdJbY5uLz+E56/x3b1BITu/9LPSvi0Di4ZDRMvBQ6us/4L4UIuz8TIit+d2VYDN
	4sPZf8cHb7nSdHiibY8AWJ3EOS+1zVEQ52Mhk/kkuRt7YtK1N0WLwu+otCK6Uf90q
X-Gm-Gg: Acq92OFQ/KbFQgpcvufggOen2lV5+H2DyouqULVUS8a3V/dQxNAiAtYX3dpy+Y61W3s
	nqghjJvawdBsGKsgCHWm4gHGZLjn9pWzUBcSJsL7tEIU5UzcmhAWeaYe9JkGf33c80poH+bHzmF
	Bfa4+q6ilAqovWyKj5gHYjRcBNt+lAAQZutwZdgMWAsgpVjz0pp6qC5tc8JJfcqmxQlwLk1WcfN
	cvIJOEyaUVmobBTBoQuWza32I42/nAvRtDgihtO2B42xrYaRF+7fn65Lz+gElNvTyEeCaX9bPxl
	3YCAsiOMOTyEuCqqwS2EkdFj2rOw/PHwud39S02P7qWU5XsmyKhdh4lD3F6L0ne7XrdMsuHU0ca
	RvG/tkDJc6uKrIjzNpUEIf5uzD6Czs6kCFc9DWlR7Tsg3N0m6fhXLTXQLoKD88mLpqUk=
X-Received: by 2002:a17:902:cccf:b0:2c1:d49c:8397 with SMTP id d9443c01a7336-2c2f21a0e1cmr14799795ad.12.1781154045995;
        Wed, 10 Jun 2026 22:00:45 -0700 (PDT)
X-Received: by 2002:a17:902:cccf:b0:2c1:d49c:8397 with SMTP id d9443c01a7336-2c2f21a0e1cmr14799385ad.12.1781154045520;
        Wed, 10 Jun 2026 22:00:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:04 +0530
Subject: [PATCH v2 28/37] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-28-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=3878;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=L80h2On4bfqSssntkfNzGZ0RvyjR3lO+HJKD+5e5HFY=;
 b=/sVH8kyl/3tn0deZS8Dh9SXYWmgXIs+aN+ZXGR75ErEnATdK0yyXqTDdY5MhuieQO7U8dmyJT
 tGl4uWHFwU3B6H7lWDPndl0xMGOVdHZofTj6bUCz3+ZfJY69ejm2EgM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9tcDOeP0Q7FI
 HqcIdwZ4BWBADun2ZchVazbvODTg5qEhryshmWdw4JbKyR1dkLOs3hdb3BadWsKEz3ajdCzZasl
 RDw9DDS4+9ffTCnI3Zgt+ufgHSNj3Xk=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a40ff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wgeVbiqT6WWzazAUDA4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXzmaTs3Z1YIR0
 Nj7UJIBNRhuiPP4ENDRQAb/vXsfc2Jx9Wp2rfSDuYVWYXGngOYSzqVq4zrChTvnKMVU5dWiUAtf
 qZv0F50bfSsHhYgu5Aqo5yMlI1t2/D3q/wKfXWE8mtftdPji7e1QXEJpfNXR/DERvWVHBqr3y6f
 ZyqhxFgCxBKcF7AJmYat8G2NZbqNQ81YedW9zvqZAdCOI7wTwcZPXdYKZZpLhjxkT5HDx1unzq4
 uygXSyDb50GpYptlKRgz24R11XMWmJ13qVL26efy4AQzAdJ1nidfdjZogXHbS7ZvkNgaRU5xLA8
 Kf2tqD6WffjPwSe0GCmrriOSH9vpdsK2Khuo57MPjbzJxpjfbQ1rqLFC2X3xD0bRn85gNBDBl9j
 xP8Lu9+Y9nsiyCqW48SW94bg4r6XSA083qdrkM5pRQIys2yD8569eb0hvbv69WHS/zGc4WiVGiL
 ZYgF44Hb1TBiP6f87BQ==
X-Proofpoint-GUID: FpiwoGXpzmzK4uu4RippgNmaPTNhEbET
X-Proofpoint-ORIG-GUID: FpiwoGXpzmzK4uu4RippgNmaPTNhEbET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 13 +++++++++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 12 ++++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 14 ++++++--------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 24c0e97bb122..ad00f436800d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -618,15 +618,17 @@ &mss_pil {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	status = "okay";
 
@@ -636,12 +638,15 @@ &pcie0_phy {
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 091568642faa..c173b870c943 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -510,14 +510,16 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;
@@ -526,14 +528,16 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..efaa71a1d13c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2394,12 +2394,9 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2407,6 +2404,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -2524,12 +2523,9 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2537,6 +2533,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1

