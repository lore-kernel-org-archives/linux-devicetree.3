Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4022A3C8737
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362175; cv=none; b=cFAm/YB7FZBw4Fx5E7M/tmQvUe3AB0BEobmRT+P0sA1mxZ2/2Ts7iAq75xKAgVKBZJqc4r/cuOQZ+3b3dgpMtAN3tCuKGVMBUmVg/4e0BXqIqHbUgXg+ovM9Mp8eXagMejHdAn+sc2M/gOb+n64fIhwWB2ChMXJ41lFYHoL2qQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362175; c=relaxed/simple;
	bh=Gp+4fjrebHGViPXeCSZcf6vjGYOVaOgtHIfa0J1CfVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J5M4zeydHd6wT9RZVzKoBc8y/VwytHymewTHgCjaUqJkar8LISLk9gQquThtDdDdDFY3HWPuT5RgcQtCYontMZjC2u77F7vGWVC1nzhN0BeVRScKcok2yafmuugqTsEPRmh8MFJJ02tUQdjfu8Gun9oeJYDQbpX6Nh3Jvn+S2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXDEaf13; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBVDpyxy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXDEaf13";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBVDpyxy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AA07gO009800
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLwV9vm/We3SoT9tFe4xuEP5t17LeVKwkk+uJZ4iOTo=; b=ZXDEaf13EKW+yMra
	JvyI3BYhtaG4Di23w8v4s+q/rVb9k0x6TrO9siF4Sy2I+Vfn/m3Z6mmDrLBNs6y6
	7sGtqI1OfdN9jWMQRjqXtFwVJ+qLceFqp5Xo64mPvxp4NcjRh6sYk4Iq7lbf+0Ga
	KxbGzw2wXm1DzAPcedfMVHGI3jJpisI90dI8c1hvwVkFIcEfl5Ve9/A8K36cXIhM
	gic29A0eKPB0VNxeFiHsJIeXiT9XhtOk5WNkwN797chf/CWjH5slO/vyDX/FlS/e
	jTFMsWxUdChJdu5rEdZIgwiEEF3pCmM6iRqCEtYGGiCqrw/a+1ItSHWdpli1CsKw
	q8ra3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycgerd30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so19295731cf.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362171; x=1786966971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLwV9vm/We3SoT9tFe4xuEP5t17LeVKwkk+uJZ4iOTo=;
        b=PBVDpyxyxnu5b4qGPLMt711kF2rrwz66RmDgMf8fWEgcOGo3WVwvaab2OzOzASMD/e
         vgcsQ+C5KhKQrqquQQ/a2sWYLaDPaPHNWsWZlogkhxEfItIMx5dC+6Nmo4HFKVc3bcSV
         57cYDb30JF+ZMdZRsaSFWenzfptgJA0MEOdQ4efMckGYG+4yfxvM5qyes+l4iRM/auBj
         REIoxv4VOxnAvnPmUZtSLkjJq53W1aX4LwHcFcfr7s97N4/mMUBrEvLrxTxAl6FfKkeG
         G4YHe5CrlD1JnLW2avZG69GTgpHATp4CGdylQAELg/IEJPOGIEARDYVhM/RAOF/8CPTp
         7bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362171; x=1786966971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLwV9vm/We3SoT9tFe4xuEP5t17LeVKwkk+uJZ4iOTo=;
        b=AkQEeMUec6TcMeSw4xJWn6KsCQCuiaDdx9B/uh+8x2wn2KXOaTs7QGe+oEYZhT8JR6
         xtTC/lvcTO97+u9ukGDYnB8tMsZajm1+rNtcVrycL1/nv3m9+ro5RPZ1MOL3FtABULJA
         tHp4p/oA++yR5RO7hRRmxEQ7CkuYHi7uuPU6E4/DGla80aJoOliV7qtfEiwRT2/2FsVS
         kUyXi7lvYMzLzL74v3Odff2kKygeufi5ZUHnxImMG1jxaabasyaKhCqqellXgC4LfdiB
         sRfuwijeu+rPr48v2fKjF6Y0XarRkzyStg2HMUctcpuXnA1EQ0T5MSRJxTU1BFg20Q1J
         OUXg==
X-Forwarded-Encrypted: i=1; AHgh+RpELR0T6g/9IpP7BaJ2SqlQJZczyh4gxhwfrb8Kr2s2IfEWUvRcYN5Xx+wmCuZ51UB0nxicaBlshTLI@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWSePcVMGKpgvRIPgqUIgTcvTSUX4VYTEOgv7XkBYqULBxMLx
	Cvy0ka1G8rHBreoOeBJB+Sb5HAM4qONPjEMPKHF6zjebqsDpz0S4fubHwBKpN0wCBOQP9k7IWnE
	zJvDhEkkNvCswPAJNl35/zqno44eAoAZvLtqcSJUvBqUoHYnHA121p71xynzBbdc+C1RXO8af
