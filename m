Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB8252CCFC
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071340; cv=none; b=ir1vSzujMMy0tJfhlVonfQg4aOfKVWzJq97WqANr/+Ixy+N2dpsJgEap25t5uqzeb2+yV5gTqGmY6Ib4S2y0aTPHbGbXK4dM8e2rlpYsvjmje8TBM6i/ldIhEYSW6hZ9wznhTAo1OxNjG8D7UAxW0cW7TuM4tHOdQ1VLMgTSnbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071340; c=relaxed/simple;
	bh=dt3WAmmD9fsSJCwfPnXNxdleKZCCqAAB3XpOQXy6mVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EySkYBoUId4jhlCYnGnYCXrCcvpQRAT6ZvlNjSD+r/3eVzXwrPnzNE7jX5o8uSb36LYDAw/H25GJLj9y3d+dhqoc61SCReaTg5ieiS7WcoD9GhkrFcSVUq3rG9y0sryyrDJORlRTX6WKqpStGtJMCR+oeWOeiVcLnDgaTYm8oJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDIp4efM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HmBAoFXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDIp4efM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HmBAoFXQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FDYOlX3462811
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3/HshOl9GEqL2i7rNuzJco4AlqLUiGFsUMhKpCILovE=; b=hDIp4efMJsCCuCF7
	Fq03dh67foxicLtRSqwtPxD8q6wlc9Gow/LGlyh1biSj6XbckyDXUWkKyqW64oo3
	GCqlJfsAIVIos+pUZfqO8znzkG6/UrLfVE6T8C3Ibxl1OBHHjWvTpfEXorB4Gb4O
	Wdzhg7bSN3rRObIZggbX/Jy/PX1SN0DA/sTi8dioXv6SWMtOv8NukT/yvgBMTsyK
	Pprge7w8hiypTD2bbTrpd2RGGDjCcAz9nj/sAYhMQ1SiJN/4bJ0Fa4nP4qP4tr19
	YWtL1W6NBxmuPFrlI9BNInqnUphXKHntU9LJhPjuKu2lv9ya3FsoDDbdHMyvZzbM
	5OBqlg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu68079-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:35:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88bbc27f85cso7139181b3a.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071336; x=1792676136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/HshOl9GEqL2i7rNuzJco4AlqLUiGFsUMhKpCILovE=;
        b=HmBAoFXQ4IJfPBB77luUnJKQZQFeHBCWOQFAwpqRnyii3Eu2p+yjrcVL1fcSl8OBZa
         Eax3cxmqH/Gs0HqvOpVq2/iKF6xAVkfGRabDGb9y4lPb2AbfUD/VrKmzhfxNUGOJdhnl
         D9DO93zeAqoJnC0muGAkno9vhhW4iUOX3ATKy4rIhT3eejRJKpqwAtr8PDi/NmrPhOEj
         khIkFVz2IOG+oudEtmqmX4pAd2j98UD9szXBaoBoZuuAhz6EALs25PSmTboEpdhcRXv7
         ATlIxpMiyKu0zo2LMyQblSG96vNwtNX6odz+ydHF0JJmBHFrXy5uS1UhwijfyB/szX86
         Zfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071336; x=1792676136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/HshOl9GEqL2i7rNuzJco4AlqLUiGFsUMhKpCILovE=;
        b=C6ibtl5vVuH50fIP+i6whXieWauJeZrCUFWZNzV+06Bw9LAGntcaTBEOUGQSjN3ZRH
         j/uNcvwe1l5vP/TYVAjZeKels4prMQSX4f0uDV6F/P55DHzxDvCDjlC5xIOsx0Xe3Txl
         HHXYzn0zaekJ21OW4r6ypFBjsDa/GMUvVUvElPrKnQE8h6obU+1FWlAjJPhXwfhYqHNS
         EVoXREFWwsl2UQ5QfPgcZ1eWedRPGOEOddgVRfWjR/oBJfVl0eBFLRVonai3votUnvip
         fTnZrwUbGfO4B8aq3LhTzPxImQxbtLqA5uG7V1gY+ozcmb7SctW3tBQJLzP7ZhvmZDqg
         eFig==
X-Forwarded-Encrypted: i=1; AKwUvBxwKSLMYhX9BIHbknfyy7fDbzPo20soPExbapM5/R7pVw05PnX2C0Z+XuIvSA2A1UgjJ5iZJIHBChlV@vger.kernel.org
X-Gm-Message-State: AFq9FYISSeqYPyOMpOQLZL3iKBdeAioK8ZBV+69ttrzFIRhfkiaM24aw
	GN578Nl++AxD7Z9C5yuRuyn9XVjMKzCyM0ZHFKlMGTV/Cgnb2pQvJUtgbeAqKT1JgPEcnmzRjQy
	zIEckVofZPfgUi8JXBb4nihfjEVa+g5OvzBfLcvUafwX8O34G18OPEkYrqr+kXUYi
