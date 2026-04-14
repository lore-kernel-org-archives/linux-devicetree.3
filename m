Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBC738BF61
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166593; cv=none; b=O7t4PMYD6OJHBcGkqKFfpYuyWB8go/Q2+YK+Tz0MUcVoaP1ejVZfFMnEG38nJenCPrkrA+j7SJuiovmEr3RYp7RhPVefiszIvTt1Mzh87TVoLd+QFyVw4KCFao9bHmwVQGMbiwTjQPoIGIls6QH50WbKaxxvguQxbdYGFIk+/BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166593; c=relaxed/simple;
	bh=xrn8iFf62z/oUuIXkUARUrwaU+PX7rU2uik/hdiVg5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dcoLA071cEil6q5aXtwKWBM//3vBl1/I47oFdnyBwVebcQ68JssdhD+d0WSM73ye6tNXqp42cBtbPbQAFMiLfiQdmRFLflV4HEp6xey3h4qo1fJqifrPITRjX3L3TdPCY0jtVX4p5EJbtxasv4MMA2diDF7QMiAccOxfkWLKnDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbILZW37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQDQRNnT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbILZW37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQDQRNnT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EA46UT030026
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K1cVEB56pTa6ARp1A0m9nmYfbAYbdBCuMA4dZd5OcoU=; b=KbILZW37hafZioDt
	FYIFbobsSZh7TNMKOSZSkufhhBd8NUKdKsJrfj2APR7KdCYiX4cvs/m7kAJVAv1K
	jd1L282aMmCrlekNm5HthHuTlB/K1vEc7EN1d77YY27QtJ8Mk4WUvDPmjbBfkYnv
	Q7sAJO8j+d8B9mBh2ZkZ4M5HQuetI+lDfYxMNYmOlk9p9ObpNDY5qJ69Qfxad3DZ
	VGVNG+nes7KUUI5pihlxNVLwNU7Q/N2V/j0gEBxp8RG6zAY/4i1JFgqdWmkSoNnB
	H66pkUjW5B4era+2IXaJ+Vv60N09YDege1pttVeGfhVg0dhc179omexg3Ez/8h6N
	Zkit4Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmg8yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fb3bebb30so3948439a91.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166589; x=1776771389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1cVEB56pTa6ARp1A0m9nmYfbAYbdBCuMA4dZd5OcoU=;
        b=gQDQRNnTz6k1t7mHjhwXBi39imXaN933NdWFhT9/QviIaFCr3+yDVQxMlbS56FkPFZ
         /6c/uRjJCOMfXU/lK0QgneSHke8H7gXMnDriJcqNhQTtzlQIG4ZbZquRPIDx3Ru2Ssej
         TLMOMYwE9P+7uufFB3wdT0YeLX/eD35dDRAwau7PmHVrEOkpctBDFU2ezz3di/OY5GSe
         AuS9ONSLHVr/NgDwy6I8kdRVfcfFgPSRF1KrdDJ/CrcoCOoXoU81d+KNoHVNzVKANxxm
         sBOF2/UCoPiDF/6jlJ0EYesI7rEcKC7w3D7o9yabENJ9l3u96KqHCPBummd9Q+GHzmfj
         9tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166589; x=1776771389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K1cVEB56pTa6ARp1A0m9nmYfbAYbdBCuMA4dZd5OcoU=;
        b=Kqrl7lBBUYzSgy7xxgkl29SpIm4uplvjKmOHD8L+aB5lBy+mX1NguBWqO2mNN3gQvw
         teGLU6IRSLrINKe1hRqH6Mi0yMjaqHgMs0eI7BhtWP5skGyfXgKYvQVT5MCrVYq3fd0W
         IfsLl2VKHQHMLTamDu07NQtLQIEShoQMMpY2bUL/sCoZBC4jXSauNm3/hccV820fYnyE
         Bw6a9RShwBgyKgLco2CTw4pZaMnv9lDUH74obBS3tk/TgLu1TZK3ldm6x91Ag36aXA7S
         qpY4Jy4vK0jqk/tTxqpEkry9dNyGt9udAu9WgMU2PDA879DExTaiastb0l1gfX6zNEqd
         6i9w==
