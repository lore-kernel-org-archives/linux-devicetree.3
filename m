Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC13CEB8A
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494556; cv=none; b=eWaXZZqTi95VertWwreO7MQQGGA/c5dIyXyM3L/r+7aMT8LMwQW0EuJ69Z0wv+VOEccUtz2oCo50sKvy4rtOUN5C+bvowVMissPeWuC68/fnpQlx8saJWW8TPohstnF5h4zzhgORH/Bsq0W/p898E+BECPX0Z0Zn5v2a+W5gUvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494556; c=relaxed/simple;
	bh=PQwfiPUZpH29nO1KNCnWHCoAUl6aQUPSe8oyx1INYlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dk32hPfYeLQhCUBY/UUGfTfisO6iXxoHXPaHOTPkOL2NEPxMP4YBeHlPBWrezpY6KD9jCcE82yagd3OikRIaPGJ+gWA2Ci2P+3Z2J31/83G1w5Btt5LPL1FmmeC/gqr+ltWi9vHO9dvU4fTHUJ5v6PNKmiwyHKu1tdp33FxplM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJeqE3k9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIJJtBR5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJeqE3k9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIJJtBR5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FKi33332700
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TOMMPQ5PSuTCwEfAhyKBQC
	Phv5nv3zvD7POq7uMHRU4=; b=PJeqE3k92KJOqu+CFR9iAQKKF+ItEoX4NVy+rp
	ABBrh+7lyKXkyhknuRUIIi69l+dt1OFVGRXM6UvQE1OcBehfeJxzXriiAFCSLbIZ
	3KckFF4q3q3lsyW6sUPQFC+fOFvN41r0XiiBqj7LwrmSW0evl3I/PZYlEWk+Rv1M
	+a2S3/Vf7fqVUzvuA3JDjvEq3LmS+V40G9ZxIqoM1Ndfsj8YWPi0/WmU/XlLzCRL
	+EsIjPVFgn0fjtZUCEdlhPKWNkNVf2hhmopNN7RKVe90UCnkC69daNa8QR85MwbR
	oZzRkJSPUykmPPURLoEN1F0Y5cZ0aJDfYfiDY1G/Ctp1vwLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgrpe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:15:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36865d109dcso791987a91.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778494550; x=1779099350; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOMMPQ5PSuTCwEfAhyKBQCPhv5nv3zvD7POq7uMHRU4=;
        b=EIJJtBR5Mu5SR9h4yl8LjOHkjaagpyRgJgpTnvqwEop//4Xur7IOHAmK84ufddUoL/
         kNTIAKi9Wro82xSEGXUwSJeBkt9OoOiy/DLoJGGcZVZSB1CHtuHPQz+eK3XCg/zM/EJo
         1u960N+Sm4+m57mBAHcazyk1zaDvBMFjx1cHo1T2kYUJ0h5w6VTq+OsbEmcf7mEbAZT3
         0IADZdko2Xqk91OCeuoZ5f9UJsqsuWWuOmsB/uQCwuK2ytyunxvTFnGNfWeP6/cXZWEv
         ckVG1BctM/jnS7HkqRHQFnk3PQa1iGiLJ/zjvRt9dq95BGoUQ73VPibrOevae8orsBUm
         yWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494550; x=1779099350;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOMMPQ5PSuTCwEfAhyKBQCPhv5nv3zvD7POq7uMHRU4=;
        b=QpJAA67tJcz2DH7RKw6iOvcX2pavB0uN3E9Ruw7aDlSrbTDQyb9qSczJyc5RN4mDA4
         C9hPnPqpzsCDagjL/mZfLd/Ly0YiGE08IObp9+zP8nW82M0AMBa2pox5AJNwHQ52rLCm
         n9SaJvju2MR2y2v2ser4iDlVPMCLt2BxMkbJuIImQJs1/DeJYHu2fEesxllZYig95HhA
         jRyCP3kBFz5D3c/U/tqhtrrfrScQpOrcEEmWXmqw66DN+QJvF+fh6LtM/nOtiFMFM3rt
         zLUjgg3WVLbdxutgiHLGsUDs6+UmBG1+PkZ38O4Xhf4b0WrU8O2F32/E6EhFfh5me6/5
         jjcg==
X-Forwarded-Encrypted: i=1; AFNElJ/RTJ9TCFxO4Xox9rcGSkuikqjpMB3jLLTn8qfq+PGmyCkev1vaWkpNNl/ZngLgIojhbQtJnzqlNVV6@vger.kernel.org
X-Gm-Message-State: AOJu0YzHwC/Cn8dxpKBZhq2PwWd2q6KQSZ8nF4M37kXNPFe8A4EmY/Ef
	+5la1+MQv424iWRCWtRowBmcxFchd4onULBPL2yOS7OCCNjQ9CLiLCQ6VK5EY818ncJz+FV4SZy
	BAjVMgbUZDAhclpD9xkiGwosSIAkwWwOoiJVWPk8nNO+FbripdwCaLKUJsoZu2U0D
