Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF65F3DA5DC
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 04:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521443; cv=none; b=W1H8O10u4/xbg+wTYZGV5abLSTFDsDx4fTBajWQmw/MiFc+guLKfEqznUiMTjS23aEZhtHV1Qc7/mjub8v4S+jLrtUIwz7RbTcbbYxY8fXz/sKoDSrgtNjd2m/3v21IcTNseCEWs0wqxQWEI4pz0sE05tLik6RiZGgUZBwI4aVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521443; c=relaxed/simple;
	bh=4kJL4atC4/h+ABJlhHOImqbF0XYVzauXvwrOqHpY714=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHZhlZB1uVn3Iv2zfCmO5JL5YIIZ/Utyle5s/arZq/07O9y/7X99NK8LToA5ZWLl5sVtUuv0o//pWgrBsGeSz4Li6f8XMsRMuhpMXmkLMvMo7zR6iZ1L2GsXUu6zSj+LO6KsJyQhEVHFREi0Q3d9HN6n/WBPY1NHTAK3ToezFj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WV1Gvbum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPH2krUm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WV1Gvbum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPH2krUm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HXKv3323146
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 04:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79Me7W2iKniVnetal+DAHqRpLGhIEUwBh9iL5gDtwQI=; b=WV1GvbumBbHSC27u
	NCuJtP143vNWChFtDnMGiqWhyluOSozTrJE+KCcjsaU4vaMepwLZPPxk2HdmhAAX
	WmZBZbuvaYBKIw1le1IdiWwM6P8GKoC6LKf3lso6DzCAkCPJGYN+xZQ2NPxgpWED
	wR6EOhmn/8NTqyCimGsD7dwSEx/+z6FffsFg7RHhAlXDTiLbXbug/VgLrM+NQCmI
	Kxm754TwHubaCTJXMyPWfod9fd6m0n9hPRqTg97eQzCvPvNMGq6huPO/eHjvdh68
	s6mrrnny0yrYXOiSQon1KHExQxukQupC8w/9dsiY7j8zUFpbfx7uhHePlPeUlMOD
	K7Bh9w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5a7fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:50:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so11465902eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 21:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521440; x=1792126240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79Me7W2iKniVnetal+DAHqRpLGhIEUwBh9iL5gDtwQI=;
        b=gPH2krUmvLc5jmA0izvEaxtNC+iSg/ItLyKB23A7PhqnNCaEgTIuxL9cpyQSZHw79c
         Bm6jCZszgPKtRRk/sWUDqwr6Mbh1gbkBQ2AbgDdXUJdiQZm8/F1fhyNaPOsDvkVCJWOV
         KXCWFgaPQxx+Zpns24098AwLNmoephHmShSZ5c0u4/kkJtlhd1WVuwfO5OwZH+QBGhPT
         KXa93WytUJSRZKhOXrJcVMcQ1rRPjmVgk4qqvDH24QuiDXBSKtabYXQKy1z31pHTuFQQ
         71J3mIDL2gj24Av1Fmv116PqJyOn+kChxrR1h6ushVlRFhPeGoirHb4UfoIf7lAvusV/
         mrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521440; x=1792126240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79Me7W2iKniVnetal+DAHqRpLGhIEUwBh9iL5gDtwQI=;
        b=sM66owa2dfYYNkzncjpOVg8Fa7R2FvNk/Jf6s0NNqF+3jo6fbOaEfEoIGgCF9INjOJ
         vC4TInFH9krBcbmGN8nHXoZqlOevxO/dCjBMBni/o9lAhV1zOdYq2lRibhrIw2y88BnV
         2iUGpqDi3Qir9peQ8x22kElgUJuomQC8oT+7gQhw+tQM+2bp/s3udWv66yWdx7M7JX5q
         +z4ArSyU0F6Ojsjh4id1FOJigvHOOfGOWYzJcFhe8fePfAo5oV7U4yw+jplx9on4OCfU
         JMSxRT7is7wRPsV+M5NAGG431QelrFTj07oxCPnCqY+oNGH2+CQisMh3jUysvLKtIxW1
         3P1g==
