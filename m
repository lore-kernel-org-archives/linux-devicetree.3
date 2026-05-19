Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1860C3537F1
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169651; cv=none; b=PjW+p2HmPKAqJjtN3iq1coOgb+uIVw0NEJVTqt5eI8kSRa7UDQwcqZjdlCeZhCkNsDkY4A0NEpLXDC8rE019utLoBXWhMOs2svWC+DkT/B+jm8TBTzt833YlRccvsGVwILRpkEQkWAqXkhYgB+L3DmDAX6No/LdW21s+T9DJ3vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169651; c=relaxed/simple;
	bh=MbaTZPbJ/JsKncMTk7duiSh2ZYiCvvSREcklhYtrLDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5g2t6nwccO0BbEqg81CVSttH4CgDpJw6QuE5q314Oio4FvmEo5HSvXPeQpJk1HEfXscRRDj0y+wqSdronpO6cD4vndm/mongF9CW8+jlALUdHJR1JpO633UMiRyuIa0zOns070r2M3EyeZmhJvfwYJ6dbnw+kOPRKZrBzGdVpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gkRnk846; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPOtuErF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gkRnk846";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPOtuErF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1BTgZ2975785
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5B1VrBCZnVKjjIU3TaDRNw/BnDir7OFUrpirZ5gPu8=; b=gkRnk846rzCIkExj
	s0v+5HaktDA1pg0paPZD5FI5hLgM4E33gUQmnvskFjG/GxAsXJiRc/LxNjfR81LJ
	qN3l5poLWdI0p4/5DGg2m6UfG0CtBJa11MqW6OWED+bYOIqUbFcoQrz/qHeUChuL
	dwIVsdJ9RfAIGSWIxm3WswngL3h723JS8jqgIiqq09/yzedtb2XpiSliRT2OOJfC
	+yjcdhvg1l74W2aG1Yobxa1amTtKoRuL1gT45G4Ha35Urevo6YGuFPN5e2IRWBmr
	LgTWXlKGeIEVKeoelIcCJLv7kpOBsU3rSdhxaBwfNtC21Rt57g9AuKWuLOk7PDy/
	knH/JA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4ask3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:47:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-135916eefa0so14544222c88.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169646; x=1779774446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5B1VrBCZnVKjjIU3TaDRNw/BnDir7OFUrpirZ5gPu8=;
        b=aPOtuErFes1hPrc30DhQkXqx5/0zZWtdh1rOcBXNRGnt6sCejna+W2AFB4FnPzDAHB
         yBybWarkTGgRJZmtLmkVT5U83KEMjNCsNV01efVgn+18dJEugjCaouDZx1I3KxL9bdN3
         mhKgRvTFKRKIXMyXK/0fOwv5N+sPqOPV7DNWAkNyKKn/GBJE4Echt7qqLoJi/6nuJ3Kx
         1AtHoeLCqxdFCXp39x341M/icjlPbHbjp71LPr4sLlCzLDBRC1YkdEqBMbg76DZYzMAh
         Ld+PW0XfJr7GwATLsgtmp+UvNgrw8Mo1A5YwvX3p3TGtaArJ0LFnxoT0S90ruOav0fwE
         mqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169646; x=1779774446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5B1VrBCZnVKjjIU3TaDRNw/BnDir7OFUrpirZ5gPu8=;
        b=Xt5ClogEV9RL7pspr1LcF3C+Lq2AIVsyLh0fcjdI/PUeL9I69OX8a+smaO25jeOdf8
         8CmgD2gx2fRG6mpwgRaEBP8zoWcBq/UhEX52rbvY5grvxKilM/T1v3MiApoDo7FYqcvq
         Szwmi7fdR4aXk3fZUGMuPoUV50dHQA0nxU2UkG7jxZyGnGNCoQ1rUQlvdIn6GujA72Ep
         bg5Eoy4WcbjxfsqarDphvXd14+cNUOQtBo6QzNGQ9O5UaGX1As5FKy1xr8V0Tf1rtoak
         oEbC0DDCK6KNW4FrQfGfex23VmKuFA2rP4erceL8faHHvCWS8+XVOg57dkMUwSSb1VAQ
         he5g==
