Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97B4312815
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790586; cv=none; b=E4j9HIrRK1iu+u2LqeecmFTTuzZIg8TYaszuBjkfJf0P/marmBzomF1pGt2RFQ0ALu1jZffez5FsrXYxixX9Zd3zI6zWQPyf06hc5kXVMAEZcHkhH1D+WZ2WVOWDByTp9IQfj9ICE1kvm3YCaUKeoJTOHbxt/8DJl9/L1dqBTJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790586; c=relaxed/simple;
	bh=WwoiUVJ/ydibp2pKgSy9IKVFuzQSNgIRWK3VJTwdwws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpY37FKZy9FgtJk4A/g1kZNr2ftKXyQgZD7aPUP/ifkTkTaoXtYhdItMgDarLCLVrxufMfKFOCRseKiap2zXIaulsQcCERTu4Uh09gr+kDNuVsUFCn2S2w9VpHechGKnfe6HGvPNA2ebziEIR/E+FCMVCH7UIO3N9VfJAZ9ogzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3oIMRj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BK+NxBor; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3oIMRj5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BK+NxBor"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KhZhW2624709
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4NjCcyBnojNBNSm6o8zYVfrhFt9V07O6sWwE2gUQb7k=; b=f3oIMRj5kRlUR/aP
	Ywvn+R/u4grxDGaCsTw5VPESc0VybZttNTDzDDkMq73XGIpb3FF7Jv4yL18JcQSs
	ZhDyUI8NEXh9477gQvwRstanuuVIsFZhJJ14BueLy/4YqjS1TatKZumHhMzql5nE
	DH+6CqMDG4oWHsMX6MfO9PfxWuEEovEAbWeFe08f8AIC9F87uyuMx6qxa9mZ8rpl
	03ltAMwQZsWkRIIo5ohat8X3SFqj08S94erNpudBerjF1jPXh66nouLcp207JsJa
	L07Kph15xzp/JWPFB+pU1CmcBcnRITh+OnkRy9yQdBoEiq5xrl2/UYZxpPw42cKk
	wfoL4A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu2fmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741b950511so873166a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790583; x=1776395383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NjCcyBnojNBNSm6o8zYVfrhFt9V07O6sWwE2gUQb7k=;
        b=BK+NxBorpx4A2QKE72PfouXq0/zv/Zg75BCoNweaOge+wZgRSpiSOkpiiDXNRSENyA
         C35EwYDnXEWod5Sh3xldn+9NaFcTuH+aMQOx42VpdgAUmS1UW0ODf1DYYH4FYTWELfjF
         Hzocjwp7GCgI7YtlkL2KHi5AHzxRhB5C8ic6wHV/VfzIiNbdSLubde4fVf42uNMvYivX
         92mtS0q8/KcIui11fEiYHkWocMFu0HnICCds/JMzQCRJNqNOi9G7tmDNlfkCAxFkrZ8Y
         2bLA4FVTIDKE+rUlyCTaIoq6CocynF50VWv+Ril+uTHnfaieZd6Cw2gvfpSDhD0tIJLp
         K/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790583; x=1776395383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4NjCcyBnojNBNSm6o8zYVfrhFt9V07O6sWwE2gUQb7k=;
        b=tDZibLyq3zNF6qez43ki2qWTibWfqR08n95GZehGk/5ohrAhc9GXGIoLi+FDU6xGIh
         H6KbZmo8HIYoBR5ltC5YWQPX/g3ggX4hs5g5xCiTt2AD3r87tgksyYrQ6wKrvzL/ZtVJ
         bxRqw9RaL40bT+Oaid2NeZIkvDotaw/CERBXV/gAxADRijy/1Vr6ovH+ntuwP9TwSaFH
         Q9oUaVTQqumFsiGLdToeazGwVw3Mop1pmJi7j8kdrhSrxZdPfittARB2DeRenlykrSum
         Xr87Intl+zb56jq6HTSjVqc+zALrgOuw/lFkXm+pGuC8uXhcTk+me5jWRH82+cE7aYL0
         hAuw==
