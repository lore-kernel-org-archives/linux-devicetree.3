Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6DE4CA263
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203063; cv=none; b=LQryjIZQHXDghkthltbRBAFFzBGQM3gcd/W2riG+7dLCvr9s3l1T9dlHtsOk/Ddv01CzV9Gx0V7FtLK/HWByIW0vPlnl+OBCE0sRIiaXbq0VfIfyf5INb5gpsvnq64bljxOsD62otXMydt3NzdrW7ypY3d2T65Wyz3N7Bl95vXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203063; c=relaxed/simple;
	bh=ZmBtT5CKOpRmxcc7v3W7uVY7c9Er9mvwK+eDsLT5JgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NYSOCREMJn0dB+17MvojJNhMO+Dygm3+oID9chWYUeZ9AiW2ysBmxtIcFY/kK4+KoDn2moqHDVFI7yPRjr+YnCuRIWDier6HdeK7to6lIlBTXWEkXQnI5tILYBk4NtEbqzNXqm8g8QJohXMZzG2GFpBpWNS6BfScQdqxHH/ryWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUO8Nask; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjyLPbRr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUO8Nask";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjyLPbRr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BISUTO1302516
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=; b=MUO8NaskBty+GQfn
	grcHqROxQkF2kAJTeL7/02vjr7Om122IM0OxpiKBgVuC1yhFBwQwzqAXNoK+Bap2
	pCyjGAQ4vPTsaeX28NlguttVcG90Dlu1zeWkGURiMS9JvsbpqQQVCmgRxfIw0fdV
	pUsFjSeUWZvM6Jhj56BI4glbnUbmbxM92ll7HdCqJ93dEs0NjtCOarWtkymEWjrY
	mJHy2Y8zYdlTzQPuYX4IWGGU38CiktMGdA2s0sr73R1lys1CuDnoajtKfyP2r0oA
	mO0FREmCkDR8Pti0cLAxIRKydcif5MTDrYNLvRnMBqxEEp+wu+MqZjLML8+z2Yls
	MrwdHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ud4bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:37:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so144460a91.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203060; x=1781807860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=;
        b=UjyLPbRrjz+CyGvcAqsGthBSjk0WsMQzmauRAgBqz6W6kXeULogjANeF5ztp4AIn5S
         XVoiQzyZFANtm9EKJSyKFZhfvyqW2wRzu/DRIji1rqdFYpS+QRdkZeTJBCxPEs+6f6YY
         MwKmwlCmuLljCye6dmphEJ+mMoa507AnpJfxmCXID1uOQHxFtAWKxYNq8VXer3dte7Vd
         cM+UqXlcQ18GwOstd87psdckx2oTgbyoHfJYv2GEZ9R66NDCGcEUnpaQ5xd/Vo9j7NCN
         43K2ACpQG7iQW6CIUjVAKJIxn6N3k/jm/8kC2CBtsvAE09Pu+nu2bahsa0UBCLRdSWKy
         4ERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203060; x=1781807860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=;
        b=e8/u7DLiJ/+vpRfJttvmoCNKzX26nrXYOJTIyDFVkT41RY37VdQaZ3HcIfP+ll2Q2s
         bh7wlLQr6PDCEG5lIIQ0YDSWd28qO/XGu6nKKWeIAQs0Zq3lLb9/V8NT1IHhLGMOPXeB
         0WTNk4XVnjAwlRgGYlx5FX0um33SqvrC/Mfog4hbp182T1TsotufjnbKlyvPZaWERcVl
         SwjIjs/g9C5WCZ2jebkfTk7bwMVBl3/tslmtaxq5GlyhqnQzfocEHWDT8CynVLXvg1ZI
         1aJcqtMZYlnF9UVmkTgVsJ9CnabuTJ0k1ZI3k3AAV/qrzVKSpjxDhSR0A437fZuuyl/a
         G3/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8SNWZ8hfsSp2aEPKimdxrobNjC/5nyK12ivQ9WEx7QUl3XZMKFZ6fJ2850PzIALPVkyp1l4d4pUWIl@vger.kernel.org
X-Gm-Message-State: AOJu0YwDTTkhM2/j+wHg3ps/ZTvq5KrZk0T+V4GzS2bq6Q4gf/JD5kuc
	cVR9Ucu4naxnnV6TOvDKMZ04zR0ugqdx8/qa8/HG3BoEwWTEn5fsEQOCagTkiLFT/h4i+VDwuVv
	jWU2QoBpaRcNuC0hVkeEScVxBcAm0gJDEEKQKUNkdfWsU1yaga9tzTmyIxtoyu6tz
X-Gm-Gg: Acq92OFnO2R9QCcBTXx4WQjLH5xDdbSgBIH646+EMTw91amh6Ty1E98fDKO6urWMWEN
	E6ljJSghs6DoHQxTNs0DvbTYwCpmQl1HqTbgol4oNEIQYqEXhBY3rNAP/BN0Ea+T6FxijSI3xoH
	//qdMe/9ZGlUI0WTAzj76w0vInwiD687dzRpVbhST+CwG7Yasn8vqwf2901z7/Pqv/JfULH0ttO
	gJG0feqrsihzZKvwB5OOqPcxmCV3g1aan+NLLAPvRKlgjba73D/q65MC3/5EdpUS9enZHpQLPm6
	fE3pgvzlNg9YwfdBZgzWxyZ+TEP7Gh3B1ho9exmol5iAn/L4hF+knFT+B42b8DWcRGplT8rexAN
	9MvokkpvxKVjuKlDXSc7+ji5i9nqgjD55E35De5DpvClt/6Fk9hA=
