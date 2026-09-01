Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22303469E7
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242699; cv=none; b=uwCe6Ir52e5m0JAH8bT+eAEMSTRblHmZY4fMc+UUE7XD4/s5MTVJ8Na5sajwtEg9g7KhBuw/2D4b/SZ5XCJH0gXKMPu9Afb9ndGWS6b2xq4SPzmu5SSB6YZ/QVTeux9LGg/c8p8biPLGBbKYxwgPNoGIKu89tfTR+Z6o1oOrPl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242699; c=relaxed/simple;
	bh=mFZMa7AsDuWFLglUJnP+YjUZySr/vnuKz/pWC+d41b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MI7PkCOrXQ0Ep8UFSd0KKw9rFal9H4LE/55UxnXaoHTuIz7ctkDea8UsIOnSPdXGYacTfCNjxRAH/PfzJI7EEugJ6xkeM+AAwNgfEbUmWKASqlvu5MfMX5/R9U/LSF65xt89aDVzAXB1bXj/rd0BTGXmIxt6HJQkCKyaaBxdLck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqiwdgZf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P0/tuaKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqiwdgZf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0/tuaKL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6811pvOi585050
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 06:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/aKERj8vOTgNopINdWRvI+TeRfCoisGCiNjo8nkQDqg=; b=iqiwdgZf0O6crz4F
	m97BV0P7J+c/wJi4egm82M4kGAXKDq6kwUzs/Nywifi3VcrUts+yfcaxBw27+cua
	ifThpnAl1uCxHMVhqLzEzoshMVeGgvn93r0igYqJUmj4IRzG6CNz8bvfaoqngEmS
	elYzKPcdW5XIMAcNwrtxp7kV+mSgLYzl03vwHyUC8yFGghYkYJLwthmoJZi4+j3q
	YQQj7peMhWrZ0bfJYcjBh+3kWQUWaBEFwUhbUFmMBL9Dq1uKnedUY8XNoRQ2wzbx
	ly4XIyjAcSwdj5goO2BNPPrZrzrAN6ARlHUzImcV+nb4hRF8hm3Xuu3t1ILc7zD8
	c8xFWg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx8ung-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:04:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d63bad3d09so71809925ad.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788242695; x=1788847495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aKERj8vOTgNopINdWRvI+TeRfCoisGCiNjo8nkQDqg=;
        b=P0/tuaKLJ0H6EjfC3KCzksfUoqs2oNPO4t8TQBd1idDEA1ussqwTR1t/KclCEk7+hp
         cfT+Nr/gEYuhmyB5taw6hlirdSEG8YmXAAf2W+9p1xOvhw3yhJE9lYKu3/J+voH3VgmE
         1FLTEQ7hqfBaWLJmR44wiLlpcF9bP/JjkDCKqhuFLcj3ykd+5oAtr1mIOKRUsZUBxQru
         jBwUW2H5pmpZU1Z+W6dV+eKJI8LV+yDAesFoRaKNACRrlRFmrQhcdLjRMxtfn7eZg+C2
         7AZHPjA0kCfdwU7UtvEEt2wsVGFGxyylW9sdEhQK+JOpwFpRNgFlRv/nd6ottF7NaiHc
         WeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788242695; x=1788847495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aKERj8vOTgNopINdWRvI+TeRfCoisGCiNjo8nkQDqg=;
        b=p9EzMMzdnrl9P5r44b5+xBQVwJib0HIckDNkVJOhVFpSm8MV/p9fzIma+cFN7qBRFW
         QAB7LdikQwbEWQLW9VqgSYXJ7MwpiHcl3iebTg3Ntl8e4XyCUbhI6X5caaIvhmJfS8Fm
         WqiTDDd4A66Fd05vISoWr6dJBL/OilJ1ZUOpA1pgq14C2O+ljO1EfoeX/VBfI6hqI62g
         YblPh5xIlOhYS1tXDZ5YYrE+LuUZyT3GLiTldukslQKxhfHClr06HPaCT4BOYiNkNxhs
         TO0aMab1EEZOtIPqCMZLmOAqg1Ygz641e3bUPTSYM9Ak6iApLGAxTyovlEcabOVP6GD6
         4cPg==
X-Forwarded-Encrypted: i=1; AHgh+RoWK8BXzHZX62+lk52/Tb49iFXikjjq+FbxrNfWhyF2J2pAMVY2bqhF9FoWppKPEUoEegcyrC2He59i@vger.kernel.org
X-Gm-Message-State: AFuF++mmEtRmpUKScAJPgnOFzPHGmY98gfVig1g7y0fHK+nXnC5o/yBU
	spaxlqi8go1VWegZ3NSRodsgladFv78fS5MpfrhUfvE+DwpJLxO/tqOBSvqqiyBxBZPvOUrxhis
	CnPTpd12IICvmuX7pL5BK9Xuiit3y9p+m+qlGf//0qqMlOK7WtNBSvl+yItCjJxml
