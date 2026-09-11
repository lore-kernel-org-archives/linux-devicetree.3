Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9EB3264F6
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141155; cv=none; b=Z+s26jrH382ySiMG01hPjpTWriRHeyLT2Z/s9PxA5tkFOCvy9M2Mm7/99jHmFEFLa4QRjpY7S4xNd/Kl1RWvz8lKvfdZe57rzv97O2m7olyAdmNv+lCRch3Q4HdC8sMrXgnDy8QWoJFJix5tSYXAkbIoU2fy7fJBPRIpE0S1uy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141155; c=relaxed/simple;
	bh=joN8yL+gxJ1Swwh24rleSlxVmTIQXeRAkRaCNq61++0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvuZeM1d7A912H6BOCJimHq554kUSp9acnah3ExXiTC7Ka7ty1MK1HZStNixts6yNN64Ym/6WKvAJcBtX+KU/i0THp7dKG/l8KfkkTM8+APKfiQD4mrMOI8M9aaD7PfHNdu6sv1486wXkYCHxrLgCj39dVS6VKJAWgA2jWPShgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNcvZsXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kN2MfgtN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNcvZsXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kN2MfgtN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFA8bw658383
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GNl5Ol7V171vLY4SOIszaya0H3xLldgY2l7ienkQzY=; b=DNcvZsXhmARZ35ye
	zktBb0/2OfN3xCnrw2BrlTi7/7yEOxpVAFohELuLfYHmX5IyYyQVFYQ1rv8F9kS5
	UUt9/0hFtP/Urh4UBFUKrLkqyJCLll3hEkaXEWBAoSoIcWDXIy4bwHz3F7zq02T9
	fcO+h1g1Qc6KkMSzUwVxHnYi5obTEWXmU45nvXdSI8nzaYoUJXHsP/9wRbjoYfqp
	s8w+uTJYGhZ8r4VXwOBbvFCHty+/IdqLwvPnMZ9FJJM86lEUAW6Te2FbXnpFbkBB
	gFNGpL6UcSuOp8G2XN52kjvLW8gvR32Jt1PXjbr9JHSLQYGEadxCUQkQhf1Jeje+
	plOLcA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22r463-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:39:08 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4519ef1babeso789091fac.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141148; x=1789745948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GNl5Ol7V171vLY4SOIszaya0H3xLldgY2l7ienkQzY=;
        b=kN2MfgtN/l9pXBytD6E8gQd4Z1AZDBWtcVbz38nMJG9E+L6Lnd5TpbwRX2m69bB+Ok
         tDO5Qpy4plsJngDb/os2wTp+oo1GMEGne/y3PlQKWSVyGdQ2+ZkeKZQBtURrtKa14TMr
         sTRauc99lPVFTFfh3heG3s3L5OLPx58alQG12/BVKsPZxDj5PJC3FyryNZriYqjq50wo
         y3l1overvRb5Yh/WY6iir2peZHfRNQTF0fXKrdp2HFqhd13k4f3TWAmw2EjnsMM+plO5
         zKhy7MoI5YqbwvYU4k+3BIAF6r1Sdry/LcRkfpZ48YrmK4xveSdfIEw3sR6L9bDUuP8O
         //Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141148; x=1789745948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GNl5Ol7V171vLY4SOIszaya0H3xLldgY2l7ienkQzY=;
        b=Ytd/+iiFMaYvM3DHssBivskLHyTS/TL4hVX1J/cePOX29Yn/LSVF8gEXGYd/DrHvC8
         IGcc+0ZLEtVv2dWDnhgLTA//W2lUg8ztfD1ONcMt558eMROMHAstOFnozL1UvSJ/D2GZ
         hfW4vLlRTQHMJW0kmVD5e1xmTUo7NvoPTjL5mLiPAqH+ZCTColAXp4Mq7REKz5T6iUOT
         h58A5296PG7n2yUaDTVhNF5QBxt58CrqNPZqsoTDZB/PuI4Uo+QUggAW/p+QSSHfZIgC
         LDA1HlB+FVpCYhCvKWqaN/eVVx+4+5sxwdSLqFafkIu1zxOtgwaoVTD6IUd/147Nr+eV
         Pkew==
X-Forwarded-Encrypted: i=1; AKwUvBydxyJ8oNbhA7KbkUbYUkKtgkRlSH/PZ9qcV6qHzNS9DWRFUjLrSy9R4o/E3qXbVdjYKkJEsy6LTYKF@vger.kernel.org
X-Gm-Message-State: AFuF++kW9MKCTzGvudAuIAVdQpUlIF6vXe10Icv0KGd2VHAu446Tt77U
	Ydffk1ZcyLs4s1NTzimV4jTi0tcuvcibvLcj+Qq/wlu2QkHL/H6WhaQipouyg7Av1Jmq7PPwexl
	tA9lRL41CwGVkkHmlhhZso946g+Ktt3dwXSVXzopLAXSEhVS0/8dIiByWAwGahs4C
