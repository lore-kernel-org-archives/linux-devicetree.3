Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F6E54706D
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272937; cv=none; b=SznRezviEpLN0e6yQfYVbTCsrvIoIk0B5vyitTzpHR4wudVRYAOT/gebLZ2f2W0qnLOL0WbI4LZJw97BfcjM0r869InE2tcipLC77TjoMpdalF9L93jH/fo/HwxnKpKtvhVNr8PWNeK+gg9KwZiOypPn0NhlsjCz/+1/KGloa3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272937; c=relaxed/simple;
	bh=kq0vt9SckJqy94uGlHWiGVuBk0MckU/fwsg6pcjJXHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DECrgyYW8HjTWLCYpbAq7hofbnlC9CBq7b1nFWbHcRVUZyZJpkw1XnlYrh9H+ljODbtrp27G+XU+Q5X7RvVogaEoaWFl2V/Cig8LZ0UoU++Y+JlF9+JW1NWdoQtjlHQH18VQH7jVrBvGnxsEk0CM/xpjOM0NuK6aG8UXjtjBeYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbixYdUb; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbixYdUb"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6fbdc8772so12151315ad.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272935; x=1791877735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=nbixYdUbXmdqfm1XJJ7y6a3WwTC5dv3Sd9CthlMF2eYmqd6WQxL6f8MMZ/j8qST+jl
         QzNyLnjAJOccQXFjeJ62HspLDB4D5UeC4CC3sZPlKYclLGlzmJWDj91TkdO98nfDgpXx
         grhuQUPvQjUdnd2+buP7D8Bo/XXcGMGJEET8wSskNQjD6bFYKR0wcKInAO2YiwRlN4iT
         8gsgxH8v2U7Mii4cdAziFdSj6ylosMXxP4xUrFd+yXcQkpiYSJ6IFKoOmbtPu4ja4zyQ
         gtmssdAun5qlxUUL8HI5oP8FCho/7Vlj1FzGkkt/OhcV3R9A7dKK5Kmsks8a94o5MOqB
         L6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272935; x=1791877735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=IBFccSTj9W1I4h/oS0t19+mWa+nQxte+Q5lpi7b7/YRuucEF0yaQdprdMzuTz1oZbu
         YEdL1NJ9XUJbTUoojdoag/E2syP6RRYCW/T1zHqOvAuRHGi0Do8znQfe/d0aCG6LJRbl
         dgFBfZMsNphUV2HBCUanTskZmRk9cZ3tXhu+9TXL4PdNWN+pq+IkxQYxx6Q1jUREmBV5
         ZV3AzS63mGoS9D9R00sMA/PotYz+BbSqE4eK2ngLA1o5tjKPPUg1AspOIlEorN1X3n63
         s8DA1ul8q/cOPaG8YQwVS9OwUhTz0o0lWfjv6y6hLqR9Z/oua+OtNeNOAFXsXsa2aypL
         NfWw==
X-Forwarded-Encrypted: i=1; AKwUvBwspBIfeaz0B0i+AX1WL8PU8Xlv+ouQlgU+Sr0juwnx+TQWymg40yY7YOR09GhqXenky1MQy51NDA2h@vger.kernel.org
X-Gm-Message-State: AFuF++kWV5Kfxbj6AyQ0B55uVPaGzUoMPe5maI7TX1yWmJaMDoiVl0Vc
	oqC4qpz8+0jnySUvvzpzpbDzVgX/cc5RFu3OH8E3/3FdPo/BBSpm/OUB
X-Gm-Gg: AYBFou1klM005QB1tf4K6VoX5I6RpWbuVeU33J+2Hfi26/GwEYb4o3MkIN8SZlOkKVX
	hNx8n0jUkxZHMsNcS42nCJjpFouzkorGdCiUhJrK/Dylts3Vj/D5EIf1FHn1HwHT0mXSz0iNsrM
	0ZjkbdxD4nfhuLst6PNErblbEbFX6hBhDYHYVUks0hdezriNl4JSpHMRhl5WSHxK1CdjLDthL2s
	0qqZBot34uzvy+/6z7tE1OaM1d66b4RPvbjtlZwY9VHr0ZUqNmAXkx21AhTJJki37waHenwPFUF
	6GVLHPD/ZhJ6n5UcbKJP0iylcjzDPMrQPYMilgbtQlrfAPRRlsM2lBcOlqWolTXJ3ryOtKAz0Br
	a0lbRX54qELvrHhKG9lHQRRUi5oFq8qhpBm0O4gVFoSb/PrLuMxuRG8rZk7TXU/iZwCg64Ljzi4
	Mp1KvG4oRcbyvOdY1vGoB8OlU6ZOb2QuCvbAwwV4T2BLxxLELQjPFV/YhlPIyO9CO2aPKK
X-Received: by 2002:a05:6a21:6b10:b0:3dd:a195:fa24 with SMTP id adf61e73a8af0-3e0d6d83bccmr8487088637.73.1791272935144;
        Tue, 06 Oct 2026 00:48:55 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d2406b1sm1998173a12.8.2026.10.06.00.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:48:53 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v12 2/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue,  6 Oct 2026 15:47:49 +0800
Message-ID: <20261006074749.2010233-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006074749.2010233-1-coiaprant@gmail.com>
References: <20261006074749.2010233-1-coiaprant@gmail.com>
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

