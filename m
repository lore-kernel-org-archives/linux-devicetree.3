Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D0537BE96
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707941; cv=none; b=apYsZqja9DIHJuuuzj4hMn5+Kb0McuGHOAXO/l6J3mBp0UyHmgrD11QCyIkc18Gv9pEHjQU/YZMI7sHUb6GW9LqLy8VtY8JMbnK1sAFKYBqMbGTO0Kep/v0jXST3aezX+n2j47zV49aLm0n8Pson+jhYLwyN7rvEUMrxh4yfK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707941; c=relaxed/simple;
	bh=+ez3JrkuclbbjVWyUf4iDkLjrdLAhjMTMNt+sjUGTes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kybEjxcp3lk9safea+1cT7qKPDjbqRgGPvNBH38QNzJOCLRSk7PLffVlAkkv3k5dd8b3ZCyEKSfxxavhR6+myxviQn5AwvOGAudVgwBe6KNw2CtVXZUp4KX83FU0xSQ+cqFifSOy+Fq3uh+x5ShnS0uWtlmAhORUVmq1nLH7FB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB7YjByS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GayV/mmz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB7YjByS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GayV/mmz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NI2b1730029
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bReAtnTBchEqrR+06ufyCmDI/8DlpoWcT5eoY16Nc0I=; b=ZB7YjByS33jefUt8
	7nocjRCcqM3BtoFZEdRyMLG9nRvrXUR/HYKG/1DVeDeFnYC64L5V/RrwDqYWPX+Z
	7lnHAXYqXbVf+ix6+Mdau51axBGlvbVmv39NjTb+eliMRlDg7IR57e2Bn7VHn7JZ
	dkY2sMeG0KKI0r6IqVdOXsTaQu2okiGPRF2TcD3P81yTKfbShbfO71U98XQyqg/v
	xrOgG4IZLsBCPFRG4RpniuV5GiCaqpePcva/GRHE/eUyaGIuSTiguGcxBlbQCjB9
	wEzS3C6iRRTYYBT7Oje/6Fr3BUxtPSaHbUONu+F52QNZF0vfmXJ4tJt4STa/Pyt4
	0QKenw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7vbe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:38:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1384427c3efso8668298c88.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707939; x=1783312739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bReAtnTBchEqrR+06ufyCmDI/8DlpoWcT5eoY16Nc0I=;
        b=GayV/mmzYMG2oC/WcrFt274FITksJvGGCRkiHvM+7h6Ffn0MaUSte27EWa246KiZoh
         kASFLPYhjEBhLXmjzEs/PAOsiYdRF0NsNwgO5A9X3+3ROolU8sjOBn3MEjT/sJ/S1Agk
         wZP8AllfuMDvTwPczmAyqsKh4Q+2A06J+f5FvtCLYMllHqrWkXtTe676IuFXiHsDOiAw
         I8NBGEi1RIlXRIa+Qa5hDHzBvkrzmmZUieVByBBtRE/A12mPhhnqwia5aQPAnsJPl7lk
         qcXdagbuNwvzp3PzV7V+dNecq5xFI8f8hVQ3hcqQsZjpzVvyfvIUG2XE4PnpmgG66w5X
         m+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707939; x=1783312739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bReAtnTBchEqrR+06ufyCmDI/8DlpoWcT5eoY16Nc0I=;
        b=Igjp+YRBnlC5otap5VXaHewLDfXlB3xy150jijpGdqbWgr3HMVBIxZ3KwovssUj6xo
         RuHZHuWLd2UGAQ39fROriGMrVE87lNgHWxC7pqQNLguFa+CXMxdGZpqNmglehiDURgGq
         uYt05gCVCl2KeWHwktXUdx4TwYIhDmCHH1jrSaAN3gPvJtLDXXfmY4OsA09lQEwracR4
         XyaLzu3JEtvlhxshYz2Bv8qOIGpSC/jEcSbSK3dhZQhvDt61QNlI50a/E8cQQyxNcHtj
         ub3wGQPbHwyzfowFsrW5H4nTuZmBwz2wsA0NCQHN60TwdUFsJZLG0aiLaQX1bfFDrJRs
         GXVg==
