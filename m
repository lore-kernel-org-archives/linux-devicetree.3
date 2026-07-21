Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F94A3BD224
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609503; cv=none; b=rD7kRnPC7kI4HsIjAOBRwLvlmUXA+9YmN/q8zVQdgGU8UzUgzzAZBZxX2BPFGawrqOC2GObqTeSCMWsVRy7w9kxbaPJP6EWt+tLnopZzMeBUv+TvmzyiK6ApvWP5j49OCLh60gOWNcvTuZeSA4WI8fFegBYvCGqECWGMJYePogY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609503; c=relaxed/simple;
	bh=suDyrdZ/A/Ib++uryCq3ydxopc51LoKQbJy83eSgB+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdyjLgaWmJ80nFghnTZ1Fnsy8wLSG+nuX5TRww/iWcTD+vAGvKXMmfjDw6N4KVBUHnSdEt46bR3bLw5VhDkf6JOPXiK5za8yCnnGo+yKFnPRDv1gthhBG/f13VMkR5y0sQ3iHis+QMh6DxfUBDUMM4m7LqdRZdvw8ajRvZl5LNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noZOm0zk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMXn/9wj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="noZOm0zk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMXn/9wj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L3xoNX568564
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/JnqSJZbQ41bq4121VskR/EW6Mw3oBqa6LEu9vKNDQ=; b=noZOm0zk+QX+wd3k
	emsSj6bTVzC4PX2cILocBw+Tm+7p+qI+Q9YQeVfBLLLApyrWn9G2QLiCYx1yrrJK
	bWLC68fLI/nmof9LrJXkAGid4gE4D8zQBka84odLmPpMI6+t/AnjUfkv0ZaO0BPP
	ETefBethg6ZEoWxVc/g/Hcm2Webty/VtLDCF6Mg9EJAbb4AkHj48dX2d9iNgFbp7
	oWmvg2zRhd7NUKfVsAMAXHF5qALthAZUX8HYBFyfmJWvKwL/3ainxH1SETkqJj6z
	IXAgQLuUvI/mIoDL8BqOcgtG1L0jdgis7cUN7KPq69ccvAmMINNfop4XSSWKZdrp
	moJV1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvr58m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e63de75aaso4660931a91.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609498; x=1785214298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/JnqSJZbQ41bq4121VskR/EW6Mw3oBqa6LEu9vKNDQ=;
        b=MMXn/9wjySroYsbkKqt/2eDlg1sx5kYLyORaW6tW7zxUHc/bNWhy9d9TDtE6F804VU
         jI0y4iWp8ukNTtR/hqVeeGQROtM1qW4AnpD5SS4htn6eKshdm4BREXLvuBrgllJOb3B/
         sliY+ZrbpNoQ0SO4L2SV36OyYTd+u6AbPDyiErN76dqrPpr0iP+ZW7qF5/ifeTJt7msU
         rZvHuSBvDylN2quoES5S+jOmkr1aqtO1dEkObybY0mKCXyWSVYCavuPzNE2x6uSEDlDk
         xqKqSWQeLDjumclPT6IKQfcOa9x84jwfzRk3Mbxdoyq4sF0u3a/vPAoQJz4Ubp5uvJ3Q
         Vj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609498; x=1785214298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/JnqSJZbQ41bq4121VskR/EW6Mw3oBqa6LEu9vKNDQ=;
        b=jtCWC818RFb9cb7bPlKx/JA989hC07kMa8DDJR29pljUIJMPwIFBAMuCMGKgaCE4YV
         CP9c6auUebFt6LCP1h37VFn0JGVcdQ1QHtu3puxDPYzKnNU/xALwUbtyp5P8bd07x4+B
         jwUGrysF3N6a7m4sAcwRoRhAsbKzTlDa1zz15JZXzVdKFHzdpR68C9z3fHB+fH+nWayn
         qymfnpg2el/7txhDQkEXypumtZrmcT6XyiIhinHlirYhvkrQYq4hYa5ErDTOjsbzerZi
         AIi3Gcl+Sgavv1yTQrHsWCDATDsZQ4H/6MEIkUaAKB5CGP8js6uVFE8UCCD3VO6k+Z3c
         u1cg==