X-Forwarded-Encrypted: i=1; AFNElJ+eyBh6JgUN79FpzA/XC4en1hcVYyM5ZEvNxq/8snT3s04fhMnzHgFrV2wZP5t7A6zxpIKCYV3NE5JW@vger.kernel.org
X-Gm-Message-State: AOJu0YyGn/5NF/Tq+TSI/d2Vh/TwS+8SdREnPsaybiuA3D8mP6J+a9Lh
	R3+gl3Rwh7dImARBOU03rJ9Qqfv+NGr8lXZ/ywWLt+edBW3AS4WFQ2BCOQzLVK+nn9ec5qK93gX
	aC1MRgCTgClgVI/RMDNqgQWDCNdhZaxWNDjkzAkGVTtXcy8SrfuoQKCixmXecmXEp
X-Gm-Gg: Acq92OHIkrD3HEcOhp/YmbrFvAQND4qf4zawby44P/miLtew8JUJdDcJs+8XRc3YE6w
	3g19h4cf082R/0SFB9NaGNCuxjTp18dsv4fG3QklTZitmMxLV99ReW7e844jhAGhBBiYxyRPGmQ
	96IFBHEz3WlQYKBHzvmLPY9U22YbHeLu1QbSLcB2cK2rX9yHTf0lFfNZeJp+bR3G50MNJgnjvo2
	ODbQktnPLokMjfgHCXgd5e+GcqGvDPGfbSBkzjfXoCe+cBqpTHba3SMkd0l6I7MHlp8mgqzmry+
	/uq06xIiZBLZAIJUpl+pNU6zK4t+I14Zb89/m74UvdsJFAgBtQJr8jkPA2sbH47XFSOTtTjcIUC
	r1jWKllp2nn7neiKCY8EBYRa+giWWgi1icRw0zb0q9QBvcXqgoLsWda4J5890hIxovDkaFyyolg
	G2+dw=
X-Received: by 2002:a05:7300:fb83:b0:2ed:ff78:2c12 with SMTP id 5a478bee46e88-303986b7f00mr9394479eec.34.1779169646376;
        Mon, 18 May 2026 22:47:26 -0700 (PDT)
X-Received: by 2002:a05:7300:fb83:b0:2ed:ff78:2c12 with SMTP id 5a478bee46e88-303986b7f00mr9394456eec.34.1779169645860;
        Mon, 18 May 2026 22:47:25 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:25 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:16 -0700
Subject: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk register
 and parse_dt helpers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=5256;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=MbaTZPbJ/JsKncMTk7duiSh2ZYiCvvSREcklhYtrLDc=;
 b=Dq3RCcs82o0H2virjARvXvlTSyqDuHN+lBQRphnHRjl/IthNFWB96EylAfdOP6gHzuQPubGCY
 3RMr5wszk+1Ce83B2703ATv5W3RlvPKpcAXgRqGxLvicpvvGZAfXDtQ
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0bf96f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2AX8zLxBezjo-DDFgScA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: sdvgiMj9wKMx6BsDM-acZbKh1GuPWta6
X-Proofpoint-GUID: sdvgiMj9wKMx6BsDM-acZbKh1GuPWta6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX1t/8jGPf6lLm
 TN658jOE18cqR33M5qKSdTFV/ORct5VmGTQrJRszWxEVPFgxiJZqmjRCntC5mjoe7tSjr0NsGuW
 r6cuUzx4iRpkCzwsbAL6GJlF/JpUfea179ffjrWdIryPUIu7sckpSzO+VuzA1bcPzH2p5Ezlxqi
 2Nv/wmqBgTJTo/AuXjfopjOY6XBGsQivRC3F5PolCHhcrfEzw0sjNRJsYMCl90ENNApm6rnYaTb
 UrQ3wKImo9sLdeitm67QB0VVeVWl7PiQa9ifyVDjFStJ8C7i82ZnEfiB6UvfGz9wpQk6fIeQuiA
 HxF1JC8FJE59k2Lv20cOsrr4yFWZvurRQO+8bI0L6WUi8Oho6IJVpgng/CChMYiLxDhWqqLqtGs
 sAQCcD1EbWvFbH5Fiq3WilPVQGMpRox9IzXl8cT25Ctj230w5vAWvsxE2aayi0I5X/zCV9TobGE
 Yqcl/VX/OrhHnWbiGLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053

Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
under a single DT node, each requiring its own pipe clock registration and
DT resource mapping. The current helpers are tightly coupled to a single
qmp_pcie instance, which prevents reuse across sub-PHY instances.

Refactor __phy_pipe_clk_register() as a generic helper and reduce
phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
mapping and pipe-clock setup that will be shared between sub-PHY instances,
with pipe clock names parameterised per instance.

