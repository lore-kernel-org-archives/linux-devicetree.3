Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE644E679
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085604; cv=none; b=SI/Mne0iFjhOc4YQrlsubng7TIIbKIIimQ75d6/57VndJPZ7XHptjY13uriQmDVscucq/n2CdWLIYwt0UW/Spsz1UX+Ldi/hELjygg8Xx6Llax4akjUcepuBp66oXi1Ihtmabjj4MtdHOUw2KjroyUNWG0BcIubSoFiCVPvayyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085604; c=relaxed/simple;
	bh=aPfM9tsY6BErRqddiYvZSV7svFUbPepkOVp4lOV3/Uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p7fk3NOTEBsq5M09Pu/smbGxaIg1SXuDuZezM024qIEtUeG8dptBLfxz9kOMJ22Of6NGJrcyVYsEPgEzejfYh15UfujXuRqv9ec8octV0fhSteoWESvN+usiF0cajuxcLOF6gGs7AJ6hoe6hP/rdgBUaCsnCPMy2cYGlnIYB670=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLT2jK2y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiLkBoXw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLT2jK2y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiLkBoXw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GnwT3519235
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 06:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3rRTr1/IHBHMy4F+A2/1wwFLrVT0kTmQodHU8UWmSg0=; b=jLT2jK2yd1Kjfbf3
	5rNcn7GwD2pco2loc6gLCEoFABFns6xgT8V3OEdmdpFiIVkZM/zn4/qXL7isyuP7
	6Cr7kpHm54zNBPqzuPEzxCxAmjgTIfLcPpTOadfTPNAjtA0+98pB17ka7xNUGrgy
	1AafuLV9pdHT8BcicrE77ioNoLTrPuy3QqgCKrd4j+b094ZwDYWGFrzNLC2K4jdS
	pV4fkiUJVZfOZeG3vjHpOcCxd/VpAx61IRLcyYEVojTnsEkWodCyj1T2+SlosTEm
	LL/wmdcanifJtpEWVx0o6sUa3pYO3FpIQychg/Hcm9hG2TpUr1nteU0QB2Pooirb
	w1bppg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6s2prf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:53:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so2263212a12.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 23:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085600; x=1786690400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rRTr1/IHBHMy4F+A2/1wwFLrVT0kTmQodHU8UWmSg0=;
        b=MiLkBoXwbqt2dO8TM2V3CiK59AiO09GaYnR7c2hgVeB8JgYq+0rCMLg22/S5UCupcb
         IAfEdv95o0taRtFaypw1my0Ur6nmLUl2TRB+JaRNxo7TweuqXgw3NGFiq4RFKmsc3RSG
         nU/wQ2niVw6OI4Fmle65kHYQ9jQzsWTvzK/nP/jhMTEPSfhnPfM1h4C0OHXYo7Xvzo6c
         42mp/ueuDE25njOsLURfFt4R311C11k4X/PcdWbwnCcVAd0zN1mHqjBTDdjuR8l8TNYv
         W0LvaFyuFLrtL6+MZhNSf0RxxcQvNmMAtGNgLRtsAQ3V2pgHeu9WMl7Apfe1Yymkpkv3
         pn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085600; x=1786690400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rRTr1/IHBHMy4F+A2/1wwFLrVT0kTmQodHU8UWmSg0=;
        b=MIWb5IWvdq4qyWHdkC19GIgo/s0ZNtR9GHeaWvZg2bT/SKkTPPTBspN8p2yWVtJIe1
         bUAeAqidovKLGSIgVWIPykvPZh9zytaPG6ZEH206JG0ckBUrLod7HanEgjqRConWOkKn
         F78EfSN6vtJKwVBN/IuHAl4SVDNpFR4C2M8/O1b+UL7gqKG25/BWNLd09aSarNyBQJCF
         aQC8aaTQaH5cpmNsh2s9Eb8wVqtHtba44Ex0jJfeGjJjeBymMPT5e6lj1EyzR5tSmV12
         T6D0NHmEgF+wxA142DMnBs9e7a+bS9Cf4hxAUL7D5FLDcyXNa6FnMytQw0c4nio4fX+A
         rOXw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7wAgUEzaT+SljY2x+ERvlFBWXh5KTWbLGp396vYXUXO6WLUEIxB2CUzzPBYjMwfHrLLyOZmgK2L8i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7V+V0A0PWvS3AQdN6aLBmW+lBYeBvgY8o0+T+fEzw6gxTVGwE
	/YqyDK10Okpe3SoIGSsNipcsy09q+MxsG/XI7TjqkdzBBDdL9dfF/bF7bIQZpyXeRp+9DZec7W6
	8+Ctrm0VatmXzQIF1ZerUEb0vJlpqe5p+Kz/fdBslhnT9k3dRfzDyYCM2H5qx6CFz
X-Gm-Gg: AR+sD13WdQYQEP7clNs1Hy2sWRVKv3Oy8gGyZZiMPu3Sy3k+w3PXn8MnBSgTFvvTYGw
	LBFq2SOJK8XZaMBt8HXOe9nnPy5vZZtiO0sNBsdX/w13nWXpOrRMERUW3HjdyzUxAxfNInq1F5z
	WbFxGsvqAoSPKrryxnXBNyCkiDUCjEgmdQDyl5vZvltMqcofmZbmx0IelMT6WFuYpohk8mJZ6Ez
	fXWjOVGeiZ945iyV4Gu4TWEkAhRCBYRamvVC3SpaHQC1aTxrH4gThl0VM56hmsyvP3Sj5gLHWat
	lZSXpizTgV7Ypz1US6wXULWX3q77tpRJCmY3sDW/UzXIOMXfMLZMwTdsgCXRqcmWZNTG4zBsXmM
	P5TU1qfznvOAesh425lk4vQCVlbDh99ZRmI8vFT0ZyeE=
