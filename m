Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397CA3E024C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765803; cv=none; b=TvcXOHeaVEhtQpo7kIwslHvs3ahIjs4+Jbo/FI+bIfKiB2k9gkqpPwxTBt1ArcMx7b88zVvQtDMCwXXRH66kJkZof6v+VOlE+xMYOqHNVIFIp7D+WD13QEbqBfxZxIXbqVN1WRDh2HUXtOgz2GhQmriJAdSZ8H+YY/PoKwrePso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765803; c=relaxed/simple;
	bh=vW09mPGHEFBOAlpegnp8Dob8GfGLJ/tfxP4gmr3uAJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/5ubRiwoc4LLyeuyspz4DdTIHVeyc6f8uVsysDRTx/LzYDhubXbcgz43Rx+vxX3HJR+37abRmTMeM7Xztz21aT20FFTrDV05RhzZbUpulBx+K+j5LjqUsVzn1tTCaguJXMiVsABuRXE8rYJNQATINXj4PyxuS0vc8MtADIqb3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jN5uf7LU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSw6CvO2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jN5uf7LU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSw6CvO2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeQkJ3951586
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEgeuV426iIHfMfTY+CEsXsWDY04sg4kubwVqpryfwg=; b=jN5uf7LUZIQhYGXE
	qGJdpbP3s54nELpryQGdN+31BvCCDaaDw3FHQfeTmEtJ/mBkQv+Ga/g1+0bky49N
	+JqTBXByhROTsn1DP1UT9uW4XP7N+5yiX+wWBUl964sQa30RujUC3JbiRAyhb2D/
	px3QmP7eH1+PswRZbyf2lKuWczcKKdmsEiT9d2sIDSw6bVX76XL4sOHOt1APMc1i
	XYQgkOaP1z8PvHdr19ZqiKFEeHPCcbjHJrPxmAR5JXXzFyfUpEVXhYZe+YjsKNuT
	TRQEBw2zBClkhVfNuxLByPQp3a6DUpRmIV65gJgNni6R6D/xYoTF0NKXLC7PiSUO
	a1E/vA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57kssqhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:36:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6326fc1256aso7413107137.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778765801; x=1779370601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEgeuV426iIHfMfTY+CEsXsWDY04sg4kubwVqpryfwg=;
        b=QSw6CvO2ZMvAsyMr7lLMPLJjKE9PCWrMSf/URYp4MMouzYBqIdlSu54fEoOyTW7mlo
         mOziijX43aJQUPgwwU74dLXlIgnrSPeew7zF8KwLRw77MPpi3o6H/r5BPIzNwYG7j3zA
         K4S4ONI9DntjFkBRZvwIz2bk67FXMpoOjLtRkVKGVPYeUcfRHezy1sY7Hre2WOceD1z2
         sHDkJkzEqjVSWuy6816ApAf6niLiS8NXUQrIXILXk3FyQ0u8lJrhPqdxL3a+5rqJqZ3R
         23fpu5s6wCpQSysBuVjNC68woH5qwBAHuPo9JrQPEwUBkBq0ejz8qgPbDAPzeL9kmOKR
         0x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778765801; x=1779370601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bEgeuV426iIHfMfTY+CEsXsWDY04sg4kubwVqpryfwg=;
        b=EDEMVd2wbe0q6XGElhqr0dDjAsv+Ccja97P/BNHPbenYJag+/Z9eNgpfLYUN0DHSZN
         ZQhO8ip7aDrE5glTFWUZhzZmwD9pep+szqzNpdKi2wtjWFl1iNxexLn695bOkuR9mLch
         OmtQIlxZfpfcd22QQqM0qfjn1C/SwPx0cc2iwlK4FUfPsZCRE+WE+koVvNp1cAzupu/A
         +KlWhuQV16mUCl+TpULKHxWe8zd1LNuOwall/S+KxWyfNv07tUtJpyHtyljwMeE5c/rL
         VC6j2nwf8lIZVL/n4r0UXgvERMXXYUyNdkuCe8nFZcSOCF3LVJ3ijDpSTFBTopaG9FRC
         jxMA==
X-Forwarded-Encrypted: i=1; AFNElJ8Tuvi+1oG5W4vVPce0uFxFVsKu71J2Hnlyh/WWCQqA7W4I9v4gqgpit+Q3NJUrxyPXfgCKwdHkmdWv@vger.kernel.org
X-Gm-Message-State: AOJu0YzXOSdKKZAViG+iOcsNR+i4HpCjJXW4l+TriQrvPUlgy2eyaGWO
	ywQXHAg1ANNob8SGzeQaeK4Q4OYuaS+Q2J92Dgis5GfU465mF6hmlK9BNyTasZnaqt/tC/IO3PB
	RTR+Voj2gfwbdF/JVArXFfY1IO42BkXycCefiocCIDFCMlVBGVx6KwNx3XInmYXPS