X-Forwarded-Encrypted: i=1; AFNElJ85C9ba3aiiyR836gcufacfqCqwh+hiG2xF7ignx/yIGUnZaa1pLaeOUJeEKmoEbDXQ4E+SGX4JsfQV@vger.kernel.org
X-Gm-Message-State: AOJu0YwcRCURnh77wdYKyffR9DsI0SAkWrZ/imZ4tZ/IzR85E13hfP8t
	Bsmvh6tu5Pcgmss4spCp66bVdmrccVPdVTGINE60KuA0McF7muGJfe2XwYjpRTK6iLwpHReN9SS
	DKUZ/7ClixYIfbiRKrrKn7q3+gtw+UZNc+K9RO/25H/RERS6XmH5bqEVJYX1oPUYd
X-Gm-Gg: AfdE7ckpqeKY2+U7Zi2eWQ2b7wNXW6g8gteWt+lQ8YxMuV7XhS+6fscGgXvfOKEE+2Y
	iLsx6Y1dmE+XIHc9/5XW3yCHpQ3kUKHa6xgrQPwXvd6qJ/AmsmI/S5n3xJ8C+Mu5n+fHQLqCOLe
	2ZktKuZ/WOUnyShhlWDazCAXrmnhgaJqq5gdAyj7U3mAtjyiFDJyyYZf6rnhAS0Oh8DIguzeGbR
	qwtU+KW/BypN3RzwF9PaCMcZv9yAfNFKbE6VVH+XFYP3RpPV93cl/UZ29xraRHEcfJioGnvlVbK
	7m/8CoGMjE9XPTqSPlFYAcxF0Ur1BUC5bbNqUcK7l4skckg+8aV0H1LhUc9LJrbqOT4h1J3S9dk
	6/jbE1rbALC2F2ZGeSZlc0iLY1xrJddQOZqQFpV4GtENRHle2i4pQ3BUGqqELKpu2XvONO+ZoRe
	3VXU84+MpzI9HKSROsLLUf/wY8kzFoEgaospgAH51E
X-Received: by 2002:a05:701b:230d:b0:13a:34c0:d776 with SMTP id a92af1059eb24-13a34c0dba9mr281957c88.45.1782707938719;
        Sun, 28 Jun 2026 21:38:58 -0700 (PDT)
X-Received: by 2002:a05:701b:230d:b0:13a:34c0:d776 with SMTP id a92af1059eb24-13a34c0dba9mr281938c88.45.1782707938227;
        Sun, 28 Jun 2026 21:38:58 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fcf63021sm7791247c88.0.2026.06.28.21.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:38:57 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:08:43 +0530
Subject: [PATCH 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
In-Reply-To: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX1pdvWNfahmZj
 IPhQpw+yWfJR8XyTFktBqpla2dU+L/KfcHKMw/xpBZWS0wr4uHc/bNGZcft4ESCwujUxRKewXgT
 J8Au7RJP/T2pipiJvtLUtFw+BuLeB/OvzaI7N1lRcteSVdYuE76TyESheMHSBRCip8pXxx18XEi
 oedC4YUf+q2ZMh8eRAJ+tNOwE6R9G8+k6IRGQ3e5emGVH1ER1UIQNQtmHd9Kegiv9MjFU4bzOPV
 ZEZ1j2Drq61scpRup3fs+nddiDdhVuln6S1Vwin2TSnkLWqAkOi5j/x114AvgVj/jWS1I5zDMaK
 LMcKdCtvslLvFjOhfGR9pYPn5edbIkY+LfQ99ZI7UDwy5k2AWof6CYdJ3hwh4G9HQmdXeSkSbke
 nj31ro1cuZGxBk7Bw/TdlZgc7+Xhmyv2DpXR1AnNnpVmgQ9xg8C9XY2orHhy2QNWHo4NHnMM7WN
 XpQZqYAISDOJFkTQg1A==
X-Proofpoint-GUID: C_IQP-Hg7rA2JFf8X0upiKsxzPkMrRyp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX+pjsT8Xn9rsI
 sprKzhbpOWIQDrth7eLCSzhieOv+0TcxNnStlfmuv6bDvicfR3tYqm/AeJIpz3qCjvi8J8rIqXA
 QW62QoPUo3pt8ZWhjW6l1Q6dO2LzKFQ=
X-Proofpoint-ORIG-GUID: C_IQP-Hg7rA2JFf8X0upiKsxzPkMrRyp
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a41f6e3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QNGU6pO-sn4YUdBRpTkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290037

The Application Processor Subsystem on the IPQ5210 platform sources
its clock from the Huayra PLL. Add the configuration data necessary
to set it up.

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

