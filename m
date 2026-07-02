Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177073655DA
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017240; cv=none; b=qqi2qfPO6hIhAB059M5D8gPCy35PsdBm+Z9FxqO/WXPbbGNdJtMY0E6xavMT5Lljk2wbbQADX42GglmcFWHovbNHQ/pB80YEZkcvEZyRiA/T4I5YPXXkAO2oHt+oxcMh0w28CaF0bos+tzXodJE80l6bRFTuz4SWD/P5m8QEu2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017240; c=relaxed/simple;
	bh=EOgfoYeY4WTgFl4ClE1+FDjJyJ6SR4YpCFjo5v99KmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPT8nurmlcCM55WrawqdwK1tEv8By+xE1hEaU3vGYfxtTGMe48mxeLHVFyFD7VQeAydNSSM/84HMnPt69S4J7FtHFo8uT9qwVYDBYQ/rJ4zdfvaMf7TeU5y4PHNB/jzJxocRf+2AjKlfvcG7STjt5F0975jS8hojhS7bj6vb0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mype9uga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECCekEgp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mype9uga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECCekEgp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3Ml2665967
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSuHIjqE4alnqE8ya7F56zil6/hfgju/bRA9V4w8e/Q=; b=Mype9ugarMKcCsB4
	+SyTQaIyCZqdnvchScpItWTZ4uMgeqW6DtvD0aD54VVJ0cVsU/E3aumfyk7Ra24D
	MWvuvQ7Ao1Ny/pk5HF7dFxbdckWkcOaSeqhUhEJey9iD774FjyCxWiBXRcyuXMTz
	poK4lphmGtZZM01+H4tc0zytX8i1lVAZ69voLMpjqxrxlaIsAaNDKIyIIC8+na9O
	6zif2BZtKnjXLEQrfE5pAFGnW6T+DC2RVc3rbo7a6FLWvxhMia1ezMzu0FFJeTRq
	IdfxQP27VUdFIucpSvfcziBXjAMDiLQht0/RkZnmhJQ8o06vGVaBzGE9nW3J8ZZ5
	9lI9cQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc2qtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:33:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9667280edeso2295195a12.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017237; x=1783622037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSuHIjqE4alnqE8ya7F56zil6/hfgju/bRA9V4w8e/Q=;
        b=ECCekEgpoXczpSf9lNtIWL0RZ7L4fM1t94toFD20M6fS/71yycsV5pdi4gYjXsp2Ch
         O9ZfbOfG6z+iLnH9OG1Nwc8yiJmH8B5hpY9Z7dW29GGf0eojiupU/9u921smIPjZHW8P
         ivl9c/M4tNyOE/70L5RzQDOPz2nVW4XBucjHhSQFr3Wn5lsufmuZK+BIo2CZKnPzyPzW
         kdg8q+37QM6+5dxEZSgYvq1bnEWmVS4XR0Nm1mW0OtwqQnql03cekMLI7Arpas9MCpuA
         hyjeIYSokU6INwfLZMfMfD492wuE+yjuT65GMmPjxGC9hKROMCICrEUDg9Wj81LtDAPf
         IMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017237; x=1783622037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nSuHIjqE4alnqE8ya7F56zil6/hfgju/bRA9V4w8e/Q=;
        b=XPOBCkNe5/x3Ioq8m3ww9n2y9p5ca58muVrMxJ+O7E6b+Djonfx7fD+Qd9KFlkXtaS
         SYFeOo68HKhfs7sVg9pOPXYaM162KReqo/k636RDdOoc8kzwBjARbyeHwY13amL2nopT
         VK85YEI+6hpggPnb4+rOqw2OHPPADGTpEAQnK3YYgALKxOjw1g/RNv98w/VECId4NUAx
         apJbBhseIMSTmN3EMdOuQaSSPUCLog1bzEGCh+mr4cuo4cJtqHjEulumqGiIlL3Zc+RH
         628ZFfTBY4m87EMe95ETEPgkJ2dufnsZCsz+GrJgCtXveR0VbwemjdF1Y9IM1oYjzSN6
         yY3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/j1URrYH4zJGDAdkgPL3q0EgKWvoKzDy01zSdk+/1GNTB2f6a8cCDFK+rxgcqro09bryt6rx6mMSYq@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJHaN57+d/nBLp9FmRoyTaMkXHbHzyDREiPlBx6GaEg7ID6Y0
	R4yjpjW5ESpXPZXOhjMpjRnO6lrH9aE5a91+4i8xqcIQDBda0/O3sgBRFWuFyNT//A8lNucqhU+
	ziLzZyz/PwdgEQhOJ/aBAlLXlGTsfVDb1zSDAUUf7hGGXCeLRkuWq1q6mYEmnVx23
