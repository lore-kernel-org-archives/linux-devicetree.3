Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EAB456284
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 06:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085617; cv=none; b=gdMILxiRaVWCsKIf8GYN0QeZU6R0cRxl8Mq2KG6KrUDJhwbLS6FBFWRHEUq755L8/hRmksB51POMAFlu7RCdzHlzWlmMi65MZtDu0dV7UuopL1FBybGK0g6l7+/AC2QqVN0NcC1dKW/xoKoGmSYEerGrIV4UIV8tdWzuTxMVeY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085617; c=relaxed/simple;
	bh=8AGrGTWZ1Omroe4bqB6YG0tK+J2aDW7BFUAlksllTEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbTiFbuql346YUMOnxPjpHgEA16aODmwzMlIaYooMKeOZr+zfLGGXiJjhM9g6Kb4OhBL/YJJawzn+lZ0LC3NIjskGxe4XcfJUF5RwGue8NTxCyHP5ygcnOWuKZgDADo4Iptne3cC4o24cxcugniD1pKfmJIzqAS2fOrpwz6MaKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OF4QJD3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhEI4QJa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OF4QJD3J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhEI4QJa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GuVo3829439
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 06:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhJYWZh2HLmiS6rNY5RJR4/ao6E4NMSjFBlxHAFqHf0=; b=OF4QJD3JP5uvRG2A
	pO35s8ehw42oSRBtcFjcRwNOIEQb2FXKnYsDAiydE6qeowaLONkBFYx4ggtUkqpW
	FFtYTI+Dix7lp5Pgpmh0O8vKxkj1+msBQJZ5N9CzM9A+4ZVDMelknJ7uOvNUCp6j
	g4eFcsYR5veoN1mK7DwYSK0OW+nSlKJ//Fxxc9mp2QiMT61WhbpDWie3GiIFv1My
	Yw8tOjL2q+N1gJkkNg2/0xgYMrd5ChEkg5VBumqvvKxyYw1tXZvd9GDaY19fWOV7
	r9CSq9B8JrwTKjx3nE6ToSfDQuveAKSH0Ii3f2TnS2hY61iBvpclMiFzkuwLuSME
	6TR0vA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gtrhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:53:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so3099829a91.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 23:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085613; x=1786690413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhJYWZh2HLmiS6rNY5RJR4/ao6E4NMSjFBlxHAFqHf0=;
        b=RhEI4QJayz3Wrd6hVLj0vcq88VqfDuJAswfklqUAtIyO2yXcaVAzYy7/TyMTje/giB
         W4VZ5ug8ONZobhEfonsDPUJGxqW6pLizc7qLxNj2lvcj3tB7zJc/KsIEaJODiIdYyL8x
         A+R3gSL9aAO27WwhX52uxLxDbkUr/fAVkvK9QdcaqzWuHdi1lkqVznEFpC+czrrEe3aW
         M5eErlhaynLoHBwfGxOTHp9Z/lHsjLxdxPtEkIiZaBxNjUfDHSjNoE3ONRCtAd4R3DdB
         qYMX/K9RnxEmF6yufB0yy4Houxeh5Z3SIXg4rDfuBBCZ3pN4chKc7grcYw8ajbo1So+G
         WGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085613; x=1786690413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhJYWZh2HLmiS6rNY5RJR4/ao6E4NMSjFBlxHAFqHf0=;
        b=J+DfvDsZy6csdZ7K/x1mv0qfFqRK+YqatMxWhqPfC0W8RR+/NrwaWAGsG6oj//Vf9s
         K2D9b/BPNWnr2g+sT9mAl/eTvTcnrpsLgex1k3ejNO+P3552VcPmQ42gJu5DOA+8jG5Y
         MUvvFeddIWtHzPAfhMq0BFjAFAWZ4RwoAL6n7GBItC3sTF3LDMToLj9tbQtIEQ4OXxDn
         b8C4IbW5FqbnHmmPljTv4S3iyxf8VPanUptPvFSvWosLhDtUmDJVAeeKcmsIOdbyC4XV
         +SLsO3UVVvToFLKtkux4WFdFZXkYZjjUhyGYsmCSxz/UzFRSu0wkRKZzgaP/qOy2MZNi
         ZdSA==
X-Forwarded-Encrypted: i=1; AHgh+Rre3e50u2KRo1vlxR5bdBM2X6g6JRZEb6LNhdTUcLaR6RzzfnZWn2LX7VNM9jl9qxYCfhJuR/kup748@vger.kernel.org
X-Gm-Message-State: AOJu0YyOvEi+e7+5GZvq8m1MFu/tVulvauvu8u43s6qzMLfm83mx7kd7
	jgzvuMJGG5GiODxAR0McRSmIuRWFyRv+rrWTEpHsQR0/DWhay9v17ZLGLDR0qt8c/ZAybmB8XaM
	4x0Ahke7ISUS+y72sWcye6GcEFNFyr8j0XfqHeBfcPYRfuWv39mifCiicHI0TfOuz
X-Gm-Gg: AR+sD13BnRL174Pz5xNhn9X7i2YP4LDRh1mcNgWt5MZJUBXHW9mKmt4Y0uZHZcpv28I
	+UcdUNyWAxIp+56BekctMGm8SMnofL7YM1nBEJqya801MhlpaU76K5mpb+e6+4RS1kbdeobe4fH
	bfnyG2dfIO0F9K9YNI+Pg+EKBFsXzx7/bG2W4n2G49NWX5SkhHmiKEdXpCzZBPSuc0nUG/G4J14
	Q4JUXFVllV2w9BdYQUWoBmIPwqIa9dmP0I90qcUpBYrDKpIFvj8mwdmXohWqdr+dmv6/2ZbxOen
	jRjzCzqLjmdhmwK5yd/a6l5v8JCkFJC/Jn2XaRURAoVNOFcrwcXefwGOPQUVQvvKBk8RCu/haaB
	MPr+e4avhqckavuR0lhQNlkxc/11FDCpdb1aSOd1jbsM=
