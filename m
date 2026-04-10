Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5FB2FF669
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790572; cv=none; b=HKjxgQXx3/LD2XGC15FypIOJyuNpTI4OadeeKVEi8wpQNew6fD7mBf6jRnlBvY0eHRTYF6J2aulp1rYIRNVBYjLdrHsdH7L0R7EL16ej6+h7Gd9Ov+zAte9tuJgqEpqckprRbTfVK7bwMQLr/0rxzTWFXcEDPWT0qj9kwwz/d6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790572; c=relaxed/simple;
	bh=hx4lFDUd9I7ChVhIcE2XnwA9jea02etEG3c8v2Tm4Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+YwYk41W6iKGQGlknoLYgEugtPelCaY/1QqitOUfKSi6MZcZB42Aw0Mup05rFv9zlREMBkd5UdsnahXrzHRPknuUP+8MDFxkaW/c/imlo3vGdvWzV3YgXVzZiMq52kqeIq4GKTLFWaN9ao3MHs5RlVI5JdY9KUifFF8XugCWWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDRH7TSQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jA847Ytn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDRH7TSQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jA847Ytn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HkJKg2698253
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oC7Y3Zd9pdqbHko9V/jkIWpLcfFpV28T1J2RJWhJPYY=; b=gDRH7TSQCkCs4Cqv
	q5KG4gcSDidRuXI3Cfqcq0Rrbfh0Qlr8Jx5JliYaR+XgBNOC7//kNzCIS1KVEL2o
	koiCh1HOO9Z2/Nmp56WAVhPGbxGnO+VvfP3ec0EwTg1D+VvZVmT8ponlSKqub3UN
	IFsq11ObU6ySupjGbchpoacoE20sF6FOlLQbx0cpJqwAZIBiedhYXqr9sHUKj8eN
	ubwuAToBh4h5Q9E1+BCrx8aXbB0qkREfnZIeV4RhYMfCBIUUsMLCQKjh5gL+uoYH
	1ArpD1m1tB1oWw+kqhSl2rwuTw6mbqelmChlCkivwum4m4mmvlXyQzmyAoH4M8hy
	tIvo5Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9sd0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c769e2b1bd0so832126a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790568; x=1776395368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC7Y3Zd9pdqbHko9V/jkIWpLcfFpV28T1J2RJWhJPYY=;
        b=jA847YtnntdgMPMIs6z0X+GGAVducoNdDA6OR8QqM2El5F/VJz6lgFHrETqU116HEL
         6uuKOccURmVIufZCfMSVV7ZkgPcacauN+isVwS4cwoKLMZCTryBc8EnAy8PZBTh4GDRX
         FFOuOl041btiGZvNtwhkRPkr/bQ7CKSFjm1HKZ63nsYro4FUm0U+fkv0Q0kETYP2f68x
         GRnm4nTLsLE4OEyTFCJYB9c2EnnRxGscp3JoFL59O5knb7VkVoM2atql0b7XNMc34eon
         4CMsPXgbdkSCbyWMm9Gsw4N1tzz4YvmfHuXoJcFGKgy9mcA6oG5bP6YRR+6UY40eC9pE
         vXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790568; x=1776395368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oC7Y3Zd9pdqbHko9V/jkIWpLcfFpV28T1J2RJWhJPYY=;
        b=eml0FtIU9ywCqiwjKpuKUuXghMdY7FCTTLKQa+svlUqHqiPKrg3H/zNRp0YzUlkipp
         +TjGOZU2fz6ytTkSdJueR3obPLxLmbPK5iOOxvEBH76sxfkuOTXX9rbqNcF8Yd9TlJfZ
         LwNvhMbQJS8fiD/uryvPB/Fc7DDt+3wkTvHjkdEZaqAzXh/fRCRHsBF/HPwKQB92/anY
         C+KPvmdJrhb+LSRpu6WBlI1U9X7uyKBDtdJGKmycp5ReXJbXeIL1SFf7IJYjo3qbdp1s
         HevTz4aOkFv0jLygpB23B5B+UcmQK8GoDuM7J2zG//mI3QOHlzaYRBqFcNCpVfor4dQR
         4xGA==
X-Forwarded-Encrypted: i=1; AJvYcCX8HIMvK1nJUTLGxJJTXgStQ+a/J+/UIVJZduc0gdb3IIWZ/HT9eOtbXY3Iee/csTKd7VwkC0VDd0dC@vger.kernel.org
X-Gm-Message-State: AOJu0YxuOyaNdmNE1QOQ49hg+b/Q3Ae19mxTilQqgGXuvjU/BloVyjQy
	EXycOmB0P2uE/nYNm2rPX6zgEiLxnWiaMDQkPZ91OKqKLW47noJDZNNcwBV5uXKVjaLVplisM22
	qT6iPtjUxEp8he01G+0rMYbEWecG1Sh/f263O/1evXaLUeIYVPvSU88hAjDGNE8/4+rmdECzw2H
	g=
X-Gm-Gg: AeBDieujz1nw+/r3NaZSTkuPLVwRqdSNLQSMxZYspL27mQLKUAPdO4GZBsHKmq2/TrG
	D7CiG4MgFb+f9So8+733UxxdSSqjadEegXmMbFaD9l4cOaHhOig/0Gak/8ltLo5xwEVv4DB+mdp
	N/zTtORb83PzTTDmSByJXf7DBxXCcQPwMsDUb2Okvlx3a0jRAxUMsGLT442h5S5BOHItwvACiA8
	m1amLWfW5RLIualKzJcX7zs/MO1us0IkEWRk66Rm3AkTpMBFnHu4bZyl3V28Ir2HUMulyWMbPwm
	V5wFXm4knj64NpUFPYJBPnsfYLuuQzlU+0czWPF2bn0UNMQcjZFN7Xlg1RRyacPC/9SpKN52cuq
	7p4IJyMn+crVIadEwDjCON+RxaVrXTTu1d8RSkCS6tPKByjKnKFl6OTaghhBqjeemZn10I3Gvl2
	rF0fthz/MZ
