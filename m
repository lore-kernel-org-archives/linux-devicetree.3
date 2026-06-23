Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1912D780C
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219933; cv=none; b=NK0ikZ07HcxsXkCasdiR/s9GX1IyfURHjyOqts7af2RpmQAEza4LtKXC5uEBVlnMM3JzngdLXM5EyfeUNLIv33FA05TxbKYzjp8wRWraRj2NHe4hnkWPyFDdMXu0Nhfv5lg7kdjJWRjWo3VEfyouYqLlJ2uE98Y0HXYA0G8rtQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219933; c=relaxed/simple;
	bh=sb3Uq6ABumgwjZWgmUAldF69UC0Cn8aYOQo27nojvoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J8D5gZMvXymWrlLPVJ5uc85HAMOV/o+sV8vk6xsTpt82u5bASu6bTVKuzYU/+N56ksSJ9LPIXCM1fBKmyxuvCe1QS5MmySNZSBNUEuLYcBGPbFN6lRPeDC/SdtmJo7QhOOcJ+seY5it1OXQQ2Rz4Smjg/BmWu9OOu1LIJg/S5QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaAhBswq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/71Zr0S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaAhBswq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/71Zr0S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXgDr3753493
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqqWgWbsqz81pypmzJZH/tJYdEYApnGUfE9Tgwj7tuc=; b=iaAhBswqoYiwV/Yw
	d8c+1pmd/DVTubskKIa52iaZwp26rXvtA85b/7unmWqJ/mnAhvHCidvZFtQFp/5l
	KYURbqhfxFzr1YV6NKEhiXgJNwk2XpR8jRfJ7+N1j2yB7bMicmFn23dNEVCr4yOI
	JVqjhcC4/kbEwShg/04VGat80o3s5NW38BVMDURXp9E+XblNjDKLxs9ZuUHLFF9q
	lJWWnbLlhgzaS5UUUc3zpz1HoZ+QlRYAfvpzXRCVfDxC9MPvQqLTQVajym8VdqzY
	ji/cffhzLvxT1yaMU7P1XaJVWUOm2toQkY0nfdG9dnHCw+bCNcoLYYOLr1x3/pOx
	Lw4JWA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29h86x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:05:31 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8067fa066bcso16814637b3.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782219931; x=1782824731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqqWgWbsqz81pypmzJZH/tJYdEYApnGUfE9Tgwj7tuc=;
        b=D/71Zr0SQNtKeeXSmO+DbuyKDMPhc+EOihQ2NA0nHDkzVXsvUoOrGvZ65MS2fitxKV
         h7GNxLDSRTgZ7Plw06z+xBbYl4T/A59rAW3q8JyRsguc2YRFuWTDOwqXmMXdIVhdouxi
         M4SQQEWJYZTHbnSIE/GNJqBx8fQwJZOS4XNM0Nm9IzYqI/xE9ZIRoQwoa9sI83uMzWu+
         DNNfs0bPdswW7J3slIj0wWjWzfuaP4rRX9jmh9BjB8gFEblxdMJiUTXugqBpa6VF917z
         8pcXKfP113OuFL6Ux88ZFTCM3sWoFHkehedi+rT0NXdhMkcOg6L52V0LF1n1N8EAmB3l
         oyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219931; x=1782824731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqqWgWbsqz81pypmzJZH/tJYdEYApnGUfE9Tgwj7tuc=;
        b=ovaOXT24Nku78X9v6Z97gjtDB/lLxQWGsRLnfUFxLWKSYGf0j6pzp8EqnWB/mWir7J
         gbJ3LWqBX3bKIS2dQ8yv3XEfomLeKmkkHbLcTMdwGOwpbXNbzCIs1ho4qtYYD0745zUB
         F33TP9yW7A3zo2Hwvj3K8GeelK1r6XkuAg1q0NiHwITlFhaRaJ5QhEzJkmtBe17cMTOe
         kA9FHYbU27Y3r/DDcIyVE3yAX79pzn1TMcRVDeV/qr79ohAbdxCw/8HRrD4eRtjBCiGR
         XHAfTUC7hWOXcYd3zrfKeW4hay2YZkg+rSyOiTZoOP/Vnk5OH/XWM51QchB9M5tST2KZ
         OSTw==
X-Forwarded-Encrypted: i=1; AHgh+RrcNXnKk2H800e8Pg+Cm8iijrfZou3rXE0tduX3sshLqMCyVF1cA6Syw617n3oYdKsPIdv6YcnXwsGi@vger.kernel.org
X-Gm-Message-State: AOJu0YyaFUr7B+UPDn46aYBz/KNpf83tXty77357D8zCC1RGpEKSbmTC
	WouIWk7X4AV7A246TK4LV0fBL2i0QvAI+Hth0TEvwHivpnS0mPuuXU35QtaABQDHNP5QK6eqEN5
	FQa9sMXPgoVqUFRzvP7mEusHdMSSL31gJmhy9ExFW0gDRTiXggf1KTwMX89Np7Fap