X-Received: by 2002:a05:6a20:4307:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3cb85dee55emr22281772637.1.1786085613149;
        Thu, 06 Aug 2026 23:53:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:4307:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3cb85dee55emr22281734637.1.1786085612711;
        Thu, 06 Aug 2026 23:53:32 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:31 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:14 -0700
Subject: [PATCH v2 10/12] clk: qcom: ipq-cmn-pll: Add all output clocks for
 IPQ5210
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-10-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=3702;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=8AGrGTWZ1Omroe4bqB6YG0tK+J2aDW7BFUAlksllTEk=;
 b=sGlYxxOiomCs5EFOOQgWVfK3g/F6E57smvesZkLOwiELlbmuYuUiiaDiDzbLyeQkMopBfPHPE
 TWtxFIkHjWQAjdeF3Y0XophmkTggZM6khSziAUz922IderBsVzoFHtv
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a7580ee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=P04cmAjberRrbCkX5BgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: o-2TS9E9VldLSJii9pVcJ8RnrA24MaY3
X-Proofpoint-ORIG-GUID: o-2TS9E9VldLSJii9pVcJ8RnrA24MaY3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXxrZ8jBRe5c3L
 fRjgXhNs5ZuKLIt9Gg9kw9dat3vPVhn1UkeET1RU0sxAk742DnE+S2F1HdlBeAiYEcTbBBW0RLr
 tB/095SXZT1c3GMJ4mr6kcBAV/bXaW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXwW5KUcxNp858
 CyBORNvpGgVkk+fCF8JJwW25MYMDOmCPso/PvUZ32tVuckhCHj3Iv9019Z3qqYOBYbERQL8T54Z
 2nHDWmBYYe9/yCz83XiVJmkOlYwkRTT45qa+0J1P7TOmzhn/NAYlFZw54gZPI3dFVfpii217kFT
 Thtd82wsFlMytS+NaocDfQLi2Krnw/wgXKk5UG+kWwt6kcdYf3y3GqiBgbWQU9MpvZ3B0gMEgWT
 yn3oUqUOU7t3FN/2/Il74sMWuYkMA0jvpeMFixMNZs7IILL1T8dgVmBAh/yyv8k8SQWuQiYXMDV
 UCfc+GVfGXVwbAd+JaeQ53ggA9n381Fyv71+fMziZLST1Llscly97D3SoKcrztI+K+rXVRhCFLv
 b6/KO3NJhAbfcWCKOWfKJZeP4kKxYRm6OWjJRe/2AVFvWlsdKTSx1NlxL9tGsN7xFDvNerh1Dfo
 Q8hi+uyY7+Ai9SraS4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

Add the IPQ5210 output clock array and the device match table entry,
wiring together all the infrastructure added in the previous patches.

The IPQ5210 CMN PLL supplies 12 output clocks:

Fixed-rate:           XO 24 MHz, sleep 32 kHz
Gated fixed-rate:     PCS 31.25 MHz, ETH0/1/2 50 MHz, EPHY 50 MHz,
	       	      ETH 25 MHz
Configurable divider: NSS, PPE
PON reference:        PON (enable/disable + 8-bit divider)
EPHY-RAW:             125/312.5 MHz select

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 2b05896ff00f..eeadc94a23df 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -55,6 +55,7 @@
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
@@ -182,6 +183,18 @@ struct clk_fixed_gate {
 #define CLK_PLL_GATE(_id, _name, _rate, _bit)	\
 	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_FIXED_GATE, _rate, _bit)
 
+#define CLK_PLL_NSS(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_NSS, 0, -1)
+
+#define CLK_PLL_PPE(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_PPE, 0, -1)
+
+#define CLK_PLL_PON(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_PON, 0, -1)
+
+#define CLK_PLL_EPHY_RAW(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_EPHY_RAW, 0, -1)
+
 #define to_clk_cmn_pll(_hw) container_of(_hw, struct clk_cmn_pll, hw)
 
 #define to_clk_fixed_gate(_hw) container_of(_hw, struct clk_fixed_gate, hw)
@@ -200,6 +213,22 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq5210_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ5210_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(IPQ5210_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_GATE(IPQ5210_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL, CLK31P25M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL, CLK50M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL, CLK50M_EN_BIT2_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL, CLK50M_EN_BIT3_BIT),
+	CLK_PLL_GATE(IPQ5210_EPHY_50MHZ_CLK, "ephy-50mhz", 50000000UL, CLK250M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH_25MHZ_CLK, "eth-25mhz", 25000000UL, CLK25M_EN_BIT),
+	CLK_PLL_NSS(IPQ5210_NSS_CLK, "nss"),
+	CLK_PLL_PPE(IPQ5210_PPE_CLK, "ppe"),
+	CLK_PLL_PON(IPQ5210_PON_REFCLK, "pon"),
+	CLK_PLL_EPHY_RAW(IPQ5210_EPHY_RAW_CLK, "ephy-raw"),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
@@ -942,6 +971,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
+	{ .compatible = "qcom,ipq5210-cmn-pll", .data = &ipq5210_output_clks },
 	{ .compatible = "qcom,ipq5332-cmn-pll", .data = &ipq5332_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ .compatible = "qcom,ipq6018-cmn-pll", .data = &ipq6018_output_clks },

-- 
2.43.0

