Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6835AC24
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055057; cv=none; b=V2NilKtZVJLIN7XzFtU3UELALAqxfIERY6SXjlF+z71BfMwOK9bTWUKkytE61P8+erN6cwldxI8Hk2ACvo+WuOogLcLDNSfAPK5lN8MDR8l8OiETz9EgxfQJb9NgHLW0h1o9At6zHq3Gd6dFZBIyyiT4HyQEkpHl1yKS7EvuafI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055057; c=relaxed/simple;
	bh=Jbc5uj854sndNrqzn6Bi+XLo5qBoc8WY2oE4nLn0mT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=py/oJoqWPJyJHvTt77aqwsftmZHX4Q84rc/w104wBjZNJJySp2qnZeV6sRcPUJBkgEmJ5+yCOshrJxucHNGq+xickeNa0gk9wpEaGHWCMubfd4sh4hxf3Tkh0PSPUDGLAjxwupnOPv2Ijf6Su3NDmCqBjhfTtf7+PH33n+vA9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MADlUf4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guCDs/9e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MADlUf4F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guCDs/9e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342fCt2777621
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 05:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xcwjRKiYI998QkOOLYdQDedV/7nqediu6mn7AwWDYY=; b=MADlUf4F/3mNR9Og
	BLa6LyXPg5UK+Cp++72Ro7VPdeSJJmwmUezHRLdDxeyE7FZMstbk6yHjcs/OUC3+
	8y1FL/wV+0+A9FVXQmk39sed8MLKkX44vz6jJ7B1n4kzml64WmZ2hYECBxyz5t89
	FarKMPgFxueww3fA6Wt5m/Hc+XnYaAK3kdLERvWgRDV+LmVw3no4Kxy/naf2kL2O
	mrQR1ZCpJcshZi1pELBFOoV4Hv7HJj5o7JNp2Ca0ekh9JMW0xOmZbmuH12X6XP3+
	wEOpqEFs8HsnCOBWBCBH6sn+nRjoNAods7dgNEwfQcsXMm70gwlbfHxOBHZPTPXo
	3ovHmw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2536sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:04:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8894570b58so173922a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 22:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055045; x=1783659845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xcwjRKiYI998QkOOLYdQDedV/7nqediu6mn7AwWDYY=;
        b=guCDs/9etssFs/psewTaOjQ3r9RpGFkSWxJwYTlrhNmKaHdacMjGtpAqAJkA1L19TQ
         WEPyq5bJV5k6iC2XgqPoQsP7GlzNyF+Aj2sn2oXH7+zy6pVGGAukEGefkktUKpOs6CZx
         7R9PdTJnrWEvqtFg88UBXernkKdsoSmURZymaUxhTLXn1fsn07epLpXtd0POaajkQIio
         fACDEXAs0q3nFrYPVLf+B1camZKL2dxgoORvYPuefLBbHLYxP5nmFr1y+zUqcJhDSUNO
         OeYq78Ixi5WYp8sqq+a1rVn5lxJS+hgyK50dNsyo/7427+S+uIzaV0s7aYWuZ8CsA1vi
         QLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055045; x=1783659845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xcwjRKiYI998QkOOLYdQDedV/7nqediu6mn7AwWDYY=;
        b=Y7QHOBVdSZrObGnzeBHlLaidv6Zrli6c/6e1b54zdTp3fjj36Q/UzQ4rOcvDyOFkEd
         wqiYMbyuWgtfHrw4Entsp/C87ClphTwnuAA6VMQq/niM1TrXLOS8qJgzPZnskOCxnzIO
         RJRc96b8LjW35paHPJAq4KCTp7xYHCEmrpdmGJeMd6LIAX4gAASMXMEVmUP4Syl/r7od
         b0mNmaPLCjh++glHE3ovpsS94DIX288mZd0YLV9XX0Qcps3Au6Y8cmdvM0sBOgM4YJsU
         PKosVwiQrXcUU/x/gJiXJ1rzcm5nu44yMhAMlBi5zTknnRlQGmRYqcg23pVGdyBPOTWB
         RR0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+NrmlKDDikbktOXHYnVaCEI83pEDqIGtLGjZw4gIWqswZqi4G2UNCyMTrzjAVT9KJfWkZ/3bdvrTnC@vger.kernel.org
