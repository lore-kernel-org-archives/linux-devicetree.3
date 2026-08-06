Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27E0330B32;
	Thu,  6 Aug 2026 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022261; cv=none; b=YZwcVp0dv19xLgNcvoqIIkiBH1zV1Pdzwwqqd5QDDoy3p7qsMykQC2nAmmUf/zj4+p98195QqDslkA7drj6SRxmR96PB3JbwDtPfWsjAOyGIPjH6jgWPyDtpvtJetsjMciXFVrXUKUeB/hiLg30O7OPoIoIjqsCBegcZ308kTV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022261; c=relaxed/simple;
	bh=n5B9tVKJ9XbAPRDOXrC5ulZ3YFXjS2zIeKx4NxRxJFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8qjDMiukRsaNzLTy19T0bT+J/LJ2Gerte4mgdeSVoa/HPj2xxKUnhL+6Y3W8zDZeoS74S5rMwaqxKZIbHSsrx3tEtArxjqW0fSIKDMcXsmqWVQABrGY+q6+MVpd4bkr04clPi0c9eRW6emP3SVONRIhQX2CAvpkFcDnIaRD0RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D1CC4202122;
	Thu, 06 Aug 2026 15:17:27 +0200 (CEST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wrxyR-000664-2V;
	Thu, 06 Aug 2026 15:17:27 +0200
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
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 7/7] drm/bridge: lt9211: Enable DSI burst mode for LT9211C
Date: Thu,  6 Aug 2026 15:17:15 +0200
Message-ID: <20260806131715.508557-8-p.zabel@pengutronix.de>
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

From: Oleksij Rempel <o.rempel@pengutronix.de>

Enable the MIPI_DSI_MODE_VIDEO_BURST flag to produce stable LVDS output
on RK3576. In non-burst mode, the bridge produces a horizontally
unstable image on this platform.

Tested with: AUO G185HAN01.0 dual-link LVDS panel via LT9211C bridge

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index c82f7ee7134c..e34ee288e466 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -1399,7 +1399,8 @@ static int lt9211_host_attach(struct lt9211 *ctx)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 
 	if (ctx->chip_type == LT9211C) {
-		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
+		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			MIPI_DSI_MODE_LPM;
 	} else {
 		dsi->mode_flags =
 			MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-- 
2.47.3