X-Gm-Gg: AfdE7cl3uuDE2qcAIMjzeQQ9BXiQqE14+gEhUW4xJJPGGjJ3ciOSPiCKmCrP5H6bSPq
	n+rkCAHd+upTfbwh+hFJjUljadMnBsXv9XoEa4AaA0aJZSgSWqV0pmMm8qsraGIIY2GVvTWORCj
	e9M8dQQl9lbYz0pFSMD3vAAbYOckTih2uiXkb/3YbJYqL44OsNW0MhYKr61EkGoNEu0qkjEH/e1
	MuapLcxZDM6H38t9XLNqTRjlULLCui+m4H1SU7Q24M5SHIQTyxkxZi1D6AZbfCEp8lzY2H8OCg0
	T9uoEL54H5y5E5+8GvbwpNM7IYX2JRcuLFw/tdgsTWmxeeNyUXP216G5ImTtCfA1VU3bPkgCEjE
	XKLrWZnI+RIvWpqNp5VEXo8ofccN7AyWWqjjAflZGsoreFx+E8BFpP9VXIw==
X-Received: by 2002:a05:690c:ec2:b0:7b6:7df9:33f6 with SMTP id 00721157ae682-80670e47f1dmr40183887b3.2.1782219930656;
        Tue, 23 Jun 2026 06:05:30 -0700 (PDT)
X-Received: by 2002:a05:690c:ec2:b0:7b6:7df9:33f6 with SMTP id 00721157ae682-80670e47f1dmr40183137b3.2.1782219930078;
        Tue, 23 Jun 2026 06:05:30 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc700bsm44091127b3.36.2026.06.23.06.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:05:29 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 06:05:18 -0700
Subject: [PATCH v2 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-phy_refgen-v2-2-4d15983bf91d@oss.qualcomm.com>
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
In-Reply-To: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782219925; l=1908;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=sb3Uq6ABumgwjZWgmUAldF69UC0Cn8aYOQo27nojvoQ=;
 b=lccl7A4IcciL4lCF44EqI5hyhq94HvqgY9ftKfLfzIZ0mHnucEkAgZ+GqhMJK9q3M8A/GlLk/
 z+ZdNTNpUopB/fYRJbsUZXijtJpSXV9Qk6RUmak86gaNsU7K5SFHPDv
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a849b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=m2jQVEIWa0EwQwJFt7gA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: Lv3oqzpIQj4FUeQNAzuBMS7LneW5D5Qc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX4o72wYEfMaMF
 2lZA3ntbTdXA33NrHUgUJ41o/CSZ1oYeuULVWT23dnlnq5HmqGrxEgTOm9pumSqFwfmQE06QHjq
 SrxUsdChFQoHNS/ORdgd6lEjsySAxkk=
X-Proofpoint-ORIG-GUID: Lv3oqzpIQj4FUeQNAzuBMS7LneW5D5Qc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX4eoSeo+loi71
 /ifD6FLaiUXTbVQERjC14T1W7QYl7wMPdmcSatOaJDtOBc4zUH46noaDejdY6xMlx/u3lGyTXZf
 qOJeDpyQWIKKC7Kdg3CpmRKGKQeQDRF2f0OtSmfCcmJNJooxO85ChFSbWiRjSRhp6fyqyz9ldjA
 dPkUIOSr/jF4dSphTUx9EpQqXO2lmIoJkmmOt35uPzaO/mTWS+eDgp5SjM0EN12SGIk3znSmLi6
 Gl5lWJrkTPWFiY1hxuAXBC5S4KSyfIrBGBZ3PjRI1XeRIj9zEoNqPIUoyCe59U6gVVXKP2J4BoD
 bOusYhZoNbcK+WnRjX7bobVPEOF7ZnnXZb+xH6LwY6CCAV8rn7I+bqgMDt4qi34JNrt7rac1z+L
 iT8sy2z5+5GAM/l8Fh+3d5msSHzKLd2nolyiH8l88MLSfhzuflHdR81ENUX0U1zKYfEoLHWJpi7
 kfm6ehnt6FJUTgrTGpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230107

The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
two power supplies independent from the PHY's core and qref rails. Add
support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
glymur_qmp_phy_vreg_l list.

Update both Gen5x4 and Gen4x2 configurations to use the new supply list.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..08bc89ce80e1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3488,6 +3488,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
 
+static const char * const glymur_qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll", "vdda-refgen0p9", "vdda-refgen1p2",
+};
+
 /* list of resets */
 static const char * const ipq8074_pciephy_reset_l[] = {
 	"phy", "common",
@@ -4756,8 +4760,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_50_regs_layout,
 
@@ -4772,8 +4776,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_regs_layout,
 

-- 
2.34.1