X-Forwarded-Encrypted: i=1; AFNElJ9DaDsjqI3bGqB2mB5GmPxZsDH7pfrzEv3TG4uk1LphN1+S5gRtwkoDfKppxWIrWMaN4LA1UHUM+UDR@vger.kernel.org
X-Gm-Message-State: AOJu0YwtHRMOku7ZFXvj2Nxzev6TTmrMEHz6XxgTOX7DX9Wrj44ebYJj
	WFiyARCMOYPdoLwB7TA5IaMRZOuTLG9H0rdo4PLf0xtVGpzTgvHO8r2p9fBw4VgjF1S7YneRiTK
	QPaoyzrVhICkgjZg7QqTws2yPiUYLbPNO5m4WbkQc86vcqSBMspbBsUI+HLQUpAwV
X-Gm-Gg: AeBDiesaSuPsvyet97Ft9LC9tylChbFIt6sV/s587w+ry07CqfHzAydC6wIv4oOyWuX
	r0IfAFmqQHIRuvuptkvpaKBvrR+J/BGRQvcXC8hEtvbe4OvSPLMoUeGJttEkRlJ8HSpzJh3Vs/b
	N5ZOKVDc+jAtkXKj2wfaGNX4bnQRnxi3DAi1892e9MqMfavCrc0tRp8sl6UOIRbVQAyIs8sDjvR
	9fWX0CXUnOxC3EoLxvcGTBIJ1a+VeaD3hp0s9BKW1HSwDkNXWamJ7j0uKnrISIoKiSqmGYbUBax
	wURtzXww6JPjPVEVTqFC03nzkLBX6VAdrOdauaarofSG4QIxSg2K8/6JZSQTYmyHdAQw5HkBXpJ
	H7y0+N7f/Ii9s6Zh0ZIgORufM8B4BgdmrPC/4tcVM5QDzNmMMmr8cezXF+/pwU5Sqx0cGjX536B
	zvV+WF/E4C
X-Received: by 2002:a05:6a20:7485:b0:398:6b9a:6765 with SMTP id adf61e73a8af0-39fe40e053cmr19654918637.58.1776166589364;
        Tue, 14 Apr 2026 04:36:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:7485:b0:398:6b9a:6765 with SMTP id adf61e73a8af0-39fe40e053cmr19654875637.58.1776166588891;
        Tue, 14 Apr 2026 04:36:28 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:28 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:35:59 +0800
Subject: [PATCH v2 1/7] arm64: dts: qcom: lemans: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-1-5017d07358f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166579; l=3427;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xrn8iFf62z/oUuIXkUARUrwaU+PX7rU2uik/hdiVg5U=;
 b=LwsV5IeHdfpDVgdalvYRu2NbsogIWMimKWWyX25QQh1EhXBag/4Sk3t+lUo8eW8rTymlw8P7p
 S40AsExZOocCLQRUqnsWqMZiBgKG7owXDs4xDM3VNFkmynxBV4472YY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwOCBTYWx0ZWRfX+TArmSt5ZIJT
 XkkNGHoqj2ATo1B4Ek6AgRu3+JV6GR9yvYRh22y86CU8faghQVSH7FuMfabH12kqmet99lU82ZJ
 fH5pVPyPevJyyyRf5QpwOL95TbU09f4m1EOblgfMk/dFZQhCeGvyJtA6AAFvcdXXCp5i0baGuBp
 iZm0q3A+TMZPhI1+0OVrXS6TqTZZY7rY9xmS9iWQKC8eeABU6D77yODwOwgW9X5fOsir/cghHBx
 e0uLj7hKSGg+lwDFEG7M/SvcPG6aQN2JtUUTn4Aee3JwyQpo9ul4zVmSCxPPrb/wPLkbYYO56e6
 SffRhYQ/eldYIM0qhXZEDY9D7lYpBKfWMKW3/rkHYdLr/6hYdqtjXaxnKn0p2Zs2fHaaXD7j9rk
 Uyv2zji+L4thPE6pUQCEFqzBgh9FBPXtL6/QXidVUyqrsj+ogIOb8nNIm63FGgAPB0vDsbugHeT
 dJRzl1Ozhty0qgzChGg==
X-Proofpoint-ORIG-GUID: hrSentNCfgTz_RFX3PgEDxovlHCSmQDl
X-Proofpoint-GUID: hrSentNCfgTz_RFX3PgEDxovlHCSmQDl
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de26be cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AGQJ8-okPX9lvk53HAUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140108

Add label properties to TPDM and CTI nodes in the lemans device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

