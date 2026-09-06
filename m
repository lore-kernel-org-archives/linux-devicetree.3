Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1142D747
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 14:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704302; cv=none; b=iht6WvnXBa1owIFeyKqTVefTcqe6RfuLFjGkvmOE+i4VPU8BujQGxYk3Oyri8r04FB0tIN4QDiXd9ZYKZpHQu199FZznvfYA8JEEU+KHaQHp0txuolrf3kfsV73FccdfphygKacXsVlx06zp23USnXoc2NGwzVsKXbx099gint8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704302; c=relaxed/simple;
	bh=Vgg5qOBlAuY2psZdQdz/yQNc20cNbn4KGUhkoi+GBcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=es/rJtA1+wRgM/Wvo9JB7ypByVo1w6n5T64YlTZz+LsRiivlNF9z3DmQYOXD+WEx6hYSrdqYg00zlVjresmfyp9UhBbx6rZ8a4JcJOqs9zlscAUrvNuq1HlTiTaU+7WrVT5vsP4666wHT1FFmJ7kDyyrH35oj5t2W42+pzXSX04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTc96BYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFClkyUL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTc96BYJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFClkyUL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6869pSad102315
	for <devicetree@vger.kernel.org>; Sun, 6 Sep 2026 14:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEGqd0P/wm/cs6GRPQOSfGCnfuqJbRSnZtgx9UzuNM8=; b=hTc96BYJUVKnoPNl
	pAAN4ZGgEXpzuKfYsTSurSGY2E0N72uQkRmMzFDy3ldJTeSyFepz4I/w3ydxLIZ4
	1LV0Y0kIvBqb3frUnp/s9LJEanZAZ+qjOXjIdRlyRhHzqRfGaZbYd/r2cYt+F/3I
	+eUeAa0k4Bvl2ZPl+YkRP10NpdFJFwFMN4kzg8oxU1D4i0cI2h08GGRJnYX8ycY2
	NdJjOzCFx5nZbkEJAuCQ0EFGC9A3VDsza3xz/74Y62UTlgis7/apxnbiKzgR9sMK
	o5pXJTyG4fcvLIW9TUFqd8yyf4ZW/xAVAs7VCe4ghKlJ80OJp8/ftBH+sgBRa2Go
	uv1Dcg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbf8kh5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 14:18:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396638f9a18so481324a91.2
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704298; x=1789309098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEGqd0P/wm/cs6GRPQOSfGCnfuqJbRSnZtgx9UzuNM8=;
        b=hFClkyUL1T8rqV4v7fvIyb2qkcKh2nmzwXs/PnyGQ7rkSer2SOoGNnaLMh7d0tdKPZ
         72cJzSdSGDrax0dG4TqTOpVWGkirsgm+UGdB4/OfZVKaI6dyGp9R+IJ7VXcF2HDvqGrm
         bgUh52zxJ82L+nM80D/aOxWi2yFhqbwbaueJPAO2ZhpVsxJAAlCqqe84KkYmuOvVJrZl
         0AEach0LbupnKIMN3mORY63+41skBzEO+GisqzySTs3JlfYAU6VbQGnLL9XB6yN+I7XC
         Nie7n1XHuJjYWM4hpmY7mxgeOzqVWD22pR0RJQGkux337TL0zFJQ1Dqxv8o9uOa30Cty
         ATDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704298; x=1789309098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEGqd0P/wm/cs6GRPQOSfGCnfuqJbRSnZtgx9UzuNM8=;
        b=ZVar8j07fr1y+wpnK8nS888Jrmzw1G6uz2cqbX1RO2PyMuYXD2mnLgiNK+lUtRCGBV
         UOWhBs26cHST4n5UEWehGZ0QXL7aFH2bAg4vgUy1S6OFY8NmeiBsbF1KaZo4Xfoe2LEJ
         muuW1HLwPl7lsTFz2b1Ou8J+lDPoqbF3aSP1SsrZgywrFjATmMS7RrhVsvow8oIIdw9s
         23SXWZU2e3JZMeojwisc9O15BfBVjimpr2VlggpK5XAv/F1/2TwX/8a5+gnL2xgVNJrx
         vL63YN7YGjBwHh5fQvhvfWxZlpgKRgphgAnOJ1x6d594cuP3c/RAEC7QE6jOE3ZXPZGl
         hr1w==
X-Forwarded-Encrypted: i=1; AKwUvBwQBOcgWlK+a6i5m7aIS3NHtGr/BWpNayhVIFLb4RB8BJSxZ945bQwSTwpaFNO0qWQWzxClYYyVSu8A@vger.kernel.org
X-Gm-Message-State: AFuF++nGa7uJEwpV79Ca/qIBjmvJ3jUOkEhfotLQ9GMH97/YARdCF6qE
	Ydm7dyVWZI/sTSncNmQhYnxVv9IH6mMgvGYNFjXPNAOnFVkOhLtN23mx5AOF2g0LJMyS+GmdHsj
	Hb8b2/sZ3yDzJ8FbAiQKsGfXGr73+PSndsuQvun8ZOSUVd1gtnqbH5X9nvuCvrXAO
