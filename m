Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698962F30
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583499; cv=none; b=aPtXkaBiAbDJAhu8LjSO/swkpGbJ9Yi38tPW+E+1rYbqIx4OsKG6c8PLrW9VDPBRRvGeT+Neb2vKo3CJOPoCpzY1OnGByYNzz8Ahj/ZXeHr3Qkkt9+zQlt2Gljmyd3HjdBEYRhatLGtDyaWQpkJsnpctIrZGq1cNJMBYe574t+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583499; c=relaxed/simple;
	bh=aEHAQHfBVivuua/vFIx06acVPmCqKszNmBVF///mHO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1VAKAK3gxJiHUpu0uKuMDJcb1P0ngeh7NS9NOI6gi+GI29xsc6ADUN6m7cP8pZSgbERPhQZSDw/MozdDkQ6UTE23XUDXBuxGPoXxHYx+mfy2cKYt6V7FFlhvv3Be9FSXPhFSGnbBrF3ePstu6wlrTjsS+DUFna1kMyc5QCWXp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UieW6IA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPIZms1l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UieW6IA9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPIZms1l"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeEDj2470104
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NO7b42YBwSn1pgx8rjlpajz93VqzR7OjhoiLHTqdiDI=; b=UieW6IA9653WC2f5
	VUWRAfJCYzXWz1NEXsSBpmDoz2iqz9/oH8VGUgeUxhGxFJ3TFO7XML4GbJ+t1BUG
	BR/0stofY60MzU3c5+hUgtRl5hrhVoLTARZXCFnIk4bLHiG+G8/zXgurzxQ2Ohdt
	+17PdWwpnS2Pg11vEOIu0XSJawd6TZXmQzpFwPCMnwxhKc7bAOt4q7NIVTMIeua7
	dStJHuzdmg/Zc3Lc1NG+r38cXZqTbbe9M4dWizsO5Y1Vay6z5KcFNRVVygOJfQMO
	j5M2HaWZGNBwUGojRSALeph7goCvMmwHSSkG1YAoPdAXsLjwEJjqrAMYpEHXccVs
	oNkpYw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn51sg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:30 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f653940ba4so8862628a34.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789583490; x=1790188290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NO7b42YBwSn1pgx8rjlpajz93VqzR7OjhoiLHTqdiDI=;
        b=IPIZms1lTjmZONthddAKe1KQuniA4RzG0YuyeCPs01RHDRI6F8KUOfZ1VTjr6pn814
         +n6+aQKsVirfXMtPD2tfF5B3/KLeElUl5Eblkh3S/1T7nAaUs+/q4xCQkRmv9kBlV0iZ
         G0GngDi7mkAagujnTjC5ihMr16NJcmPho04zDVLain2bXQBM2xCQfSiCnaYRdJteW5gU
         TF/2k+S7eq+2Tyi4KEgshIKI/z2YBxxe8jL8fVeaaAUvA/ztalaYi9jEZPSoXqIOrNqP
         ZsuivpJNdXsc0kZ/qPtsoUH/BVzZRhsDJwZ7CqopzsujRVbDZdjUG8S0lvkg/wbDCYIJ
         4leQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583490; x=1790188290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NO7b42YBwSn1pgx8rjlpajz93VqzR7OjhoiLHTqdiDI=;
        b=n0nMgXNrnlh5Ki8IfxM7PXJLMkxRPFdp3XyLCKRCMNNWNFAr8dIPVD9CjjP2itjDq6
         jFFYz/9zE+XSiMoOCw+Fxwj+bPT8C/DeQXlutuEm00pKVlESHAPFEoRwBoTM120m8hE9
         pPBfTJ4fFFQh2R6ZjYhzvPhF4BKghsxQCdGKVdCBSF3BXdJJo9wap8nlNDiFAnDp/lU8
         M7raSgUFaqzrKW7hoQ8W9F1K6DW0z+6a/LL+4+SMJsckyXmuT5ubtvTL/R4GGKct0aZ6
         UA8lCUTAEpLHmndnd6Su81/Q7h48oZMK45Mt5Unz2k1hYYzCa9hpYHykEEVJDCCkO/QV
         KVhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCHFO6j3vV4It7NicVk8zwfAfeITdRTJIc6YJJauWF52EBDQWNrrw/intXWCtKCuQlRghdV46ahVoY@vger.kernel.org
