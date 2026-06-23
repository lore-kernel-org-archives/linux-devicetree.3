Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0015F3CE083
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212067; cv=none; b=WW+/en+c+o5C6LgoOnTabaD4hWfN1v+QSVG5ySBNRhcjnVXIL51vnuD9syb5UEOqLCz67N5toqcu/thAHvv/9p/+L85iyqU8jajJ5O8aboleftK2+SlVX/TFHPlIktFGrTBgk2HtdNMguBBTNnKL5e+6fsqynyDWeN8XzH8fpBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212067; c=relaxed/simple;
	bh=bbWtU83+E0lxCYxjPllAAq0uNIiwu05NnGRfi0Uh9Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klJ1IUIp4JXSpT/IK/lVUPzpccy4B5QB+5yNND8kpcSfejy8XZ3lqtXBw4CRFV9NQV8ofbypDum/FB/bw2MB/1poCndKmXh4MdRRKyYfu/GrWHl0TTtz8/iuXlZXeNGL1tWyhXCH1wCdqvOVoYOYXH4lG3hzOPHsKIIgZsIL98Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCMCaTfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCY2xdey; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCMCaTfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCY2xdey"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsLDn4134475
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHsJjUQonrIrxjhLdwVtbSnLceMyJZhxVv9QeQNe47M=; b=BCMCaTfSdrCvVyJp
	2tNkWiWqtgbnhsin8XmIwgh1/R70wu9VCw3tj9j9Kooq8vAUHtQN64Z6DTrxNVzj
	5hesRF+cPXXr8rx7irt6zEYRspwH+6cO5LhyeSj6D47TiM1cgncjf+RJpZDp00lg
	5O/ZmBXeLbpF7RUyNR1Ihn7d1xOnbchihB2M6/KpE3JV1968pbmrq+J44qP6HzzL
	JVm9guMQd3ghA6bsXRAsg3VdyOtfUqRV8yyxDbBodxqzgNnYeHwM2twqqfThdBfl
	rUa7C0G/MQrc88Ibh/Q5vz51ltnGecMdqK2rW7HxRziPI1w24gmuc3CGiX9e9eaX
	+vWrCQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe68dwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf1dece2ecso61369765ad.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212064; x=1782816864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHsJjUQonrIrxjhLdwVtbSnLceMyJZhxVv9QeQNe47M=;
        b=kCY2xdeydjN/0WSotaf57NRdYo5ofKv0Xzpwe04SiwtjCnf6ih0HiuWBpgdNZyk7d3
         m9kZVsyJCETpiPmuVlMlb4DCX4/aZuAFU09WxSbQzOxmMp0SVdHd5CQDr/Yw+WmqVkbY
         ylwd84/I5rdYFL+j1YXPa/8UZYTAD5yO7gCRG/aWHUKdOA9N5LajuQ3XFx65c8MRtebP
         cvs10dp7k3fe3E+spXtFiKHKOqohdYHu1PA9E+jeZqlLT7arxQX13HZNFbEdIYeLAPMd
         fZu+n99ps7TNIVrhBX9HmzQwx1GdUsoY4KplxautG/DDkHrDC9XtNimZkXok4r2vtXiR
         hqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212064; x=1782816864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHsJjUQonrIrxjhLdwVtbSnLceMyJZhxVv9QeQNe47M=;
        b=WVl5w+GEP+L29uSEeXu4KxXpuu/UBWamdIkAoTriJ1Sw2SE81t6Q95D5Z/86dWpW4K
         9mw0WFIzahAxvo7uOssXAFSqtk38NbxOMnrYbIv7+n3AEUFqL4jgqfWhfRKT1pqgqpcg
         uoRwdD2luij0LP8Z/Cj9Qy5YgHg7I0JEyUKlmaTWi+tLozzr6njAA1d9cGC+z14/KUCP
         uFpcGdQ0ZOtndfnc16s/niMyYQrP8vkq25p7em64Lx5+HmhyTv7TYDOm57Ot2drs+ocJ
         QUjfdtbKKQE5YrgMG3Z9rRq68z6W3GYdAr5353YLiQt/iC1GfnUKaUmqiNc5sa/i2spk
         w/Rg==
X-Forwarded-Encrypted: i=1; AHgh+RpDwaRckPj69Kf6zeOqvcKKNTt+jdVH1NBPs5LTtPrUKWIFHDT4AYdfFP2wgBg7cg0PZ3eYyULh5nf9@vger.kernel.org
X-Gm-Message-State: AOJu0YyZicx99NxwKeZ4+BYHS3zAbAFO3MzKHnfQ3km2MiYaK39EkEz1
	wIwrjeOkyeyCqtOPOBgCLsfUBPXhNNJKF/f5AsX6DOXotFun/5xmY42Uu62dPxuWuUVWSYkUYRF
	THz41K5EO8kY75Q9mzJgTPYrCLlExql/ZBDAzuC6fpFGI2CK1Fgnsr9MVPSbQdoq9
