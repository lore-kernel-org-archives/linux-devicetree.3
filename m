Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1013845CF
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379448; cv=none; b=uFKVHslz5465nrZ75mQf4NGn4daGFumNrirSazvVSXimFEaRFGNEVOPzjEPrJCYTLvSPj4rccQLggPcmYNDbOph8iv9U0ISWHJVqOkGBNyM1H3JWRjhyafZIEXIbWe24mLJ/em0xuvf5L+MtreWj4+Ea13iofbZKafHZnyMhir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379448; c=relaxed/simple;
	bh=suXK+1Q/n9j4OLl57R712VmeC+afReb5v0mwLPIjCBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTSs9eyVGETlOuvfjTTgG4KoIqFic6KTnY19Ih+1mN8H732VReCA0wVcDDzjAveXNnri/JrX2lc0PLOST8PviWBUW2mL3RvnreoeqN7Ed0LQy0Q3+LSnKMaf/EI74YaCwVWBLAClg+cdBbPJ7/9EjbJSDDrtjeoezHorp3lLTt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBWvKCZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGBj3cA6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBWvKCZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGBj3cA6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHLM6475484
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AIZtb8ts/lmF7ZxtyrpGaIzZLAPeVZZazFj9+lqivk0=; b=mBWvKCZ81pWrUU7V
	kMxkEjH9S9mmv5ZA2azdHBZ9fNpZNNkvxhwA/fOAI3+R06pUgmFILdDsfShqWkJp
	Cp3jigJEcopv2vubfcTGoW59BptBl5aM7ATTwAF6lOYMBXuW3ebWNxWxrZQ8W8Sn
	ywjVrBkL5QRCT9BFzJ0BaN0DVM52irITGV8CoJnaOvn5tVKdNSGI9KkVX1OOSRhw
	5v6H0aTe2e2J05QnhtZq3E3dWciDXRK1cDVbtrgbjWydcKRJzo22S5l4qDRp5crq
	6+yzuvSjGmMbbirf+skYNBcNNmmAXvGRsY44/FaU4aYqpa6iDW1DAWWRynBwm3H0
	LZ3RrA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bngsqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so3018270a91.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379446; x=1784984246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AIZtb8ts/lmF7ZxtyrpGaIzZLAPeVZZazFj9+lqivk0=;
        b=EGBj3cA6g4Bh41chXe+WRf5nuoFA/SSsFj3uDbNVTiFgG3A6CLEERn8/Cueole3ScE
         pJOTSbCXA+qYgE8l4BeckG07DDjGa0Gjfbz/urq7fuNUTj15skF/Af/iKm4KGnaFYw+C
         g5sonid60gJdKg8YSWtARn7pKe6FjtgFsbEAr68bVsm+kRSOz99zJLBy1aLub4rtx/nW
         rdCNCSKtomw9TlnZITdUX0lcW1EyramEj9TctEmeaZuiiFQ+IOfMo3EqKtOcPrueLZbf
         CQ7cyX3l5EbpNLXIaRr4kp8F3or8fSXYyIdwEt8PROZYQg9lKNXvTLsjzEfvXwf+H+Wt
         DQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379446; x=1784984246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIZtb8ts/lmF7ZxtyrpGaIzZLAPeVZZazFj9+lqivk0=;
        b=bpNDxfivdBSxCdIUUBq6iSSJzSbxKCPqd6OTIxYXOqm1+v5MjBq+kQ+6w/4gJsp2/I
         CYHbgpbxBXGB2blrfxQK6Ng3l8XRVJsLRGIO5XHMlFY9RCxEq4V8a1gl6PfpFWOkH7HF
         W3D+tOe4+1K45aifTYEFqI0L93sUvA7eg0pSfXC1Us1hRiYGNFYRV3t8DQWcaqDpiz43
         E27JiO9vxyyTDHEiTVbO6gRQzwk5M5VBLNyECRnfa3XWnw5IzVlgJQkYSwIYTInUDISA
         4OqqJPCNZgRjkz/XVWrWqBQO3t3BMxbjIMekg5u86Ia88L77frxJ5EVHIxLUi+BlJgWS
         Josw==
