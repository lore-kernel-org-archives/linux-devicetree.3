Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCB1372EE9
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846093; cv=none; b=SZYu6MOGf/fks99DeBUh8DOoMTZpKLkEEkz3tngCsBGuEPLY8IF5u7d49YWwvvqPpZHEsTly7a+/qg1mQWe7IKNUoZm3SBNHK30BFAYOWPoDEebEBxnVlo3KeCTTUNgK781hTWPxXOXWAeH7v0sz7JK2IPwZCgC4oM5/xpTxLUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846093; c=relaxed/simple;
	bh=rWfS/GCkMUv7Te1Qr+CUw4vQjhgfT/9rFBEVUHa1xAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ioQDuX9cyAH8Wir0lQKKFgxuZ4w9UPXrgBVafzi+lADMLAlAKEfy8xVU6eRz3TF+blpa0ZTFVGgjGVmvnDUY0t/61Sm2oagyxebEKKIA4swBF98qAiv3C0sT8VdSfiz388hYzufV9sb52eRttjSNyOSVRHPvPE2AHCHfa8gfPjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZRsVm3U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Em6jkCkv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZRsVm3U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Em6jkCkv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748Bsv93016113
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CiYq0GXAxFO
	OekgF0TYapRMD4yuOgKVaynEdP3L4Q0E=; b=RZRsVm3UiWC7fIZhGJgFBCGVpVz
	CD83jr3GXnkv2pJhhuGPZGyMGrAe+u4z5tCbGk/9ub+StKbdlWStxhflDjO0S0uH
	BZpvYV1NdcQIIMmuXw7KppBvCA9vpqxaU6TAx39oINVHUPt10JdPM8l5wCEJTLDo
	RkUwSMO9MLO391Z9jzgfGDTTIUKxqZ+/V07qnK1adaRthRUS+DOp5XCFEHqO4712
	ZpVEEBDj6G9IMG1A089qUjR5rAGtilfC2CsB0BDSMb7chXNjXKAvNXhyhIYXgSiK
	iGb5Za0c+6qXZ2NnAE2trAgj7nf0XTj/E7hFjmlmSrio2rNfHaSXaCwfB9A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu7272a41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:21:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1194564a91.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846090; x=1786450890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CiYq0GXAxFOOekgF0TYapRMD4yuOgKVaynEdP3L4Q0E=;
        b=Em6jkCkvw0Rx3ooUxjks7v2xOX5AT7FJm2dOkGVCAaRbzSCsD+qwpanTTIMtEkwsNS
         9W0LygfZenSuG7BSPxXsyLCQ2lC8r1ehv3ED2GxVCkHfmGxy98SArTlL3+Juc05eUbCK
         giwptQ0a9b3BF11vvUW0lFTTN4O2O4/ZoIv/52POAEPZ0DzBJDsfvjHUmE0u9CmuPRll
         xtE6SdtjLWdfrG1z09ae+yWY9+oH55MNHkk3r25NtqdP/JK2srMOlC7+fl8CypYzPZPH
         YB5uFIY/UXCCFFbDczTOrsXMdpt3DASG5eEgHBNZNobwOqOpHCfRnv1BGidsdyFn4nvo
         WEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846090; x=1786450890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CiYq0GXAxFOOekgF0TYapRMD4yuOgKVaynEdP3L4Q0E=;
        b=WIBCxoGrQYzC4Ev6XQIYlcNssRlpu2+CAui/wlH8mnYcXTDjQQ0RwVByy2esKGzHK6
         pi0760n2b4XhLNOXA6zYbd4hHJXdoffgVazPmGdHsQ9S2P3GSJv2phGbkVBtn4LUOFrm
         Zi+h9U2jKIs3/wQkaSQn+hHBgO4WXdL7UftOrEc08WEcEpg1CRhjfS3zKCcIGUiim9t6
         zAHKuO/n02N1ty8rmSSh2agFqwR/K2d1akPYngkGvckvUwwF2hlr8+kHUlzg35TChgjs
         PVjlrzwIS3BJYbeDh56uGP6nS5sCIX7u2w1Sq0WxrCVxS/MkvIQwOvNnNGCgkwA3Q5iJ
         5ZKg==
X-Forwarded-Encrypted: i=1; AHgh+RqOoymRUYbtrGYoLaxP1AgOLd3d+4jjKYOs21cjoN8mZsp8iD5rVnLaI2aeWPjkCYdYlJSpGH/th9EN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh1JttGoVMg7WL890N57OA5Xk+gvGSoib0ftLdC/mhS12stUel
	6fxWUc6Ea1ktd1uLWLK3ZEV73TFDTyicSrYDWBdj0bjlNO/ZeUpFH1IiDNy7H55+CyeS1PJBwxP
	7PSyQZit9Xvv6XtEQnQBiNywKJt6jx7BeFag0DF8ATnIBJbssPyXP1mGUgxF0kE14
