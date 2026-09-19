Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6030BF4F
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 12:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822330; cv=none; b=k9sG8soCxYv7LulbfFGupL951xGnNFEZmB5F6MSNThf198Nao4lQCPmiBXmJAngG6fV3LPbNIoFVL1FUQpulMHzSmkvaqflldjOr/zQVliWk5pchXdLhzItUQjMTtRJde2GHsa5suQLmH5jArG4s+Qi/g5HR65uAumkwo/CkmNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822330; c=relaxed/simple;
	bh=kq0vt9SckJqy94uGlHWiGVuBk0MckU/fwsg6pcjJXHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=numyKP0MfBbFsxaXvKwM7GG/lsTny1xhB0uVhkwQoFx6H2Ciz1uE9qekDeW7v6iT+LzD4/OShtdbgipRmmc3dEWznbOsN0jHxB38acPNp9ZrEeiG4tBkW2Wl4P/Om5HGDlpii7qbTnQJOkRESJIqeeg+Juk5M6EDk5tz7b3PreA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jdxqjq0V; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jdxqjq0V"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc4b166d0dbso508950a12.1
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 05:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822328; x=1790427128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=Jdxqjq0VmMwRp50c0qY+wBHZAWv90bRotdqMAKzhysvWLI19x4ncF//WIjaGl79/YK
         S+oLZeavTd0M2vL9pdExRV3Rs2e0ioLc7ESD1DQKZ2d9qmcyj5BU60a4gMmSaQrRszTG
         Qb4ruo7B20u1To5PeC6wOX0JD6v+3vparHN4StCnD0HjEhoyZ30JtIKIC2V0qPIj+IS3
         8npN/VJHe5afnbeYPjgvBcW9oQO1ufQ8fLefOaaMtLRJCNmcM3/5x/ev3H2ot7JUNofE
         L2FEoMFmGuvsKRr8oGAF6pSeo5zV2HXkq3McHY6cPpmSyH4Mf8EZZsn+6QgGY5XpmE58
         m+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822328; x=1790427128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=i3KNvq7YqlifehvQqWXxdAaJacFUqFaUlYW4waMsDZC+ceMwVVRIx+l6CRXexoQqx2
         0fM7s82g0CgYxvT+T3XzcjUKJRIuWRatlvKBpzV0JB6koNQmVgpJ6nNQkLZo8rhexatn
         YuQLHMLn2FX2kn7z07K9KgaOvLfiZXto7q2kSocaPRiy6pshfd6csvbExZVS4LnjJvKD
         GpstCZWXQEY1QnpIZCm0Zdvo1bEBwjwx7PI9A+pWDrQhveevMt6a2PqXM13WfBVnzXQH
         U5O1/Cdw2xrV3MLk0LaNHZzHucxTVJebnmnVWa/lDk7rm9oP6cFKdV1Vtfqyta0Q5eF1
         05Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwDuJ+aT+87eGLkRryObNCG65HG21gMaY291mT+yU2y3ZYz6zgG8SWzhQAX6GZBciiXdCDH683Ybo9W@vger.kernel.org
X-Gm-Message-State: AFuF++lKS4n03tKyRYCapVa8rvyttbGoa5RgwzQbWxy4atDNqtzsXzOt
	u/ZXVUV73GJ2PsTdNMuFpFRCQspp9y/CYw+BQYhQaApctFrsJ1Y19gJ9
X-Gm-Gg: AYBFou3p3SF3B8IGTs5TzK1Z6DOFYhuFGs3f7gBNeZRkO3s3GstIMaqYjLUf8EjD0MS
	gmw32xxWRosNSAd00oYFsQX4mbFzLt7yXU9o/73nMTsG6X6u+kHe+ebjlFM7zb9qHuzrqha8+er
	tjrbtxJHcusRCyQd+eF5/qLH1OEqqOlupGlBaMKSerqmklcR5UrDEpQS9P0hdrF6W/BkZuPtkqz
	KpvjXaw1EIsLk541lzbD7ghdxlNpYa8jT4fn7o5Tc01aOoBLa9D7BgrOIa8PBHDbmw8p+5mXj1a
	5DGYuVJ6epbr7N3kKIlxM5S15Psn0I9l359mCSLAY6SaXG5n3ZeP+VMOkiT7nmYPZWYLE4X9y6J
	8v/aLY/2by1ZbqdYcJLAZ0Isa0odMYpoW+XmVlhebD4WRHlCXf7dMNQBd6+rYPuZ1C5qfs4wbdx
	cqO/6oKKXlne+K0d2IosF7+9k8zaa9wc1g5CsXyeq/gQ2qT6Q/yo1LVIb740lUQHTRvcnrQq4=
X-Received: by 2002:a05:6a00:3a02:b0:868:f29f:67c9 with SMTP id d2e1a72fcca58-874dcbee984mr8960818b3a.9.1789822328120;
        Sat, 19 Sep 2026 05:52:08 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:52:07 -0700 (PDT)
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
Subject: [PATCH net-next v8 03/11] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Sat, 19 Sep 2026 20:51:10 +0800
Message-ID: <20260919125119.2107089-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
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

Out-of-range values are rejected by dtschema, so the driver does not
duplicate the range check.

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

