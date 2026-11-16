Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835122;
	b=zyjsdIk3dV+SzdsRDTg3p6qoqpcWBo8FWYIBrQMDFi2aNFwI3ZDdjr/39BHAcUgk20dK
	 dWKJ34+mKhmrjx3CN8DxW+hr/Dca8jY0hb0hl33/TlyxCiBfs42xwEEg1bZXtL51lvMRP
	 mbEnRqHQfMRdGE9ITnOmGiBPJ6NbBJzPEfnS+Ok/4q08aIlcYpypGqmM4vXofQvyOcSLW
	 xvK3vK4estcthXfPJznkJ4xkQSCHCa9MDHUHuuOnBNZVU8gHLveD9q1NClLdfivfZ9KjU
	 uctkpehhYl7wsDQJXwtez6TsMizeTBVYyWAaHKMmFaAYaAbMT4nNYiVjKB3iMsmQXNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=riApKOczOiGh1poCttJAOgHoQlMTfvfbnKpTUBOvz78=;
	b=3Q9RpPfPB6xJ53jogDpdkPrxhPkzTeNoP/cVX7XA6bjDI/wdtKjzFOTjTmeLmESF3J87
	 sVnCDjAKBjFWUgZf7iMffymQFPeI7yKib0sLbE23e6MAAog0jEq6/RbOxWYAASrOT4xc/
	 a9bdrRvyg2/HUMKMb3OMc4/2H232Oa+EKchutBHNZhC3dSUF5SS3ZP1gwVG0FNefx9VZi
	 a/dqzn8ZyX7/Vs9h1Mr9mtUdsmKfaUbpM/3pB+z1hOxd9sTjjj5UO6Z04eLo1b/pzN8Kw
	 dpXOMDlds23P7BjirahZVXBDut6Afh5kOQgxY8MYEbh3pKtyMus6k5AsXK9aCN3tXYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f1rTrnVp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaiB2xK4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A2D606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A2D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f1rTrnVp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaiB2xK4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC13RF4069649
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riApKOczOiGh1poCttJAOgHoQlMTfvfbnKpTUBOvz78=; b=f1rTrnVpogAFz9+W
	aJnUNJkVeXvBIZd5Cw/nA65QH87/XQraWyMYmp1U693gkD/94GF+TFObHHIaFOWX
	H04Ycuuyyhao9rC1ug0Sl4hCBbPl3YoqOfnGr28MlIlVAjIkuyb3eiRLTaykvF/L
	TIZL443nrK7NwXNaQbFhrLD1Pc4NHYzNacCx0cDEnUKVj37WcqXFOKtDD30R5zjp
	eETRjgmSpc38tkndoBhqD12R6jkQlIr4hXa3tcxwxSeZC1nwPgTZbTjO0ERfZ1qT
	sFJXVMD6FAjXbi3jsVPQDn0aY+WMTf9lzmaykzeZ+tzCbr5Jusje0Jyeaz2qs6cu
	Q3t1fg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcehvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:18:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94975041698so269175985a.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835120; x=1795439920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riApKOczOiGh1poCttJAOgHoQlMTfvfbnKpTUBOvz78=;
        b=ZaiB2xK4riTGU9rIYSoFTK1OoU59opzbZ0mb+rtTsjwyNO0sivLgy81EiG7hqhIi+b
         tXFI+MRiOqTpuu5pzx7MA6tmQS7GtYyonVXDGkK0rV4lWgL0dnxYCpXOQrtPZ5lk1ObF
         o9j+pWd8nPGH9Mh9WpeCC5n/bTuJyPxyt2RX+uVnWyGNVzLYw9Q9Wj0rPKKcFLnUPtbY
         Bhf/yIXSby6sLnwmmQedhtnKMV0162IQFf2/Spuj/YEChHoSUS+vUOQ7dpevQ0AaagPS
         IpnIJHzJh5HzR+pA76cp56Cz9Vdg2PDx5GU3MwHBKsYuDUbkv2zDD69LPAOtPc3tDg4X
         RF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835120; x=1795439920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riApKOczOiGh1poCttJAOgHoQlMTfvfbnKpTUBOvz78=;
        b=ujanM9FFcQ/3PE9tUCWZeV3Au+2qlnZQhGiUCc3HQSvkVNS1iX9MRsEH3NuY8Rz3WR
         OdiSU1dN9a145VY8p8iyClm8D+fM40/R3GgZSo27Lpdsj+kSUdZV6NDCGxSZTjq/OCFh
         cOG9uoB3OcYg7nY77k8UmqEp/KLbOrUqd6/JXMSpk2VYfGRTHGtwU8A7lzXlS32m+pvA
         6fvbuZVHCuLUjB7yDsaahfW9loErcALNxssOqORK65Q1QHZWl0HMC4BhZALngKz9ajrJ
         pTeeO8UaCVsJaoDuO20cHcMHJlgCpCvOLsAs9xk9HXxZWVJL1QlWgY0tPXPf+WIrNWgL
         J2/Q==
