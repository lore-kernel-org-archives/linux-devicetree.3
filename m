Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEF13603C0
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 06:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182241; cv=none; b=qJBcPk87x7HmaLlhcD6suMtka9vril7LXLf/lwMiQCF8mHPNGDrBeZpDMR5K/dWGSxfknbtIGEWKY7631aM9a0RhtbR9fxBSqJtAoFe+tYo7e84WwSY6ZyfTn/oMjSVCBQltOo8ReR3gNEr0gbGoo22tQBxgKZ02+eR5xqm1Wqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182241; c=relaxed/simple;
	bh=wzFi9MZJ5A99oR/X/i+IfEJjuusQpSNQgHrl6OIPNkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rc3ct3gze+p39ryqdiZPbTxPGDwm5n71vpD70cTY0bMd1OLKioO+IZe4m+1DXoGduw7J0AWlbTtabylAmgUZprp2B2emjIeOC3SFYl8VHCfu8zaffmeexxzJ+pmkLyLCGie0Eb40Qxxr923BSX8wuMvpmb2HQKYpDcmqnm8XJXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cg866J6j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ice0dno3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cg866J6j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ice0dno3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6950xvrn470376
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 06:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/SOAsjHe5hqYBGWh3miLF3wtWExjjsETAua60XmAxE=; b=cg866J6jCHzHjEMV
	YdRoIpFhMl75ggy7IfkjC7OY4JIB9hTlUuwdqbcGrvqThcia6CyzmmjZ0owQZjuQ
	b10cTFneV2OsPJQs8cUoVjon/5lZnuj0UkTel/kIEPL+qHpoH/ENcvO828N2+jBt
	0Nc67lXTlnYrll1/DjSsYvRrwcI0hhcfdw7IzH4v1A744JVXdrrxVKFlDRphgk71
	26dlU8FXNgjswx4ioEfjbFDQUsyak+lx+afdCCY3pt5DAUdmLsZenF7pfBwx2IBJ
	G/TrLvWF9Berl7ff8kzhVDAVM8pedoTQzF+K74WgnVviD58JtI9xWOPDuoGHQbEH
	s2aGIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssucrpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 06:37:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313d1015161so4501576eec.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 23:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182237; x=1791787037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/SOAsjHe5hqYBGWh3miLF3wtWExjjsETAua60XmAxE=;
        b=Ice0dno3T9UBR4GTFKniZteK5TxLBQ3D5ul1YOrRozz0HskWzO7IpvwxPPvkpxDmTd
         qevQWXEwIHqcR1sjsEg8P/XlOugWSgZ+ffzT1LIyLYfg+/q00JJIOUvTOuAcAk/HuPfw
         e56O5uiWLZswocSfFkgFxiGbtT8OgbDAZ4cQxxnOLu20TdP6D73n4Hfq1Ac71/BSL/at
         IdDONLE/oKov49vwWdMT8XTGxsNbkmOy45BldhZvmeqaIxGKjKA/Qbt4Q34C3eUxiioy
         /r1eN4ZfByZ1ehdi5zSC6mOij4SDIl6+chJ61ymx6fV5rBlMTAgf6uqLEA4Pb6H8RJdL
         bS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182237; x=1791787037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/SOAsjHe5hqYBGWh3miLF3wtWExjjsETAua60XmAxE=;
        b=VsaxQmD2t57hLiROiMSGh+QHnVjdpEfwkHG8VstZIkBPXKkquzSU7L9YrL0e/PBJrZ
         n1QozV7RDjeJVvU9IBkVk0nQ1J1oLaPHH8RK6Dxefan2fs6q2040ZCNj/KRBGoRQ+Svj
         ENKk3auiJIcOEdc9s/utcyrhQmmrEzskp4B75E0ybj2mWRaCU6/fHWg06tRsFGnbn+KU
         zotuyGAq0aYweM5bOphGpAuP9Q/5sQ6vB2WasOQo2e1veEIDmPBMlroewYhl34LKt3se
         RwNzmMDrbLw7Ys6C5pMsYOcJuxcPl7bvJdo/jAXpag4R9qe1BQZiBdTwePQ3BhJE+N+d
         m1PA==
X-Forwarded-Encrypted: i=1; AKwUvBwQ5FxJBE1hTKgWgcZsLa4z4YdabyJQceKGbPNF1oDBcHx4I0RhQqBfa5mkFAWVHziafRN+X3CNUtGk@vger.kernel.org
X-Gm-Message-State: AFq9FYJj6hvMXTj3OPbvnJJzRjfeqfnkG2KftG0LZKHVuvUsa8bkvZdc
	RQPU6zuxsfgCG8KDdZYrsrIZz4OY0faGmcXMx/kcRmxeIQjJCH+VUDCPuTl9NUNhto5BXnHuzR5
	SmZinJnQzLrwWF39Q7CfVgzL8zS0K+sB3oaZcxjrjB9TQRlJbEsSpE4xf44WwGGtW
