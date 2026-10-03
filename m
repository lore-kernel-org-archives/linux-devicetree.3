Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4A33537E8
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018157; cv=none; b=dzTP3I2w0tR02Zxg8gE//DC4TJ+vTE3WmIJLRjjYJKOMdQTa8salbBXHn+zRCFHElRbOgH/AHBBLckd86KjuiGiYjQ9g7PBqoU4NPh+zUEgRX0JRkzpnlfSNrhcPxmhEjdFq1MQe86RN4tEHkMasYViY/Vrl1Qw05go3Uysy4Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018157; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFz4uC4fRUAasgQBdhk3QGbpHYBlkP4IlU3EzNOmoTOesmEeFG7EvyFpLykygmMwW4DkOVUv4BtIA5A9/RqDilMkvjZv9Pj2p6DTKBgNewlXz+M/RmR94q3cWsOttLtGQMVGBiQYcnMqFtxxH0tUH3EvvR+Z2tOkQ6o/EgnzpXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5WKjWIK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHXeE3sr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5WKjWIK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHXeE3sr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933LAUX3783829
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 09:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=B5WKjWIKfxcdjGu6
	tTcw/DayoxDJFpFG42l9y13TdTxdx4XkM2HRv3xZ4ldsDjc6OEXLOsXU9i+tQTxJ
	XsQoQE/M+b6KAqgzEyMb3zOdGzf3MaFxnEJmKM57I2vhdlLAHc4++zDmc/+GniqL
	0Wwb/D1YO36vajvthYxY3o38TU9zwEHgos+Tw0xQFACRli/GRmZFMCXlMS3SRpvW
	aY+/Ct9baDu0uEHfyE/zHf4MqBLpLHi4NmI9jqwO+eXNxB9l3JxA2zBfWunU2vm1
	+QosFTMDRciZohUqDkBWMvNPcu9S+nEfwBZH0VbibEugcR9KZ3g4A/JnHQRGzDzo
	RZv2QA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sq8rhfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 09:02:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510562ef98so192468eec.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018153; x=1791622953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=XHXeE3srdnYMyG3wVKj62ufSr80hKen765WSPzRpuihMKQokXplBkP4X3bp+cOMXrf
         a3O0uZPWDvGassoCdNgQThw8jvc5CsGCPWmat7Vmr3fkmYycRpOZl3ioAzN+SW0OmpZj
         jk0df+verZGFlvavPRb/zLWlkqYHpwSXPi/h6GxAk1dZzSaAH2d+M7M1e99a5r2+p1+X
         C0nLwBDZeGDTz1EjZNj/02MjQxYW7VFgCBsrC9OWNcXD9ZDUnYeImKRywKCNCjT5VbtT
         MbW+Q6oaZnvzjWVtA9qvROeH4OysQD7ou0mqjGQhvKTJmZLCtze0yI2KjxzMyKwxcPY0
         hSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018153; x=1791622953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=xE8HJUfZHrpW3VAJ206Zv9ij4Pk7oUZSLKnPNpL24MIhGC+YZwYMN6LyGYpbycOf1W
         MMqZHY+tAcSDCEU/RcMzgP4zAh6QeBOhOBTHxY41cU6/aj0bfPg7/zvxvqYje9VVhivv
         O3jkCnKJcIlKc+mmPKV8aYX+Y0t09pmurd5vP8aTXNRCCTGmDwZaX0UMcpLRWZFjzuRQ
         xVQPG2DimEgIt5zSs3hSo6VhXDuZ6UQnPqP6Vfb7j64QFG9ZCHhS4SShzfHy9C67DYCR
         3o4ujriqyqFJb6foURbzfYpaIuPKChpbD5P9SxE+PPdo2hmCtwJVrCX5Gk4bOvfMBVNy
         goRA==