X-Forwarded-Encrypted: i=1; AHgh+RoVMAVRJW7buHiLeJh3PL583Mj+mLZz4GzhDJhgS9UQZNDthQpsz8wlhJ/KvQ0pVjWwDNp0IDFXQjZO@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZ9xUNTG60LBo6jsbLsJfd+blaLM/7XaPqdfEUCeUWNowbPXo
	xuicnqF88ECt4LhL5E0gHHhQCk6FMefd8/HQusG4LFXVYlSbY5RKaCN6kgYSPueZcmzU01KoS4x
	5fOTi/Jf+EATkORlVu+din2JWO9zFxdWn99pIyncnxvuuKszzkPyThMuy4fDnnoNm
X-Gm-Gg: AR+sD13X9ZIQkwLnlwxB6o4SJzDywe+v9iC5opve2BdXGpqu4TpE5xv0itcbFDpzncw
	KT4mg7c5S/UOFkj1O4AAgZ5xd8cT11JnrVwwmSft11Gr3SqVnC0k2RrN2KR1N3wUHbcge+m8efn
	RBT8m6cr6HEX11AYDgGc49qfBNmZfxtvAXSOuikNoU3rXEhw5clkisbSNkh/BEJQE/tQ+G2ffrb
	iqvWbggXGHrD/0ElARzvfa8DyDJcgHqrP+ltHpIi+ZrAdu1Cv5Y7HGl9cSuDBaicqCSee64vq92
	kJrKMO4z8J7ARQMWRH7AxkW3Lvr9hhYioiw8dt/x9jITfnApoxAczrbFluZ4HL4HMd08qQiocTc
	hKyMwn+W17f7whMw0LXlBoGOIFbze5hgYRF/ezE7C13/4Gq9lr3J/GK4=
X-Received: by 2002:a17:90b:544b:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38e9045bb96mr2852027a91.7.1784609497737;
        Mon, 20 Jul 2026 21:51:37 -0700 (PDT)
X-Received: by 2002:a17:90b:544b:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38e9045bb96mr2851996a91.7.1784609497265;
        Mon, 20 Jul 2026 21:51:37 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:35 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:41 -0700
Subject: [PATCH v15 8/8] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-8-c0b1c1167c5d@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: gb2ca3Ah0w3ih80l23BwKtNKTkva-x0K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX9/NTPJeAs5sX
 TRpOetIfDX2DP9IhckUAxb4gwY/TxFJWB845eDMyjqKBkWvPDL+lrbs1mnRz2rUXrpTOI5YZsLr
 k/pXWqoLD/IQmTfSp45wfkouN5xFiug=
X-Proofpoint-GUID: gb2ca3Ah0w3ih80l23BwKtNKTkva-x0K
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5efada cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zvpRHedlNIWp6186mRgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfXytLF2m3GQ/9Z
 qfdA9w4YZm2Mdoy2VwUUvVaK8Vu5kRtJg+0c2Boxio5Le46D5iULt9TlLoR9wthip6u2Ms7NdDl
 2GOeTDZrdqq3QHaV/bd2YqeIXKHozwTWFznXN7A0V2EwA71O4okshCUOgdPktKwc1DDU8ZZ3n9E
 ZPrQyGJ11A85Rr/DvKJWKLjrxS5YeGg4dGquIY8PH4iTcn25le30XEGBUktdEUsj5wxzaaCj+9E
 GU4NdL/dIITD9fwOZLIFcYRQ3xB+TjKAQi/AE56kzjDpcdxvaXepJFluTrFyf8d4NEaVgevp5tR
 rBCMLpxpJP6+ERiS6gw0rzqsYQywLwdqQvW7X9Pr8wk90dDt9f4z9rBlOSvBIm4Rz0AOC6tWCvC
 ru98sJpDQzr6rn0cGDdj66gbdrLdmTWgbJWZjE3gn02p/+wP1F7pgrjoNlrlBHaY5b0XWFMvxZ/
 UQT/iIx3yhnLkJVTcSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210046

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through a separate
TPG_CTRL_CMD register instead of TPG_CTRL, and routes its output into
the CSID gen4 RX via the CSI2 TPG mux.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 15 ++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 27 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
index 4ff2f41f70f7..bc52e4a1135c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
@@ -63,6 +63,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -140,12 +142,21 @@ static void __csid_reg_update(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	int val;
 
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..770a9e5d5ba5 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version >= TPG_HW_VER_2_4_0) {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	} else {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	/*
+	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
+	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CMD.
+	 */
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e5cf1e42dbb1..252dc2fe4207 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5825,11 +5825,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1