X-Forwarded-Encrypted: i=1; AHgh+RpY23XtQN20zpIrmmY/HuBT2UOQepnCQdFiyLpPzhABeC+G9dAPBMCPvGmBI3duU0I4TZP1qesl7NHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwkK7WF8BFA2GDVCsf5WuHe3DHYkPHuqXdOQTcIS9RA1yfP27L/
	rpOT5KeFQNQlitNX8pTGmX2ezjxcZHlldx39esRAvT0hMZV7CQKvk7qvlu17CNT+2gs3pkNSirk
	87G3rTa/zgnE2RW51jaN0Syn9TrOAzNgffg+c81kDz4tjfHMAw4lDadbIc79eGVdN
X-Gm-Gg: AfdE7ckGiFOG3QAoUV5/3acKL9EXTnnbiUXgjpvRYSEkwYFLHtkhtvSSv2IK1jGFx3o
	YOQQZ01djEsHUXQ6oc81C7xh84FZDysYtPpWvJlctOSnWluk4Z7MB7NCLyqoAVNJh2HjSWIGucT
	57/oPcQJCw0MVVxxnkGthbpCjqrYrZjG/DVexwTnq9AhSQHB4IfxGKzCld/9IPS2DGZgqmf5tBH
	CeYIz1L8zctflJufeVEqm1kNGkOVAqWokgbqaRVQi+5ITnypEO04GUO/FtMva+lPlJLVJxVkbua
	tDVWEc5FKLRoMNLKT2TxEHXwtzcD9mcUMrQsiU1Xvf5hUZNkUMw5ynWuNvnSwy4faSupvIxpmFN
	9ZtRukKSmvsaOovVhKvv/OUU57s2Ob/4=
X-Received: by 2002:a17:90b:580c:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-38e4b410109mr7174401a91.12.1784379445949;
        Sat, 18 Jul 2026 05:57:25 -0700 (PDT)
X-Received: by 2002:a17:90b:580c:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-38e4b410109mr7174359a91.12.1784379445494;
        Sat, 18 Jul 2026 05:57:25 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:25 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:17 +0530
Subject: [PATCH v6 10/16] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-10-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX37hzYxn1luQX
 vfKsUuLm9ftx4aqKIy84Th5iUVn/BbBz5kHw8gptyBHiBCCkWHE2Hrg02Q0itONaOk5gttAE0vt
 uRhXNQp0SBnznBahnO2RYGf5LpWCxO99uwWQB1kAeAQCBcG7r6VnhGWb+wWJznadidzMnRk8paU
 WusNLbwccXjV8hMwaoBWh+WTrrAoiCYdK3uzGvGdb+IRs4ddR/EFn19T+adMqqy4jYkdNdPYKpW
 8wjLBGaCO9OHJBRBejdKHS6oTlFMnBn2CmYFmZ43xgJqCLaA5Bdx4essRSyZUPuCn51DNPhFLIj
 f/7PNIGS5OylR/0JQwp9+dMBpYArfAZElZ85WdSsh3jvnEXehgdI+Dngz7yiywiviDP17Pnwqk7
 QdZoHZmqOxadDQI9gKV92WTUN4rBhKF3BPxvfjMZVNUZPKyZ/qYq4WU/wAdDXoMrxLMonGpM0hw
 8t1949TJnbUhpjEXEcQ==
X-Proofpoint-ORIG-GUID: qhmIQHU862fP1vRjnT4DEfODZeOuPOsu
X-Proofpoint-GUID: qhmIQHU862fP1vRjnT4DEfODZeOuPOsu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXynzoPwt56xMp
 N26QR/ePLrlTHNbiROGGDW4kIQ7GYHqXNuByXkAFwscD/NlPkFZBckezlJE/Lk3XVHBVPjMZEB9
 VLu8O8zmeSi+cCw+ur/9qq61IKtcuXQ=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5b7836 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U57akka57KfjTRmel4gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
similar to other critical clocks, since marking it as CLK_IS_CRITICAL
causes the clock framework to invoke clk_pm_runtime_get() during prepare,
which prevents the associated power domains from collapsing.

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index b19e8910931d85ceda079c2745eba37e18112955..78797b77d7c7ba053201064ace3963cf2bd5281f 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -148,20 +148,6 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	},
 };
 
-static struct clk_branch gpu_cc_ahb_clk = {
-	.halt_reg = 0x1078,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1078,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_crc_ahb_clk = {
 	.halt_reg = 0x107c,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -324,7 +310,6 @@ static struct gdsc gpu_gx_gdsc = {
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
-	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
 	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
@@ -353,6 +338,7 @@ static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
 };
 
 static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1078, /* GPU_CC_AHB_CLK */
 	0x1060, /* GPU_CC_GX_CXO_CLK */
 };
 

-- 
2.34.1