X-Gm-Message-State: AOJu0YyOdPLpXDbxOw4Ff6DmP4tSGzJRIXPyfTZzOgBvA0elbERMruWn
	be0C8fLzJDuYE7IvOa87YDLM8lZakacxz4VVa/JMV9L2B0NFQxjy2DAoY3lTidc6MWpHkm4ySKB
	OHCbKYFtOyNPIx9morFT6iCeycBc6zwjYDTzrh/cdqYAXJFkFUfL0AazQ26dCmGQy
X-Gm-Gg: AfdE7cn9q/FV829dPXh79fPtjMEhkc1uvru09W77p3u9w5F4IOcUqvF/0f4OY40K7ec
	Q6Vzbr/diL2i+6aHhZlS/bpW2Jn/MMReQofhAgjYCVhaLZM7NwXZL0AAkMnI9+nf15JulBpLI47
	g+hyXuTjpMLNBB+E7T/KYmt6J8U8cAj5cQzECw62UK+nDeK5/ktsA7SpdWDm57Zld/fAuZG9TT+
	RFvNt2z7yl2NATArI4tUG53+mjcu8W5gYFh99Gxk5itF7NrsFY3BTdx3U1GzphAC1jKOouisLCT
	MTAh11H2NJ02Dyv6R6/JXrkW0CKh8CKNdjt5Ranij9tql7ZXRQf58tY1xyPrPdi+THixGXsMWUk
	vlv0iLmdhJzv95+lccdkAudkZytU3Al5FihnUMc+Osj0fKTLrl3Dg4+f3+R9hcTxTwCfuG5V6zd
	+QZ22QYH62SS3seMjJ6MwxxP60HMJRgYudtQtbpMDR
X-Received: by 2002:a05:6a20:918e:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3bff42d5dd3mr9848887637.51.1783055044696;
        Thu, 02 Jul 2026 22:04:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3bff42d5dd3mr9848855637.51.1783055044181;
        Thu, 02 Jul 2026 22:04:04 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9873sm16109674eec.4.2026.07.02.22.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:03 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:48 +0530
Subject: [PATCH v3 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-apss-clk-v3-2-4785e89a9c58@oss.qualcomm.com>
References: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
In-Reply-To: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4742c5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=94KMMKG3cFIHHFi95eYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Ll0v4bWTSnXuaDnQYfUHNqUKjg3iq9KG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX8RUzv16gvDkA
 ndqrgnHLzerj8/XMKQmjEZrcTUcrg53GOHnPFPyVs53ymNpyiyu70+AUS2LzG5+2pvwQ1MyafiB
 LxVIdULiIeMQLF8t9x2w4/a1mSrABEsP5dGgaTeIU7E3F6qPL3U+S/u281BH5oOr8AsxjdwTcDn
 oW3QJ3CRVdgplL8KaZ7YTu+2YwTr28ogYeV8RP5mv767EFFG232gXe+5yaBRNk2CoCxEm5VYMcT
 FJ5bgCbkutstd0Qr0S7reQwaZxyqFe+ZHLNbJFd95LO7SNDrettn1nJFhlWIlUANKLhGcOS1dpt
 0YY6JFYnO7ehV3eDY9YCuBqn+VJdC7cUMY9G+J7m74JQ/PGI1zZbllcsKP1gtZWdNrookiKNl3i
 XW50MkBVaUpgj6gmHAz6AAcgVZzn0IWExf4GOuxPDDrdJ9YvuV6EdZYtbgIl7HousPJpeqdczhm
 +GIKzvuzmnD0gWd+cIA==
X-Proofpoint-GUID: Ll0v4bWTSnXuaDnQYfUHNqUKjg3iq9KG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX2M3QEj9ajgGR
 JPrbMfhwXOR3xskr3P2SzitifA65/wTmTXUXSte8qnZY2h2e3nZAUqnuuxSSOF+yCT1dYn9pXE1
 JHsq1H7W/G6GdcjclLi2j/bff4R57lQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045

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
index 3a8987fe7008..5653bb5e93f7 100644
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
 
+static const struct apss_pll_data ipq5210_pll_data = {
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