X-Forwarded-Encrypted: i=1; AL+hErH8dNJFjM3+3JHQbZrm6HqLJorps3Lvcgv031F/tPeM6tEW7C4A0wYt/4VNmx+os7eNFS2PIfy6DKYb@vger.kernel.org
X-Gm-Message-State: APuU4Z+aPswdoKFpW0+K3TvZSX+wxalG+xttN9rX00AkLfdutzjoiPM8
	i6aCPzj3Qw86W88ABz3eh8XVyXwv7hF0slta31P8d5RyvoslGRZMszP/cdt/Hci8FkXItR9Eofv
	d/6zDw5X65WQ3MSzE9EWH3PkP1jRay00T4bomACQt4G02vu8GxgqWk6p/g+tRszJQ
X-Gm-Gg: AYBFou1iYiRvvqO3ZXFyuZNHHa/62vcfVd3PADMFF4bmp7r0xoQHQsHCSmD98w1/tYJ
	zlhINx3VNvE4fy+qO6GMQwMu92NajkWfpiS592T2lbboTqSq/+9aHOCOlRrDxdqUNKbJGXmpEkT
	cRDcy9x0eM6DsBCJ8CU0/9Wul8YqfDAgREWQLNlqtSafLzCh7ePAe5pdJod6WmeIwk0Z4JLZNTD
	2cK0nSnMetvJK6kJ3mQFCk2wv2wEqESN+eeVusS0OEJYDkrn8y6fD/73E5porZDgtNs10xJs67r
	0sKZIelsgMevVvCYLSXTkqJyLamsjd4o/Q1aVsxwdh7AZmmijvw3IdWy5pyvCqrSXk3iU4yW25u
	l2sxH+4Mxp+yM2RtiIynPIPz+CVv74xsNs1bvPjcD37imsX21PvRzaq8T++sJyplmA+ijPk4pSk
	62
X-Received: by 2002:a05:620a:4001:b0:93f:4a02:ed99 with SMTP id af79cd13be357-94933084867mr2033965085a.20.1794835119786;
        Mon, 16 Nov 2026 05:18:39 -0800 (PST)
X-Received: by 2002:a05:620a:4001:b0:93f:4a02:ed99 with SMTP id af79cd13be357-94933084867mr2033961385a.20.1794835119256;
        Mon, 16 Nov 2026 05:18:39 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:38 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:48 +0530
Subject: [PATCH v3 09/11] phy: qcom: edp: Generalize power-on path for
 per-SoC overrides
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-nord-drv-dt-v3-9-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=9662;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=36MtQ8R8ef+BwnSkDz7J45/enlCrCq2XAWpcdUYmXPM=;
 b=x17Wm4OQIVFqU0VEpyQ5JgHLtgz9B4G8pnf2kwU52OcaHibCep9qK0hAsE6DMa0h9iTMrsLzS
 iR/44Q2ez+hBcteEj8wa18c7MhKMKLSUDCgJdATJi0hHqXOMJsYu+bX
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX1BFldMZU0LXU
 O6udrTNRM5ASljiJ6vDkWU875WXR7Qr/btcC1XzWbH+y0oPthodtSIQnwlXuHjLn0BnWLL2N0I8
 wonacF6SUvK8He+SangcPxsQYnph9H0=
