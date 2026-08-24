Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2563E5EEC
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553501; cv=none; b=mNETPssh1EBYL2PkRL4Gm19g2vAtH3JHiw18r9eDRguKOTMZMsPPXohr5jgx6atVkga+docftdr9GF3QATKs7G+cqCz4fbKjx2s65y/gxwvZF67MVK35dFi4gzn5EIFCapTy+wXpYyrmHTxnF9yZIwyRRgjpKpLoFNMPcAhloG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553501; c=relaxed/simple;
	bh=3vCvTVYndtZWiIdQu2/ouZB5tq58wBHYY2RVRNWWz44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+K5o/BxjhY+OPD/MtXwF6dYYszUIWwNhL6y5WQdup8lteh150hGVkz0oZyGziaK2nTqYkE8ZDgeWDJtxBmWszIeKh22MTuGeMimQb++kgqfFpEdPdHeHiNDNWzXW402Q5Uw3CagW0+N8fzISJABH3tRMcQXiZCtyYZTprAyi1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6xIhVSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEx6zoOH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6xIhVSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEx6zoOH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RMcp866858
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QSqXzY7iYH4qUszl6ICHxg1kStF4zLRoxDqBlT9FOs=; b=e6xIhVSGQDNQVgKW
	LwzSwC8o8Y5cpRjWTPhXty6MdtMDkv0wUj17EGqx/gCgvQdDOHUEYX/sqIARPYRr
	rWsOpWZq6xxDOBaBO0DOv4ryd6N4sc+ennxRWTWdu0rf3cvICXe4ZRy+h6feTOzx
	oYvC/VoW/z3Wcn8RvHXz3ObKSW4BiOrkExK2OIsSN/iqgD+FNkIHzmL0bEjJnw4t
	4Tno7E3MCJZaIwnp214VFzDQ9clYgGmnJTM3LGAX+Hqmn/OiLztAroG/EtE5Te7o
	jttn/6xzIhTvqZWiGS0XCZuP0i3fxONS/Wc/qJpobxYlHgJzowQTeC8u06L1HdYI
	luzQ+Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwnex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3954def0191so5434516a91.3
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553496; x=1788158296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QSqXzY7iYH4qUszl6ICHxg1kStF4zLRoxDqBlT9FOs=;
        b=WEx6zoOH1FUu0JZByGHwVVQgcDQvAVhm6+G9yMC7fpoUtNDAmgY1YG42vnYgPXkcvG
         +qWCpY9NjpZzsEiQgcfC08XnECo/RUG+ydl4smm887m1ut2CdG4CwiZ8BON/PKlkAYfn
         SKUHToSawrd3eiPxZLDTr4mMnjp3sjM42DqV2V4s54HU2X6bYy6d5e53PAUMfDG4MmFy
         0o81AdP2IK4sUa2c5VrKLuAQXG9fe21wEOl/s9Qv9bk1AoxLTSovLzuaXIe2G7WcWyw7
         OF59IL/iWfDR07mosgYajnWVz7Lyi1yT7dEGFSHewqfWizPcHUyx1QJPsH3gtA4S5loy
         Il1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553496; x=1788158296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QSqXzY7iYH4qUszl6ICHxg1kStF4zLRoxDqBlT9FOs=;
        b=jeXPBOHuQUBnE02nIIbuEXo2ru9c96SDKu8FMafVdcDjDdkIMWHH0hZO52SMU+6NLA
         C7bhK61cCmPTiqDynmCUxQXw04j/Xa9ViST+iQPWi0f8g1QQPATOgtvrn0191gaL42n5
         16xDUfYFjFfDe4UR03P8OElJgoPRXU3JlyR45lxahIG2jw+2BDkOp4mFkVrtPS1AirjP
         CH6HQL2Hhieswk44MUg4vrmFFtIgO8xHpMZD6GdFCOR61m8/rbYV4DWn4DzOxkLOHwNf
         nWniRVCZte9e+YTAIbnyQWQdUoB4LjrqrPSA7MhA+S/x0Npg0N4kPDgUnuYp4jT/BUmW
         uN6g==
