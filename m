Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181149;
	b=R2CfEQ/3Qq0sCyDdPK7GxMnTTyh7dFWUNPcvEyNlJ054O5XfhJI997q2vFD9dkBGb4m3
	 UcjDmPPs+37/yy4TqVIvNklWrE1J3SYbOccYTbk3U+b2Jbwe8f4KExymWobykR+G6A8Ev
	 +k7HQ1p1OeDITkYrVQA42cc6YTyvCk+qQ6pwyAbiDPUJJB6QhpxBGtw7To2xLQzT8FhLW
	 Kk1nZLi1dKoH69+S5ktYho+a707OJqIykzZpLMtUVxsF6aKVhW+KQBzrmVLzi1brDFjMg
	 pHu97zuHquQJ+h9xZNYZln/n0bZaVYw6CTxDxXusEaXRU1h7y20WJIHX6HgnWMEMOtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181149;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vVaENIb3gi4a6qUYmV+6bMnHz0LQhnnIMRxjrtMOFDE=;
	b=3tfJrptzNn+P+ncbnmwi6mnAWGoXgweXn0TrVDU257q1VNeTRvVZHtGcQrEeyYTGO4bK
	 ipcJGY2UP3tKXI22cQVbNnPOwsfMkIr4/KlHPEDjdgbRR4EpF7fLKqatq04BFhGGSSNY9
	 CECv8WwCHHXHsiQDXwnJxN2rHSC24QmnGUaBSPBV8It4wXildmlawbu7AP/t/j5ZzkEoe
	 yvNtvJq4KDk6+JGNxw+iLz/jD0DFzset5MqLXNyrYP2Twm9TjcnsjZQddh45kkdrv2Al8
	 8oMB7zWt6eb6FkBiraHibkLYeZeVL8qoK3dlPc6RR7l2BVGOKXBeZfl5XuBQKyuDrhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jcfm1IlZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FAE606A326;
	Wed, 28 Oct 2026 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jcfm1IlZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0559D1F01825;
	Wed, 28 Oct 2026 09:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181148;
	bh=vVaENIb3gi4a6qUYmV+6bMnHz0LQhnnIMRxjrtMOFDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jcfm1IlZnLUVGHKM1UGQMB4TyYId8HGB9mr3U3D3JtG6YB0TK0kPfENOSH+arBb8i
	 x57wwbKwrx2sy7JXYRgQsACynci0jvQHoXADO9TU/RwLJxuMqD3NvMDXFYPGlNkFpW
	 LpQuaW93PrA4OKrlDQi4+qmA3k8rY1uhr1q4VPh/HK9tcIWYL+950I+zTjfEQdz/96
	 fnD3RXsEkqNoUBWIkIwKhf25eGnqLVTCKe1Gzbzk0knjrdvwjgTfB0UbYGoGb5JYKk
	 GqANUqulFWkKwYYba1h2nmA4/YbQR3QFr7s5Q1oQMDCeFBg75/AGKWnXDBFNYzWVuF
	 qhLkNwNvhPBDQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/8] drm/panel: novatek-nt36672e: Verify the number of D-PHY data lanes
Date: Wed, 28 Oct 2026 11:51:48 +0200
Message-ID: <20261028095151.1682096-6-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028095151.1682096-1-vz@kernel.org>
References: <20261028095151.1682096-1-vz@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NT36672E panel in the MIPI D-PHY mode is connected over 4 data lanes,
a mismatching device tree description results in a panel, which won't work.

Get the PHY type of the DSI link from the PHY of the DSI host, and get
the number of data lanes from the DSI host endpoint to check the match.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../gpu/drm/panel/panel-novatek-nt36672e.c    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
index 0a2d54ee8069..33676e334b9f 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
@@ -5,14 +5,18 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
 #include <video/mipi_display.h>
 
+#include <dt-bindings/phy/phy.h>
+
 static const struct regulator_bulk_data nt36672e_supplies[] = {
 	{ .supply = "vddi", .init_load_uA = 62000 },
 };
@@ -536,6 +540,30 @@ static const struct drm_panel_funcs nt36672e_drm_funcs = {
 	.get_modes = nt36672e_panel_get_modes,
 };
 
+/*
+ * Get the PHY type of the DSI link from the PHY of the DSI host, MIPI D-PHY
+ * is the default, if the PHY type is not specified.
+ */
+static u32 nt36672e_get_dsi_phy_type(struct device *dev)
+{
+	struct device_node *host, *phy;
+	u32 phy_type = PHY_TYPE_DPHY;
+
+	host = of_graph_get_remote_node(dev->of_node, 0, 0);
+	if (!host)
+		return phy_type;
+
+	phy = of_parse_phandle(host, "phys", 0);
+	of_node_put(host);
+	if (!phy)
+		return phy_type;
+
+	of_property_read_u32(phy, "phy-type", &phy_type);
+	of_node_put(phy);
+
+	return phy_type;
+}
+
 static int nt36672e_panel_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -598,6 +626,15 @@ static int nt36672e_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->format = ctx->desc->format;
 	dsi->mode_flags = ctx->desc->mode_flags;
 
+	/* A MIPI D-PHY link to the panel shall have exactly 4 data lanes */
+	if (nt36672e_get_dsi_phy_type(dev) == PHY_TYPE_DPHY) {
+		ret = drm_of_get_data_lanes_count_remote(dev->of_node, 0, -1, 1, 4);
+		if (ret > 0 && ret != 4)
+			return dev_err_probe(dev, -EINVAL,
+					     "%d D-PHY data lanes described, 4 required\n",
+					     ret);
+	}
+
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
-- 
2.51.0

