Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49A33403E5
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870147; cv=none; b=piDm+O7a43uJExIi0SwNwu5niO8amUqPjzuoZon/XQID7fZtwZPqrKszPZHUYiIUldnoLaG11eDRy9+kTgJImnS3/65f6pPFh1VEf+9a+yr7Ea51kWqAa3EzKmnyG8QcvzKbnd4xoVqVOI1F6OVY7r6QJssBNpiWeBRERt8SQQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870147; c=relaxed/simple;
	bh=oVC5UqW8EITu6nRZcu5QBdQbzKRKDsRDWUWaypx17T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qX9BSCzRjN0pYtl7MIlvkBw9T3O0kV6yyZ6/AUElXGqSLLxM8+/wLBUq748f3iaUK/jtd9xy+0ArDoS5VTTIbbh2Gj10Zl22yG8BT4e8d85KnRLvBB5JuIlwFSSxETfTthBGvpycMzqDxxA1f2VNxMdwLuXVTJ3vST2Beubkbmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1Pj/Xto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2xTVFNj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1Pj/Xto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2xTVFNj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZcnI2749759
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=; b=A1Pj/XtoFM7XxHP9
	wyM2bF4ZGi5BIEC7PnO/hKbzUNB7jhk34it6ZLZnh8c5ABfIPZ040/liTxz82J9S
	b3cAStN8IImP4IDURDGv2yqvdEItX+9k1FY7acfxuliGVzF8LEqIddZTqFtnecTg
	I/5USWhrG91HSX2QIgEgVHit9phDX0mwiGosn7JOeIYcu6HMpLG+tBzkPF/OaWMP
	1bV6OTLGWt/HSuAAgiRFwnO8ajoH40yL1sXTVZVabFHXSq4VX+R8pcJlBDXvOF/6
	+iEhCMoxSpMRY7+bpw1JArN4EWwmkaJRouLdpne3/k+gSx58PhPIjWV0Z4MDdEVY
	ia52gw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgk26m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:29:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so3591486a91.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783870144; x=1784474944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=;
        b=f2xTVFNj9u48A3Xc45H9TbQYdNqNN2gY0nWyfYJa73RYUdOxTBdymJ99shKaW9TYgY
         O+GTbJFmb1mstuUjtX1fXPZ1yTcU1Tzb/eYzBZ5UEwqinvFGdH7WDrXhbACLKariRbpQ
         sdwKq/UaRSU8ZYw5H/IMVa7hs64ezoMEQvmdJDo6b5GnvjD6+DXBA0QQeNZutvyG2CGJ
         pOKc30dcFUVcw8c6RUxfUs65HBQ2cgWxuSG/e+J7yjqhBfafY2Iugq4BkTUqy2nxvzHz
         NWvVayvhMru10d26PgkdyVolpPVLItBH7s5OUguR88mVa68Se7hkJuuRO6l1kOvLPy2u
         92Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870144; x=1784474944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=;
        b=YVBkF8mZx2QVKFDppDDRE0PJVhbOmFrFAyxYiQaYBDqfNXkWsHDfIpVYlokMHepApq
         ngygJLh/+2wPMzT5IxGDRQYGV6uijGBQiIxSmuMp/brqf37Ub0ych4awSpWk/CbnmrJ5
         IaSaSFyD9OevJ8ALqdI5cK01OMMsx+SvpIFCpqP871ZDk0DenE1G6vWjLP5RNB5xzNel
         X/yhoXLOaa7NKytjK2s2q2sOBvp9GY2zAXAMeo0UjTZtLCzTmHLbuihoKeXRS9pk8xLO
         y4uovfr+y2Z6ibMcmcAY3AFERdin5C7vW7xFUSkiZuhI4/WfNM3sSFt3LAvPydpx/KQv
         2kZA==
X-Forwarded-Encrypted: i=1; AHgh+RpngFiQngmWLI/+yBOYJOiinap/k07ZroA36sZN2uwQSlKxtl6cvC1Y0JK+xhWSCvqs3mfx9ScPZHzi@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVcesfKV4dz/YQvfzKwY9h0iCJBqtVTXbH9UqSUdXcjcufEW8
	nh0gHDavrWlv8lGSBKoyw5T9oilY7SltxUC8GA1qMb0ID/JCKH+vKb/F5MWVaDAFlk6e2u3bU7B
	pjXU8J2p59cOQvetN9Bu4w6ugKuZSTMB5XCBeC5XjV2hSLq/+MJQDaRG0aADtJf7S
