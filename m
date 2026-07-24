Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E240802E
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905239; cv=none; b=XEoInS/viZr6omz2Eb/i3NE8wU1HcfelaxuUusdlS3goMz2pDT+PqNKnEaIWKZSYlH6dEAMnUWhcMoEspGrRMvN8llYMXSAeY/C5fn9JOhrgjHz350C7sSnl2+d4q2xwru/OL0JUuLf+MhXYy9qRdoONagNEM5RXW4BjbgZaBfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905239; c=relaxed/simple;
	bh=NpVN/Ozm8sANlDiqYWyTDjFt5f+smSHr7EMwKBYl4HQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPE+0kVjCzNVuwg7ntCvudcFK3bVDUfK5uQaHDsVwHH3irueXfHi+8imhPquK5C+PIqqVa3V6IchVCtd3hV96xza5Xy6kHBo4Em5kSZNmm9lz3fb81AkxximMVWUYTgN3T1ShWMB0WJbjCgEbVdx8NY5iyNwmMdP+DypkYPagaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpLhYKjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtfCeX/3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpLhYKjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtfCeX/3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbCsf151562
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HlMq8cHcHGv/w8g6gBOrvdEW3EQRVTzPNIpj6Snd3QM=; b=CpLhYKjSNqsiUu5b
	vCW67Pnix78iNtiR04y+etxniR8MZd0kNr0jkEj/ElpsOV6nqm+Q0xp19MraWVpa
	Y+01+62QpsFcAXSmk40v7S0soa9lFv6G6VS148oDT+mIxo0isrXcxQTZaq18aqek
	KDFSKlTAXlaRXfn5Dph7R8O1l0cP8t15xzGPJ+1iF9T1g3wqVWUJ97XEDApfQ8G7
	EN7kcmh/ay7OS2Gom7nyzNLcsYFswXaovamoR1kHOl1HWCYrFi6YcsvIg1BpDK9H
	3jzP84hQh+H87DFlJNClxwsucKDCI22oskfa2JRy6m3ujef5oA+6uvuIfc3ayioW
	/Zz12w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck8fu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6dd278512so360076a12.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905233; x=1785510033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlMq8cHcHGv/w8g6gBOrvdEW3EQRVTzPNIpj6Snd3QM=;
        b=OtfCeX/3iLJECx5+NOiQCLupbGVZsFpHZFjXrqa17SOaqBWfef+BssAFt1XQcrbw95
         njsHY0+sI7T00NspcNlCwn8KXs51cI4xDZOP3eP8EU2900Bf2xC3PSewhutQs3vQhEwd
         Y+IfNIoog3gAEH6jwa74MitGvzdtilo8XkG6Fdfxm/1zehVHlsBWZ8wRCcaPKWB2Jeav
         1BqmIiWKJQI+lu4vgfR2L83CF4ZseEFZU+vrxd4Qi9+23/7MIy7LSpmSQeYAPuAP7gx+
         spiH7dRlObVwVPkGcjMesVc2RokKRO4hh2WA2J8dQCGkoDidnIX20AWgHDY4xEX4Cbvs
         jUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905233; x=1785510033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlMq8cHcHGv/w8g6gBOrvdEW3EQRVTzPNIpj6Snd3QM=;
        b=IPFvNpp5lBcZxz1Q2QtsP/kAUpP8DsowTl7L+NeIukCai0EJiASEcm7QcsLaxlGsXL
         zn3+guVfZ+0KGYWMbjGUmzV/i5DKvZ08NkrIBqbQUw2tmBClWCGyXwcge6Kh7gcfTsyn
         w9llViPYODlAVHUOGW9DatJHnJAL1FNunBEM2Hsynot2KKTPwRkLYXi9vNPQGdYwIvy3
         aFNaBSnq/xVvAVZFnc96pzlha+6VVvhNPe+ybPrtYHL/BLJD/DGF9kew6oi3tgT3pmMH
         U2hEOEVx1q8Q11NTjAAHerlbTJEHpV0G4ZW3bMf3aY+cuANQXyY59UjSKDi4dbmME825
         d8og==
