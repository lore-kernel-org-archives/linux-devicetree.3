Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEE026A0DD
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304721; cv=none; b=CCA8N+PCZXbPaLqLIkGaBSVUl/XbJ3yNIsRHChRZaYLr5DFHP8XUsUJSlXcp9SFZ35tZZW1Jk5jWysWQY3LJ+V5r8UTWe4cw2953UZmEHe6z/Cg9AU6K5QkSJLrAT/w88lSOUm+8QHtM2G1EZFG6yYikQhepejo40YY+bZX9hQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304721; c=relaxed/simple;
	bh=/FI2p5Zgj/9W0PIocqhsjPLE701QfR6sEWYzHDE8R3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m9/lWeP44nREGYZy7Xc7Qdr0qNJcamIRxAWXhZkSu8pH1OIjAXlr9aRVcQraus+++oQAh9zZm1Z8CaaTjcbEJURa3nHTAk8IQ74omN1ecTIS4UiT3M/cBuVKlTQEkRIaHYkCCvDOOabXcezt2yHOJ1SgdmaehaHX+QKZxaKLSZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dl7U+El2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HP229G4B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dl7U+El2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HP229G4B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANnjs2503742
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LIUckOvvlHEGAGk8h1kcwP
	Ja2OesMEBBzQs9r3daS2o=; b=Dl7U+El25qJeB/XEC0FfpRqM+9wnWEZxRLj3TZ
	2nEjkFZSU6Fq7x6ic39ibfTOSbh+ywnBB47yi4oRra+NbOliuJx5emSh7TMJlMfT
	ZJPSMuV5nN1SFXBv718lfBSs/7w7/rZ+cDDasCjzJOKG9NemajJVLsnLh9rCQaFy
	iAXuLqEMPUVriOSJrM+0PRSWBiaC+mVmJisBcO0mXuNyWuzIvtEDXO8I1XSCGdBF
	QML4S7HljzKE2ayuYfyHR4bBeAZ5ZrxKoRtB9ZPZwkm51SBfUgVoBWVwGepnOfQ/
	QsgYmeA/RQD2H6fZWlzyl2X6R1nE2JN3vcwb41hvv0htpuBA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfa7j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:38:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c79e5de32cso8945495ad.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782304710; x=1782909510; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LIUckOvvlHEGAGk8h1kcwPJa2OesMEBBzQs9r3daS2o=;
        b=HP229G4BLLSlBsXIiGTCDOhLz2Nrofyx760kBfV9J93lpRzM4sMhmM4MD8CGqbJ8Ng
         WL3qiV/vM/Wvm9GDLpGtNsGyaNIw+u40D+kZbeJtMgauPlDYJEWfgTEKqs//DukyoDiR
         3i+jkt4e2CsbRgUvV2VYErxPosckJ/rzvfXRq1NUN5/DHGmNPi7NLbCEQ+JenDJWIQ1r
         b6F085wEwIrx10Mnk/8kNt2CeW2IZZJG+UKTZ1gQhp3GcDQvueXXFkEeA+CwzsLYWxeC
         pnLkKLfg4l+eHvSIb90BsSY7B5NUTVQSKQKSolY04KYpTCU/gB+6IPT8VsGx7IymqZo0
         d4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304710; x=1782909510;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIUckOvvlHEGAGk8h1kcwPJa2OesMEBBzQs9r3daS2o=;
        b=rDZXCYFxmTXMBMHpvRXkPCIhIiWOFaQrbGvNZlrEF4x2dVUP8/B4arBwiidE9/v9mn
         D5sJ2oMAt0fGY2hH6bOBBC1cdLj94s1i/7mqV+b7UyfvpgW9aLdcwaxSu9zmiigCxqx9
         nKn7sauPH0QahMKIACt1IiXIlnxfPKHzemzEHCK0HZ/hip4BVm48+0M0+t4vTp4RMvbw
         LOuJb3Y4SAsnpBqlWcsbk/r310etNQCNiUq5D6HUQNkQdXEaUYuaGw4Aso1fn9HJuzeg
         oxJWi7InAq6gpiH/jNKymtzpHD47NbguyPJrNwfm7vZQr+NTE15/2cJ/lHP9NwUYz6k8
         rhwg==
X-Forwarded-Encrypted: i=1; AHgh+RrgpinBw3AWHsJ+RhHr3PylWaTctTmjOMJq/JCBk3FP/67nI4Ixknv99YTmC+sMy9GJP69INYk09UIW@vger.kernel.org
X-Gm-Message-State: AOJu0YxS5H3NLjrN52cRkHumWw3iACkHXTowvMzB3Ik0Vp/egsQKVDog
	6/C280m1CQGS46fAQR5omdkVq2+mv981E6aFPSRsxMUuitoDMZ3zxPYBu+qxxPAIMF6dqi6oPD0
	qVtbxc+IfDchZ8A/mJKA+Hf+NSPqH7ikuz2/g9SfcFEnrBWLm3qedMqXbspvavoNt
