Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926EC314A73
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790578; cv=none; b=XG/W5+kLf0IT+hoP0v50H34ehq9PmDqg81+Msw/C5aIUCUU9tP2WF5+8Bs/asa/sfJnnydQWyS//Y/zQEQ5IqdefAHdku4B5mxvyWJyYwQ6UmUb55rmAkCVBEyZvUE+s/TiUGj0/WnpZ3ZeN5k4TH3Yagg8o6RGOwKcL8/TTXnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790578; c=relaxed/simple;
	bh=e9z45rpqeTTyOv7DPEBwl2VGtPMFpFdv1fEXn5OgATc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcZooL3+PWANXxB5NOU0ihKfLgpt8t/eNh9BUa0AUbmxO4zMuCs+2R5v+EXjTnzrBl6yld6BXVVhBN4A3nbcOHy2ru1N7D+7+o9DTrDvBUnwwfGJ8sGcdM5iUgiCB8x3OI1JkB8kJJm1mYkDQmBFmI4f/BrL/dZYaegsnFwQc5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2ASYaym; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKj8bcXj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2ASYaym";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKj8bcXj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Jj3nV1972534
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZK6sxHdS1Zd3nHvFI8+glq4Vq32x7HAUAhSwXuepio=; b=i2ASYaymHNHGhxTE
	nlD9ta2xBQ0MoxnM6wOLr29tpRxR2+ByqLYfZdh5HDMPx6r9p84B9yrszKoaOxlO
	M8dc6sv+mfveB1HqFyM35PA4E3bG+kfYnR5RordKkE9n7oHWszEeICc1SOgbMFbK
	jKeHWB+njWh07PGWbx5Iccd5NdkmeIrtq2hqnEZGiP4secpzfW5Pjybz0JhsUsep
	csKVnRm/cnCFso2bf7bhBTP0a74fdezUBHwK674kv0qiBv0xVAETx/cV86XWc4Av
	yUAFCVBrHqJJIay1dR7PDzfWJVN8Lo5JdHnq69t7i7QraCleIPesQXrEcO0D+H38
	HqzNDA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms2fuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f07078eaaso569134b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790575; x=1776395375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZK6sxHdS1Zd3nHvFI8+glq4Vq32x7HAUAhSwXuepio=;
        b=FKj8bcXjZNGcm+uwxJoieqEPuRiXazxLUn2xmOpsCKabrnnusPmO7J7KL1brXXoUO8
         JNn534SS8+Wi50QKVQK52NcjIyp3x7fvKOi5XM6hulEy61p2J3oGqRdudXBC0yixEQod
         BP1BSE4qrkHH19MB2OIN7LT+d/CtVd3Hb6r6fTaf74K9ehWZtH9jBat3KTLcxkRGp+Et
         gNfo7ZmnTmdjyARH/wIRgygQvHzpfkWoXwyWOaKIh60BvNv9TwghI2RT9pXZEy5fWowz
         en/xyoeU+JyrWS6xgSLP9e1LX+XvqVT0nd26jwZbQtKmFISYb8kxdXjsMLGVuOq2kPSL
         UJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790575; x=1776395375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ZK6sxHdS1Zd3nHvFI8+glq4Vq32x7HAUAhSwXuepio=;
        b=PV7R7GAqYZhqXC/ADNBzaTY/4Kd2/5fONGbFRJ5FMvR5C+ra0lx7v1p9Llmu6ve/lZ
         NjjAyAoP2FWfCt9KlNLll2qmGv/JIYuHJKMm/fKzjen5p7bPg1jiWj+rmJBXSvwZHdCu
         JsM5OogcYQ3CGvlHOgKsqUTvjme1wBnZBMLm0/xvlXsY5w12mf0PCiI2u/Tyhe608sqT
         e8f8kTvAJ8Sew0pZzOE5HKfQUXIQYPJUTUSkIh8cMqTtms1K2Wq8+IYj5APl5v84Tewr
         RKOO4SgWYbumTwb8ObxBjsgqr9/paZdLKvlOtmxvvS9k9XzuEQ5X0sV/3MA+M25QR6sn
         YJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7mOoEAGip5WJHx0tLHq4C9Eqra/Bee1mKQ94ZiODDPTpMBEdAFyi0vLqUFeew6OBZFWUlpKEKZxrS@vger.kernel.org