X-Gm-Message-State: AFuF++l+jgyFkW774ucmRt2v/MM78vN5Y/ptrfBpu50V/8oEBQPufi1J
	fdN0JoE/xL1rYfbXAwLqh+iCm+tbxc9G/qnky2Ox7QYkCsVwoioW0R7yFf+UY2RYd70LhYmlOLX
	+zCQYT2aV6t4kEGBtva9zLsP7K626GjzsqTAbQdM7le0KRymoWZa+u7tNMeBheaIVW94DkFBc
X-Gm-Gg: AYBFou3caD+Dgcj6Wa37Ja5UpzsOSJD52W+rxxxZgob0RwYrfiX0V0Tw4W6uYJ+2A4n
	UYAtT5ol3oPZgZVpZ5KNBHB7R+SGlt4cRSXPSuomyQPHdUPQPdwEK8jqwtVyqImSAZDUcfHynQQ
	DGBdTnnsFd5h6+0VBTz363zHRI4R5kC0yOoemlCwXd2nCbHDgTYTkDPWRrFSKGDdi5nmgKAVl4l
	nZCAymVEuSD8/H5lgGmjD3WgB0fMEodVYrqLsL0L5XdrpHRlZbpKfeCmhJAJZWvK7pblX3QzSBh
	z/56P4kgJ+dzCBW4XA9zBjPuSFRRKdJq5MalaYbarxQ5hqBabPJtZc7Dlx1MTSKwp4CfrsGGQdz
	ZTZxHzBAJr2KYQSy/pafEmdkpDA8=
X-Received: by 2002:a05:6830:1bf9:b0:80c:410d:13a8 with SMTP id 46e09a7af769-80c410d20e3mr796930a34.11.1789583489619;
        Wed, 16 Sep 2026 11:31:29 -0700 (PDT)
X-Received: by 2002:a05:6122:3c42:b0:5c9:a60b:e5be with SMTP id 71dfb90a1353d-5c9a60be881mr407924e0c.14.1789583477604;
        Wed, 16 Sep 2026 11:31:17 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf2797csm8625416f8f.16.2026.09.16.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:31:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:30:53 +0200
Subject: [PATCH v2 3/3] phy: qcom: qmp-combo: Add USB3+DP PHY support for
 Nord
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-nord-usb-phy-v2-3-2c8461bb30e6@oss.qualcomm.com>
References: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
In-Reply-To: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5341;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aEHAQHfBVivuua/vFIx06acVPmCqKszNmBVF///mHO0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqquBpbyie065QQ6xUUU1da4CM8Qm9YBTRuxl9q
 1Fi8t21hNeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqrgaQAKCRAFnS7L/zaE
 w/qiD/4mcX8AE7ot7L0NMUT829zd+LzbU+Emq9E2J3XKvbENIsbDHIcHMYdIxWA23AugQNO/Q2B
 Jd78I+8S8CFfxcUdpdx7PK47fxIWrOy1VvOAgfl1Kt6uHVWrDA7zsNjpmSQxeAlWLJbLqFIRidq
 oVGDFIGjSxLVW4LqjZbVtlY4v1jvH4utiOh0RllC+ec7XdEXyexuVSrqnwlqK7F82Ywkn7sD1qo
 clNao6tJfmvAy17qR0MIRQ3tnCA+xxvs2TiI98GqsRhgh6QTHJ0V/+7uuzJfX7bZEs9KY88Gx1N
 JAa6o33GdOb2ts7SOSIC/NCkLQ8fs8gM4Xe6Ra7GvPMNYPTZ1M3jjLIHncVRHQG1cEazJhRccCT
 NMgg7twwmzuA13UF7mY2LnZ6mGFXbvc356xtQBwAt8S4pzRCPgzkPobYr781whj+WH5ElpR9ax2
 CIe1GIll7Xyad27eQezHJZGY7LULPz+3PomENXPUgDf3qFWPbPIfXQdOLv53Xx9vP6TTWJ//jYs
 HoXhqM6LijPfNt+yolCZ14QtA4uyilweDBFwAenvak9qeWcl7DkvbXsGk28SiIX4Mxgc0HO6xoK
 lXxBCF0xuWixGoKagURq8O1XJ/WphI+0TrCs74saB5G0eFM51wohkp8zgCVb8hftKcHbRnA+FIv
 JIrGG5gUjIcLA4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX0Wushp2UVCCA
 M8rGVtO9mhucEK3pW7NwLHC4ON/MBqlDD06SG3v3VcjxoZw8wwX+JKAb/whMHli/c4Dzt5ZkQtV
 UP/tKwghLA1ZQ3ceA7GWoGlIfEVy9LGXGl29Sg4zeq1l7PNKmGCiVELskq8haHxZJ2iEwH5iFfS
 TiVZFWZlRQ+aoyrkb/6rxtKnsjK214zyRX0XRfIIcIr5wfld/CSxj4FV937eptvoEdmNgWmBVAp
 ceBW9Phw5g8VIkpfZ7i3Y9+zioMTeKnTFXTdzHKPkJ7eurbXc+9E9J7FxwTyLVNntrWVMCAgUg1
 rDlsmyasbirgL5a1+TuqktLDKfGE1AT4XnZFc1uLAdEQxfFLWniepMI9fs/qEZxv2JdAtMRExVt
 CstcfVLjCo9yCuyQ2zo+6okkMR+hHy2I7/i97RiQQSs6RpzNWeAnxnC1MbqVi1llCkWHlbXZWJd
 7bs4WaLOmdavhZ8gXJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX9DUEkTPpNRQ/
 OATiEw3ShPXcZ0CxcrMNiIAN1f5nu97XeGfQPllcu4dUU0ti1yGNLFVk98dWDGsEm4IHbc5qV8Y
 1cIM5U2bdXDCsd2Y05qhFe/85xIRoDQ=