X-Proofpoint-ORIG-GUID: QQwLjStiUM-rhOxPiultA44BeHfXmuCC
X-Proofpoint-GUID: QQwLjStiUM-rhOxPiultA44BeHfXmuCC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfXzozPRbsI4SnF
 DUeVvmXOk+cbKS9Ni7QddcTqA4FosLr0aldkzEoJYf/JvdKUEWI9XZctjVB0rGq2m7hzdTKMSx2
 EWoxZ1B5RRQOi3aUFhuaxMjrjfE9iUhHUJCL4ceSP7KrkQ23Sc0KOcrNpdq6w2/ARSZy2HFzmNV
 bnXHAMztoG2PY9lT3m5Bt4xUCVztAE59Ll32dyG2+TVOODZSqpDRvSCzWRkeGvjr/erZixNsBIb
 v3Ul0mHNZ64hbEr3aZ2AgMRfek8hBV1nd0tnie1W+vxlBWd/IKjPuigOMIRMgSIqHUIuyjCLrNw
 pXU5DPKmy/s2hAelPCf2fpvAMYwwZzt97ioKtSNRAjWBY5pJE5HPkCJaLn9uzGE6/qEeZRvBm+y
 oIXa/IPVLWy3mDdCx8LyNst3t7PGCmlkHJezz8ZBox6RpdjULqFiusP7evxfFHF5QMleajxKrf2
 i3/K6GRd351xQ0G2ipA==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afb02b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pk8lE6HZg6DXLPRzJH4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add tx_res_config() and set_voltages() callbacks to phy_ver_ops so
SoCs with different register layouts can override TX resistor
calibration and TX drive-level writes independently.

Move the TX_BAND and RES_CODE/TX_EMP writes out of the common
power-on path into qcom_edp_tx_res_config_default(), which is
assigned to all existing SoC ops tables.  Likewise, dispatch
set_voltages() through the ops pointer in qcom_edp_set_voltages()
before falling back to the default TXn_TX_DRV_LVL writes.

Add phy_status_reg, tx2_tx3_lane_ctl and bias1_en_2lane fields to
qcom_edp_phy_cfg so the power-on path reads register offsets and
the 2-lane bias value from the per-SoC config rather than using
hardcoded constants.  Populate these fields for all existing SoC
configs with the current values, preserving existing behaviour.

No functional change for existing SoCs.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 59 +++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index a3c893f72908..41bcfffbb357 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -82,6 +82,8 @@ struct phy_ver_ops {
 	int (*com_configure_pll)(const struct qcom_edp *edp);
 	int (*com_configure_ssc)(const struct qcom_edp *edp);
 	int (*com_ldo_config)(const struct qcom_edp *edp);
+	int (*tx_res_config)(const struct qcom_edp *edp);
+	int (*set_voltages)(struct qcom_edp *edp, u8 swing, u8 emph);
 };
 
 struct qcom_edp_phy_cfg {
@@ -91,6 +93,9 @@ struct qcom_edp_phy_cfg {
 	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
 	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
 	const struct phy_ver_ops *ver_ops;
+	u32 phy_status_reg;
+	u8 bias1_en_2lane;
+	u32 tx2_tx3_lane_ctl;
 };
 
 struct qcom_edp {
@@ -383,6 +388,9 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	if (ret)
 		return ret;
 
+	if (edp->cfg->ver_ops->set_voltages)
+		return edp->cfg->ver_ops->set_voltages(edp, swing, emph);
+
 	writel(swing, edp->tx0 + TXn_TX_DRV_LVL);
 	writel(emph, edp->tx0 + TXn_TX_EMP_POST1_LVL);
 
@@ -645,6 +653,20 @@ static int qcom_edp_ldo_config_v4(const struct qcom_edp *edp)
 	return 0;
 }
 
+static int qcom_edp_tx_res_config_default(const struct qcom_edp *edp)
+{
+	writel(0x04, edp->tx0 + TXn_TX_BAND);
+	writel(0x04, edp->tx1 + TXn_TX_BAND);
+	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
+	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
+	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
+	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
+	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
+	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
+
+	return 0;
+}
+
 static const struct phy_ver_ops qcom_edp_phy_ops_v3 = {
 	.com_power_on		= qcom_edp_phy_power_on_v4,
 	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v4,
@@ -653,6 +675,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v3 = {
 	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
 	.com_ldo_config		= qcom_edp_ldo_config_v3,
+	.tx_res_config		= qcom_edp_tx_res_config_default,
 };
 
 static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
@@ -663,6 +686,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
 	.com_ldo_config		= qcom_edp_ldo_config_v4,
+	.tx_res_config		= qcom_edp_tx_res_config_default,
 };
 
 static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
@@ -672,6 +696,8 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
 };
 
 static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
