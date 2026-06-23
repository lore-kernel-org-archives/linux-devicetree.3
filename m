Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397603D092F
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212062; cv=none; b=Si3P16nwl7P0eDt2EBgqoulJtJGVpN0Lww4y0db0e1SVWn5Gy8QKazIZ6h1m5vBNzwlTP4k2BvANI6cJRUG8DNeG/T4hM6031FqNvV8UKZQfXE56ZJ01PGt4owxs5AL47GLHden97mhRoCGGNpFukiFWBLukLHdGAJte1VvFArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212062; c=relaxed/simple;
	bh=ji7XY0Ly5CaTH5gQoyfYoW+Dadq8HHWNk/O//BbnnXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxSqVN9RqJ2fz0VZmuynipGezisdQLyDYulg+k5rxik4ITRY8r+xZ0rjepbvv5R/g8kTVRDGhROnyRIWuorrhz8uBrpDiLo/b5peQdV7Yi9E3ubTZ4OCVxznYaUdTMlEZ1zYieGJ9fSUAlGkvhWdiHryQyYmOVbi0Rs7wsCSpcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxoKJKPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuOpUDKn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxoKJKPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuOpUDKn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsKnP042103
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUYYmjm3jRk/CitBXoI2MKAefc/gSB3fowDLV4Ojf4w=; b=DxoKJKPDQTVeNFVo
	mHuQgVRfdyvdMRWKx8BJH5ec6hb9shG8nMTDlWxvP0Vt7x2EvL4tP0hzRj0+pRXw
	VqEHc0lvPKFalePSXCvLciPrQIyyQoVJMVhpYU52aejLe0eJBdhMr3aQ2KzSkzxq
	tgnQPEDyerneXnSq6WEzkkPCfMb2G3VsyJ0utNufjOPPZWjOZBwKp+cTelwzV4Mq
	VU0Ki25Avo45Fl7HmrxTeOWRG/Nq+12DJ8aVp6Fn/z/oZoHRAHs4O0WKqS+rn6Dz
	RNeqK1a5heHnzEDZWYT2uMZl3Tt3CsUcV4ui3YGGROGDecLcBARycNteFtoqeg4+
	8cz1KA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr320683-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c10cd7df22so97274705ad.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 03:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212058; x=1782816858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUYYmjm3jRk/CitBXoI2MKAefc/gSB3fowDLV4Ojf4w=;
        b=XuOpUDKnY/4Y0GyKdGiEYNhSYvetTLZfINMK7IVOQ5AUWpl3f2aVgGqpUiQ2RVb31v
         VGRS7HK/f4alz7oNtCfJeyrE21U2QZ5hcrhKTaWGdnT4bGt38RxJp3zPiCCpiNTJzww1
         LyUQNzfM9mjjpBqyv/VHxz0z1QZOmOAc/kvuLwz4G7dYHWWI4HduxCKFv1jzqIyuUu9S
         jZqG/FSH+Sp+40sTULoafFHXoUOeDt58pLw8m2pZ3ilhS7zktcUCqOqmIOZHCLfWTggt
         HrDC6BdqNQuWqBDoBqoXcWe4e9dCpalisAvyr4185mYLk+BnvMdV0jlEb8giD8NSldxt
         Ej/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212058; x=1782816858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qUYYmjm3jRk/CitBXoI2MKAefc/gSB3fowDLV4Ojf4w=;
        b=OB3+g+ZAR8CdGBEU0lEr1CKDgDssC9sYuphd2AOtS3H23iPnNy1iv23jLo5OUr3ao9
         LRWkEnk+OExxsEijdx8c1iq8Fi8oRIiSy+Q7jQOI9UfAlJahn3KbeJh5wJpgxl7Eu9kw
         ac3a8vqt6PIYfGw5ox89kkGVOAyMWgUIx1C4A0Mwc4uaDikIXZQ56yIjxe1ASDWH+AuP
         b+/ca9zdoOM4t9Qju+oOzYmU+Op5Lfpi9k6suJsLq8S6LenlBARmyYmWKNwnaly3aOQl
         CR9qMN1DCdwx+YEVOdJIaow19s5JLrMHWm1xhH7bVi4Qvp2dtAFeZP7XvluETpZrykzv
         5cWw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7iF0hwd0jGCeGRXnHLcifZlRCujlINnaxlksQUHytP6Kg3MJlABKoso4ioak/NuY+7Bf1A27BYhmH@vger.kernel.org
X-Gm-Message-State: AOJu0YxqTFZ1BN6JeC95TzNXHeP5/uTwFIVESghrt6R/tc5i/aH126uz
	eiLogJo/mKNQW1hS8fQesnEbjjiLlZzRmhoPKQCT3q4plhtSIwfWnaUxNodphwI3nSgDV5G1fNj
	2zj+/ArZelSEypgaKCcYKhIVGNtzVmRdKvjJGkFaNxHuvF9hylckUOUkax8sWPkWp
X-Gm-Gg: AfdE7cmHJgDnAB1HxfZtKHfoGevLYBarVKMOa093ypGMdLYdMii8bQ/xXVLT3ct7zbg
	RMONTjrmQSaed0CfsCR8n+fiZ3t4z1rBJb1oznAy2FGvietzlYoAJHLqXDBn5VEnTgoJT7lmr3d
	rVZdgQPp8J92ZYosDDWtm+XttXR3fyztFQSdBanHirEWGJsGf7O73oGCkP01/8bD66YpdKrTLwU
	yA8ZZztU8X73aYlFBOtxDC4Qms6qtYRb8Uw9X6UvUBL5ShkwC6txTimE2GN94uBXsZ9uVIU2sQu
	3SuvUALxByCROJ7EfuuXlwfDGZPA0wJzE8Z39M9Bda+4YwDa2YAt5YVS7MFsNPpP5VlSyNb1kXu
	bLebx3hCkDMXVJtE1o4547CJlz7V9izo9LS4=
