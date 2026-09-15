Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C21C4A8A02
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475935; cv=none; b=tJ40Z0oE/1Yy/bTOqcBM6PtS9XFZC6kaBJP7Snge1iuhgMhbX3TJTVvnOeoS5RgcRtR4etdHTzb9q+1B+DorZxaD/TXWRb4Rp1bKHIRc6z7WKr/3/piRW7vXyijv6b170TiIUuHXO5NEGs+u3NT5f6Pd27922KIlYdNeWmcveFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475935; c=relaxed/simple;
	bh=DhaNtgMivv6Vp1qmM9I8vpAHsOLNcVSH8e/G7pgxaGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMhaZLT6JuHtfTonPqqPuU/QROmgWTNvCs1fcw0N3EpqG+Vi00FD4D6Uc6gWZ7vz8GQuBamvYcsIgB5gL/FTvYykokPwnzQiRL5IqYy6RIhtUqMxmQFk43MG1Jq//a1Cx3KagW0tNbhvbZt3ywINOx44pusuSh03//f4G0ITIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LE6sCeMy; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LE6sCeMy"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so4265856a91.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475930; x=1790080730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=;
        b=LE6sCeMyQvGH+EVad5pAIbbQBN9iWiQZSnR+EaFg5cToaVGy0AvDre8LkzcbPyjlKc
         3TuTu5Wa7wsKi363ZSBbu55psj1IaP9S5IqSGt82XrphHKfYpLYcVGk8xSF/s9+Mpxg0
         vv5xG8Y0RnIAtSYEj6LYirCHShk0BXiEBmoeq8f9LB9MlZQoz0YdOI1lzxwOJkMfCO9h
         O6lzgEVTPS+o1eLxG/WrSqwxFgou8mXLAlPRshzFsheKz0tIJM8wvllkwsylJKdut+j2
         EGBtfmY6BGfVLs/YT28YELJftANg5oVlDDgpuaCD/AYz3nyQ7MToUR9ILdpWR0ho20n9
         iKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475930; x=1790080730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=;
        b=FbigBcVplqWDW6r7d+2z1ugGtfL/c5jcqFIEl1ejjpqymYV3uTkKOFsAd1B6ruRY8F
         fAiG9Ov1lMujRMprwPAMHmDaLQbtmGzqztvBtMxiNmPzATKTL/lK/29aAr+7/seBi+36
         HzwWe8C0BohvjgdKxVT+5N9t9EARlcCyE0iXdozE/y8dqzhjybSA7VoQ/w2GLKU2HCfK
         6D+5nIRfkBelaOc+PKZuBxYzUCOfXq4ciTLo4KCPbYxfvUgsVfIq/OuESBnnkD5Vf7s2
         K5UVo1UByRey2ArtyhhS8IsocIjtGT3qMlXFqE1Y5872LeVn8bzX1mJMOFSdkaPN3iZy
         pwlw==
X-Forwarded-Encrypted: i=1; AKwUvBzp9lhtuD0BF+2feXUDurVhdCeGOcFujNaBTE64RWdCeJsaPZPbEqltb8TGzWYhH0AhyHmVLSU2ZI7b@vger.kernel.org
X-Gm-Message-State: AFuF++mR9JGjPecOJzr/KQSmgT3PY1XZMJDDxw9ps5m+WZJGgOF7ABjD
	0RtmymYYr6MDyZQK6YakFOD7MVZFf9hAXadmbdLZYX3iMx/odQiY6NOl
X-Gm-Gg: AYBFou2ZrtpbacOv2QcCIkQV9uFCUM85pm4NDgKzNED3XV5xm7e+PYlWVaTnTS2msyG
	2OujKc4FlvaPRUA5Uvft+BMveWW8BHbM7UN259iI0mfeOB0Y1V28NCGJsU58zF7Vpxr/BdrMV7W
	nouCgRZgmciyuGxDwBzM1ASvBc5rTEjQs0iKGCysmBCa2sCgbf8bnzcZFIwYQbpL7IaaGHEy3l1
	uogrVHiA0Sr59lW1vVUnIY55gBsKqcBeUz4DR1f7IxTDLgLWcWpv09mA9v+wI3FVag9YEAwrA0B
	ImqdhVya+Q9uHb180kDHKrFkkTgWV+ggxFGfqd+DpmkEPR1oAkCPPX96z+jpKNi1tBA4QkTpZmQ
	pR9d5F+gfULPEXvj8IxNGe5NEw3J2Ul6IEcW2llnL94DRjYwR11mY8DxcE0u49aK5RnVFwwUAW2
	1KhsHY0dIXx3bswQnYibH7U/oXm6tmwO3Nl8qW9pFB5NhFncUhmZ8twarr2A1oRRtKPiIJAg==
X-Received: by 2002:a17:90b:4990:b0:39e:ad:d31b with SMTP id 98e67ed59e1d1-39e10e2d518mr1347485a91.6.1789475930366;
        Tue, 15 Sep 2026 05:38:50 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:49 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v6 03/11] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue, 15 Sep 2026 20:37:52 +0800
Message-ID: <20260915123802.1561724-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
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

From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
bit 1 (pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0,
the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
remains at GMAC1.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 7843356a4dd47..7b867e7520064 100644
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
 
+	priv->sgmii_mac_sel = 1;
+	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
+
 	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
 	/* fallback to old behaviour */
 	if (PTR_ERR(priv->phy_rst) == -ENOENT)
@@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
 		break;
 
 	case PHY_TYPE_SGMII:
+		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
+					     priv->sgmii_mac_sel > 0);
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

