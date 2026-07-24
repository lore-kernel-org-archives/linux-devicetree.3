Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAA1340D9D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905234; cv=none; b=lbRmhq+lAPjTI3ev+g0jXfT35u2TtIOaK5N7FWMv1cTj5KUk9HVKXCTp+uZmsBDuXM+B5/obF8hT2XoD2ODcJ6z7YnagHOvXkS9y5vZ0uuwJRvFjjHUKqepBtPKseXKWUwU2ReANWGxzqIp9/1tBtr1fLREvoCGDG2pFv490fZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905234; c=relaxed/simple;
	bh=DqJuOV/GfzjgmUgcYK2yXmABHWZdkEen47SlyOIyCNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TX29lgtIrWh/LUb5eoiy7A+qsYo/wCTCwOP3Uk0HGFkpYpFhnG3jEqiKMnr/GpEkRMcpGzy2jP5hnVBIm02twBT8Hc7fXpdwjr3/R7q03Fl2TKq7PyC6xfz0oVqKTVkMWo0rNIpYIYG5aFN/Sbr5B8fkMeTslpp/1Q+qBsQglbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBv/lzsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzLx3riH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBv/lzsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzLx3riH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbBDh3344429
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JT+eLCrf0c1leO0aAexnGhyLa2ROrC88G1ZCfe37suw=; b=TBv/lzsXEEpQCVHI
	CUybqKqgxXfQM0QfC3dhLdQSpSvmgbL2U3tdVB0j6UFv2eH6InCARPEz0WUKlUoY
	gG/7sGG0AdQBpCet8zDai8fHfCAtz17uIvm0uz7q1dVSzAuMw8JqEpwhBrdok0ex
	uy/XBEl4XJDfiGyN3vZ5uPPIdlv3rg/IurffK9MY7pJd+hmGqw4lR61NVDuqqOMv
	DSSaHJ9iKwWRfgfBeNbl86xZ317EPeKKjSs3BMl6k7MWruxXYJRRXNYIgXxoPMuo
	YxcmgZKpYPdz03otJIhg6kJJjZ3oqA+LqeXsvvEnDsuFABnPOkp3FK9HtEcXfvs2
	gfpIEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0gxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbb61893fso11122115ad.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905228; x=1785510028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JT+eLCrf0c1leO0aAexnGhyLa2ROrC88G1ZCfe37suw=;
        b=AzLx3riHE7r3eG61vfT7TmzcvQuXkf1CRDSkmGgxgPq9nGh99ff1mKCVqzgCMwrN4i
         zt+mr5fSHdYpbZh/7cosB6SzwGl4eL0co+dUy8meYTvoywL2I/cXQ1CKbYZhhtS2zixR
         PSJpLQKowycS9wryLOKmwzjPP1K0PSi3K4kF4/uEEe88etRNWNEQiOZmqzy+fpngmX2x
         TCLqAwJnmU2lz0mUuB1MIftMQegZEos+03RLIRm3noo/gVbfqXXbNdWBH1rsLYAIu0iU
         t4Xlxbz5qPam9iWc+7KWfju1FIEV2kr/gd7mJwZDTcNKewyfgavHE8x/fPMYiFs6zBKX
         lwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905228; x=1785510028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JT+eLCrf0c1leO0aAexnGhyLa2ROrC88G1ZCfe37suw=;
        b=VlP7d3sq0uHRw2zmKAAfnX2h24lBKJihVMBVyVXYHac2C0nKe5zADV91PQgjD3yxHP
         Bz5wmL857iYlJWZOGT6tc6hz2m4v3luHL30zsDGRig1P5yyJ9RNtjK8Vm7VqVrDc8JSF
         T6YoHyE6gkupXMsfNZ0bdE/1XkRP5ULGLSzzdQ52288WA68PT4Mj/G/Z9BCiaVpNqAEJ
         m6jKTP7tKI7VUqn4y+C7NL0IVDonE35QvcnI0xwDUFt/YTPNfsIHDUbi2T4ySWrveKkf
         mCHcubHNcqTiiM1CvJHqW6A9DHKoMuXGqwLO3B6bqvkLFSviP1c00kMnR9cDh4s/t632
         /wOg==
