Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E53E7150
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553495; cv=none; b=R4v8zrR3C7tDhscoChHt74rRl8P5r0bV0IWZnh3cGc0QrQT1EJasBF0E6MBWerW7wRWgjY4hi9lNVyteV2Fg7bbT3jDNX7xBUOSGZyvNw74IUINBYrxcTuhPLSkQIq0qYxgODuIsaqRfzinmQ0wM/NsaBGGj5lRbVZfyJjP/NsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553495; c=relaxed/simple;
	bh=L0vnCBTmPvqpIkpiyjEuBmefV/9Jo/wEG9c/8fwzJpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kSF9ESt2b9zRjyXfgiMyCCdbZDCZt0/5n76/vkAv7CYSZjTPr6lIVKJTNiETlGLhDHhZUNjZpYYxoMNqsJ68egAiT42VHdyolYFy9mNQLtXYYHEsjUyf4jx6/o5MCeGa8O2L4g26U1LHKV7hkys8CK2DK9cAVt/K2/gxFygaj+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fnGmr/iP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emsBzk+M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fnGmr/iP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emsBzk+M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RTRP1577437
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZRCHHBEdUWnMJpJqD0Wd8t5U5pocYPVr4t8Dbz9/+Y=; b=fnGmr/iPXcfLfOjZ
	HLoMiTAW5qrP7RkCurUEQeKuvC5LtJBKfyNDlS8p7ilKYAGpi5y+7y6HfHQOSSNf
	xWrjT2LjFMdS18ojj/xz/eyujArmK9BMtdCSmlZXUA9W4yc2aRgnqCZhHgW/qv8/
	1CnzRAkWJzxK1tgNmnV5/P92MKeMmMgCB9JTiGsyGmCyJuXXVu/LCgSLd1g3Shby
	9QyYG33cNJQQLXXfLyP/F3LolSzOW7aKT1dDNmqw0SeJiSCeHC3ZLuVtIkP0w5ny
	vZxyo66bwxD3TsSgrQsJdyTHCrCe5NkTxHxjK0mtYB4O5z6sRAv3+NQPgWceyaVR
	sQ+eyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74hcwhwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so3829643a91.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553492; x=1788158292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZRCHHBEdUWnMJpJqD0Wd8t5U5pocYPVr4t8Dbz9/+Y=;
        b=emsBzk+M3XUU64hI7bliiTsdrEAV6m7S1g3RrC1hsKCnBS5nJ1Utvwcjyr9Z+NmGJ9
         5IHcDESzSxfuQenNqNblvx85OPdO0U5WzE3jmJ29QMjf5yXb5Ix0pIq8ExwDjWCfoSg+
         JITtoCtthQDrrpOXbEwqN8bdEpa1nUBr7C0QzuVo4KFPgU8LDLH/DjVTytJ/URwdNMql
         jqtWRp1YDrx0NqMT8Z0Ea4hYjI9WKo+9eify3RROYp0HhsrL70KKdW8MxhmRlEIXSiav
         WDoC89aMG0/ux2QwxO1RCi8LP8l6lYQuN9Pj5cW8J65EdRsREQR8OqAQpyGgvrgf8nDJ
         dIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553492; x=1788158292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZRCHHBEdUWnMJpJqD0Wd8t5U5pocYPVr4t8Dbz9/+Y=;
        b=HI4XrNxknmZb8K/FzNM6ZP19Ffa1PytZqD2rgEZr1ppen+Y5w4Ptzu5jLThvVfwXcL
         BvOOCOjSYJM7kyYedlxrb0rvLrII9QhZ6YgwXXH7j3b/TsbsMmZowrsFPYXQowfKzhpS
         HBzWwKX/6IFhuhIBYn4PRWwSH2NVg9eJNMmRWM2mbPPV+U+dK6nr+kJ7qucMpp79oAy3
         mlOkbOsAS0xp82W51sv80/ZpZTyjD9PkRdO5WIaPfvD7QZ25zP7eKiDI4pYmyR8pMZib
         hMLxa50DKczwBii7ExKzafjrbCc2ukFEP4ovQ5bAAnbRipqtgrbINiS5wLuJjgi2Z/Mq
         9zMg==
X-Forwarded-Encrypted: i=1; AHgh+RqFuaA2AitNNQIJlxIvHnQ/MPqI0iQsczYDlhU/ihOSYsWGL9m6JCXNOB4jJ0h7slW/NEtenjA+XSIC@vger.kernel.org
X-Gm-Message-State: AFuF++lG3Qwe3IGLFi0y3NnqRcBmTzzvRKjPRW8GU+9CbPH7k1mxaqn2
	ns8fnEjXPBPwT01gELuTcNpUCzdNEgevdqOJVK4C9TQbrL1lcHoCfabtkeQ4BExd2zvyJg0gniI
	T4KHBWzoce9wIDW+vkYH4UTDzxX+8j3lK7b9/0hEQgsmUh66Q75OUY+Vdu3K8x1t/mAH5KLlp
