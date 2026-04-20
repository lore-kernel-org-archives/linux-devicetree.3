Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB4D34FF78
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702629; cv=none; b=rpZMoT+Wi6xw4mz11MdpDNMhfKi89bYzk5T63uon8070BsUeKo3Sa2tek1QHJGWw92qocCFBrFXTHLwfEJXsHPdW2qtu85H0rWb+F4vmrC1mIezwXagV1Ip8CO5d1zVnRqaK7dc6Zhff71TmHUhuYXFBte5+fjPnsD6ELbHQg50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702629; c=relaxed/simple;
	bh=GkuGBtz0vm1ur5SbWsJoyFWyyIBKgm/VPzpwgEa5Hlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6FY28hB/h9bnvpewk04IIJNLYdQRzbBpWbypax00KjVPq3z57IaOETXn5XZTC3WrdbP3TyfGT4KjYVvrQONhrHxRRcSLmr0iToRotnGcEfDBOzqRqaHvWZMCkxXYadn/Mnev4RDThzS0e9E9VxMaayMPLbzhDwoU1m+L0AohuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb+Kmkoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+Cny5Gj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb+Kmkoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+Cny5Gj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFY3TW1599858
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzJ5ge+EfXqrbVBAlUAXmfQmBnk818A5VV6UdTh6l78=; b=pb+KmkojbYnV1bIa
	X54gArqJ6FYMEDPvI71/S5elsHYOZyYCjX33is3QL90MI95EynuA7Ujsdl4ulU7/
	5f4c4ZOXcC1RaO4uzK88u0kc5JhRmG/MM08vER6nw0G7tNtft+ZGhqAeKgBmsh/p
	BaHsdywlbTAo60ysT+Gk6eU3q9s6TRKJ6tBAzCeqyhfHRoqHGEsHU59wcKZhbMlc
	cDCgVSbtZX6CqDzjPwDpLXxdRa8HP4AtgslCCnszyF40H7jSbo+jylP3SRRk7toW
	HrTxMk6x7k8NZ6VmZiO1eotcfUjCUxFDF4772Q0cDsEKoQ6oyErtDL5/81G9X86f
	yuU0Fg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh899mqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa366fb79so1828298b3a.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702625; x=1777307425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzJ5ge+EfXqrbVBAlUAXmfQmBnk818A5VV6UdTh6l78=;
        b=U+Cny5Gje6YOQnzC8ePe68z30WvjrtPCCmjweHcOEiUHYfmSupRbBxh1sDUFxLto7G
         TnS/bqKK5Fv4qSd5UumyA//nkS2ThSENfQfbJ+W0uFETr0MII+khdQ7PKW03rjvxhC+Y
         d0RrLY7wLO8Sv/3WeeWTD16WVjQeEwS306mMaYDIkWFZqgivXgjwbaaSwaqQZ/idSS0t
         CXgPvIFK244fJIidv7VvkGa4GH6gs2mxK2ea402uNwOsmN/IPlHs4GOsrSyBpVGTs2Ov
         oGyexqOYOjxIJTfv8S/eo+3k4zgHIZlXCwvjERNSwO0MwyKlapjWbfKQNw3hoQezxcM9
         w10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702625; x=1777307425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LzJ5ge+EfXqrbVBAlUAXmfQmBnk818A5VV6UdTh6l78=;
        b=WJAwfMyce46dCcLirXi/0l0NbIH4HGI1PW1/yWblmoUA23TgbduFYETQK0OzLAg97T
         +HiU0YAlZGoGcvJJi7DpujU1aYYNyHm4xivy+xV8NOF7+Cwu45Js/FnSzLGjbt0hTg8A
         ngEh2K6DYaPRDcBBVsn1/oM+wCiD7ebTi8sJ7+Sl3pBMKZgj+4fpnewFT9WeKJXgOQn2
         CtTBcbjQrKr54UnBT2606EWJ1aiqPNgoLtyvo1eN6KLUv/cDt/LIb3cjFf/9IarjhlxD
         hynDSE14BzDIEd4IgdfJCeLLmwx3P8SVsBSFwyftLLTZjaSLb8Goihnk/mchlY85aVxr
         H5rA==
X-Forwarded-Encrypted: i=1; AFNElJ9yFqWySFVPhau4bs6mEfiln9LtA+ID9k6VSc90XSJ3e5sJ1ZGBesg2bPNY7SyFJFrZsGdr8ownnlIL@vger.kernel.org
X-Gm-Message-State: AOJu0YwN3otSxHXY3Hny8GgZ1wrItr/h+9LG3FbRjjElp2jmii8TPoXJ
	eTFnKIqbIQI8Igylv0DKoaqkkD0qDsROW3oR0wQETaC2L1PQyJScoeM/bjk+t+fSmyNtVHNnUVa
	3yb9lkucbfHzySpWvKK7rXBUUix2581h6NAVL/L8PpwccwPoscTtn+oL7ldMKUZig
