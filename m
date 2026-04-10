Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507DE3164DF
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790581; cv=none; b=u8X8VjxfSUZpoOzl6KveF6uC6TPq8dMjsxMkMKbWMAuo6Sev8dv2yHIxEVN6OtYTu1Lv1mRxxsZU5tlwWmRKZMXv86rFi7SUBAT5tZDd17hvI08TtsuzTCoXzAxXRAFSjMUyhJTi3RHcv0DgJWOjkQKsXVCVajn8vkOOYBYYU/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790581; c=relaxed/simple;
	bh=CycNrBzVt/HtdPw4ivxnMvUrekh45II2ymP8/7jlOWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIX8CkR2zTj7thIYC08bdam/17w8HEyFG3nKZrFG1XhbNUiWuI/U4JhU5BJXMwmPY1o/6Xl7T3WoJOSRZ70h68sdbsYM1+/j23iFia817UuAGnou/T3aom13QZM2RF9pXcHLTW5roZDZ+IEqPg7xMKPBqrjEjrrAecT4xyfMOD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYbC9heT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEnBYLhW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYbC9heT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEnBYLhW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639MuxPc2812184
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Za/KbFucsGHgwB4oXI1KvrF3e1afcXU+Zi5dyUwVeTU=; b=jYbC9heTCpZZ/xBH
	rkCZcpmRPiK8yNj85Ghpzhilkq2iXe+Qx4OJpzZSiEdbtTkh1/xkpqdBxoSlVYZ0
	wy5uGKJHkCj1h6QWxvBmfVkINwzq4Do3aTzPlKgsPbizH717VOALmDkKfPfT8qIT
	D2/qbLlgW2+j02ORG/MPh7KXBg1pTf/zi+tphgnX6nz5vXiEaUhF65fpjQDjeaEQ
	Sq/m8fZrLWkf8f9rd7FQj5xjz/E6JtTIAVO9KkwhrObHJRweMyixE2Rz7V4L+rZq
	Bb8ep7QbscZ8xztL3F7G7LZxC53La59yVLo5pB0xMMZFzGGKB+SCgUwgH1WCUeMi
	LV4o4A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6haa6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76b06f37a7so975239a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790579; x=1776395379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Za/KbFucsGHgwB4oXI1KvrF3e1afcXU+Zi5dyUwVeTU=;
        b=dEnBYLhW6LTa16vtOfRzooKPxR4+nkO6ZjTxQ/ikGtFYHFOATzceD3iTXhP0anJuil
         J5mkom7XInD+eCZYxmOYE2Jw/yOOUzgOSmVfxeZypwilNzKKiAomuOF0PDgyCG0VFCMj
         U1mGapt+V6PqdygwdTAKAZBk0YXS6OoG5T8a6QjQNMqytISjaJEZEg+YGZB9WRaX0PCh
         W3GagdUH7fgdneOKrZ+w1qDS+LNGk181l7lwVt6k31KCkw9GnLsvnKndVV7Ahu0ZYtiG
         fJiZWeAjiy8ZvebD0TXCdQ+FmQxwtoom1nB2a3RW4jaHy+TFUTanJhw9GvJAwMjZLNOU
         qgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790579; x=1776395379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Za/KbFucsGHgwB4oXI1KvrF3e1afcXU+Zi5dyUwVeTU=;
        b=HzAa5KRu4xarL4QfyXTR8blwNzQdUn27QzNVX1m6rWS9TaDDKvNhFtN+VRcWVPTh4m
         vx8G7cIG72yz73thiS8swgCKCZYZYHhAk67mOCpUhQk9/7Tu0rv+BFKcz+LAciVPrMaH
         0eNKVOGFsNYgw7FvpryvHciTd5+GUxUrclXXx9MXHbZdolFapq6/M7gDhJxMNyxZL576
         RDvDVhyIL3RVa8zo0KcuKFeTbeT9kYueAvVpWU0TNvuF5eouHFXwOMgysV7+5i4/Rqu6
         NMuwjgJubZY2tYZI+gl9F91W2v8UPlnN+N+w2DnWPb41dQMPtuae40I3CXZY8v2ERLJm
         DQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK0HUaVSPOIzg/VUm8UW3o/HR+vPflItA9Lsaa4ZJ1V9je2lCYLVTxPwTWjCGW5LwfnBQ+M9cvZn1e@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1IrjZG3Ke7qavzYjpTxa/5uU7DYpI5Nny+gtFIRDEPghBulBZ
	RJJGJKIOK9if/BFMuyzTrJ+sMZRpD/SU/qLbbzhg1Zp9RTC60uDr0yCooWKil01khKHT+heoBQk
	A4u+sAvBWhnNEy6NnkcpwC2HRzvLSLKuQDBc0B5dKDaXGOqwDZjYOM50ZBV24x0VL