X-Gm-Gg: AYBFou2EHNJ1A3pmBW2IVch3qXKJzfD/DfAXAr3LC6eUrlpIQoOuTns9OOXUvDQ3ZoB
	SyMTjjCsrYJG3RbFGOcY31ZUHek0vOUd4PyY/WZ2cJewHpURjb7xvu02v4poJykQX5pK89Oc8tS
	1/7HuNrhOFWOYevL+MPq6nqkuMItSfXC+5QmR3567BUfUPwbdASrXds2WraFUkjKx8TWAkp9Y4q
	7Vq3eXZ7T9VuB05ic8J05nvTA8hAosjYGG6gzhgDl3ncDam0BdcUN/P9nItu+U6kSV8R56TvE3P
	QYguTcWDfQJCnvcexcL2HdYKIbXzlUyi1zaI98TnIV+fanyvMYG5UAmW/TI7f7ik6Bti4VXvDXX
	asAW4Fcj/snYw4aq0DMY6XblqGg4=
X-Received: by 2002:a05:6870:b017:b0:475:e0a7:9f2b with SMTP id 586e51a60fabf-47de8f960b1mr3322085fac.25.1789141147989;
        Fri, 11 Sep 2026 08:39:07 -0700 (PDT)
X-Received: by 2002:a05:6870:b017:b0:475:e0a7:9f2b with SMTP id 586e51a60fabf-47de8f960b1mr3322042fac.25.1789141147541;
        Fri, 11 Sep 2026 08:39:07 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:39:06 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:44 +0530
Subject: [PATCH 13/17] phy: qcom: edp: Add Nord spread-spectrum clocking
 configuration callback
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-13-e25c073cf1b6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=2061;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=FwJzTy5VClUwUHMCnyi7dHL7Mwmhf3eI0myaOfAWa3U=;
 b=DiWqQ5UZ5j739oSBkbZhMvv/suocnQ9Xj3QcKzoOKXRHYMnmqYPhStGPTKG47qOZElQeh7Ny1
 iyiVuZ1MPvtCsZRvX9BXs07CT/rnTDWTwPf/jphP1/whRtnfvYtBNuG
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX7iOE6DT7fwIM
 8gJGWnWo7ryVlOVBL+NnL29hCmglYEoMluJamLddWLGfrmmbwTSmu35xv9vqrfd1Tixjj0xnusF
 mWWBDBXYr7apUi7jiFR0gEGtsPLD/vjZe3rWKNB2D5djCPBZqIdfVh6TBvpNGUu5NWsj6b5XkDe
 UZQ8TlNBDi33Wmjy47Wv0b9311VwmvoUz4MiT0HKdUIv3TXMvwwU5/kxmNOXZ79nP/Sx2FKAD1w
 ExBiR1zjOyG8Cj6yZROPYOcqVEPxWpGEEPzJIOQpG2EAfnrIGBpEX6U5iv9M5ZvHk/AsVTc3QOE
 tinB6F2Fg8HxDIgLuJV5yNKkfpUC5WuQHGDPzBKFZwd5OTgt5n4bv1s83FBSN5+M1d5P1ZwQJHD
 ceMPRvfCQiS7ojtSjcWOWZgeGAl7j6/34MPYBnWDgPj9y3bx7ic4OAQQCqSB8WhCDLUtoTUGvtA
 edFgk8PEACBWkpc/20w==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa4209c cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=guHe4NRHSy_fFtsU4t4A:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: vgPPT4vxdpY6v-abD7WfGxUH_NF2Y_F1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX19dvIbQ/9kEx
 cLIsPGrHDsgHr7sL43USjGWPerkbp45rbUxEVphZhPVktLAgzHxSfrCTCTfLlXlBFx1q3bL/wTW
 KnHl0jUCksLJLGkYGqEK9SsrKfTuLQA=
X-Proofpoint-GUID: vgPPT4vxdpY6v-abD7WfGxUH_NF2Y_F1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord requires different SSC register values compared to existing SoCs.
Add qcom_edp_com_configure_ssc_nord() which programs SSC_PER1/2 with
fixed values and link-rate-dependent SSC_STEP_SIZE1/2 for RBR, HBR,
HBR2 and HBR3, per HPG Table 2-9.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index ec4220cffe69..a0f4b12e561e 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1645,6 +1645,49 @@ static int qcom_edp_com_bias_en_clkbuflr_nord(const struct qcom_edp *edp)
 }
 
 
+/*
+ * Nord SSC settings per HPG Table 2-9.
+ * SSC_PER1 = 0x6b and SSC_PER2 = 0x02 are fixed across all link rates.
+ * SSC_STEP_SIZE1/2 are link-rate dependent.
+ */
+static int qcom_edp_com_configure_ssc_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 step1;
+	u32 step2;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		step1 = 0x83;
+		step2 = 0x02;
+		break;
+
+	case 2700:
+	case 5400:
+		step1 = 0x18;
+		step2 = 0x02;
+		break;
+
+	case 8100:
+		step1 = 0x5b;
+		step2 = 0x02;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SSC_EN_CENTER);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_SSC_ADJ_PER1);
+	writel(0x6b, edp->pll + DP_QSERDES_V8_COM_SSC_PER1);
+	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SSC_PER2);
+	writel(step1, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0);
+	writel(step2, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0);
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

