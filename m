Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969C6347FFE
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905233; cv=none; b=Bta96fVXLxX9+B51JsItPRY1RuXpezQKkNDCuJOdrWiSgpNfWrwQM5K2dXptxHSWdxc9ERESfqP/lyrdc2XS1zgGIsXSo3A3qjpLKfQknp9lYrfWlT2aWvMCwDpyvS+WucW2ZZ65Sqc+RlxHwGiTnXLSHbwM8YKCFJBOnbCYe1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905233; c=relaxed/simple;
	bh=C6bCrhA4GOQmpqayFiDLO3B/ou7vIoV+F+3CvOXkYEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZ51Xf9AtegxbEbdna2GFHDW33lfUzrinJaE1gdbAEU1TiIffK09hE2/0wAs8UphORHz4JgKlZiQx8ViZeJEsDiTZR2dXHfpAt1mxvNB9V9E8aJ2sKyF0ZMuVsNG/2Smgj6E7PInV+w7RTa56Ia6pTsYVJfMboYVe20dRoLJ+yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erdnW+uO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vkfm2zrk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erdnW+uO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vkfm2zrk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbSO03090545
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZnZwtwXnJNQ2NDcPGYd+RgMjGx3P5zKofQByL2OzTFc=; b=erdnW+uO882ltTKu
	cmAlEuRHLF3m22i8zWWa7p/0F9IL7tM8iI9Y+l2uel7ZLCpSHuOVtFhJjwXjQy+D
	Mjmx1IhXcAkWZ+0Wz0TcRDQlyaq79M2+avvjx3yhS/Y6pjOhQyR7PZDLKFNYflxL
	KK7RbH3iFB8VxWEs85BeP8ISKuCq7GERlcv0d5eJufdYOTwbVBt7qIAY6Q8ixfqk
	aW3gpVILvF3Qi9WidYL/LAX4RjL/RzkS/aE4MY6oQMva98RzspMfYiH1OJX/MEl4
	26j55FHZ4aAfyQ2QJ8PFKig3ueYeFkcGXRo4Fh4rrTr7eg6qdCUG+y2XxrcUtlzd
	RG9wEw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgggc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso433185a12.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905230; x=1785510030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnZwtwXnJNQ2NDcPGYd+RgMjGx3P5zKofQByL2OzTFc=;
        b=Vkfm2zrkKatNBphkIQay5a8zFIxSvLHXieZco4RxAH0931L+e1ubmunUpos3EijWig
         zwm5MvlcakaiecoGEPphYS9KXHCjO+WrlM+5Bxh0MN5SJY5El9o5Yo1yFj2is4tsDu8R
         coDZ9NKcTGM/6y82828Dv71qpyGkqpi/FbxY+TlE9+sFOtsm7Pr+K/EvGQ1i+kDFd5ib
         jpijf0fBcGSb0WQpelcOjgxxj0284ur/ootE6x7nxzOJBTt+60uBOigJbBW7bzw2022B
         FcxOdSOSpuELW9DBFdEFMS2khMjgH7lDPBWNL3X04UwnlXo9W5/UF760ay1MYmOTnjaN
         whPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905230; x=1785510030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnZwtwXnJNQ2NDcPGYd+RgMjGx3P5zKofQByL2OzTFc=;
        b=my1ZKnO8m0vmedAtzEG2dI0+PsFpML59L8qkdlmeH3hOYwXzXown/BlBay/k9JTiEb
         csQiCfXH7vFeakOmw6PwKKRsr2LnE/CTMygDDPrAwwxSk7la1fDkk02YoC8Py+/mL0xO
         fhSyAWsZq4gQK4HaO6BGno3y9UEp07wVMEmWnqPn9uemq5BNqY0xCG3cbwjhRouQ9Oix
         R/y93/nJ5Pxj0KR6ZvE93w+UZCVgXjChgg8MJOEsY0vPkFLQBOX7m4ccz8HVw7ro6SDf
         ePsFFXGVnSJpVah7oeNET/Hys1EIV6SZNvluQeeKPWqCrBKhnNVLX5k95fUCF9JX/vTn
         SyaA==
