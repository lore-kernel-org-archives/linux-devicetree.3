Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DDE3C063B
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550843; cv=none; b=qTp5J95hoSaQCSbN2JSzy4pV9PJT7ehuvO3EjdGxB5PiqaGJA+xSv6l91Ud1PAiHFQw2vAU+RaMj880IiF6TkfYAKU/GDJLwqqINVsLpCxrtRfA2M7U5NgaIPDhwF+ZofDBpm8trRUReWE/+JxkFlyAZj/xG0Jj3e1Q1JyvR8gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550843; c=relaxed/simple;
	bh=lVc4njKqOhZzn4+GH1LiG7VTyYhJso+ZprzY1j0MwKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RrW006lM4bqPq+zyrNoETXt1Tl7TYUKboqr0Wh9mLxqcNgb9ibVjeB4Z9asfogrsXSpjapKI3A6+E+9b5I09lT3V1J6AeMGZlBUrkMVq2UAhDQifCB1xva9KsyG+2oxBNqiYH9972LxyhbHvyzLG/862Fox6p8hNQzzI+XPjNjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwvoqv4A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvUqprfD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwvoqv4A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvUqprfD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540nx55313682
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 05:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=; b=dwvoqv4AuC4unBMq
	nhYnJ67hAFTMG5T/o9K4KYGLXW1iNlIQoYESojVLtTwgVjeC39zEjGFCyx3iEmD+
	rEs3qBCD2F9r/HVEGAWr8/ST90LblqfJw6Rv5aVHioCqOWy/blYrkiUAt4nLvocv
	r3UYSuhozTD5X6Mvb7cvQSXYPjg5b+TpDZYT0u8HOjn4VD2PXIIYrlGq1A/jMM5s
	1Y34vvLOjG3/kiin6GRulvEupdt5GKPZ+GC86PuIGHMiByPE7A500/JSLoTowH31
	4Q9GEnh9++/a4y69CJIMjp+xFuYcpLNaT+Un5IOMKF0m7GwLCJuiEd/kY39Nq/Ak
	32lCAg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v0sv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:27:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423970cb30so245949b3a.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550840; x=1781155640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=;
        b=GvUqprfDNWn8DYI9gfHNJxz92j8x++IpubqRAsh78Vawu7h9GaBOM/DmbiirWixU/m
         3F7KjoHTSKPPVQgTQbEqFcOIB+SGLiWNPuT2wHwdDMM3Eg91kgOHWdq8qm5O7+vhWLz3
         lb09pG1+AfRpCUnOpmbX5kp6r9alVNang5rP29YuyrhhKpX6ZVVe62pddIwNHniukS/8
         inWBIlWlr4pBy08/xMKh6MzftI7fIvPtLaIcZWlrayZQJljNpvTU7KVxUD7cOzdbKDot
         YAozlXS1MsPmMTN2rPtceC/OgSZFIJBiC5os2H2zO51ndVBq/OSQKZT/xQI7Eae2/NlH
         DuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550840; x=1781155640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=;
        b=immIVyMGIYPU77UX2uyN51lG+x7n0BDBtMJWNT7oaWeBLG/unWp55l0bu5X2fFp0PO
         TuMfTNxIXwr757cSGdUFS6lH8oguPEx4RY8ep2Ub8reTVV6+ZXimG3yRK/eyHRLcAzfe
         sGa3Q5O/rTnW219P06xjkGSwzObyUQZqhAsw05p5Feze+scLnmfSHb4MPiMAzh3ulmAY
         bsrk7UvK8scLkXcqKoW8iiLyakEqBvWaRUBItCEYgyY/CZaQYGT40ygfA1uGjTL2aX8L
         8agBEHD7eEpWGoUtB9gsr9yk+iabNzjAXpURNXl5YG/UoyuEPkHnjV/XEPWPLJStFxk5
         CTNw==