X-Forwarded-Encrypted: i=1; AKwUvBw/Rllb1XvpGv195EkIvP7NI9XPcaq01SZ2PCxgE7GWuPVkq52PrkY7dHjMAwgmdD1zc+VBWkT7EPvf@vger.kernel.org
X-Gm-Message-State: AFq9FYJe/RgRTdC2waMF5pnnli3xyhaKHbphpVDFtEeqwH585QtJFZBL
	yEBjb62fC0QEWpVVBi0rBMZu2oGPd4gtVfKe2RR8/UftZIZi0aM4k9V+xzL5fO6G0c4SEHyvoRH
	cbsiFdpnyax+Y85OnRgUDkFRrxNxwkNUYWFlIQ+tB3nR1FMtPuyFyW+iBKiCbJjhG2mP6BIrajQ
	8=
X-Gm-Gg: AYBFou23R08OELtZQpXNQHUmpqB+3FWfoW0DMgCteZ5ZsvyiFFM3VOSorpSjJa8plz9
	PvBc5ihGU1eq6KmxAwDxCrXSrLwo/aMtZsxkbWyZWb9YcI2TXq3yL+5j0kvheFcpi3485rTQ9AH
	DONh3ew8UkQcfoDCXr8w1il0YHEQV4yRpMRw0JRME6IQ/OmnPZ1owC5srgzZ6m1KeoE9U0OY69o
	s+cc7UB/X1Nzmtegk3YpgAt2CSlkGaLy+L3+Wbwx7sUOcd12Qr9k+gYHPNl6YYcoko6mu8aGA6+
	uR0y3GznYtW6DQhb3U8jSyjGszMF4ZE+VqSgUEa8gU8zmi60Kr/Lpk6Cbev0E7zJRG2dLVMy9O1
	v92+algqxYmJv4QaDLCW/4T+10zNUdXVPSxq5hNsAg3UJkQVPmZxCgJ8rOLvSJAY2dwHTHteBhg
	SkKIOSsEmeDg==
X-Received: by 2002:a05:7300:dd0c:b0:34c:d018:f33f with SMTP id 5a478bee46e88-34f150aba7amr5407421eec.16.1791018153024;
        Sat, 03 Oct 2026 02:02:33 -0700 (PDT)
X-Received: by 2002:a05:7300:dd0c:b0:34c:d018:f33f with SMTP id 5a478bee46e88-34f150aba7amr5407401eec.16.1791018152432;
        Sat, 03 Oct 2026 02:02:32 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:15 -0700
Subject: [PATCH v18 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-4-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Proofpoint-GUID: 1BFR3BTKlxWp1TOnLfAMsskOIi3Kay9s
X-Proofpoint-ORIG-GUID: 1BFR3BTKlxWp1TOnLfAMsskOIi3Kay9s
X-Authority-Analysis: v=2.4 cv=TKzQ2Fla c=1 sm=1 tr=0 ts=6ac0c4aa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX5CvyyXlEjCvL
 gTf7nA+0dqayPLnZZPlM7nG0xLBwEHKPTiakv4dCh4E6vE0Z1S9geIwuCqHWK+0/8JxKcC2UIcx
 OBI21lxBt8mufj3O7PWPURT/mrB5PEROm4Z9O20eLuCBGfwrg4oo0WyGtqugJDi7jHYCstIgROU
 4NMoPa+1LkiP0cXAWeCdhWQNKY4Uv3xQ9OW0o872tc5B/ilGwOHfEJ00JAeNf4c1Rz1xPC//HUi
 Ae7bDck43qX3fF534xgH4+MIuybuHKBWin1SC/PxQXHK+6uvFtr4N7zyOniDCBRlCIMv0jG0rfa
 aeXLYlEn6omaPIKm+z30j/ooBbT9O0W5n0NsKwNcdDtWv7MiRHbiT7cM/hpogkW9FfTYB6IDv3U
 3cP6PeWCxIckzJL6cnpsSNTW0WMHB8t0gWlOXZb9G2l1fKKD5zV6UDVTcyBPl2soERoJ9pM/Rm5
 toQoxPSfGPzLyqSQtuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfXxqXlbULUdBsU
 MCgCG2qGCSI7u63+9a2XeRm4yIjoOgKygEGpWc0n96LZa55gJXssj8vm9JfDHSoxk71PN7qDqp9
 5Y5Ssoj9js4xXKGlhodgG1X2XJLdOGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030035

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

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