X-Gm-Gg: AR+sD10JS0IXH/4rImU3FxK+w8N56cvlF/2HDEGaokja1y91tM5UAf7n3Hk7rA3ISfa
	Zb/GSKLAUBtB4wxUGK9vqn5vJaTbXj6mxmlL6E+wVwt+e5Yv+rHiewWTNY2Oxx/4EayAeDgDoCA
	tBq6Ce/CTY1Y91c7DbcWO1+zNWjqD2EDKTyp/yBCq2AT7DkEV2v6KRinWUNwdqS8lsJxSEQC/6G
	c45brClUUKtToEZv/Q1aZ1f+F8ITe9pQe2g6YsC86aVUdsW+FqE4uq8IveeFe07mgFNG/L/N+5q
	vuf/sIrMSUe1jMA+Umfy3acWfK5wJc2nttcTGKRYVFyQIzrTU6psskd8D0lIG4LE3JacqkI1aI9
	Rl63SDbmpgt2jHeK2exEcTDJpqNUukVWJ3+XroCNJvf9fJTBiTyaXiQtzdRS0pdpaEPnxk5Gx4e
	wWYxhXNrMegfp50g==
X-Received: by 2002:ac8:5dd2:0:b0:527:631:8d6 with SMTP id d75a77b69052e-52d4bc37c64mr9594821cf.25.1786362171075;
        Mon, 10 Aug 2026 04:42:51 -0700 (PDT)
X-Received: by 2002:ac8:5dd2:0:b0:527:631:8d6 with SMTP id d75a77b69052e-52d4bc37c64mr9594151cf.25.1786362170259;
        Mon, 10 Aug 2026 04:42:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:38 +0300
Subject: [PATCH 08/10] phy: qcom-ipq806x-usb: support the MSM8974 SS PHY
 parameters
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-8-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4122;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gp+4fjrebHGViPXeCSZcf6vjGYOVaOgtHIfa0J1CfVw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkpTY9USW0REuQQqQ2Olpa89R8QdYg56PPWA
 3t4qGnRqWeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KQAKCRCLPIo+Aiko
 1RKZCACFCjQQApfYkkUl6uHc26z+WQ3wEx1d0NVzQQasSXVrdHiPCX00a9MBLWlExGHHJwxC8kO
 tgL+HZQDRDluq4sz1198HY5Xc+gHAN80Tc12fK2kqeHil7uqkeIUt41fOJWZHPtg5Hkpz4naukS
 rUb94CYqa4hJ/iTpRCVcJUobvscILkgiDKcV6de31eRYTHUTa0W3TrPSNWlNzYPeX7TXCZ3qtXa
 /fB37G78EIffA1Oa6bL6H/m+xfXYXcNdP7j73JKacvGx0C1UHSmI+tCCSfd8MmWW4if3Zb7tP+p
 +0cBOCCvZ4McDCADKiY7hwmiLzny/y+/4KJMbTZhWIjlpREl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IzqaLUQoGAXc23g04gO9kf99CoxM6E7N
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79b93b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=nQrtOHMqN2DZ12z0XHUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: IzqaLUQoGAXc23g04gO9kf99CoxM6E7N
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX373sKs4vdSlR
 CLvbyPcgH/8x2KmWyAEMfmNKXXA3ILyD4tbgCzBj77Sa7VLHMuFYmdr+POZ9YxyVqtzo+0DcAmF
 JmljOmXkqGUdqtv1rcnQo9LT2WzVDWU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXwW2qYL9V87R6
 hblr+jq7/r99tXPai8HSCXxbXaMYtPU7bV3r5QsrdyQriWQmv7blRt7ljPnlYaZlc6+nfjmlDku
 z4SeEWqAL7njMTSxEv02aBkAdg7SwqKh/5W/r6ZlGHa822MOfK4wBcl0oasBOIOUeFJE7lvCu/E
 76yJcCjuBCdDRCUaCvjZXvMZLQ305LTpHpQueMLEI7srDaiwZkp3IQ8Cy8WAkLd6traCsJbvCh4
 d+TI/2AjYYxIDTBUKV8LnFKjpi+D64iZDfDfKMD5wTATNki6YJ3sryckfowOnjaBUIgxKTiqRlN
 qBMHrOnOH/Tq4jBP3LC7MpWz+r43hHdjtqU/qL2hx97XpFZ5kpW/uCOZnt4Soo0ewtuY7FQRirx
 Yd2KdJFpXHatYP+tY7t9cvUetvbFkcDJ5Jb77yM7EbDMWYlfDAKVR9tH0UfON+RT4ejDq1n8hcc
 7npRSc3S5k6J0rkgOuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

For the MSM8974 SS PHY instance the vendor kernels program analog
parameters different from those used for IPQ806x.  With the IPQ806x
values the masked write-readback of PHY_PARAM_CTRL1 fails and the lane
runs with wrong launch amplitudes.

