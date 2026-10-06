Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5392C08BB
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 05:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264586; cv=none; b=T+YrkKkeQSRRMxI5NYs+g2iBlCYusoYkIjQVRpXI6uC4psDdLqMadgSEEsQFInscRU9WPXecA5GlFFLfkFcBtJZPs29LRAwzZHhnZ0jOtJwFvFRU2EXX9+w1XaOIUG5nadhz/aL0vzUQg8ntvfGgblqq60hgO48VIr+l2r/KKEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264586; c=relaxed/simple;
	bh=92VTVmAvn8Sh2d75pZt6uBGpbDl9iktIEZpbxFFjG80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPjVrOrEQ+ccSHp8USYBzMZQljxyyKNtV35t/IDiLvf7tyYKxCbjj5o/O/e1Sd8wvoN2iSVX95xWY9o7QBvnysIKWDrmZlg/WbkQNShb61IRdaBsaxZCjXfVMx3+FYhNUwM9OjkTTi6lSm4mCLxwNLA/888ktsbKRlSXJgbToII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2q89fR7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9VfFwXB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2q89fR7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9VfFwXB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AOXV3450491
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 05:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODm3ReSMTjl5zs5x3r6cW6xoGkQHodrD37gUV4aLrvc=; b=b2q89fR7H+TNGJL0
	PTP33aagjNGkZpZ83lXGesTsimGcosYswCcLyWdK2a2JmB5l1rVhBJ1GGTXK0dij
	ZbqKja9NeCVWbL6fMNiAnh2jrg+W1nIlbvkPaJ9jsAM/VG4wU47pR3azGafah9ib
	CrL70znYfwJ6CAoMSi6mna1bKMjXoz6EYlpcL/5wju4Lrf5TEeyS59fAScCw4clf
	ncLOFksQ/dXijjL5uAfGe3J0wq/zbdnwg24omEJRxSmHAUIA3wPjmO0ygiUxg9bA
	aHxXbMK+mOf2Dx3TNtFk66Hk6JjzLbzKfxk72GEgs1EjBkZUiY/2/kguwMUKUOBy
	0I4I3g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7durf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 05:29:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so4990943eec.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 22:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264582; x=1791869382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODm3ReSMTjl5zs5x3r6cW6xoGkQHodrD37gUV4aLrvc=;
        b=S9VfFwXB4xZO4qetw0ng9m5lU6S6iNJr6UeuRbQqyLdSrMhUCPt226nJNIJmLpXQCm
         NrbgBS5db+lBA4iv+d6k/kyfe6gB0G70CJQjPuo/FKropOXKEFTIw6Oftv1JhwglXUdl
         wJVRDOF7Wnw3TTwLOakZ8lM2WjibzcZ5QXFnIZT3Dz4cqE20CVPPWHInS8Fq3C5uGjXX
         HTNY8HRvhwoYvU4IIenoDZ0qfpn44insc7h8XR3Jh0ZqDHdtKh+OTyVTE4+hsiOCPqnj
         2Xdh4G5wbX17ENmfzGfTYVRWZjSLa1rNonZxHpqNz9rA31rQFJL0YAu99/cBI+eMyV9M
         vhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264582; x=1791869382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODm3ReSMTjl5zs5x3r6cW6xoGkQHodrD37gUV4aLrvc=;
        b=jhh9IFn1sAUU+S6wddilFnG0JBca78zwLJ+Ud+Pj6XuqGEZ4XKnnNor+JaoX+ejRrg
         6UgrLOStZdpSVgWC1JTS0uA8yprt5ahIikO6wIzPfpYk/eGl63YUnvsYDjh/hH3AcLcc
         OJXYGfTuu3EP2vopZEBYyLT7jrbf3OvVJ2o0jhLXubHeVN4Jwf2acIB5e7RDpVLP0bmt
         eE7JKrrl4zBMXfRPgAEeeHohITUIfjWdi+y7rxaR53LykrLdlaZczx3MWw87mKPt67tG
         mDOMGUQQFPay4e6rsPxtEDIrt0UE62jJiZAmjDdH4Qub6wFVtaDxk+YrnCAxvA9ipcEX
         Y1mw==
X-Forwarded-Encrypted: i=1; AKwUvBxpUzSoUf45pSEbCk4dNsTpabqX8YVoD1jAkF8zptJ+MrrekNNiNZqTPhd9AQUjWy1Dtfx4JLsfe9yr@vger.kernel.org
X-Gm-Message-State: AFuF++kLjcieK4mlJTCfGy7cponBZQ4PxH4k/XN4ouw+hkyu58UGYpio
	w8ciYqc1cgFgaM/RavSwW+RnV7G4vg0DrZ/fbpoYdeSSKM0v4FPP+rFDy4VwdSJf+S7gC6sNO36
	UC27oK89lF4L9rF1bIBPTU29Syoa4Ggm+qYCW+xx6hA4Bntaoko1IW9K8S21yM5yU