X-Gm-Message-State: AOJu0YxcAB7kPJOiculGSfQ++3nsLS6dL7aG+GS67xMRmXhDzqYiXs7w
	+OFFYO8EoIonZDPfo2BojdWPG8smdb/vf9lVPJSoowjBabyb+0MNFs+JEhczXdYpemHeaALPB/A
	g1DYinlx+nuB9MOIeK3sKJAGf2lmnVhidSAo8DwesXWnaVGddzAL0DHAaIqBg3qq+
X-Gm-Gg: AeBDietnxDhgyiIF+aA+zEBFYtY/i0NPG/gM3bofnuONtLNw9Kw+2+aTS1/plQ4fSoA
	DKOxy/dJrFzBCUzF485TcYK8lWBjWabYQzOSXPFPTxDG1i6uefDHH004qGlGz4cE3R0tRckRoeh
	ki9oCUgWZUtvj7i6KpIGhZ7y7Q+dmWayQxIlsqXZo4Q1o16yBDop6kivMSQUaRQiUnTtAWmGSAC
	EWmTMHHhEPMCvU4C953fBhMidmMvGsDZi1iFB/VxBll+E2hxN8hrsyBrhppHIRXfQM8PKcRlOyj
	nMlUt7Oitr+bPrtyLy/wUZUpFuOtHKJKoPwcHtqQpFKu3s/Sl2UnFe1Qj2YzF6ZD2l/a3pNmJpg
	G2sGDvzHpkwnRr8XLaEMCYF5dC6AnT8vaQZ8NMtGOpTnOQsJG9cATqpSiWLuBHmwRVFEnT89ihJ
	Et4svsCgJd
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr1533408b3a.39.1775790575261;
        Thu, 09 Apr 2026 20:09:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr1533370b3a.39.1775790574758;
        Thu, 09 Apr 2026 20:09:34 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:34 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:48 +0800
Subject: [PATCH 5/7] arm64: dts: qcom: kaanapali: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-5-d71a6759dbc2@oss.qualcomm.com>
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790553; l=6784;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=e9z45rpqeTTyOv7DPEBwl2VGtPMFpFdv1fEXn5OgATc=;
 b=m7rMcnhUFzz2+Od1fssiCIIVGg4bfGkHX/awiPFLkPiCG7yLbXWWyJUfByPQNfA24cdS408/a
 QmzhrN1w0A3CnpWhAMLH+648W4OxObqFs0FYL+2j8LIiRAO+ngeQsOM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 7q2R4_gr4fSmBMvSojCp4dMM1UMQlXu2
X-Proofpoint-GUID: 7q2R4_gr4fSmBMvSojCp4dMM1UMQlXu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX7mqKphLJ/3Tf
 JEaHUJk0OuzY/9NTFmCrHvZTOSRPiKYvnAKEoUurkC/RWtFeiAOhwM9mtewgOLry+NHQUhzUseW
 DYkhKxNusrMiK2PbVsf4hfJRkX5kp53/+0bwTSXDVP6h5jNt5P6VSKsXi492ZA2FF3VFptg3+kf
 H4xw9bJOU6T2/8wYqVe7YNoREKp5IwzQrLKbuIpXy/FxUWmPQRyMu5GsljQH4iOlmD2vQ4tpwC4
 94yIVFmDawV97FRDdraLbeeRJ+zbsuRfz9DFjMKzC8A7rCigIPx9ydUY9yC/IrjbIENzD/mmFmE
 rSlFMz8T66L8gSaN2rxKXLmj9sMd9GkrVNzby27LPgYPWJ1sDwbHfyXkdmiesrtlAwnK1jmaMjg
 /VL2wBVzb1zJGg2poEkOC5z5nlLxPVD72F3LA+0eQ67RWebDgcyV5mKTy/2SJeEaJWMQ4eG5veh
 I3RL9iHIJCBix6wnX1Q==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d869f0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y9sfTe8_aZ23gbbyZ4QA:9 a=V7Z-W9-LB9nPp9hi:21
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100026