X-Forwarded-Encrypted: i=1; AHgh+RqJum6lO5fzedV5YUQwAUpBybTtHJyz+ncjpelMyw0ZZBTed806sI3A/ft3P+/cbvyOaK/zB8SLv3Dw@vger.kernel.org
X-Gm-Message-State: AFuF++k4jNb4N7/NUcDA7i7TsX2wHQj2fV9Ur2Axl2cae37vUOdgSyJy
	64yJroX4yRmVACZjNPSMVyqD0gbP8MpTwtd+eaxDSM7vQBD3olU8vnk+JEFz/lADjubZrG4+7LV
	Uj2/qRhafe4PU0i4f9ueXWx8hU6BO/sxWSOrkQjAVMDsUO2WJ9GHrFFnfaGgrj3q/MXr5JfZ/
X-Gm-Gg: AR+sD10aaWwznW2q3Y6noNJxCxmhmN2YYvXKcmh8lGysDrtOqv83hU76GiTq1+gyM1c
	dDz0Q5NGV0SKt9kH2NNQfj0LG4U4lSYZbB8c5DvGBPsaVFUfHLNBQMU/fxuMCEakHpE55yYmryv
	O1GtmhcnHBWSsXzFUazUo0ATbeH1T4uA1em0EADTbmB0iTBrtm6hLmwa+r+gU2nHE47SGnQ3FiF
	BskalK1LCs/WUnW6oNOOVBbiUhqQ66s8euT8aAL/H54J5p2Hk+NcsqFGrQl3ajBG4ucOegIVBY3
	kJAtHQyKiL2Oav3BnOxfhRBU2tCjnlUlCFzfZVI0Pbzc0sDJbN6MqI9TkTIDSr5yUVCm7CfuDec
	5Fs5ZpLLfcmkkdWw5on17jZlRKw0XXokqjYbOnW+w/Wu7KRyqe/jCC47cPTWs4QGz5hOrOV9Fbm
	NGNnMvIgZ+VaGVoAwVs+KbWRuR54OeSA==
X-Received: by 2002:a17:90a:da90:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-395c3547daamr47572459a91.7.1787553496451;
        Sun, 23 Aug 2026 23:38:16 -0700 (PDT)
X-Received: by 2002:a17:90a:da90:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-395c3547daamr47572370a91.7.1787553496071;
        Sun, 23 Aug 2026 23:38:16 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm21667830c88.10.2026.08.23.23.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:38:15 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:07:45 +0530
Subject: [PATCH 5/5] phy: qcom: snps-femto-v2: Add IPQ9650 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-phy-v1-5-257d68a3210b@oss.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
In-Reply-To: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: oYfVlblhw0ucGTB-lUK7kgRIxAwlyFhU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX/tIT1ink+6xg
 OLW1jvwhoxJ0g8D+Jd1bQ5GexfrQW7R2hwMoEBDfXfrRzd669iUGTK2qOGUqcbnSynF9FdrMrYh
 PIcHk51xi66ZlZj8m9cwEeb1r3Yyj16h74YUncJMRFvgo5ihDQvxpXMjmfKmDh1UYmv7DpTuiNh
 euoZJy/Danq5QmaK1w4zj3sQ148VGBilicCW984IKkNbJ8T89eSu21StpM3TPkRlkoPuNWBctjC
 8kAi/vPmn2ARKTqsKYnmWRnVkcLTVtBboOnZOjz6KfZyuQRfHLueBdnQ1y0LksqEe77jvza5ZJN
 rHmUXlufpAWjIpL2PHW1NApX7hzNT/qSp6QizIgAilVrLMPBBUMSnXSBlsEJMbbuY6E8TTZuGik
 khK2QcfByeQi4+6wg3xTD/ccEXWKFQ68hULPSVsUoC3+h2MQsMS/qxQFVLXg+N1yjpDY7HT9jCE
 1MpoXT6Pt4UL7iv7Gmw==
X-Proofpoint-GUID: oYfVlblhw0ucGTB-lUK7kgRIxAwlyFhU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX8E1qKaoTs1Tr
 hScMX5ULMB2VwrBFFxOEfIyrKbErp+4D5geH+c0niMi8oo4/becWqOleI2lZdAuBJyUvwD4Vl64
 D0UIihRM+EUaP41/138uMlGqZY4G2Xw=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8be6d9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Q9t0gmS3rCGuRMBXcNQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