X-Received: by 2002:a05:6a20:2589:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3cb85e991e7mr23564768637.7.1786085600036;
        Thu, 06 Aug 2026 23:53:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:2589:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3cb85e991e7mr23564602637.7.1786085598151;
        Thu, 06 Aug 2026 23:53:18 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:17 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:05 -0700
Subject: [PATCH v2 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-1-cce718b8ec17@oss.qualcomm.com>
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
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085594; l=2916;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=aPfM9tsY6BErRqddiYvZSV7svFUbPepkOVp4lOV3/Uk=;
 b=HA9+LwQTz0ocNwWoyTCb6nKKjhhMtrw2rVjCnFzBD6dbzRH+vMWSc6bdqCBKmu2qf4jVIEE98
 4Tvk01NrUQZCIK5+YUEaH/BLGvc1Hb8cfJ1SL3HM0z3AUQH2Dem7tCx
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX7MBhceG/x5X1
 E/gZhVi43NDg51psG0JLNXhu0nee8tERiLteBsMUN1/VvvyzYigBNrW97DvkYoJ2+TKvn403gbO
 TrDqrAhK/Dc6C9kDGC0SNBLw4si3xr0=
X-Proofpoint-ORIG-GUID: odq9TIXCwIGYklHtEJAvNJw8hzKlof2D
X-Proofpoint-GUID: odq9TIXCwIGYklHtEJAvNJw8hzKlof2D
X-Authority-Analysis: v=2.4 cv=B+eJFutM c=1 sm=1 tr=0 ts=6a7580e1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=abD0O5-mJzoiGkpUKuEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX14/wuAmewR9O
 NISqAM5BbCaPcWcBtqDEZz1cLW3srysJuWfVFt0UblM1AIt8iHhcpGyB0uDURCYjvNl4cZTkGpc
 0YBszCgf6Q4BICnO4/RV/xfpOGnGnWXAbAUO4XIYGT0WSMAVaXiX+1yohEpSBW3zQTZkjWUS5qR
 r9c/wPTKScdyTfC5zEkV/EgqFJn/Cqlk4N0WA2MbKboaG4YysSoC++S/Smd2NV0LKSLVmH8iyOF
 lqJ59V6ixRefsD0cCJvVMT2tiuhQqcr8Uc41+QcQp8XIivHNUvZXp2fmYLPHacqEehKxZo95Gx2
 I2eJYBjyqy26uLw/CaBES1RYCr23dofK00xNdBFi3DrzuJ0OdxsXxvbYCnKGcTjkLd23afVQVYN
 mXlnK61RXdjRBzLCs9uylZznokjz4zZTa4LfbTjbtf+wQGLoym6w+mPOv49Kq3R5lwCsA291YVJ
 lYxWhC24ovY8y5gx3YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

Replace clk_hw_register_fixed_rate_parent_hw() with the managed
devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
clocks are automatically unregistered when the device is unbound.

Since all clocks in the driver are now registered via devm_ variants,
the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
'unregister_fixed_clk' error-path loop are no longer needed and are
removed.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index dafe8c1738df..4fdf78f6829e 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -390,13 +390,14 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
-		hw = clk_hw_register_fixed_rate_parent_hw(dev, fixed_clk[i].name,
-							  cmn_pll_hw, 0,
-							  fixed_clk[i].rate);
-		if (IS_ERR(hw)) {
-			ret = PTR_ERR(hw);
-			goto unregister_fixed_clk;
-		}
+		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+
+		hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
+								 fixed_clk[i].name,
+								 &pdata, 0,
+								 fixed_clk[i].rate);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
 
 		hw_data->hws[fixed_clk[i].id] = hw;
 	}
@@ -410,17 +411,11 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data);
 	if (ret)
-		goto unregister_fixed_clk;
+		return ret;
 
 	platform_set_drvdata(pdev, hw_data);
 
 	return 0;
-
-unregister_fixed_clk:
-	while (i > 0)
-		clk_hw_unregister(hw_data->hws[fixed_clk[--i].id]);
-
-	return ret;
 }
 
 static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
@@ -462,21 +457,6 @@ static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void ipq_cmn_pll_clk_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *hw_data = platform_get_drvdata(pdev);
-	int i;
-
-	/*
-	 * The clock with index CMN_PLL_CLK is unregistered by
-	 * device management.
-	 */
-	for (i = 0; i < hw_data->num; i++) {
-		if (i != CMN_PLL_CLK)
-			clk_hw_unregister(hw_data->hws[i]);
-	}
-}
-
 static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
@@ -494,7 +474,6 @@ MODULE_DEVICE_TABLE(of, ipq_cmn_pll_clk_ids);
 
 static struct platform_driver ipq_cmn_pll_clk_driver = {
 	.probe = ipq_cmn_pll_clk_probe,
-	.remove = ipq_cmn_pll_clk_remove,
 	.driver = {
 		.name = "ipq_cmn_pll",
 		.of_match_table = ipq_cmn_pll_clk_ids,

-- 
2.43.0

