Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2693CDBD3
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789819; cv=none; b=pu+UBRABTWkrRIH7qaQYTxNQ4+GyNsfBcv3pCaNWVc/AIHOGUOUgvi/5vWV3R6syh5NYO1RXRT9mb3c67fxJ8g9iKcO5wh+JjLhkyFUitc7peq8je8kqKOYWcz2HqFyjk0Xj+BONOjmfogDfnNFV2MNs5jm2eWMt/YzgeYUjDCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789819; c=relaxed/simple;
	bh=0JjcHpd3tBWmzeCMsgQ5q643CdTH4KrATd9X0tP8+O0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDhqfa+n1X15aIZ1eF98sxB5dtrBjBQyuGtiVu6JAZENcENpwudQo4wuibG9XKboefCiGiQRq7g2dUIqUSgyPpVwtWIi48MjhVzs7OEH/jHvUlfTmqicRpbA0ZNciEtoEolgVvgDgGvzWBSyo0Qqsu4lO90FXRwxjmN0SjQ1L0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/KSUBx2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlzYWMea; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/KSUBx2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FlzYWMea"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOcJS4102947
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTuwjf5CXOV5Mp7IMwVje8lzbuGa56lO9NPJ07Ckymg=; b=Q/KSUBx2sV3llwiV
	6cVNAj/Qlq1eTrfyCyn17+gt6zYi9AjBCRxwDSEYm0b7Y1tVtBAWv+4kJmtpAIFh
	dS76Rz+8rs65GYvvKFtyjWFh6X0WuetJqQxwIl1eQ00vFCuKmPgAmHXd6f5CXJ8M
	DjrxYOIcSG+sUxF47EDZyvedi8Tgww1nG9a16q8F5rwnfn4aFB7Sl7Vbm7HCuGov
	jscRx4QDO8x/+ATwoQ5Kcn6F+MQ7cswonflc2O4iAFS2KXvnl/VHVx2b+akGchhY
	ynHSU2+pN8nd/NwUiGSZgLY9Yimg6B6HHZVd8lqeTc47RX2jRWVS3YJ/C1TApesD
	xSXVVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgh9n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:10:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so3071249a91.1
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783789812; x=1784394612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTuwjf5CXOV5Mp7IMwVje8lzbuGa56lO9NPJ07Ckymg=;
        b=FlzYWMeaY08Ga8qEsRg0bD5DlE5Zjf3N1Txrkt41LJIisNAM5cgeorpcV8KJAo/TVt
         wTvKMoFd5Ua2GAq1zi+09SqUaEeYimpB3JRu08SFvo2bCptjgqafBSMHBMkYSw1niiXe
         otSX7TRqIM9Q+C5+s6h0dYk5aAi7UZ+2Ph/wqlzwZGwtazC/myhGKkaTw0sbj0GEFpp6
         FUkuvWNzoSo7TwounXwEZDDQFtzS+l7DSh5NqOBn0YiXpRXQjcnNDHmnu5plxPh3efmO
         ltQ+z2mUtChZudCrrvJTkN+FwTDXwe228CA9FKLWhfX+BoqkEIynQ/sMFbD7MaoAwbPO
         7rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783789812; x=1784394612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTuwjf5CXOV5Mp7IMwVje8lzbuGa56lO9NPJ07Ckymg=;
        b=pOwWcXqE7G5X0PP67EqG+OQkNQeAQ09DkXM00mOQ8GZ6L9F+W3LKCfDL+UxffDKa1f
         ux7GE1AZvO5mNKBpoXSNddfv8SLHlNLPjWMamCULgUtda1lGe2mUB1TOjwmKaD4IF0+N
         TEOfrtRtpTQpxk72wXoKhs5M7QoxkoSW45ZV2hYpRrPFVpcxaa/yH9ztqCQrUW622LiI
         lSQdnoi04hAtgLasc7LetaZmqX6bsnBqUhhSt2LyrQJ16kzMo0UpDsBDSXAmr8EciipJ
         AyaYApcYGnckEDd3xI8aw0xHhm0bdfmFBOpZE9SWe7N1FpyDha2YHtZbMYYa7uthz532
         qfDg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6uXSwQqX/rA1FFgo554qfw+xVUsDU34K5xzlZ+hLIcIqDgr568fLHnBz+oUBmnGkwDmDYyfG17ODT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6cIWJepP8OpdBW12yT/i/+RnbYZ/s67F+hGX7YUAugcFV8EAB
	SLw+ib32qx0NepwAHoc09NRYlNASGM7meRnZipvi44HYLoCxpxDXLCYyLQQiYAoe+beSPYVGtzT
	cT3ShQxYHSyamuZLVVeCZwqKLo+BWMumL3+ZNAfXsgKKnNYo584/qz9Z9wtCpGSKT
