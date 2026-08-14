Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202D646C4D1
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711701; cv=none; b=Ikr8sMOJCd9qDxLoTbxG4YO4VLujtRVTYMJxqSi1/DupmweD5IzWsxPiACJEDr2dz/lmP/CEmUOZILdKds1R4eehQLujWwK/rgNAu67ROJJdZn1PfEFRA3sDs7ToHb3lhhkA9cTk5wipCBQX+QDmv48+LZxpCC2+mtEQY37llPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711701; c=relaxed/simple;
	bh=2CIWbIplPIOs4YttBUTOknjwz6v70LMbQmOzk8+bHYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tKPy+0cskcphFbjvssw4mZOF1JP6I5Kcy57Xs1FHs90K34Tw7MJdPUuhTXYSFXy3lXfIgFEucLNGwt5GA59kuFN0HzuFiZHikde0QY6nWpySxBJRtxDbNxRjEg4Zk1XcYzyLyjNb0AV06S1fjJWOVzYNW3NH47Bt+u14iRTtijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrGENS3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eojfjSiT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrGENS3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eojfjSiT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbH131125775
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3S7TkzvGw3bZtPLPczV07Zg7pGcZv1h+gR5zT/H4IGc=; b=WrGENS3c1+k+ORUA
	Yq6wsxrywJlnpdgjovqrBk/sgNy2Uv2NmMT7pbMxNk+Mtr48Or3ZqicOH0dBDB7k
	GSquDmhY6gSK7qqO5ZywRepR0KC9ngpBC6uxOO5VJrEC8W3xL+uznISKsyYomAtz
	WKreM9ug+5jLmNlG3wH4EDtjDe2NTFVz1JkLMXg6l/Zv8RxnRze4M32Pc/JLcON/
	kMGDdTh3njJu3uIAMOhEBSlMUDJFC0CKZpDAXh0lGvkWwFMoYE0VTCkhQSqT1/YO
	DekyH7eya0a0975RggNGGQeUETPIDZ5zD6K4A5Mc45iwrQMfjoaopgjNKpck7k6B
	fjQVWQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f45b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e01a62d99so996191b3a.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711697; x=1787316497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S7TkzvGw3bZtPLPczV07Zg7pGcZv1h+gR5zT/H4IGc=;
        b=eojfjSiTRdPDXAcDBdtCStzmXVAgw09M/6nUsO205X6n+Mon7ed2vYSeHymbf6bZ80
         4AkEztVeGm1FJTJ4bWtgTJg1G9ATVHmciQeIuimjFgj714VRJ1Z5Ho4oDej8ixDq9GcY
         c4fQL2LS1Qr8h5xiIRKBrDN7alQ1C2g3NlP5C+XgN03O+ht8aoClYCsfg8j7gLVSd9rU
         F5SUD66Ma4+PJlTZXoWqvxTYLOCDQOCBsI+mEfMfW7ar1AY5WvDQ6UcM/V1qKIypfb6U
         USnVxc4mk858mH24AB8TW02kQAHc0YSaqFO1LBLrcAq3ZUhZ2kWCWJQlThvOaAY5suGU
         bYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711697; x=1787316497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3S7TkzvGw3bZtPLPczV07Zg7pGcZv1h+gR5zT/H4IGc=;
        b=B9+5jHfE+gTZZgwFZ1We78ipDXm2/bVZczkJpxatlTJiKh5KXcPd8yQPpq0Orgg2UD
         p2lcSJHcyxjEtm9Y7zdqHCJvNk9OIaFweDaBWYhvc5+g2Ab/Azn5FYXoGOJB8+Re94a8
         Dw9SMczM7snGjqbx3At27sy778WMopNWJ3cdz0lGroZoF/FTHpvFFdzDeO2aGZHvVXga
         jvQ/O3B2GtBhdtC4P+fyKSMlzt/jO5CLgcsI4W/gPVYp/4zJ8UPl1mcBYuU9a+UpvnlU
         kS1Sj5o+rcfc7B7dW0j+Uz1vQD1+a9zzX41fU4I4GA+RGXc6tuQ5Iioa1pjCD1eXPNBN
         c/Xw==
