Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED73C73CD
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225490; cv=none; b=ZpcS66OPcPGG0c92dTREBmJ6xy68z96tH+8nWbO/yNJ+gz19s2W5QG6YeRSy5KhoAA8XsBz4KpBfy7h3NoL6T2clhTae0c1+xP/2GD8k5ZyEjqSUem6e0b4kDbqtF558wW9zX5l5A3iV9IkK6IK+uvMtbvDm60UAx13Mj8skijQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225490; c=relaxed/simple;
	bh=nE9u74KkmH5n6pdqjUMt1ZbSryNhzWX1EoTqyb8eD+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rAKTWlQQVVaDGpcDfdDbrMuL194nU4oWSAM42CsuBoKsGZvY63OIeuQGcEuxs4M142qLyHpjiKbA9Ay2tOFPjW6xH+Y2h85sZ24Lu6rxwFOQ/m0yKE0vzsu5SmbYHU3x1ObnOrrPnk7zFJPYpn0P5XpR7gs9pdG1WpdNSpj7BdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCobalcM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBXSe5Xr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCobalcM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBXSe5Xr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BRFut981402
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 14:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hGcazW21BWeS3FSf2MFm8xujpyLJCPOyqMxtgfv99c=; b=WCobalcM/gQ+/+DP
	iO0JxHrr5KaxYZEWdBCZf4RcRpETjL4/I8emX2Y5ZgUnoZXSYtB8abOpTfNo+IJz
	oeAgaksRdTwEliXxPPcjzFEnziy+f/Ax2tP1yMnAvcme4BNTmAyCpbxztNsX4UXP
	pdp4k2yfMyo274mj3bgEDOZu4hHrOvOYcZyk2auF6XYNh07iE/BLAPWOa2NrNg6t
	4mZDQ+qCzasBEhr25vu64AJ46qPA7otps1APF1WknW1ooV3rLlb3k0ikPTJUfpDC
	6RW+77m0kGjT63p12tr6AmCmvVRmkuT9WPjC24Ucds3XoY33jQ+BfTHIWzChqUFU
	ZIIFgA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tupusrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 14:11:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60525f6c861so518057137.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225487; x=1775830287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hGcazW21BWeS3FSf2MFm8xujpyLJCPOyqMxtgfv99c=;
        b=OBXSe5Xrw+N4NiV8WcDXYHYj8irJzT3YfveHthUxXhHfLt/lc2ccCvwOd3WTmKeyhu
         6mGoxONRwS5CqhO3IVLx1oaIj38jb3X4Xiy7OWGHL3R39OMxrL9VI27ZppX2efoNSlKo
         DXUtE2QmN/lBrxhYl5mawdmd8D5DK/Tw51WUnrcD5Ob6tysOFa2MIINkE+a0y4deZ1Ew
         Soh1u/XASCUznIQp0DESzV3kjZwgq6q0lSC2usU1vIcQWDKoLb8uyMCbyVuPWtOdiy56
         E19TEEDbHWUV5meYHLNd6+KTqvrtaVcqDzGywHNBLIYt+Y7Mo8MarNLajwyehEyGrCx4
         EHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225487; x=1775830287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6hGcazW21BWeS3FSf2MFm8xujpyLJCPOyqMxtgfv99c=;
        b=ZXgGok+eIwueJKqhI7sV5QOQeEQ8KwxwPMTStt+NB3PuJvZw7BS2FyGOReFq0r6F+l
         emggCqBcF3EimelrK1/56yHhx8N5cmCA9nsYfJ1JP5p3B72CRlK7/XNJ+l3odVWKiVe9
         tA5atpIemHjfYRLjrSr1aFwKqBskaci1Kc20XLmmsmPBfAdb41jbife/lyLAKhQvYkzv
         kgNrflr1CAKkZeZTfy1qOuFv0LpVHWrOT2KACrV8eZtcMtJw3EGACjaW+U/uYhKc8cO1
         l5RBqDEZM8C1fZYVs39D/vOOoUq13EIUpixDxgjvktWx292RYOJ3fhLfNw2UaMC0X8nw
         x9JA==
X-Forwarded-Encrypted: i=1; AJvYcCXzIkTyG1jxvY3rskbvUMpHokAc+EnwRP7d3qfiLdI3cxZliwtWYULN2aoS0c9RGJy/qsYmigG+G9ng@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+L8+005GQK03bMuklr9WF4VgFRhXu9qcHHd2AHyGJjz9MVdw
	lXZUOfOuVwTvgXUXOe9VeNI4jJwomkNpTmi7FT05UT+THFb6SChVB5nnZtOg90nfg2XKHauCZ46
	8+3AcSBeGx6f1ePOWJqg2MD+iThyPmnwPokpVS5BwSltU4JuZ1AC9qQmr2sa2JlrK
X-Gm-Gg: AeBDievcsvJg+4X9pNgENgpzXDxde1HyHKYHto4BnulGroGNKfif5N1O6EcRQhnK/t5
	ECRUYZ9ZoQ2Fl34le82eh3B11+4RUMUbNhlv4vzxqUqMqFDvZUedDYPpgYIySh6apxgOEdNvoZl
	IqGIwvxg+oqu8nP15U5jZpyDRRoDf2bzj4TMb/05KLF+L1sfgnepVi+DgfBfc5d7evZnODqHhxJ
	tBKIdqp70w+lJna6qCrxk5IvpO4tsTYpUSkFRj0IANXbPP5Hl3n74Ev4eISBFK3ZZfqvQQBh9VE
	HazZnWgZMe4zCTKxTfd9vJnQvqXbTAblzm3KGYPFGAdOrx8HoIGJVc9XDNjWQkvWoIAe8AiHinu
	CFr4jmseB1hfkjiPxVfCT3gyy2UuZ7gZRDRKhWBlhscJ+cqGQxH8=
