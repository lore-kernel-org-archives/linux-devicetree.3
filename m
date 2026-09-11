Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14019491597
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141176; cv=none; b=qD0gztEikkxMConH+hEgBs83YmskWpIRwJRCL4T/Sbqhx8nMqSTRoCGZJZ0i07hnL8l/EzwtvPrLd+lb4n0rw2BnfWay8xmZchaEa6FYlxc/9zNRFvbnBJtflQ2hvmnT1PooANJfbK/XXDSi6zC2DROGKM2rfQ5P2GWJlOwB4Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141176; c=relaxed/simple;
	bh=hBAp1dVu5M6vm8WuSFnCHF/KDmeJiDE4MkZMq/vkO0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUwHu8dIdtB60xOpVITAkXXWLkCEWeE3r+xxWhZjraxL9b67e8zUDrP2dFByqKuuNCitzfxJ3pG632729yyhg2zQ5G/RlM9sg+WX0lz6FP6Or54kZpFeJw7gqNE/cxLB0N6/9zSkYGOL0KupIYofdQSx9GLVmHVq8tUw2Y0/bRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+EEQtfa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5ST1Vj+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+EEQtfa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5ST1Vj+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm3361371197
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsOL6A/XqlNEcKVc6fhAS5j/vIAUWo9Ol5uSSyj0hsA=; b=H+EEQtfarwqUIvmS
	Vy7Qi9Oeyq1ghH/qfUBnTvbZ/YgZiRSHfnyUNLpzAYuebisbueA2OTDIkfRfO7Wc
	OYPv2BYVpt7SPEEYoxgCiQwHEHTDsGZ+dQb2f7ohn655GiKLfhWo9tByi8fLWvKp
	fjBqFxvO1EexVxrYvW1BI3zUOzsf9I6ZQJyB81FLGj6sh9BncLCCUW4ZZWk/5En9
	H/1QLCPjBUQB8hPHSIHwwYHB9pFveTyUIWzla1rBHL7gUTh+IqCzOVZQQSyx5nmB
	4cg+DJF5OLCJrFhW4WWmrpHl5Iy/jRSS7pIgx5Miuk68c/e172oJ0W2eXyw8W+vG
	IPPEiQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8jj5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:27 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-469debb527fso931988fac.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141166; x=1789745966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsOL6A/XqlNEcKVc6fhAS5j/vIAUWo9Ol5uSSyj0hsA=;
        b=P5ST1Vj+Wql3txLAmkoV7ISU575xe1vJiK162aaLonYSKvOVY/jm9HExpQ83Lcj7v4
         shXQcm22U3qslxWzC1czUJwV2O+7kYWKyOf4IbK8wjjEJdsmzU0cwNhSNmgwim0z6Vic
         8MnOY1K+DJMggEt1nCHO3CROKvHlvLDbianpPe+pLv8tMRFgPQdBMa1SBHBD404QuHq3
         jkpHSgx2KQHzksCcDCc8oy0yjrrrVp+peeou7RPK/zaaaZ0r2tDrIVlPGOFGpfz4SSLj
         TIDXj1QJ34GHWk62rAs4sl64ZpeyuUkO552axB8ENvlRV4VoYSbzVaB9ldzW+QtYMCTT
         U1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141166; x=1789745966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsOL6A/XqlNEcKVc6fhAS5j/vIAUWo9Ol5uSSyj0hsA=;
        b=J/MzlBdg2mDXcVtrAu8hfqUXfr3khPWQXgH38XPtHUl3+bLoPvREaC/WMQ3djyizyY
         SOCylvOoxMC7IyYDYlMfM9tg+V7nf2PKrd5GaHLrwra1jUPQyZzyVdVCvaI4mQA0XjYw
         pG/V+4aOJ+oXfENteCFxBoS7eFvKe2dDpJbu+DLX1j+AhQzVcXJJPyEsFbMOZXnXxXK5
         C7YJuH2MDXxCa7dl0C2Ehl82o+AFEklwea3KsoqtiYGb8j/ZzOSVFWF92upuK3bmpOfY
         XA8D9NhBIU+kZkmDJm1gnpUoxMRxpMHLD2XxJcwFIiKHd7JavCzcJgHjHIzx2lx9+oUQ
         BiiA==
X-Forwarded-Encrypted: i=1; AKwUvBxYr8fHVjdA9QcH5PQKcftSUDeTjnW+i7Ix6y07GWsvwULYw2ss2MC3cJoHEB7o0r9Dhz8N3Oo98jxB@vger.kernel.org
X-Gm-Message-State: AFuF++kQgn2whk2iXpxt6435uUa5NYvXEJ4zemeMqE1GSjHAm/uzvI56
	48QTyIpKM/PRlhPPRu2HSVcgXsbtTVphJXIXtZ2M9Gmocd0VrVpp53a60XTmLktXxDaiy+ysO4l
	nnLzL0zg3JUYZyRLCT/DLHZZ2A5eaapVl067Hb3CGfAhnqo/JR8qtep+15/n8BKkq
X-Gm-Gg: AYBFou2Bn1MBqEYfvpPpYqaoIEZaGv89MPumjtM+JaV1txl+q5V+wEGwpHrIk7rdtdx
	B7UQm+m5wcGYbHkOdRhvD67ye+y30Ov+lKhfdNKXhUX6RulpjOsYTQnVTDS2EBnVCvQimpHnOSZ
	hqqAHetqBQkCwXCxcrOpdJyGj/6sukZF0C9Ki1qqrrbRAK5KpjOiKsCoeS+qwH59QJMHTfFBmJ7
	oUEzg1X6ayGZiechPL3IFgL6kGXCIIEXoBkg9hUG3dp35/HdeKWFFRJvku4SPdpApCWUmB1wTqT
	kA/d0a978LwgqntQGkXj0/4qFna/zmsg0nfCLaaiZAUeUIyTYs8QanYzXquQYIKuRI5rvmvmDNk
	zhCSDjXAhXqJ+vEX3+wASI3nnznY=