This is a preparatory step before adding multi-PHY support. No functional
change for existing platforms.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 1dee4733d4f2..6332f15f78ca 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -5116,32 +5116,34 @@ static void phy_clk_release_provider(void *res)
  *    clk  |   +-------+   |                   +-----+
  *         +---------------+
  */
-static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
+static int __phy_pipe_clk_register(struct device *dev, struct device_node *np,
+				   int clk_name_index, struct clk_fixed_rate *fixed)
 {
-	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
 	struct clk_init_data init = { };
 	int ret;
 
-	ret = of_property_read_string_index(np, "clock-output-names", 0, &init.name);
+	ret = of_property_read_string_index(np, "clock-output-names", clk_name_index,
+					    &init.name);
 	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
+		dev_err(dev, "%pOFn: No clock-output-names\n", np);
 		return ret;
 	}
 
 	init.ops = &clk_fixed_rate_ops;
 
-	/*
-	 * Controllers using QMP PHY-s use 125MHz pipe clock interface
-	 * unless other frequency is specified in the PHY config.
-	 */
-	if (qmp->cfg->pipe_clock_rate)
-		fixed->fixed_rate = qmp->cfg->pipe_clock_rate;
-	else
+	/* Default to 125MHz if caller did not pre-populate a rate. */
+	if (!fixed->fixed_rate)
 		fixed->fixed_rate = 125000000;
 
 	fixed->hw.init = &init;
 
-	return devm_clk_hw_register(qmp->dev, &fixed->hw);
+	return devm_clk_hw_register(dev, &fixed->hw);
+}
+
+static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
+{
+	qmp->pipe_clk_fixed.fixed_rate = qmp->cfg->pipe_clock_rate;
+	return __phy_pipe_clk_register(qmp->dev, np, 0, &qmp->pipe_clk_fixed);
 }
 
 /*
@@ -5336,26 +5338,18 @@ static int qmp_pcie_get_4ln_config(struct qmp_pcie *qmp)
 	return 0;
 }
 
-static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
+static int qmp_pcie_parse_dt_common(struct qmp_pcie *qmp, void __iomem *base,
+				    const char *pipe_clk_name,
+				    const char *pipediv2_clk_name)
 {
-	struct platform_device *pdev = to_platform_device(qmp->dev);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	const struct qmp_pcie_offsets *offs = cfg->offsets;
 	struct device *dev = qmp->dev;
-	void __iomem *base;
 	int ret;
 
 	if (!offs)
 		return -EINVAL;
 
-	ret = qmp_pcie_get_4ln_config(qmp);
-	if (ret)
-		return ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
 	qmp->serdes = base + offs->serdes;
 	qmp->pcs = base + offs->pcs;
 	qmp->pcs_misc = base + offs->pcs_misc;
@@ -5368,12 +5362,6 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 		qmp->rx2 = base + offs->rx2;
 	}
 
-	if (qmp->cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
-		qmp->port_b = devm_platform_ioremap_resource(pdev, 1);
-		if (IS_ERR(qmp->port_b))
-			return PTR_ERR(qmp->port_b);
-	}
-
 	qmp->txz = base + offs->txz;
 	qmp->rxz = base + offs->rxz;
 
@@ -5381,17 +5369,41 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 		qmp->ln_shrd = base + offs->ln_shrd;
 
 	qmp->num_pipe_clks = 2;
-	qmp->pipe_clks[0].id = "pipe";
-	qmp->pipe_clks[1].id = "pipediv2";
+	qmp->pipe_clks[0].id = pipe_clk_name;
+	qmp->pipe_clks[1].id = pipediv2_clk_name;
 
 	ret = devm_clk_bulk_get(dev, 1, qmp->pipe_clks);
 	if (ret)
 		return ret;
 
-	ret = devm_clk_bulk_get_optional(dev, qmp->num_pipe_clks - 1, qmp->pipe_clks + 1);
+	return devm_clk_bulk_get_optional(dev, qmp->num_pipe_clks - 1,
+					  qmp->pipe_clks + 1);
+}
+
+static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
+{
+	struct platform_device *pdev = to_platform_device(qmp->dev);
+	void __iomem *base;
+	int ret;
+
+	ret = qmp_pcie_get_4ln_config(qmp);
+	if (ret)
+		return ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ret = qmp_pcie_parse_dt_common(qmp, base, "pipe", "pipediv2");
 	if (ret)
 		return ret;
 
+	if (qmp->cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
+		qmp->port_b = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(qmp->port_b))
+			return PTR_ERR(qmp->port_b);
+	}
+
 	return 0;
 }
 

-- 
2.34.1

