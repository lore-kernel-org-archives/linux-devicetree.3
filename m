Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD97E3932CE
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977664; cv=none; b=dn0lrE2TWM/jb9GP3J1OkNKs/PRt89XFJ4FX5aj+5ShQq8QYXUnEdUu5pwtdokFxMaVEHU3xq/hMX3V5VHIZcYAkxh7HA0cXJclwxSKoe1SPUlfMcbma1X5aJE6xumyMSysId3PNk/3HnPGqA1wi7Z26mRodLUjFYqyDQnc9nO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977664; c=relaxed/simple;
	bh=wAT1T3fnjrOVEasLUZ6kLgMLRxNhI2fWS9D7tT5i3Xw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ok87VoFUvMnXZZWBXNLvYQndA7EMJVGoTG30L0ULK9CZrqcemYZiVy8UXpivqEWhiFgxUDiX+AS+q2KU3m+FffWGPESWaYMeYpNO94uuQiPpmurxo/VsxFpin2XhKmxzGxZUXvgZyJd2oro8v7/gqEZf7HEecpKuDGCUSCsZtbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebcFGPX2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yhvn4piC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebcFGPX2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yhvn4piC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624iH393591674
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 07:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sIJYBVb2Xk1
	IN+E6IOH2B3aiN5MM890hUqbaJ5dnjXo=; b=ebcFGPX2LBNY3H3x6JkDZp+pa2B
	KWmm347s49RJN2n7s3wI8bbJPFPXNoLhovOzHXcYCLlGPouC2IZu00zGYsyRGyBJ
	ZOD4qtiG97wybVAttT0AMbV9ZfIeH07q2s66Gw1BabUZUgh2ZSIjf8n4UPetBPVh
	d+WoqEnD2Rkwzgjv1+rISMZ77WrzVoZIJLQUUgQmUwrH+gwHdF3Y2F6CERhbtoID
	TPQip2sRkkYlu4gAZrS3c6Tfeo4WaVp7FiEpCFrlLH9iHG/JvewJHfgXY4l1/jIb
	MJ2ckLBa+SCWf5qasvEQ8uvLwy4JU7ZStmrJknkDgjop82bBUzYQ61gM9aA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n8jhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:34:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9ed5caa3bso3471925ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977660; x=1783582460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIJYBVb2Xk1IN+E6IOH2B3aiN5MM890hUqbaJ5dnjXo=;
        b=Yhvn4piCXeQPnH3KWjMeMjPmUw2CCr98y18SZ2kaXUakx295KLdWvAvlH+ZnnTQb0v
         bhu8Eit4xTOzr8AOwFqI7Zdij1BbpsRk3HaE4ltdlip5rjeYb9Cmr6C5aZB3xL/fVrSN
         2pWC3qiOUbSV43YRd/n7gQYRr33J/+vLd96wYxxXEoZvSM55+mEpKTtVcstbwj20mMcO
         WPChO627uDAYDd+MkuqYS5M5Pab05ZABLyvXsqXblsom/xrKA9a88NsR7gu0Gscxtv3w
         wShevXqlVytORqe3OF/y81sbXImL0KIgcwK+xXDeWXbTJ9qZaUwvqLK6HGC0xOXjtx79
         f7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977660; x=1783582460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sIJYBVb2Xk1IN+E6IOH2B3aiN5MM890hUqbaJ5dnjXo=;
        b=X/DtKcaoLFBcMzszQzb6EChM9bB/RTdz/HpdEeUFLVBWxla2Am0qhjw5pZnTnI+caU
         Vi1uFLgTopmFMiIp8cUm76Hh6qy4CWI3mrRKuSKjmzUkfi+zyWgewYfMo9UQpNpAM3ma
         y5poKlBgKALUE9c87hXf7haiiSzj5kTP9hakh0Si4N0n5hwBvq/pPbIVJi/QUenCiRsk
         W1KbfEtxVIyoGxilDjXl0DskBvMEMw1v1n2WYk2G8dfktwHWSv/1GBps2W6gGBSXQvxC
         fAKOmyEYfzV983muWBLZhbUiLJBtml8e+pIjKjaFJUcWabjIx0doJKiywPaxImG9D426
         fzKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8c+qmdcni5gL6/E5BZ2/hJbvL4soXRfm5GZ4N49bHoG91V580BUq+Pjt/tq7ac8KpuWikVrWlHGSo@vger.kernel.org
