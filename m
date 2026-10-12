Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A744F431E71
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787529; cv=none; b=ebvZqkYCb1kKiTW+kVFyt56MEbGUbpuNypX6V4A9AfmK+ApT4QaHBFKihFsnZ+6IJ0W++8fkzoRQdpE+V3BHH4l+oM+NYH3VB34bCmirWrjDdmI7Ghrd0txQoY5GHjYNLauwvPVgH8Azdscv0d76jP97C5RSEtlOs+B/r7esfOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787529; c=relaxed/simple;
	bh=RzCywbWgx8dE3jNijkrCi/shzOFGdqaG/+4eys9w8X0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZlzFi5Bxmhme7xIbvgsJ47Q1HJC+4XEoGlsjtZPHCvE8oHeu0rzZVExcagLtAmTKFC7n8qWBJF+Suk9NgLTfNaOJS4S2OQwL6pfckutJvNRG/FuTElXrV0wT3tMP9D2oBjXpmwKEd57eak084v/xqonlk5ATo/kmXxyWIA7lVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjTAgA7l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ax6t9m0y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjTAgA7l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ax6t9m0y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55nvT1339365
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=; b=QjTAgA7lPTVWdWaI
	BqzPLXjEMpEaeuQ3xV6q1/t9w5yHFcnGp7kHy1KQVBV3TYvyF3VkzyEYhuxgUlPG
	6a8p4N6E/ffS2qq+2SiC2IGHU09dDWx3dja+GCTrDgZutudXHjJurje31XD6bGoj
	MW2RRmlER5TcCpKs1l6CvRtLGAJrgovLa8/F54/IMwaqyaDN5YUKeuZw8+Eo3YRX
	CgWsWz7qztPyd1M/rNvHEu+rZzQ2Me08YuHbLKPQa1SGQid6CpVUkfg9Gfi+RmtD
	gVlRzIMndQQDy9sfSQyTQHlevw3yzdaJq84p3mr8kAhdH+vCXzxQEJgOtQI6096L
	9FH69w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk256wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88d2d26a8d5so1620973b3a.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787526; x=1792392326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=ax6t9m0ynBnM5tGMQKRPnU4UAnefu1x36LyYW2wibCk+jD24iuGCYfXI8JsVPU833r
         3qIA/lUOQR0gtfMd8pxk+HeWzBYFLrQmFJWATmqG1FGoB5iptt97GHws++iwczHpv8an
         m5ab+fr/RYQjbcX4IHXFAemeui5KlDWdBzuJ/Me78J4hSlVveOPeXFkQlmI4IjmRSI5y
         VtjDKTUI/nNY/D9xCAzfGAhYdEPpb99QNogCssGaxeGy+CN957prOPTDiwoE+m23cpQO
         K7jYKYfB2p10zGcBA2v0aysuTeY2DxSLwIbO5EzDL6rhpi1W/XemsfnaZdsw1pE1wkId
         /Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787526; x=1792392326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=RRQd9EDdwvjXP/VXCgcqagk8F0ylaZYlDlloT5pM7EgwsYcV5onb8YghNnXc9NgiUC
         /1XUgFw0Ry9vMZLB0N7034SnQYYAZWbGjmsLEk3vrGMkNfrempNbxKSijkRXnBdN9zdk
         O0UCofs9LlGG92ucHPamb6DyUXTT13W5obZYg67f66qY/SGjZU3efk+L30LAeeWTeFzD
         qdF1dTJMdJL6ArzzIdZQ4Qo01EFu9uO5jSjlsUilhJ9ao7LM/1XVXa2Kq2XSeBao0WUX
         4xpNGv31XXzieHkm0iVk7a1oiRpbNhhl/P7i16IvtyIcmQ5SlLu03mJ7b+LO6H9G7nbU
         dvyw==
