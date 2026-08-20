Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B0F331A56
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216041; cv=none; b=BzLUTFccCl/yNOZiARPVFhqAMls8yGyCggt0Ut/1hgbPsqe6jHY9axCU596M28dKjE5dONoMe01rh6kK5G/mYkVWjKKP/6EejQIJz1eHSbpafYgZ1sPG4/9wzSTqYwHcVRaTxzK+9g6tQwtnCM/bYA5LYQ/l0vn7xPa3ACUQlXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216041; c=relaxed/simple;
	bh=n7Zs+sfj3JVKbeDjlNAC6tOKobXagwDkJLMc/UeWY/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZDSkvjeAtPxbLUwR8t5z1/qTM1512Gvz0bsi3H21jPuK9+dksHiJK8cJ2F9j0B86hOEdolM+wgLf7A/0PBFau9AO4nL03jbrO43ko1wVg6NM2jUk/1D7T9ewZGPCjKPc0OikH1MvV1aR1VvJUps+n8TcHY8Yc7iCCBhYfIqgzkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnjVshFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CydCZS6R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnjVshFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CydCZS6R"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8Kfgf1680218
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G6rSLeSwhh0joHC9IB21m9Hfs8vxaMS/tmh
	xtXJXReo=; b=WnjVshFVQAzQ8ekq3BBtJtmNaqgiEf8IVE8Rs8f0KJqquwMpibg
	Z9NInt0DGBEQF+hgjc5Lqmiw9PVJi60lF1j7GTJjpWHObHvhQ1iL8x4anPmFYrSV
	9WSEzbNqRY5GUcp9rue0wqoRCdyE0Rq2KaVuclMNrEibg7X2cqk/VhfYyyymT/JE
	+11kaF9j4B4JfNlOF1HMNROE7F5t07BuQiTGqPhpfD5bifqRES7JPvvxAew7HsVH
	Gt1VQP+POGwjJlybBFPLSlQxjCMpeVr/X5YGVOvSDDoSJ4ODevwUrGp8nT6BN9Qh
	xLiLNOuqkbSRcsWNqUhQQsmxCisGfKSZApQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05r3ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 08:53:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so26780855ad.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 01:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787216037; x=1787820837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6rSLeSwhh0joHC9IB21m9Hfs8vxaMS/tmhxtXJXReo=;
        b=CydCZS6RbLwfdACyQsAwgsNBXTw/Ci32En8y1y3y9n9b6r7qs+OX+MmT6iEIWzjeKz
         E6PSQfuY5GTPn9LeHubtXFQS9CeQ5YmIIzFT8QMvcjNrYHKhzWyojqw7hdUPN0kNisJ9
         NyJKRkWnYDX8Lp7eXcP8Txb+TPZT977hAb6Wm3wLtHqANMzjtUTX7h8f1D7XjQF+N2tF
         5vfyFdBAQWM3I9xb8iCUYugTkYsNQptFshP9lQaWC+tdswloK+P+XlzNYvt0JcSRd8Qp
         4+XP9mqpDaURuXhD6dJSB8iKYMlF4X1SHqksUobN8SWmQIPsiF21HWLb417pthvDzrQA
         TJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216037; x=1787820837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6rSLeSwhh0joHC9IB21m9Hfs8vxaMS/tmhxtXJXReo=;
        b=EKmBGVBPf+w5SfjAofG6FiWxp+u/MDP2TDsrMCJ5Js+8G8fjbLBwDrv9GLTIZmCOfU
         LibWxaNRKpujKR60VGauROEd2hmGsY6a5Bj9jluauDg9hAy3lEF7cRRJmArHsg6NJ+Qu
         Yyp1MGq38PviCVcsJNuwRBmpqQYkiorWbyZTObeIJzxmj7yMTNTjfZ6mV2OcWhDmpdXx
         aQUvYGB+Rc+PD6L5lIdFYiHsFWVA1hl+DhcbbcNmY98VTW7IibjnAzrl3RV3VWw2FDgi
         gVXl52lOY/GDbVJc07QPACZUh8K8JadAplRDrlPzR5lBuSo6DdELASxnGuNTQQeRWgjS
         JMzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqTvxcZLnSOc/fDZQU/HDnJQB4enpc2LdZtNUo0b2zWWjW3meE8+ZyDU70yhrlFFc7eDQDhBi0KXpQ@vger.kernel.org
