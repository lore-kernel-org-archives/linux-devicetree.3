Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DDA443C16
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 23:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241208; cv=none; b=MhCHzL3RU9cjvQl4hcuHaKWitb4sv4CB18tNXJdw43TQR4e6zVX3AZBrt19mYL3QEZJgGZrqQX9ntpCTluLOp7KsGhYxJfG6v2i7WJv4MdqYVnPkwfJUUBlHWQ+EBwJ9a9MHmQ50U730Cc7mvRD45QgEEhs8xMZJ0hlSngh96ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241208; c=relaxed/simple;
	bh=kq0vt9SckJqy94uGlHWiGVuBk0MckU/fwsg6pcjJXHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Br+1qJVgmqpiqc3ri6vSvUv6EQlhA42VMI/SGLhFszGEI0FL+/bq/HY3HkH+ScL2phqPysSmCctz0LvLxULhqbaC03pOQeEtwLmm01AmffR2e0qIYTXV2PMfzk7T9xEYuurnFZ3H09JizrwsHC+Ew9/jNw+L6v0RY/MfG5DcAQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a24bmXl2; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a24bmXl2"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3a81335d55aso588518a91.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 16:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791241206; x=1791846006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=a24bmXl2yfh1/56F9b8Afi9uNxCjCw/fvFQyoOBKDZMSlCCwlEGKK8mvCHgQJ3Yiud
         hZoahhgtOqXt+D9J4Xy82iuVx0dtcyZ7n6Pt8DaFkdrYRGryssFCacUE1QyBI4cw7zEz
         K9YV6b3AvsvOdJWMTLzIiFqO1eNKmMoAYsb17qB0rVBAORufCU38K4Je58fY+uB7MX15
         Ya3vkS0KRgmRHsmRefirDxkbg76pymuqlWoydgoPZVC2UO/7VTK120cf7sXC9X+rHq4+
         WHeXbUGJyH0rYshNPc+QOz469xbtGBERyTCv5WIFu4NtHVXzqm6vDsdUJIhxmnoOVv0U
         5ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241206; x=1791846006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Rz7MTGiT2Oa/TzTvQEqnIct/KOrKk64RBkMgo9sxQM=;
        b=SX1iTp3aoH8cE9i4reb7xyhtN8IBGUpOh5c1xp5rc+58xToCA8c9eCrY7svI75POp8
         A7SmYMkQLTudIwf6by+dR7mU9Eg7mye0P+PWMy5wvrWke5A1ItAkLEuknXJU/vBWe2Pc
         v1RPrw4FjWiF+faxTGYI3FA2HE15AR6xYjJ3kTawazpTWU4GZRjl71N27lgJ7YIEBE2U
         7/Cc/VtaRKXyk9J7dpwve2h7cizu+7eXyD3gAuZkpr0E0tzin+uxcNjrvOGKeTjMWOXU
         bcECgAGzNdTAVOQNkOMxpsAFuTroPSkSyiXYIjAba4V9SvOeXk1z1D69STuSo0A7rvFk
         TyJw==
X-Forwarded-Encrypted: i=1; AKwUvBy1EIJae+oWqZLala4+yI/0HWMdLPUDhFgeFZcUhdGkXONEP07CaHMtY31H7OvGJa3FfTBCY79TVlL/@vger.kernel.org
X-Gm-Message-State: AFuF++mCAeDl13SFZfQlnR9PqndTX7mSua4+C5LdEUnhucaCy6E+rDFb
	ur7rQihowssIkFaEK+XKRK7TXaUYw+ZdrwIk6cHZGXmBOnjaV4vllavC
X-Gm-Gg: AYBFou3wYeLfEzGRkRrrlAeM9/GJOlBV3w7cwctksi7slA2w9n3crm1WcltEAUe7jCu
	RNMyyGuj1GJW00SD0mGyKrYoelPFpSxVfmSvSMvfflq2IrCXIy8cAABkEg/8rMAundZZ1j15LKg
	laIYOkufYVSUEO452fyyTApb2fcy8vJNNDOfqdHfL4BBUJJz7hyb6iLSzYXaIHL0ILauNW2PBDB
	0enkqFMdlrjp+AF4JgOnSU6HVd+qkHMaQxlP0+DjoYO6Sd3XUV2CJsBWGAN4KyVqcwTLhxZLeA5
	JgqVHdofFPIRGbCE5w54fEEuN73BNRIxtFqocjMKBuLHmAS/HIUUAIFPZFgdnpwKNdLgy/nJ0YP
	d3Xbpd0VIKDyS62N5pLqgz/aJ3V7oODcMqdIMVUPumqNy7mOoSvAn9RhYoCP+rVWar3y2bvDZQc
	C1EsIVbASz34FlPy61Xbc1uueCEL315HDYbFnrz+d2x+w0ujcFDyxdnsBFVf1kBeLOHYLx
X-Received: by 2002:a05:6a00:1ca8:b0:87c:e1a0:139e with SMTP id d2e1a72fcca58-88af73eaf5amr9796306b3a.20.1791241206300;
        Mon, 05 Oct 2026 16:00:06 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f5b79sm4183327b3a.15.2026.10.05.16.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 16:00:05 -0700 (PDT)
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
Subject: [PATCH v11 2/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue,  6 Oct 2026 06:59:44 +0800
Message-ID: <20261005225944.1171574-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005225944.1171574-1-coiaprant@gmail.com>
References: <20261005225944.1171574-1-coiaprant@gmail.com>
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