X-Gm-Gg: AfdE7cmZ5P2ZaqJhRFQf2Cm0H8dHVCfLELIAEw4B1cxikh06bJY0iC5BuuLXRtbUyUN
	aeKaESRC6rDAQOahheXlFJ+Qa1Cq47FDsFPrSrklSgOMBXcOaObRnA17+mzmKU3QLLWGGRqwWeI
	gISRrBJLjHKZCTqNqvmVIZCQlT+q66ARmP1DGCnubIduAVMP7JAdTh40qUyqsBDwoJrKL7lfq56
	7OGV/skmTkWEmESKNxJKnw2r5A+mK+c3DMpOKGwl3+2/6gIOpl2Ue8+k2U9WMEr+ELJiXZtld6I
	CXpO2IVZtQGi7V4SjSvsALRC1/4gFq8ijZdMAcgKQjVuv7SB8AEySbzmF6zEkH/5WDRNcBsFwZc
	nj2kd9wmZhc5tfnwHg7FisrottbybqlKB0Ru3dwFOChKi3vIGda75VwwD3/Env5Nwa6hJ3bxC6v
	Jflc1T
X-Received: by 2002:a17:90b:3812:b0:387:e0db:3d88 with SMTP id 98e67ed59e1d1-38dc77a68e0mr3408686a91.35.1783789811990;
        Sat, 11 Jul 2026 10:10:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3812:b0:387:e0db:3d88 with SMTP id 98e67ed59e1d1-38dc77a68e0mr3408658a91.35.1783789811517;
        Sat, 11 Jul 2026 10:10:11 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm12943635eec.23.2026.07.11.10.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:10:11 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 22:39:52 +0530
Subject: [PATCH v5 3/4] phy: qcom-qusb2: Add support for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-shikra-usbphy-v5-v5-3-229ba3602737@oss.qualcomm.com>
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
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783789793; l=1476;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=0JjcHpd3tBWmzeCMsgQ5q643CdTH4KrATd9X0tP8+O0=;
 b=AF5Do0U1rcLOiS4zCyjeri7q6YiZ1C/0pXPovuLK2Y54e3nMIXSVJfpltrcXR3o9byO4DOrww
 UYKyG623xWDDwVeROLnG0qvRdSDIEu9w4Cungaf06aLox0nvY8e/U9k
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX/dGiew+NuZ2b
 m5lmhFAPtdTsP1hgjt35tOf3tB2f3HnM3Cq0tJSoF2ATWuUnRYxhA6v5+e9vTUcGmTdc3hQ+vkO
 jcLXfBLmgpZm3gOcqdZngBUYcy1391Q=
X-Proofpoint-ORIG-GUID: B2Mf5NV-aqXKPjSps3prGSYqsAyAdwpv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX+49IYmoPjhBL
 TjbxUdHiqGwjWJbrPHb8NT0lsHYR/wJd6HnqhbYG3tnv2ULTeSkENQ8y69C8iJ38M95KIokwgbQ
 runNNv54STsB4/tkI5LL+Yj0FnK8k+BItouyohpaZoJvuUk7yNJjFN8c5zEZRHxwWdvfnQlua0d
 Ydy1I12fYKmCFm4rR0RqUsWO4ToVdFzObXK5MeleiejXCgbtcsO1WhWgUUkGfzx6yOT9XRgDz71
 oF6le9PuzixX7c8uYt7tt6PpQ6d2hEAqnIddON0qGhLepPpsbQ2Uq1x+CoCjLMdnhbLKzFEb1XK
 lJPXob7PRHNxeHNJc4Muf4HAjmdYMcpVdtAlSinUhUIic+Mmybjd0TfROjFfyionPigGIyhdwys
 Tg21HHgnZVLFsviK1IzYHt2I4OuBzTUWw5ny1lQ2LXT+l2sWNo4SQ6JhfGsJFl1qo6r1GPfPqeZ
 JwgX3h3DeDeuQxLXmCg==
X-Proofpoint-GUID: B2Mf5NV-aqXKPjSps3prGSYqsAyAdwpv
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a5278f5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Pub0nXbp0FV3ozl__XAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110173

Add init sequence and phy configuration for Shikra. Since the init
sequence is same as that of QCS615, reuse the existing init table in
Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index b22b3c6adfd3..101c0820023d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -377,6 +377,17 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.mask_core_ready = PLL_LOCKED,
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = msm8996_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -953,6 +964,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,shikra-qusb2-phy",
+		.data		= &shikra_phy_cfg,
 	}, {
 		.compatible	= "qcom,sm4250-qusb2-phy",
 		.data		= &sm6115_phy_cfg,

-- 
2.34.1