X-Forwarded-Encrypted: i=1; AKwUvBwBxdVw1w7VL2Mt46K5hRN4D7EphIMgmBLA+2qnrUjdpZTSCJvIA4Vw/NiA+UPFma55YctxhLT9wzYH@vger.kernel.org
X-Gm-Message-State: AFuF++kVeg2F+Tzq7tj4BTdaXand6fRefAYxzRh83aMwNHJ5CrZxlxzE
	hL+m89JwvdUO+MhXU+X4q3eQVhbdB7xWpdkC4wkWM9jDRZYEG6gqVPkpiIJwlaCoU9PDeuMyG2y
	a5G1l0fXfC/2jPRcG1fi9nX0YjoKegrzlZ0pWOrU4JEwN/1zONr8m2fzd4rUQ/fvc
X-Gm-Gg: AYBFou19UT0lq0r6HynQWcP7I8mcVgzdACumm463rPLe13fCYo4x26kL8lD2MlHazEV
	IbUZ4+TCoCnUYTTu6vP4s8GhzgcJhShBQSEnp5OGjf9ceMTFhUhX++uEYe50M5G5n0+rKJ4YFNG
	yYvKrj2UGj/pcFXoToKPOLX90AB12lKLw25hoSMU/NTnMj3jiEHrqmI0wcqc5D0FimPrNHUvXI2
	7O6cDMl3H9DFq9N5gJC9Ak2BGDZ4Rcy3bpnwpzYBoLMC5tCj1AA4Pfdq89wnj4Rj0cJPa38mqF9
	AZ5c0GBnsDVhLSOkQFfJHJ0MUnTrg1cXN6HlsSkwz8uSxPcMg2O4r6zMQnO2J7BbG1jIUm3UrZh
	dsugTqYAsUhyNoLU03qsT4LBiYazaNWmby/i5apOm0MppqX4Xabf5LXHMoUePaD9kXuIyZH4l+I
	UyMX0KbV2LFSW4ijCHXOCJHBsBRznklA==
X-Received: by 2002:a05:7022:e888:b0:166:97d:4579 with SMTP id a92af1059eb24-16a5dbfdddamr1088007c88.8.1791521440252;
        Thu, 08 Oct 2026 21:50:40 -0700 (PDT)
X-Received: by 2002:a05:7022:e888:b0:166:97d:4579 with SMTP id a92af1059eb24-16a5dbfdddamr1087965c88.8.1791521439511;
        Thu, 08 Oct 2026 21:50:39 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:20:00 +0530
Subject: [PATCH v6 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-6-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX/zwecSzsGOTw
 lq67DPZieFAb6cPjvBsV5uhk5/KsToZ8Sev2HzzChcg93SCozvWVnuhSJOKLlfSqpd8YIzHzEgg
 mkt9xb/vXijbDHSSjVBJA910HqKcnkQ=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac872a1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uK7fivOqSnnNXXB6uWgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: cu1DoMlOFhIMk2JsAZDCVJrxeH56069S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfXx+zBNoZzaY+T
 M4LMl0CCM9dLm5tdf3lUHWPV77MX0GsHRTzxvSyXxsPpwEwfHxwhPgVglEJGcXQNXgfIgS17UzW
 tmirGbNpYAPLw+KWZqaEsfVKpGxb3MUrFXWiThghxzebAkPbVxJpBflVKr7e59NrWfL/ru3Dn7d
 lFJYndoe+UrQN7XZpT/lm8nHnDE05xesOe1PwAg+fTnla7/WEz5ok/O14S1D4hRgFktCSMZnszQ
 27Ey9VXdjEX20aSVE1eb0Qtsopq4ndrQdFLD2tyF3xn0LAbdRQLHkzgumJ2VeTVnkROOkEVsN3Z
 c7JOeasljK0CZdakr7IMA41ZO3Bw3WZBlrUwTHaVJitD+9eRpMUCLcZ40vGBvrEekpsfqg2OHPi
 RrC/8CIzdiD1Dn+pk/Ie7nWx+tIuOSKxhK50nRwXANRf8BNzhrymycrr14x4IZ9bblHOifjpz4S
 gWaFlcwdGHqkcGgA/8w==
X-Proofpoint-ORIG-GUID: cu1DoMlOFhIMk2JsAZDCVJrxeH56069S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090019

Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
on this SoC require a dedicated init sequence and override parameters
before they can be enabled.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 63 +++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 2e37b39dabba..0dae8369671a 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -29,12 +30,15 @@
 
 #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
 #define POR					BIT(1)
+#define ATERESET				BIT(0)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
 #define SIDDQ					BIT(2)
 #define RETENABLEN				BIT(3)
 #define FSEL_MASK				GENMASK(6, 4)
 #define FSEL_DEFAULT				(0x3 << 4)
+#define FSEL_24MHZ				FIELD_PREP_CONST(FSEL_MASK, 2)
+#define VATESTENB_MASK				GENMASK(1, 0)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
 #define VBUSVLDEXTSEL0				BIT(4)
@@ -57,6 +61,13 @@
 #define USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X3		(0x78)
 #define PARAM_OVRD_MASK				0xFF
 
+#define USB2_PHY_USB_PHY_HS_PHY_TEST0		0x80
+#define TESTDATAIN_MASK				GENMASK(7, 0)
+
+#define USB2_PHY_USB_PHY_HS_PHY_TEST1		0x84
+#define TESTDATAOUTSEL				BIT(4)
+#define TESTCLK					BIT(6)
+
 #define USB2_PHY_USB_PHY_CFG0			(0x94)
 #define UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
 #define UTMI_PHY_CMN_CTRL_OVERRIDE_EN		BIT(1)
@@ -78,6 +89,9 @@
 
 #define LS_FS_OUTPUT_IMPEDANCE_MASK		GENMASK(3, 0)
 
+#define USB2_PHY_USB_PHY_FSEL_SEL		0xb8
+#define FSEL_SEL				BIT(0)
+
 static const char * const qcom_snps_hsphy_vreg_names[] = {
 	"vdda-pll", "vdda33", "vdda18",
 };
@@ -330,6 +344,17 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
 	{ 1310, 0 },
 };
 