X-Gm-Gg: AfdE7cn19qAn5K7ABunA7/sY4jfIs49rV89ra4rCyjlInTEFvfuQ8eRjcAr+9lxODU2
	YoPkRIajyPuTb2i/Vu1Hbdy+/jIIk+B3RTAhqZbPaG/+j7cxmcoXVMsI4Pbwp9omiu7J8DmjPPk
	uIDdfrBkvXAhI93s9TcV751q4+ANC6NkN9LCbDlbtEym5l/97xw6D6j0GY2r2hwTgC/fP2I/FNM
	CQMv4FDfdLGhpQZ8EHYRjr4YWc3gODvT6VwzcjL+ghaP2CJo0Ya78WWiI/Mu6SWzem761TLfQ2W
	qKOFSCkYptKMSATn9qcG4Nxa6LiKi/gY4t2ri8PbLXAYirZDQ31wx1aB8eGH6KuYwDrfkaLd6J/
	6BECyPuVLCEk7/Mc4J/gos0js5ea0OqRtF8w=
X-Received: by 2002:a17:903:1106:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7c99df0fdmr20220525ad.24.1782212063973;
        Tue, 23 Jun 2026 03:54:23 -0700 (PDT)
X-Received: by 2002:a17:903:1106:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7c99df0fdmr20220085ad.24.1782212063513;
        Tue, 23 Jun 2026 03:54:23 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:23 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:24:05 +0530
Subject: [PATCH 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via
 critical CBCR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-nords_mm_v1-v1-2-860c84539804@oss.qualcomm.com>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: QuXDaWlvHWLRDHiGHg0pTSlyA7LSlcfM
X-Proofpoint-ORIG-GUID: QuXDaWlvHWLRDHiGHg0pTSlyA7LSlcfM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfXw57XcuHv3nuT
 m3/A7XPg0fxcIpVux/bEUgSgrCJXFMT//KJ9HBFZOxo0QiAgb4uGegMtWbAWTX4LnZ7AYpandad
 XGN9Hn0Hgt57vePe73S+y6tB1uU23OM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX2HDeq/BFkBUx
 B6kdwu8fJW0TrFksn8PyxXqbfxcqOroOUNEAxSZIXrLmV9eZ49t0xJ8L0rEt4OsQqlyo5t/L1ix
 D4X94Equ0nVudNek6Gz51GKG9WJnMAqe18nZhP94CkKxACZuMODjehA7EcPo5O/9HXBq0G0Jlda
 16QCQPeQD0QFIMw4dSC7I0WK6TIrdMuI8mfZiV/ruroeMsxyaYd7nBKqiC8ic4hyWPQHrbQ9+44
 nPbHrLgj1SyeqZ3N06bTqasIG01bKyk20TGyC22vDlgv9X52Jfq4aeDD+SjzlNiCGE8gaUU76DV
 NQk1qdAWUq6sowb6i+Jb9O+L/nY31DoBFCDf2Rcv+N5mmPzPkkDpjmHEGkvV/pUUvGKHGcHXuN0
 rwYtiexFjXUOeYGQThTL+iFNop9souUeeZOYdDrbV+YxYQWjc2FhPBYqBa3pbSUdpa8mBOh1psc
 Q88B51VMNUDtecX6x5A==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a65e0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mEVXwad1GdBeBoogAroA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089

The GPU2 CFG clock must remain enabled for correct operation and
should not be exposed as a controllable clk_branch.

Remove the clk_branch and mark its CBCR as critical instead to
prevent unintended gating. This follows the same approach as
'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
Qualcomm CC drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 2e653ef0fe0e304f09ed354d5578fdbed9151d20..bc4d478d5606ad7478431573f98b62f6f9b7d9fb 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -952,21 +952,6 @@ static struct clk_branch ne_gcc_gp2_clk = {
 	},
 };
 
-static struct clk_branch ne_gcc_gpu_2_cfg_clk = {
-	.halt_reg = 0x34004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x34004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x34004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "ne_gcc_gpu_2_cfg_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch ne_gcc_gpu_2_gpll0_clk_src = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
@@ -1817,7 +1802,6 @@ static struct clk_regmap *ne_gcc_nord_clocks[] = {
 	[NE_GCC_GPLL0] = &ne_gcc_gpll0.clkr,
 	[NE_GCC_GPLL0_OUT_EVEN] = &ne_gcc_gpll0_out_even.clkr,
 	[NE_GCC_GPLL2] = &ne_gcc_gpll2.clkr,
-	[NE_GCC_GPU_2_CFG_CLK] = &ne_gcc_gpu_2_cfg_clk.clkr,
 	[NE_GCC_GPU_2_GPLL0_CLK_SRC] = &ne_gcc_gpu_2_gpll0_clk_src.clkr,
 	[NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC] = &ne_gcc_gpu_2_gpll0_div_clk_src.clkr,
 	[NE_GCC_GPU_2_HSCNOC_GFX_CLK] = &ne_gcc_gpu_2_hscnoc_gfx_clk.clkr,
@@ -1946,10 +1930,16 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
 }
 
+static const u32 ne_gcc_nord_critical_cbcrs[] = {
+	0x34004, /* NE_GCC_GPU_2_CFG_CLK */
+};
+
 static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
 	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
 	.clk_regs_configure = clk_nord_regs_configure,
+	.clk_cbcrs = ne_gcc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(ne_gcc_nord_critical_cbcrs),
 };
 
 static const struct qcom_cc_desc ne_gcc_nord_desc = {

-- 
2.34.1