X-Gm-Gg: AYBFou0sfAXEwttg8Ou0JjieA+Sw3FyHXAOjoPCHqgoxZ3u7eh7sJmT/XywrpDIpucH
	vuCSrp1XtRwAiZu8mFvWlqJ216+YLgJRaAMogKLTgxNrLNEqDYgU8YYDMd5rKtCThXn7ALxhiFP
	KPqsluAZeRstXYFa4iBtq9pzS4amnzoaA9Xi4A+zeA0AqfjDP4Xn/q8WH8GjbhV/TDCjGyhrVHN
	rwFEOlomEuv+qtwktDMckbQWPN62jlC2phYe5tGP4dIPniG10v+7+0O05LlN0VjhW5AfBFr0Swq
	ntM7pEKbiTDCfZLY21z/IdmR1oYrPEsVsBDvDbILRUuDD0T2KUbYdwgOsaoOWeMqxE9TJyBNhUy
	7+/XLNgX8o1ZqXtmytPXzVYJhEr87IGj8MSdmTfpteKd2A2a7PqVef7ecLM81IAM2xIlkyGUygW
	EV1Qt4RTFea9elDBJWAKZ35eGxrYXF
X-Received: by 2002:a05:701b:2713:b0:147:9ad0:cf25 with SMTP id a92af1059eb24-15ece10c1a8mr566566c88.46.1791264582161;
        Mon, 05 Oct 2026 22:29:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2713:b0:147:9ad0:cf25 with SMTP id a92af1059eb24-15ece10c1a8mr566544c88.46.1791264581579;
        Mon, 05 Oct 2026 22:29:41 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:41 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 10:59:17 +0530
Subject: [PATCH v5 3/6] phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY
 configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-phy-v5-3-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
In-Reply-To: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXyiP5mk4xMRx9
 6bav6MQi0oWYCEcgpA/V48vod6SSTZkTc5GqrslsB9wHssaGtucSlbIcalaReLKplLdcQxWuKBV
 c3zIUNBJr14m59xX6mofgJ9xsf0z/f8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX5W1DQyyNfyqe
 Ks2lqJBjS3HwOAq89brOK8Q43Cf47hu2L/ZZVhUHrdugwOzImO2ddG7KcydHY2lDycMMAKo3Glg
 NF7hFn8U6lszb3C/wIXbAKs+AhL48MKKTOBo2t448d2jXyTItZCoNhCT/wa+di9FUGUV6XSz87x
 07LOZvgTxnX++4sQ10fehp7FxZyKQ3PC4CrzqKcrrHiWg+RX8n1RvEN0FvJ6Yqagw27RKlPvRtB
 aKc3k6gIA5IVxkS8ArU4797T21v4hBWcCEU8paSyQtvay+M9Tw77QBXS1wQZTNJ7uSL4pqI0zXJ
 spUmF2oePcc2FWPt6JUlDfpMxIAoZdnCWsQe0m0Jf/w66VaJOIailStt+/k1LoNrMQ5iVG3zSLc
 tQcGzCcHPxW+NgNqY0RS6D0zi79P5Sx9Gwg08ifCddfkWaLUwml6N7JPvykQB6mXkGM9u6wXOz4
 D7bTAnEM3kx19sIfo2g==
X-Proofpoint-GUID: d5pzByvXiJDS3H1aRnq9Oqm0JUgjj_AY
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac48747 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1pfUWIqQpZhN5ooAS-4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: d5pzByvXiJDS3H1aRnq9Oqm0JUgjj_AY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

Add the USB3 QMP PHY configuration for IPQ9650, including the SoC-specific
init tables and compatible data.

IPQ9650 uses settings that do not match any existing supported SoC, so add
a dedicated configuration to allow the driver to support it.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 118 ++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 6a9faa0ce3bb..85f7ccdddcc9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -400,6 +400,101 @@ static const struct qmp_phy_init_tbl ipq8074_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0f),
 };
 
+static const struct qmp_phy_init_tbl ipq9650_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_IPTRIM, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BG_TIMER, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xa2),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x01),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xb5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x00),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0x64),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x89),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0x35),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RATE_SLEW_CNTRL1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNTRL2, 0x83),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNTRL1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNT_VAL_L, 0x09),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNT_VAL_H_TOL, 0xa2),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_MAN_CODE, 0x40),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+};
+
 static const struct qmp_phy_init_tbl msm8996_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SYSCLK_EN_SEL, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
@@ -1572,6 +1667,26 @@ static const struct qmp_phy_cfg ipq9574_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout,
 };
 
+static const struct qmp_phy_cfg ipq9650_usb3phy_cfg = {
+	.offsets		= &qmp_usb_offsets_v4,
+
+	.serdes_tbl		= ipq9650_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(ipq9650_usb3_serdes_tbl),
+	.tx_tbl			= ipq9650_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(ipq9650_usb3_tx_tbl),
+	.rx_tbl			= ipq9650_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(ipq9650_usb3_rx_tbl),
+	.pcs_tbl		= ipq9650_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(ipq9650_usb3_pcs_tbl),
+	.pcs_usb_tbl		= ipq9650_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(ipq9650_usb3_pcs_usb_tbl),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v4_usb3phy_regs_layout,
+
+	.has_pwrdn_delay	= true,
+};
+
 static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 	.offsets		= &qmp_usb_offsets_v3_msm8996,
 
@@ -2459,6 +2574,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,ipq9574-qmp-usb3-phy",
 		.data = &ipq9574_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,ipq9650-qmp-usb3-phy",
+		.data = &ipq9650_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,msm8996-qmp-usb3-phy",
 		.data = &msm8996_usb3phy_cfg,

-- 
2.34.1

