Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E16E3CC33F
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789819; cv=none; b=hzmSIAuoxPZVDic8tCaWHpWeJ11UkBDFkS7rfjmFpJwDUtCmmkrmG9i6GoCwEd+EQf89zzI5bHHpB9SQouyEV14l91OdyqWWnaVjOkASjfoTx1tVOEaoMEZRS3FI/nvJxexWzyvl8hZxRBwWQmdn9dLiWNMOIkoXnQxTUSilhtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789819; c=relaxed/simple;
	bh=oVC5UqW8EITu6nRZcu5QBdQbzKRKDsRDWUWaypx17T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWfURaxr/ZjY/ZIN1to/0U9627m9AlB+RZjsdxo9MGv4qbsFHoqu3CKABGYHhmjekkmVLAOozwaMO1c998xMAK8LPVWik+LN6wKLfCOO9l2W2nouSs2CT7GlS9eWBnAVGbaBnhUbLYFo/tXHZVVPIp6y/Wt6Nf9ECnpZWRZtxhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JoCK9hba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5vhvrkl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JoCK9hba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5vhvrkl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEO6f34107647
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=; b=JoCK9hbaiue6C6gU
	2zyf9Eh+cZaf0Tqjc4NzJucvH1HPiyx//5gbS4fCtncnt61Q02GYSX6TsJLRUJf8
	lePsaD+xO/OanthIY/FmV8/fmiN5Svd5cG3qdPMcCjhSujuyxv647v7W68siuWEc
	9zSziLBYcLqtQ8bBW1JdxsiyMeEqvApKZC/eWzShsAgKSpStnPDnS0fAXjQDO9wG
	9+3ZDx4onRChIt0zTpEqxBrD4BN7V34cntWIlIbokqh29OXkitXITw3Z12j9VgPe
	9hDE2e/Lqdu8rsAErWH8eIfuMPgST78LiwhVzfW8A3mxSP+miTBbbZ8K229uvmLP
	04X2mA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8v9868-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so2338510a91.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783789817; x=1784394617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=;
        b=F5vhvrklmXUUc5sWmCxzjc7/6syMeohqIZvlp5WK+5nZGCdxe0QrVNh27ZD4sprzqf
         kl+2UTWkuqVSN/yAjC+T3OZgM2yF+55iEEiQbxqw0PIYjRXnV8abHWTSxqAkpPxet16Y
         +0Zwn8HN+lS1n9gHFAlUOBrzwElhEr3dy4Q8euSTll0MuCSGun+VKbX0z187kWhNjR3K
         z2XekITpVG9+pM4P35XeMImm19fniHxVzIewsnfnLRLhwC6/Ey1SgoNOa0xP3vswuXqD
         dTWFuhUROp2YQLrNJJven9DH9t+wg0Mvozc3TN4pHNFahwS7ifUIXLexV+RTTfouAkyv
         sfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783789817; x=1784394617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=;
        b=MC91DxxulRvxRaBaYKmS9A5tPctNeRHJZPHRbvBXR1K3/PqMHxPVXhFA06pjG8elvL
         oB+dgZJSNNaVSsyyg7Ho0XPfzoys3vnzgm8gmdl+ytLPbMjks3puI3vCtw6SGIWda3jG
         b3LaDClFcZTNmaUiycBNrfS2d+4x7LvloWdadzYOho4eTwTb4t/JJBstfn3E38a3IFuo
         BEyIoWeYhdBsxZnAWteWJav468iPscaWU1hejNy9vJgvMDHO6MrfVOp4BDK/fFg9cw/H
         lOgrn/xyFqNpOSvFSNU9MCunhrbKOrzU9fvuJ24FAVKP1702KUgLSSkAaw9K5tcxWq6W
         d4tA==
X-Forwarded-Encrypted: i=1; AHgh+RoUpX8qKfLIUdk2srMGxrmg++ad7M90fBfNfb4hrcqOa25M45fl1GXLxwr3VHOsQK5c24rrA0oNUBbG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5COxWJTWG83709n4hG+opcDTGTE1INlknC5rTyvoE1NiL3pl
	Dav6TdHSoOF3Ji18kDXqJW3cFPHbpvbyNrHnSX59DEwATl6xpBw4Z6wYBCvExnkQVBScObxwrf4
	Xx6Qy8gudPEYhhfaODfVBR/wThDNBOjGVSSt+PlLkrocWaPnrCDQLOkTDuBTU0nBO
X-Gm-Gg: AfdE7cksWvx4WeUO7ILtEdTm2PUjn6a7G/l0LypZronC/29hHuf4WVIPw6/aUl5jtw6
	oJg2AOD6srYOXgGEj56UpCRUPv6q9kU+OfcwiiU7hMIDXALTweEVvgsBHEKGD+Gwo4+DvIXqEZS
	uRJB0+blT+QXsPAefjki0WvuVufbB6GRhgj08Uuh5woKLrZT8kwYtvt4q0Kn2u3EVQoRDiUsEhk
	Wqdyy885NB8rxgbc2O80bzjFEKj9ymdWNuFN38AkYm3fa7syMbVKrsVf2PwnM5ZPmHmAwbA0a+I
	R07+h0rPi0PxNnxs4JEVBxVReHqPX6nHMufIgDnoyRxUCistVcYFE+EY6w0H7qBDCQ0L0BS9VRg
	KX1UewRexBCFO2d971rtS+zC2OYv7QMGc9KPiir+AgTp38lHtMUBzzYkTdB8o1z/2Ovr9ZyZcKb
	MK8n5j