X-Gm-Gg: AYBFou0lov1am5JT/0SUcGAegare9BbN1XqYm/D1qJcRXGbsLdy/GAeAXJTaR/m8I2b
	mmW94KfG1ChxYU3q6emCfgs0dLusGHpFd3DD6lTnU8ZKjyL7Bro8a075sJSoi5CsbMrAH5ZK3TP
	zJT/rPr5VMpkLE1JX8MCS6WMMNc8v4lbEmOybf6lmY81z949dS2hRuL+QKiUvjfqQkdn1WI/GfC
	KZhINJghoHVhCHog4iqZAjcpYYuzrv+Sxlfe7fR0HxixJdDP9qgeFlqZrIi3ndacrr0rXOFUGs5
	HP0PKoRBlGNhFoY0pHQfPSBY04SclMvHaosXoRTIicHiJJ6S7Sx20KCAm+8pirwIwoFCZRHXRyJ
	BRxYQBBAKfaRWq5JxZWunl+CAd3XmcgshyH8nmlhWSTvGs5VLuMhAWxqAY5NAvGr98qTBJEdWHn
	F0yaqKQmaPRhk00VdCly9A0SID1gASeg==
X-Received: by 2002:a17:903:6cc:b0:2d8:d4d3:3fbf with SMTP id d9443c01a7336-2d8d4d34099mr240191715ad.19.1788242695015;
        Mon, 31 Aug 2026 23:04:55 -0700 (PDT)
X-Received: by 2002:a17:903:6cc:b0:2d8:d4d3:3fbf with SMTP id d9443c01a7336-2d8d4d34099mr240191345ad.19.1788242694535;
        Mon, 31 Aug 2026 23:04:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm35855800eec.28.2026.08.31.23.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:04:53 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:34:22 +0530
Subject: [PATCH v2 4/5] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-phy-v2-4-cc93d2f3b1bf@oss.qualcomm.com>
References: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
In-Reply-To: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
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
X-Proofpoint-GUID: Ttk2K6nvrzf9NR-xKOgjxPL4mgScIix6
X-Proofpoint-ORIG-GUID: Ttk2K6nvrzf9NR-xKOgjxPL4mgScIix6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX86REyyPzEY5N
 c++675FLSZqmbJqCKtFBaUnmKK+XB3uO5FQNjzilcVeB7AlYoXGPc3QGiDOsEuxJAJYrXxD57EF
 ETKOGgmkWVDGFGSwkhwZ9ka59nyB+5Q=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a966b08 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dpbSYRCFOxhwq305YcMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX3T91vupR3Kvb
 q0zYaDZRaJ8AjUzMVGYO2AV6wzZ2MfD7RB78HqjnG8NWnQ+5Uw71bAV3SqGjA/PVGHOUF/Av7r5
 l624P9QmV3AE+H8RlOZKv9Lvo6IH5qnqwySlh0lgiw/K026eR5OWF2QU2NqXOkZbVBDu0rmMmJ1
 F/qzW3vMVdPuIgc8056ad+Ax0VuAtsduXvLC908WvRw0q+wPjFsxp/qsnDKorETP6bbWWKuU6Cn
 +s0rex1IuRwXNAbS0MJSVqkobkTQLPwAipnBVB2uABEvQtzoJMFMfuociX/b9gCOzLcJGmeZMwp
 ZoVq1Zry69x5459Y5UyZ6MKA0P2fmskcwRARL7Yh5Nxstmcc4rlCmCWSa7Xvx/vtxkSOlsPMmRc
 wMrIdBFGdIuQrCawq1RFWCdbS/NHwK0rhA3Et35FGataUSZGMjlDASr2DnQAujiXDnUk64kgpxn
 2zzlBkSG3BgcTwZBwYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010052

The driver currently programs the common PHY register sequence directly in
qcom_snps_hsphy_init(), with the fixed register writes split around the
override parameter handling. This makes it hard to support SoCs that need a
different sequence or different values.

Move the fixed pre- and post-override register programming into per-
compatible configuration tables, and keep the 7 nm override parameters in
the same match-data structure. This allows the driver to share the common
sequence while adding SoC-specific sequences for future platforms such as
IPQ9650.

Additionally, address the register bit field mask & value mixup for
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 126 ++++++++++++++++----------
 1 file changed, 79 insertions(+), 47 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..b6bbf2b570c7 100644
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
@@ -193,7 +207,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 		usleep_range(500, 1000);
 		qcom_snps_hsphy_write_mask(hsphy->base,
 					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					   0, USB2_AUTO_RESUME);
+					   USB2_AUTO_RESUME, 0);
 	}
 
 	return 0;
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
-					REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK);
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