X-Gm-Gg: AeBDievXj0VZJ4JP0I+g6i+WMkKFe2kpPxGVTHldlCyBz6J74j1T9phYdgus67o5tvm
	rtrvlflKvfU2wQGGtYidC3JWw5BLJwtkcFA4eZgoUG2ddg/yGOnYQht24bmlmKEiv+xY8hZOJFx
	lDL/s742vMpMVM1g0nNPsjbdqZxuVfaHyCpNI1gUszaGTSl/+NFTtZw/ehhXg1Y40ySiPXxb4Rr
	Ha/55OnqFnW1SVUs+jH8QdzbEsm2cFVIYrBhOwJMU/LXd4kvML1XV3mb0noQJpbdSXvMBgt/kp0
	ZPrR8xB4L51KwPOg4wvRYqez7I8kubbfAMpgzAdr/JBpInlcD/Mqx/EpAvFdh1iCfp67MmrHi4b
	qb1WBqs+7soHWb76Qq8T8wWwb6ZsPK3lEDgRUdYuQoQ2jByQteDUk7y5YGFF1uX2puAcpFjIpm0
	eCOLgEJgOe
X-Received: by 2002:a05:6a00:1c97:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-82f0c24cc51mr1728204b3a.34.1775790578891;
        Thu, 09 Apr 2026 20:09:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c97:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-82f0c24cc51mr1728177b3a.34.1775790578410;
        Thu, 09 Apr 2026 20:09:38 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:49 +0800
Subject: [PATCH 6/7] arm64: dts: qcom: sm8750: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-6-d71a6759dbc2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790553; l=5596;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CycNrBzVt/HtdPw4ivxnMvUrekh45II2ymP8/7jlOWQ=;
 b=qtbTdhMOJQWYiqotaXE8bXC38kUlRE8IFO7wHyyBbYaXYMki8n4BmsWoXBnnhVIUXH2p5Cf8o
 P5nEMHZ/5cjBPZ+FhbCDywPo0czAgUobVUe1JFey/sibjh8gZaJGuNi
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d869f3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=M9WVcT1Q7LBHNZIDZtsA:9 a=_B6xl75RZ7udhtdn:21
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: g1vJ7lw0NiOxgAfs0qCeQYDBlxsmnZI8
X-Proofpoint-ORIG-GUID: g1vJ7lw0NiOxgAfs0qCeQYDBlxsmnZI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfXxztnCWLuq9k+
 xWG+reeQ5OFACuqS+hw/IkV4IbEEIaKRLW7ltLfPn4A4+WYDxf1a7cDsouWnDJEd0ZF89b3EkBz
 3Vshy0LBtVktlzGlhIqoholrCEOIFxvY/EiOYpEqcXZCQ/wrr+rC55vSLCNBYGW8lSG9G28WOVS
 YR9QVhf7wI8F+Bqc2OTxn/vdRLcIFqbB6C+3wRvefz2g1SngemRSCdLpftw5VmUmd0SIPiiLqkB
 A/NzikbflxREDzrZZjL0WN13MJEGDWwfPxacWiYpBqnqLaviTfREpFTGeh74jjw16itAqH+MU6Q
 XrVRnwsYSag/hKJ/PNYlvTLxDRqQNO/IzkX+jYmgJCEjzN9u0iORucIpqDubAkCkhVYWWUfDijU
 owUrbbhc/oyVdbFHfqtPhNMAe2ki3c6lADAkZj0Oa7NRnOXRA/FGUuBo77oYBKu9HMqcblDFCLy
 LDZZkoqfVhzOC/e2xfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100026

Add label properties to TPDM and CTI nodes in the sm8750 device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..c13e9a6bc68e 100644
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
+			label = "tpdm_cdsp_llm";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6814,6 +6839,7 @@ tpdm_cdsp_llm_out: endpoint {
 
 	tpdm-cdsp-llm2 {
 		compatible = "qcom,coresight-static-tpdm";
+			label = "tpdm_cdsp_llm2";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6827,6 +6853,7 @@ tpdm_cdsp_llm2_out: endpoint {
 
 	tpdm-modem1 {
 		compatible = "qcom,coresight-static-tpdm";
+			label = "tpdm_modem_1";
 		qcom,dsb-element-bits = <32>;
 
 		out-ports {

-- 
2.34.1

