Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE97A2C11FD
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917317; cv=none; b=egN+3ZCwg56yPaCFA9D4k8ow1SNe5XdSAD7XfTpqpuk/Jfl+wHzot5aCoDkGGfzKL+1g0wp2RhUdmIFAnYAzz9KeAuurlwXSuUTTNdCHP5lw6bhbnqt9Ix7YXgjHLbDodFsMYRTBk+H66k+X16+nIo8m8eid+OZij0uTvSmQmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917317; c=relaxed/simple;
	bh=b0OEQN74wr8+xZG87rDz2GbjDXOiu02SrCev/KQ9vcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hxs7PIiSKvBapT9eQniTUyuW8YJ6JS56CRwgL0VbW+JL4wegbZCxoSew+qxA/BoBvR5xbU/3FzJ1RF21aBMyVUNjYvFa4CbYeIvGcn8z4TykkfeEYn4pzXnIWbrp+1JkRV6sNAlW5kKp5JKKbPzKnBOxp6M8d289xsaUhEpdeks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNQIag8K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byLXxbiN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNQIag8K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byLXxbiN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UIwTe34053789
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDO2Ukjx9lXayEy65b1C2A/WQjag1+kIVouVS5GCjko=; b=GNQIag8KtNipQMjP
	ExlAV7UHLXVXfI7EosKpY5O2GhLZHtabqE83pfAB5XGxeepGSVW36XL/LO/qAQuK
	rtUMZMb9Ql0iSgURoPAryVLGbVqPzUdi2AS6Xni21vZu3uVWPsNcTcx5kwEGWVK2
	gV/oicLjYgxGeFwKF6C/G+XMwYjeL+bjtZb354M1hHI2wuhb4qcRedhn5gyiYII9
	e37aMBe27YjCY403bPdGTy4BQ1/wvggRe4F9VKQOBQZlAlUl2kW7BmfRA2Fdzd0i
	OSm6qw5PLm2ZsCGg+VOWkxGM/jazscwwp3hylCWHEdQMJMS5cFSZ8Bdc6x8emXXf
	ja9KnA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx38yhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c1631e6189so24277113eec.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 17:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917315; x=1775522115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDO2Ukjx9lXayEy65b1C2A/WQjag1+kIVouVS5GCjko=;
        b=byLXxbiNjTee5EA3GlrWXUGULNCwpmGzZSSqEgquP7y4gx0QSaXF+EKETO+Ogm5PTM
         FKDA6LcXmkD7DaORR7EFe0TVRgA0yy5JFxsJrQoVGJhKUyXmf/8USiYJ1zX4+6Ah4Rcz
         QvjiAcheTpkThtHS4ox1YAvSavCOfhZ3EtcKiTGQkLkoAnjPnkmHVwwYH/kpC3qhknSD
         RPl4SHsWowsq79umxabgf+QLXoS9EAogpvKGjMX9oO9HtSJEpqdsHDog93bUj3kg9KkD
         0C+6bMda2VCx4VDXX30R8UMdhsF7iuUPNTP6PnKRvIbxCk1rGZO80s2Jm3JHkWRZs38Y
         H04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917315; x=1775522115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sDO2Ukjx9lXayEy65b1C2A/WQjag1+kIVouVS5GCjko=;
        b=o7K2C3v+F6EVFUrDV8KZxXVs/BTYBrKMmUTX53Lh0I97e+BkklsaPU+AgmLqtKeyuR
         4U9UMbRNFp79CIZBbfbbdEth1qGmhln0emS9YfLppu05FKBwUJGxihkVGNd/Ly+gMOKO
         HKSEJDXq38uw2sPZsgqZ6as4U0gAQ+VgzV+V9W5q/LM8F6ickluzJkcxDihFt64BMg5P
         IONuzUgyWCvnza6LkWusfm7p6e0o2CS4YivIiNVNnijR9SxRgvMYJWrSfooBt9WyhnRx
         HTU6CGiYcwd4+jFKUs5lTMXY/dxzLC7pFdglXUhzu9QLDyl97o9GCdCIU9AI2ctFN+Ry
         LlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNlOX+fuE+agaGg2kg5iWEX4vMABDVUFcWpH0bzAlWwa/1M1Xws6RyzVPpxmf+NaGKfCPu33EmiF/c@vger.kernel.org