X-Gm-Gg: AfdE7ckWmOWTCGBjotdJVz6rI1JVInBwq2QBRoGWSqRvOJwhECiejALv10TayZAk4cL
	427VIQBsNbIRkq4jYVru2vAWX3oWI5MqmMu03S8y9VJnV9o0z6yeP7861CW8ceTqYFoHvHfwYKi
	CSjKxX8P99MVfwfm7RrRF6u3boWhPgJMvvRMcEp6EPk88abdV0Lvvxv5uLvzTbxWbsuxGUjfquu
	PAGy0LZPi0NzeZCU2TvrQttKaNkyDFuUaW6oYffZgZ8zdtDC04ns/wSKm9/DzZlKDdRUl7Luvao
	1K1cdeKtIFfRb7+6a3hM1bX2ENxqRCZEp3tQ+iy5KAn+FgKZ6pks60pGBXnmFJXC/0NK89tSBbH
	ubK7MDd+PrW1IaVdL3nfrJ48muE51hShKRn6tzKTYSw==
X-Received: by 2002:a05:6a21:4ccb:b0:3bf:6c08:4ebb with SMTP id adf61e73a8af0-3bfed592afamr8386816637.48.1783017237051;
        Thu, 02 Jul 2026 11:33:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ccb:b0:3bf:6c08:4ebb with SMTP id adf61e73a8af0-3bfed592afamr8386786637.48.1783017236588;
        Thu, 02 Jul 2026 11:33:56 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:56 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:33 +0530
Subject: [PATCH v5 11/19] clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC
 *wait_val values
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: xf2JhpupBO0GMcYl4WXyQPaejNZt7Xw_
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a46af16 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w9HkOJeuip43wi8LW4MA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX0ThS+A04Ye9b
 BiRFFDGk1mPTia2xzmqfqxTY1Dhg4h0U3+yhARze3Y95I1CwCGmV9uiG/MMMji4/Z1ySbnKNCSn
 QghhsZUXogV674atrCIlD8OkNoMzgEcwuswyw9Vidxtg3tZgRyXerSzA617eKYGQPeFxXesDlOP
 hXn0XoKrW6gIhibvs/NaQuqx0OP9IEZKOAa2B49nPXYmlT1QJaoeyx2bXJ4uiMkg4kvRFo2/T7g
 9lWKHMLVnzfdBICpcOap97fxQXb0R+TH5C6nDFeNdZXGEbPtjt/IgStPNO3LMPu5r7qVS0EQdB5
 E6oHO9rKBOefpgDX9ZDyVHjYv+Yvztz2NLXk7HLxXyhfToYRxQMg77dMWFigcwV4FzRwUPnSirD
 Md5i3aU/sLRwDr3YZuR/j99n+uWhLqK11/cT4y9xwuoYCby4/952EsbbdhkjQFy8/IWR2OACbVS
 shQ3LAas58bj2w4P4dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX6TPxDoSfmFtM
 MXy38OIQFZDRlLTioy3hM93ZHWg16npS1/Mc48edDxmX4hd1ZrrZbWoXJ8NOhtDg0XyRoK8VrJl
 IJyEFHnZdENuKS1/zu5TEIadfliazAk=
X-Proofpoint-GUID: xf2JhpupBO0GMcYl4WXyQPaejNZt7Xw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Update the QCM2290 DISPCC and GPUCC GDSC wait_val fields to match the
hardware default values. Incorrect settings can cause the GDSC FSM to
stuck, leading to power on/off failures.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 3 +++
 drivers/clk/qcom/gpucc-qcm2290.c  | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index af5527f6a6aed94d372f5c54fa353ad4160549fe..39960cb5c26a9f7372ebafd14033bda697575416 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -463,6 +463,9 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 8d397cadc86aaa1666e27c8c4185b9b3de13cf94..4e97a02d942ad23af561ec6ce1ba0a6f61bf5a69 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -296,6 +296,9 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
@@ -308,6 +311,9 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},

-- 
2.34.1

