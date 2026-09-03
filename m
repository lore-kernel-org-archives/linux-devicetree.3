Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902373BF665
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461709; cv=none; b=qG1sXZtuJUHj6dIAIVAv5U4OAm3Vi6h5Gm8g3lFDwkHjfinPhRNHgTdDbHXOUkJ6kh20ea7uTRX/H9iDqeibOZrFMuFKpW7Qk5JXA0RR0eSqe8WVcn1fbDL00yTfE8+1EunvIV9zafI0iFyZtoDZDjDg/aRtk27Rf2wdnM+kNEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461709; c=relaxed/simple;
	bh=3qNv1gt53nDwmaZH3husajnhbdisLPvYiqw3RUvnSA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2SmPUo37MG3/dAYFlb/DSo6TTo/pvjgoEEL4Bc7zxX40SjuIZoE3utW95Y8keuNognkciWB0/+UgDYgVG5OamKWRte5aP6pWSAmkzxoEUHiTFnj7fZhcJ2UEMTxIhhMSU4a8RrFls6gvczqUE7IKAyk+7kcLjTRPXiTtcRxVeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahrb7FLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OU8kW518; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahrb7FLx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OU8kW518"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3UQs1091136
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 18:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRq6FO1Wgh0OU+E4Zz5vIqKFC7LhLdGz4RbBzOB8Y1s=; b=ahrb7FLxlCP9y0bt
	cAFx5oVRJmHjZABg1PjfYicyMyRlnzwjhT0sfbeXfAsw21iU5V4JsBUewn1K/31F
	3Miho5zFr3Gf/F0BBBjANjTFQi6cHSa4S6uCOKQc2DJ0hBYvCCXts0akge/QkKs9
	lLc0jaXuHweSaVnhUvF8zCOR64vAM4n6/07lYyiexdagP38bDnqXxjRe1zgE5GKN
	iChl/GFMoeAb2mG7cZB5PGJaHp9HnNlrqJbxiEBLBaSjXZ4lFPBtIlw08MHBlHz3
	c5kT8iS8oPrmHc5W4T0r25XHKSC4gZwLvgIKkZ1+2FGIvNfzICuKJaL9MvfNpA9a
	VDo/pQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekk282-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 18:55:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso383371a12.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461699; x=1789066499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRq6FO1Wgh0OU+E4Zz5vIqKFC7LhLdGz4RbBzOB8Y1s=;
        b=OU8kW518IPdc6OpupOdTbUC3zC9Sasj0jB7C7VQ5aQ70SP1aTD+S9H2y+RBKhWbu6Z
         G82jK0XWniznFggjdQYL+u8R7xDWNSu5D4chNVYBSPYGcop7O00Q0m/wTuiPTLquqYH3
         V9eOOxNMTEx1KbrtgPXj9W8N10dtRjmUYo+HiLfBnpidD27Kz8KEMkLcg7kboQ8V05Ft
         n9woi3TwsLeN3l3nGjs9cT9cvOcVQtm+1nrpa+8lOqnvxL8Y8/HJikBLyuUSwhiBS8pb
         V8DVFo4xUsUidw+6FkzNIVNj5Tx2Zvjf7sRuu54KpwrGY4iZM9d+J3I2V1ke2qXUCgCc
         E6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461699; x=1789066499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRq6FO1Wgh0OU+E4Zz5vIqKFC7LhLdGz4RbBzOB8Y1s=;
        b=UgLTvipADG9JaR+8Y/mbMNmuVdcU0PkYoxWYvoZT1tfSJz3trDcrOPwIzRm2+iSRf9
         C5CnfTVzYDM6HVcES2WsKeul/702rbV7Y29jRtp7VCiG0zw65HBJIFuvmVXbk1BhmK/1
         3amOj+eP+rA9SQCrhkDfIkdxQN30qoI0FzSb8IZK//tOJuXgeetzwRCRP7w07yTYDHlZ
         n0WMJoC+kV+755o/xUeLjOzT1iFk10JomXoRwTAMKipjlPvGDvs3e1Iifk/xWHiptcBa
         NPTE7BZH9hVrGhJjnJMg6CAPXS6a5P28ieuLrtj7RTPhPHbsmak2SY9AGJEX+IHFeH7B
         iVmA==