X-Received: by 2002:a05:6102:801a:b0:5fd:ff75:f41d with SMTP id ada2fe7eead31-605a5050f2fmr911307137.24.1775225486894;
        Fri, 03 Apr 2026 07:11:26 -0700 (PDT)
X-Received: by 2002:a05:6102:801a:b0:5fd:ff75:f41d with SMTP id ada2fe7eead31-605a5050f2fmr911300137.24.1775225486409;
        Fri, 03 Apr 2026 07:11:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm30127315e9.6.2026.04.03.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:11:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 16:10:53 +0200
Subject: [PATCH 5/7] clk: qcom: rpmh: Add support for Nord rpmh clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-clks-v1-5-018af14979fd@oss.qualcomm.com>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
In-Reply-To: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Prasanna Tolety <quic_ptolety@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2317;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6AgLXvAISIyW6in+U+z6mG4Nhwb+ZCXvmVlquL4ABac=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8p/q698ZRjWuoLNz7kWT17UNDJTidGyMNybo
 V77QAK9lueJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/KfwAKCRAFnS7L/zaE
 wxecEAC8scsQvjDTp6NBJqfxvYRBB3/2t6BLwbBTJkdULIe/Vl8GSv7yiRUijPLaz76ReHdSUPQ
 9AlNv727udHqhz5527c5QEOq3whQnt1kriI2D9GafGu+GXRpUaVAqMzF9uwy9qAXWzz2GyaHgo3
 GtXttuCb5+1pAFE6bwkIxidF4A4u2h1L2PZKn/P/KlXnmkHWwlLypT7a5qJ/qRwlQ1zpJqHRVYm
 vqvcq5OxeBJ/qA+si2BFAsG7ZUc9g3ov//U0l8Lr0mJvwjHJZeDP1c1yleBTAo/HmOcJGrMACZy
 nga3OvAuE1W3aCHGj6brHo5Q8ILA2HatiW9xCs4MfHdoc7zHGpIg1mgxWL/cbee5y3ywo5Cgak/
 /HJXzbKyl9pLs2foTbLajUJX4he8qckDJQA8BzlWWUjxShxL3BefiJiPhcuVvmcTuiIHpCvNjkg
 YbhO7M2DJmb7Uzyg1guNDtd/olGnYfZbXHBSy7a9ouyHqZB6CjDpohReXFnja04Xw6MmAcF0taw
 xOzbVOdlKfHvwYgAAoPKWHF5O4TFA06r1C26igHF6n4jpXTkD/PUfx5gVjsIhICmSvD44h4p7GJ
 5bLkijUw6Rs/G5HajguwourDoaboIlK1ODhyIdmMSaIOZ9z9DJ/FH4CBowZNxrtOMg5xi6iKsTy
 hX9y0i3CNDHkI3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNiBTYWx0ZWRfX7t/GjQwNrpIj
 FMKndGeEc3qy9i4YTguASmfuNK4ky8WUMeYNYGbM9G44XhkxLKoQixB3A959RD1sAdHy2f+thzF
 m48Lq9UMNgeBu53Jav58ukuU0rW31jc7g51uL23KTYUxt0dAILHBCFRzKPlVKhzHoFUW9u3avFX
 qX2EpWPoXfdqp9nFDKpCTSMP2p2SxDG/NsIASBaYOFVjcH38KYyeRuxu/FEi059qVe+/sPj5UfV
 icbYkk8EOvIh4PHW8LU31BoOMld+cpskk64us5H2YnSd5TQAW2koHbyIz9q7Im6OfMzzgGzdUqm
 UgiTXx2FoJamJmTF44Uo9YbNpcUndd6SzATTRojGiQvTCB9lu/pH5xgaa8lHvL8geEbw1/W4yyK
 lK+17Lj72Kzfm3sn3fO5giUO5ynmAcpqwlyBCXjJu0O3BT9IbkAle4a1Cd0/oZh7QlSwIKjNYPq
 8vmhAFLVu4uxyaM9ZOQ==
X-Proofpoint-ORIG-GUID: 4LQD4lrpZQ7dJ_OSpe7pZ5kGs7ciU2uk
X-Proofpoint-GUID: 4LQD4lrpZQ7dJ_OSpe7pZ5kGs7ciU2uk
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cfca8f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=OFBLpw226W5Idz0Qps8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030126

From: Prasanna Tolety <quic_ptolety@quicinc.com>

Add RPMH clock support for the Nord SoC to allow enable/disable of the
clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6a54481cc6ae175b8238117eefb4f38af0ec40a4..0c423a72662ede52a3ec93679859ae5697a9d7c4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -349,6 +349,10 @@ DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 2);
 DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 4);
 DEFINE_CLK_RPMH_ARC(qlink, "qphy.lvl", 0x1, 4);
 
+DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a1, "lnbclka1", 1);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a1, "lnbclka2", 1);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a1, "lnbclka3", 1);
+
 DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2, "lnbclka1", 2);
 DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2, "lnbclka2", 2);
 DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2, "lnbclka3", 2);
@@ -965,6 +969,21 @@ static const struct clk_rpmh_desc clk_rpmh_eliza = {
 	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
 };
 
+static struct clk_hw *nord_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div1_ao.hw,
+	[RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2_a1.hw,
+	[RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_a1_ao.hw,
+	[RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3_a1.hw,
+	[RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_a1_ao.hw,
+	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_nord = {
+	.clks = nord_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(nord_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1054,6 +1073,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},

-- 
2.47.3

