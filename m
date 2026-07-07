Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000193AEF27
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407348; cv=none; b=Kdvy/9SB7l9UuktPvKfNsyLCBx84uqR+2uw1PjFRB8ICEb7ugS6Dwr5WDyJQFGZmkL+gli/nJgKAtDfqoD6WGvJeagOWVyorL/KGAiURUsSIVI7DotLYEfBBxPCQWqT3nr2RPMA3vaABmGUNZp0d4GgpKXFTegZgHkxm0pN4o/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407348; c=relaxed/simple;
	bh=2NqJ0/R6ViBvasZZlfLYNyADPtAFKzU9qIQq6ndqDog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0KgTQN2llH53KI/hT1M4BYSUpNNFTRZvDR7DNxbqSEQihCagjj6XCmO+ag6Tfbk8MwvTBon0rmO6SWmVootODd4FQOOb4QxqlQd0/RcKekpqTf6yzmEa0u8DKYaD/BPSEeK23YjeCKJ9+ksb+Q59w6nwg8lnuscONGZsb1GNAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GErHyy6R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVsTj2PI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GErHyy6R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVsTj2PI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748xss2649797
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 06:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSyfrpRIKSRAoUsq94n+yNFahxShqoblpfsaha6QZaA=; b=GErHyy6RQBJl+3Yq
	FBEZ446dYdXCSEFnF+QxfKoLlUH8ilLwwu+7G7lPazEaR3SnNDNx/y6SH8aYTJdf
	MCVzxWhtvvYzlKt9TAOh7Y+eaq+tvlZCYTx1xspmxzDp2NiEFJvBYYccc0K9N6Mo
	lFmIHaQ6Wilvd8iTxVfT3E2ylshbmkr1THcZY+4TOGzNm3gjE37TXJaqUqsZ0qWY
	WJUBtUg2Oej6GQY6euWKFdju56EiKeEqr2c6U9ATP7rivf+V75uRulIsnI+GBWWP
	OXgrEymYL3mybmm8lLe71Y7hz4Kt2deDtTesRf8T4CEr5rn+1LHUSNdxR2sR0vYv
	efhAlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw2yjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:55:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97955899so5615584a91.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 23:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407344; x=1784012144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSyfrpRIKSRAoUsq94n+yNFahxShqoblpfsaha6QZaA=;
        b=bVsTj2PIcHL5eX+rVep/DqSz6ctaeFHIstFtfo5VWaXFKT/oThARQ3ydLW/BaRd4Im
         ux1Y39w0yMVa7cpneG88BTcGh0NpteZxllHi4U+jB2zWOnLE3hJu2qJeLV97D2altWUL
         NNMEn3i1+mN6DCyjdWbg4OjSs4sCvhBdPsGTFJkSZNC15w3NhTXGInJtR6PyClrMmuqT
         b2RLRBTClZnxaAQ2aWznQGZsuDw+IMZPMvj6IszjErBBIWs9SyL+rV7G6upryIXbeGD7
         epNTu0xBuw6p5H4DAORKes8XR0mbu5VlTw6llH+iORz1/lARAm910YRq5k+fjMPALeGv
         8+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407344; x=1784012144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dSyfrpRIKSRAoUsq94n+yNFahxShqoblpfsaha6QZaA=;
        b=C70yzdcYg/wTywF0oX2AUc6wNVyY8dGw9cJSHHBXvb6oOX2wnSS20EWwlARrWH7jAt
         6sZ9+oYg3X1LeRAcE+U5eXnkllou109lga17YpZ2z9Fhs+6voseTt0OfcROEdcFhG1np
         Snqp9Dzr490wnXxt40QgEipHUK4x34fe6420VnZuks2jDC9ZqYyETNNRZX9VbWxgIIDW
         J+9PTNKJUFI37SQP2a/0QRzPtg/9fuDnTRpnZIYEZlQOyAf4lLC557AbvmJfI9Vzr4UY
         R/SDwEE7+6USgGVQnQ3NiPvdrC2/z/8PplYz+O5NSYOCx6I5d/eEt/pH/35ArMAxYOnR
         nzaw==
X-Forwarded-Encrypted: i=1; AHgh+RrynRbly6BqZqV5OtG0NCwINiFUJWxx8SYTuPHMr0s0uNuq10I1lmRRoIVsIyP0Upa9qhpQQWfYaRfc@vger.kernel.org
X-Gm-Message-State: AOJu0YxfyIGb/7l48K76yC1JrqLQtVLqB5krFvMJgXpgl+DA7aI/+rus
	h6rp/Gq5tzfb7uXuvk/p7hjnp7dmQFRe40kXIqi2xkR3yjWtSygegVvPq5HIFDXfcPhoo4xsDMR
	PRuehbmvKoJptcvd8ARRNwhtT683kqzTO0B96YRwGkMZqDni/Nw2rvaUXsQC6uDGO
X-Gm-Gg: AfdE7clb+SeurL58uSlkAEj+TMzJh4rBgijY6xhih/yEHYnXDarhUzblxGnf7mOVoit
	e7qYFuORH3Fi2cbkvf1VpJI+QMNOQRhi6TadXO4aT10GZM6JahdPpfzaG3tLapt6BiMdFyDAjgo
	PQ27v4e8plgcCYQZPGfQs4Few+qfIgvI8xVGiZXh87vHDaOVilR75jygMddbcXcGZRw/Nrs83gA
	p35HEuEZg7q87L6/m/cGouDbSqkBFG/Iq9/m0z+bY/xPfHSBSnUdikiwMqQnuoYBO7VPkQhUBCl
	M6YOoLE/ZstZaJJTLoaTXywLEH/ZMnruf/P9Av/RBxjape5MSOVLCwijbqvrqm4e/tg1YRaQlgi
	LcIK6GGwNuOqLedmcsqyXtgM1nt7mrAKNrbEnXpb8dK+JOXVWGZJsK+e9xc45JyHzy40Q0OvEFz
	k4U7D1Bq8+GgD3vJ7nrWUZxQfXUt5WYuhn2qRd42HthTFTOQ==
