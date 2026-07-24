Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48CF3F3280
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905239; cv=none; b=p6wjx/AqOZDvgH7Q039WpIdga7T0MtAwsTMgwlji6+MXUL4l2GbBwe7hdUOFeTV52I8FfbP/hpCX/9kGaC/ZraJejqEMg3fjYTMzws5XjmUAunFukM1/7LTmZrTAeTLIvgFFC7a8Pn6f96TWfEjnC3BE2zvHBzq3gOe1SN7MKZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905239; c=relaxed/simple;
	bh=zTQcqLYlQDlmAy2iVnrWcqgFUMTKnt1qbeSQpUH4RCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/NF8PWqHsUvIASxSdNDehjxltGURr5FsAp2SW/afAUePhg5t7OEyU6Jtiz3jzNnJSds4bCa3IuqnQig83YGZMNAd7zIMo+1sQC2StGMllhxTrAm/RrNbfgyP6da7zQ1noKvVtJKoQWf5y9Id/iBk2SdfIj7XxzrUCblnsEhRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHEJSIan; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9FAZmpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHEJSIan";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9FAZmpD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbNUC3089976
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfH0Cq6iojlNXX/T28K0N3XxoplS8jtmiAZYldnabYc=; b=BHEJSIanL4iBan1R
	6YWyQsuqtXpJuF/+MXmaJ7UE4chugT9hTy0alIxsCROHHBabgOSNx8cUtYl7dxSi
	UafwMeGXxfO8FhCAkCnx+yEMRUL5F0p/Qw6LeUwFLONaz+m/oqlhfSMsmC3Wbbdy
	KVFjtAIBAd75gJewuBonotpgsPSwT3qAOykt5hAIXEnv8d79RReo5LajwV9ZqR8T
	23kici0jk5L9+0bwTF8DkB/m0WSpthDZTApqmU11+DZPKAP+CD5nlIITpYsG98ga
	YO/2bXvmUrenOaoTdB0D4fKk8gXGc0FTjkgk7amGggymTcS5r0x8s4k6TkifphR6
	+MQNUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgggcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso717945a91.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905232; x=1785510032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfH0Cq6iojlNXX/T28K0N3XxoplS8jtmiAZYldnabYc=;
        b=L9FAZmpD6LMRClB5XQ8zvu84BANQ9bypXIsrkH2QxE16ZkNVKt53QuM6FfIemNbhEF
         l1So+DMjm5tf2Xc9/s/NclxRdDdPs5ADjFTlvKr6uHy/z/LjTeNlTr/MRLinmMUP2sYX
         DAe6wxiaBmaW1dAINBLYEtuAFAc+GHR8y3EttJydvyq2j/duz1Wk2XdH8r1ikTw8/f9G
         s4hmlVpMLocxioY2hJwqrL6Lg8pb0Jte7z8tkIPAR3qItgs2BtMgMwx9dobz5kRwem+M
         nRPmb5cThuyg1BY2qBg9ZLt5sBfASOCKZBlBPgVYLfqTYUXdYNe/ma5tyyzCsvPKoOcd
         v23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905232; x=1785510032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfH0Cq6iojlNXX/T28K0N3XxoplS8jtmiAZYldnabYc=;
        b=M2OimjgfN9UcSiG3q8zZlZVcgQaHtjJCRIJeFTcmObBVoHxxL1O1409H3HdADvxHB4
         OdaN1UEJfwELdrost9FJPKtCEplhtqr0stfCuDkjww6r55yf6clPUr9UjkrIVSROvdzc
         bgldJBf73CvIulSnP8mE9dRu725VuFvdwg2ldGQltxu1IRBdR0//FbadlZXr3rsJlSWw
         TQOsFJRh1ARAHm717NyCZv+NIYDyEs6lU3UVqM9F0cPjXV6m4oJLDOC0yh0NS3NaBON8
         7pl4ZBmz5vH9lzJ2VWGy+01LftB/noEhz6mfbR8BlZG+HLEu4qAQa6S87+I825Un/8zy
         EvXw==
X-Forwarded-Encrypted: i=1; AHgh+RpSY1RCaCP0c88X3wYcG+7skIdan4S8P7bDU5GsWIDlO3/LSYdlYNP52Dmuab6zcTYiI5DyHoFBo8Es@vger.kernel.org
X-Gm-Message-State: AOJu0YwDYHOnLaSpuA6SkoxnQfuPFlkXDnL9AevqONiHFiusY0TP84xs
	lXOkpo+T/cSunLPg3ZHgLweT9HHcvQd1agr26L7+xvd8TaCGEOj9EpuHAI9Q3csM4tIQc9rzUWu
	MJo9CCF84HMM4VYpSX/HT0ZLJmHwh4XeyaZESQbwuEA5mwo8i/c3+DkRx0pTR0PDEnx7CvQLUGK
	/RNA==