X-Forwarded-Encrypted: i=1; AKwUvBw7maMwl+n+rC/IPoisQxmlRKU9uf/r2ig/p62Te/QXkmurJHIgqUk75bT+K6C9V3tYkAWtyFE3BIJ6@vger.kernel.org
X-Gm-Message-State: AFuF++kqO26fD/3P4ngct2VCvi5MazSBLWt9Gp/GSvT33MgfkSChzkmO
	Bwxs8hERQMJGmFncXZsqisvWrRdoEt9kWDIE/+xf01N6ZnEwmZByfhp4uqOaOOX5PyeI5gek+sx
	GhpOgpezFPrV9QLctp3+W/6aIBAj6f8Uv+6DEgzrA/sCbqMhuzqonG3SQrvoFpXQW
X-Gm-Gg: AYBFou3KZdwzZFhM5jyb4Y7QbQW79jYSuMHfiOI4MNuvt4bralUkdt2ddIaqheginSF
	g3QpQwWPVC4ol6KU+qpvGgTkUUrLsgAW7evZPFZgrlVGg7S377l4bU06N69Mvz11qyJE5WDF+yN
	oeSRGRCHkhtS8i970a0fz7QmwxPewsJE/Z/oRUWRqboseVxCvzLnR4fWkvhlIGCogikxR78+JIu
	6yiQGceX8dUjf6WODNpcE71W80q964c/WAyCbaNxMSCKbodLuPg0u1QmApsHQYaN0AALFCqsVze
	ePJrjccFQ4sj8ardlam23qk16mA1+QKpMlnFA0/MjOFqBZ9Ybz5nGRB9MlijLv8i6amT9GZMpVW
	QCLTkcm5OvpE+IKofxD3Ivs9zYrYesQ==
X-Received: by 2002:a05:6a21:6816:b0:3d3:afa7:8101 with SMTP id adf61e73a8af0-3da3a16d1cdmr786600637.28.1788461698736;
        Thu, 03 Sep 2026 11:54:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:6816:b0:3d3:afa7:8101 with SMTP id adf61e73a8af0-3da3a16d1cdmr786529637.28.1788461698279;
        Thu, 03 Sep 2026 11:54:58 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:57 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:50 +0530
Subject: [PATCH net-next 8/9] net: stmmac: qcom-ethqos: add per-platform
 NOC clock voting
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-8-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=6340;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=3qNv1gt53nDwmaZH3husajnhbdisLPvYiqw3RUvnSA4=;
 b=tT0xjbelciTRGJKzrX4LgzDWW4xxzHa+Wp/2FPlqaG/hynm5ROaZNmS3jqmRfWpOIwkDXy2pv
 MG6s7z/MzO8B5WV/Lk3pM6k04iN/CQFs5mEAZIg7O5uTQqeVprKDkrJ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: xfI_qflIG9-0sCJntJvHKFYIgYODKeLY
X-Proofpoint-GUID: xfI_qflIG9-0sCJntJvHKFYIgYODKeLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX6mcAJutPCkKM
 0tq6/eEhZSbxv69+i+0qyqjopnnlILaZ4R8gsNUAxN4x8GcH8uopPNeQboLeDaCzNZNUTM/18M9
 5g9EYWYOcQdQUUr2Xm/SOphyZ3OtRNV/Cppy334EOdQbPLsxGb258XLz5lgAUmTWqOnlS8HxcPb
 Syntla9PPjTfXct1oLFHRx/6Vg67lH+cKD4Colq0SNkEZ2Hi25OEgKz+j3N+NZwF8Z3ZsF0iK6i
 AMD5peWISsMi9lgA6D+VirJUM/yhR8dGvrq0WYtAL9oU5/wa7JkIjS6bLghU5UkIVAznEg19tJy
 2ALYT6uzN2EqBErhKe6baDs46Azo8jobHfcEWH8i4zBjh42QdLw1lZatuCJDILS1ag8NQ04xbRY
 Cd8zBWVHa5KCu4b+cen0R/DaTN06ha0+ITCE8bkBhod0qQyBhtKQuGouCy0kVUoDryLSqErKcth
 i0JLVBU8vuTo/wNhreQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX+JObGFMzKUm5
 GjIYtDA718LUKMpu0X1AejTxOgpwV74IXy/tJmhG2vwzp+/Lf6gmfOl0DoMxdS3vuWfdW7aguX+
 XUmuCFcMPfr4SevGPeJTfgl61A/LZ6k=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99c284 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LOscwf8DjUB2Y-oEo0sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