X-Received: by 2002:a17:902:f683:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c718ed584emr189638135ad.14.1782212058093;
        Tue, 23 Jun 2026 03:54:18 -0700 (PDT)
X-Received: by 2002:a17:902:f683:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c718ed584emr189637855ad.14.1782212057594;
        Tue, 23 Jun 2026 03:54:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:24:04 +0530
Subject: [PATCH 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as critical
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-nords_mm_v1-v1-1-860c84539804@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfXz1nQIjzvYFI3
 vWhzIN/z2vztYO3OuSpgNUOT1jxwI9Ei8HxWyx7M6nzcAkrAc5iX/0c5yy2Dax5hn4qs5KSQHlV
 LQqm0x0+RE3vaglYWENIbBaBnYqr5us=
X-Proofpoint-ORIG-GUID: MY9tLajxQifsF1GD53wPVFRI5sX-QIJA
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a65db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CVX4TxgtaZIOJJKr5bQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX3Ha0Cl81TIwp
 MYcdahS3cdoVy+Pf6yUkf4LTlHhUTpPUxP6xPfQ/HSPl2BE7pObLl9tIpS/Tzq00BWVh6vZlBIB
 luCK3u0tZTI1NbDvSLKT4Uh2jqvvf8Di3uL2Vu6DiblZFr2EmSIoHVgroVlOAInrPkfSDktpL36
 uuLu2NUEHURJzRPXPXqmg7gbn2uFVpT3V/0/tbdpkbYGZ1JkeHw1VybuVnqJ1ZwlF917S7XfhVq
 pUNyOBx+x9iSDeK4DRPZaQPVNlxrVw2t/mzx2ce6aSBJNgDhKaOwFS0q+BC4mf4psVKi8JWrB73
 pQ3vfsiUq7bluJXmKmuXsMMMNM+9dfhuW4aNu0FYdXZrRPYFY5P0BV/8JImMXr2xBMD5QQ/C2yx
 xzyHPKRoMr74TL7ytpsl+CYLJyiZOqpEoyY0q6RAXmv5Kqxfu/SAu2igt8iSMIFzposx28FSSFJ
 iqQtSPhs2xmUQXhpbxw==
X-Proofpoint-GUID: MY9tLajxQifsF1GD53wPVFRI5sX-QIJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230089

The PCIe link AHB and XO clocks must remain enabled for proper
operation. Representing them as clk_branch instances allows them
to be gated, which is undesirable.

Remove their clk_branch definitions and register their CBCRs as
critical clocks instead so they remain enabled.

This matches the handling of similar always-on clocks in other
Qualcomm clock drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-nord.c | 37 +++++++------------------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 8a6e429f264022d55fc5e59b9ec46ae1124f9ad8..299c616be325156ccd457b7b6ef45afef364ad4e 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1185,34 +1185,6 @@ static struct clk_branch gcc_pcie_d_slv_q2a_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_pcie_link_ahb_clk = {
-	.halt_reg = 0x52464,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x52464,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_pcie_link_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_pcie_link_xo_clk = {
-	.halt_reg = 0x52468,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x52468,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x52468,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_pcie_link_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_pcie_noc_async_bridge_clk = {
 	.halt_reg = 0x52048,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -1758,8 +1730,6 @@ static struct clk_regmap *gcc_nord_clocks[] = {
 	[GCC_PCIE_D_PIPE_CLK_SRC] = &gcc_pcie_d_pipe_clk_src.clkr,
 	[GCC_PCIE_D_SLV_AXI_CLK] = &gcc_pcie_d_slv_axi_clk.clkr,
 	[GCC_PCIE_D_SLV_Q2A_AXI_CLK] = &gcc_pcie_d_slv_q2a_axi_clk.clkr,
-	[GCC_PCIE_LINK_AHB_CLK] = &gcc_pcie_link_ahb_clk.clkr,
-	[GCC_PCIE_LINK_XO_CLK] = &gcc_pcie_link_xo_clk.clkr,
 	[GCC_PCIE_NOC_ASYNC_BRIDGE_CLK] = &gcc_pcie_noc_async_bridge_clk.clkr,
 	[GCC_PCIE_NOC_CNOC_SF_QX_CLK] = &gcc_pcie_noc_cnoc_sf_qx_clk.clkr,
 	[GCC_PCIE_NOC_M_CFG_CLK] = &gcc_pcie_noc_m_cfg_clk.clkr,
@@ -1850,9 +1820,16 @@ static const struct regmap_config gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_nord_critical_cbcrs[] = {
+	0x52464, /* GCC_PCIE_LINK_AHB_CLK */
+	0x52468, /* GCC_PCIE_LINK_XO_CLK */
+};
+
 static const struct qcom_cc_driver_data gcc_nord_driver_data = {
 	.dfs_rcgs = gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
+	.clk_cbcrs = gcc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_nord_critical_cbcrs),
 };
 
 static const struct qcom_cc_desc gcc_nord_desc = {

-- 
2.34.1

