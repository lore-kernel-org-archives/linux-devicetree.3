Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0C343208
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767906; cv=none; b=Vm1tSkWogMm+7ETCLvmrKf14XGZ4VJOtUrM4FrMdpbdAaF2Xnh9st9YQWBty9f5whZmNQFYL96UJ5DcULJnTl/Gjc7O9gahjVGqXkJCyWAeaXvQ/G5/86Nk3FnoxX1IaRWSyD4RavKsZYzJnPuAgoc6gQ7U20GMefBFECAdgjBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767906; c=relaxed/simple;
	bh=CCX5ERKILcZef6gbTvaCYDy7WMKbpX9Nk1m9SGgEkGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SmM+TFqmv9XW5duSKx4wW7YaF78B39UL3cJmRJJY9zYfWcnnw2WL/lREmq450CVtyyh/BbZ3fgWDWDFLQiaB1xrW56ualkJJ7e0lcHXnj6gk4+Wj7P6Bhb7RaOB4XAsarvZHkpp4J+uItoeL1kamW1debKk4BmkpWLacoACz1zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yec0/o1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjcMaJEQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yec0/o1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjcMaJEQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DcvmZ3936917
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 20:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBQBtEf9fHj/UoyemK4xQMiOqR8KQmMChE5F53hHDzM=; b=Yec0/o1ip3fYenUT
	MKDF+8zhwoM/XX4Ut3KTdFyWpemI/rosgl8JMWOHDcJd+bTykWP6nPckB2wzBenM
	+4KjzVKrDRv79uvVhvT+u6L121vR1ghCcxj2m465N3Pyx9KYNtMhjB6rbeI0sUyZ
	Kcm2Nqaz21gvyrklc4YQ6kiF6JkbLHbpQQKiFCTPeKiVjZSrizm5nVMTMjaV+jVQ
	jk9j+e//Rz0VWaWvDXGv8Fmve4tqUq3UpfsVajB3sFC2eETkwJO0Vba3go059VVF
	X5+LRGev3bnsOmxfyYeFYpXfqROHtf679zhsWsTrc44O9n7quGUSSedZxGCC0nMC
	F41cqQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5s9g3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:51:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so5430073eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767902; x=1776372702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBQBtEf9fHj/UoyemK4xQMiOqR8KQmMChE5F53hHDzM=;
        b=WjcMaJEQT+PyBS5eO1Y1WID4bsQ0aWaK5F0oVUfNCKaT+XjRyzyiBHP/sERj8AcY/T
         CTZ7+y3CO3FcVXl6z7PmYgkUCYJG8m+t1vW7lyaSaxVBf1cHZS6XBrbkzqslaECz/Ogc
         tyWj+DC+2RHpL8BYi2T7PG9JwOJSVr+IxCiw1D45UaH8H4yY4Kpy7OczBH1IcbdvBQnO
         uxsxVBxWZx0kAzs2na/CJDbhssCVfXenOfKBnwc4B79pir5/BBJoECPHlo0MFx4Wch3e
         lA/IELmNRJCTMOmYljaFBN5tZTtJCpArwiSyicXlqxIn5ySX3312OvUkXyuEQHYxMV3e
         z3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767902; x=1776372702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBQBtEf9fHj/UoyemK4xQMiOqR8KQmMChE5F53hHDzM=;
        b=L4rX8SRAFtHxmMim6S+BnsrZVgR0oyPDNs5aRBOFvDph92siaZGzn+yQl4J4r30GPk
         rw9ttgLpwqcz4Ulh+zKfKqDve5Dn7l5zyvgXh6cs/VKl9gxDDgxdDCCUDJdiw6Dq5Yd0
         8OttBU8yHFsCwHguA/Ym+OCG3bAbUmHNNvZA/yitR7el1U9hDkl2KpTuaepMpLih2Gpc
         XuJoFOZC/rpj/pOm14k5gLrf+NsYAfMKrzJWjBVmh5eMKEYVEnn1UDuDpY++Ci3m0UoU
         ccczAyjvwNLE4qC9f1qiotkVVzB4G2lJZb03vTG3R9laUCvUpwLwhz+UHu7Q7hdUZ/sD
         YCYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUSkpHSRfPaE+5EGrQbsOqur+NyySNYkJ0fH9QGDvHsnirXFPvec/3adHTu3H3hoUwE72YUxeeRyUt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4AVo4QrGkVRrRsBIDqZZMqQ5kcel67DGoO200dIk3YnKYv5O
	8jAC2kbLIIMy0ZLbfaTP8OmQEM4DKMoHp81+DgCr11j4SFQjXLe3G1mQxNIUNs44KwWPOyHkckM
	4F17Wxs2K8V+3Oqe8hrJk6Lghu4a5cc/EHf4Zhsxm3ve8wSur3NN7j6Pn8hAByEKv