X-Received: by 2002:a05:6a00:234c:b0:81f:3eda:9d69 with SMTP id d2e1a72fcca58-82f0c2220a4mr1700745b3a.22.1775790568169;
        Thu, 09 Apr 2026 20:09:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:234c:b0:81f:3eda:9d69 with SMTP id d2e1a72fcca58-82f0c2220a4mr1700714b3a.22.1775790567604;
        Thu, 09 Apr 2026 20:09:27 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:27 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:46 +0800
Subject: [PATCH 3/7] arm64: dts: qcom: monaco: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-3-d71a6759dbc2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790552; l=6124;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=hx4lFDUd9I7ChVhIcE2XnwA9jea02etEG3c8v2Tm4Sc=;
 b=1QNuKigcR9qZYHhlbzN6H9JmhbRk4Q1ul07Hx8KzOhzPF76alrCHyC8a/D6ARyWNbru6ABg4K
 kyr1oaI0oHXAWI1ymAZ/ixdLB0v9+Af+ENO5YBKiKqBCY5KQ/RGIdHv
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX+kyll0evHzKt
 rBYL6trxrCVMHKNYlFyz4MwCbZ+8cn3t/5BvasBhitSw8C9ybvX4xuR7kKK+OuxuPBhDVyxtjPC
 NgGIdymb9TkPWZjd5Y6f6jh28YbJ5bn0YXcb1KRlkQvF/bwcckj3t6nxtzWRmLYgJ5pNAik0t3w
 /WrS3hBY/cddz1JDvWjhz5vz2Lc6a5cwfnR9kVNpz14PNruoBac2llfpJhvB84EJxITF63oSvW6
 R0+uIfCxHFP+jnPZmDb07UJzh/agO0T5YlqzMLa6lCnu5EPNUPHMPbNDghEnLoFGWH7ENxjcnCP
 KqVCnBztUf+lE0FjCdoEOdz+dg3xRxDWA9QFSDkJl1v1+mDhmLiAVyspvxu718X4mMgW82O5dEG
 xMN05r4SW6CVuZfrmRrYhenbF1iwmvcmDpWociYYZ7cK2DFgKxW+/yWkMPsza9V9OIafDYKIY8T
 ddjzzF9ykRocRgzVPIQ==
X-Proofpoint-ORIG-GUID: Dha1hzXcUHECnsL4pTHkKdPHc7ijcfTQ
X-Proofpoint-GUID: Dha1hzXcUHECnsL4pTHkKdPHc7ijcfTQ
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d869e9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=swnd-9OQR8il28cGCz4A:9 a=l9Vmz6SG5_cKeK-2:21
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100026

Add label properties to TPDM and CTI nodes in the monaco device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..3e076a1df1b9 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -3045,6 +3045,7 @@ tpdm@400f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3307,6 +3308,7 @@ tpdm@4841000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3326,6 +3328,7 @@ tpdm@4850000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pimem";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3347,6 +3350,7 @@ tpdm@4860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dl_ch_south";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3440,6 +3444,7 @@ tpdm@4980000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3483,6 +3488,7 @@ tpdm@4ac0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mmnoc_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3555,6 +3561,7 @@ tpdm@4ad0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlct";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3807,6 +3814,7 @@ tpdm@4b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3826,6 +3834,7 @@ tpdm@4b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3845,6 +3854,7 @@ tpdm@4b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3864,6 +3874,7 @@ tpdm@4b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3883,6 +3894,7 @@ tpdm@4b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3902,6 +3914,7 @@ cti@4b13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aoss";
 		};
 
 		tpdm@4b80000 {
@@ -3910,6 +3923,7 @@ tpdm@4b80000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3977,6 +3991,7 @@ cti@4b8b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp_1";
 		};
 
 		tpdm@4c40000 {
@@ -3985,6 +4000,7 @@ tpdm@4c40000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gpdsp_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4078,6 +4094,7 @@ tpdm@4c50000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dl_south";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4150,6 +4167,7 @@ tpdm@4e00000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4240,6 +4258,7 @@ tpdm@4e10000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr_ch0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4283,6 +4302,7 @@ tpdm@4e20000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr_ch1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4608,6 +4628,7 @@ cti@682b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss";
 		};
 
 		tpdm@6860000 {
@@ -4616,6 +4637,7 @@ tpdm@6860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_actpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4635,6 +4657,7 @@ tpdm@6861000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_apss";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4715,6 +4738,7 @@ tpdm@68a0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4734,6 +4758,7 @@ tpdm@68b0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4753,6 +4778,7 @@ tpdm@68c0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ext_dsb";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4772,6 +4798,7 @@ cti@68e0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_llm_gold";
 		};
 
 		cti@68f0000 {
@@ -4780,6 +4807,7 @@ cti@68f0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_llm_silver";
 		};
 
 		cti@6900000 {
@@ -4788,6 +4816,7 @@ cti@6900000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ext_dsb";
 		};
 
 		sdhc_1: mmc@87c4000 {

-- 
2.34.1