X-Forwarded-Encrypted: i=1; AHgh+RpQHUIzhixsvronItEPxNgJYqOQAWFQmjkUAi3IlQWH588kS0KkHr/rT86HYuDZ6YkvD/CPzoj5XBhp@vger.kernel.org
X-Gm-Message-State: AOJu0YwF10eX2temiC8vWZGH00S0qwfNZR6sKFUYT02IkHjxhs1648SS
	VJD9VYgJglJEtHV8kSaHAXazZMKLQ5+YMV5OcqvBdjQhOk75KgUbtKdb7zHAEQnfyz0mram2lZl
	HsAcNQMYSr34xtMZKCdHH+rYS+kwMWRyXAYOo+Yz5SL2BMCn5o3tKni/dyLmrxDjWny6y2oJt0i
	ACnQ==
X-Gm-Gg: AR+sD10TIWaw3fN68gRo4Ka3ULcu6PrTuZRrWUzqvpT2ZdYezwX1CBjxlRd/7WH5TgA
	v9dmdmg+ssSwIx/beUTRvHwGoWyYMZEBFLH4Lx2MwSNvRceRiSrWRZqnaeM3KIJ+dNrsYa1yS+M
	xaXWvpvCju7Y+n+FGyFkrjnZb4NtuaZ+HYYRdy5FkCzSRMilvmtUZZ7ikw9WbxP8vmeYXZPHHjv
	SEFriyRjz4LNMHFM1Ipgx+BynFqWsk2bmcr3jFwFZs8S3+pcE5fA0Eb4gg/B/UyYuZMnGs7aQ8e
	d7u4Elo+c6v5TmaEP9r9vc7Nc5lRIwuPHxu2UQ5Uw1XjEl/A8OdMcDQT9WbGLN/WDWRAkslRS/K
	KavDGUd1lM54+ZoD9jYkMfuzvkiVH5IyoRoBTYrrYxnM=
X-Received: by 2002:a05:6a20:a10a:b0:3c4:3767:adb2 with SMTP id adf61e73a8af0-3c44afcd59fmr8946890637.1.1784905232780;
        Fri, 24 Jul 2026 08:00:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10a:b0:3c4:3767:adb2 with SMTP id adf61e73a8af0-3c44afcd59fmr8946834637.1.1784905232267;
        Fri, 24 Jul 2026 08:00:32 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:31 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:29 -0700