X-Received: by 2002:a17:90b:2692:b0:38d:c834:24cf with SMTP id 98e67ed59e1d1-38dc83427afmr3157838a91.23.1783789816563;
        Sat, 11 Jul 2026 10:10:16 -0700 (PDT)
X-Received: by 2002:a17:90b:2692:b0:38d:c834:24cf with SMTP id 98e67ed59e1d1-38dc83427afmr3157810a91.23.1783789816092;
        Sat, 11 Jul 2026 10:10:16 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm12943635eec.23.2026.07.11.10.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:10:15 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 22:39:53 +0530
Subject: [PATCH v5 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-shikra-usbphy-v5-v5-4-229ba3602737@oss.qualcomm.com>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
In-Reply-To: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783789793; l=3641;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=oVC5UqW8EITu6nRZcu5QBdQbzKRKDsRDWUWaypx17T0=;
 b=08IJb8l81knSvutBM5fHX6e0vukIowWGwRGgNQ39+7oMRJhSgBbPrWK80T43xqvdUtb5+JTHX
 hU9vbGCIoo2BOBoxt9kPbUBnRA5yTM5PvxhMk4BZAunw+G3i2q1Av4X
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: acmmWp3tknKEb4SSqJmb8nlNIrV6EwD6
X-Proofpoint-GUID: acmmWp3tknKEb4SSqJmb8nlNIrV6EwD6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX2k1O0WfNZarc
 PZXWE1PVDi9Y6JhBfIxPvpszYmLGW68pznRDxLKUMfJjYj3SerbFdQWvcnHQZ8MN4NBBcApAfM9
 F4zm5X+UiE/Wp+sZOUnQ9FxJp3MLpng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX1x6DBO1o6XHe
 yBA+SU5KAdTbJi8uArOrzpNcu6pvacNlEDffYV1xmwgkj2/FnpLPd61tnrkMmKq8BfJOvCLmcAK
 TD72AWVauhLy9pLc6dfa6H2HlhOT0QBKuzlBkVaer4bgayotS+giD/3/rL9wmgFjG7FU4Ge9BjQ
 fDodDK1QJDXS8/b+yCdw+0dVjBfP9vesEvfuc2gWvYEVmoV150mIJdNBdf48TiPD1xvMJ3y1UNE
 +iPftdeuDWVP4MjbeLcNJeg9vd9syW9Mknzb82jnMpto5GTyBcegaLsSSx3PhDeRg2/6KNTNBPA
 76QdRzOMlMg1UVNx+WhmFpB52w1PsQOP3bmcKzr1vmoowGbUmwGU1kb0Q2QkgW+v6Zl5sMKr1zU
 7mYw/Lf0WHBt/tHx5Wx5oEXrqqacIv/1tM0oaEMqnxfBtOGMOwONbvfHhGBBGY10YeWBKTQpEIp
 3flGVMBTEzhz88AX46w==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a5278f9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BrUXx0GcgBZ9W2fV7PIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110173

Add init sequence and phy configuration for the Super Speed port on Shikra
SoC. Also since Shikra uses 3 resets, add support for the third reset and
configure Shikra platform data to use 3 resets.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 53 ++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index ab3055bb5b0c..fa8492b487d7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -512,10 +512,14 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-static const char * const usb3dpphy_reset_l[] = {
+static const char * const qcs615_usb3dpphy_reset_l[] = {
 	"phy_phy", "dp_phy",
 };
 
+static const char * const shikra_usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy", "phy",
+};
+
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 68600 },
 	{ .supply = "vdda-pll", .init_load_uA = 14200 },
@@ -680,8 +684,48 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
 	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
 
-	.reset_list		= usb3dpphy_reset_l,
-	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
+	.reset_list		= qcs615_usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(qcs615_usb3dpphy_reset_l),
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
+};
+
+static const struct qmp_phy_cfg shikra_usb3dp_phy_cfg = {
+	.offsets		= &qmp_usbc_usb3dp_offsets_qcs615,
+
+	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
+	.tx_tbl			= qcm2290_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
+	.rx_tbl			= qcm2290_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
+	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
+
+	.dp_serdes_tbl		= qcs615_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl),
+	.dp_tx_tbl		= qcs615_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qcs615_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qcs615_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qcs615_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr2),
+
+	.swing_tbl		= &qcs615_dp_voltage_swing_hbr2_rbr,
+	.pre_emphasis_tbl	= &qcs615_dp_pre_emphasis_hbr2_rbr,
+
+	.dp_aux_init		= qcs615_qmp_dp_aux_init,
+	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
+	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
+	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
+
+	.reset_list		= shikra_usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(shikra_usb3dpphy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 };
@@ -2019,6 +2063,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,shikra-qmp-usb3-dp-phy",
+		.data =  &shikra_usb3dp_phy_cfg,
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,

-- 
2.34.1