X-Forwarded-Encrypted: i=1; AHgh+RrtQL/6XLKWdkHN77Ajj/f7X/wHqh4P+Bx4JLrnyKd9jtA6VmKGPnAyvVCFX8lGUyUxlhXZ42KOXUiN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2HVxbSBKoD6VDhc+hpJBxC9AxVjqR7muOjupenXse6yOG9YML
	NNWGNcqsD4bfYmK60hP86/zFPwT4ZZE75hTKMCJGFVvzEg5NmxQcoi+7ONpcHQ0I4trr6UVZjmR
	huaRyq6/ccQHex6S9pu9IMnShFx+ZQ2e/aGvRux49oS+whxqxi8bzVLk+PUNbCidLzYJEpnoYFK
	lIMw==
X-Gm-Gg: AR+sD12r2oC/Le2WChy+ucwPq+YSGYc1DMGcvAB2WB2rC78Om+7N+qdkd0AV1agROwO
	ZeS5D3PUb9wHxuaxTXLgwIkaKWkujeoi72RUzo2xMHdV+xj7jEeH6WsM1fBHhCgdErY3uREgI4Z
	sShYtF4VxJVlbhMZcZW0+Tbx/j7rw4ZQTNqAVPYCWQtmBP25/zS8UJRkK6jzAbrBtbgNL/qSb4v
	PnUHuvkYN1paKCcohheIztYnDosEtdSUVZHQLUd8uk5slr0K1T8HWZVZVLu7JfYRxHLjg4zU3ij
	BQ0C1LaxwXjH0AlTwD+bv2eVNNdNcpikiaKSWZfly1/9yit3Nr0ycpY+94blTls0ozdmWrIt6RA
	IWOr4GdXXzMAVBnsodz5clXB4npezMnBtuixGVEZTPQA=
X-Received: by 2002:a05:6a21:700a:b0:3b3:1b38:d9d6 with SMTP id adf61e73a8af0-3c44b153cfemr8292756637.39.1784905229743;
        Fri, 24 Jul 2026 08:00:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:700a:b0:3b3:1b38:d9d6 with SMTP id adf61e73a8af0-3c44b153cfemr8292689637.39.1784905229140;
        Fri, 24 Jul 2026 08:00:29 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:28 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:26 -0700
Subject: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=4885;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=C6bCrhA4GOQmpqayFiDLO3B/ou7vIoV+F+3CvOXkYEc=;
 b=EgDDD0BiUor4EKbt16U1jvez8bprociY00r667OgejSgZzFdAw1N2Yxa0fI7HyZ7oVdsAJNGm
 mCLKj6e6StbBKjXPR9bCH7PWu414T7SJgI88600JF60vjNK0Q79KZOh
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX9mYJmUSs40Yo
 yZ97HcecqPuXbXHse93IjUvuHpxj6EKK83CCkugFQ/KBUWFJUHpmsPlKCsPyM+ncI6Xcr46KuGI
 d+datWgyoZxdYhY2gfexu7FfIyPGi3DBCyiSPhB2re1SgUwrs4uFrC8A8to8Z6qrYDpRV4hym2P
 lhBDgek6ovTR7fzMXhlGfjMwD+1+Hf5w/4Z7pzUDYN0PskNSQMqU6w6cM/5gc39TEOwtkb1QzQ1
 dKu1CZQKovtOUvFd7q2WcadINXVVubIo3dn8y6aB/PSsUNvFifgJ7ae1H0yPuDNwRz/3puJpdg8
 zgbRKgItknaS6Z2Uw8Yy+kFfngJwYukAM0tD2EaVthLuxBygibczQnU3rmVh2jiWxn+zHTcaBjh
 3WLaP3gHw6ngj/5uYLD/S7w7XV4L35PlDNIcFyu09eVgbSnfxc+xsCF840FXKrDy5TyNsTEdIVa
 W3f4OC5EaJZWSG/pQKw==
X-Proofpoint-GUID: JzpsaPbwbS6Gl4UsevMz_ErdPIYg9Ttk
X-Proofpoint-ORIG-GUID: JzpsaPbwbS6Gl4UsevMz_ErdPIYg9Ttk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX/3098ZANYyo1
 Rxy4YxPms+bio6XrOJeAMHpA4r6ksik+xCj3/hnZNdT7fmo6y7bm/62FWZYujyKHSjHzo4ZN7qG
 qDrg/wlAYK/SbLXMyZDgQNfJYThLca4=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a637e0e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5lYwWfJxAk1uVq9XzUsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

