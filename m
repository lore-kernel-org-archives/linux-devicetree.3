Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700763;
	b=xO9/yu+0qwkEd13s4rTHG2yeBgMKPHnGAi3X51+CSHmWmhkUP7HYWg4tskvJj6KfWeTs
	 vSRGL29fIi/ROHKuImC0DsXPCZ+VKNy31lHl3mk+cf1m+iVticva1xuuycvAZD53UNykJ
	 0JkLZy8UN4DrpN2yI6tcV0vy8bQKJAFIAfXm7nmzV15uySTNb4x8Q4dVAubc3shr25DiC
	 QmPuP4GLow1Azw/aUoF9Sr4YLiXGd19TSg7PpWI+Vq7sYf1QD/BsXI8h3hyHf0ZRF9gx7
	 jqdo+D1BFnDwgieO94Upi/oDKZxbq5Wknk/pCe+Fmg1eNZHSZGm3GKusjIQZ+YnoDJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700763;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5izFwnqcV2sJ+6UxL0zKXDHUAtBrQLb7nNenrLl2QvI=;
	b=hgMozo8gnqfHT9EM/YHmxIBga/rKdo5FXDLW1J4a/lAKu0H3SnVcoVVk497U57MY/5Gf
	 yLmnj26GjFH93zZX9nVqOsPmicLCh0yWVT9UILITWKj2/EtBf63W/CzEE4Z8g3f2aubef
	 lLtf4Hd03OzTv3KuXnW5IrK6W2vu8LDkhoYqRmZqTHkiLWufOQrL6VkKiXnGwuFBIJMsF
	 /d57so1HmT+xzlJys18nmtIv3fhI9c2IiGxl3VLcjHAly1Pb6XLskwfjnIXpV21E3oxoL
	 Yp2jMhaChPCeH2v6VFAcEOJJxP7oiDbmNS3tXPCdWWhJ6lioFHxFVz3yE6hsJkpuNjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdcjsUg+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544EC606A323;
	Thu, 26 Nov 2026 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdcjsUg+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E417B1F000EE;
	Thu, 26 Nov 2026 13:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700762;
	bh=5izFwnqcV2sJ+6UxL0zKXDHUAtBrQLb7nNenrLl2QvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RdcjsUg+moQP2HUzuueSFSnrR9LZSoZ7CqlDjAnm+dCv55Zb1rAnD01kj4jKdmz5n
	 +kEmOGeGG3Aea82V4ANoCv4GK2io7+KnZOQ52wdqrqrS2eLE06vDj5ih69UbRfq+Z7
	 jjEJkfOgVqYcLfHte398b/DHDmd/wkMPxbM0oZb7anFzg25eUc+gHbeUXygdeucl0I
	 hRM+PxopBjTxQrHg8NJZs5XVqmq6HlupD/yFPAPKGnoYrT6qE5br9zZEniZB7JNyFH
	 KMpmdYeROK2FY9+2eh5Q7txx0DYbBCgQ65Qv6e+AkEowSkqmK4cCyyLFPi/+jGlgxV
	 Z/+nauH7HKAJg==
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
Subject: [PATCH v2 05/10] drm/panel: novatek-nt36672e: Support the bias enable GPIO
Date: Thu, 26 Nov 2026 15:45:03 +0200
Message-ID: <20261126134508.320700-6-vz@kernel.org>
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

Some NT36672E panel modules generate their positive and negative bias
supplies on the module, and expose only a bias enable signal instead of
the AVDD and AVEE supply inputs, add support of such bias enable GPIO.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
index de070637c208..4836751b7d5d 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
@@ -37,6 +37,7 @@ struct nt36672e_panel {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
 	struct gpio_desc *reset_gpio;
+	struct gpio_desc *enable_gpio;
 	struct regulator_bulk_data *supplies;
 	struct regulator_bulk_data *bias_supplies;
 	const struct panel_desc *desc;
@@ -377,6 +378,8 @@ static int nt36672e_power_on(struct nt36672e_panel *ctx)
 		}
 	}
 
+	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
+
 	/*
 	 * Reset sequence of nt36672e panel requires the panel to be out of reset
 	 * for 10ms, followed by being held in reset for 10ms and then out again.
@@ -397,6 +400,7 @@ static int nt36672e_power_off(struct nt36672e_panel *ctx)
 	int ret = 0;
 
 	gpiod_set_value(ctx->reset_gpio, 1);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 
 	if (ctx->bias_supplies) {
 		ret = regulator_bulk_disable(ARRAY_SIZE(nt36672e_bias_supplies),
@@ -577,6 +581,16 @@ static int nt36672e_panel_probe(struct mipi_dsi_device *dsi)
 	if (IS_ERR(ctx->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "Failed to get reset-gpios\n");
 
+	ctx->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio),
+				     "Failed to get enable-gpios\n");
+
+	/* The bias is either supplied to or generated on the panel module */
+	if (ctx->enable_gpio && ctx->bias_supplies)
+		return dev_err_probe(dev, -EINVAL,
+				     "enable-gpios and bias supplies are mutually exclusive\n");
+
 	ctx->dsi = dsi;
 	mipi_dsi_set_drvdata(dsi, ctx);
 
-- 
2.51.0