+static const struct override_param_map ipq9650_snps_6nm_phy[] = {
+	{
+		"qcom,pre-emphasis-amplitude-bp",
+		preemphasis_amplitude_sc7280,
+		ARRAY_SIZE(preemphasis_amplitude_sc7280),
+		USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X1,
+		PREEMPHASIS_AMPLITUDE_MASK,
+	},
+	{},
+};
+
 static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{
 		"qcom,hs-disconnect-bp",
@@ -418,6 +443,32 @@ static const struct phy_reg_config hs_5nm_phy_post_tuning[] = {
 	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
 };
 
+static const struct phy_reg_config hs_6nm_phy_pre_tuning[] = {
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CTRL_OVERRIDE_EN },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
+	{ USB2_PHY_USB_PHY_FSEL_SEL, FSEL_SEL, FSEL_SEL },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
+	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
+};
+
+static const struct phy_reg_config hs_6nm_phy_post_tuning[] = {
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2, VREGBYPASS, VREGBYPASS },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, ATERESET, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST1, TESTDATAOUTSEL, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST1, TESTCLK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, VATESTENB_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST0, TESTDATAIN_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0 },
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
+};
+
 static int qcom_snps_hsphy_init(struct phy *phy)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
@@ -512,6 +563,14 @@ static const struct phy_config_data hs_5nm_phy = {
 	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
 };
 
+static const struct phy_config_data hs_6nm_phy = {
+	.pre_tuning = hs_6nm_phy_pre_tuning,
+	.num_pre_tuning = ARRAY_SIZE(hs_6nm_phy_pre_tuning),
+	.override = ipq9650_snps_6nm_phy,
+	.post_tuning = hs_6nm_phy_post_tuning,
+	.num_post_tuning = ARRAY_SIZE(hs_6nm_phy_post_tuning),
+};
+
 static const struct phy_config_data hs_7nm_phy = {
 	.pre_tuning = hs_5nm_phy_pre_tuning,
 	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
@@ -529,6 +588,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
 		.compatible	= "qcom,usb-snps-hs-5nm-phy",
 		.data		= &hs_5nm_phy,
 	},
+	{
+		.compatible	= "qcom,ipq9650-usb-hs-phy",
+		.data		= &hs_6nm_phy,
+	},
 	{
 		.compatible	= "qcom,usb-snps-hs-7nm-phy",
 		.data		= &hs_7nm_phy,

-- 
2.34.1