The NSS (network subsystem) clock is derived from the CMN PLL output
divided by 2 and then further divided by a configurable 6-bit divider
with a valid range of 8-63.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 119 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 114 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index aa319d577871..3df326c22fba 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -66,6 +66,11 @@
 #define CMN_PLL_LOCKED				0x64
 #define CMN_PLL_CLKS_LOCKED			BIT(8)
 
+#define CMN_PLL_NSS_PPE_FREQ_CTRL		0x98
+#define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
+#define CMN_PLL_NSS_PPE_DIV_MIN			8
+#define CMN_PLL_NSS_PPE_DIV_MAX			63
+
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
 
@@ -364,11 +369,105 @@ static struct clk_hw *ipq_cmn_pll_clk_hw_register(struct platform_device *pdev)
 	return &cmn_pll->hw;
 }
 
+/*
+ * NSS (Network Subsystem) clock operations.
+ * The NSS clock is derived from CMN PLL rate / 2, then divided by
+ * a configurable 6-bit divider (8-63).
+ */
+static unsigned long clk_nss_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct clk_cmn_pll *nss_clk = to_clk_cmn_pll(hw);
+	u32 val, div;
+
+	regmap_read(nss_clk->regmap, CMN_PLL_NSS_PPE_FREQ_CTRL, &val);
+	div = FIELD_GET(CMN_PLL_NSS_CLK_SEL, val);
+	if (WARN_ON_ONCE(!div))
+		return 0;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * div);
+}
+
+static int clk_nss_ppe_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	unsigned long div;
+
+	if (WARN_ON_ONCE(!req->rate))
+		return 0;
+
+	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * req->rate);
+	div = clamp_t(unsigned long, div, CMN_PLL_NSS_PPE_DIV_MIN,
+		      CMN_PLL_NSS_PPE_DIV_MAX);
+
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * div);
+	return 0;
+}
+
+static int clk_nss_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_cmn_pll *nss_clk = to_clk_cmn_pll(hw);
+	unsigned long div;
+	int ret;
+
+	if (rate == 0)
+		return -EINVAL;
+
+	div = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);
+	if (div < CMN_PLL_NSS_PPE_DIV_MIN || div > CMN_PLL_NSS_PPE_DIV_MAX)
+		return -EINVAL;
+
+	ret = regmap_update_bits(nss_clk->regmap, CMN_PLL_NSS_PPE_FREQ_CTRL,
+				 CMN_PLL_NSS_CLK_SEL,
+				 FIELD_PREP(CMN_PLL_NSS_CLK_SEL, div));
+	if (ret)
+		return ret;
+
+	return clk_cmn_pll_ana_soft_reset(nss_clk->regmap);
+}
+
+static const struct clk_ops clk_nss_ops = {
+	.recalc_rate = clk_nss_recalc_rate,
+	.determine_rate = clk_nss_ppe_determine_rate,
+	.set_rate = clk_nss_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_nss_register(struct platform_device *pdev,
+					       struct regmap *regmap,
+					       struct clk_hw *cmn_pll_hw)
+{
+	struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init = {};
+	struct clk_cmn_pll *nss_clk;
+	int ret;
+
+	nss_clk = devm_kzalloc(dev, sizeof(*nss_clk), GFP_KERNEL);
+	if (!nss_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = "nss-clk";
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_nss_ops;
+
+	nss_clk->hw.init = &init;
+	nss_clk->regmap = regmap;
+
+	ret = devm_clk_hw_register(dev, &nss_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &nss_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
+	struct clk_cmn_pll *cmn_pll;
 	struct clk_hw *cmn_pll_hw;
 	unsigned int num_clks;
 	struct clk_hw *hw;
@@ -395,14 +494,24 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	if (IS_ERR(cmn_pll_hw))
 		return PTR_ERR(cmn_pll_hw);
 
+	cmn_pll = to_clk_cmn_pll(cmn_pll_hw);
+
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
-		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+		if (fixed_clk[i].rate) {
+			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+
+			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
+									 fixed_clk[i].name,
+									 &pdata, 0,
+									 fixed_clk[i].rate);
+		} else if (!strcmp(fixed_clk[i].name, "nss")) {
+			hw = ipq_cmn_pll_nss_register(pdev, cmn_pll->regmap,
+						      cmn_pll_hw);
+		} else {
+			continue;
+		}
 
-		hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
-								 fixed_clk[i].name,
-								 &pdata, 0,
-								 fixed_clk[i].rate);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
 

-- 
2.43.0