X-Gm-Gg: AfdE7ckrm59yw4WFxAoR70K+a0TggKvugq0gljDnwQ1Om/ZvShQIW43JxstclDYRGWE
	+nmpLhPZeHWrMFIQwUBfSl4QT+5brtzU72xDxZzkUm5RJO43d8Mptls3J71G04kuyxm7H79B524
	cXPFWH6YQi1Ky/EoVI+DgBvUdY99zjX0APOrXtna0wOJNLx755KB+vRWp0T1D8ZuR/D4rEBwFZH
	DvqddkWAw6MnYJP8ZdBeIi3ZBhuLGzOeq+GuntKfw+gL6MvGNliXZVINolP+84XFkMwESF01vJm
	ty6HRIXc6+QvpVgcxwdfem/tczIEIzYiLeKGMyvh4QO0nJRQmQiIwl581pjofxirVzvj7r8Smrs
	eRXMvz2dhGOEWuk+S48AJgwJW1Uf0XoX1k13wFeE35OIschXybtEjt3z0KPqux9UjnzZ1y+ZEOA
	zOiTYL
X-Received: by 2002:a17:90b:3d48:b0:380:7d9f:81f1 with SMTP id 98e67ed59e1d1-38dc74c49acmr5752053a91.3.1783870143678;
        Sun, 12 Jul 2026 08:29:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3d48:b0:380:7d9f:81f1 with SMTP id 98e67ed59e1d1-38dc74c49acmr5752030a91.3.1783870143229;
        Sun, 12 Jul 2026 08:29:03 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41458776eec.24.2026.07.12.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:29:02 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 20:58:37 +0530
Subject: [PATCH v6 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-usb-shikra-phy-v6-v6-4-1b3e51bf1541@oss.qualcomm.com>
References: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
In-Reply-To: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783870119; l=3641;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=oVC5UqW8EITu6nRZcu5QBdQbzKRKDsRDWUWaypx17T0=;
 b=ozQP1pweyGshCDvd+NcotMZ7kuQNMugzameQ+w6DE040egIGNtWEoFD0v5l+9kJJkxHe02vRj
 +lF10hlDN1nDA/NZtM7rN7iPAArBalmUkgiVo0bCuEx47OXgaedPEDu
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfXw3dEhj2ZccOT
 9sQrL7BQeOAeb/7+DFK6yJ4ciTCUfw4y6xXZLEvAlngv1VjqTaSbClzPCR3uF4/7HBwzbytVALU
 WPHprO4TrsPWjkMULB23dKEet5AQM0E=
X-Proofpoint-ORIG-GUID: wIk-kZQhfnHPaQLXIEATRi_q8O_doO2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX5OZpBAQF4ZvZ
 7VbO9shKLe3i7SGIxKoF5UVMPwoot2ZRlc/4PYgY0tJekNXtyScc3PtsBUo2imdqLN95OxHJ+e5
 KIb6s72/f6frNEjowB+QudR/FaHpEzjSR21W+zQcxwWMDSrL2Zx9GagGgZjKJQwVM1lcCwG5gFk
 P41TumUGwyktSf3AQoG4Xc5qGnDLyZcxzLpcArSwlMkzxKpIPfbEu8gRN9wXdP5kKsazOoQjsws
 sp9fpskIzCxCN7vaaflewWfO/mDyX2YMbKRirVhqMfBwbnV3lf+pTVCylqFnqp4oQT21RPBA9jv
 kEoP1dZmpfo5rpCy53nYoxzH3mVxIt5miuiEKZfYArYFrGehj3OO6NgkO5N/c+UfLU7bjT4+/RN
 /pw9ZbL3nM/yhbS/ym2e8C5Z5Xu25O5nZs0lRtyc/bJ/6+skN5gmbERNESj3ZKpMTepSqKUVSfK
 szKl1walOiwQ+fBtDmA==
X-Proofpoint-GUID: wIk-kZQhfnHPaQLXIEATRi_q8O_doO2G
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a53b2c0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BrUXx0GcgBZ9W2fV7PIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120165

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