X-Gm-Gg: Acq92OGOIiFNWD3sTTOjqd2RcKIEFcOUzGzganPUAmLJeBwr5R6K0PipM4gDk51n+i6
	GpYwPCLy/Tnv4MnBrl1H3GsluMqU4o0/XVLGmoiv7fZN0HjRgycKm/o9PG9B4Uwi9O+mFp60P8+
	JRWsmUp01Wvmc7Yq+uPt/XwcW/8tjzlPpzGTrbV3hoQ8Z6no6KqWFA6ooOQ3Z5YS0nMhkh4MumM
	Zd8RCdDR+GS5kacASp8iMoR3wSDA26aOelsMBi5PeXH0ss75LXup7A+79Tt0ByPyoL3KzdLeqWQ
	vLJsExEGIN7KWRxJ9kEpRSFpNUBpLXR3fw9xLFqhHRNhThh+jPqSqpPn3S0YUalHE4MM/hHE3yn
	ESEU6+vZd6bX3A8JtM1uyBIyzbQJzaA==
X-Received: by 2002:a05:6102:441e:b0:62f:5908:648a with SMTP id ada2fe7eead31-63776679ab2mr4192928137.28.1778765800450;
        Thu, 14 May 2026 06:36:40 -0700 (PDT)
X-Received: by 2002:a05:6102:441e:b0:62f:5908:648a with SMTP id ada2fe7eead31-63776679ab2mr4192852137.28.1778765799664;
        Thu, 14 May 2026 06:36:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm7382462f8f.10.2026.05.14.06.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:36:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 14 May 2026 16:36:24 +0300