X-Forwarded-Encrypted: i=1; AFNElJ84LYyI/FOw35NJqAD8cSLHpU7+3CCvwXMHQ5CNY84+4BFTdKJRBS4FYDkdEm/jO2FvWaMY7eXg3FcI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/EOdK4TZ1dTd7sHUYvTJI2riDzPYPugOZik16DZKLHscOKJ+/
	0AbGdYoFHdO19LOiijLzHZi0lOekGqEF4ruelMuYvgOzxmox5eIjpdCpN3W2Pmiq345NAn4usuk
	YieiQo51UhLNDS1rxu44zqX/LgIB18GbUMCt31ylryIQl9dmMeixBXusTut6RRwCJ
X-Gm-Gg: Acq92OEmijiT62adWh0qnUnc1JfT+psVqCwNvzAdMpdz7xYsP+Kr12gJ5wW0Bgl9p2v
	0Mus3fbRa6oN0J3JUYH5orekODxom4fsjymSlYC/YsQ3UwFbaWomuLxOlJcUqb4q+yt3OpX8jSI
	dBO3kNJLmwjir0fWkDL1ts6jkVHrRxHozzz7uHJhNoMATneuzrMZ3N92B368tAmtWJtlsradfHP
	ztvZV4FU+1fGT7eiMAeglN2EXKJInoEGjtCfHZc1HQXLqo7/wjnCRQBa2Skyriquj/USCFSaL4Y
	eUog/ZEEGGCGHFfR7pf78r2EXpm6VoAym/1SfkuzbNeJqh1N7iG0MQdhP6BZBE2UJiqYrdJZcnw
	01+bUTPowgAs9QVxUPE3dV+9CML2x10aTOCQhMWydADP0kIO6KO2Aeh2xNdW+IuE=
X-Received: by 2002:a05:6a00:288c:b0:842:569d:b10a with SMTP id d2e1a72fcca58-84284fae3admr6234629b3a.49.1780550840271;
        Wed, 03 Jun 2026 22:27:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:288c:b0:842:569d:b10a with SMTP id d2e1a72fcca58-84284fae3admr6234602b3a.49.1780550839858;
        Wed, 03 Jun 2026 22:27:19 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:16 +0530
Subject: [PATCH v4 10/13] clk: qcom: gpucc-qcm2290: Update GDSC *wait_val
 values and flags
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-10-8204f1029311@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX/rSHhl7CFyZi
 yn4Ibw5dIeODvzxTa46addlaA4IXCeyGpx1TQwwnl5Qyr54UVJKsiZqacgGkmy/gaWvGHrI2iK7
 HTjRlQC0dyomYt1QILLMpfNUeA6gSPYShq8Xfp3rSYB0laOhvgKnmcmT7LIpgQkfLsyQQ1zd/rE
 bPsM7w2yYwmzxYhT2Adh2vkb/ik6ERoqopCRGjmDVp8GV78/oGV/nj4Lt4MOFkIp8E9X/yV3NT5
 uZAWm+NB3ACF01ddc3ig5gqz8DyBQtNWfF3dSMXsMaIdfohm2KBRq685lSdeZnN486zqraAnghC
 7y8w9oUKEMW+kv2kWd7QAcSUiaMhKLAmPxcL6oqaSTJQzBE0fMwrv3Loi8xvX3oC2Pd1qyxIJvh
 4VMZTay04Wq9znZRzYX/JV1oepb5Pwcj4dYo/hWTK/ZNwZj3gwAUtQxrmeZlqA3RnGqPunfdxSx
 ZlXOMiCDgNGlq52mClA==
X-Proofpoint-ORIG-GUID: WOrMQf12OzHzpZoA2tgqCPpgSUyCHj0l
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a210cb9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0JU4rCqLU3avs8DDqI0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: WOrMQf12OzHzpZoA2tgqCPpgSUyCHj0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

Update the QCM2290 GPUCC GDSC wait_val fields to match the hardware default
values. Incorrect settings can cause the GDSC FSM to stuck, leading to
power on/off failures. And update the GPUCC GDSC flags to retain the
registers, and poll for the CFG GDSCR as applicable.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 2150b94ad0ce5146c47ae21fae4deccdaba20673..6e696cf672923495c789055dcd2ff905d1761e16 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -270,11 +270,14 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -282,12 +285,15 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | SW_RESET | CLAMP_IO | AON_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1