X-Gm-Gg: AR+sD10SPUIoxmLm8ZMmgeoFtYvDaEB+zZXT4WHWbLuIBWN5+OIRso/cUbf/oChp7/f
	wCdATGGHaV85dKyYebZx2VtlNWn48TSx951ICKdnWEt6L6gH/9FCyb+NI/2P2Jt1MgIJL9mlI2s
	OXvGF6SmbFveqvVyMoXzXF3KVxVJVIbceypoG5SUn0N9iGn2wZhuUELKNjYhcl2SiV7hxLk5EdP
	dEYYmfYVGTDgZcRIw5G4UzPy8SFuhKdD4SkZr8uKCqVbMgtuscXRjRiiVHc/vOYJp8IZTeSsitg
	CceZgKRgwJ6T5YLtyCDKhQxaqlwG9nC8J6RT7ujP4fZMUMeEFD6nkjlUrUqQ+s6+EDX1hYeTYoH
	yjCvGHhiCyg0NBb8tGOiBgrgEo1vfKc1Htinvh8KRzQJZ/IO+xsicqrfTSgT13iwSHKlogtriWb
	lVh9wh1zhOHgVj33KZ+DfICIHl/905LA==
X-Received: by 2002:a17:90b:4c49:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-395c354d42dmr41460370a91.1.1787553492107;
        Sun, 23 Aug 2026 23:38:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4c49:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-395c354d42dmr41460287a91.1.1787553491596;
        Sun, 23 Aug 2026 23:38:11 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm21667830c88.10.2026.08.23.23.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:38:11 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:07:44 +0530
Subject: [PATCH 4/5] phy: qcom: snps-femto-v2: Move PHY init registers to
 config tables
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: sIzEPm1wedO7xYLuN3JHj3SAVIpjz_0j
X-Authority-Analysis: v=2.4 cv=U7iiy+ru c=1 sm=1 tr=0 ts=6a8be6d4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zXcBnA3yxj2v5e4wiOoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: sIzEPm1wedO7xYLuN3JHj3SAVIpjz_0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXwCpGQFtdiX17
 gcY1wOGMf7WwxKWZ74IrUW86UsiJEskXE7Vw5PXt0I4zYFYJttks9M2vDRQptgnTQUQ0302N+RC
 K0/umq8gYFqXZ5ympCfk/3kMyVI3JTO/zijWvZ9RIPmrzrm8yMRfMtixgUdysPFziTwjudxjjgE
 AI8u/Ew9yE4QBxiqpbzi9u+TWRWLJoHxgdSnr4pFLwUYAbWQWUFsVfRr5jn8NWKI/Sh0g1DoTeW
 RkdG5+XTnCQyzysdV1+hvJ3s8Chgb5QL1neNgCCE9tlvjFU/m0OuUTjz5Eq018j9fXvp4I0E8L1
 FLERUbmXcXVUk1AYgCcjZ65IcSa4s0Y4Vi8zZXq+YSusz1LHePQlee0er2dPgW/8GmUx7ysV/Gc
 TKVjXq9vICviKYZzDHKeDr+2JTijb9EqEGm/JTFf2ngvPWtavegUhQFboZyCfnQCgSyaTkFON9n
 iYRuPPML1dAIowJk8rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX9QMI5m/+jBMJ
 Gtasd1haff//NEDy8qsF2H9EzPa52RPOuR7AuDZAjFwccY1br0NMachthWx74VOSsDQaaTbVyUC
 Wh1bhTsYuvdLWMqv6RYj19zJM4QilQY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

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
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 120 ++++++++++++++++----------
 1 file changed, 74 insertions(+), 46 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..5ffbe1a77dd4 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -104,6 +104,18 @@ struct phy_override_seq {
 	u8	mask;
 };
 
+struct phy_reg_config {
+	u32 offset;
+	u32 mask;
+	u32 val;
+};
+
+struct phy_config_data {
+	const struct phy_reg_config *pre;
+	const struct override_param_map *override;
+	const struct phy_reg_config *post;
+};
+
 #define NUM_HSPHY_TUNING_PARAMS	(9)
 
 /**
@@ -383,13 +395,42 @@ static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{},
 };
 
+static const struct phy_reg_config hs_5nm_phy_pre[] = {
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CTRL_OVERRIDE_EN },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
+	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
+	{ UINT_MAX, 0, 0 },
+};
+
+static const struct phy_reg_config hs_5nm_phy_post[] = {
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2, VREGBYPASS, VREGBYPASS },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ, 0 },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0 },
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
+	{ UINT_MAX, 0, 0 },
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
+	for (tmp = data->pre; tmp->offset != UINT_MAX; tmp++)
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
+	for (tmp = data->post; tmp->offset != UINT_MAX; tmp++)
+		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);
 
 	hsphy->phy_initialized = true;
 
@@ -495,14 +500,34 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_config_data hs_5nm_phy = {
+	.pre = hs_5nm_phy_pre,
+	.post = hs_5nm_phy_post,
+};
+
+static const struct phy_config_data hs_7nm_phy = {
+	.pre = hs_5nm_phy_pre,
+	.override = sc7280_snps_7nm_phy,
+	.post = hs_5nm_phy_post,
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
@@ -541,11 +566,14 @@ static void qcom_snps_hsphy_read_override_param_seq(struct device *dev)
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