X-Gm-Gg: AR+sD126qK84HoIq6x9t2Nmm3a2AOtjkyUXwnURVS7W5cZ+YE51iBZKMosNjuxNEBd5
	qvW13jyetJNzaq025ZHdsmEFtnT32tQPetB6RfnMhshVXcoMpS+BAqBFTjhHw2CzepCRaSkumN1
	DuEmkVG8LyZUbOOM+OPopCDFCsdxJlAIfEsZqJ+p7wItUJjJzlFVqVQe7AKqiBL4TU46wLgUuG6
	SiVj/9QapffYSKk0nk2DWhRNYxFu6tevUEaf64CFQ3nu/uS2kDJ7po8dYw1Z/HkgzYQTYc9KI+s
	0FITnllQsktqVBX1mZxXm7yCRs7xPFXtw+phS9YSHAf979dtyNytC4gsdRpOsnfHSYLkEQtNTpC
	wldmM7iVQJpLKalEC4y7Xst9IUU5h9Y5ci64Q8uUWhFk=
X-Received: by 2002:a05:6a21:7309:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3c44b00c842mr8660263637.23.1784905231509;
        Fri, 24 Jul 2026 08:00:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:7309:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3c44b00c842mr8660214637.23.1784905231106;
        Fri, 24 Jul 2026 08:00:31 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:30 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:28 -0700