X-Received: by 2002:a17:90b:2690:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-377a4ca0e30mr4643592a91.16.1781203060241;
        Thu, 11 Jun 2026 11:37:40 -0700 (PDT)
X-Received: by 2002:a17:90b:2690:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-377a4ca0e30mr4643571a91.16.1781203059802;
        Thu, 11 Jun 2026 11:37:39 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:39 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:00 +0530
Subject: [PATCH RFC 4/9] net: stmmac: qcom-ethqos: add per-platform NOC
 clock voting
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=4681;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=ZmBtT5CKOpRmxcc7v3W7uVY7c9Er9mvwK+eDsLT5JgE=;
 b=bCe8anHiaYQQwnOm3jo4Hsfoo/mKrJW/Wl8EEkqNTPeb4F7OP3gQPxML+Va5VRquQ4ea3SbeS
 NSdDKQSUdd8CSPtEDIX1z/IMfhBJE0waxtMBBKSSF5s2NDKd8mzvSC7
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX2LPEXwqMYjqV
 fhL3aTVRohXdrrbjYbSnnz7R27z1kRkXW9Re95FA5KaUxuBUPMm9STiJc/purdKQ2cixeEbvNKk
 TYIbNRxnCZLlfVYakNFna+829carDmA=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2b0075 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=upsBg6xUXwFThmIlPvgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX7+USKMVh2dSh
 wAN0i4sQtAs1EMDhDrHgvuBEF3XkkYd8IumGHelFAHEPULO+D+1vx9Zsqd7UyJ8vxtLluMTgkI+
 tY8PZmTAIimZWeS7zVcymU19v+o1QqMvFzjvw0b44VcEO5Jc/TymKCYgNqfR9mXESyuWH3aIiVh
 mEq7SHncgxfSRoCPFCWgLWYjIH6Jriy7dBXXP5bjZZz0dMhosPmpNu6PP+UVHNfLiXIJBD49T2e
 Vh0MBhaEk1IgIX5jkFjluZbJYSUqCNtWX0vDXZVpgbhaAPxcKIt+PFZsExYzwkMhENyVa1qeHne
 2eVJ2t2OX8nB0slfwHg8aVAnOx/jysJAbj6tsMO7OSDTd3wYfHrmRKqpVfGk915fHg4UiKV8fWu
 6cGCBGvjnheAWh+HQVZAFKIm0eLFmOUXkZXkXudPHN5oSE3Ik3PToFeiyjiOnXSk/+MX2x3tfXh
 4/j4D17vi0ZqHlNO/0g==
X-Proofpoint-GUID: mWGiO7kfdRJjEjEXoG3zWAs57uKwMJRn
X-Proofpoint-ORIG-GUID: mWGiO7kfdRJjEjEXoG3zWAs57uKwMJRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110185

Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
that must be enabled before the DMA can reach memory.  Add
ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
runtime structs so each compatible can declare its own set with per-clock
rates.  The clocks are acquired during probe and enabled/disabled
alongside the existing link clock in ethqos_clks_config().

No functional change for existing compatibles. This will help us when
we add support for Shikra.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index bec08f1eb8cb41484ba3c91c77393e163e7fd071..f4d4b419a76277cc6c56f03bb10d883cd4dff424 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -84,11 +84,18 @@
 
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
@@ -98,6 +105,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const struct ethqos_noc_clk_cfg *noc_clk_cfg;
+	unsigned int num_noc_clks;
 };
 
 struct qcom_ethqos {
@@ -112,6 +121,9 @@ struct qcom_ethqos {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
+
+	struct clk_bulk_data noc_clks[ETHQOS_MAX_NOC_CLKS];
+	int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -696,6 +708,17 @@ static int ethqos_clks_config(void *priv, bool enabled)
 			return ret;
 		}
 
+		if (ethqos->num_noc_clks) {
+			ret = clk_bulk_prepare_enable(ethqos->num_noc_clks,
+						      ethqos->noc_clks);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC clocks enable failed: %d\n", ret);
+				clk_disable_unprepare(ethqos->link_clk);
+				return ret;
+			}
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -704,6 +727,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		if (ethqos->num_noc_clks)
+			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
+						   ethqos->noc_clks);
 		clk_disable_unprepare(ethqos->link_clk);
 	}
 
@@ -732,6 +758,37 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+/*
+ * Some SoCs gate interconnect access to the System NOC behind dedicated
+ * clocks.  Acquire them, set their required rates, and store the result in
+ * ethqos so ethqos_clks_config() can enable/disable them at runtime.
+ */
+static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
+				     const struct ethqos_emac_driver_data *data)
+{
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < data->num_noc_clks; i++)
+		ethqos->noc_clks[i].id = data->noc_clk_cfg[i].id;
+	ethqos->num_noc_clks = data->num_noc_clks;
+
+	ret = devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
+
+	for (i = 0; i < data->num_noc_clks; i++) {
+		ret = clk_set_rate(ethqos->noc_clks[i].clk,
+				   data->noc_clk_cfg[i].rate);
+		if (ret)
+			dev_warn(dev, "Failed to set %s rate: %d\n",
+				 data->noc_clk_cfg[i].id, ret);
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -791,6 +848,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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