X-Received: by 2002:a05:6870:a788:b0:457:b657:b084 with SMTP id 586e51a60fabf-47dea52533emr6576569fac.18.1789141166284;
        Fri, 11 Sep 2026 08:39:26 -0700 (PDT)
X-Received: by 2002:a05:6870:a788:b0:457:b657:b084 with SMTP id 586e51a60fabf-47dea52533emr6576494fac.18.1789141165861;
        Fri, 11 Sep 2026 08:39:25 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:39:25 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:46 +0530
Subject: [PATCH 15/17] phy: qcom: edp: Add Nord LDO, TX lane and TX
 resistor calibration callbacks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-15-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=2541;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Xy/VEWguip0tUXARr40NV4wwp5carfCh+h9B3ClOARc=;
 b=fCVipWrCI9H3CCZKDDD14z5Es5pRMhlle8YcU1NBrHBqtRPMssWUK43GOknyyVMcKJWene/D+
 tVmDRWKwXQyB5+I7VXQ5EnFrpSRBAEc5kM069eafOWLHDQgUEcpXd5X
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: 6sf1KSMK329IS2tRRK3H-wjuLo6OjS9p
X-Proofpoint-ORIG-GUID: 6sf1KSMK329IS2tRRK3H-wjuLo6OjS9p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXwx5DlhchST/O
 oTgm9BT8P4Vk2j4meyoF3YIkSmE+nPM+XqAOCJ4w/p5Sph9UyJ5RnXVkEzRLV/YrVaGbsf33zb2
 PJnwHW0shiEYbC4w60nMpHnO7LAFkgVYdt6a0zXA+m7DuqXQMSTfsQEiinHLT1C02MXbPT3h+Zr
 If8Opcqsuau2izFr7tL9JxkjrT7oOhk16f+Pjo1A0h4MRWW7JklTFTYvE0WrNICNaWPTAzGPsFE
 t0NjRzfMNgWnqIU1sUYwiUgNcB9BDiQwC1+oC11yvpszvnTlmsoBe4YYdNen7lSNyL1zcGLcb3t
 ChwPOaRwKkHEqQSly5n8LaPYh9ruTMwKBxN02oW2XtNo5JzutpspkiKJSJC/UNtDW99YU5WQIXj
 Vab1OZHTsa5kYHEzJenxkkvNu7VkSn75nnYAcjGr9CE/YOuTmfakq66pqtMvdmpNyXnZbieSY88
 VtjjodHjNt0KZnjWC7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX44tAk786Fmes
 MbaxvOmiVlHKy1cW8K5BIvxVTx/ztPU8AE9KlLbDuXRPsQTNCCeErHAITWIRuDBbzJb0z2ISZgc
 WBJjaWsMarcRKpPX3IYlhqt83Lvzg0g=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa420af cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Ap641EtHlGqqo4O5a_8A:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord requires different LDO levels, TX lane control offsets and TX
resistor calibration codes compared to existing SoCs.  Add
qcom_edp_ldo_config_nord(), qcom_edp_phy_tx_lane_cfg_nord() and
qcom_edp_phy_tx_res_cfg_nord() with values per HPG Table 2-1-d.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 47 +++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 4d1b2c81d956..361f4e467351 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1800,6 +1800,53 @@ static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
 }
 
 
+/*
+ * nord LDO configuration.
+ * From HPG Table 2-1-d: LDO Configuration section.
+ * eDP mode: 0xD1 for rates <= 8.1 Gbps, 0x00 for UHBR (>8.1 Gbps).
+ * DP mode: always 0x00.
+ * Also programs EDP2_DP_PHY_LDO_CFG: 0x03 for eDP rates <= 8.1G, 0x00 otherwise.
+ */
+static int qcom_edp_ldo_config_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 ldo_config;
+	u32 phy_ldo_cfg;
+
+	ldo_config = 0xd0;
+	phy_ldo_cfg = 0x03;
+
+	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
+	writel(dp_opts->lanes > 2 ? ldo_config : 0x00, edp->tx1 + TXn_LDO_CONFIG);
+	writel(phy_ldo_cfg, edp->edp + DP_PHY_LDO_CFG);
+
+	return 0;
+}
+
+static int qcom_edp_phy_tx_lane_cfg_nord(const struct qcom_edp *edp)
+{
+	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL_NORD);
+	writel(0x12, edp->edp + DP_PHY_TX_LN0_DRV_LVL_NORD);
+	writel(0x12, edp->edp + DP_PHY_TX_LN1_DRV_LVL_NORD);
+	writel(0x05, edp->tx0 + TXn_TX_BAND_NORD);
+	writel(0x05, edp->tx1 + TXn_TX_BAND_NORD);
+
+	return 0;
+}
+
+static int qcom_edp_phy_tx_res_cfg_nord(const struct qcom_edp *edp)
+{
+	writel(0x06, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
+	writel(0x06, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
+	writel(0x06, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
+	writel(0x06, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
+	writel(0x06, edp->tx0 + TXn_TX_EMP_POST1_LVL);
+	writel(0x06, edp->tx1 + TXn_TX_EMP_POST1_LVL);
+
+	return 0;
+}
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