X-Proofpoint-ORIG-GUID: JZNFZmX8w6pJv-g1TxYOPIUGRiOe2ake
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aaae082 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mRaulJff6YCFnxtsk_cA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: JZNFZmX8w6pJv-g1TxYOPIUGRiOe2ake
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160255

Nord SoC provides two USB3+DP combo PHYs. Their initialisation sequences
are identical to sm8550, but the sub-blocks are not laid out the same way:
Nord adds a dedicated USB3_PCS_AON region at offset 0x1e00 and leaves
everything else where sm8550 has it. None of the existing offsets tables
describe that, so add a v6 table which is the v3 layout plus usb3_pcs_aon.

Populating usb3_pcs_aon changes where the driver drives the I/O clamp when
entering and leaving autonomous mode: it now uses the real AON region
rather than falling back to PCS_MISC, which is what platforms with no AON
region do.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 80 +++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index a4f130fc33e3990e4101a710803bb4d0a0ed077b..c4e88b0384cb557f88f5af233f0568c7a93ab9cd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2356,6 +2356,20 @@ static const struct qmp_phy_init_tbl hawi_usb3_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
 };
 
+static const struct qmp_phy_init_tbl nord_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_1, 0xf5),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_4, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_5, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RCV_DETECT_LVL_2, 0x14),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_PI_QEC_CTRL, 0x21, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_PI_QEC_CTRL, 0x05, 2),
+};
+
 /* list of regulators */
 static struct regulator_bulk_data qmp_phy_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 21800, },
@@ -2720,6 +2734,23 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 	.dp_dp_phy	= 0x2200,
 };
 
+static const struct qmp_combo_offsets qmp_combo_offsets_v6 = {
+	.com		= 0x0000,
+	.txa		= 0x1200,
+	.rxa		= 0x1400,
+	.txb		= 0x1600,
+	.rxb		= 0x1800,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1a00,
+	.usb3_pcs	= 0x1c00,
+	.usb3_pcs_aon	= 0x1e00,
+	.usb3_pcs_usb	= 0x1f00,
+	.dp_serdes	= 0x2000,
+	.dp_txa		= 0x2200,
+	.dp_txb		= 0x2600,
+	.dp_dp_phy	= 0x2a00,
+};
+
 static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
 	.com		= 0x0000,
 	.txa		= 0x1400,
@@ -3424,6 +3455,51 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_refgen),
 };
 
+static const struct qmp_phy_cfg nord_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v6,
+
+	.serdes_tbl		= sm8550_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8550_usb3_serdes_tbl),
+	.tx_tbl			= nord_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(nord_usb3_tx_tbl),
+	.rx_tbl			= sm8550_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8550_usb3_rx_tbl),
+	.pcs_tbl		= sm8550_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8550_usb3_pcs_tbl),
+	.pcs_usb_tbl		= sm8550_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8550_usb3_pcs_usb_tbl),
+
+	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+
+	.swing_hbr_rbr		= &qmp_dp_v5_voltage_swing_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
+	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
+
+	.dp_aux_init		= qmp_v4_dp_aux_init,
+	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+
+	.regs			= qmp_v6_usb3phy_regs_layout,
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+};
+
 static int qmp_combo_dp_serdes_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5621,6 +5697,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,hawi-qmp-usb3-dp-phy",
 		.data = &hawi_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,nord-qmp-usb3-dp-phy",
+		.data = &nord_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sar2130p-qmp-usb3-dp-phy",
 		.data = &sar2130p_usb3dpphy_cfg,

-- 
2.47.3

