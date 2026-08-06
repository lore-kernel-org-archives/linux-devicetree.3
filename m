Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE6A2EA480;
	Thu,  6 Aug 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022256; cv=none; b=GiTWXG3bPJBmSOH2s3pkQ2QJNO177fjYsQQgIUfhx0uImLbbPIVBIRoUteOUM8z0UOG5ToDCogTmZPnfpmoUcq/B0ivtcOBNdJzIeJBT4sIM2X1x9jR/3iZEYhGzsr8ET6qKwse+upyF0KqSfyaYBsotrIHQvwcZzm1a7ujZdVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022256; c=relaxed/simple;
	bh=9kAKX6QmzIobSHh/IOSHYRg+BagTvxHzgngL0+4Upjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ULsYWUtTVgjPcCKBPa9PTpi0YAlSHHoEQXiaxUY+eFocN2VA7jljvIgrH1LJznlgrkg98ITpbxMZXu0TJOLz7olNF0PJFTRcErf04MoABpSo1EYLQ+K+GmPRz0OVaEUWuVP994q7Xo15MjzQCYCvH/eouyBvzKBbjRLV/zW3bVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 409A6202107;
	Thu, 06 Aug 2026 15:17:26 +0200 (CEST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wrxyQ-000664-0U;
	Thu, 06 Aug 2026 15:17:26 +0200
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
Subject: [PATCH 4/7] drm/bridge: lt9211: reuse lt9211_configure_timing in lt9211c_configure_timing
Date: Thu,  6 Aug 2026 15:17:12 +0200
Message-ID: <20260806131715.508557-5-p.zabel@pengutronix.de>
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

Reuse lt9211_configure_timing() in lt9211c_configure_timing().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 26 +++++++------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 9888119f5287..5e5601551658 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -689,26 +689,14 @@ static int lt9211c_autodetect_rx(struct lt9211 *ctx,
 static int lt9211c_configure_timing(struct lt9211 *ctx,
 				    const struct drm_display_mode *mode)
 {
-	const struct reg_sequence lt9211c_timing[] = {
-		{ 0xd00d, (mode->vtotal >> 8) & 0xff },
-		{ 0xd00e, mode->vtotal & 0xff },
-		{ 0xd00f, (mode->vdisplay >> 8) & 0xff },
-		{ 0xd010, mode->vdisplay & 0xff },
-		{ 0xd011, (mode->htotal >> 8) & 0xff },
-		{ 0xd012, mode->htotal & 0xff },
-		{ 0xd013, (mode->hdisplay >> 8) & 0xff },
-		{ 0xd014, mode->hdisplay & 0xff },
-		{ 0xd015, (mode->vsync_end - mode->vsync_start) & 0xff },
-		{ 0xd04c, ((mode->hsync_end - mode->hsync_start) >> 8) & 0xff },
-		{ 0xd016, (mode->hsync_end - mode->hsync_start) & 0xff },
-		{ 0xd017, ((mode->vsync_start - mode->vdisplay) >> 8) & 0xff },
-		{ 0xd018, (mode->vsync_start - mode->vdisplay) & 0xff },
-		{ 0xd019, ((mode->hsync_start - mode->hdisplay) >> 8) & 0xff },
-		{ 0xd01a, (mode->hsync_start - mode->hdisplay) & 0xff },
-	};
+	int ret;
 
-	return regmap_multi_reg_write(ctx->regmap, lt9211c_timing,
-				      ARRAY_SIZE(lt9211c_timing));
+	ret = lt9211_configure_timing(ctx, mode);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(ctx->regmap, 0xd04c,
+			    ((mode->hsync_end - mode->hsync_start) >> 8) & 0xff);
 }
 
 static int lt9211c_configure_plls(struct lt9211 *ctx,
-- 
2.47.3

