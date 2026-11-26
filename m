Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700758;
	b=q52ReQl2WpPwVES84Tg/208slbVU9Y37xUoGnTFOYGzynye1zdD/9NnVCubqKHCacayW
	 lfQRPw4MT0Jf3F+73wqUaGa8aEOhbzL1QU7J0qefQ+z7rwkKiUEW3Clj8ypcsyVI9vcB0
	 97bm4eOr4ZbiExRSmOkl0E5EwshXANfAStMzMcbRwrf411BY2ke0zU4sy5vbJQXEwvp8K
	 x+9ZI4+WJgW5mZrXvLXOko0EWKxHoPZzaC196pqmeGmqBYfgaJ3olNdG9Z3cGmLCJHn3O
	 EnrrY248CBASh/R8+x2K7BEnTcahYI2O6rXW+rmJNnI60l7InfMCUu/dx2hJwOJHmcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700758;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bsSwYdx+AuYuIkeKuhSejgl7Ua506v/UQfY/79+CdWA=;
	b=THKrsvSY2d/USCt9cbwMykld8YGNeMTvFygGCxTtrlV4yJrUd2WhBjZy1SHqaAqMPYBy
	 PC8qXkPLCtktmbylMcJ2Q6/O9g6+nGnYljMi1K0ePe7Z+wZLQUvulJF6jqnnm3/NxwiW1
	 4XYVnpAW+jBGIQv433vOXeD6RFdcWyiEShozsL4f6FZr9mMX5Wt8rJ3rJTIbe8bBBrkeY
	 Pd3sGoJr6i3iflS53Cb+OmQtcAnLoG9L0yz0QhGBqapuC+2yfX6Ne/WAI64m4tvhqt+A8
	 Na2ZC8ouvJm/tvhHyiT36sbKLNuIUbGWjr0SFy/EkIRK5zsVSR7v1UmxOZyoSuuSHBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kFsvWiHO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95945606A31C;
	Thu, 26 Nov 2026 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kFsvWiHO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2603A1F000C6;
	Thu, 26 Nov 2026 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700757;
	bh=bsSwYdx+AuYuIkeKuhSejgl7Ua506v/UQfY/79+CdWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kFsvWiHOmnkFaQ/1GS7udvV34DPX0momG05TVGoxABWJ0FH5aF+43PkeaAVkS7wGK
	 Mu8K1xS8e22G05W1+kw8D+Vrc8p7FuD3gB1M/EsnpcGF+/QreQ4gMeRbaKnptiBgxF
	 jq7EfPX5+JIWjveKujPTN6bAcWwnO4CPK/I2ugMFmpZthmzObJ8dU9Zxmzk/52dQzw
	 z7p3dDejVEijhbHUXDWmjNvpum6sp8z3llFyKpsCMIl4Ojmset9uNmbUEpjFROXbeF
	 xT/NNrjdNfJ6xtc6WVZ+VXIWr8SFuUd/02wH1fwGulEgLq9quX8Lnyu21TU7T2+57d
	 GX15x6PrRRH0w==
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
Subject: [PATCH v2 04/10] drm/panel: novatek-nt36672e: Make the AVDD and AVEE supplies optional
Date: Thu, 26 Nov 2026 15:45:02 +0200
Message-ID: <20261126134508.320700-5-vz@kernel.org>
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

The positive and negative bias supplies of NT36672E panel may generate
the bias on the module itself, and be not exposed by the panel modules.

Split the supplies into the required VDDI supply and the pair of AVDD
and AVEE bias supplies, which are either both described or both absent,
and get the bias supplies only if they are described.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../gpu/drm/panel/panel-novatek-nt36672e.c    | 69 +++++++++++++------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
index 364e0855280f..de070637c208 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
@@ -13,16 +13,13 @@
 
 #include <video/mipi_display.h>
 
