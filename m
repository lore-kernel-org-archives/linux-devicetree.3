Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00B844470C
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704304; cv=none; b=C0/Gvnd2qkYYiuAN+jwSlKVvW8CZQbgqWNJbMjq5maVHcrAaOTLnPceoXjr+zv9av19k2a3xy/N6C4xR7259WgnGJI4n2bme4j8Jc7mSliKNCOrLBmCjFAC1rpYpyxcN1ZoJL764/Xl7ei3lZilIvvQqnUnQgjeACNYa7Iu6Qho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704304; c=relaxed/simple;
	bh=rGQ8+nc1QUBhR4ykJuirDDIWWMzMEvjt/KKxJUxrNKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P1wXN8GGqht/l5T1+C0zYEUEeS993HwLDLTnocvjtYeO8fc3H3718/owfDGrC/Ap8gsZ4uF0qnIi1TEwab/RmAyd5NAkqEYwNImbV6eMpKek9H8zcHScB8UAR9xJvnHdCMyL5JYajKQ341HdWUl0cOJFk1Cl9Fs0v8iOfpDKxUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gi7a3/LZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK6ZkADo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gi7a3/LZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK6ZkADo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6860CwQi3142385
	for <devicetree@vger.kernel.org>; Sun, 6 Sep 2026 14:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRebI5CBy4iXhBmzl/PlieX9oBN8y/gJBXE/yKnY16E=; b=gi7a3/LZ911zT9a8
	/0LSZygU9XcVhrERLAhd+LuYKHMLt9+Gd63nEsGDUUryKDJ97D2GKZTsP7mJuOcG
	5zYV888latQ+mdZLBfgXP0qT2X9/f20i7qDYaKTL1VMjs+4+9VJycAmZu7wXOctC
	DINv92VM7dxsPSRxsFfJ4nPTfTfYrzTMWIooUs8P9n0rdisfFz8G5IU9IUNtbyRK
	5YDaM2bvm/+URjWXszRqJIy81hSgM2a0Z0CIKFJnx5Kk+3issTtI1BJTRSO7fZ63
	+tWMtE2E/aquEZJXs8XcPpwoHDFsuRyNze9R2UEL8N/EI65B/1itiaINHbe8N1yb
	nZYCXQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbf8kh5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 14:18:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so4685845a91.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 07:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704300; x=1789309100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRebI5CBy4iXhBmzl/PlieX9oBN8y/gJBXE/yKnY16E=;
        b=VK6ZkADoXPf2KpuktmwXuTCmn3QUxLLw6Nk3n3dxoKL2ip0n5OiyYlaMJ1A91jyi9Y
         IbX+H+g7Eua7sxkjEPfke9pDPQcVY/SGEAtybESn7/Jw2ZPcoDq0uUVfWjYI7VLI5Fxd
         EGO4cJPVuikgJtCIhVRzaIhy7B4G1j9pnX/k8rJsD2/IRuELKWOWjJNe3j8g/+bFKa/b
         2QrBoIUyWqx1pC9ZLqBsS59Jvtyl/DsPL8rsIZ8NZ9uZw5eCnlcd7GFsX558EbsXcyOE
         zeU8mZUaMRoho5KzGLfYokAcwaOQBm7ZhTBCepNflmXE0P8bWjQPa33bRovGsxHj5zvG
         Nbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704300; x=1789309100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRebI5CBy4iXhBmzl/PlieX9oBN8y/gJBXE/yKnY16E=;
        b=SqHvjNBHUHdhEFVoBaHww61S7dN7uoHWHM2RIXUb1B1Akq67uGW79g4ggVZ1WrqYc5
         LAPdmDoMdq8X5+aqkWYe3GGP27lJ36y4sL/kuQxrDXFKAVnugkMjT9B0UrPNGDwVz1DJ
         rXSfYwnvw/MlsW6WdMF5u+aNa7rkABbbC9mNar0JxYbSuPD2lljtZWtvpHO72B6eme1I
         BoWeKsVIOxDF695lv1Yq4xatPRzhU1cQrojGdw2ud9EWgm54FSU3axShZO9tfa5/cSqU
         dq6V7fNqUCJAEnRj6VcKL0b2y4OP+VsggwHgew1/z8ZC3EyHSOiyxqkp211/YMU7JOSG
         XDRA==
