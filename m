Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261712C326F
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295778; cv=none; b=MXsDc5+U5a61mhPzVHCUdsg9kWewp9NYPTNjMjJX8Vp0HTqxxu3Yc/fiFCsNiYxzjgfDAJzQAPcy4pJq39T2UXj3uRdKkdtccKaNKuZNtndRYEMRboyNmypPBAoLCeibdMN1wCZiV+HTzHRRoyimWoV/CddnXzHrYoVxy7WnmOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295778; c=relaxed/simple;
	bh=Qd2F2ljQ5jDastijTr1IcGfzYCnO9IPgT0XGP4LpaiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MqEv8PbJqK7ho7aJAyki2jAGLSVP5grM0GerkoMdICdm8DxdtPlb0Ej2IVJwkSBK0faj5UJo8FVIBEcwIvweAZc5DsiN1Ov78CVoHPApmgAJEikQFUgWf/MU43357NOMEwG+yUVY14FYNoUKnp3oxNVi0IXEFwno9uFU3oQiPm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQEJcd+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPdA4pH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQEJcd+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPdA4pH4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OA3pFk3027009
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 10:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w2oFGFOMRHsSzKTgpKT3RN
	urKirS8TYs6yLwfPmo0PY=; b=gQEJcd+DEn59gn3iSnbDPkp6rl6WuZM8jIIKi5
	dlljkbAgLfm1ydtScnhYTYO9wgNcv2ftfjTWtDOnDcz2fUUwgRDmN1cbs+4xArle
	H1o+zYrfdA3TpUQLOKBdRO/JPMqbvgih88RIsQm7Vr3PFAQh8oQOzde110bFWjuR
	TzUKbaf+MTl0cJLWir0GEsLFOKSPuIrslDG7ZSuYF1X2LCceSXi0nkAGrYcNy9gx
	PNrZo1eiwhDzkWQxjq10ibBaDZDLFNrdqmwlULAD0bwCs9a1x4eCmtDeGHglNKtm
	85acq0NNCfMB+CYHfJNhMpPFx77/ZXxmw/q/u+TYXWWKS9lw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g010e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 10:09:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso1639396a91.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782295775; x=1782900575; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2oFGFOMRHsSzKTgpKT3RNurKirS8TYs6yLwfPmo0PY=;
        b=SPdA4pH4kOxa6mmYtAYr3VFM2Lh456oihRL7PEbawND0CT0rfprEks8ygR0MY0h2Bm
         aqgTAKs4hvQOUaznr3OqEGwNZYODRdTIa0qY/X1dXsPdfBdprO+O6b63eG62qwroRZbB
         7L29auBttEEnOgnWPLCFAtmlv+EXPseccbQMTPZ0LFOARxjgrrLuv7eV4nAam4L18KDD
         aJ3w7LkJQlHZUGirUN9HaTk6gmxz4GE8Ag8QuuMsA32mUaUfN1fi5Bzxv1jKMzkTuYON
         jhcmyUfXBYPeaPEPo7rUtKwtBtnD31A0KHPCxx1QZ/NtF1MzWxtspewIr0YbOmlx9jpD
         Pa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782295775; x=1782900575;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2oFGFOMRHsSzKTgpKT3RNurKirS8TYs6yLwfPmo0PY=;
        b=PHmq3ozWlFMan79nenmW2qpWZ8NEwRmLNPcrK8EvgbQrHW719gDcEghmxyU6K4uwDC
         /yyFxlaX9lHdTbPEwe44MfyARrg7r2nSqPdBDCQmp5txhtUbcmNSDyS/OCOdrC+3QUuu
         rG+6awV215wkWeRYN469mpjMxI11ATZVwkNk75R9bgC5RC+rnhrGm5YNciNdC30bxDra
         /o/M4nYTCMq3q4SZldbd4q9eOX1Hk4r2jzEt7+rAJp4q20Zfff7lummvRasrXmloUi11
         ZHFu5mBeeL8W+v16nH3lPmmuVTb4W+zut+0SZeLLxyu0wKAtFJSnA9aCmCYNMNNrRssy
         ILPg==
X-Forwarded-Encrypted: i=1; AHgh+RrQjjfVHb05W/4GRBe19cuQUDr4mHGPB2z+w5iH48EGy1YOhky+gPozpbrbIX1Viqi1zJIY75OWFmRg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyvy8wPqgPK2SlhAesWmaoxVW8GTO2t8bL58kwQwjLM5PDUBoH
	i8+H2UMx3ttr+Ir0ZFckOLzENFKr2cbywcSkafPEnEgbcaoNZoBg87dftJWQAkqnf0u3N+L3nyj
	t1MlxitrPQNJkvdcUIrtJlFwdJ1LuBTMvKd6j3Vuts/SuUU0J34KCFYMW1y/GyYHn
X-Gm-Gg: AfdE7cnBPw5NB/3Hyq6ZPRBfX+w0W6HZpDwXoXVPisDds2wDc0z4VN18C2wXlWjLd96
	jGpVsOHU1lOuu0YY6oUjNpxAN/0mV7AjcnFTQU58GwKRXwf6Rbv3/5a542v081YTnCuPAql1gC5
	rVdlS04370N68t013aXXGaTBquJqgwLkK6rDDDOOyUUUFWZq65fM2iWOY8H460A8mP0GsJSmbDt
	5NbP2WbyJuh4sYlemwpQ7IiIpiRSEBh1544PqRQ4yv5EkADiOSvXLYqImsKf7PLmO3Aidb503jY
	8KCpFCCeiYhYaAvs+CeUqdMktE8zQfPsbyBjFNxULaYBbl/YcF/ShaCPdof77OIXi6X90VaDfvP
	vJMC4Q6IM2U9KJm991qmfIwaFEjhOETYjw93JS5yg7BFrgBTPcY3kdFe61EREBEqOTRRs8Vt2Sw
	==
