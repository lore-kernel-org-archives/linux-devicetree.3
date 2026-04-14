Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61303DB650
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166613; cv=none; b=X67aMEXoChsUwk1z747MWPbo432QFK7n3lxiZwuBofWrSjrdS/rzbjhIJbf3BDRY8345miFmLeH/CUYul5jxgg82/kFZmaunsq/8//SQEg4TiUep4FGcLeUwerG3TtS8+xC4eUIIpzJanrWX5CgC6sg1k81z4QXQs1+RlVcq7t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166613; c=relaxed/simple;
	bh=ZL+3nFFqLPdeNWxfeHBY/I4r3+jRGOT+dpDhom9JEv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1cUSKuJPFe5U5cG+RxK8cZijUB1pCZwRR3OBNSyezD0lLxYbhHIJHilEMsC+bqzaxSVSlhqsjw5LDIp9dLFOLoXo+MoCQ/GlW1X8JiXvEmzzuidpypQqVzLolOIIy7JAdx6oNb9+HmXsUqOObzuGXijpkhqFez+EOCxrBC8TuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLZqwxYx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2Sq/WQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLZqwxYx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2Sq/WQL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6bsSJ395270
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vBOsDjoO9hzIXr6kvxZ5WGyCjx52oJAqwbmGIZ/GBeM=; b=aLZqwxYxzmTLOOFk
	jvLZH/nFuRGDash7sh5ReJ5sjWK0KSwVykHVHZqzUd+jybgZDLVT+RgUbAWvRVbe
	KBq3WNmJzONpYgVdOXJzVm9OOUEoZia49ArtUWqnYVuTC/ekBkWEFLWlsDLAFJ0I
	Byu3dYxHe3R5vnwzjh6eNIorSGp/357xCuK3SHCRl2hwlS5Po2ddEdn0GwE8rycc
	oOIwGE42EXAY8JxG2vdvES9BKWdCkoATOmzgicqKhTpfdmtj0ZluZpHI/ZgLqL+3
	heqeSBOI73afmoetrZywu8+mB8FnmkiM8O9PGumkTyo6HP9/hI3jDIbL+YrexpYx
	mfbaVg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870tgxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76b69fb9d6so3237317a12.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 04:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166609; x=1776771409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBOsDjoO9hzIXr6kvxZ5WGyCjx52oJAqwbmGIZ/GBeM=;
        b=F2Sq/WQLFic5gMR/wayrXKqD2BE0glbagJRMacaBugaqto0EukmkIDpuNY+PVzxQyl
         Ez90P/Y8c5US1WJxfo5t7XdbMGajr+E52y+UbiRPkrAwjph9r/Ld4w7MFVCVjI9oWzUH
         s8eAZFS2v+gpJfZqffGZWjSThbYzT4dlXiZk8icHR9JyfTD9yGefOiTUcJm4AH7M2cBq
         DnFY+MYM9RO2j6JMvT8qNuAq/d1L+trbCj3sgQD3oJBW4UTCdcp2GQQOlcwGZSc8ORQK
         nfuoZtR1tzbnle9hAHGvhs+xlHv2f3/FVUbQPY0v8VJ81rxXQNGtRRAoa+230B14ZRis
         XqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166609; x=1776771409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vBOsDjoO9hzIXr6kvxZ5WGyCjx52oJAqwbmGIZ/GBeM=;
        b=Oz380UJ4bMbJxr0f+iUqH1mUJ9j4xObZ5gyVCV5goRiySjx158nwZ3W2P35QNxpkBk
         DskhcBexYIcPTH2kLPKcX53aEvfZbI9E6jfczubwvlUpwfMZdGhugoZ1kx5AftWphOLM
         mqsSAOcmqFNjthSrzsArnzROVC/TK3gmZMgCvLogjTurRAAYxfeDPI+JARPcCjDRyqu0
         +DMs5K4EuRoVPQzC7OCyn1uljiO8isjYf6AvsVI7Bn7HurWhD0t5ANpREkBwvbEcHeK6
         J4pA5Tr6Nt2f42uN43XyzgysF8OCJTrctxU7ik56e5nGSFB7S34y1lbHV8YM8iYsuXnN
         UwLg==
X-Forwarded-Encrypted: i=1; AFNElJ9zPEcZiaXUbH22qOtR8cuC4blYhy/hwQrTWQG46bJ8rEQE+o5u4hP4k58p/juLMu0VAn6t1SraDJvW@vger.kernel.org
X-Gm-Message-State: AOJu0YzXKkidrvsYwKFVSzk1oVWJbKqw2a+A2NSQEcQ725reTGE+pFs8
	KzZUBkIsdfOjriA80d77KgbMXGb/Bzb7iJQdnCTXfV6QdnbZsSN/p/925oK89HTskA3TDxKG9H5
	X+GehnoTd81rkq29Zg5k5awQVc7+VkfiCg4AsqUc5IogRPtuHN2kU8bv8t5Lka5rm
