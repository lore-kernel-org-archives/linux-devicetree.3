Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37AF3C060E
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550827; cv=none; b=TetN1Ulol83oW+sARbtG+1A3r7E0SzjELUA92KlpxBp433vzLDdJ45kp/vAI0urjq2M/4ZrxLXfJZCuTYs8bdg3JbBLy1plhMIf9B8eTIHeSgJnO8ozrBuq4WYsbL0WKnrtF3DEpG0CqUnpLKus3Fe5rw/ctRtNbKZ4rYE71vJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550827; c=relaxed/simple;
	bh=qzmO9vTT9ZimsgS9gDOezDShy+F93qGz6TXjYzvqf8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgooKR6RpBUk1NYTV7M+eP9vayRnq9gcXsY+MrqG9pwS6K+EM0fiGxzaBR3rknp0ezZb1C5lTF8RgRHd1h26ubDD0FY24zoThpUZfyIQpwUhCcm7cgWvsK/uqcWoulRrn56SyvVWoLSNLi5nQND7hsNxp7C5mENXnqzncCwcQCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsGIYaoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnGHmC4B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsGIYaoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HnGHmC4B"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543M3k13234783
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 05:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=; b=fsGIYaoEXq/YkYZ2
	h58HKfWQxZW2f4Zxl3CNMFxWjI3SE5jSZsLv6sj1J0JVnS5fTfmlj3rn60oYHWFD
	LtLlBzLAcE4udR5ABFU6LeuUc9mQFBnINB9yGvmbpNm82pYc704fjKgpZAOXR4eb
	jZCugHGX6K8uIu9dvMGUbfE0wHMy4FkTtPPm/AX6eAMSzHL64BUFC8eSXbcwb8k7
	jFUz5O+2JPP/e9CwDY4j8DGhzYi4JlZXjemjYNhnxEW+xNAj9b6iHncI0qxIIrRV
	KMGjE9fFKH0ugqZZCa1rKKNohFRMgGsbzNLtlQG4JMEQBNO05gLGE2wDmYCcMmBq
	hInUmw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s24qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:27:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423efdbe6fso251543b3a.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550825; x=1781155625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=;
        b=HnGHmC4BPKDaPfQ+KmTrTJgAbkYzjdys5FjLCal9h2x8a8Q74MlqTGs64rkQaR0iDH
         itv4pPAwBm70a6AyOtVngcBgT2bQVSR03JC/jbjjPZ8IlcJTI4kXoFQCqHsOdJ8gH/Sb
         4sjxZuzHTBlpNdG1Xtcae3HlDd/eKZCsqw8gXKbaylEFg/9OYFDcXd/KPh5DyMgYhYwq
         Cin7yuDpjNrkJ6cXWQRB9ztNSoORjg9M2FMzOozTlqXtebTJjh7hi7HFNi6FofpB5+b1
         Ky1WHRLUJPTMqy9tPzp3co8nVCmDVVoO7+k0ElOaMmHAOx2COhISuVYf2Z+5VWORQIju
         NEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550825; x=1781155625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d9rxV24LmCwJGuS/+x15NndginwjP/FOCBgel1x+6cU=;
        b=aIA7ymEdTHhNQg6D2N2WlH3+f1vx4X3V6F4FVD8NvLI2r8rpJBflnLQIl3Fekg226Y
         JqhBoIz4ZgGzB4++vFNEwVvAIRh06N5iVEmijs42QiAe/B+BX+vuOMxov6D1PsXMSFbH
         QuSwB0oAkcmIOR0WxmrbKbDdQ0oi0SNS1UgMDS7X48F8CB5bkQLxd1m+kNzzu9R8Cozr
         L47LlCFP/o3v7D2Ou9QUBWHqWPpxAujp8JgtnBJakt99fgI2d6IV2ePvT7mLIjXPZ3NU
         YTuRbOgxixtnvD2JUsn4eTaegRqHaIKeLxNO1I/iWvj8kSXTqW287LA3CNpaiCkjRaFV
         0wKw==