X-Gm-Gg: Acq92OFOOu1tvbBbfU3VHcQQ6DHlDrqMHxWTs7Bw3mg7ObV69fs0x7OUgasTuIF9K8L
	hhAqyR7az1Vko1m9w47o/JNlxTzs2wylPP9WB4aPw5obAZ4xtYFsZYqCy1DJaVUJTUPgPcF8Z4F
	pLhEJkWdsTzr1k9tDF+QgwicVillecoxM2TKi1B0SimtIqadM3rKVTgswa+RGmB1qkqIfAr3Omg
	+nK7cGdIz6A7vddy5rWRRnM++1uJ1FNHZptQc6E4gS12N7hEOL/aCggvnb+cy1cDRR4sZrUkkLS
	W17X2TygM4o6F+FXIb2ZbTHBWf0/ekcD4iQVMsDCd6tKwc+e8Ogtgf94+8eKch9uK69Cs7bkvCu
	XO9p7YG99og391lqpDs7JMhi8+17AwrN7K/t3R5VEWTpXnw==
X-Received: by 2002:a17:90b:4a4e:b0:366:4782:139a with SMTP id 98e67ed59e1d1-36647821b1bmr15134118a91.17.1778494550087;
        Mon, 11 May 2026 03:15:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4e:b0:366:4782:139a with SMTP id 98e67ed59e1d1-36647821b1bmr15134079a91.17.1778494549547;
        Mon, 11 May 2026 03:15:49 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d628474dsm7257148a91.8.2026.05.11.03.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:15:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 11 May 2026 15:45:43 +0530
Subject: [PATCH v4] arm64: dts: qcom: sm8750: Add camera clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-sm8750_camcc_dt-v4-1-eab4b6c3eaea@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE6sAWoC/3XP3wqCMBQG8FeRXTfZf1dXvUeErO2Yg3TlTArx3
 ZtCEJg3B74D3+9wRhSh8xDRIRtRB4OPPrQpiF2GbG3aK2DvUkaMMEkZ4Tg2upCktKaxtnQ95pI
 Y7RgteKFQat07qPxrEU/nlGsf+9C9lwMDnbfb1kAxxYJqUBIICNDHEGP+eJqbDU2Tp4FmcmBfR
 hHGyJphiQFxKSpTcaml2GD4LyPXDE+MoXvH03OGKvKHmabpA55GJvxDAQAA
X-Change-ID: 20251203-sm8750_camcc_dt-350a8d217376
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a01ac57 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YRkI6OSQ6ZkYtCvnlTgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: KC70_f7GCSrO2gvjlr-XFf4OSAwgqsYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExMyBTYWx0ZWRfX/ekQgm+0lhgd
 KTdsMM8NGnmn/QVvsbvdN+2h11ewg7r2yrBuS/B47tgLLkBpqyO9V97DqZR7cGL5AbxxZwvsD8G
 IGd/zY5mt3msIhSsx9PDHRxHekaMQd1uYt2EnGIZdepbdximruTje3UEnrxpVFHKrFV2j+Ais0k
 z7tL0ilHrXphk8yvue7jgnmOuflSkPckjqwqmeAb0woO48CgfwsM348M21gFKHtcR30MsZPRY2q
 uXJ0RxKdLwmqC2rBx9z9/Jq9O+pepc6xPmKmad1tgIW2wKlmy6LWt9XiSVvec/XM8HPXCSxc8X3
 6VmcP8+Y+CDNI0ZWCTsnyoMW8ck8goX5XBWm5RDAS2yKiC37nPvAwY1bw7YQSuy/Ucbsi2Ck7nd
 eOHrHy6vBNemJEFMnXMbwsmiDKt4dcKULqv/LFkRMKdZIFQcGgSw67iHFcjGXgwTGkVJ+qmI1qw
 Xb6BCajqj1cyWW8aQGA==
X-Proofpoint-ORIG-GUID: KC70_f7GCSrO2gvjlr-XFf4OSAwgqsYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110113

The camera clock controller is split into cambistmclk and camcc. The
cambist clock controller handles the mclks and the rest of the clocks of
camera are part of the camcc clock controller.
Add the camcc clock controller device node for SM8750 SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v4:
- Fix Stray space before the ',' in cambistcc node [Konrad]
- Link to v3: https://lore.kernel.org/r/20260225-sm8750_camcc_dt-v3-1-a19d3173a160@oss.qualcomm.com

Changes in v3:
- Update the Mx phandle to use MXC for camcc node as it is a always ON
  rail and can sustain this usecase.
- Link to v2: https://lore.kernel.org/r/20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com

Changes in v2:
- Update the MxC phandle to use MX for camcc node.
- Add RB tag [Abel Vesa] and update the commit message.
- Link to v1: https://lore.kernel.org/r/20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 37 +++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..dabff4518867df88d8e4cdc233ef6325635b7ae9 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2,7 +2,8 @@
 /*
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
-
+#include <dt-bindings/clock/qcom,sm8750-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,sm8750-camcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
@@ -2046,6 +2047,23 @@ aggre2_noc: interconnect@1700000 {
 			clocks = <&rpmhcc RPMH_IPA_CLK>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+		       compatible = "qcom,sm8750-cambistmclkcc";
+		       reg = <0x0 0x1760000 0x0 0x6000>;
+		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				<&bi_tcxo_div2>,
+				<&bi_tcxo_ao_div2>,
+				<&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,sm8750-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5b800>;
@@ -2740,6 +2758,23 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8750-camcc";
+			reg = <0x0 0xade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-sm8750_camcc_dt-350a8d217376

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

