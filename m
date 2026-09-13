Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9613A4F32
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326004; cv=none; b=o3dC7FYqHsXp8d05dh21q0+IVV+oOC0+MZNWq5catyEhJzMH/0TaGv0VsqE+QkZ6d8qx7cl1GQSTf/IYhueK7PwW+m8XPkloS84ff9YCzn4MzfMs1lPFiQJav040fVaRRjX6JTTE9f3++6biGJVVqNM95XIRJcddXrZtvSrLFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326004; c=relaxed/simple;
	bh=DhaNtgMivv6Vp1qmM9I8vpAHsOLNcVSH8e/G7pgxaGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4Sj9mrAJKLM9Ghh7pl/rng0mIBT3QtSQ+lp+FcykJdQmDpJrG5uRG5sDdQfzCaoE+bVWeOvXbEnpUXzSThE6+EwKlwRycACQHkvrIElpsz+Duuuwur42xcI21GlXgXmFoS2DFBgwRy+7W8ACHvn2ubQZsLQK8oWQDmq7kiv4Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOVHBOST; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOVHBOST"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d952ac253dso15530785ad.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326001; x=1789930801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=;
        b=FOVHBOSTRSEbjmiz/4OKeYJsDwgGH6Ou62G/yFEMYzzTOm//11T21Cwt4TnSZFoAl9
         1RTyzsqbKZR+NRGG+ZdbiKkJG/uTV74WB5TS4hihOOX54Qjz6LeuKMlof+y5Xyh87Hoq
         Mh5WSIVDfWBJP1ULA20tWtsQvehrRInmqq8w10vieyMd/hAk4n2md6lXbnfP5pohKsmB
         uw53LvUv3AZCZcHg4BZGMG09kdhSp+cmET7Lix4X6eO4BaaSQntzt9jSAOVvOTJZnFCY
         w/g0OR8XyCGPrTpXyky6KUKXEVWIUwFaEy1Sd18ueQzM35YpqJTdd1ouur0buyD93lGd
         D8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326001; x=1789930801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfuBhi93xftDhshvbIutU6M31n4jH/ZjDQQ4jx2k6og=;
        b=Cz3PZOz8bTDqe1yK8TsBqzUNXS9tc5QzgppwVrNGP1aOl8dK/Ej8pP0TkZlb0ROuKO
         z44CvxiNGdAL8iI1YSAm38Woi2stWUuL31ZR2QrSX3ZhGr4fR6sticiz6/B0/RbiRrA/
         DAWzAblJus8L+BTLiOsBkDdNRzqCXNpW4HbwDrZzqJIxHM6l9w+T5C3eFc4AJk25Zgpv
         OHRqW7CJChzEQn3pIAatnJ6DTgj+6ZJWDjrq6MOAdQYBs/EYh3C4pvYKqHRk2pwR0r70
         ggSXDowYjJXGVjoHCXKA3zprkHHKVM8IiFvcwXYkNmYoHlpAwx/oIkOdQ7uNs2ELEG55
         U4zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbi/qZPlPzaCD/u+81KOtWmLc9rJDOB0PhGtllPKSTxCHjAoReXpMz8uSyGVNmxL264S9HlaFt0Oa3@vger.kernel.org
X-Gm-Message-State: AFuF++looOkOMKOyeysfZ9L3kNQUMiWCAnZGCvM84aBS5yru7XNB3QeA
	Fie+rZ5Ouf/nRqeh3Za4d2FVpR7RKQxFKVSefyzXvsHPpEDcxpa8FxvW
X-Gm-Gg: AYBFou0PzNX4zLhdXliHVhY7whhoZ++GAkzUSiIgOV+tfarT9UQlPEyXFf/7+RlwL0P
	IGB3b1VcAjEZGEXgzA0E3dWWLLegb6X+pl5WmlrxGVc0oktXHHkbcQZgDYo8FbpRhvKmDjRlzBP
	nMEYSM3h89cwfp+MHZ6co88x406yt8gwrcJ9j8adnZMlm6QqM45pRyadNl4QYPBrk1NJsWbDAtT
	JUWCUh6SNGbKxRQn4Q5orSz8kKHMl8wOWtONWg14JN87L7zHeO3exkGeXwWhaQ5LPNiqwua9EEn
	800CQG3VArWRtncs/lPx6nTR+3DcsPGNbisCkxbbINBl67OIXyEszmBv3vhgGDwIdXF0ts3kNXQ
	hiYH7DVPJr834OXpq/wCBT0hwUW6w14v6La4aQlyIgsS1Irg/I2gvWGxoj/MoYRtyz4pIrvWD5c
	SwQXUixAcWEjULwZUVhxU/ZPt9ceRGWvoRcIzzcGICTN6rPqPNNIiKTCQJu8OCkTjTk8/6zg==
X-Received: by 2002:a17:902:ef4d:b0:2d9:3850:2741 with SMTP id d9443c01a7336-2dd4ba93866mr153810795ad.0.1789326000804;
        Sun, 13 Sep 2026 12:00:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.11.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:59:59 -0700 (PDT)
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
Subject: [PATCH net-next v5 03/11] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Mon, 14 Sep 2026 02:58:38 +0800
Message-ID: <20260913185849.907479-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
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