on this SoC require a dedicated init sequence and override parameters
before they can be enabled.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 5ffbe1a77dd4..c18171f9464b 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -29,12 +29,15 @@
 
 #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
 #define POR					BIT(1)
+#define ATERESET				BIT(0)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
 #define SIDDQ					BIT(2)
 #define RETENABLEN				BIT(3)
 #define FSEL_MASK				GENMASK(6, 4)
 #define FSEL_DEFAULT				(0x3 << 4)
+#define FSEL_24MHZ				(0x2 << 4)
+#define VATESTENB_MASK				GENMASK(1, 0)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
 #define VBUSVLDEXTSEL0				BIT(4)
@@ -57,6 +60,13 @@
 #define USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X3		(0x78)
 #define PARAM_OVRD_MASK				0xFF
 
+#define USB2_PHY_USB_PHY_HS_PHY_TEST0		0x80
+#define TESTDATAIN_MASK				GENMASK(7, 0)
+
+#define USB2_PHY_USB_PHY_HS_PHY_TEST1		0x84
+#define TESTDATAOUTSEL				BIT(4)
+#define TESTCLK					BIT(6)
+
 #define USB2_PHY_USB_PHY_CFG0			(0x94)
 #define UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
 #define UTMI_PHY_CMN_CTRL_OVERRIDE_EN		BIT(1)
@@ -78,6 +88,9 @@
 
 #define LS_FS_OUTPUT_IMPEDANCE_MASK		GENMASK(3, 0)
 
+#define USB2_PHY_USB_PHY_FSEL_SEL		0xb8
+#define FSEL_SEL				BIT(0)
+
 static const char * const qcom_snps_hsphy_vreg_names[] = {
 	"vdda-pll", "vdda33", "vdda18",
 };
@@ -328,6 +341,17 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
 	{ 1310, 0 },
 };
 
+static const struct override_param_map ipq9650_snps_6nm_phy[] = {
+	{
+		"qcom,pre-emphasis-amplitude-bp",
+		preemphasis_amplitude_sc7280,
+		ARRAY_SIZE(preemphasis_amplitude_sc7280),
+		USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X1,
+		PREEMPHASIS_AMPLITUDE_MASK,
+	},
+	{},
+};
+
 static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{
 		"qcom,hs-disconnect-bp",
@@ -418,6 +442,34 @@ static const struct phy_reg_config hs_5nm_phy_post[] = {
 	{ UINT_MAX, 0, 0 },
 };
 
+static const struct phy_reg_config hs_6nm_phy_pre[] = {
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CTRL_OVERRIDE_EN },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
+	{ USB2_PHY_USB_PHY_FSEL_SEL, FSEL_SEL, FSEL_SEL },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
+	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
+	{ UINT_MAX, 0, 0 },
+};
+
+static const struct phy_reg_config hs_6nm_phy_post[] = {
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2, VREGBYPASS, VREGBYPASS },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, ATERESET, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST1, TESTDATAOUTSEL, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST1, TESTCLK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, VATESTENB_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST0, TESTDATAIN_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0 },
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
+	{ UINT_MAX, 0, 0 },
+};
+
 static int qcom_snps_hsphy_init(struct phy *phy)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
@@ -505,6 +557,12 @@ static const struct phy_config_data hs_5nm_phy = {
 	.post = hs_5nm_phy_post,
 };
 
+static const struct phy_config_data hs_6nm_phy = {
+	.pre = hs_6nm_phy_pre,
+	.override = ipq9650_snps_6nm_phy,
+	.post = hs_6nm_phy_post,
+};
+
 static const struct phy_config_data hs_7nm_phy = {
 	.pre = hs_5nm_phy_pre,
 	.override = sc7280_snps_7nm_phy,
@@ -520,6 +578,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
 		.compatible	= "qcom,usb-snps-hs-5nm-phy",
 		.data		= &hs_5nm_phy,
 	},
+	{
+		.compatible	= "qcom,usb-snps-hs-6nm-phy",
+		.data		= &hs_6nm_phy,
+	},
 	{
 		.compatible	= "qcom,usb-snps-hs-7nm-phy",
 		.data		= &hs_7nm_phy,

-- 
2.34.1