X-Forwarded-Encrypted: i=1; AKwUvBzabh3+1Ys5SEpHgWaRKgCEm9Rz6eSaaU/3MMuocpz25a+1FIqHrg8MZmi8gWHjDc3br8ev4fagVuXM@vger.kernel.org
X-Gm-Message-State: AFuF++klP8ov3IJSvgn/RqyA0vF1bVnAG2yq+Xwc5xcDWxNOfRBX9K1s
	jbkhtRrT/5+69k45UsBeYwSxxkUnh9S9MYPrNDIyK22mryLo8mr7aWQXcLK19ozMO3t7FKxNrC3
	dCDvJCULMKsbekqpG4ec3DMVg2S8KyJGz2hEHvEzNZDlZUv6NS2N4/GljymDgbrf2Jf2DJhkgdV
	9GzA==
X-Gm-Gg: AYBFou0GBLwYuimCbjRqAU9angk8erNzN1Fa16LoSgqHVYwS3TtWbbIBx03rIGerhq/
	jX/qMnJHqIFNUM27RR5iaSfafEyLij9WpNn7GjomjATukZgwmg/LH0lPZTqu0lLIm8NNd0/f1kX
	oknSUM6xyIzoMcGn7cPb2hnoaaSCe1dkTRbO+S/rVCpY2a5xU6LTuwm4hSPeGb1Nz/BtBgvI7NH
	aWmJP4UOTv/iT92mDy2nfLt7F90WjIHKq9Ka4SKE1MHo0nZUYzBSSRhenzfthz4ba55McqPKh/Z
	KMM3kSlFnF3AssyALSGAa5VLZQFihw5F+4+6Z+R50dMylebrMTeZ00FzEc0yZjZ9BNiq1rDKtIF
	joiQFSwb/yIPPaHCKaZ6NaPj7K6Z8PaWlL3TOAcwPhYU=
X-Received: by 2002:a17:90b:3a8e:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39b260d2eb3mr27214667a91.7.1788704300408;
        Sun, 06 Sep 2026 07:18:20 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8e:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39b260d2eb3mr27214618a91.7.1788704299957;
        Sun, 06 Sep 2026 07:18:19 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:19 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:14 -0700
