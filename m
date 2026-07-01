Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECF73AFCEF
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889812; cv=none; b=NtprnXnDz05DoEq9hMoSuGSVs2ozj3fMJqztXw1fSMlhvToAqbKHwKbe8bGWpEfZUrYHL26sGHuJu2apYPG5Uv/HTa2TonheF+4Sd+/Qi3CO7xofC2Zs6CNu8fMc23+qSXgZRKBCIpDjnufEy8hqiB/Xt+7iOUzgBgZJPofRqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889812; c=relaxed/simple;
	bh=eHRfI/jnXRdP6m6Ahka/c6+daaWAlkqndh2vyxydLiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjV6kzg6xipOOQW1s+HRLztdCKGnrbxNAt1rVmZmFvpCo3rxwXC+3NwUxgtjQu7ckohC/RjmxbHGzEdcmZhaYx0JBAqNkkF0myaQDaiQ2UQ0bMdX+wy+BdLN/iK2Kq0v4SrirPDeeK/4Rt1FnBUcvNYCxMamQztyWPHFrLCOfkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqprTELz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ukll8x6s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqprTELz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ukll8x6s"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lR6x065883
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 07:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXvDI6k9pNGkQjD+OVVnOpN4tYm4FTTwszfumsQeE7E=; b=SqprTELzAPBXtV1U
	V7TcEle1Sax56U+WGSzNUG1lwnr3BFWFQQndx+2Aut8R7Msbix2ihTWbNICBhJt7
	GIbFHmlj1vKu7CBZMYAZ0O03QKa4damM92AAIxhxbvtH+7eP/pLa1eB3U2zffaiK
	uyKQaZdL8gf8VhvGk1g7idzNoTcXvSr9wuTLIOC+AcV7U8WMw6aq3La2QMl5aWqM
	migZvQl19jzpQB3aJrrw8gp7p/nHAI/FQ/EpuBE7A5n0mjmnyZEmv4d8nBFuRVJX
	V4vPRzYtMn7yAMqCsDnmEW9hIJgDZ4GN+2VfhqUddKHk3Cr5r+Pr6BbLfxfgQLaa
	vMyJHg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqjt8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:10:08 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139871a52c2so596026c88.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 00:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782889808; x=1783494608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXvDI6k9pNGkQjD+OVVnOpN4tYm4FTTwszfumsQeE7E=;
        b=Ukll8x6sCPow6xFYWhooWRlgZZiGoJe/HMbRXDfwM9imA7MQgvDEybaQWgxPvQboVK
         Wxm3CwsTOJgg1PNgI97CCkNGegE/JURm/ozZX7LyiUMrZVhqVfprsTwsQH1ammpjnaN5
         UqW2R2sXZzaTc70aqFUJ1zNAq+BQ0NcOTeIHNPgiFV18jmqTM/WvbNH4Kpgy6FuInvpg
         oxVHZ/6qfakBcZf4PMcY83oArC8zDT3hM//Ego6apCjNwbPgQ+4rV+xExDKUjUbH/SSi
         V6e3hk1tPiNMVDzLYGzmaYKWe4GQL2JakMCLTHHiJs7CobqaGZFWOJj4pCdm18HC0Hob
         KvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782889808; x=1783494608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXvDI6k9pNGkQjD+OVVnOpN4tYm4FTTwszfumsQeE7E=;
        b=BxdtZ6nEvtcLUOHvDge+EslvGjCRNllRr/6utQ8Zt02D1/fnGNl4d9mFKmJi7X7jsP
         U3UbeT+Ohjt0+zBwRpoJu8oEzLJBbOPQLSPl08xbBvlMQ0b12Sh28VxEQv3GBXQfaMAN
         M29Gd+z+IlBJ0azY93Eie3xi8qQf62a/WpIqhH19Misnry08KAut5gLbu8oGHL2MSLQY
         78NGtKboIER+fE/xU41jhAnklAuei02wQNG7LKlTx3QQ1f2npTHTHnez8BG4ASdxCBa4
         CV9oeuhWkgLD1I9z98KE7Xw/lz8YWqRi/muuA7mCVKWSrhExO7LXR1DtWrBd6AS7MfP5
         H0/g==
X-Forwarded-Encrypted: i=1; AFNElJ9em5BxEo8fkAxzcE3MCHYGPwllx70WfqiwxhiyiWFmKJsVBdUtnp084Ge3anI/VpediPCs9qitqPPa@vger.kernel.org
X-Gm-Message-State: AOJu0YxifuXKpIWWiXPsLO/WXu+wjFEuyw46NbsYa9lXKSK3jKDuwVgY
	Mu0WsA8RM4FQxH3rvCdi1bPuGPwfXlgM7A3H8KdtIcm8HMjHpFDeMxXt+1I6LR2LFjA/fB1AYjL
	Ef+IovRCTrvFJA/us33anOIbjmRGoq0sT0YI08yR70HIoGEJk0xJXuvYzgifEp16l7/8z+kWN
