Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE43DC4BD
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166616; cv=none; b=oihIORrKrFG1R4hZF3dFy9B71z4AUF1RqFnRtz7LonCAFkLDmA73Zr7hkF4Mk46ECYIb4/ygpETgIRB0yvMoQ//wM5IwZ7yVxJkqoNarSgHkiHZFK9XoGExJVaAOJRLmxqhPB7Z9tybwm4yyMLvFzUMTnROwQYQBUCFX25P4haY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166616; c=relaxed/simple;
	bh=cDITcqJjO3tfGvy29MPareL3ooXDu2ND/xMVYRrrqYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCCIalA+Gxu6jHWT1qY/YJsgyhrwyK8/2zQhu5gtf7c7X3ByNwOLBz0MT3nDlOw5dEAH2gYw7NQd0cvo9QP3+Y2H0U2vYdVR+eIpwgVuHKTDvW+YrvgNZDNxtI3BQ6ZmjIIPEU1tyQcWdDLnBWfLYSEuTrczf4kTwt614+46ixA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsSHzyYv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiVVu2pJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XsSHzyYv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiVVu2pJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XPYJ967332
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vfd5qheyFmmIRdUK6/pxvryl323QAWggXMWcJaHo6nI=; b=XsSHzyYvGu7C/PUB
	KaT1m++4x7TrG7EgtTSRRXBqWGxASWn+OlFZYma/st5fLckdnqLfBBN0duEFO5Ts
	ZxJJp2ElR+yzIuxI1JdxDynXRF7ZvvIovz2in8g/HCJ2TIUV6ZBDnMdzBuyJsAHz
	TgMMD7OiEOcAM9Ha3PA7QKg/Ni4vXAe7CbaDP1ilKAy/KROG2LHljKrKyYQnv60T
	F6W+FfBjpGOxNjgEQaUSdYEcvuIF2y6JgEF2n4Zh9/lj4d4+4Yshd+c2J3Lo3D39
	A7xEoLIgqPTFJ6TEp5T0DxkCFO6bc1yZschDi1xSqI0tTuwq+Xu9FTwdVLvp98Ls
	sp/WXA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v2end-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso11381591a91.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166613; x=1776771413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vfd5qheyFmmIRdUK6/pxvryl323QAWggXMWcJaHo6nI=;
        b=PiVVu2pJ4gMuF+4astzNO8pqCnBWc/8Damb3MC8oIXnfHJjeOlseoQGxpUSbpzp4rF
         M7fDXmUL0VeF0hyng4za/z+XCBt1AizLFryKVosRxyWRp1o8qz7rkaDmqqHHwbowaf26
         8QzW5rY8BBr7An74a/Jv3NDgLtdEj+gfZ4xL8Ys0tdp7GDWS/r5gU6cxFA1cuDDbnWda
         3grHunSyvYz28g3RKdTWG4QLLKBkbYs+cg0b3fRNyqyckVTAcM9NIdP+KHVKVVgm+asR
         VXrbnhsK0iHmCmW2hHB62bDro6wnoXrW42//7mpMOOZnMo2ywy08EwJjPgnzXdxxKaGW
         VaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166613; x=1776771413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vfd5qheyFmmIRdUK6/pxvryl323QAWggXMWcJaHo6nI=;
        b=sC9cuznJ+Dup+Yr1m1cM784582N2aFMtKrDT1NfdUfW22mmoUIPuZ4OtDL+eSLEmLb
         EhT9OvqibKttPzEU7Ab8bHObhID9b2tX79P+suuwVliAPpiA7PZzCcMCjTMUwPi4ipK/
         /GjjBl4Uv4NvVNo1Y7P9cks4OMUGJJ3td3RuhwEIl1Kj9drDhzxaFduIgDnKVWoFNiCZ
         ahfuo5qtkYnL1wbk8x+Bg7/jmMAvkMNzL6rhs2pIB5sYDZ45RG8ICT5Y6wW223sgjZxY
         nSYd4A9ZZ/87QPkaLIrXvJVs+15lezuI1rFxNlH00oP6TU2sE+MkhVcbcL7yEhirqk4Q
         1VgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XEodMP3DbkE6xkJdi4LcjjtBhKONJQ4p594okHpxozz0acwtOk13NyPPFbhk8MyUHtEjtTfkKHWrl@vger.kernel.org
X-Gm-Message-State: AOJu0YxAaeY3qBd6X3yuJ9KSsN9QTgC9AO021dUNjD+U4CbW7jyuDmSa
	nHc3wSYniA2rFy40609T8py1CVze3pG/Yb2npE/ieNS9t0PbWg2HIufBKrC2iZjWMGeK6iMWpv/
	1/2Egwy6KhWjNblJxL/qcUs3aUikUT5YrQ3munH8bD3H4r3Gp1wXlRWjMWCzTmAmF