X-Gm-Gg: AR+sD10AKNcQjdyw8xOi3XlJLw4FgcTmrpRbeNQFQ5JK/Qfl4DBxhzTiF+wca/ZU4t0
	nydJDYkE3kPNSEdFSddNQZCcv6yTjyLus0wuBSr0rhoU7maEhU0rMNYCeNG6g3KB1WjeWP7wH93
	sQ21/v9eN88uKiUI/YGw0wXztxOLrP6lQQa3H/xRe8DQkl0IOYIP/V4AqGxxtfXPYZl2NPEgBca
	kot1tfHwDpo/sDfv+W60XkrcbBPVC3zk7KmvSEtrBedbqRcMrL9Gvb9161iS5Ljx7jn82DZqmSb
	10XOLQef28JHIkbB5egM3zpLCtk0mpwsaAuM9LpwjNZAddrLzeA/WT4CcLP34/Nd5/VYPBfWvZ8
	7nKG/dCl/s27t6L6HbpbJbQ+JidY+pzgIjw8=
X-Received: by 2002:a17:90b:5605:b0:38e:9e9e:ec57 with SMTP id 98e67ed59e1d1-38fbc561025mr13225905a91.43.1785846089952;
        Tue, 04 Aug 2026 05:21:29 -0700 (PDT)
X-Received: by 2002:a17:90b:5605:b0:38e:9e9e:ec57 with SMTP id 98e67ed59e1d1-38fbc561025mr13225871a91.43.1785846089478;
        Tue, 04 Aug 2026 05:21:29 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fedc650a0sm1237832a91.14.2026.08.04.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:21:28 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V4 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
Date: Tue,  4 Aug 2026 17:50:54 +0530
Message-Id: <20260804122054.3462145-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804122054.3462145-1-monish.chunara@oss.qualcomm.com>
References: <20260804122054.3462145-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfXzo/ti+9nC6uQ
 bTdXc5UXp7PmDnc1Q5bhP+Vy+4VMDfzTh0V7OpT4sza+8oJ9PLPx7gldWWSatkYfQJKgQ4MK9Wv
 oHvyhquUSe1+Yk/smWwVQWeI3k4N8zs=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a71d94a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fJiEX4jLqVLmUz1iUe8A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: bbTLETEJTnolDyTtlT01c5_DcnY2uVse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfXwzInL5P+3V+3
 DTCIEaZVvAxoVMvJHP5PFfWnNN0J3lQ0XIfvT/e2v8g/NrsV0XTASgfvF5WLm4CHuMSxhPEUcGp
 FGGw55bD6beXIcjFGtgz1t6oixuI0xkV54qYfoJ3UqHQQrZ+O4ZV6SceYx492Qi+Pc4iGywVNQW
 lPM6SKE3LmDE2XVUSRo/B8h7uGzAToxJm5m4SAq8p3fprGIBV8iSrgZ3Tqrw7mDWPWm2AooBMuK
 E4veVn53Ow4amJQC8ZCwbZAkYjOt5DNrkUvlrHrlrn9QmRt3ZIUS5w/CdOo6PNv8Ao9yBz5hdBv
 AMODA3WhF8mpQzpB4TnY/GHuoX4idYop+IXKRsffoYgQzoi+ldofvxFTzq5yDwvKCa87vkU6Hby
 EuzZ4NN+fWoR5I6LDRjPT+PM/KctLz0isdEoem6jfjUMP1V/hUYTTwEsZVnTo5Nnau+1x/F52zO
 pwv8etj2wQSWKetXeUQ==
X-Proofpoint-ORIG-GUID: bbTLETEJTnolDyTtlT01c5_DcnY2uVse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040099

Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
vmmc/vqmmc regulators and gpio-based card detection for each board
variant.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  9 +++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  9 +++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  9 +++++++++
 4 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..8e4656a51371 100644
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
 	};
 
@@ -38,3 +40,10 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..c13a02cfafeb 100644
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
 	};
 
@@ -38,3 +40,10 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f7642..177a599cd2c2 100644
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
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..5d400d50a7b1 100644
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
 	};
 
@@ -38,3 +40,10 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&sdhc_2 {
+	vmmc-supply = <&pm8150_l10>;
+	vqmmc-supply = <&pm8150_l2>;
+
+	status = "okay";
+};
-- 
2.34.1