Subject: [PATCH 07/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-7-a8b8679d215f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=3920;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=NpVN/Ozm8sANlDiqYWyTDjFt5f+smSHr7EMwKBYl4HQ=;
 b=jCZmtv0UvQjj2YoLx7Aya9S/E6GoSdbTGRjZldYrJXeKN/KCBgKTA9Ds5Zxtxp54N0yetlsC+
 szcEt/ney9rDkmhXjLmGIP+vtg6W07LVN42ZINNJ54Ad6BnRTERxT++
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX4cdtSNyI8EUJ
 D1AgLxEAHjnmnhs0wUgjH1mRU6A4KULxY331CKsnwXd1GIS5aPiz5bMT/vTqclHbhr1GSERxqdy
 ASrYTekvq5TDeXNv2XSXW00X0Ju+RuCoeKjZ6qTnBkGmqsnbKcjijiGr1mYN3NCchT4FzNhyOd9
 8uSYWz/16Lo5Oxwyv6I/g5HvrsTAoP4IOz0/Xs+JqCY9R5JGhNbIyX4SnXB0koxOKYNhxioy2ui
 FUNZGDHnKrlfYJxFJTFe6d59e4+AYGgWgUNthWINY/4YS82iXQ92GIe5s2spfPBieEac6bXdCRH
 QUDyGrLecs/C9SwvgvNnzwlGZnHo0FCsrL/C7ZvzousxL1z17jLZMkn9U3ulCGiZX+xvDmrK2he
 vKnn9G5bpI36wGfQ7Z3HI++xlBjnRfCjQuyZqFjYIYhNz9ijvvNMxI6dq4ZUDOK8ELeHmBoJAXM
 cF4MpxohrTXWbRME1BA==
X-Proofpoint-GUID: -FQ91kO2fDp0V3gBq6vreS-xfZxRlmmV
X-Proofpoint-ORIG-GUID: -FQ91kO2fDp0V3gBq6vreS-xfZxRlmmV
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a637e11 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5v7W0TGBik0vBbtMqvUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX36iZYgJbW97d
 mOH9gpb42qYuM1FQcK34cQ9swaikGEVBkdGlMYD636FHNWc5JyjbOHm96xX2d9+dJaQ2QrlCUF5
 L3VXjvxPdc5loycgu2AVHRl61Lp3GiI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
provides the raw reference clock to the SoC-integrated Ethernet PHY
(EPHY), which supports up to 2.5G link speed. The output frequency is
selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
CMN_PLL_PON_CONFIG register:

- 0: 125 MHz   - for 1G/100M/10M link speed
- 1: 312.5 MHz - for 2.5G link speed

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 86 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 1ae32052b563..dfc28c12468b 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -76,6 +76,7 @@
 #define CMN_PLL_PON_MODE_SEL			BIT(9)
 #define CMN_PLL_PON_EN				BIT(8)
 #define CMN_PLL_PON_DIV_CTRL			GENMASK(7, 0)
+#define CMN_PLL_GEPHY_312P5M_125M_SEL		BIT(10)
 
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
@@ -694,6 +695,87 @@ static struct clk_hw *ipq_cmn_pll_pon_refclk_register(struct platform_device *pd
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
+	struct clk_cmn_pll *ephy_raw_clk = to_clk_cmn_pll(hw);
+	u32 val;
+
+	regmap_read(ephy_raw_clk->regmap, CMN_PLL_PON_CONFIG, &val);
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
+	if (req->rate <= 125000000UL)
+		req->rate = 125000000UL;
+	else
+		req->rate = 312500000UL;
+
+	return 0;
+}
+
+static int clk_ephy_raw_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct clk_cmn_pll *ephy_raw_clk = to_clk_cmn_pll(hw);
+
+	if (rate == 125000000UL)
+		return regmap_clear_bits(ephy_raw_clk->regmap,
+					 CMN_PLL_PON_CONFIG,
+					 CMN_PLL_GEPHY_312P5M_125M_SEL);
+
+	return regmap_set_bits(ephy_raw_clk->regmap,
+			       CMN_PLL_PON_CONFIG,
+			       CMN_PLL_GEPHY_312P5M_125M_SEL);
+}
+
+static const struct clk_ops clk_ephy_raw_ops = {
+	.recalc_rate = clk_ephy_raw_recalc_rate,
+	.determine_rate = clk_ephy_raw_determine_rate,
+	.set_rate = clk_ephy_raw_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_ephy_raw_register(struct platform_device *pdev,
+						    struct regmap *regmap,
+						    struct clk_hw *cmn_pll_hw)
+{
+	struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+	struct clk_cmn_pll *ephy_raw_clk;
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init = {};
+	int ret;
+
+	ephy_raw_clk = devm_kzalloc(dev, sizeof(*ephy_raw_clk), GFP_KERNEL);
+	if (!ephy_raw_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = "ephy-raw";
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_ephy_raw_ops;
+
+	ephy_raw_clk->hw.init = &init;
+	ephy_raw_clk->regmap = regmap;
+
+	ret = devm_clk_hw_register(dev, &ephy_raw_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &ephy_raw_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -747,6 +829,10 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 			hw = ipq_cmn_pll_pon_refclk_register(pdev,
 							     cmn_pll->regmap,
 							     cmn_pll_hw);
+		} else if (!strcmp(fixed_clk[i].name, "ephy-raw")) {
+			hw = ipq_cmn_pll_ephy_raw_register(pdev,
+							   cmn_pll->regmap,
+							   cmn_pll_hw);
 		} else {
 			continue;
 		}

-- 
2.43.0