X-Gm-Gg: AeBDiestHy/QhejoSm6JLIzeva1FnHuFcWBmbCEoQ/O80dU4CBiHXy1UVIsMtnkWvwr
	wrj5RRwYTYwao0gaDWQv/pj08xGOcZuVDmyoAFlBPskAXJapxtcDVcxOyqM0+cgZ9TCgYTHaaVO
	r7cUL8pZ2nm8RURBrQCwjeu9hWGcMTNznFnm3iLDgEAeLYFTb1Y3M3Ug73vQ1WK9GiKTC1csUUU
	iUSFOSuwhPRXeDcttuJ7b1ZrYPQXWRVxLPBYYhSGDiY3W47gL82oSBIXCKcKLlaOtMXZlOHw2ft
	lehcz9PWcOm5kET50srLZHlJdH5FubbUiQgrd5w7t9G0rfB/DCKgcGKm7hvRc1PgliOv9IkC0wh
	tkF3j3aqF8xvpwDetXE11EVkVpbotpyJXy/RWACyNvmv8E1CmiFlvBYkVAqX8EQM=
X-Received: by 2002:a05:6a00:23c4:b0:82f:5f2c:dc1e with SMTP id d2e1a72fcca58-82f8c902066mr14298083b3a.30.1776702625028;
        Mon, 20 Apr 2026 09:30:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c4:b0:82f:5f2c:dc1e with SMTP id d2e1a72fcca58-82f8c902066mr14297745b3a.30.1776702620966;
        Mon, 20 Apr 2026 09:30:20 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:17 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:59 +0530
Subject: [PATCH 06/13] clk: qcom: clk-alpha-pll: Add support for CRM based
 PLL ops
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-6-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfXzitYo7xpJTOu
 IHOgYa85PA1c10QtM7yxymrTBc2A8vkAg1mrhc6H8DoXdMTtRqmxqD5E2S2GqTk2M+6ESHKmR3z
 PWMzQ4v/eeeCZWxTwuukmbHZ7uVXBCDQRNg1Lopjjud4L3T2m4J8OOOjM+xPqzgU2p5i0W1/HdO
 xOs5z7RYOMqBm8DcBPj47yJfMN2Ge2MA62qF7TOuKyBRIrAOvRVKsVWzvgbYuT8NOSb17PhJ4aO
 iRjf7Cmhsjaf7zosapbsMYcG88SgVThwkUUjnU5vr86jSVp5/ZHppPCM66s6nBRCCfzHvV4FaSz
 blf7vaGdyzUFToZQKW6xTmuM5kcENweXtUvLl3jf7adZKgwz4jmqrKFRTcRrHzEanqj3GI3Trhh
 uV9BZGwvL2iwLiUViXuUHsyfZpfXSDbVqNfDRJziwXcE25HwMnJ0Dln1Dxfrs0/BeBQr0L4GcTQ
 3ICT1W8dbJLl0L9mFfg==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e654a2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UWxg1GitlfQtNyvJ0DMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: BujC1WpkS_XC9c88kmhCFw6bgO5jFyEE
X-Proofpoint-GUID: BujC1WpkS_XC9c88kmhCFw6bgO5jFyEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159

Add clock ops for PLLs that are controlled by the CESTA Resource
Manager(CRM). For these PLLs, CRM programs the hardware based on
aggregated votes, so the clock driver does not need to program the
PLL registers directly, but can still model the PLLs and expose
them as parents to RCGs in the common clock framework.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 7 +++++++
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f8313f9d0e30ffd5393e3163ebc0e51b2bd96437..67fc97739d0d4c26aec0bac5d43d1b87d297bc6a 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/kernel.h>
@@ -2585,6 +2586,12 @@ const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
 
+const struct clk_ops clk_alpha_pll_crm_ops = {
+	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_crm_ops);
+
 static int alpha_pll_pongo_elu_prepare(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d3344921457c39deadcca5c43d72ded3b572a3..1ef515708ce19e636eb9a59b126df5048e262d85 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, 2018, 2021 The Linux Foundation. All rights reserved.
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 
@@ -219,6 +220,8 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 extern const struct clk_ops clk_alpha_pll_regera_ops;
 extern const struct clk_ops clk_alpha_pll_slew_ops;
 
+extern const struct clk_ops clk_alpha_pll_crm_ops;
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,

-- 
2.34.1