X-Gm-Gg: AYBFou3YvzEuFAsW3gWRjn2D3NSOU+FQSnqiuEpdAuZPWEnkP8l/5ChUjpSHtySnrBd
	Rjf9rC+JbI3glyuppwWymfvKtw2TWgsQadRH1P7/5h+so9wJiJWL5WTqwTJ1l0beqEhpScLsfMY
	I6hYs6+GH1cmVVAD/uiZIC9B9FXuHK5ohP0ZRLjwxPW+EmCWL+5gpEwzOS8gIWiDxfZwGFoWVSL
	3aVDo/iPj7TGmZN+dn8urVw0slejfC7ILwazV61U22ElGCu6ctdp2l1zBbiVW+ztiHWZtLtMwF2
	6PP23jY79y/mRnKKGhfCterZ6raYzcqjVXhP064aXOpZrWdSlZQD1cxUWCjN6bTx7Ip39Gc+d8J
	R4z4+sCOM+X34ho1NzkBbMptzPSWf3C6ONPHu3ZxNZtaySJcEW5sDlNX/1LJtPjfm8zpEOrnYwi
	EDtrTZv3xrFmleHGd8tCxVZotnap0X
X-Received: by 2002:a05:7301:c005:b0:347:8d01:164f with SMTP id 5a478bee46e88-34f150a378amr12982995eec.19.1791182236906;
        Sun, 04 Oct 2026 23:37:16 -0700 (PDT)
X-Received: by 2002:a05:7301:c005:b0:347:8d01:164f with SMTP id 5a478bee46e88-34f150a378amr12982971eec.19.1791182236364;
        Sun, 04 Oct 2026 23:37:16 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:37:16 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:06:30 +0530
Subject: [PATCH v4 5/6] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-phy-v4-5-b04c4123ecb3@oss.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
In-Reply-To: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX28xUvcVdbZ/f
 IU3ZLPTBjhsTvONbBSdFJgZtO4RQiS4zSW7YwFGBxMFsMqmz60B5K7bxjyDh/G3BSUZHk/5Dj4F
 vVj07dBXdkFXunj6Jc21Nl2/0dEk58I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX1zkWMFhHIY6o
 mszlm3KbTfUVqKod8Ha6z1kVCpzfjat/GZLFfRAvRFgWdjCXcYMHL2HZws8P4q+hw8NMaNfsltG
 gFOi0cjPVcvUNALWnjVKsjeLidtjbhkFDBQikSbSU0NUjZzo2M6XYYrmgcIF1IS3atLEWlY8+rY
 9NKVCDd7MnZ75PnT2wDuqzpLILSSGs9lPOFnuBJqrhnRA6rBxL9chUxF5rgjO2jgeynmNC1MyL3
 Czr8UVNJYXwKC1luEwm4rc2khmFAbI2KG76kHmb7Kq8ZjBfgujTj/o0cEpYcji7tjVhGk/fb2bt
 r1MxwhfrMLzztJNzAmgTu8L1wLOPLFAgmFop9NFAQlYOH5N+34WnQtoDWVJEYBRoCHX2XVca0UI
 +MWlF2W8SKFDHtdYcYFC0Hn7GUP4PptP+Aq7WbQF1M87i+ZA7oVnUNi4eBYyXmpe9xk1GSceJAp
 K3Mv6zadpVF6k+LSKIg==
X-Proofpoint-GUID: c8Dt0qnbCiyFJSF0oh4TWXYaI5ym2GzB
X-Proofpoint-ORIG-GUID: c8Dt0qnbCiyFJSF0oh4TWXYaI5ym2GzB
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac3459d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dpbSYRCFOxhwq305YcMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

The driver currently programs the common PHY register sequence directly in
qcom_snps_hsphy_init(), with the fixed register writes split around the
override parameter handling. This makes it hard to support SoCs that need a
different sequence or different values.

Move the fixed pre- and post-override register programming into per-
compatible configuration tables, and keep the 7 nm override parameters in
the same match-data structure. This allows the driver to share the common
sequence while adding SoC-specific sequences for future platforms such as
IPQ9650.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 124 ++++++++++++++++----------
 1 file changed, 78 insertions(+), 46 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 0ead37c0dcfd..b6bbf2b570c7 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -104,6 +104,20 @@ struct phy_override_seq {
 	u8	mask;
 };
 