X-Forwarded-Encrypted: i=1; AHgh+RrHbHHvSFXC8xvokQU7PCcu0An8yqoMugxLJTwkfJHkknRYPNvH7noHySliZq0+IUxZF86BKl/XAs2p@vger.kernel.org
X-Gm-Message-State: AOJu0YySGp4cSCMowSj+/ais5b/QdUALrudntzDDj7r1WXeDLAREhVDR
	2DfWVLM0YK8kZ88b1oz9mqnCep+aC/jxvojmxZvBZVnJSATT9OnXXZL51yWuIujm72fNxd/X8VF
	pi02zrJaB/pUn3Mb5w2Mt3I3ktV8ETMwlqCeTCjEyxNPXmfPsSac8OObLe2vvx7q9ZDtdW5s+oa
	SKSQ==
X-Gm-Gg: AR+sD10ra8JhPwYxsq96LzPZJcMW3MjsbhfX/N2QOwARywqDL9hFV5nYoCcXdhJ7O38
	Ztbsq6qg4+BQNrB01hp1ZMU+2R8EOcbiBsX1ReoC657zQXKs+J9yslZ+SlTY7pAochADyaeIBU8
	IwXaoZ2XkN2ahPh3TXhP1JErysgKDrbQBNOlmEgDjjtY6x+dG2tNVjsih2SVik3/ZbIp4j+4ax2
	/04TW6dpQ8Yi3Dltwe7XXpAKGEE4XF7wCJ7h7qPUD/WoSJquOrgfJMcv+sqcXENDFcSABO+C+GO
	pxgGSo1h9sW0hOQxQbSpclv3FqFF41znaB+2eXQgnZx1swD2g4Tla19hVYAA9C/HFb6wSiECnOp
	Yq5Qj2/JoYJbXdhM3smMQAq4+HRgeRXRhsePe7DpSgv4=
X-Received: by 2002:a05:6a21:7303:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c44b18ce94mr8154502637.42.1784905227005;
        Fri, 24 Jul 2026 08:00:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:7303:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c44b18ce94mr8154427637.42.1784905226446;
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:23 -0700
Subject: [PATCH 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-1-a8b8679d215f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=2855;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=DqJuOV/GfzjgmUgcYK2yXmABHWZdkEen47SlyOIyCNs=;
 b=CszzAwQHyV2LxSb+MI94lZAbB6BzV5kYZovqbPvnzvbfQJILWHX8TUww4jdO4egkurl12hCqh
 diGdeDFvY21D7+uwcMrca5hXrzPnYP0AIMgZ+rELhF5LKcSUvKnxBox
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX/Q1gyIsqZVQD
 g4mhQv75x2cH2Hbth08+0haN4OPDafzMffn73R6V8ac5CJgM59wm8oSciD/Dy1zVWAAT5+PfDOq
 2bQ8koCKvmjnlxT68jQRR54DqVG62Rs=
X-Proofpoint-GUID: 4KK6v1yeP1hX6D2_1bXvU1wtvp2VIPjI
X-Proofpoint-ORIG-GUID: 4KK6v1yeP1hX6D2_1bXvU1wtvp2VIPjI
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a637e0d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=abD0O5-mJzoiGkpUKuEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX5e9C005wb5sK
 sCPWEGw1TwYGme6xQDbHdaOSCvfG8qSvVe9Q/g6ekGmX4a+66iWMD12MZUrE6tm0DQ0Kw8fLZIo
 CnLm9nuZcXv6Z4o4FEVxUzq3G3t2WDTL/0pYhzIXJvNNJ9rvbjq7G2iHmD+OJyi+NXbJ4HEOpHM
 jx/ilY3sEQANaWbTh9zxbitJz5EfVlLTd2tZEKMdee11T6wBXBOM7hOZCUvHGKaRsrE6FMXw4T+
 s+LEaw5qD+3UU56LyRWqU8NeWAQpD1h3d4u5szNL6EQ/sQvrnStEAl0DSx6sFMojeHc40aWTYoF
 4GYH/6ljVx2AV3G7c2byAmpm1J/2ujEjkhcBzd1lFxxx39d1MYVH0d8F9Dc2if+BDFG92kMDzX4
 8hTHCep5qAXxkD5FdC7EsZrp7DNib4vtia+vc77hDe8g9q/4K199EIjMlbUN57TqrPPNoVlSG3t
 STviymyhEresHu6V2+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

Replace clk_hw_register_fixed_rate_parent_hw() with the managed
devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
clocks are automatically unregistered when the device is unbound.

Since all clocks in the driver are now registered via devm_ variants,
the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
'unregister_fixed_clk' error-path loop are no longer needed and are
removed.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
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