X-Forwarded-Encrypted: i=1; AJvYcCVFD+num3oU0qSwr2+MnYfsbPd11Asp16hWgXu+I2pRQTvWWZ2MriWnKplVawQ31/fT1q9gTP1SoQp9@vger.kernel.org
X-Gm-Message-State: AOJu0YxWP9MR24geHCN6CWySENOZGsOD3DxZrFLoBXgwX1OaQs30FOTi
	vI550clzhNzmEAZpLEgBvz4HlH9x95RFjdnLqx/QHx3Pd3CztQPLI/QWhl0wrgY4DAw6fSssLCu
	T1tTDWe4I6HHMT7mwgn9xOUJ0vntPD611kWKrQw8V0OCfEnEpHP+Fq29+AQahgVr1
X-Gm-Gg: AeBDietx068yRa/DXKbzMmpUiVbnDO1QeyelrF9b0fnYZd58mzJNAInLe1/3m4JPFmO
	806v0HrWs+s31UDe0qzNAxrjA8GiQChoyl5uZooTF1SkrMiuwwJGcC23r0t6Xm+M+XoGG1bRx5k
	ehJF7niEXZ9m/+ihnO8LVjp73d20bFYQVOWkn/VMxAoublNuVK1aaogJuQOEOa0Gaw1BsiSTnN3
	u7PDw94kfyAY55/sqNAAX0AQ9lLiKMrHnE7FZ/wTl3EUlP13Jv9S/MXCp9P6Ms/muwz2x0m9Ck2
	gwKlIlIUfy3mrcgJfdq2R5UzEB+loWH8d8Ws4DsBFyT9QamAPQJ3B28+1dIYl1iUNXFeBfqcgsC
	XCgf9j339JtltJfYMkjWLMaiMsV6KRFgxrFVM+Ck565yNJpqsB16S7nB5syKtbz2ZjEqNBkQuos
	hacQ43lfSr
X-Received: by 2002:a05:6a00:3e29:b0:82c:9266:624d with SMTP id d2e1a72fcca58-82f0c36d396mr1762278b3a.53.1775790582731;
        Thu, 09 Apr 2026 20:09:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e29:b0:82c:9266:624d with SMTP id d2e1a72fcca58-82f0c36d396mr1762246b3a.53.1775790582158;
        Thu, 09 Apr 2026 20:09:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:41 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:50 +0800
Subject: [PATCH 7/7] arm64: dts: qcom: hamoa: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-7-d71a6759dbc2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790553; l=6539;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=WwoiUVJ/ydibp2pKgSy9IKVFuzQSNgIRWK3VJTwdwws=;
 b=f4nThv3NT5swSoHTQfq3el+yHbqM3ywdwkba7OWFmyJiBg/Qz8kLcfdTi6MWukugqdY7CrXxC
 JjsSiVpejtNBYvw/EDp1bynVxv8AjFWxYjrKmyMe/+7YAI06KoGmm+B
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: gnkQE5D1HWsCbiQiVd_4OszIFAYJKS3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX/Dw3J3T2qoM3
 jemdoCB9O4hnvcNICSTTpksL5ykZ7GPJh8PPf9SEtQVEbmF7YPvBgLI6b5pp4b6cyyfTzBRJZ0W
 p3xdVovevUVV6yBN+kFRlJHGhZO10G9OjsxhZBSDcTA+8B3eDtvNkphvbv9k3ati+nWQ3TopzbM
 zWexsKg8SjOsdy6DNh25AzndQFf5NqXXRU1diRkEJ/aIetZNeH8oyBlledKfwkUKR8YEg/Z+GvV
 Ilak3zHadwr42A5PiI0mU3og6+6jjCDXyX63TIbvrT/Y5SOgrQrP0jAsTY0etRi2iR6mu89uQFu
 SvkHWPqLa64X0f5Z5la0Kz+0I49xWmBbMa/kpSpWFi4WbElI+74a2IGRNq/TXZ1tXJETo8UXneu
 R9Cbl1d07qK4h2E9/rWBT9RrCVG2W33M/W3QQYzxORM+6F2tBn1hMSaAapaeALcopebRajn1CYI
 2lDiCPw0hKdZ0yjZdLA==
X-Proofpoint-ORIG-GUID: gnkQE5D1HWsCbiQiVd_4OszIFAYJKS3s
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d869f7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eAkPLPy4D2IjGqfRhJEA:9 a=mIL_gL0YBkbNSaF1:21
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100026

Add label properties to TPDM and CTI nodes in the hamoa device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

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