+struct phy_reg_config {
+	u32 offset;
+	u32 mask;
+	u32 val;
+};
+
+struct phy_config_data {
+	const struct phy_reg_config *pre_tuning;
+	const struct override_param_map *override;
+	const struct phy_reg_config *post_tuning;
+	const u32 num_pre_tuning;
+	const u32 num_post_tuning;
+};
+
 #define NUM_HSPHY_TUNING_PARAMS	(9)
 
 /**
@@ -383,13 +397,40 @@ static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{},
 };
 
+static const struct phy_reg_config hs_5nm_phy_pre_tuning[] = {
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CTRL_OVERRIDE_EN },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
+	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
+};
+
+static const struct phy_reg_config hs_5nm_phy_post_tuning[] = {
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2, VREGBYPASS, VREGBYPASS },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ, 0 },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0 },
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
+};
+
 static int qcom_snps_hsphy_init(struct phy *phy)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+	const struct phy_config_data *data;
+	const struct phy_reg_config *tmp;
 	int ret, i;
 
 	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
 
+	data = of_device_get_match_data(hsphy->dev);
+	if (!data)
+		return -ENODEV;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	if (ret)
 		return ret;
@@ -414,24 +455,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 		goto disable_clks;
 	}
 
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
-					UTMI_PHY_CMN_CTRL_OVERRIDE_EN,
-					UTMI_PHY_CMN_CTRL_OVERRIDE_EN);
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL5,
-							POR, POR);
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0,
-					FSEL_MASK, 0);
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
-					PLLBTUNE, PLLBTUNE);
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_CTRL,
-					REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT);
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
-					VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL1,
-					VBUSVLDEXT0, VBUSVLDEXT0);
+	for (tmp = data->pre_tuning, i = 0; i < data->num_pre_tuning; i++, tmp++)
+		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);
 
 	for (i = 0; i < ARRAY_SIZE(hsphy->update_seq_cfg); i++) {
 		if (hsphy->update_seq_cfg[i].need_update)
@@ -441,28 +466,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					hsphy->update_seq_cfg[i].value);
 	}
 
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2,
-					VREGBYPASS, VREGBYPASS);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
-					USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL0,
-					SLEEPM, SLEEPM);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0,
-				   SIDDQ, 0);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL5,
-					POR, 0);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					USB2_SUSPEND_N_SEL, 0);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
-					UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
+	for (tmp = data->post_tuning, i = 0; i < data->num_post_tuning; i++, tmp++)
+		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);
 
 	hsphy->phy_initialized = true;
 
@@ -495,14 +500,38 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_config_data hs_5nm_phy = {
+	.pre_tuning = hs_5nm_phy_pre_tuning,
+	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
+	.post_tuning = hs_5nm_phy_post_tuning,
+	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
+};
+
+static const struct phy_config_data hs_7nm_phy = {
+	.pre_tuning = hs_5nm_phy_pre_tuning,
+	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
+	.override = sc7280_snps_7nm_phy,
+	.post_tuning = hs_5nm_phy_post_tuning,
+	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
+};
+
 static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
-	{ .compatible	= "qcom,sm8150-usb-hs-phy", },
-	{ .compatible	= "qcom,usb-snps-hs-5nm-phy", },
+	{
+		.compatible	= "qcom,sm8150-usb-hs-phy",
+		.data		= &hs_5nm_phy,
+	},
+	{
+		.compatible	= "qcom,usb-snps-hs-5nm-phy",
+		.data		= &hs_5nm_phy,
+	},
 	{
 		.compatible	= "qcom,usb-snps-hs-7nm-phy",
-		.data		= &sc7280_snps_7nm_phy,
+		.data		= &hs_7nm_phy,
+	},
+	{
+		.compatible	= "qcom,usb-snps-femto-v2-phy",
+		.data		= &hs_5nm_phy,
 	},
-	{ .compatible	= "qcom,usb-snps-femto-v2-phy",	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
@@ -541,11 +570,14 @@ static void qcom_snps_hsphy_read_override_param_seq(struct device *dev)
 	s32 val;
 	int ret, i;
 	struct qcom_snps_hsphy *hsphy;
-	const struct override_param_map *cfg = of_device_get_match_data(dev);
+	const struct phy_config_data *data = of_device_get_match_data(dev);
+	const struct override_param_map *cfg;
 
-	if (!cfg)
+	if (!data || !data->override)
 		return;
 
+	cfg = data->override;
+
 	hsphy = dev_get_drvdata(dev);
 
 	for (i = 0; cfg[i].prop_name != NULL; i++) {

-- 
2.34.1

