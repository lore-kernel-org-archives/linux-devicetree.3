Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ADC3EDE43
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230249; cv=none; b=RVsGqBK010EIo+ZTKWCLts+CyyjNfCx6A3VN9/x627UXHqvB+OTmk21wv4JTYov4V68AdcQv9QTjh66tqvZasfJnA2Gw0FBcd9h+Mw1WzQEIbKtkXljmwB4ExYrvfgzepNBDxWHT9ZSgYWjn4O31hRpKytUWPTgFH4fWwMBevq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230249; c=relaxed/simple;
	bh=7ILArANYD5gi/Ol8mfS5svPlqqomUyThtypHtKuxdS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfSW69by8dUZVMeC6S8cltXskhfhSbiqae/vzD8X2SWajA+NmyUrFPnXORmUwEI8SxO3v8NxOH4D9N+iD842eHTQfjy4bce4rttZKh4lAkeOpOrKXEcV7p1k0UhXxkxD7cgBOcUHeXyhG1IPc58DiUWFnkNFCLqj0SjcIUTSqcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqxEbuE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P26wnSl2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqxEbuE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P26wnSl2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e3cX567392
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=; b=YqxEbuE9KzaAGMk5
	oxX3v9z/OMB4yhLcrRaiBoQrUIQ5kUYcReGc5tcXemKQ29rZ6UFEfK8KZLpq3CH6
	k0TWYYJPyI+klV4CX0P28tyumwxlFed/76w0MKzV3LejtrxUpWGy+B8O3XVrV+lP
	qhMgdKSMJdZ2oSdZTArX3HVXuuF+V8u7VyTqdYapbIWAnpNMqyIbyfxY03yBtKlc
	o1zODpAKFmq7DCxnuA5Zm8gAVUtWl5AICd6pF5D2JoYzrvLFsWORjSrEyewZcLFD
	NkABBeRHHkTr/pz7ufdm2IMHQExow6NqUJMYfwYAsjRg2QtQhy8Q+H8vl6Ze0JVf
	21uydg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh8c8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:10:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14318be7d79so1969037c88.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 23:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230243; x=1790835043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=;
        b=P26wnSl20cf1MT9Bqd02swQefhO4Ht3IfyeP+YGioYhpnbW0g/VUZaPbcPZVUExyUP
         61bz9mdJmfV22IUky5g1L88mpCI9aOlGvjjmG+bAwx7gW/GAlogxfIAcsXc+uvVOl3US
         X5ZZcS8aFGaYh3v1jWaYpO0O4lIXRn6lwF4cnojT4T34hfZfyvxy1GpqYrNSYPhqlpvj
         WgyoQ1A6yyY/L5tYxaFqAasOOsT2QHQn1ts2JrGx7xaL/YpQOpHviGbWBymwVRI4AG2G
         GzXzSkEai7zMn8gCqxLuIEc+sqhnF1O/X/G0CAsI8G7ZwrcVVIj7x+Lo78fa3xMsaCZ9
         vZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230243; x=1790835043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=;
        b=JDAlwNv85tmvpXJbfgMGqydM5IDAQ7m1e7xGyuIkbQyfWqznM8TAS9VUvWz4lCy1vB
         Qss09hWGjHBfsupbsv+EjCenMOXqzmlErvWgKmulYafDdamRpDMn5fnedQQxRFR2jpUG
         6ImT5oa0gXNs495vtbfZb0Vks4PzjpNd4lg1xfvZ8aZVfQfMFHunF4EvUTb5guyzHeQs
         jC4cFIY4g2a+QSZ9A/mvXv8z9ka1nj0PcwiHYVq3Nfxzzar8Boegbksf5vxkp9w/zxBu
         jMKhr0fGLxuwm7u/Aarfnz4WrTXyI1gi5hGMf7wEXOJzOrtqWLLFc6W2vjq+pQ3oPqkg
         MQWg==
X-Forwarded-Encrypted: i=1; AKwUvByMxhdDmos6UI88Rns60VJXAKp07yeGFAwd/u4hkXAgfetM1WYsOmhk48NOSV3BAJUOg9m6RbUomMh8@vger.kernel.org
X-Gm-Message-State: AFuF++krCE9x4ltHX25WZ8bUgfmL67Z4tgpP4LKc/55sNRla5ELWHHjS
	EtLdGkPkmz52+IYSEKyV2pimFpLzMTOXVdFE7/uHrWrELT/AtAUvDzqlDHZb/fHApeUX6DY+sYI
	1IEcYdjBnjMgrdUNREckQKVTAyVKMFTorQIuEnpclTuMBqFeUCmqNz9WVtbRI3hEr