X-Gm-Message-State: AOJu0YxxC016xqcWenGnauewp2l8zM9RHPokDky5SrW5Mbvxab9SO5aO
	VIlFYyAR2Z+N/9YfhimVMbNNs2WOYuG6f+4Zpo0/J+LpJj3YZYeha3gx7fh/Kie6wg83UUVMFMs
	rXhbTnjIBOJxdT7jjLfXkD2ZJB76+qaKQfEjWQIzgw+O9+mXOSWPj7CiuGmctp6VL
X-Gm-Gg: AfdE7cny3v5F8J/zLWRX+CZXoMP5ZTCJhwMxFEOvDC3S8KGuBVnOAjU3HxR4uCnGICI
	DnUji4neOEmOj54xkMOnwKQqrrRRu4ABSmCi4SEhBNQzfp6LVKwtDwYmJAlE1aHvOFvBm/BFZ1U
	k70Dwo015a9/LUsSZDzzzrGIdVTCydmB+FXql6bM3wzFfIxAd/ACVh70NEX2kYzKKt1Ok2MgjY6
	tWjfibMM5Obw8O6kmbEocipsbbZ7jW1k2PtUR0wUN5oFWWKg+hjmfwIo+26h/mew45wjIsrDUBi
	XrwZyVHvnYPG3QPxxran5u0+emt7FKv8fisbJyXVopAABptpJJilfS+FovKtSYlqIFfNAKXJXcV
	/P9sOpWjoJPs85oTwvPgy4XzmEkX0zorcCvD9BYTDV/1OPQ==
X-Received: by 2002:a17:90b:4a0b:b0:36d:c138:e0a0 with SMTP id 98e67ed59e1d1-380aa07d617mr4242197a91.2.1782977660337;
        Thu, 02 Jul 2026 00:34:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0b:b0:36d:c138:e0a0 with SMTP id 98e67ed59e1d1-380aa07d617mr4242174a91.2.1782977659724;
        Thu, 02 Jul 2026 00:34:19 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e163211asm587380a91.3.2026.07.02.00.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:34:19 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V3 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
Date: Thu,  2 Jul 2026 13:03:54 +0530
Message-Id: <20260702073354.3641966-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
References: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX5+jOaUR4veR8
 uFLXKONtA4jyT2NvJmxPur4RbAc+TycTA02QdUd1m+r+TeC+8/WSl6N2MPGdk8+o8+3OWz1UVhi
 loOjtX9TNum93/qYySlCrnM8IKWL7W/KhgcJZ3YhDS2Ud0mYb1c/5oBje3I/Yy3vXnjFlo9da1a
 d8cUxEJejWJWL1hZqdwWcvhpwa1J2O71sHaV3MFDgcgvNN4Ls/DyeyqxKr21SaOwCDdaMPW4Enr
 hSB0jLJVHclKDkEvgNhVMDMh7fG7ioowe1J/J/fN34yAnJQeyIrmtQJWprUWxr01bWTiekBi/Zo
 qz/ffVIZVWblyBW1L+bvaBhIbJkSQfyMVIdsX3w5Rh3Opt1cDEoDI5WxON73JsyPG+ViRoUt8/Z
 5vrPM0E/X3g4HHgwsLrB/ky0hx91pE3tTyJBoxD1SVk+q4mCauQPD+T8I33blUOSfAppV1G2jPT
 LxisAwRbpf/2IHjTAMA==
X-Proofpoint-ORIG-GUID: oHulJ2RFzwuiVvSfi3CYQfG0XJn3C1Mu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX5ZT8Dq29JRGX
 JpGBSg/3azl7S1iEqVNAfPXOrmrdn2W8UUq2Y35nR3Y0iT0zQ8krqc6LPZmr3FRmHwAFjEiYmh1
 XSdo6MijKp5D2mxXI/resGcXV7hEX8I=
X-Proofpoint-GUID: oHulJ2RFzwuiVvSfi3CYQfG0XJn3C1Mu
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46147d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=xck8KZ0arIIkwrKT9kkA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020075

Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
vmmc/vqmmc regulators and gpio-based card detection for each board
variant.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  9 +++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  9 +++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  9 +++++++++
 4 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923b..d4a7d31fb111 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -95,6 +97,13 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819..a83e9fa98797 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -95,6 +97,13 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 5411f22426b7..a9a5a6c99313 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -9,6 +9,17 @@ &qupv3_0 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	no-sdio;
+	no-mmc;
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &tlmm {
 	sw_ctrl_default: sw-ctrl-default-state {
 		pins = "gpio88";
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa..0fca5d0ac66e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -103,6 +105,13 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm8150_l10>;
+	vqmmc-supply = <&pm8150_l2>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
-- 
2.34.1

