Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39AC23BD06;
	Thu,  6 Aug 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022256; cv=none; b=jxFZdUOa58zctk5ATjPu1e532qiLbRgQJwFwS3YlmCKCH4RBvFgcw04yPaItFPDF/NIkYMWc02hpQYQrdShZj8qcEGJkU1Fm41XsMT26zBct1hPHu7wMP9nIuEmi9Y7IGZXO/KlRPVKQHAH0fRjMf6WYyx07yNa782dh7RrKvQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022256; c=relaxed/simple;
	bh=2yYNybOIFZlz62XGwm8SsbRHs1B3ihVVSO1s9tLK0WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJyTiUhnCzr5m1/lbBBqm9LQQLs21aF2NBgh3ToPOfAuU95n8AJ7ixZLz3V0rmyhr+Vznooz6iY18jReevcee153WpVgKAxjWxqczPrncYnNvRVXSIjHwSBT+IDaz3Fnwnsm4nHjD18I+0DyP7pnBhPbeVsaSdrgPWcx8fDhkSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9C89A202108;
	Thu, 06 Aug 2026 15:17:25 +0200 (CEST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wrxyP-000664-1h;
	Thu, 06 Aug 2026 15:17:25 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
	Yi Zhang <zhanyi@qti.qualcomm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
	Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
	venkata.valluru@oss.qualcomm.com,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 3/7] drm/bridge: lt9211: use regmap_write_bits
Date: Thu,  6 Aug 2026 15:17:11 +0200
Message-ID: <20260806131715.508557-4-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806131715.508557-1-p.zabel@pengutronix.de>
References: <20260719-add-lt9211c-bridge-v6-2-e56d22152586@oss.qualcomm.com>
 <20260806131715.508557-1-p.zabel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace regmap_read/regmap_write() pairs with regmap_write_bits().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index bf72d1bcdb48..9888119f5287 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -589,11 +589,7 @@ static int lt9211c_configure_rx(struct lt9211 *ctx)
 	if (ret)
 		return ret;
 
-	ret = regmap_read(ctx->regmap, 0x8180, &pval);
-	if (ret)
-		return ret;
-
-	ret = regmap_write(ctx->regmap, 0x8180, ((pval & 0xfc) | 0x03));
+	ret = regmap_write_bits(ctx->regmap, 0x8180, 0x3, 0x3);
 	if (ret)
 		return ret;
 
@@ -609,11 +605,7 @@ static int lt9211c_configure_rx(struct lt9211 *ctx)
 	if (ret)
 		return ret;
 
-	ret = regmap_read(ctx->regmap, 0x8530, &pval);
-	if (ret)
-		return ret;
-
-	ret = regmap_write(ctx->regmap, 0x8530, ((pval & 0xf8) | 0x11));
+	ret = regmap_write_bits(ctx->regmap, 0x8530, 0x17, 0x11);
 	if (ret)
 		return ret;
 
@@ -998,11 +990,7 @@ static int lt9211c_configure_tx(struct lt9211 *ctx, bool jeida, bool bpp24,
 	if (ret)
 		return ret;
 
-	ret = regmap_read(ctx->regmap, 0x8530, &pval);
-	if (ret)
-		return ret;
-
-	ret = regmap_write(ctx->regmap, 0x8530, ((pval & 0x3f) | 0x40));
+	ret = regmap_write_bits(ctx->regmap, 0x8530, 0xc0, 0x40);
 	if (ret)
 		return ret;
 
-- 
2.47.3