X-Gm-Message-State: AOJu0YwWUU0FDI+jX995+Q63zw8nu5juit+dna5gxVfFVvJBeQ9B+EfA
	J0cSsdZLxNTypPOodv1vlqs8NkId4JaO75A4+bdRfj5aZFEz39hPteWm3Vf6erYVEyf2DyeC1CR
	Bphoh8PoA6jpTXHsF67mngniu9wEJdtg4lv/83kTh4azQfbX21bES5a5/v0RNuDQ8
X-Gm-Gg: ATEYQzzCOCVv2BJpSd7d8JXxY8+W5RLH89GKCL5QSD0DSX8cYDq0l8d7PSBZ+kb8kQn
	64KlyTe0PKJz59P0FWHtrLY6WyQC3L3yJVG7gYzvWMLaNf/5tSH5LA96kiWnVKQhSmxdgdNyFaB
	0ZcZEhSPcjCW9346FRNoiTNQtTNIh8ejDxNe+tXcYC2YEs+mCIoU8wO6048cBDIiTBHzfjh8V1p
	0JPcM4d9kT0s71B3ng2HlViT4rcVLVUn9gDdBKV+jneNe1ygbjgG4w+TvIlTHpvi1e4U3i6wB8X
	w5CkNVL2jKuAyNGxhrFu0JQQb8WfR24CikxK44Bpd97q7U9deoZvoUmC9DAuEzMe50O1DdsYxDv
	3XB+tmZ+2LBEvZREyE1DKef/I/QN01PlNejtxCUg2FdMQsRC5eVp2Vt/Z7v9UuFJScZZFfWpsNU
	wD
X-Received: by 2002:a05:7300:fb8c:b0:2c4:a862:2368 with SMTP id 5a478bee46e88-2c4a86266e5mr5224004eec.2.1774917314663;
        Mon, 30 Mar 2026 17:35:14 -0700 (PDT)
X-Received: by 2002:a05:7300:fb8c:b0:2c4:a862:2368 with SMTP id 5a478bee46e88-2c4a86266e5mr5223972eec.2.1774917314080;
        Mon, 30 Mar 2026 17:35:14 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:13 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:34:59 -0700
Subject: [PATCH 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=2879;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=b0OEQN74wr8+xZG87rDz2GbjDXOiu02SrCev/KQ9vcs=;
 b=0V7WutXN4fflQ6qsYpRB+9TK7iUO1eBmk9l2+SMfBBmzuCVvLCMQ+6aQWrr8SlSZPR8im4/VE
 bApz3XjKZA9AQIEdpUXLbWzI95PGbYrchSXPt+zju2hLBLLGcrr8lhJ
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb16c3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oFwqGCNmLK_XFdElRrAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: HA9Pjqhd1g7NEEF0BzcVGK5QUJiHXWTs
X-Proofpoint-GUID: HA9Pjqhd1g7NEEF0BzcVGK5QUJiHXWTs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX9WzGe2bdrlop
 7qCdiPDWNUkkzVLNHRIqBUQH1q3sxfXgtcIPBhtFCx0EW8YHEEdmNJHfNmDJMiFqhYBZnBQwhx+
 D6mIIbC38j1tb+Yz1cCVKJko8xg5aRjqP2A+FCLhPHLYafLn2sZXX5sYIeTp3Zkt0meYmc/FsPR
 jHBaZuEpjX6z7vAYOCJaYpxMV4Zclh+8TgWGrcXI75XwCxODEGA60RpqKttjxFkbBB+kxSuBO88
 aYrBglSFHIrs8iNs+YFbzHPU/jjeC+zXDS098HAOCKvj9KyEG5PCVcIpyhhUlku8ncZEjE8Ln6i
 kvxkgAZeRix/ruea7gmTP7RFxhaVGsRUeU7wtwtH2CLjB3VGThvO2KeXv1vB0ROeLd6hXYTZFCG
 jqH6iNk8qfPDki5mOvIe9/989YYx455iWAl+bbEFWmH11D66mztxLzdZ+BeZMbQ+/ett3tQTKOr
 SI0tuxn+7gwK8H9gxDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003

Add RPMH clocks present in Hawi the SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6a54481cc6ae..f9084c15467c 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -405,7 +405,9 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2_e0, "C9A_E0", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4_e0, "C7A_E0", 4);
 DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -965,6 +967,36 @@ static const struct clk_rpmh_desc clk_rpmh_eliza = {
 	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
 };
 
+static struct clk_hw *hawi_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2_e0.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_e0_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_hawi = {
+	.clks = hawi_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1056,6 +1088,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.34.1