Add platform data for the MSM8974 compatible.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 57 ++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index 86e8e869a743..35abe9ae0542 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -142,6 +142,11 @@ struct phy_drvdata {
 	u32		clk_rate;
 	u32		hs_tune_val;
 	u32		fsel;
+	u32		tx_amplitude;
+	u32		tx_full_swing;
+	u32		los_level;
+	u32		los_bias;
+	bool		set_deemph_6db;
 };
 
 /**
@@ -322,7 +327,7 @@ static int qcom_ipq806x_usb_ss_phy_init(struct phy *phy)
 {
 	struct usb_phy *phy_dwc3 = phy_get_drvdata(phy);
 	int ret;
-	u32 data;
+	u32 data, mask;
 
 	ret = clk_prepare_enable(phy_dwc3->xo_clk);
 	if (ret)
@@ -414,7 +419,7 @@ static int qcom_ipq806x_usb_ss_phy_init(struct phy *phy)
 	data &= ~TX_OVRD_DRV_LO_PREEMPH_MASK;
 	data |= TX_OVRD_DRV_LO_PREEMPH(phy_dwc3->tx_deamp_3_5db);
 	data &= ~TX_OVRD_DRV_LO_AMPLITUDE_MASK;
-	data |= 0x6E;
+	data |= phy_dwc3->drvdata->tx_amplitude;
 	data |= TX_OVRD_DRV_LO_EN;
 	ret = usb_ss_write_phycreg(phy_dwc3,
 				   SSPHY_CTRL_TX_OVRD_DRV_LO(0), data);
@@ -433,18 +438,22 @@ static int qcom_ipq806x_usb_ss_phy_init(struct phy *phy)
 	 * TX_DEEMPH_3_5DB [13:8] set based on SoC version
 	 * LOS_BIAS [7:3] to 9
 	 */
-	data = readl(phy_dwc3->base + SSUSB_PHY_PARAM_CTRL_1);
-
-	data &= ~PHY_PARAM_CTRL1_MASK;
-
-	data |= PHY_PARAM_CTRL1_TX_FULL_SWING(0x6e) |
-		PHY_PARAM_CTRL1_TX_DEEMPH_6DB(0x20) |
-		PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB(phy_dwc3->tx_deamp_3_5db) |
-		PHY_PARAM_CTRL1_LOS_LEVEL(0x9) |
-		PHY_PARAM_CTRL1_LOS_BIAS(0x0);
+	mask = PHY_PARAM_CTRL1_TX_FULL_SWING_MASK |
+	       PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK |
+	       PHY_PARAM_CTRL1_LOS_LEVEL_MASK |
+	       PHY_PARAM_CTRL1_LOS_BIAS_MASK;
+
+	data = PHY_PARAM_CTRL1_TX_FULL_SWING(phy_dwc3->drvdata->tx_full_swing) |
+	       PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB(phy_dwc3->tx_deamp_3_5db) |
+	       PHY_PARAM_CTRL1_LOS_LEVEL(phy_dwc3->drvdata->los_level) |
+	       PHY_PARAM_CTRL1_LOS_BIAS(phy_dwc3->drvdata->los_bias);
+
+	if (phy_dwc3->drvdata->set_deemph_6db) {
+		mask |= PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK;
+		data |= PHY_PARAM_CTRL1_TX_DEEMPH_6DB(0x20);
+	}
 
-	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_PARAM_CTRL_1,
-			       PHY_PARAM_CTRL1_MASK, data);
+	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_PARAM_CTRL_1, mask, data);
 
 err_phy_trans:
 	return ret;
@@ -500,6 +509,26 @@ static const struct phy_drvdata qcom_ipq806x_usb_ss_drvdata = {
 		.owner		= THIS_MODULE,
 	},
 	.clk_rate = 125000000,
+	.tx_amplitude = 0x6e,
+	.tx_full_swing = 0x6e,
+	.los_level = 0x9,
+	.los_bias = 0x0,
+	.set_deemph_6db = true,
+};
+
+/* MSM8974: values from the vendor phy-msm-ssusb driver */
+static const struct phy_drvdata qcom_msm8974_usb_ss_drvdata = {
+	.ops = {
+		.init		= qcom_ipq806x_usb_ss_phy_init,
+		.exit		= qcom_ipq806x_usb_ss_phy_exit,
+		.owner		= THIS_MODULE,
+	},
+	.clk_rate = 125000000,
+	.tx_amplitude = 0x7f,
+	.tx_full_swing = 0x7f,
+	.los_level = 0x9,
+	.los_bias = 0x5,
+	.set_deemph_6db = false,
 };
 
 static const struct of_device_id qcom_ipq806x_usb_phy_table[] = {
@@ -509,6 +538,8 @@ static const struct of_device_id qcom_ipq806x_usb_phy_table[] = {
 	  .data = &qcom_ipq806x_usb_ss_drvdata },
 	{ .compatible = "qcom,msm8974-usb-phy-hs",
 	  .data = &qcom_msm8974_usb_hs_drvdata },
+	{ .compatible = "qcom,msm8974-usb-phy-ss",
+	  .data = &qcom_msm8974_usb_ss_drvdata },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ipq806x_usb_phy_table);

-- 
2.47.3