X-Forwarded-Encrypted: i=1; AHgh+RqFN3EEL3hRq1rzjV+cxCU2QbgUF0VEPO9KSAcyxB9qTF2jGV16LLFbpnx2E5mcmygbiwME8IKOICmf@vger.kernel.org
X-Gm-Message-State: AOJu0Yylv3AU5HObbNZvpnyIkN6r4cC5TE48h7sV2+TEFOtYRMKgMWbe
	B1UigvGIe25kTgx0BwCjx0/IGNgzBnGZYAtBDN4W+VHDzfHdaBMhxPlpTlcAZ8UK0najnL4Fu9A
	TKh7svg2KrzhUCpp2NxOSHxbmCxGdvvGvFqLQFZzeNhNpfwOtxm4pPc1TuOqS48rC
X-Gm-Gg: AR+sD11VMAToyHVPRon9ET/aQfJg9RtDaeME8VaqYeVcGJRxKS9wIYYB4ierAFlyKUe
	vuhKGgVScmaSnuK8HPsVKwAdgaVa3AWJWNBm74NjWtiW2ofdkP+yoqpwto3tHy/1rRgDhtC9vUT
	A7SWdl+lDdvwopjFiVZYeAhjnoZbJw/6+7wJznX7modpmvUjXzcKA8lCN9ed+35VKUqp0qAoM2h
	gNhCXow33Jep6hrPbcUMBGBCZM0TQci2Gecrg62aLDsx3ls1mHA9t0SlM0hoSHlezNR34gTczRH
	U57+qBlG6bk3uYxeJQeO5H1dsHgamcvIO2eYUHTnVtixN7MIMStDOrp16ns2L9Sf8WziDtSiCeh
	Eevl++MGHnfdmaUnXM2DCyBw1JIr5t6UOtIFFUnHfbzo=
X-Received: by 2002:a05:6a00:12d9:b0:843:468d:7804 with SMTP id d2e1a72fcca58-84fde37d773mr5370420b3a.34.1786711696453;
        Fri, 14 Aug 2026 05:48:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d9:b0:843:468d:7804 with SMTP id d2e1a72fcca58-84fde37d773mr5370371b3a.34.1786711696006;
        Fri, 14 Aug 2026 05:48:16 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:15 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:11 -0700
Subject: [PATCH v3 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-1-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=2916;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=2CIWbIplPIOs4YttBUTOknjwz6v70LMbQmOzk8+bHYk=;
 b=oTHbFVK8v7gTvHGVVptcQmAJwKo/GYL7M9Djo98/dsclywMurColOJQIrit1F9uvlNN+j+efK
 PGRnWyLJJYUB/GSAtjdfIcchkwTVyLV76Oas6FPsaGdOXtO6DiBJWBA
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7f0e91 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=abD0O5-mJzoiGkpUKuEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: bz-6h-NReiIiCV97bvEypE0g0cYTe0rR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX++ePqyCvCLdn
 6lK4GNNU04Amt1b17hZj4GjcAqTLILa8js8gFQOhpJpikTg6Mw/OtRArdqQQiDaj1fgi8jPEpWO
 YO+MOS7ZboZZ+7/ln5OwUqEeb7Cl827wONr4QYf3lnQJDuYj4tf6ougeZ0rc3Rz+jielrZxFBMw
 3qxOyXtWSVl0hnrRRibswti2/UxnCpjKAeZ08ydEsSENSm7LrwLjow0QqV2cr6Fq31dskNRyOWZ
 GSqHV68cEWQ16v7cGKUtjp9fqQIHveCEVzfzFw9CZT3vFV7qlE0Qzw6Ze8lj24e40i/9fKaofAc
 mAkxGAbZq7oYrCL80EegE+o4NQ1oWk3jl2Lk0tcFq+l2nrMbvMe9Sr+qS/f2Dt1naPLZXyuehFw
 gvABtF+rLoYD5dtArd9KkR7w3O7Yp2llimYJhTizEwxNedpDm5H+vNQGakv1I5C+ATFbyUmV5dk
 CsuV454cPfK+tN3+5Kg==
X-Proofpoint-ORIG-GUID: bz-6h-NReiIiCV97bvEypE0g0cYTe0rR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX4t7/Z/TWZ1wc
 qzhCEH7bSBwdBaXimEpWd40iuP5vnzFwSO6qtUzqPy77+2Bc4OSjvLuDN4o58gr6/9i/2MmGhK5
 3ufs2/qharMiIhgCSMrtjRNat3MuugA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140097

Replace clk_hw_register_fixed_rate_parent_hw() with the managed
devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
clocks are automatically unregistered when the device is unbound.

Since all clocks in the driver are now registered via devm_ variants,
the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
'unregister_fixed_clk' error-path loop are no longer needed and are
removed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