-static const char * const regulator_names[] = {
-	"vddi",
-	"avdd",
-	"avee",
+static const struct regulator_bulk_data nt36672e_supplies[] = {
+	{ .supply = "vddi", .init_load_uA = 62000 },
 };
 
-static const unsigned long regulator_enable_loads[] = {
-	62000,
-	100000,
-	100000,
+static const struct regulator_bulk_data nt36672e_bias_supplies[] = {
+	{ .supply = "avdd", .init_load_uA = 100000 },
+	{ .supply = "avee", .init_load_uA = 100000 },
 };
 
 struct panel_desc {
@@ -40,7 +37,8 @@ struct nt36672e_panel {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
 	struct gpio_desc *reset_gpio;
-	struct regulator_bulk_data supplies[3];
+	struct regulator_bulk_data *supplies;
+	struct regulator_bulk_data *bias_supplies;
 	const struct panel_desc *desc;
 };
 
@@ -362,12 +360,23 @@ static int nt36672e_power_on(struct nt36672e_panel *ctx)
 	struct mipi_dsi_device *dsi = ctx->dsi;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(nt36672e_supplies), ctx->supplies);
 	if (ret < 0) {
 		dev_err(&dsi->dev, "regulator bulk enable failed: %d\n", ret);
 		return ret;
 	}
 
+	if (ctx->bias_supplies) {
+		ret = regulator_bulk_enable(ARRAY_SIZE(nt36672e_bias_supplies),
+					    ctx->bias_supplies);
+		if (ret < 0) {
+			dev_err(&dsi->dev, "bias regulator enable failed: %d\n", ret);
+			regulator_bulk_disable(ARRAY_SIZE(nt36672e_supplies),
+					       ctx->supplies);
+			return ret;
+		}
+	}
+
 	/*
 	 * Reset sequence of nt36672e panel requires the panel to be out of reset
 	 * for 10ms, followed by being held in reset for 10ms and then out again.
@@ -389,7 +398,14 @@ static int nt36672e_power_off(struct nt36672e_panel *ctx)
 
 	gpiod_set_value(ctx->reset_gpio, 1);
 
-	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ctx->bias_supplies) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(nt36672e_bias_supplies),
+					     ctx->bias_supplies);
+		if (ret)
+			dev_err(&dsi->dev, "bias regulator disable failed: %d\n", ret);
+	}
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(nt36672e_supplies), ctx->supplies);
 	if (ret)
 		dev_err(&dsi->dev, "regulator bulk disable failed: %d\n", ret);
 
@@ -520,7 +536,8 @@ static int nt36672e_panel_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
 	struct nt36672e_panel *ctx;
-	int i, ret = 0;
+	bool avdd, avee;
+	int ret = 0;
 
 	ctx = devm_drm_panel_alloc(dev, struct nt36672e_panel, panel,
 				   &nt36672e_drm_funcs,
@@ -534,15 +551,27 @@ static int nt36672e_panel_probe(struct mipi_dsi_device *dsi)
 		return -ENODEV;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
-		ctx->supplies[i].supply = regulator_names[i];
-		ctx->supplies[i].init_load_uA = regulator_enable_loads[i];
-	}
-
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
-			ctx->supplies);
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(nt36672e_supplies),
+					    nt36672e_supplies, &ctx->supplies);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	/* The bias supplies are either both described or generated on the module */
+	avdd = of_property_present(dev->of_node, "avdd-supply");
+	avee = of_property_present(dev->of_node, "avee-supply");
+	if (avdd != avee)
+		return dev_err_probe(dev, -EINVAL,
+				     "avdd and avee supplies must be described together\n");
+
+	if (avdd) {
+		ret = devm_regulator_bulk_get_const(dev,
+						    ARRAY_SIZE(nt36672e_bias_supplies),
+						    nt36672e_bias_supplies,
+						    &ctx->bias_supplies);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to get bias regulators\n");
+	}
 
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset_gpio))
-- 
2.51.0