X-Received: by 2002:a17:90b:3804:b0:36d:ae6a:22ed with SMTP id 98e67ed59e1d1-37de42bc631mr3301318a91.22.1782295774731;
        Wed, 24 Jun 2026 03:09:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3804:b0:36d:ae6a:22ed with SMTP id 98e67ed59e1d1-37de42bc631mr3301284a91.22.1782295774094;
        Wed, 24 Jun 2026 03:09:34 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3b839acsm2443201a91.11.2026.06.24.03.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 03:09:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 18:09:20 +0800
Subject: [PATCH] arm64: dts: qcom: glymur: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-add-label-node-for-glymur-v1-1-87576107b999@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANCsO2oC/x3MTQqEMAxA4atI1gZqcfy7irio01QDtZUUhxHx7
 haX3+K9CxIJU4KhuEDox4ljyKjKAr6rCQsh22zQSjeq0TUaa9GbmTyGaAldFFz8uR2C1Ww+vav
 bvmsV5H4Xcvx/3+N03w/5BAisawAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782295770; l=5835;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Qd2F2ljQ5jDastijTr1IcGfzYCnO9IPgT0XGP4LpaiA=;
 b=9G0K0YU8pCf2rw2zf67CzhFZ3acwtAQB3LX3l5M6ws8AUqV6dSVchO/u3vc9XOcx5KwEJ9WDW
 kiGVj1nU4CHB5IlcKOKOUF4E/tHLSwCfFpFSqlpiV+Ea1akmUFEJ9AR
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3bacdf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qjoJoOQogQJNJXumxhgA:9 a=bma26r2gSdJuyWQT:21
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: D1GXwntZuDEcxQmWwQ-lK5aDdRiwBQmm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MyBTYWx0ZWRfX5+S+olLIjwe0
 DIx2bz0gXrxS7WY6ZrdnE7UyyuugjxeFdVA5uQd+ZBpw9dqa999NP2vJyoMFAOR2HhafHdVdt1q
 mKSP6Zp95deJubj9gvB0xPnlfXUuegMVWach+/ZfH5J1JK2fBCO/Jsq7K4Q5wIRGZD1tXQBj2jJ
 v8KAv4ft3Kvlm0DK0DJPR/Kl7Y5/3Mebr7PQrNfmP4ELX6hET6BDzyWKwIa6zIMICmDfbMZMljA
 MDW+oaHpNt8gFWFPcALnHeBxh/YNec++DSS7T/4RL8i3+gWKzbcu/6OEzWCkQs9WzlSoXxB7ugp
 a/j0ZcC/9ANjv6fCxtXB9VXUYBhG4B4Sv0X3WMXm5pXDckI0sqwEmCaHYWWs4pLLGRekyMw0QWq
 KVGTw0CoA3YrMhEUz4Rac/goxP5YXYLzDcVOH6GFzRCsiTuDxrMm52aPyeSPd1Q6YzRQ0sdy7Fg
 2EXFWKhNQjVDJQ2Dn1g==
X-Proofpoint-GUID: D1GXwntZuDEcxQmWwQ-lK5aDdRiwBQmm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MyBTYWx0ZWRfX5Ajg97TFWvkh
 TP6ThIID31LUylISEzBvmy/grX4reeqOVXRaDsZOidnBbFEl7mQ2J0slnBsCCq3b14UwZbb4van
 IRSNXnmRVN8ZAIYOyy6ry+Bvs94j1QQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240083

Add label properties to TPDM and CTI nodes in the hamoa device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..27cc30de940e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5770,6 +5770,7 @@ tpdm@1000f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -5834,6 +5835,7 @@ tpdm@1102c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -5852,6 +5854,7 @@ tpdm@11180000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -5871,6 +5874,7 @@ tpdm@11185000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_dpm_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -5890,6 +5894,7 @@ tpdm@11186000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_dpm_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6010,6 +6015,7 @@ cti@11193000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp";
 		};
 
 		cti_wpss: cti@111ab000 {
@@ -6018,6 +6024,7 @@ cti_wpss: cti@111ab000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_wpss";
 		};
 
 		tpdm@111d0000 {
@@ -6026,6 +6033,7 @@ tpdm@111d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6201,6 +6209,7 @@ tpdm@11207000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6219,6 +6228,7 @@ tpdm@1120b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_east_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6237,6 +6247,7 @@ tpdm@11213000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_west_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6255,6 +6266,7 @@ tpdm@11219000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_center_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6273,6 +6285,7 @@ tpdm@1121a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -6291,6 +6304,7 @@ tpdm@1121b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qrng";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -6309,6 +6323,7 @@ tpdm@1121c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pmu";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6327,6 +6342,7 @@ tpdm@1121d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cx";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -6345,6 +6361,7 @@ tpdm@1121e000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mxc";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -6363,6 +6380,7 @@ tpdm@1121f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mxa";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -6381,6 +6399,7 @@ tpdm@11220000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_center_dsb_1";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6399,6 +6418,7 @@ tpdm@11224000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_south2_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6417,6 +6437,7 @@ tpdm@11228000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_south_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6435,6 +6456,7 @@ tpdm@11470000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pcie_rscc";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -6478,6 +6500,7 @@ tpdm@11c03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_4";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6656,6 +6679,7 @@ tpdm@11c09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6675,6 +6699,7 @@ tpdm@11c0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6694,6 +6719,7 @@ tpdm@11c0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6713,6 +6739,7 @@ tpdm@11c0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -6732,6 +6759,7 @@ tpdm@11c0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;

---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-add-label-node-for-glymur-1ba59f479870

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

