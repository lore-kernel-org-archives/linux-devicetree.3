Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614EC418A58
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056449; cv=none; b=Q1+0klg714Dnktbfp5KikOG2S/+tSxbHtW0yoYxfVrHjo7G132BytHT3nmhKffCQMwVA2IncvJhj6rXN0kef6RmSOpqRxGjjwZZOLFPRGa902wNBkoX0dYBtHe95K2rZeHT0OvBqApEvqL5u8S4Lj67fSguFPXhwNoUiSJid1eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056449; c=relaxed/simple;
	bh=ijfFWZi8yhZ0htXUYCmyIn6pdY++5flhVwsw4r77Oig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEOByjns6MIss8pLUQdi4g4jk7P8Zyr0XoR2W/ItzsrTqziTkSeh7oBgcpCXbN8penyZ65Uvj2HWjnn3pfbN83A0jlzqXQffItCawcmWlLKuhKuH92ehr5cu3DyC4MiJWw9ns8dZpln3QbRRZFBWNMrhGonauPj7T8E0IbtYJVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIVt3usQ; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIVt3usQ"
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ceb5a39c48so4974735ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056448; x=1784661248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmQewzkR5beR2pgYuttXOlNbbfZWq2Schv5a88VtBYQ=;
        b=jIVt3usQfRXuRNf7Th3Yl7yvf3EP3DE1rb0IhFT6xLfmmHNeUKwtwU+1w4JyKeKIw1
         NjAAEL7TbdrzmsXsr3higyfaTthCFfpuzecUs4xT/LId9Xc8ypZIHABFxVOBmBTzXpT7
         L8ADx5gwT7GiXKfD9ZnaBAyGi90RpWHQYxipaKSTQUWP0QwSQnrz4GogvylPZyOIZilp
         n/4fFejSuD7zmAzEc9Gcl8zQ++C9Ttq1KSieM+iCfPBYitv4VepH5zmFQmC+FJJ7kdo2
         iJiyfHgs00V2WmBemzYgKGprEX7PFUo8H1OhQK2iBpTQaOLSNbbmYfi+3gU0APEM0p3Z
         XYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056448; x=1784661248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pmQewzkR5beR2pgYuttXOlNbbfZWq2Schv5a88VtBYQ=;
        b=D8US2+vixyz5g5yaW7sDpKbZj4L5B2s7neJ0EhdWLKNZRcxCSkK0FoE7owC9RY+vmo
         F3eprPIQz7GJH4FNO0axCLl8wXLZld1fHheIuWlmoMtBZaZLpAaTNxoQx8HUATlBmLTG
         V2Xy4wD3Ycjw6XGB3bnKlHcrzhZcT31tqcCeRr7De7NSQdZYbpmXsbwKafu/lSHxjyv9
         H9WeQmxCs1uOLb0WlpFl6Bia4o7p3UJ6pg5rZAh/Kkh44AR9kNozvregvoxrmplkmqNb
         tzYcRASNFFvloEk6G2c+mlBqntmIG7Rxf0ExKxm19saP787GrTS0R080CoDO/Qt/Gdhr
         Punw==
X-Forwarded-Encrypted: i=1; AHgh+RqSI4OCFNFF6iWrR43GmPoEZstxtWVQTiq2RgILIurfTvE1qz6abAR/d9IOMFlK4svXo+fnG8L6sq5S@vger.kernel.org
X-Gm-Message-State: AOJu0YyvzuzBLQwRmcScVQvFaBaBxiHPb+3jEzuXgbJfamYSHEH8ALr7
	k6xpZP5TpmesPL1TJvda96mYKgzAfsEKZGjgtWsWOmQc/Q6G8/d+v0G7
X-Gm-Gg: AfdE7ck4k6BmvXHw1Y2U3CBZfTzyoCDf8MzlbXL/00rHA7KugfWl//82CfLTWTzkinN
	1Kiz0bX2KnaBLWZ6sLlDb/sCaCzoE82/fZc6qfYRIrWPs4FxtevBr0ICLmnfK7+wy3R9x6/natS
	7BqXAw5AiCmHZ7yQX8OH7hvW8/+WIFdXF56k3v9v+KKMesiZOoKvxBdt62z9Q84Sk0PNRYXi9li
	wAPZxOD0Lib7rzm2RzyKcULRPZoi3RXcNvJ95VJVTLEJoyxQe97BHt0+6wdI7i4Ubk/uXrLDPT4
	35UdhhFxF83WyKm6y1tOXloTLQcikgr4NEeZO2Kt/xzd1AxgByclgrmvi3D8eSkDaUAG0STn9Ub
	j5v9wLaBppqg12RmnT3x6WwLEtjaB83UolTvz7B6k9ZJtxnXZNzB3fS+CSRHphkf3JTOit3/Sva
	Zt3E+eYvalnjg+Y4NjjkH5mWf9pLOIQHlV
X-Received: by 2002:a17:903:292:b0:2ca:52ce:6f91 with SMTP id d9443c01a7336-2ce9f285148mr135561755ad.27.1784056447537;
        Tue, 14 Jul 2026 12:14:07 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:14:07 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 03/10] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Wed, 15 Jul 2026 03:08:31 +0800
Message-ID: <20260714191341.690906-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714191341.690906-1-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the GRF register pipe_sgmii_mac_sel.

Add support for this selection by introducing
the "rockchip,sgmii-mac-sel" DT property.

When the property is set to a non-zero value, GMAC1 is selected;
otherwise GMAC0 remains the default. (HW Reset Value: GMAC1)

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 2b0f152f54709..ff290bc18589a 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
 	struct combphy_reg pipe_xpcs_phy_ready;
 	struct combphy_reg pipe_pcie1l0_sel;
 	struct combphy_reg pipe_pcie1l1_sel;
+	struct combphy_reg pipe_sgmii_mac_sel;
 	struct combphy_reg u3otg0_port_en;
 	struct combphy_reg u3otg1_port_en;
 };
@@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
 	bool enable_ssc;
 	bool ext_refclk;
 	struct clk *refclk;
+	u32 sgmii_mac_sel;
 };
 
 static void rockchip_combphy_updatel(struct rockchip_combphy_priv *priv,
@@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
 
 	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
 
+	priv->sgmii_mac_sel = 0;
+	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
+
 	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
 	/* fallback to old behaviour */
 	if (PTR_ERR(priv->phy_rst) == -ENOENT)
@@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
 		break;
 
 	case PHY_TYPE_SGMII:
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
+					priv->sgmii_mac_sel > 0);
 		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
 		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);
@@ -984,6 +991,7 @@ static const struct rockchip_combphy_grfcfg rk3568_combphy_grfcfgs = {
 	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x4407 },
 	/* pipe-grf */
 	.pipe_con0_for_sata	= { 0x0000, 15, 0, 0x00, 0x2220 },
+	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },
 	.pipe_xpcs_phy_ready	= { 0x0040, 2, 2, 0x00, 0x01 },
 	.u3otg0_port_en		= { 0x0104, 15, 0, 0x0181, 0x1100 },
 	.u3otg1_port_en		= { 0x0144, 15, 0, 0x0181, 0x1100 },
-- 
2.47.3