X-Gm-Gg: AeBDievmKhoQ1hFKrSm/2cOIsiajt7myYUFY/UJUaE/nvCONGfTw0QsPLnE8/7jR7qP
	DxPalr91lyl34dWI+EHeQC8z5niNxCgS/cb95pYTeHJeYOnEhRZBQf75tIE5mcydV4RVW6xveo0
	GB9Ld07KXnYTsEX1Io0bZgBkgosTlY7nokH19iVU60jJ4SgETwECr2Wv+YU4xwZmE1FxzhTmrQ6
	lddqI3bp83QEYYGjdCO0qe8kMyjtdw/Ix5gASph2hfyCdToPCMTXWxhpC+EYb8ooMbaFIAiqoGO
	96pfxRY1Ao5qoOfZLpWLMzJ6Q29/6AWOGHEPx9n8ro4OPQZrrbf9GVtzcgVUhTpSKdNJFuZyJk9
	bzK/KOKP1UkAk3slwDrjWT+zLnPADyPr8fGKy6h3X7Sz4n2dywt64e0r24eqAxPzJ2HilNHx/6N
	QL
X-Received: by 2002:a05:7300:8c85:b0:2be:8216:57db with SMTP id 5a478bee46e88-2d5873ad987mr327348eec.3.1775767902455;
        Thu, 09 Apr 2026 13:51:42 -0700 (PDT)
X-Received: by 2002:a05:7300:8c85:b0:2be:8216:57db with SMTP id 5a478bee46e88-2d5873ad987mr327326eec.3.1775767901923;
        Thu, 09 Apr 2026 13:51:41 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:41 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:38 -0700
Subject: [PATCH v2 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-4-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=3000;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=CCX5ERKILcZef6gbTvaCYDy7WMKbpX9Nk1m9SGgEkGo=;
 b=ohN+oVkVLRFI03wdpX/CHpGmLrH5oThDRRHLNfPNiwFVUFeHshBcMiWnmnAwvKNSc9TWCQ6fe
 UYA0tYj3xIjAZtFb85hrcKVcreCWxCtueRnnI+r3S6x5ADrXNBJZBlA
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: v_DuZ0cHpiX_4nZzGzN78WQswEkacKBh
X-Proofpoint-GUID: v_DuZ0cHpiX_4nZzGzN78WQswEkacKBh
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8115f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oFwqGCNmLK_XFdElRrAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX5GxT+oIPbNzG
 deAkqRzqaodfubPznW0MCbgSg6z+HXjfZ+3SY7bPuRr8jejFsSmUdzrbjP3lS04OXp6agGHBmza
 pfgYQ2k+DrnD+IbknSfMJJAHjpA4QTTE2F53DkAAnPe4I214hbjvu4QguPswTobKO9xDw7hDLav
 3yNiXSpyZYZbeoxa/KR6ztYJl3/0pwQ6NnqJUkK6mo7UHFyWc/nq3VXtsbFUjotDtpK1G9aWYt1
 m1AJnplDTbG+IejxhOsV3wLEKcFOv7BE1LjJJynAQLquNSPbwVSG2K4nQ/VLg422BMKJEih5FHr
 8SOYwkKBbls6GLD0Yk2gzwlTlif2Spw6OAYl8l2UOCnlRtXqOCPNYTd9fBqeWldkEMwapCPk6ax
 qBrtDbQOir1DXNlYom20lO1RxP1ZIv0jlRGuKjgmtMSO6bT762r6ml5v+rrK/gbsuXe1MsgMEV1
 dw1PpIFrkR7I2oqBvyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192

Add RPMH clocks present in Qualcomm Hawi SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6a54481cc6ae..f9084c15467c 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -405,7 +405,9 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2_e0, "C9A_E0", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4_e0, "C7A_E0", 4);
 DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -965,6 +967,36 @@ static const struct clk_rpmh_desc clk_rpmh_eliza = {
 	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
 };
 
+static struct clk_hw *hawi_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2_e0.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_e0_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_hawi = {
+	.clks = hawi_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1056,6 +1088,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.34.1