Subject: [PATCH v2 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-2-13c03bc890cb@oss.qualcomm.com>
References: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-0-13c03bc890cb@oss.qualcomm.com>
In-Reply-To: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-0-13c03bc890cb@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2579;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vW09mPGHEFBOAlpegnp8Dob8GfGLJ/tfxP4gmr3uAJg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBc/fbILFD886PPfxqzv9rNFi++dDLcxaNa88F
 wGC9cQ0XW2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagXP3wAKCRAbX0TJAJUV
 VgW5EACOQespkkkNWu0elWTq1T0z2g1q5iKgfco3K71Xvm6DX1ToJCJFFdtYdZFRylHDvBALjaT
 WxvaLeyS2pbwW85KYoj77dPlLGvIquKUYEipE3ry1Gkf6r19ti4rdJkhSRnNuA3Bz5hXXfqFkSc
 GTTBQ9lweq6P5ZZ6CA7PnflGZkIl5S4z/kZyhopuRYO805OoPPDdpbIMVqhcbYyP60eSSUF5yu+
 M2yP+1nXvaTjb7lZQHl141yKOCQ0tsWXiLVe1lSvUECDxHdE9UpJqjLkrDnO6IjxfzoxyvS0cj4
 ziy/BxMec5W0iJD/FuWIvgkMp/hoH1xbldSlXNqNR0StmiFJTtFmCNYiUYrs7zViWBXoMT3Kxlg
 2ZDlx7qgKrZdj8hM1xNy/HEwqh+pqWeItsQ4Vb+iX1hK0zSeaIQmGJ10tPaQ7n7uuHlgKS04wAG
 WHOTB55l5Ez8m9kZyjSS4+rxM98c1AoawvXdraApLIJFVxwYcN0LsRybmqWQWn+JMhN7UfglTUS
 1MixYK7/qcEmfWzntaQ0Ynv//iUxv5dSsm7ZDn9WVkakE5BUmKsWyceRuhxCZqaXlwrZE92fSo3
 lrDSi7vUjsBwHMjsbcfDoCiU+YzqLBU3rxM/SZc+M+YDVst+A7Pm15tLhdpp4Ug5YtESKUbPi20
 ybh6BuHmyJdXwfQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: idP8OXvIQAPJDN9VtV6BDqsJwCVrtd6z
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a05cfe9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bhY4RTjvg2rligDOO-YA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzNyBTYWx0ZWRfX1jfW8W1Sq9+Q
 bvroajK7mPap38REW5/RuKibGyxk95El9Qm0LmKrT9niS/w7plnAPidCHDEFAREhfYuXAdNT1HL
 nKlZ0PhKhIjRhIuQLtOpYVRsuy+ys2MtelQzONHFkgYnHjVOpqwRyOlEb9EP1p5ymaUK8E3zTY0
 hDqLSg609L7cdNYLDxDFnzIb8fQRYzuSVv4REGy832ktUYIMWwxF9enLrp8ET83PeO5WWr9GRjM
 2fFawx0w7QfXX00m8awPuYW38KfbGqL/HY6XvQM7Us/BOdG6cR1C18oRSgN8dTDJpbxLUZ2srTA
 DYBrp7POjizLn1N/4XMGV2Mq++zLBnN2w4bpSexdX/LTxbArVfZZIE55ORhUbddD1Fx/HwfCF+g
 QCUkK/b7ePLYWTtHF26PfLhKZlEFCtkc6hZtFy5eKmaNDLwo/rm1QUQXAs0wkT8SFRupVCaZV+C
 hIKf/UE+0KsblLrF5Sg==
X-Proofpoint-ORIG-GUID: idP8OXvIQAPJDN9VtV6BDqsJwCVrtd6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140137

The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
node. Add qhs_sdc1 to the provider node table so SDCC1 interconnect
paths can resolve to a provider node.

Hook qhs_sdc1 up to qsm_cfg and CN0, and bump the corresponding
qsm_cfg.num_links and bcm_cn0.num_nodes counts.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/interconnect/qcom/eliza.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/interconnect/qcom/eliza.c b/drivers/interconnect/qcom/eliza.c
index a4f7903f0524..891e4e6e8ba8 100644
--- a/drivers/interconnect/qcom/eliza.c
+++ b/drivers/interconnect/qcom/eliza.c
@@ -127,6 +127,12 @@ static struct qcom_icc_node qhs_qup2 = {
 	.buswidth = 4,
 };
 
+static struct qcom_icc_node qhs_sdc1 = {
+	.name = "qhs_sdc1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
 static struct qcom_icc_node qhs_sdc2 = {
 	.name = "qhs_sdc2",
 	.channels = 1,
@@ -383,7 +389,7 @@ static struct qcom_icc_node qsm_cfg = {
 	.name = "qsm_cfg",
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 29,
+	.num_links = 30,
 	.link_nodes = { &qhs_ahb2phy0, &qhs_ahb2phy1,
 			&qhs_camera_cfg, &qhs_clk_ctl,
 			&qhs_crypto0_cfg, &qhs_display_cfg,
@@ -392,7 +398,7 @@ static struct qcom_icc_node qsm_cfg = {
 			&qhs_mss_cfg, &qhs_pcie_0_cfg,
 			&qhs_prng, &qhs_qdss_cfg,
 			&qhs_qspi, &qhs_qup1,
-			&qhs_qup2, &qhs_sdc2,
+			&qhs_qup2, &qhs_sdc1, &qhs_sdc2,
 			&qhs_tcsr, &qhs_tlmm,
 			&qhs_ufs_mem_cfg, &qhs_usb3_0,
 			&qhs_venus_cfg, &qhs_vsense_ctrl_cfg,
@@ -1111,7 +1117,7 @@ static struct qcom_icc_bcm bcm_cn0 = {
 	.name = "CN0",
 	.enable_mask = BIT(0),
 	.keepalive = true,
-	.num_nodes = 43,
+	.num_nodes = 44,
 	.nodes = { &qsm_cfg, &qhs_ahb2phy0,
 		   &qhs_ahb2phy1, &qhs_camera_cfg,
 		   &qhs_clk_ctl, &qhs_crypto0_cfg,
@@ -1119,7 +1125,7 @@ static struct qcom_icc_bcm bcm_cn0 = {
 		   &qhs_i3c_ibi1_cfg, &qhs_imem_cfg,
 		   &qhs_mss_cfg, &qhs_pcie_0_cfg,
 		   &qhs_prng, &qhs_qdss_cfg,
-		   &qhs_qspi, &qhs_sdc2,
+		   &qhs_qspi, &qhs_sdc1, &qhs_sdc2,
 		   &qhs_tcsr, &qhs_tlmm,
 		   &qhs_ufs_mem_cfg, &qhs_usb3_0,
 		   &qhs_venus_cfg, &qhs_vsense_ctrl_cfg,
@@ -1321,6 +1327,7 @@ static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
 	[SLAVE_QSPI_0] = &qhs_qspi,
 	[SLAVE_QUP_1] = &qhs_qup1,
 	[SLAVE_QUP_2] = &qhs_qup2,
+	[SLAVE_SDCC_1] = &qhs_sdc1,
 	[SLAVE_SDCC_2] = &qhs_sdc2,
 	[SLAVE_TCSR] = &qhs_tcsr,
 	[SLAVE_TLMM] = &qhs_tlmm,

-- 
2.54.0

