Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33486330B0B
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 05:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132353; cv=none; b=O1QlKTjP17q62GrEt42BCcnMyPz4qChKVs/FeKulZin/EeSPRlwNX/Gxuqys6d/J7Y87MelsTk69+pBBx7HFKK0cFIH/gYbfmcsGA3pUdeyspBrOa7M07BiozxkVz8nZin18hd1ukBTkPIClSJYqubPPli4CujhDm/zQszL3ywE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132353; c=relaxed/simple;
	bh=wgVXCfHv9HFZOezc7cbXA1mOEQVApLKpcn+bcT51ksU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSWens7WCIRhJTTKNiktkjdE4I633RimIttKQ/NThNLDYHV0WNDi6rcHVeNOe7Hl2CWGscsNqsOh7BzKKxkcNmeUMOeWr58K/HHawBAGX7OmVDJrY5GlXDWvGzjzRzd+Ohn0xNgPiFQrKfMrxSD2huhZ5JMi0Hm8N547ZXmOIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hk00+noH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Em2z6wJQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hk00+noH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Em2z6wJQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64743vt2150864
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 05:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OmIXI9w8ssWZLsEytWv3X+SZHDOkjYPFIzE/45pDlE=; b=hk00+noHmLJ+sqJD
	f78DRJum8/BTcJXy4Dfrjk8voyiLUXV9TA/Q7iYw73HZ/ng3yxSF1ZMu+ic3yAMj
	qlzbM1yrRP9djOVfmPqV5asHZVbCHV7mpGz+e7BMh87BXPoJ5PnZaLuU/cmbEp7m
	YPrfD51ZG+JtChxDbIrK57FD5SPg/IksrxBnHbk7zgjtiw4VlQ08btK5gkQ1MVLq
	tIoZc3uc17+iW/PyMQzYrlNH0g66TGXwTtbAecNXGl14yyZ/jCI7qW1nSGIWe9VP
	pVh8o1m9Qne5+kDQNdS3VzsX+W5uAqadCYepIFlAqBy5YN/ixaYYJMYQtrGRTFO+
	o1KUNw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctr96f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:39:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso322989b3a.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 22:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132350; x=1778737150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OmIXI9w8ssWZLsEytWv3X+SZHDOkjYPFIzE/45pDlE=;
        b=Em2z6wJQ2Gwf+RYmgQ61L0T5wejiVDtHbHCowgfGa/qdd3IxcfpdfyhC4XIIffmiS3
         CsnFwOPWkB5Sc42bA0tAC9wDRvKnISGYOXTWYr+mppu3teThqlFTirtCakjuChC+K/sq
         Tsunuuqd676GcrrudgATh5GisTKM1q8ndrxXpLZ30g2BGMeTL+L4+7qwXsd32ufLc7HP
         jMQExTVc+bG/W0NKPEpCr4nail4HuZv8aNKvTqaXQqb8Cg6Q58GUoaSM11JeY0kELEfB
         OitEvYiBCQi1Xu+0qbVtlaLpl0LCQKHmHOoxKdD/Gi8v/p16y5ZhOSvBQfhdjSMhxU2F
         ulMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132350; x=1778737150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OmIXI9w8ssWZLsEytWv3X+SZHDOkjYPFIzE/45pDlE=;
        b=ghL5oIfJ4vx9uqMsWS1Ta8memy6eiAYi1dxJ8/J3Pd9a3/6Hgs3GYsZKefnp0NG3CO
         Nya3UN5lLMd5UwwTnMYIzuQmkvNCFPjpNcKeosUX1XEWEnRRp49ii7MQMfoUsRxOdySy
         71By7wJaJyhMqAfFuUN2oX1Y0M8Wg4kouWQAxO4EIdNAY7Ba2NvaAvd0a1nXFfTaVAko
         PYbKLxRAdyoI8EKV723xMGMdBM9ZHIlx1tuJxePTTFnPD5W+u5QBnsiD6VzG32ybeYar
         +ddExUnyWiN53O+vIRNSH0Y7SN/EP0RM5xmLnQqrS3CSMKEIB2OU98naZEDlc6NO/G46
         cMMw==
X-Forwarded-Encrypted: i=1; AFNElJ9wcIvx44Ky4QZKD6TuNRpaXm8cyZVrcrIBvloeQmSwu74HTwAKWumx/zubjuEGjKbxzPTUIAfc8XLu@vger.kernel.org
X-Gm-Message-State: AOJu0YxvHMoiL7cdUA9stA6/enhd8wwzlNmb7kfoCOLDM63YKgTuBJAW
	x9XfcE1eqcjVuSJfWEE5Ak36GdNc7+IHPUBSeYEd1S5PIj2f054zND2s30gmJ0GFHFzISOUAkDF
	T6/fGMSvGp/84eBInDS1k4NVtEa57kS1GCk3iG1j04ZOk9B65DqIV+NOjsqDRFHlJ