X-Gm-Gg: AeBDievXwkAoGmxoI7LNbxJSd7OZpwvVRQe//m3sUdTU+iXnhJeLeQUvBrYjUcO3Ulm
	xAAXi5XuhFQo+8lqUyb+BxJZ4azp+PEP7Hqavb/4SaUAO3gSuTEchn728M+SHMOlrOUJxgMv7Xq
	iHZcT5Wl+moS7aneiEVWAGG789ddotsRVvSByAP8YYMdqqTjTY7tKS00gKX/7+x7sRDkeKEHI/U
	hRrzdbkx8riY0/RbMxGsNqEdKeT4iJ/J247mxizlQQKglnscgmpeyqrQATPeBP/4evn2TlS3E2H
	cxxCmuegshGPTVp2E4LBm+VN5psxERKVbwzDo2tcFesalV2y5r/N0/YpNmIfPuGPYspb/RT3q0p
	qyMUINGEjt1ZiSdbPEwz4GP8IpqPuA6juPYE9xfHG2hLi2Am6JFx2+RPockfNWWTiTEMWezJrsI
	m0tFYakWRn
X-Received: by 2002:a05:6a20:2444:b0:398:9243:2ae0 with SMTP id adf61e73a8af0-39fc928ca32mr20603187637.5.1776166609173;
        Tue, 14 Apr 2026 04:36:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:2444:b0:398:9243:2ae0 with SMTP id adf61e73a8af0-39fc928ca32mr20603156637.5.1776166608564;
        Tue, 14 Apr 2026 04:36:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:36:04 +0800
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8750: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-6-5017d07358f2@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166580; l=5593;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ZL+3nFFqLPdeNWxfeHBY/I4r3+jRGOT+dpDhom9JEv0=;
 b=schOHLJUx/FjGMsYnYB2Q9KukybZd8tNTo3fUCHQ+N2PbFhI/Ye1z/FyDHiY3lc/Et5gPy9GS
 db9bYZEI9g9B4KWnLFehEoDOGhp08kV6A/CsbxpnA5DJHa74aJIF4gH
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: hpQidwSOsWqevrUyILouLwcoTnYB9CfF
X-Proofpoint-GUID: hpQidwSOsWqevrUyILouLwcoTnYB9CfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfXwEcBTPh4wzNT
 u9jsastl+j5SW8imfJFW21kbKMjg9CxWdQXsv1HNnq/NxoIO3ona+I8c4Y/Wz9QgE6065+U4T5N
 pHjY6Ek2C3pUkDo/PwDWkPQcKmR+aJ6CLTKJyAfIF6obOa3VacBMahI0Ayb9yuz6bSPpr7aTqs2
 VUOh03cd4ITa2sj1kZ8stUtQy2d+OShLRY358QvP3VL/LJwcBVYTyVHbqt5zZSCKKbB7X5Ds71v
 dF1PmSjiGuj9m/DVwRy/wHSUhP7z9tWiTSxAPJcwqv9ocyGCZE4pMhT4In8G+N71Ccj/7X7OBz2
 +mLWp5f8D46cpwjij1s50cPW/zj8hhajD7oXxilrzCXvgbl7m1JlovXJjaVjwm8VFolKRy4JYmL
 RSD7g9YfMKqeYrKTUaYKJwlbiBxlAgIZj43jYLExHyNmEabNgugNqFjpB7lSwzmR0MLF5W7Mi2L
 libyAHklHbjrmCehR7g==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69de26d2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=M9WVcT1Q7LBHNZIDZtsA:9 a=_B6xl75RZ7udhtdn:21
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140106

Add label properties to TPDM and CTI nodes in the sm8750 device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..fee7f28e44e4 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4112,6 +4112,7 @@ tpdm@1000f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4176,6 +4177,7 @@ tpdm@10800000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_modem_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4256,6 +4258,7 @@ cti@1080b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_mss_qdsp6";
 		};
 
 		tpdm@1082c000 {
@@ -4264,6 +4267,7 @@ tpdm@1082c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4282,6 +4286,7 @@ tpdm@10841000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4300,6 +4305,7 @@ tpdm@1084e000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_bcv";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4319,6 +4325,7 @@ tpdm@1084f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_lmh";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4338,6 +4345,7 @@ tpdm@10850000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_dpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4402,6 +4410,7 @@ tpdm@10980000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4490,6 +4499,7 @@ cti@1098b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp_qdsp";
 		};
 
 		tpdm@109a3000 {
@@ -4498,6 +4508,7 @@ tpdm@109a3000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pmu";
 
 			qcom,cmb-msrs-num = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4517,6 +4528,7 @@ tpdm@109a4000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4535,6 +4547,7 @@ tpdm@109a5000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlmm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4553,6 +4566,7 @@ tpdm@109a6000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_north_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4571,6 +4585,7 @@ tpdm@109a7000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_south_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4589,6 +4604,7 @@ tpdm@109a8000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cmb0";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4607,6 +4623,7 @@ tpdm@109a9000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cmb1";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4625,6 +4642,7 @@ tpdm@109aa000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cmb2";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4776,6 +4794,7 @@ tpdm@109d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4909,6 +4928,7 @@ tpdm@10b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4928,6 +4948,7 @@ tpdm@10b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4947,6 +4968,7 @@ tpdm@10b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4966,6 +4988,7 @@ tpdm@10b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4985,6 +5008,7 @@ tpdm@10b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -6801,6 +6825,7 @@ timer {
 
 	tpdm-cdsp-llm {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6814,6 +6839,7 @@ tpdm_cdsp_llm_out: endpoint {
 
 	tpdm-cdsp-llm2 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm2";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6827,6 +6853,7 @@ tpdm_cdsp_llm2_out: endpoint {
 
 	tpdm-modem1 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_1";
 		qcom,dsb-element-bits = <32>;
 
 		out-ports {

-- 
2.34.1