that must be enabled before the DMA can reach memory. Add
ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
runtime structs so each compatible can declare its own set with per-clock
rates.  The clocks are acquired during probe and enabled/disabled
alongside the existing link clock in ethqos_clks_config().

No functional change for existing compatibles. This will help us when
we add support for Shikra.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 4f9bef662c5796ce3cca64b19a595bcdbebbf336..a31541506a4c930c76374d7d8b7eceb6f51f37a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_opp.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -84,11 +85,18 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+#define ETHQOS_MAX_NOC_CLKS			3
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
 };
 
+struct ethqos_noc_clk_cfg {
+	const char *id;
+	unsigned long rate;
+};
+
 struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *rgmii_por;
 	unsigned int num_rgmii_por;
@@ -98,6 +106,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const struct ethqos_noc_clk_cfg *noc_clk_cfg;
+	unsigned int num_noc_clks;
 };
 
 struct qcom_ethqos {
@@ -112,6 +122,10 @@ struct qcom_ethqos {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
+
+	struct clk_bulk_data noc_clks[ETHQOS_MAX_NOC_CLKS];
+	unsigned long noc_clk_rates[ETHQOS_MAX_NOC_CLKS];
+	int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -691,15 +705,51 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
+	unsigned int i;
 	int ret = 0;
 
 	if (enabled) {
+		if (ethqos->num_noc_clks) {
+			ret = dev_pm_opp_set_rate(&ethqos->pdev->dev,
+						  ethqos->noc_clk_rates[0]);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC OPP rate set failed: %d\n", ret);
+				return ret;
+			}
+
+			for (i = 1; i < ethqos->num_noc_clks; i++) {
+				ret = clk_set_rate(ethqos->noc_clks[i].clk,
+						   ethqos->noc_clk_rates[i]);
+				if (ret) {
+					dev_err(&ethqos->pdev->dev,
+						"NOC clock rate set failed: %d\n", ret);
+					dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
+					return ret;
+				}
+			}
+		}
+
 		ret = clk_prepare_enable(ethqos->link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
+			if (ethqos->num_noc_clks)
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
 			return ret;
 		}
 
+		if (ethqos->num_noc_clks) {
+			ret = clk_bulk_prepare_enable(ethqos->num_noc_clks,
+						      ethqos->noc_clks);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC clocks enable failed: %d\n", ret);
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
+				clk_disable_unprepare(ethqos->link_clk);
+				return ret;
+			}
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -708,7 +758,12 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		if (ethqos->num_noc_clks)
+			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
+						   ethqos->noc_clks);
 		clk_disable_unprepare(ethqos->link_clk);
+		if (ethqos->num_noc_clks)
+			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
 	}
 
 	return ret;
@@ -736,6 +791,46 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
+ * so ethqos_clks_config() can enable/disable them at runtime. The OPP
+ * table is used to propagate the required VDD_CX performance state via
+ * dev_pm_opp_set_rate().
+ */
+static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
+				     const struct ethqos_emac_driver_data *data)
+{
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	if (!data->num_noc_clks)
+		return 0;
+
+	for (i = 0; i < data->num_noc_clks; i++) {
+		ethqos->noc_clks[i].id = data->noc_clk_cfg[i].id;
+		ethqos->noc_clk_rates[i] = data->noc_clk_cfg[i].rate;
+	}
+	ethqos->num_noc_clks = data->num_noc_clks;
+
+	ret = devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
+
+	ret = devm_pm_opp_set_clkname(dev, data->noc_clk_cfg[0].id);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set OPP clock name\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
+
+	ret = dev_pm_opp_set_rate(dev, data->noc_clk_cfg[0].rate);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set initial NOC OPP rate\n");
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -795,6 +890,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
 
+	if (data->num_noc_clks) {
+		ret = qcom_ethqos_init_noc_clks(ethqos, data);
+		if (ret)
+			return ret;
+	}
+
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),

-- 
2.34.1