X-Gm-Gg: AeBDievFHCyEluud1UjdxkCNUI+TUNBSBSAqk/ChCUUJhfzzDjsFMolK4DycFzKhvNI
	1Mz0RwVkF/SozlCFlJXyAGQrwodztNj2WKN5Hn1Oz4SV3KMS1mBChVc6PAXucdjX0CtIvj8fFam
	hvcvi4+Evh/Ik/keXs6oHOqMzgcQivNGvzBGa2QgXRGnj4cj8589G/iXXVS1pCEgDAD+ClS/TRE
	9mqLgZVqzBXdePgZcQ2sqIdQhV2UhbkGn425X+XuHBm/Y1L724hG/oXQzs2nsIs3U/+aPpPw5yc
	LrccqFBVfGSuSFcI6FXh32UlHGHCWHefuuKbpsM09UPeX5UFwoeISgEW34Tz0m18GEDGsWe/FZI
	wnlOLYqAhSGSN4LghokJhJ3WhyHAv3otPeJM3bGicumw+ShfaxFr4k8fCuMp9Njz7xVJ6OmKxpA
	==
X-Received: by 2002:a05:6a00:2182:b0:835:685b:8e36 with SMTP id d2e1a72fcca58-83a5d3874ddmr6299576b3a.29.1778132350026;
        Wed, 06 May 2026 22:39:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:2182:b0:835:685b:8e36 with SMTP id d2e1a72fcca58-83a5d3874ddmr6299536b3a.29.1778132349529;
        Wed, 06 May 2026 22:39:09 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:39:09 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:29 +0530
Subject: [PATCH v5 4/6] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-4-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc257f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=KO62ueLImIrNyuj-9MYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9KkUzwvVylBY0oUfebkzbS5Rmb2--xyk
X-Proofpoint-ORIG-GUID: 9KkUzwvVylBY0oUfebkzbS5Rmb2--xyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfX9SslaX4a+NFB
 8EQzxXSmLUWi6QVj/QpckrvJYLXUjy2H9HmgSEos9eNS1jaDK99BAD6oncs+L+Mo6osfPP46nkg
 c7/lsZROYTghTY0VmEVkSiu7LhMC+YeoGRbicsgO3Wa7KNZ2j5w+BHSEMxBlqHNiJ57jB85/jlT
 sRnbEZ0ZhKpQ8eg9qNwJfklacEUElkgaQNQAB/8POUWyQOSTtYUQS6ONd/TUSI476NMb9kulf7R
 twY79vJbSPb/+p57KHFs4Of7wgkjcXU2z0AECXGyHs6Ei44t7bajr7WOF6TWXSFetrAQgm1yaR/
 f0LnWncfW6mKBdeviPbVsH9bqDxExPrzLBoLOWlgAi1T1HZ8zozG19TdD0pB45Ic1WgfoPUesIl
 RxBlB2u88IP+rqt+mJVi1xtlaglEa8thlYAX02abO3sXDyyXpbVZeDPaMCPbKEdVFByjUNxur8+
 vBlGHkIQdfUGEKPTAFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070052

Add support for camera QDSS debug clocks on X1E80100 platform which
are required to be voted for camera icp and cpas usecases. This change
aligns the camcc driver to the new ABI exposed from X1E80100 camcc
bindings that supports these camcc QDSS debug clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-x1e80100.c | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index 81f579ff6993349f4993fd2de14605379711f90a..c12994af42cfc4cc1a2a32663940313b83311919 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -1052,6 +1052,31 @@ static struct clk_rcg2 cam_cc_mclk7_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(60000000, P_CAM_CC_PLL8_OUT_EVEN, 8, 0, 0),
+	F(75000000, P_CAM_CC_PLL0_OUT_EVEN, 8, 0, 0),
+	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
+	.cmd_rcgr = 0x13938,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qdss_debug_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_cam_cc_sfe_0_clk_src[] = {
 	F(345600000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
 	F(432000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
@@ -2182,6 +2207,42 @@ static struct clk_branch cam_cc_mclk7_clk = {
 	},
 };
 
+static struct clk_branch cam_cc_qdss_debug_clk = {
+	.halt_reg = 0x13a64,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13a64,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qdss_debug_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_xo_clk = {
+	.halt_reg = 0x13a68,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13a68,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch cam_cc_sfe_0_clk = {
 	.halt_reg = 0x133c0,
 	.halt_check = BRANCH_HALT,
@@ -2398,6 +2459,9 @@ static struct clk_regmap *cam_cc_x1e80100_clocks[] = {
 	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
 	[CAM_CC_PLL8] = &cam_cc_pll8.clkr,
 	[CAM_CC_PLL8_OUT_EVEN] = &cam_cc_pll8_out_even.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
+	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
 	[CAM_CC_SFE_0_CLK] = &cam_cc_sfe_0_clk.clkr,
 	[CAM_CC_SFE_0_CLK_SRC] = &cam_cc_sfe_0_clk_src.clkr,
 	[CAM_CC_SFE_0_FAST_AHB_CLK] = &cam_cc_sfe_0_fast_ahb_clk.clkr,

-- 
2.34.1