Subject: [PATCH 06/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-6-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=6027;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=zTQcqLYlQDlmAy2iVnrWcqgFUMTKnt1qbeSQpUH4RCs=;
 b=A2YwkLkzNpWlrokxMZNvxcXpTPT2ZWECdE9t3Np8aM6eDOSmxq7BTLWpZHFErGa7sVrfjUkoJ
 tcOg2Rbtx5hB+iUIdFf7ODmpWpvkpwp0KptGFC5VjZrawXmhjFRpRGc
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX36JNcqxVuFcW
 345it12rgzrjivxwru01vlXEctEWvh5VHz+/VXNiuJgOG8gQQTRZFFoLIp8LAUmpy6V2Izt90jH
 Hb4/ZC0Bb9SZm5+dkTw6smTuBkKpjuzIocWe3Qwm7/9vI7Ac5ZOYfD0aysky+2dVvjmP5Z/7rli
 +VBzfBGZBbcv086gM6VwfZzy1tKi9IY3Kwr34ee+IW6XrA50mFCECP82NdsgNBext/oMN8iqqYo
 nephJXMFmvqz/X0c2AdAT0vPdQ5NXGl1xP9wWIcveEuGezBlKbfJS/OPGMuOjhvv07rtz8cIH/z
 Nlal3p3XAzP+bAHWU70oD8pgeUoDyB2+3sJybnMJrJeEKWxKQlsR6hdaSsJKs7LXAWyQ2IqCW2i
 +OopfsMdYWzdysLCoy5K5/dZjcW4bBQlRyisvclugjfgImgyfeXMicODHizl13CeiYxIjN1DriH
 qwvvdURnMM60DP6Zk7g==
X-Proofpoint-GUID: dN99IdNxbYpY3gS6ydonnXH1lqmhc2UC
X-Proofpoint-ORIG-GUID: dN99IdNxbYpY3gS6ydonnXH1lqmhc2UC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX9DMgkE8uAcwR
 rKY9LYqlNOkR/D7BsrlVp2X9uieSCx5fyfAMSbF9Y1xivQYB6m+L+rhFER3QqqvoEaHWEUtUBjO
 EQmyLTKCpGy/wenJvlG+Diz9q8nxH4Y=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a637e11 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8Chi_m1JwMEKIEjeEt8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

The PON (Passive Optical Network) reference clock is derived from the
CMN PLL output divided by 2 and then further divided by a configurable
8-bit divider (1-255). The clock supports two modes:

- UNIPHY mode (CMN_PLL_PON_MODE_SEL = 0): fixed 31.25 MHz output
- PON mode   (CMN_PLL_PON_MODE_SEL = 1): pll_rate / (2 * divider)

The clock output can be independently enabled and disabled via the
CMN_PLL_PON_EN bit.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 158 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 020ad12ca1f2..1ae32052b563 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -72,6 +72,11 @@
 #define CMN_PLL_NSS_PPE_DIV_MIN			8
 #define CMN_PLL_NSS_PPE_DIV_MAX			63
 
+#define CMN_PLL_PON_CONFIG			0x42c
+#define CMN_PLL_PON_MODE_SEL			BIT(9)
+#define CMN_PLL_PON_EN				BIT(8)
+#define CMN_PLL_PON_DIV_CTRL			GENMASK(7, 0)
+
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
 
@@ -540,6 +545,155 @@ static struct clk_hw *ipq_cmn_pll_ppe_register(struct platform_device *pdev,
 	return &ppe_clk->hw;
 }
 
+/*
+ * PON (Passive Optical Network) reference clock operations.
+ * The PON refclk is derived from CMN PLL rate / 2, then divided by
+ * a configurable 8-bit divider (1-255).
+ */
+static int clk_pon_refclk_enable(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	return regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			       CMN_PLL_PON_EN);
+}
+
+static void clk_pon_refclk_disable(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			  CMN_PLL_PON_EN);
+}
+
+static int clk_pon_refclk_is_enabled(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	return regmap_test_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+				CMN_PLL_PON_EN);
+}
+
+static unsigned long clk_pon_refclk_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+	u32 val, div;
+
+	regmap_read(pon_clk->regmap, CMN_PLL_PON_CONFIG, &val);
+
+	/* Check if in UNIPHY mode (bit 9 = 0) - fixed 31.25 MHz */
+	if (!(val & CMN_PLL_PON_MODE_SEL))
+		return 31250000UL;
+
+	/* PON mode: calculate from divider */
+	div = FIELD_GET(CMN_PLL_PON_DIV_CTRL, val);
+	if (WARN_ON_ONCE(!div))
+		return 0;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * div);
+}
+
+static int clk_pon_refclk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	unsigned long div;
+
+	if (WARN_ON_ONCE(!req->rate))
+		return 0;
+
+	/* UNIPHY fixed mode */
+	if (req->rate == 31250000UL)
+		return 0;
+
+	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * req->rate);
+
+	/* Clamp to valid range (1-255) */
+	div = clamp_t(unsigned long, div, 1, 255);
+
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * div);
+	return 0;
+}
+
+static int clk_pon_refclk_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+	unsigned long div;
+	int ret;
+
+	if (rate == 0)
+		return -EINVAL;
+
+	/* UNIPHY fixed mode (31.25 MHz) */
+	if (rate == 31250000UL)
+		return regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+					 CMN_PLL_PON_MODE_SEL);
+
+	div = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);
+	if (div == 0 || div > 255)
+		return -EINVAL;
+
+	/* Switch to PON mode */
+	ret = regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			      CMN_PLL_PON_MODE_SEL);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+				 CMN_PLL_PON_DIV_CTRL,
+				 FIELD_PREP(CMN_PLL_PON_DIV_CTRL, div));
+	if (ret)
+		return ret;
+
+	return clk_cmn_pll_ana_soft_reset(pon_clk->regmap);
+}
+
+static const struct clk_ops clk_pon_refclk_ops = {
+	.enable = clk_pon_refclk_enable,
+	.disable = clk_pon_refclk_disable,
+	.is_enabled = clk_pon_refclk_is_enabled,
+	.recalc_rate = clk_pon_refclk_recalc_rate,
+	.determine_rate = clk_pon_refclk_determine_rate,
+	.set_rate = clk_pon_refclk_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_pon_refclk_register(struct platform_device *pdev,
+						      struct regmap *regmap,
+						      struct clk_hw *cmn_pll_hw)
+{
+	struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init = {};
+	struct clk_cmn_pll *pon_clk;
+	int ret;
+
+	pon_clk = devm_kzalloc(dev, sizeof(*pon_clk), GFP_KERNEL);
+	if (!pon_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = "pon-clk";
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_pon_refclk_ops;
+	/*
+	 * The PON reference clock may already be enabled by bootloader
+	 * or consumed by hardware without an in-kernel client driver.
+	 * Add CLK_IGNORE_UNUSED so the clock framework does not disable
+	 * it when no consumer has claimed it.
+	 */
+	init.flags = CLK_IGNORE_UNUSED;
+
+	pon_clk->hw.init = &init;
+	pon_clk->regmap = regmap;
+
+	ret = devm_clk_hw_register(dev, &pon_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &pon_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -589,6 +743,10 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 		} else if (!strcmp(fixed_clk[i].name, "ppe")) {
 			hw = ipq_cmn_pll_ppe_register(pdev, cmn_pll->regmap,
 						      cmn_pll_hw);
+		} else if (!strcmp(fixed_clk[i].name, "pon")) {
+			hw = ipq_cmn_pll_pon_refclk_register(pdev,
+							     cmn_pll->regmap,
+							     cmn_pll_hw);
 		} else {
 			continue;
 		}

-- 
2.43.0