@@ -680,6 +706,8 @@ static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
 	.ver_ops = &qcom_edp_phy_ops_v3,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
 };
 
 static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
@@ -688,6 +716,8 @@ static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v2,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v2,
 	.ver_ops = &qcom_edp_phy_ops_v3,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
@@ -696,6 +726,8 @@ static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
@@ -705,6 +737,8 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
 };
 
 static int qcom_edp_phy_power_on_v6(const struct qcom_edp *edp)
@@ -898,6 +932,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 	.com_configure_pll	= qcom_edp_com_configure_pll_v6,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v6,
 	.com_ldo_config		= qcom_edp_ldo_config_v6,
+	.tx_res_config		= qcom_edp_tx_res_config_default,
 };
 
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
@@ -906,6 +941,8 @@ static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v6,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
 };
 
 static int qcom_edp_com_configure_ssc_v8(const struct qcom_edp *edp)
@@ -1031,7 +1068,6 @@ static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
 	return 0;
 }
 
-
 static int qcom_edp_phy_com_resetsm_cntrl_v8(const struct qcom_edp *edp)
 {
 	u32 val;
@@ -1079,6 +1115,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 	.com_configure_pll	= qcom_edp_com_configure_pll_v8,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v8,
 	.com_ldo_config		= qcom_edp_ldo_config_v6,
+	.tx_res_config		= qcom_edp_tx_res_config_default,
 };
 
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
@@ -1087,6 +1124,8 @@ static struct qcom_edp_phy_cfg glymur_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v8,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
 };
 
 static int qcom_edp_phy_power_on(struct phy *phy)
@@ -1121,21 +1160,19 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 
 	/* TX Lane configuration */
 	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
-	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
+	writel(0x05, edp->edp + edp->cfg->tx2_tx3_lane_ctl);
 
 	/* TX-0 register configuration */
 	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
 	writel(0x0f, edp->tx0 + TXn_CLKBUF_ENABLE);
 	writel(0x03, edp->tx0 + TXn_RESET_TSYNC_EN);
 	writel(0x01, edp->tx0 + TXn_TRAN_DRVR_EMP_EN);
-	writel(0x04, edp->tx0 + TXn_TX_BAND);
 
 	/* TX-1 register configuration */
 	writel(0x03, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
 	writel(0x0f, edp->tx1 + TXn_CLKBUF_ENABLE);
 	writel(0x03, edp->tx1 + TXn_RESET_TSYNC_EN);
 	writel(0x01, edp->tx1 + TXn_TRAN_DRVR_EMP_EN);
-	writel(0x04, edp->tx1 + TXn_TX_BAND);
 
 	ret = qcom_edp_set_vco_div(edp, &pixel_freq);
 	if (ret)
@@ -1159,13 +1196,9 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
 	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
 	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
-	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
-	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
-	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
-	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
-
-	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
-	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
+	ret = edp->cfg->ver_ops->tx_res_config(edp);
+	if (ret)
+		return ret;
 	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
 	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
 
@@ -1177,7 +1210,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 		cfg1 = 0x1;
 	} else if (edp->dp_opts.lanes == 2) {
 		bias0_en = 0x03;
-		bias1_en = 0x00;
+		bias1_en = edp->cfg->bias1_en_2lane;
 		drvr0_en = 0x04;
 		drvr1_en = 0x07;
 		cfg1 = 0x3;
@@ -1200,7 +1233,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 
 	writel(0x19, edp->edp + DP_PHY_CFG);
 
-	ret = readl_poll_timeout(edp->edp + DP_PHY_STATUS,
+	ret = readl_poll_timeout(edp->edp + edp->cfg->phy_status_reg,
 				 val, val & BIT(1), 500, 10000);
 	if (ret)
 		return ret;

-- 
2.34.1

