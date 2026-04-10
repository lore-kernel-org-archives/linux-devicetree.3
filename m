Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7EE30FC21
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790563; cv=none; b=Z8iUuJTm690iNFDA7zALf2EC6wv7Io4pqszE8uk+yK6qtzDQa+gAgyS+ZH5Gf8xOYCiVXpGL+fzrNo0bb7yFkUmeIn3JbJtJson7hLsgKXen477wEJOZfBFC9QDlPugm0QjBlzh2RjxlER6NTV6AzaQk//Soq3DtkWgf3v9mpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790563; c=relaxed/simple;
	bh=jC0NQ9RHOp8mcRO5W1kWueVWIj2hU3N1BlDUF4uk6t0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSSaVRBT4Ce7e+7zpuNWGeRUx2HUTiPXgpyU2fcXyyPv1eJ7kzqKLMwbviseu3mXJvSUDXCdriLzMyJLbYNjfTQtT69vUJl/s7j3ohG4XjTcCoEWGlNdH0EkLM/AMeC4G0A2/5zKtUvtAf/Th+Uzw01wInVBw9bcTz93idfSyEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENRuqc9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkYFOs4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENRuqc9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkYFOs4T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Kh1Rp1729917
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2A87x6iq1XnknEDF+ylr1BzadDS+vv13wHQIVeglFM=; b=ENRuqc9rp3pB3bAu
	+7FN9DTsWMv2JmUzgOwXOFyrPh/Xchkt4UmRw68zJmdkPLXzz011WFWgHe/WD6os
	hr7VvcC5VMvIU+vGSmHZAaVaOF1naXT7XA67YUL2oqrJ2uYIF0WTC3GyVOkhthsx
	YLArgr2EBt2SVhTUJ6VMPBDpdkxRPv13dIEZVGTTE1wH98i1/IgBFyJKdHP9umg5
	D3DXxYRBhSRXCITcP0oRJ5u5XyN7g+8kUd4oLYBSkRmkeCMCmiOGcaWyQDh9mshA
	SX2ZFmqihL8ENyrRiJu8TGKCwEYWJRuDungMQbzD311WqdC7ntmmA4a9VIcWdnoJ
	zrJbcw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxjfhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76c6280732so1917049a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790561; x=1776395361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2A87x6iq1XnknEDF+ylr1BzadDS+vv13wHQIVeglFM=;
        b=hkYFOs4T2SNctQayhrYnSQ1JLf963JYDzvDH8LKphQ8B/ZDEhGZgd7iR7fy5MYJyZc
         XXiRhBm5tdQ133OpRjHAhEhvxMD7n90PInveXX2k+gsATOe/2d1ax6sW3BqJ8cIImM+n
         Etnte3r9Vq1Vm7EPkya3uMgLJ0WMEo4bCDJ+KUes9nG1yaAYhUCEQL4pC6C6sdPPu0z2
         QVEElMjCz5Quzq8XZVXxQDXsiwd1CdbiPOT/hJwtTPYqrl+62zw41nLmBbDO1OEmIJFr
         AErd1dIbNpbNTPkn9v1lIpD7oEistYtEyxnSlDEav7CRjzrtEVtQY6flXNQ/fcC9Y53t
         0+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790561; x=1776395361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v2A87x6iq1XnknEDF+ylr1BzadDS+vv13wHQIVeglFM=;
        b=skHiRXH96QCwrbumwVTaIWOSli6fqdyWldpqZhpKpbDCTo+OCViPM6+lK24M5GVzE9
         aBb/18vnWVOCbCLGt8zHJgV+zONcDrjm89atAIEQ1MKZS0JrXgveW2HZDJILwdHTRld4
         JDQdFzYUQWt8vU4c0/D8XgZ9fKHoUdsHH5tJH2oo7Dr+LVyXwS0zB5Rr0UParqduS+iP
         hmQ+RQLJJHnL8kEPphOut9j/MJavYg/fe+IlA88snFeVfy2vs0THVEXOiVJDP2k3E5Of
         jnSS42dfPHzIGkXPJZfMVXPfLNJxGr01jkl1oKT/ihO+pcBmfOC5soXIc5T0o73j1yjY
         GNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU/wW+uK8tNtiTW9mvAACTH541h7omd/13sC+m+Pz3pBSOpw8T+ohLrSDbB8lBFaz0HDxOIW3+XN7R@vger.kernel.org
X-Gm-Message-State: AOJu0YxaEayu14NYeXRwQszdi9LUynCTCRUgtM6HoJazS3OPlB+oRiU/
	M0IlzGM0urIcQX/9wmt6cVNM7Np1pWRCVG0rpz6RvO6O+MyX9wV3tPCaixPPItJHm6SPnK8ywWJ
	M0B4y99uXqzUAWQujJv7QU/l2Axid0ohRiqNFrY2wpCJis3bw7eSel6C30l89pWI+
