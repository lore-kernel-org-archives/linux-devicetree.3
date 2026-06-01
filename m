Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C487B32B103
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 04:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288181; cv=none; b=Jj7mtqbjlSG36THgHCg8PMRRZ+NT5JXfo0JOCrzFm+OljKtArQoVDnUudXFzApPEptpchWvQ/woEUppvRsKNcMHwHcxHhONVWzUqf+ZMBYWq2SYK/ZLhaTCjo5guY4XJViFNCSWZ6eSlijA/cwPqURHHhV5SvYSrsgk9rPt15LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288181; c=relaxed/simple;
	bh=aXRQZElnRbpEtEVaDUl5up1XNmweAtvQg9gPf2/3Jqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECp5Tdsfya+NYn43gFs8td3LhEaeKLE1SJRBtBS6mZru1IjGYS1YxQ5sib3/oh50mbWNF7emP62PFmSHswfTccwYd/pKgNXN6LeJZrNIbFrmEuQmi2Vtni/gMO88NJQaHXeqyTQ2tSKJUuUdXFlHmKWwdqp8FqofaQVm6d6BxLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSBnK4IA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bf8J11yX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSBnK4IA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bf8J11yX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VM23UD2734613
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 04:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbGvS0zEQQggdhKiQXoet088MbZofNJ1U1XxEt0bKsI=; b=SSBnK4IA8dgg5f99
	Wbpwj0xU8/qLTacA4RG00XkNBRxrl05XhNoFyaBQYauNYF9mHnrYPnBnsTGax3ms
	5VGiCbSd1y5zTlO5+t/zfhBzHZ9cI9aAW1CxDBhfoYByvdrTREc7GZGd6AP2mQ9s
	cekiRQrUBbDVHAlLJWsdzgSNKAR5PWcT682CMzkja2y4ewT4NpTkpaIBVCSQaAEH
	wIjT9knAmACJlLGw96ZenqmUYCey6AEnEu049zE7DXI6+L75K08lbwR9yf1rAuvl
	WBYgcRa+pM+cQdnYiCrAJMvjcd49csQKyqsM/6VJPOE0s+3+WCN2j6dgNm/QYHWR
	ZSURjw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7vvwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 04:29:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32259e0eso26302935ad.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 21:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780288178; x=1780892978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbGvS0zEQQggdhKiQXoet088MbZofNJ1U1XxEt0bKsI=;
        b=bf8J11yXdcoqBQuyWAtQNFbE8JCgDxhCpJz3N/VtJhBaja9FkRdqpLbgdbiuicXZww
         uMR64SpYzyPSa6N66eYzXr56sUpSxXx0MxyPyW+p8vmhAhibGSJULQR8apv7hL0bqlJr
         arWAkt6CYJSw3h6s7ESTzOquMYwdOYDCjmwB5vxkXBfpvz85GoXcB+MbP/XnO/gFS8MZ
         jRAm6csq8CAKtc8zxb6DyDn8wXeymNyknge52TH87EuaiwK9AlRMjjNeqPianFBS/Lnp
         nwPVwy3qm8so0BiTFq2YaGJcH0ME1FH3Jizdttr3VDQ8XuPzESPQXcEAsUIsB2cXPEx7
         vOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780288178; x=1780892978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FbGvS0zEQQggdhKiQXoet088MbZofNJ1U1XxEt0bKsI=;
        b=f4EErRPCOBxZkCtLqh460Yf5Yv7Gl+8adznRKtRtsZiYM2bJcldnLATqmF1tAqSpyG
         L5RO/Jlr/HP0CBDfnKoju7M/FFHo/NsZAqAXw8zRj0CsPXXF4ev3EfOV1f+fjQlkBULv
         j0ukW5npBMtU/WZ/AFaN89r14LpFLx1Xejqx0Lk/6UGVaz2qi4szTJ5l/cjkIodcG2/h
         knjSXkzGeIxSrMrefSiM8SNuzoWnGKpvmhIqdpNjBbv8OtkNhdu/yFxJvnoCQYIVQwY0
         1ZLv8hhPVSDncxmsDHNWQJMF4bY6HoCcBhtd4HJ+TXEo3Eq8ypxUZ7NcuuoxRzWCIf+s
         PU6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9gvo4aF/yhks+6F5bNTiO4Ank3W1uWbAaq3uLGbclDVfpJsd1riSOtK7rSOZTJQSHAnj46bEkGh2zs@vger.kernel.org
X-Gm-Message-State: AOJu0YyMIoaeHRiB5MdcyVnR2iX3lJuzS+5GNztooaGLcWOemkFgeHk+
	Mm62HtE71stlStOGb+hYCsFZrt9wmeNj5Y5pxNSN+2426qFtuy1zu8f8s3GRLl2SkNB5VknIFmX
	Inc5ex+q4+s6/hqbqiahk2FOsoOGaqf1fFgCjxcUesUDUuT0sX1fB3YhDl77Q8P37