X-Gm-Gg: AYBFou2qiOJvJsdIb4SjF7hfKpMqrM2r/p7HPnKgCMBd4s7LB6iPOXcifOLSU/OM9uT
	Khy0InRl1z35HJ5Bee1AtAVXfz44tjPPypLsVizNej9Z7yCcMuqMZMVYSron1ZHeZ49VJVgMjkt
	Cy5ev4t1e8bCzlIN12mo6Hz8M5L01uIE94cTyz0HwtpPs0mCoropK7QIgzAy1vbMX4exKuFfSKU
	PQ3Lm0Pd8yqnvsfqM3NbnR5ni1qQ/RQHGPAoeupXh8SDETrBtHyORH66o0RHTgYsyhT86/Br5Hi
	LBgFP4uE0HC9zUd06+/JlfHzjDbqhFTymUql7ViuiCksFdOa1+MmG95jY0dd8y9GEYTNyHewVmI
	bpIcwGWNiJJAj6rgwe5cE3xi9Xpb5f52ntICAKEnTOmDOXzfQ9uytwKIhhgZlFIIA+E7uDz31bA
	eJv/k+q5m6Kbj0A0pF0A7BO4KTmarb
X-Received: by 2002:a05:7022:7e05:b0:13f:ad08:44aa with SMTP id a92af1059eb24-1450404d6a9mr1131428c88.13.1790230243243;
        Wed, 23 Sep 2026 23:10:43 -0700 (PDT)
X-Received: by 2002:a05:7022:7e05:b0:13f:ad08:44aa with SMTP id a92af1059eb24-1450404d6a9mr1131393c88.13.1790230242671;
        Wed, 23 Sep 2026 23:10:42 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm10197680c88.12.2026.09.23.23.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:10:42 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:40:06 +0530
Subject: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Add IPQ9650 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-phy-v3-5-088e7be0cfaa@oss.qualcomm.com>
References: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
In-Reply-To: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4bee4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Q9t0gmS3rCGuRMBXcNQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 8Yp1kvo0tLQfEVxMQqTHbBkkrkKmigzb
X-Proofpoint-ORIG-GUID: 8Yp1kvo0tLQfEVxMQqTHbBkkrkKmigzb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfXyLcvm8OZZOyP
 Y++5QQMq6frY9trOyJyWDHN0JUFQ+YewdrUCWkqStElrSKIkd8aWC01D7wtDLQcocHAJWm2KhEe
 C8XsTOPVpEOj/LqyFJs6ap37u551NyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX2TiN4J2jY4qK
 eWVb5JEClE7i/usfp54w0e43LzNdAVi4WyTmjw0fyvMskgN1T+Qh1quF1pZnOyzaEywcVF0PRqB
 RTNotBL9DzwI/zmZFAoM0uk+g3IYrvpJTZI0oteGQkzzG3/9PDPbPAYfvIoZwt9kWJfuPmeYFNW
 T8rIJZAQ4uwNY4dTKvEr+hI+y6UMQyWQR4qyissTVxCIf5hAYv74nom+Gtb3saovR9J1BSEB+4c
 q+aDsEk2scp1Qk9fpFOoqLhuUL3OivjElbxp+D46rVQmacu7s1ii/oiy0ON0ygOdti488Su31z3
 mgBdXBySRaSWDtFQBh9UZbmwEuZPOOoyStJtU32yBXMv9h/K/MAcFlPzhnOHmjWiiSPwyyg4tbG
 u55nqBhC4/0ChY8tIzaK3xUNrY02W0aQIxPQmwTmdTN9ky8OHZmxWYdu0VyB6e8ScU4Phs1IM5a
 3HSGMuCCbfoD/PnYK5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240026

Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
on this SoC require a dedicated init sequence and override parameters
before they can be enabled.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index b6bbf2b570c7..8957f208bc51 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -29,12 +29,15 @@
 
 #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
 #define POR					BIT(1)
+#define ATERESET				BIT(0)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
 #define SIDDQ					BIT(2)
 #define RETENABLEN				BIT(3)
 #define FSEL_MASK				GENMASK(6, 4)
 #define FSEL_DEFAULT				(0x3 << 4)
+#define FSEL_24MHZ				(0x2 << 4)
+#define VATESTENB_MASK				GENMASK(1, 0)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
 #define VBUSVLDEXTSEL0				BIT(4)
@@ -57,6 +60,13 @@
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
@@ -78,6 +88,9 @@
 
 #define LS_FS_OUTPUT_IMPEDANCE_MASK		GENMASK(3, 0)
 
+#define USB2_PHY_USB_PHY_FSEL_SEL		0xb8
+#define FSEL_SEL				BIT(0)
+
 static const char * const qcom_snps_hsphy_vreg_names[] = {
 	"vdda-pll", "vdda33", "vdda18",
 };
@@ -330,6 +343,17 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
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
@@ -418,6 +442,32 @@ static const struct phy_reg_config hs_5nm_phy_post_tuning[] = {
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
@@ -507,6 +557,14 @@ static const struct phy_config_data hs_5nm_phy = {
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
@@ -524,6 +582,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
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

