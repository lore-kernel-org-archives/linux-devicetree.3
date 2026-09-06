Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0D53D5674
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704295; cv=none; b=Jd7vsjrdZahuCV6WMGziidTTlFY90QS63ryy7Apn2a3tle1gWqelscplbXcjJZn/ASxuQCq5xoK7cUL81OUFMWIO0dJhMk8eKnUXJOjQG1oggAfOY/C3MvPW6KCCmAv0Ry8lb0aagwcA0bC0TNW5vZVcpqhFJYruRpPAcmEZpGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704295; c=relaxed/simple;
	bh=hmsI2AA/Q+IIKEXrHu60oCsUSSUt50BoFHeX0KSPKAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiBElbGfIN240/Pm4DHkn7Yz6t8GiEKgNL9TgziI4+xzjF2ep7js7Ca3Lc1LIJR1keaFvclST4s4iI6vrE4nPHLrL1qmzxcKfcBXjQFfMGiTntYS788FafZvdWKWOkO7VXV/JjyQSzCGwu99a+tssC3qDS8ShU1WL3pyMBfevQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtQGRpbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyEEKZtx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtQGRpbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyEEKZtx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6861XmcZ047877
	for <devicetree@vger.kernel.org>; Sun, 6 Sep 2026 14:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uBMf6ZTgeGi7HQhCTtYT90K6zChfXeTy7AGUqgO/O8=; b=YtQGRpbFsno0ZHaW
	0TtpDBPt/RP3BYMlJXz1YxF6Ev7/YmCmEf+i3aR7C9iwM2ZEn7JPDjXLg2Ht6pTf
	YwRBQaVd+bac00PyVebfWPiFQFSjC7vVOPWLYgwFc1nWzZZuW23JlhTcYUG9Zx12
	a0aOmKibPoBkHPN1xB27IAKyPt9oS/RKT/Fk1ZjUCgBPuV0QHKyrMSxnzSpNmQAU
	mHz7HUkPykmyg1NSfIrd5zYAzYfcgmXuNktYrrzSKa/yhuFmt/Bx+6nHyOpE6c8t
	qVVdUkyUSjssS3Anj98XJLvmy+xKbW2bCpHg58cf4E6JNTyZ1LEPVBPd0r0c5WIV
	JhkKKw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga373nsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 14:18:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d63bad3d09so38749075ad.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704292; x=1789309092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uBMf6ZTgeGi7HQhCTtYT90K6zChfXeTy7AGUqgO/O8=;
        b=PyEEKZtxd8G0dD51ivYhCnXYV9xJhNKoT1fUOFsV/5TnTOXfjrGystk6pe/8/dwePK
         GR8hLx+8T5Qitc10KGgAlB2O0LBOEJyALn28xeVnTLpUCNxdGWu8o1jdoqmgXYsODko4
         Ux+reyeiLfvMhltyRrQoOvQpYN/On0HkMTjgOrTiZFLrMHFCmjd1LaC6t2ccDxAivYh1
         0lNjTpBHfBSprrN/O4DZtgp1hybP0zq5N8Rhzs5PUJrN203NZmBN906o3CfKGWkrJ9nG
         JD8tQ/xsecrjbnlm0mElycCSx8Y5HBvuNQbqO5PONkAfBw4JbKQ5mHfcGF2Ay1lt/1O7
         ZMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704292; x=1789309092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uBMf6ZTgeGi7HQhCTtYT90K6zChfXeTy7AGUqgO/O8=;
        b=f0V++FjSX+NP+hlKrNjn5YBxgztUvzNsczgP33e39l+D3k++OrgS6C8ZZT9CwQD2Qa
         y5n19SPw8yQW4gBQs2Za9D44uq2lOE4aHFrSm0pKtMgbtnORnKlyG/4X9A9nWKCoeFXt
         rXAcipbtndOqavIll3CRJ0rs2ZTLs+6nm/nkNqI0kR/GcKvIVZMsuPODdyM77YElxVi9
         XvKaAK+GOjURFDFA/BJnP+qLymuunq6sJAgIbKbOlze4hf7pvAs9tHnLowyH8Cifhefc
         qN00N3wc7NOz+hCrPtPRT9hVk08pD7qorKejXRSwZHO39mL5TlxDLql3PVEKku3ziNeU
         vtCw==