X-Gm-Gg: Acq92OGcRSBn/n35H78PntZDink27f15xErIsK/utCVkKwl5X5obx4a6vK6HOg/zeA9
	rYYw6BKNtJMyBSbvXEI33AaAcpa8JyNw7HMngpv6sKN4R2aazpUKp1/OXEtljWKJSun7Tm3yMnY
	P+3+ht9Utylz39s13RKiF6jwKQI1nsk2mCLVJ2l6AkNTcKS+O0EccYeq1KGqiGxGp8WEEhrSt3m
	PvJd1WMrZxCHbZpjxWDwLu6gMx9/ACzNsaW2WYIttFQBPxXQXd+35lwsVz2TE6Lvl0LBVm7NsCb
	k4/0BYeB3fWvVRDkmGqfhn1EnOe+NddR7gS5iyl5oaqkD7GWExpsnBwN2BVM/L5yulPBQ8Y9M0R
	EEfDB77zhqGGmN5WkfQpY9ClW/za6C2r6u8ctcBi/FaxA+VRZi1n3k3uB5Ece1gY=
X-Received: by 2002:a17:903:1b2d:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2bf3685da0fmr116617245ad.30.1780288178055;
        Sun, 31 May 2026 21:29:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b2d:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2bf3685da0fmr116616875ad.30.1780288177628;
        Sun, 31 May 2026 21:29:37 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm117215715ad.41.2026.05.31.21.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:29:37 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 09:59:15 +0530
Subject: [PATCH v3 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-gcc-rpmcc-clks-v3-3-76c455f5d579@oss.qualcomm.com>
References: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1d0ab2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=L5rjUTd7AGozPMB3QYUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA0MiBTYWx0ZWRfX0Nz/N8CYBktr
 b3iIlFPhXLGurxL3ElJ+q5Mn5LKXlYjyhALYyMaVdrqlYVK9MlS9NkQhxX1MzN995jqSRrGZfq4
 qy+Di+7C09SOUDoYh6jUwC+ff4LVJ5vecb4U66WxZCLk42yxFIWKW1TOBM/HktbQ42F96V0DxoR
 jRX1nk5twluH4W+WPnhmWS3OABIsMNveGP39S68EnEm9ubTufjtaM+urGf2DbdmJ5Ej8syezRUt
 xqswB+M8sr1j24yzxQ3cBJG6o3+8Cmahv97PnqGoE/E3b2TPklRzpteKoGsZqaZJk0X4ZC3mJaA
 4uoZg2GX93ZFK3ePojnuhnTH5Yh+hrPvqNuTygpn9BXzDsOnqohDc0P91EvBzLuFkKVdZvy9IKV
 iFa7N2AyKpdaVkdjfgzz1NT/0QQKBfT4/xvkMpEG6roR00A3CNdxp2b2tcaopGlh6VLYFwVpNE3
 +UfbM2YpEG2MxZrSPLQ==
X-Proofpoint-ORIG-GUID: ihjsVKn6V5B6Umoir0IJrWo0VFdGfr9j
X-Proofpoint-GUID: ihjsVKn6V5B6Umoir0IJrWo0VFdGfr9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010042

Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
list is same as QCM2290, hence reuse the same for Shikra.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b950bd33fba668a292be46af6326e..d0d19bf0616efd5f1bc2caa037ff36d830a3495c 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1289,6 +1289,44 @@ static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
 	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
 };
 
+static struct clk_smd_rpm *shikra_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
+	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,
+	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_38m4_rf_clk3_a,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &clk_smd_rpm_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &clk_smd_rpm_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_QPIC_CLK] = &clk_smd_rpm_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &clk_smd_rpm_qpic_a_clk,
+	[RPM_SMD_HWKM_CLK] = &clk_smd_rpm_hwkm_clk,
+	[RPM_SMD_HWKM_A_CLK] = &clk_smd_rpm_hwkm_a_clk,
+	[RPM_SMD_PKA_CLK] = &clk_smd_rpm_pka_clk,
+	[RPM_SMD_PKA_A_CLK] = &clk_smd_rpm_pka_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &clk_smd_rpm_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &clk_smd_rpm_bimc_gpu_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_shikra = {
+	.clks = shikra_clks,
+	.num_clks = ARRAY_SIZE(shikra_clks),
+	.icc_clks = qcm2290_icc_clks,
+	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-mdm9607", .data = &rpm_clk_mdm9607 },
 	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
@@ -1309,6 +1347,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ .compatible = "qcom,rpmcc-sdm429",  .data = &rpm_clk_sdm429  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
+	{ .compatible = "qcom,rpmcc-shikra",  .data = &rpm_clk_shikra  },
 	{ .compatible = "qcom,rpmcc-sm6115",  .data = &rpm_clk_sm6115  },
 	{ .compatible = "qcom,rpmcc-sm6125",  .data = &rpm_clk_sm6125  },
 	{ .compatible = "qcom,rpmcc-sm6375",  .data = &rpm_clk_sm6375  },

-- 
2.34.1

