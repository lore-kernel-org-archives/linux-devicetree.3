Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700768;
	b=2zZqw+Js7FrT4btGuqwLw8e3eO8CAztBhSBOR619pwVbLWFZeEGCYxMjE+hiVZUss9Js
	 NuwSutnhMBboY8mIBeXClDtyhDN/PZib3piwed5x7+tDIillkcS+Ej8ZpYJDT7oJldsDK
	 XW8USXvvkFROiy48S+X5U/kj2bhtJcx7JwOenP2cDixKdOaAFn2VV0vwVhiQ+Y1a5HkEc
	 4o1G3fpCYcsTFhyKORMNV3ULVWz90xwwzFa7J6X/3RzyYZytHc4Nw3A+wwSMeH/bTZPrZ
	 OyY61qLfFR1UqYeMGF1OEauppk0qREk5fcQ4jLKtydERBUGXIBpwh6AciyV0kTfQvwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700768;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LpCQaTekFEeyqZMNoHTvHNWTZGVrsIL1ToHn2ap47Sg=;
	b=rr6b97xq9k6Q8HPjoeqOark4eMQlNfglyf+NFkXK3PlYQAldfl+ho8ARvTXAMNwY6Jq6
	 1di4B8NJzM4Fcbxwdc4m1BSxRQDu/qHcxM2VyMne9wMCAEla2nqJnI7k73ViMtIcZ7CrU
	 CASIfqQCNrJ4ylVqWCHebYUNcE8TV9horE7KCFwuMIbPuRgc8H5sH21ampO27aC+N+z8s
	 MBEPi7eerFg+6QgkOnysJhm4Yt9fFue9X85+bnb1FozCQvIsXzV4c+aOxQ/QXRnXbgCQx
	 7uvQlCjKagEkk0GDuM5/GMjE3EGgk+eLDKo9J8AElBDQ5jeQW4Ha2KmbXshzlOlwgkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Al6Bzy8h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FB2606A31C;
	Thu, 26 Nov 2026 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Al6Bzy8h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4611F000E0;
	Thu, 26 Nov 2026 13:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700767;
	bh=LpCQaTekFEeyqZMNoHTvHNWTZGVrsIL1ToHn2ap47Sg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Al6Bzy8h+tbTvECl3QO04WDeA7Q1+g+vC028/Zf2jWKzhAl7ZxGRX3AYITkIKJ5Ex
	 i7WB9B/CkgwpJdUXd8S6k2MSsez136gPIZFjatw/zAqckBgsjtiqeo+QVqw2JR2flo
	 F7PLWh8kYfv1+iA+vzCcoEwuEkQJGaanD3J+nhwh+CtwXe9SUELXVe/xbMt5YoZ4o/
	 +eIe6qZ2FoNcBe148w01zL5LKhsI33TPMlDsaWXTXMEQD4idUiCNXdTqLbV6eC22k3
	 G5AbW73hzqPUpuCHfq8fhTMG0bmejV7OlqAfimasscg7SXCO/nfOdstNz3opfQe/W9
	 v1ePHfcdbGvFQ==
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
Subject: [PATCH v2 06/10] drm/panel: novatek-nt36672e: Verify the number of D-PHY data lanes
Date: Thu, 26 Nov 2026 15:45:04 +0200
Message-ID: <20261126134508.320700-7-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261126134508.320700-1-vz@kernel.org>
References: <20261126134508.320700-1-vz@kernel.org>
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
index 4836751b7d5d..cc3f4d251f55 100644
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

