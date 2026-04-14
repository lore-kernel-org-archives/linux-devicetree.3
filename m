Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DC53DBD4A
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166604; cv=none; b=k3jGLoUKvmyTE44iZwgXRAU92g4sSpklp/133RIEdNKUMunKhGLZx63O9XGtc/Wh/bSnwRfiRC9Ff+cKz27zdYsYjsDHJdYtA9ev4Vag8bLqY0zfCNwZpWsx6O71zfNu35GtgDhGW2JW3JHhypnwMWyaDgFwNUUN2iZUnGDZkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166604; c=relaxed/simple;
	bh=LIMtwT+c3MEB3SSyWEkGsNB/RdOBMnBdyEU+dEeZ4yU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=caQIj++QYBvzwQBTiDzl4gkgI4OSzIQWQZ6ufU/yNMFxSpnYRB/x7tXQJz7m4b2BfJMhNuWRLJslyYvK82qWl3xuknuFbCHrJUUepVrYUv3oEidb7KNJef5VJq+D1xELxHeR3nBrWfce3yE/0xDBQYEW4OCjpRa2uMxteqaKdYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqDlvNdq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBYfRotR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqDlvNdq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBYfRotR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6hl11967775
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCKWeCYPS5rzMMinLRc9Bto3vnstIYaxholLrs8CFyg=; b=CqDlvNdqpYyysF4K
	KRc7IirvI3t8vn0EdIN9ObmNwt7tgS5b1d5/cXws+W/OjncoofjZmfPQvx0YVnzO
	huBhzes5sP9HPV8qEyqpsgXfxO/DPLBVS2+VduOO7dnVlXRp70E1tKVTutLx4GJG
	NYuS1PkK20rRTpTsxhPp5LWFBtFhXUfOssvEjjyiaI/ud4TlmJn/C7ADfjpswBW+
	XrHmBNZrv+BOOL2iOtUFo7qTvf+sgw42tWrcr1Z/9P2U7JEb+I7IdrDUd3Rpxywx
	cLFShTy3Yg0UiWhyhimB46GAQ0+cJ3PzdjzIUCXWeGD+UDGFkgk7suqz0XvKtwD2
	LZUevw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v2emr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso12401556a91.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 04:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166601; x=1776771401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCKWeCYPS5rzMMinLRc9Bto3vnstIYaxholLrs8CFyg=;
        b=VBYfRotReMH3HPN7+pajLJuWYuKy1iHL9YXMmOki7n8e2qTYYnRrXZAfbK8gOEDdTu
         r+lQPZ+ZrnnAbPTATG4PX3K7fLHu40V3KTQ6DwzwLN+Hf7zK12fcCO4kwzw3fVJm87sK
         ZN5xpaP1BvzxZ2hIKDRSUp8ijfgnEwspVtbbCV2XGthlt17t3eoRU3vtWS3tW6JmzjfO
         ZEpjEK6CM1YhFaijSqdJjqMGDttLgyvRC522IZWLhN7vYwHmd5frXB2hhpG4OgurfMt6
         PAu78cjz9YoqGPFhnNc5LbKD7oc3vgdKZ0BQFl36O0TsB+Nvr7HA6NChuDenBcm2JYyR
         eFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166601; x=1776771401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qCKWeCYPS5rzMMinLRc9Bto3vnstIYaxholLrs8CFyg=;
        b=RdJvTE7MI+UDxLFx+2yTYP2zE+9fNLuMi4VNTOn5ktETD7gD6P/GpPbCxUv0CV8SuG
         HiIbO3z3jUcsZCwTdUCfQcYcMj+Fy9JzzdeZDd42IsWwnNDHtMPMSH8ZkV5jSEJpjU+R
         sxNUcETKT0tml3535fGXQvqaCCwe9/49nAcnysneoAqpu637UOB3tbPIJoekwYoqkKcp
         BbpSUY1WJvxLA35VwxDGSAKPnhMDZtz85sT45jzl40PYPBcq+66m4p0uuFoqCA4lYJD2
         /abdoP2R9nUwQVaRUCmT9T3DPyQ7tbUNCNfAgKSK/cO2A4SyYmx1GjZG9SIJi42l1SJc
         epjw==
X-Forwarded-Encrypted: i=1; AFNElJ99Yd/F/Gkd+1WbhL8V+RuW23SbIWDWORU0wfNu7fxC9lP4qV+GovVkkqwvMjBi0eey8xaNpguLgY6O@vger.kernel.org
X-Gm-Message-State: AOJu0YxK1Ttm+p7KIu/+ap+CoEDk/+02wC30Cy19mNULUDueIa69IUFr
	ALokHHFTc883Q5MTgPLMTHrpp8mx/s/nQZ5bjc/OdL1GT4ydMoUzpK/7keeyZymyrDEZ17Zq+DH
	/ygLtSCt5Yrjhj4voezNwLy/3+L9+8ZfGwcA+9DppWDiOswdl/9KqDbaH7xT7B0rk