X-Gm-Gg: AYBFou2aGbUkd7cXqXFENJELE1OuX3bJKQLB69BvfTHlqJaPIrG1I9LGJQaPNulAuGA
	/LSryIxOYzYKJuDVgofXNylb8MgUsFM3m97G2W2Elur5n0BBlLYYBMw3kd2mXqOapskkyMfS82m
	ngdPSjSiN7AbjeAy1z3dISzMrvZb1CGNEeBQ6tola788/wOJsFhtEUmtQ+0RrduG0U+KHI0e3bz
	UR+Db+uhMNeqQwKIakbsdr8Rz4+noLq8rbdN4JokjrWi+MSjfg0XUrZx9nQsdjWj/Cyk6B6oArl
	uBJTj+xi0xKlBclli01CxGpl23izRiY2X8k87nUftX2VY1Yx0DCDtAclxhreLnaJxfkNu+QO/Kv
	QkQoT6n/1NvfbYOJ9EhGigBBq/l8ZIw==
X-Received: by 2002:a05:6a00:4099:b0:89e:37b1:b81e with SMTP id d2e1a72fcca58-89e37b1bb3cmr3011273b3a.31.1792071335771;
        Thu, 15 Oct 2026 06:35:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:4099:b0:89e:37b1:b81e with SMTP id d2e1a72fcca58-89e37b1bb3cmr3011247b3a.31.1792071335331;
        Thu, 15 Oct 2026 06:35:35 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89ec1705f5dsm476617b3a.53.2026.10.15.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:35:34 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:05:01 +0530
Subject: [PATCH 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO clocks
 as critical
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: WAnrt_bCQEcMF8VHLS8rKcJFWJF32Xcw
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad0d6a8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4K9S_alWPkThguqFwX8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: WAnrt_bCQEcMF8VHLS8rKcJFWJF32Xcw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX8xXN23cUvC2F
 gAFFKhAkFxaktWNzcYnuXYBxnQeMgnqH3QX9MRWGpGrQS1je1N5dEVemI8MI6AOdtipJM+IB46n
 6M5P4AsjpmJckoEO6OQRcgp8yP/2OJbNNIV37LW5HK+2Evj4pofITSKZt9WE7gScPCWPRsqaPrW
 JM6zNDUJHBQYddeCIHN0iKHb7lDU2qj6CWmIQ2iQM886GnTFIlb8CBnWUTOfCnOHFe6+EH04EDL
 zGr9XBBShFKUR9dGFLXr+kciiCnQ+5qQXeD40lvZT2qTm7eHiEX7j5Mf8tlwEGXDmOX0DgNg13b
 FSFSDUqC3b5H4EcrszDpWW+R2QnnQLQ/6rtXIdMISJczSuyUSbdQ5tsAnv1IadDyQNmW7bvDZVu
 zD1xtljRfhKt0WkjmbC8tRCZ9Rc+wGZyxvsU1Qy94QtPy8k5emAS1L76BM77CE+tgYioPRizZqx
 uZsSaLO66VyQLXZdPNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX/ZzzsWgyoGDX
 mwOYzFVagXaW/7nBYWzRTyo6F2oZR3FE2IdNmL7lzoHBASW5YEb7Jxa+4c1rLNN4Z7Ll6QkWbTV
 sNt9o14QXB+XYBpVuBX6QOF7zvF5jdU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150053

The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
Hence remove their clock modelling and add them to the GCC critical
clock list.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..9418a9b2bbde4be8a28b6ba4405baa780de654e8 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -3373,21 +3373,6 @@ static struct clk_branch gcc_aggre_usb4_2_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_av1e_ahb_clk = {
-	.halt_reg = 0x9b02c,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x9b02c,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x9b02c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_av1e_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_av1e_axi_clk = {
 	.halt_reg = 0x9b030,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -3403,19 +3388,6 @@ static struct clk_branch gcc_av1e_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_av1e_xo_clk = {
-	.halt_reg = 0x9b044,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x9b044,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_av1e_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_boot_rom_ahb_clk = {
 	.halt_reg = 0x34038,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -7915,9 +7887,7 @@ static struct clk_regmap *gcc_glymur_clocks[] = {
 	[GCC_AGGRE_USB4_0_AXI_CLK] = &gcc_aggre_usb4_0_axi_clk.clkr,
 	[GCC_AGGRE_USB4_1_AXI_CLK] = &gcc_aggre_usb4_1_axi_clk.clkr,
 	[GCC_AGGRE_USB4_2_AXI_CLK] = &gcc_aggre_usb4_2_axi_clk.clkr,
-	[GCC_AV1E_AHB_CLK] = &gcc_av1e_ahb_clk.clkr,
 	[GCC_AV1E_AXI_CLK] = &gcc_av1e_axi_clk.clkr,
-	[GCC_AV1E_XO_CLK] = &gcc_av1e_xo_clk.clkr,
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
 	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
 	[GCC_CAMERA_SF_AXI_CLK] = &gcc_camera_sf_axi_clk.clkr,
@@ -8483,6 +8453,8 @@ static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x32058, /* GCC_VIDEO_XO_CLK */
 	0x9b004, /* GCC_EVA_AHB_CLK */
 	0x9b024, /* GCC_EVA_XO_CLK */
+	0x9b02c, /* GCC_AV1E_AHB_CLK */
+	0x9b044, /* GCC_AV1E_XO_CLK */
 };
 
 static const struct regmap_config gcc_glymur_regmap_config = {

-- 
2.34.1

