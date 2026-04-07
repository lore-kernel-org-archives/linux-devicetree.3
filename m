Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862BC3A542B
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554310; cv=none; b=kTWRzqsjS65CE4C1BFJcdNhHm0oGbI4lJRPWTreTW46Re4hgvx/Uw6vX/894E39uTsDLES23aE133+epopNZBSBVdk84XPPV5hg3sXJi82ppT0AGUYz3PHRY4XFnt93OI+d9gXG6z4TZj17kntpssXAIVTo8uJLYNuVLiR4jzCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554310; c=relaxed/simple;
	bh=/juiDYp/cDiCPV7A6Rbcb/gftkhRG5c1TyVQxsKs8rU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhPDy5cdgJBHMUj9E8NhCECNuc2GKOq8GjDIJcjyag9qPyeUEB6ZURfpSutJ8/pKVuZh1GStgEAKullJ+nyV8nCTd7OmjZKe0KEOC/KEM1OMvIJb3QqHvM0YdJO8RchPiCVv9/axAevUztrcbYsLlNhfc6REyr8HRpsmtznFulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1wA2mX-000740-7x; Tue, 07 Apr 2026 11:31:37 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1wA2mW-0049fn-0l;
	Tue, 07 Apr 2026 11:31:36 +0200
Received: from [::1] (helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1wA2mW-0000000436p-0d46;
	Tue, 07 Apr 2026 11:31:36 +0200
From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Date: Tue, 07 Apr 2026 11:31:17 +0200
Subject: [PATCH 2/2] drm/panel: simple: Add Startek KD070HDFLD092 LVDS
 panel support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-panel-simple-startek-upstream-v1-2-76721696655f@pengutronix.de>
References: <20260407-panel-simple-startek-upstream-v1-0-76721696655f@pengutronix.de>
In-Reply-To: <20260407-panel-simple-startek-upstream-v1-0-76721696655f@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Kerkmann <s.kerkmann@pengutronix.de>
X-Mailer: b4 0.15.1
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.kerkmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

The Startek KD070HDFLD092 is a 7" WSVGA LVDS panel.

Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 91ab280869bac..737a1014f8112 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4540,6 +4540,32 @@ static const struct panel_desc starry_kr070pe2t = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct display_timing startek_kd070hdfld092_timing = {
+	.pixelclock = { 40800000, 51200000, 67200000 },
+	.hactive = { 1024, 1024, 1024 },
+	.hfront_porch = { 40, 160, 216 },
+	.hback_porch = { 30, 140, 140 },
+	.hsync_len = { 20, 20, 20 },
+	.vactive = { 600, 600, 600 },
+	.vfront_porch = { 2, 12, 177 },
+	.vback_porch = { 5, 20, 20 },
+	.vsync_len = { 3, 3, 3 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc startek_kd070hdfld092 = {
+	.timings = &startek_kd070hdfld092_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing startek_kd070wvfpa_mode = {
 	.pixelclock = { 25200000, 27200000, 30500000 },
 	.hactive = { 800, 800, 800 },
@@ -5532,6 +5558,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "starry,kr070pe2t",
 		.data = &starry_kr070pe2t,
+	}, {
+		.compatible = "startek,kd070hdfld092",
+		.data = &startek_kd070hdfld092,
 	}, {
 		.compatible = "startek,kd070wvfpa",
 		.data = &startek_kd070wvfpa,

-- 
2.47.3