X-Forwarded-Encrypted: i=1; AKwUvBx89XxnORxBwZQ93uuLzzbdfNeE1ANCngjrfTXpQo9Pa+sQdoItWEeD4fsG3Uf6sYWXzYJW0aCzTq++@vger.kernel.org
X-Gm-Message-State: AFq9FYLuYgA7afV+KVErXkj5QJHs0qvvQOBZksbYHrAPKZTbUE3Q6UD3
	p/vpycavHTuvasmG6moF/EtZ6Brt2QZs2YHO/xvPdb3cGJzP7vL2HJA3YyXV0Wkm/LQF8tDeks/
	HMW58YR27RbZdwNOs4ioKOVx/8kN8zQR7KYvfFGGUK4uNIOQf1zYxZcWwhhvpUgV/
X-Gm-Gg: AYBFou1i4YTnfKY42VPxDjc3cGBITeh7p6rOlFvpKvjZ+RaMjDVX9AKGaWtYKOy9dHQ
	BPT68kHGrobjdAhmtTYzQvfkLxbaeEPi51WtAftf/4Md2LY29cV/zxOpAe/FqTuzU45TJH95E1w
	ycyPdQdXuOvHdRRZESUM8sbT3KaeZ4hcCpSrwunXDOEuYBgsHgxTBKLgcWzl74JreUza1OIl1CL
	xAw6shxIAUlxxJlgFxyvj2ZazU3mbJC24uRX6VPLjCbPH/rsvU7CQCQbAdJPSih5Ok+rEdLPzDf
	+s337/T2eUWfBGPXXkm9B+z2+I2mW4DUuvTyA6I+EToNPpd2ZnJzvqncm9vxsFAdwXK/W9jm/Y5
	n0DJkFg+9yjvrhNT5N17G5fP9f08U+fYNvt7rpd9w9xN73dDNcIlzFfzbmCEk5nJojtwNScXn2U
	1bWV4tzXqB8Q==
X-Received: by 2002:a05:6a00:2b98:b0:87d:d4e5:c54b with SMTP id d2e1a72fcca58-897d316ca3fmr4913550b3a.4.1791787526176;
        Sun, 11 Oct 2026 23:45:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2b98:b0:87d:d4e5:c54b with SMTP id d2e1a72fcca58-897d316ca3fmr4913530b3a.4.1791787525678;
        Sun, 11 Oct 2026 23:45:25 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:04 -0700
Subject: [PATCH v21 02/14] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-2-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: F2bMbqModuslDLRbS71LDxu-NXRRJPU2
X-Proofpoint-GUID: F2bMbqModuslDLRbS71LDxu-NXRRJPU2
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc8206 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX/d8MQhMLONhq
 TewXcfMNaDgXRXfMGw2hvuao/gxDGi4iBxu8dvvy0xUm6CTEXOvPtRNm6WXa0notPNWOZ+JPRRp
 rjHhFNlPAsBVUv8WPaPMHs1tt/DaOc+FC07lrY+O6wyADoPbSVZTZov2aao+vhw+bCEfZwNE78W
 Bs1mLzwkvHqQnt5KJg/DGebUjUvf+QwWqfuTPwtBxxwtQhaDvk76Si1pB6kZtmbXg3Q4afMdCLp
 ZBG8BNBygI1E2lD+X6zAjJRg4Hc2rAPDRE0IzTWwLBphHkSUo/hY13Akiu6EJlgwJyqYG2mudJc
 hXolWKhMBNYiuN2y7GjGU68tMbPFFXF61vvfAufoGAeemxBI54WKkyVzyFE7sM3pcC8wywZKc7K
 l1uT5AbWgm1KYYFsVuQt/kPDfBUPYLyN//o5Cfau5I5BcDQFETrkFhPp/+OXfS2kM2o0edwM8kI
 Hpc6rCqPDRHPzomepfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX4QC56qmWy7ge
 PM/i8rVannqWFUnugu+hH5cJXURazP6lQJp3eFXLWbRD0rPucND4iuBYdSbZimsvfOpRPQhfR6m
 e0egr3/s/4CrHDDl/gDEk6pSX38O9UU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