X-Forwarded-Encrypted: i=1; AKwUvBwVeaqYTAnBi5j9wd7fqtPQH3GEPFEkkwkijbZuaiCUR97ao0pFGxmyJmUwB7vIDlzoG8l7AVMvexgm@vger.kernel.org
X-Gm-Message-State: AFuF++kfp7wEFuFZdb+MbWDGxPioxR9nWg+0wsvXzE0Yjlog2HoQWB3U
	5GaWCD68nNmqi/xhRe6vQS5aC+IVbBuxT9D5z43z/i/TDqLKIgfiWDwGnmQDkIpZOER/3IBBCAG
	y47lDqBIRQKDqsOgWoJKTwBBlFhAYspuCsSaKP4BGOMZ7xHfVq3QcjTRfzPDme+Xv
X-Gm-Gg: AYBFou2CK5mZJngO/DxlCxBiXTZ+pm3i5LkNxcd2E91yki+aPWVUAstg0O0Dg6WPDns
	didaJT/Kil36MFNTsQrJuwDaEBsWO1NvMyCtcxjd6dLDWebictgJ2b61BVUwygWyV2zHkL0IGwY
	4xQMW6idLYHmfSWsaDnzxgB4CxCZbMF7IT3erAB+k4NbBYOl/LwLT1XhYLYmGpov0Tm1R/45NlA
	7at08VpCuuM8Bm0hP96wCgmszySUti6bYoiRlzTT9GpMl9lHou0kuLcssMRHHlsucZIJ0cJoS16
	asZBn8thi4wSl4/1PfuKG58nZFpoV0V9ppYtHz01dyWSLtl6SrSlL5kyZCb/NhwBYHqw65k5qvm
	BEz3FYLwq3KVLc3F+G+ZwFT/xuM+W5urgJ9ix0JSMIAQ=
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr26208820a91.22.1788704292059;
        Sun, 06 Sep 2026 07:18:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr26208752a91.22.1788704291600;
        Sun, 06 Sep 2026 07:18:11 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:11 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:07 -0700
Subject: [PATCH v4 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-1-aec5ed642f4f@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=2969;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=hmsI2AA/Q+IIKEXrHu60oCsUSSUt50BoFHeX0KSPKAo=;
 b=oNS4TE7Xx2oMQ0HeLwT0ND/rbxLQj2FG1cKdqmoi7yc2yxyoHgv5/JBGtLC1ld6tqvcrVaLvy
 /IW3/ij+M7UA7Zh7ibEPRO2tNGWGpooE4dcXGdUrPf1exZHCCY6MTLJ
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: 3cLtt4T42I9iCoYwrM_D_5M5_dxx4KgQ
X-Proofpoint-ORIG-GUID: 3cLtt4T42I9iCoYwrM_D_5M5_dxx4KgQ
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9d7625 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=abD0O5-mJzoiGkpUKuEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX0vBnb6ItMGOY
 x7raGVISMXycMQtj/8ArVh4xcaX/u012sWX1/Tq64aLvW9m657cntCFrJWpj5WUmd1IpdEtNmmZ
 gmMJNQpWPAqH8yqfpdlly34hkp/dWwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX9kw3eddCpcEt
 r3nxYhHtuM4mr8mNUMSLdXLN3XYg+xHlvAZNn23to+7yiYygGYrFBDzEC2PTN9Xzp1HAA1C7fVc
 /Ozuqfvx0+1FXmZhDGBAlQYCEr0OPyuEfRIhKDHxZ/8DhdNCxEKjLR72HeQbAF8rGylC0ZffNpt
 5Hvdkilc8X5PPMZ2uh4iuuFtielRUnQlLlf9MFCUm7Y8RHPb5lEeCMrNNQTJY6cPW5Fba3kbHrs
 pTOw2PMvRA8LBVdE1OpwFYxRUX3Ub7dEZXVxatodd/TEhhBHzAU5OZzD69MgyeY1tP98/u+OQQk
 WLbEYSQhdmsAhY/0eKnWrK+by7FKt9s/fZFgxPgKSSIh/Ah9p+Ov+4bkup3YeK5/4uZHK3D9vHn
 u65mz6HUq8S8WRw5gR4mqX0Jrsw55uSA8+wX2rW87ZDunZmihok6R+TSD5QYe8GxSfgBaDa33Yg
 9PtdNJIE74Tegh/DrPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

Replace clk_hw_register_fixed_rate_parent_hw() with the managed
devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
clocks are automatically unregistered when the device is unbound.

Since all clocks in the driver are now registered via devm_ variants,
the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
'unregister_fixed_clk' error-path loop are no longer needed and are
removed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