X-Gm-Gg: AeBDievlc/UDT7mb3L1mJIF6x/DJZYwvzE3SS7oi08dzqgbOJgKrOpe+gURpgyF3RRC
	zGVa97EWWnYO6rxDmjbMu7Nba084z1f/DeRaG76beP1rzfsLhTixBfGZNm2k42i+cs/1VT6pnzy
	rhKXo4fXBZY4LjYa8Q3DPq8qbO/qO630H5/ZASWdDSvQKuF/8xHgVA+UmDvQ7vEjv0+lFRXVjmz
	ETu6GdRgKdnoVSPaGoZhbCTlOLSkzxfuz/9TbBvDB+ilDuAcyNfQ8OPP0SIH6vsiHQvQ0w8f54W
	90b09CisTXWOq5IzXDIhJ3lTDfXNxzkBGr4e1ihbK/uSZN01z5qVWzfW4h3LcTvhdnshPbWVyUI
	NwUnUd0V8gWtYKE8hBbc/Hj5MQ3y5C5mD7lPKL6uTPFAfftsTDlfsuwkeHtgdMA8yHaYiVr6JvZ
	8Nqiwx+4BQ
X-Received: by 2002:a05:6a20:94c7:b0:394:5513:ce5 with SMTP id adf61e73a8af0-39fe40573eemr19633248637.51.1776166612988;
        Tue, 14 Apr 2026 04:36:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c7:b0:394:5513:ce5 with SMTP id adf61e73a8af0-39fe40573eemr19633212637.51.1776166612428;
        Tue, 14 Apr 2026 04:36:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:36:05 +0800
Subject: [PATCH v2 7/7] arm64: dts: qcom: hamoa: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-7-5017d07358f2@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166581; l=6600;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=cDITcqJjO3tfGvy29MPareL3ooXDu2ND/xMVYRrrqYI=;
 b=mk2mBMcpDUOcltHTuKAB9vHydXuvHSv85WJ0zRPYbE7gAUUDAs+9GGhjmKB2qaNrwK2exR98J
 NIGN9Ceoh5nAEOczvxBc40WH+SfFNGy1t2FBSpeJmNhYH62+q5XVrCW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfX9H42YnDcQpft
 g8SAfPaT6tKH9/qvFBOjEnOKe08X1UPV1cCg/MRfpYMdlBPHxJnAofIfjKaSAW8rXtEaRwYatA/
 VROHusqi/Kr7fwyVuiz5fmabITkioHe4yRNx+43duHsXluMxg9gXklwe8rn/qfvMFHXF7rQ5nGJ
 2NBSQUHBQhBKxgstytJ1qcTxErHElY8MTCf5hVY55N8NOFKp4OvjSY2GXs+F0OSsP4QehxweLDr
 mGEmMEb0cvdqkWgKBeTWLXGbde/JLf/c7W3l/oyAy3TCJFjFLBw2M8YZ7BnDIQKIoMK2SFA91uL
 YUMoKjjwrWfjpfcZRrbsJKweUJugt9a2LEgBfTa9pRqzz+0Cy3RGnX4Q86C9qG1zdkp2v7A73qr
 O2vy4Cft/ASvI2wWOSHzKB0tEVFMVy8yzn396ocDgCbihEEOI014rJpRfMYStZdiMzH1+750Sot
 1ZCW6dQS3iDPWxfX0mA==
X-Proofpoint-ORIG-GUID: DDMFl1NiJU1C9JNAtjnHzrVnjefyQyen
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de26d6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eAkPLPy4D2IjGqfRhJEA:9 a=mIL_gL0YBkbNSaF1:21
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: DDMFl1NiJU1C9JNAtjnHzrVnjefyQyen
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140106

Add label properties to TPDM and CTI nodes in the hamoa device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..f10af9db8bd4 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6882,6 +6882,7 @@ tpdm@10003000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -6939,6 +6940,7 @@ tpdm@1000f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -7077,6 +7079,7 @@ tpdm@10800000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rpdm_mxa";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7096,6 +7099,7 @@ tpdm@1082c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7115,6 +7119,7 @@ tpdm@10841000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -7134,6 +7139,7 @@ tpdm@10844000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_lpass";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7177,6 +7183,7 @@ cti@1098b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp_cscti";
 		};
 
 		tpdm@109d0000 {
@@ -7185,6 +7192,7 @@ tpdm@109d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7205,6 +7213,7 @@ tpdm@10ac0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dl_south_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7225,6 +7234,7 @@ tpdm@10ac1000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dl_south_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7459,6 +7469,7 @@ tpdm@10b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7478,6 +7489,7 @@ tpdm@10b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7497,6 +7509,7 @@ tpdm@10b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7516,6 +7529,7 @@ tpdm@10b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7535,6 +7549,7 @@ tpdm@10b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7554,6 +7569,7 @@ tpdm@10b20000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr_lpi";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7624,6 +7640,7 @@ tpdm@10c08000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlmm";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7672,6 +7689,7 @@ tpdm@10c28000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlct";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -7691,6 +7709,7 @@ tpdm@10c29000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7824,6 +7843,7 @@ tpdm@10c38000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7843,6 +7863,7 @@ tpdm@10c39000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mx";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -7939,6 +7960,7 @@ tpdm@10cc1000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_tmess_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -8043,6 +8065,7 @@ tpdm@10d08000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_0";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8062,6 +8085,7 @@ tpdm@10d09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_1";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8081,6 +8105,7 @@ tpdm@10d0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_2";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8100,6 +8125,7 @@ tpdm@10d0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_3";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8119,6 +8145,7 @@ tpdm@10d0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_4";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8138,6 +8165,7 @@ tpdm@10d0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_5";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8157,6 +8185,7 @@ tpdm@10d0e000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_6";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -8176,6 +8205,7 @@ tpdm@10d0f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llcc_7";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;

-- 
2.34.1