X-Gm-Gg: AeBDievpxAJRVSSTTkIx0YxzpOZZscQEnoKZndJszgKHsbSddY3ML6K2uze3WlXT8hq
	0X4acBAYc9+5AnRwJmj9HLgPsxr/3WITo5+GSDfFCUzZExcoboTY4DlK39YZbS/0mrkTIIG24rw
	CHqVYqRdqmgiCVvlczGwzgLYsgo9Sv09GQzPO6MGHZfBUfxv0MjPye3MmxmbCoM4CnPj87dY0rv
	b5MXY8jbw0K1x53jd/eN5clQewkIC/AA9Efw0y+20zB8wXdHfXVN29masf7bUl11DCt3QXbR7pA
	nof/Ex3leJFrdzPLfZkVk9vUC2YyI+EtEPAW+4cVwmAFOIUBlMtHbcU/j9WAlt/DvjuigIPcufS
	IYChqlE9KoAOVxwSVJlE7i+TFmnERMGKc7u6+9E2x1bXLA9Z1K84pOd1hLXusfi85Hn+1EhqJuv
	4qhgsLedAA
X-Received: by 2002:a05:6a21:6e92:b0:398:71c6:e8fd with SMTP id adf61e73a8af0-39fe40e945fmr17992505637.59.1776166601263;
        Tue, 14 Apr 2026 04:36:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e92:b0:398:71c6:e8fd with SMTP id adf61e73a8af0-39fe40e945fmr17992475637.59.1776166600819;
        Tue, 14 Apr 2026 04:36:40 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:40 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:36:02 +0800
Subject: [PATCH v2 4/7] arm64: dts: qcom: kodiak: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-4-5017d07358f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166580; l=2817;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=LIMtwT+c3MEB3SSyWEkGsNB/RdOBMnBdyEU+dEeZ4yU=;
 b=uw1tecKtUpQ2oJDRoLQWm9XWbWOcG1RdsWyQZVI+YnoB11cLVu+pdX34rqsvoBZ41Ms048H32
 yJk7S/xpL+bDnKvMC1DO7UFZA2y3k+xU0r4yldJmIuVuJ2PrlafWXF6
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfX1szP+49yKRYL
 EbFmoUta8FW/qCJehQOI7uUIXE6KF1AWytQoKifqjTbGqqPxm0kRDRdbBsmcrUR+xO7ewKpHmkZ
 YUIfrErAFelB6FiA8Kx3JZaTgpW8YUwBckL9bT1EYLBtfsm4/5L+nvK5M95WcWum83F/J/ULgKw
 B9dHbTWskMtIoeDFgxnh7t/kp6N3eEj+tcg9fATYSqm/5XeyFFEWfwD354tkp0buCzyqU8ZYeny
 iliXsUI/qPxhkO5/kEd7OBZYVtHkZ/uY6XI4q73l9q8LXY8FHpG8YezjRKB+vg66qfLsGQtMESW
 +HuaOCz5rTmgKzCOP4qPQKeyOQttK0A90WdfU4WRPzCsg99l5X/+oXDNS1KwxoEEy+6vKzY6qko
 4kipAmojEdGg70dIvwOM927Mm0A/q/7eKsXU9VOiqDXqmVvT+kDTeXNk+rzH9h9TjcujPnZ1d6V
 ZNdrUKTWJ0abMi5Gz0w==
X-Proofpoint-ORIG-GUID: i3BwRAdAM3QoLbhGODxBd5UrH1MS3EHy
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de26ca cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ft2vuo7JNPNZdQlk6TEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: i3BwRAdAM3QoLbhGODxBd5UrH1MS3EHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140106

Add label properties to TPDM and CTI nodes in the kodiak device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..3a2c28752e31 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3513,6 +3513,7 @@ tpdm@600f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3532,6 +3533,7 @@ cti@6010000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss";
 		};
 
 		funnel@6041000 {
@@ -3681,6 +3683,7 @@ cti@6b00000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao";
 		};
 
 		cti@6b01000 {
@@ -3689,6 +3692,7 @@ cti@6b01000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_1";
 		};
 
 		cti@6b02000 {
@@ -3697,6 +3701,7 @@ cti@6b02000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_2";
 		};
 
 		cti@6b03000 {
@@ -3705,6 +3710,7 @@ cti@6b03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_3";
 		};
 
 		funnel@6b04000 {
@@ -3859,6 +3865,7 @@ tpdm@6b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3878,6 +3885,7 @@ tpdm@6b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3897,6 +3905,7 @@ tpdm@6b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3916,6 +3925,7 @@ tpdm@6b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3935,6 +3945,7 @@ tpdm@6b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3954,6 +3965,7 @@ cti@6b11000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aoss";
 		};
 
 		etm@7040000 {

-- 
2.34.1