X-Gm-Gg: AfdE7ckb/0bR0mkZoIo4sEZvo53vRQaLO8tnOiaTXG55CDQ5Efb7DzRvLcmRmlo+gzo
	SLW6eBKTRfFN+amPIBZM8NolC4+S1GfWSTe8Axrus8ySdebZke0M8gtFwbQgNsnw5mLwNX43xZj
	NlXBXsOiBrtNfvpoL818yIusIJuJrjpUzOSktNqZisl5WTMvdBp7WRWBB2LE9lbj6N8eETh4xMg
	tH3Mue/nAT5/zNlvFTtFtHaIqj8ieCXdVFA5v7P2LC5w2xT9+2rMqA/ewOSdy2YsGzGbRI9mvza
	1fKTA2jYJjWXbXvQc6ANX1CEOSVUzOFjczGNlBp9CoqsOMEkM3CHNwVcPn9aJtmmGQc32c56+ZI
	Rg99mka4BIA6dPXoIKyjVWUItis4ZZWY5KAoU9FZTxg80+LVmsXe8tnYuC9C+fVri6yphpwcvIQ
	==
X-Received: by 2002:a17:902:cf0a:b0:2c6:a981:b591 with SMTP id d9443c01a7336-2c7e152c710mr37050765ad.30.1782304709151;
        Wed, 24 Jun 2026 05:38:29 -0700 (PDT)
X-Received: by 2002:a17:902:cf0a:b0:2c6:a981:b591 with SMTP id d9443c01a7336-2c7e152c710mr37050525ad.30.1782304708707;
        Wed, 24 Jun 2026 05:38:28 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f86aesm132646365ad.49.2026.06.24.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:38:28 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:38:12 +0800
Subject: [PATCH v2] arm64: dts: qcom: glymur: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-add-label-node-for-glymur-v2-1-e8420fd7025f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALXPO2oC/42NQQqDMBREryJ/3S9JUGO66j2Ki2i+GojGJlUq4
 t2beoJuBt7AvDkgUrAU4Z4dEGiz0fo5gbhl0I16HgitSQyCiYpVokBtDDrdksPZG8LeBxzcPq0
 BeatL1RdS1ZJB2i+Bevu53M8m8Wjj24f9utr4r/3HunHkWMtSVpzJVin18DHmr1W7zk9TngKa8
 zy/PjbuackAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782304705; l=6019;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/FI2p5Zgj/9W0PIocqhsjPLE701QfR6sEWYzHDE8R3E=;
 b=ffPPDYUAgFhYnpd+sHHGwAL76VGDc/JsqcW1w9ULaC9pfZx9rB/Ngl+9DuGVeSCR+WSwJlrVh
 svNJdRV12PICecqgHzHTXdFktrPL7qqD9fgxd73uu7lf41uP9p7ajC9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3bcfc6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vDhI5xCtqzLtBQcGGHYA:9
 a=F4HjgUavbmbVaGj_:21 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Sp-7sDy0a5or09PHJAY-GgMFTrqFHjB1
X-Proofpoint-ORIG-GUID: Sp-7sDy0a5or09PHJAY-GgMFTrqFHjB1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEwNSBTYWx0ZWRfX+gi+fvDGlQxW
 +1fbPKksb/0sOtxb4K7uKSVk0Chq5YozB6xok3E1vzhet/uHytkIwKHkIITcB3hu93k3Nlnhthy
 nTnC9Tw79GKwc6aw+eeCl5qnuJP1o5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEwNSBTYWx0ZWRfXwSVMZeYyiWqz
 LXcwfEomK0JgNs43Jt1MMrfFOio7BxliywH19Jh5TLYqdq6Lg+nPTPNz24G3zwtQjkyPA5hWEla
 Q8JmIE3HT5aQ6oziLavEhYofT3nHHnhzE3X2uK6S2/O18vwQrF41gorkg0JHYHraNoumfDAC20X
 +uW50ANYiLECjU+XpmV2C/4/W0KqVgf2Vc/61xp7mvxOmcpXGZ9mE90EtXhXGlRNDC9xVM7qeUr
 OubKswUDsU70aq4Inwnpvm33Doqg8IoEnTmsjLJjdBh2a9SawLKpzZD4sPw7dyPec41qqGWaCdn
 Lbeiec2KcHFZFQklv6gHgHhgKntFCvWaNAOkXwdqpZrfY1dphkIac8Q8yAMImoiQHpGbKe4kdMH
 k7r/mEnOZrm/sN+EOnX6f8kWGZ1JE6+1oOQVkUhH94QdLcA+FsIu0v/hRSLcEZB/seqFSaZp/Kb
 onJjmnPIEuoZHoVPSSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240105

Add label properties to TPDM and CTI nodes in the glymur device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- fix typo in commit message: "hamoa" -> "glymur"
- Link to v1: https://lore.kernel.org/r/20260624-add-label-node-for-glymur-v1-1-87576107b999@oss.qualcomm.com
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