Add label properties to TPDM nodes in the kaanapali device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..0d5714ddef9d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4201,6 +4201,7 @@ tpdm@10003000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 
@@ -4256,6 +4257,7 @@ tpdm@1000f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 
@@ -4319,6 +4321,7 @@ tpdm@11000000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_modem_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4407,6 +4410,7 @@ tpdm@1102c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4425,6 +4429,7 @@ tpdm@11180000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4444,6 +4449,7 @@ tpdm@11183000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_cmsr1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,cmb-element-bits = <32>;
@@ -4463,6 +4469,7 @@ tpdm@11184000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_cmsr2";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,cmb-element-bits = <32>;
@@ -4482,6 +4489,7 @@ tpdm@11185000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_dpm1";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -4500,6 +4508,7 @@ tpdm@11186000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_dpm2";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -4619,6 +4628,7 @@ tpdm@111a3000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pmu";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4637,6 +4647,7 @@ tpdm@111a4000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qrng";
 
 			out-ports {
 				port {
@@ -4653,6 +4664,7 @@ tpdm@111a5000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlmm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4671,6 +4683,7 @@ tpdm@111a6000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_north_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4689,6 +4702,7 @@ tpdm@111a7000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_south_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4707,6 +4721,7 @@ tpdm@111a8000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cx";
 
 			out-ports {
 				port {
@@ -4723,6 +4738,7 @@ tpdm@111a9000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mxa";
 
 			out-ports {
 				port {
@@ -4739,6 +4755,7 @@ tpdm@111aa000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mxc";
 
 			out-ports {
 				port {
@@ -4755,6 +4772,7 @@ tpdm@111ab000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb0";
 
 			out-ports {
 				port {
@@ -4771,6 +4789,7 @@ tpdm@111ac000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb1";
 
 			out-ports {
 				port {
@@ -4787,6 +4806,7 @@ tpdm@111ad000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb2";
 
 			out-ports {
 				port {
@@ -4803,6 +4823,7 @@ tpdm@111ae000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb3";
 
 			out-ports {
 				port {
@@ -4819,6 +4840,7 @@ tpdm@111af000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb4";
 
 			out-ports {
 				port {
@@ -4835,6 +4857,7 @@ tpdm@111b3000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pcie_rscc";
 
 			out-ports {
 				port {
@@ -5024,6 +5047,7 @@ tpdm@111d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			out-ports {
 				port {
@@ -5040,6 +5064,7 @@ tpdm@11303000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_4";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5181,6 +5206,7 @@ tpdm@11309000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5199,6 +5225,7 @@ tpdm@1130a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5217,6 +5244,7 @@ tpdm@1130b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5235,6 +5263,7 @@ tpdm@1130c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5253,6 +5282,7 @@ tpdm@1130d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -5272,6 +5302,7 @@ tpdm@11422000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipa";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6958,6 +6989,7 @@ timer {
 
 	tpdm-cdsp-llm {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6971,6 +7003,7 @@ tpdm_cdsp_llm_out: endpoint {
 
 	tpdm-cdsp-llm2 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm2";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6984,6 +7017,7 @@ tpdm_cdsp_llm2_out: endpoint {
 
 	tpdm-modem1 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_1";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6997,6 +7031,7 @@ tpdm_modem1_out: endpoint {
 
 	tpdm-modem2 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_2";
 		qcom,cmb-element-bits = <64>;
 
 		out-ports {

-- 
2.34.1