X-Gm-Gg: AeBDiev0RIPAntYWIGgEIEZJRK8P9JPklnqX4KGZEqW7myzn8YLsISHmo11H8mF1ELt
	KlombaHNVSgw7Yzn/SlTd1QsKrxFMxYSULo0Ahg3uHD0vNspPoCGGLpXqUhDnoN4VUtk/gD7Kol
	PtBQOxDQBA6Kcw+2XZnQmKePhE/aWIlYHHgtcqFc4cXjrxazU8oD/Z5517Fb6ssrU/KmAFfPk5I
	Rnl1lXlzIgtLop9fb19lOl4/6ZtGY1zoRN4ZpUKxTSMNsXcwL24dQzyNCuD+0PJtl6Jjbdnx+xV
	ac3/iqbNPzcF3hMz2fW6yN13K4ifwWYS0RN+mgwSo7UDIlUmykgZ68qXfcHVHsljN5AqWWRZV5b
	A+j/RM/7+RAU0ku9RsBNOWXcB8VhQnEf4DNoxl6h6ecMty8KKNB0dScd2Ut+nsCaVtNg3oKTTUU
	sPlUUvRg41
X-Received: by 2002:a05:6a00:1947:b0:82c:70a8:faee with SMTP id d2e1a72fcca58-82f0c1d9e1dmr1664907b3a.6.1775790560967;
        Thu, 09 Apr 2026 20:09:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1947:b0:82c:70a8:faee with SMTP id d2e1a72fcca58-82f0c1d9e1dmr1664868b3a.6.1775790560462;
        Thu, 09 Apr 2026 20:09:20 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:44 +0800
Subject: [PATCH 1/7] arm64: dts: qcom: lemans: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-1-d71a6759dbc2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790552; l=3366;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jC0NQ9RHOp8mcRO5W1kWueVWIj2hU3N1BlDUF4uk6t0=;
 b=zWx+zU86ioVVmpqUPsjS8wTwGFrlVThB3XXd2r8AlwKQ4TKb8NRVADAoba+iUtbHMu74y4F3/
 cMeDsQ4pwXrCRbak/09V2Xu49FUmnONukMrzgWWVBAFayuvLBk/Raoe
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: s9UfswB2-hM3DsycYsbO_HWarPldH6RR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX9CncLh6NlRlH
 /LOfwMnTUdCz7R8QIL/+PmpF8aAHPDFeGEGVViNFGbtdIItY12d57/WLqG5xmv91DukJxJIrJ/C
 HfZBtDbv9x6GyHo8EMNxJEkQX9IKzpsYMrQh/VplvBSVlIbKi/nTM0CJkksXQPMp0h8fONGGOFh
 gi1ojcXVTUw/vIzLsVBStVIQZCyYDCQyQKRojnrxNB/LiBj5PJZiE2zYRIcfhQh8XTl88FfdJ0w
 Pc2WBoU5vexFfYFmHu0juZClNJxEod2eGYbIH6p87CAR1cR9FKcitPbz+T5IlWqj8WNyPO85B7g
 rKkr4YbUJp0m3cCx/guVlaPdvG2Qb216Tzg09DmxNFiQ70ZMY+FO3PvsWWuR8eMIfl39Wb7FCrp
 wr+lyz8SVCtkxY5u7CYpuoz4M54p4jQOlBh9K/8rIGDGFope01o6pE3eoSfMS0A28OEuzbAUji2
 iYygwXwvHeiU/TKpQfA==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d869e1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AGQJ8-okPX9lvk53HAUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: s9UfswB2-hM3DsycYsbO_HWarPldH6RR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100026

Add label properties to TPDM and CTI nodes in the lemans device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..7cdca20708cc 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2847,6 +2847,7 @@ tpdm@4003000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2906,6 +2907,7 @@ tpdm@400f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3374,6 +3376,7 @@ tpdm@4b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3394,6 +3397,7 @@ tpdm@4b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3414,6 +3418,7 @@ tpdm@4b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3434,6 +3439,7 @@ tpdm@4b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3454,6 +3460,7 @@ tpdm@4b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3474,6 +3481,7 @@ aoss_cti: cti@4b13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aoss";
 		};
 
 		funnel@4b83000 {
@@ -3795,6 +3803,7 @@ tpdm@6860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_actpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3815,6 +3824,7 @@ tpdm@6861000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_apss";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3897,6 +3907,7 @@ tpdm@68a0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3917,6 +3928,7 @@ tpdm@68b0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3937,6 +3949,7 @@ tpdm@68c0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_ext";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -8590,6 +8603,7 @@ arch_timer: timer {
 
 	turing-llm-tpdm {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm_0";
 
 		qcom,cmb-element-bits = <32>;
 

-- 
2.34.1