X-Gm-Gg: AfdE7ckEBOzsLGq7zcV9q2SB4xFsqY/RmRKBBXV6pUCRe2BxeY+4sx7IppZFXeQscEF
	SXhWBAEXUM0hzjJEbZK+4g682ePyAqsD/mfSxy4/7CcbrUX4idK5M0hhV3S6uPvdAg8d1brCKco
	9XHQ2B6Xn9CsUNvDBiviEBAKMmvcrBjcSGBCiVyjLLWE8cNatPCfxTUOTki0r1zQ9lfV9pacNJK
	yqCDSAZIn7KQnAA5uH8CX76u+EgOLIiXwrf2dSx37KwBfkHCQCXRqyUlYg0LT3VhURrnr+tFlgd
	gZLVgasTG9JyMx8uU1NrIMlywRRn+vYnyaH5A2bRBlM19U49kh09nE0xR6UWuxL2mwT/cU4mNzY
	gbkDDGJJamF4SSWuuaeCbt8OmkoJxrXDH7ROoh3mUTrlme/0Mz3XdYMDsRFSgqdqDB8IN8rDyF4
	AUvPXOslk4uP4Zlg9wtvS3JtCsDLE1J7WJa9HXfrYQ
X-Received: by 2002:a05:7022:e998:b0:13b:3132:6e99 with SMTP id a92af1059eb24-13b36d7eed8mr533062c88.20.1782889808300;
        Wed, 01 Jul 2026 00:10:08 -0700 (PDT)
X-Received: by 2002:a05:7022:e998:b0:13b:3132:6e99 with SMTP id a92af1059eb24-13b36d7eed8mr533032c88.20.1782889807730;
        Wed, 01 Jul 2026 00:10:07 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm14426709c88.6.2026.07.01.00.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:10:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 12:39:42 +0530
Subject: [PATCH v2 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-apss-clk-v2-2-776d054ab8c3@oss.qualcomm.com>
References: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
In-Reply-To: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: LwGFkpLFogUaKE3Y7VLDEcPlHNodT0i0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX0yXPhd57p3DM
 Z6Xn98Q+glpnYJ5luDJ8jxJdEqWA20xDKz//n5iq4YSZ3KYi1SJh/LVVN1GKJUC5XeolN92P7Sq
 YwrLmWkzAqnJsG2Zlno7yGKCUz2VWWmOqxrv5OxWhkNceyuanvd5kf2RWOZC3YEq+nZLPgB1JYG
 pwXhGmtZFsYwxgtO8S0SeHa++ZbDUnuGF4PO38FmOT68khvv3wnQfdew4+yFW6LxW3oADZ8gv1W
 ZJu2BSbVe9xMZbU5gTt2JJ0esCm5/fTn7RDWeyS6c8BXMQwSjCwUXn5K0UfTEhXQhfoF9WAhWaH
 2yjlnktirGl5RiYm1vp79iKruMW3rXOXw3LD/k4/cuIYSkVypv/HyJHf3TVQHtfnjvy9iCqsKRJ
 g7L2ddNboeCG6KagHmhT8ZTXLM9OA3y5kQUrblTWQEmd1PGX6iWqV3Q8zC70evcJ/h9RiXytk7B
 Hq5JtD4uxHvoZSjU0UA==
X-Proofpoint-GUID: LwGFkpLFogUaKE3Y7VLDEcPlHNodT0i0
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44bd50 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=94KMMKG3cFIHHFi95eYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX9tTU8Wk3+SGX
 oh9vsVTvFB7F3+lcs2evxfvEebAO60PjrWX8U3wzHBRkwJHO0pqF0J5hrxI/tLHd73eLUywzHUH
 ZFKnw2yfjQFR8oyBIbXCsKilKxKSVfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010072

The Application Processor Subsystem on the IPQ5210 platform sources
its clock from the Huayra PLL. Add the configuration data necessary
to set it up.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq-pll.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index 3a8987fe7008..569ac76c75dc 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -79,6 +79,18 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 	.test_ctl_hi_val = 0x00400003,
 };
 
+static const struct alpha_pll_config ipq5210_pll_config = {
+	.l = 0x22,
+	.config_ctl_val = 0x4001075b,
+	.config_ctl_hi_val = 0x6,
+	.early_output_mask = BIT(3),
+	.aux2_output_mask = BIT(2),
+	.aux_output_mask = BIT(1),
+	.main_output_mask = BIT(0),
+	.test_ctl_val = 0x0,
+	.test_ctl_hi_val = 0x400003,
+};
+
 /* 1.080 GHz configuration */
 static const struct alpha_pll_config ipq5332_pll_config = {
 	.l = 0x2d,
@@ -140,6 +152,12 @@ static const struct apss_pll_data ipq5018_pll_data = {
 	.pll_config = &ipq5018_pll_config,
 };
 
+static struct apss_pll_data ipq5210_pll_data = {
+	.pll_type = CLK_ALPHA_PLL_TYPE_HUAYRA,
+	.pll = &ipq_pll_huayra,
+	.pll_config = &ipq5210_pll_config,
+};
+
 static const struct apss_pll_data ipq5332_pll_data = {
 	.pll_type = CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
 	.pll = &ipq_pll_stromer_plus,
@@ -207,6 +225,7 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
 
 static const struct of_device_id apss_ipq_pll_match_table[] = {
 	{ .compatible = "qcom,ipq5018-a53pll", .data = &ipq5018_pll_data },
+	{ .compatible = "qcom,ipq5210-a53pll", .data = &ipq5210_pll_data },
 	{ .compatible = "qcom,ipq5332-a53pll", .data = &ipq5332_pll_data },
 	{ .compatible = "qcom,ipq6018-a53pll", .data = &ipq6018_pll_data },
 	{ .compatible = "qcom,ipq8074-a53pll", .data = &ipq8074_pll_data },

-- 
2.34.1