X-Gm-Message-State: AFuF++lqcGdS5PUWNrZk7TktUtmDZiStjTpJYtLhUJ1ONs0ayEaU1oOn
	jFZZaiSvNvFmngO8qtd5KHEE0Ceumpkn6h7lNkVEph6P2fKKzGzVOcJSgkDhU8D2LXDxXEspU72
	y1545tX9vpHCzTMKuS/cYakKi1sYZPsneagbwa4brA0MkZA+NUw1jBLmgxzGLfVLNf9/ALwtP
X-Gm-Gg: AR+sD13vgU7Q3xal3seeWdpvxP3bE2+RTtzaLp2OPnPytaPNuZMrna/w7pFUsgQBG7T
	Jle1MT5HFl5ABsJSJgROG9XGMiB2VrV0Dm0GgujYZJtWpZA3+ed62UFX+PioAkvSM1U2D27Jc79
	53tj0Ii+XE1ZXkrMGYYuHjD0fvs+8rNdJ1XFchY0LtyXWH6NCGp+u8NOGV6BqIAXHEB6jIrWrPO
	2t9CsTd3pSse0TtjxzWArZyDBAFVRBrM92S5hEQmjjbECsrULZASwPZs2GNMJ2KWJEecz0KkXlJ
	MJgKUgnseIS/tumSKzo1+z2Q0Xs9VsWZZBL7j/GcwU20rsbQm9BkFdV0Bf8ik6Dg59eWN/HToGT
	2f92No6fvBzqfdqFfe2TEqdedzPwSdBWM72nD7LcCGtolHTLyjOR9nUlo6CMqGY1P4AeciA==
X-Received: by 2002:a17:902:ef43:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2d5fd7121cdmr217454345ad.14.1787216037413;
        Thu, 20 Aug 2026 01:53:57 -0700 (PDT)
X-Received: by 2002:a17:902:ef43:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2d5fd7121cdmr217453565ad.14.1787216036900;
        Thu, 20 Aug 2026 01:53:56 -0700 (PDT)
Received: from QCOM-FNWBis4jZR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d353556sm4059325ad.0.2026.08.20.01.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:53:56 -0700 (PDT)
From: Xueyao An <xueyao.an@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: qcom: shikra: Unreserve GPIOs 14-17 blocking SPI5 access
Date: Thu, 20 Aug 2026 16:53:47 +0800
Message-ID: <20260820085347.822-1-xueyao.an@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: e7sjse0N-HobMiSarHDDgGhL67XlwJ6y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA2NCBTYWx0ZWRfX4y9BZbfjGa1X
 fbQU/R+OvrAGL/XfVB2FgkzbjhgSqOzAyfpq/hv6dGY28BgTiBG5u8RcZc9iuW6As7DGg7Ma35z
 XrZYWbBEBTwtcPRCfFb8+/4WaF///J6OSYeb06P00Sbx2yMCtR71JdfRd6wG86ajFsJ/K7xzXAF
 C7sbwwU5E1vlJif5TkQr416ttI1UZwgqAfe64TmmqnFNpCLHHQgy8o7Dqop0ajsdGHPgsEEpxmb
 UnLaYp8Edy7w+8H1HQLROra3CgXGqtEfMylliHJThrZaIfJCCtDoyCCmIaGkp9gViQZZLSkA73+
 VEMXtg76zeaguDWGUkPYZb4t1JfCc8yG5uQEyMfXMDvkkRo2k+6KebkjN/Ip8o9FlL8lG+LdbI7
 +pKAM/EtjO2K088MPnFkxeFwBDCZE5Zh+8y3ERmbOKx0iwZp/tqwf+yv7zqUqVigLZp8XFZKG2v
 egyB3YPA1CcFSCeSoGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA2NCBTYWx0ZWRfX/tx58IqCF/br
 FHLY/+LsCft8nY7dEXxPhegkehdtxs/E2eL+uWv8+scweMbq7KNU03DflVzXSOc675M+2+NRiNb
 Npc3rf8bKyrjZmqDejXuXUYNwoURNHw=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a86c0a6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=AHVglHzCgFTiPKyIrRAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: e7sjse0N-HobMiSarHDDgGhL67XlwJ6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200064

GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
preventing Linux from accessing SPI5. Since there is no TZ use case for
these pins on Linux, they can be safely unreserved. Removing them from
the reserved list across all three Shikra EVK variants (CQM, CQS, IQS)
resolves the SPI5 access issue.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 -
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..fde7fc035bf5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -197,7 +197,6 @@ pm4125_l22: l22 {
 
 &tlmm {
 	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..e119ace54e58 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -219,7 +219,6 @@ pm8150_l18: l18 {
 
 &tlmm {
 	 gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
-			       <14 4>, /* eSE SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
-- 
2.43.0