X-Forwarded-Encrypted: i=1; AFNElJ/WZ5D28+U15zk1OasAy2uamI7iuYu1eQmOs06FDDKmD4nKKPteFdhoSIcMLA3iyYZRWysRZsLn+ho+@vger.kernel.org
X-Gm-Message-State: AOJu0YxSp/5KfBUbbg0SL/GFspRHLjLdioOWYnRtN+pooWFTWGrFByVY
	DxUGpJAp+z8oU+4viKwd1MsKCSpUk88NfvjT5nDEg4at7ZTlWK5fdkrUG0uZYQLxQWuAT7sVnrU
	xMALEHCe6aHBmhZyrTcjEhKRgE+AKeyLCa3HGuM4T9mpWrjPcE6CpXqZRPV6GSzLZ
X-Gm-Gg: Acq92OFkZ2v5axBZCRUDS57MDpW7yuG2lSh0n/1wn2R6TKYzCZbhO7DUwdssSeV5KfQ
	GyD2Zfbp4yLJ5ignh4lmkYtpWqY5kWkit0fnrB3CZ0GueL/khQCi8HSw209nf42BFORRpdHSyjY
	F7VWWmZqLWo8BaW+bl1JgUqGk1Mabm1bpQISoCXPO+S6natmGjZhBMrE5BdnNkWeYx+SbYHZ3ej
	sgh3dLySfQ9kFik/x/lzwmlJ7bkARcmOt/ncAqnebeybkezVpXfg1k9eWEaQrIMYP3IYerZH8yZ
	KvUVQG9OTWy2/qDrmRU+a3z9jF677abrzG0JfJ6z9KuhCju5vL5krmF7+6VRSSmwtyhZJVh7d5/
	K9KAmIQF3AJOqZqsE6SJzxLcfv64xa4dU0rM1dae+pK3fq1aqHFVGoD2CV6J+zJg=
X-Received: by 2002:a05:6a00:429b:b0:842:614e:cc9d with SMTP id d2e1a72fcca58-84284ed9586mr5915290b3a.27.1780550824686;
        Wed, 03 Jun 2026 22:27:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:429b:b0:842:614e:cc9d with SMTP id d2e1a72fcca58-84284ed9586mr5915255b3a.27.1780550824229;
        Wed, 03 Jun 2026 22:27:04 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:03 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:13 +0530
Subject: [PATCH v4 07/13] clk: qcom: dispcc-qcm2290: Update GDSC *wait_val
 values and flags
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-7-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: eMpKeZKa00WE-lmZ049yLvWgVKmHWzKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX9pCMYZQsqceb
 Eq7MEi5FazpS1PrYi3tS+1ci4Bx5SoVebD8M3X0q7cSyndqy9XFeaAqS9I0NNEMN0uex2r0bAOh
 2BRkaVLkIj1u/iC9tLI4txNyAmd+jLiz8geyPga0l9Cd/eRJYdDwOwC+OdFis7aw7ZpAsoWDj3Z
 OFvx/d98huS4HqOWRgccyipWv0gckFGEjkmMefEmV2sNUbyvLWrjR8IAXyXr4BbZMAURuQIVuq8
 Z5GZHu6vqnIc+iEteOlOD6VA0PiXmGwdGSJ4gRYeoVwL8lvD7E5PCvfVg1z+0JJzhxj4AOZJuVG
 yG7DM32Nt1QRkQclw2PD8oHhpc8TnM6ed85DgOdKxVEVjBWOJPBlzIwOk9dbH1wlrGxfQhbdQ1T
 y/zWFbjMOydKc/QiMpIRjrrMKY4UKQfI47dOPdEgyX/Gxbmizify5Nbp4bRWsDqF2D5rEB/B+Sa
 tQcexOnZ1PhnEddHZ4w==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a210ca9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=USgIuZEjIA_ZHjWqnmUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: eMpKeZKa00WE-lmZ049yLvWgVKmHWzKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

Update the QCM2290 DISPCC GDSC wait_val fields to match the hardware
default values. Incorrect settings can cause the GDSC FSM to stuck,
leading to power on/off failures. And update GDSC flags to retain the
registers, and poll for the CFG GDSCR, and switch between HW/SW mode
dynamically as per the latest convention.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index f5dbd19d0a0334362a44f91a69229cb0f018f309..4c1eef79f41b6907fe79f2b18bcb5f6160c74a43 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -468,11 +468,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {

-- 
2.34.1