X-Gm-Gg: AYBFou0HJSWWVQcoAps1YSugOTOMHd0R5kT9T7csKh974oPbooduTT7J2LPP8uTrz74
	3zEWNRCTlRtqOeQeRyfpPibdqPGSS39D5pFXsOAOtEEwhF9TBF8QjJSYGsprwNq6hTtYk5Bq2ov
	c5NJrfW7OKcnJclRaMmAlI2Hkj4sqT/2k/JNDYk5gORgNXRe1vAfi51x3yB1lmMwZUrkc7zSpJf
	BdbSanf1D2z1LiXzOuRxf63j4IjcUvGtB3y40ZBxrwPcyEQZyGjLKF4K30Z/yhF+E8o58KZy1Ye
	W1Wo048HfyeuRcl3UJIxz3o0pk6bQoy8N32IHPCihOiQZax3JcZSJKHegAFpjMrwWG08ORh9tZ1
	n4yj+JM90W11Eec0BX8nVXQ9gwpxvjQ3YAHGcU5wex+8=
X-Received: by 2002:a17:90b:1d52:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39b26242a20mr27844728a91.19.1788704298117;
        Sun, 06 Sep 2026 07:18:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39b26242a20mr27844637a91.19.1788704297575;
        Sun, 06 Sep 2026 07:18:17 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:16 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:12 -0700
Subject: [PATCH v4 06/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-6-aec5ed642f4f@oss.qualcomm.com>
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
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=1866;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=Vgg5qOBlAuY2psZdQdz/yQNc20cNbn4KGUhkoi+GBcI=;
 b=FHQn4R7jhAPaAp5hLKebcawSTj2lgvwbZyltpZIuAnVNPBwGTpOnmxCv7zIqxTAWa6zDw8FuC
 mhTYFJl/ZG5D4D6RH2iPGJsso++Eip4qt3eFjjwOOxr9Qhxc02Vhn1T
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX2GM66nJnKi8q
 p7OjJyVZFJT6zSNawdEtB+J84mT7hCvBVU2Y2KPPJ14uT3jxXirqyRget8eCCaTr0L3F0/xjpL2
 GgIWcLP2lif5gRA9wirmjX0GTJpsEbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXwtt3hWK4WqrD
 m3XgRiYecbZ5LMKF0OkVRoQvefYTRsOk8uJ+ujCbhWEdmFWKKpx8+kR1YoSGQLyVhhSiAG/iFNf
 qeYRLgcSTF5DEgy5WmD0zrWqd3S2D1FTonRKsj07Wg8O4CcuZUyHgizu/QN9zk00DDkCGeX5MXi
 +SbKfUU/ib1pYbpGAF1JasuFJ+K5+JqBCVGnvsKJtj3FfPIjBaK9Kh0KF9hTdT5omeaqdiEAM+c
 uKgN4jwhFp8/NAOwgAvK108wpzqnmzuPtkvHIDZhZNB9Y5Ko2SoYH61f8Vojq0trknGvQ0Kb0a4
 1HSz5OOF1sCkkoiu2tfXHPr9G3+En9lPn6eiB9D4G5edVWJ78ZdjAU6SApC8TqnDTygEU41dhqf
 O1kN+4TYO4c37GZgDuP2EuFefuSLRXdnRyriduTTlba2hG6Uhxg/jg/Y/nQbffZQevrjqBF8XGs
 URpTxy0DZFzGIPmj8Fg==
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a9d762b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mAYwyletAeVdbrWGRpcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: uN9_MoOw8hd19df3povSDKdjcyTaIivY
X-Proofpoint-ORIG-GUID: uN9_MoOw8hd19df3povSDKdjcyTaIivY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

The PPE (packet process engine) clock is derived from the CMN PLL
output divided by 2 and then further divided by a configurable 6-bit
divider. It shares the CMN_PLL_NSS_PPE_FREQ_CTRL register with the
NSS clock but uses a different field (bits [5:0]).

Register the PPE clock through the ipq_cmn_pll_regmap_div_register()
helper introduced for the NSS clock, passing the PPE-specific field
mask and reusing the same cmn_pll_div2 parent selection as NSS.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 7cf2b09e94cb..44d035870a89 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -72,6 +72,7 @@
 
 #define CMN_PLL_NSS_PPE_FREQ_CTRL		0x98
 #define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
+#define CMN_PLL_PPE_CLK_SEL			GENMASK(5, 0)
 
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
@@ -91,10 +92,12 @@
  * enum cmn_pll_clk_type - CMN PLL output clock registration type
  * @CMN_PLL_CLK_FIXED_RATE: plain fixed rate clock
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
+ * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
 	CMN_PLL_CLK_NSS,
+	CMN_PLL_CLK_PPE,
 };
 
 /**
@@ -478,6 +481,12 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							     cmn_pll->div2_hw,
 							     CMN_PLL_NSS_CLK_SEL);
 			break;
+		case CMN_PLL_CLK_PPE:
+			hw = ipq_cmn_pll_regmap_div_register(dev,
+							     fixed_clk[i].name,
+							     cmn_pll->div2_hw,
+							     CMN_PLL_PPE_CLK_SEL);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