X-Received: by 2002:a17:90a:fc50:b0:381:f7a:2e0d with SMTP id 98e67ed59e1d1-3875854e02amr3885252a91.33.1783407343773;
        Mon, 06 Jul 2026 23:55:43 -0700 (PDT)
X-Received: by 2002:a17:90a:fc50:b0:381:f7a:2e0d with SMTP id 98e67ed59e1d1-3875854e02amr3885220a91.33.1783407343237;
        Mon, 06 Jul 2026 23:55:43 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm5055480eec.13.2026.07.06.23.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:55:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:25:24 +0530
Subject: [PATCH 2/2] clk: qcom: ipq9650: Add clocks for the REFGEN block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-b4-ipq9650_refgen_clocks-v1-2-e070624d03d2@oss.qualcomm.com>
References: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
In-Reply-To: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXyJA+HQFSxSz4
 ptLHTMv5nl5PyuSzJkZW0HzsE3v6iq5yvEG2/1XaLk+j+AbRrfdAfol63sWCR4NsUg05QC+1LZU
 4jPcBDRkG91TBEalXgacyjkXIhLhVAc=
X-Proofpoint-ORIG-GUID: 5Jbetje392EyXO2LADiEDmp-qdlMfC_O
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4ca2f0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=01XzkSfSECFqZOLAfFMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXxDMo/Ra8iRvi
 Rw2GYCubH3FFz1e60TL3nkGkMkRD/oTRROYfJZlTkM7EWmO9dHAyjbPiMotppMpuGmeELhr97to
 iLR2MYSQuLH/fEj+p+S7JQ5HTt5z4ebTdoUUefA359oYEytPgYAymdD0TQb/6l+XX3FMJ6CDodl
 3ytCkArgeB9WOgJlhhhQJNzalHC2zzWVJbdIXqooT2Xy9KujGwflRAMFzYU3zLiw1yNGtzs78/h
 hn88+oW+NoUPJ8Gy1fcZeTlYSiPwghnEJ7Ncy4kZSCqnFLJx3o6YGegRdyRRs/9eSe5oGvo8QIQ
 nfbLB0lWhYEpZZphLd4glQnDSoYQd3IZgKC63PesshhapP0wNJtWVuQH4S+/gtAXuusYFZBsstR
 afXpXPw/auGJldGm+5WyNIOkjBYZOsFc9chZEYSI5IMc6p+4I2EJNz7dlGbS5Xra84D4y5sFWrv
 c7lhYL6Kzb4soUqVHtg==
X-Proofpoint-GUID: 5Jbetje392EyXO2LADiEDmp-qdlMfC_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064

Add the clocks required to enable the REFGEN block which provides the
reference current to the PHYs in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq9650.c | 89 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq9650.c b/drivers/clk/qcom/gcc-ipq9650.c
index c556c2bbfd96..e65a52fdfa91 100644
--- a/drivers/clk/qcom/gcc-ipq9650.c
+++ b/drivers/clk/qcom/gcc-ipq9650.c
@@ -3022,6 +3022,90 @@ static struct clk_branch gcc_usb1_sleep_clk = {
 	},
 };
 
+static struct clk_rcg2 gcc_refgen_core_clk_src = {
+	.cmd_rcgr = 0x23004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_refgen_core_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_refgen_cmn_uphy_core_clk = {
+	.halt_reg = 0x2300c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2300c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_refgen_cmn_uphy_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_refgen_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_refgen_pcie_core_clk = {
+	.halt_reg = 0x23020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x23020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_refgen_pcie_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_refgen_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_refgen_pcie_hclk = {
+	.halt_reg = 0x23024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x23024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_refgen_pcie_hclk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_refgen_cmn_uphy_hclk = {
+	.halt_reg = 0x23010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x23010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_refgen_cmn_uphy_hclk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_regmap *gcc_ipq9650_clocks[] = {
 	[GCC_ADSS_PWM_CLK] = &gcc_adss_pwm_clk.clkr,
 	[GCC_ADSS_PWM_CLK_SRC] = &gcc_adss_pwm_clk_src.clkr,
@@ -3179,6 +3263,11 @@ static struct clk_regmap *gcc_ipq9650_clocks[] = {
 	[GPLL2] = &gpll2.clkr,
 	[GPLL2_OUT_MAIN] = &gpll2_out_main.clkr,
 	[GPLL4] = &gpll4.clkr,
+	[GCC_REFGEN_CORE_CLK_SRC] = &gcc_refgen_core_clk_src.clkr,
+	[GCC_REFGEN_PCIE_CORE_CLK] = &gcc_refgen_pcie_core_clk.clkr,
+	[GCC_REFGEN_PCIE_HCLK] = &gcc_refgen_pcie_hclk.clkr,
+	[GCC_REFGEN_CMN_UPHY_HCLK] = &gcc_refgen_cmn_uphy_hclk.clkr,
+	[GCC_REFGEN_CMN_UPHY_CORE_CLK] = &gcc_refgen_cmn_uphy_core_clk.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq9650_resets[] = {

-- 
2.34.1