Subject: [PATCH v4 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-8-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=5084;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=rGQ8+nc1QUBhR4ykJuirDDIWWMzMEvjt/KKxJUxrNKI=;
 b=eDib7Q2eY84EoE93iSBIqLnqj4VzUkuGDTEVz3khxPSn7gzaBfrEu2aCXvAGR0R7Ja4tVkR2v
 IS+/kD/zTN0D1rDIpM8wclr9dYySybJWbfcsKzQ0szFnGoc9NgOD9MF
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX65BZVokXaqxV
 PJJSltw2QNnpDBLAkvv0RHaNhsW+oCkcFX3KVgp0Mii5JzXJobSfFvx6npFvAuGm6uyDMRqNQMU
 xOw0XHyDu0LK7nuGb/IK3OSAZTmkWeg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX5K6qIHSiXY39
 KrU3wYWCpxjFCrGoPL0/+SQ2UknOQ9HGqsOtyACLi8Ej14nWJf4X64SMOINdgna/Xu4v5VoPlJP
 0AGJkZV3do8l6pU4/JtL/R2B/JaA9Db899N7sc3MRWY4vX414DD2TGEAMIvNycmTH0PH4ONC7rF
 1aPI7FCJTtj8mhqJSWDnQnQUN2JUO4uDfJ6/xTRDWR88Er8ZFOkVP8/b7Ue8NZt47z0R9/hgZmL
 G/5P6kcogI1gaXuzWEWBLWAI89Vy7MXySyZ3dYg09+vCy//VQQUmsBlHwjwz8qwstrnrSCTzpgZ
 2lZKHQXm6IijI8/FLeyCW45RotMOWCONODdVkpTnK6DTQ8RoLEX03uvJHuIjW5T3pKkh4Y82Shc
 DZOkkTRRuOu7+jZHPnrgYRBV9wL3bDUZJc/xNLuYpFCfv22z3sBmT5wniy6KOU45oY3fWuWSkvf
 3MGJxWCFH4ShGyW+lrA==
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a9d762d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VFrLHRkP8_lOF4sqez4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: uZrHWvbWpzz7NIzG5t-PQZbk7aElRR_r
X-Proofpoint-ORIG-GUID: uZrHWvbWpzz7NIzG5t-PQZbk7aElRR_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
provides the raw reference clock to the SoC-integrated Ethernet PHY
(EPHY), which supports up to 2.5G link speed. The output frequency is
selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
CMN_PLL_PON_CONFIG register:

- 0: 125 MHz   - for 1G/100M/10M link speed
- 1: 312.5 MHz - for 2.5G link speed

The clock is parented on cmn_pll_div2 to reflect the hardware clock tree,
while the exposed output rate is selected by the register bit.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 110 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index f12352a707f7..6e09c14d7edb 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -78,6 +78,7 @@
 #define CMN_PLL_PON_MODE_SEL			BIT(9)
 #define CMN_PLL_PON_EN				BIT(8)
 #define CMN_PLL_PON_DIV_CTRL			GENMASK(7, 0)
+#define CMN_PLL_GEPHY_312P5M_125M_SEL		BIT(10)
 
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
@@ -99,12 +100,14 @@
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
  * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
  * @CMN_PLL_CLK_PON: PON reference clock
+ * @CMN_PLL_CLK_EPHY_RAW: EPHY-RAW clock
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
 	CMN_PLL_CLK_NSS,
 	CMN_PLL_CLK_PPE,
 	CMN_PLL_CLK_PON,
+	CMN_PLL_CLK_EPHY_RAW,
 };
 
 /**
@@ -572,6 +575,108 @@ static struct clk_hw *ipq_cmn_pll_pon_clk_register(struct device *dev,
 	return &pon_clk->hw;
 }
 
+/*
+ * EPHY-RAW clock operations for IPQ5210.
+ * The output clock rate is selected via bit 10 of CMN_PLL_PON_CONFIG:
+ *   0: 125 MHz  (for 1G link speed)
+ *   1: 312.5 MHz (for 2.5G link speed)
+ */
+static unsigned long clk_ephy_raw_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct clk_regmap *ephy_raw_clk = to_clk_regmap(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(ephy_raw_clk->regmap, CMN_PLL_PON_CONFIG, &val);
+	if (WARN_ON_ONCE(ret))
+		return 0;
+
+	if (val & CMN_PLL_GEPHY_312P5M_125M_SEL)
+		return 312500000UL;
+
+	return 125000000UL;
+}
+
+static int clk_ephy_raw_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
+{
+	unsigned long rate_125m = 125000000UL, rate_312p5m = 312500000UL;
+	bool rate_125m_valid, rate_312p5m_valid;
+
+	rate_125m_valid = rate_125m >= req->min_rate &&
+			  rate_125m <= req->max_rate;
+	rate_312p5m_valid = rate_312p5m >= req->min_rate &&
+			    rate_312p5m <= req->max_rate;
+
+	if (!rate_125m_valid && !rate_312p5m_valid)
+		return -EINVAL;
+
+	/* Pick whichever of the two supported rates is closer to the request */
+	if (rate_125m_valid && rate_312p5m_valid) {
+		unsigned long diff_125m, diff_312p5m;
+
+		diff_125m = abs_diff(req->rate, rate_125m);
+		diff_312p5m = abs_diff(req->rate, rate_312p5m);
+		req->rate = diff_125m < diff_312p5m ? rate_125m : rate_312p5m;
+	} else {
+		req->rate = rate_125m_valid ? rate_125m : rate_312p5m;
+	}
+
+	return 0;
+}
+
+static int clk_ephy_raw_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct clk_regmap *ephy_raw_clk = to_clk_regmap(hw);
+
+	if (rate == 125000000UL)
+		return regmap_clear_bits(ephy_raw_clk->regmap,
+					 CMN_PLL_PON_CONFIG,
+					 CMN_PLL_GEPHY_312P5M_125M_SEL);
+
+	if (rate == 312500000UL)
+		return regmap_set_bits(ephy_raw_clk->regmap,
+				       CMN_PLL_PON_CONFIG,
+				       CMN_PLL_GEPHY_312P5M_125M_SEL);
+
+	return -EINVAL;
+}
+
+static const struct clk_ops clk_ephy_raw_ops = {
+	.recalc_rate = clk_ephy_raw_recalc_rate,
+	.determine_rate = clk_ephy_raw_determine_rate,
+	.set_rate = clk_ephy_raw_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_ephy_raw_register(struct device *dev,
+						    const char *name,
+						    struct clk_hw *parent_hw)
+{
+	struct clk_parent_data pdata = { .hw = parent_hw };
+	struct clk_regmap *ephy_raw_clk;
+	struct clk_init_data init = {};
+	int ret;
+
+	ephy_raw_clk = devm_kzalloc(dev, sizeof(*ephy_raw_clk), GFP_KERNEL);
+	if (!ephy_raw_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_ephy_raw_ops;
+
+	ephy_raw_clk->hw.init = &init;
+
+	ret = devm_clk_register_regmap(dev, ephy_raw_clk);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &ephy_raw_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -643,6 +748,11 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							  fixed_clk[i].name,
 							  cmn_pll->div2_hw);
 			break;
+		case CMN_PLL_CLK_EPHY_RAW:
+			hw = ipq_cmn_pll_ephy_raw_register(dev,
+							   fixed_clk[i].name,
+							   cmn_pll->div2_hw);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

