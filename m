Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783623624C3;
	Wed, 22 Apr 2026 21:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776892106; cv=none; b=p6H6ntT42s0wmFuRmm6fLGIxRoihEL5KWY8q4wfx2fZgM0IBdYGa+TxdIaBii3xAseyyS+YJkFfubAQVOzDs+aKDzA027tnb3pML0Va0LYf/wU7DqjL65euYC/CXy3Sr0hOvDtX1Rk98//n4ldQiRfcScjDAiU+PGitRo53Dbq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776892106; c=relaxed/simple;
	bh=Xuz+LD3d8qlcjA1FISbHQshUQj95/mw/Z6jngmNWlsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPGmD0HhokCWJRVd4rnILPSf/SwOBEnfCn1/8xgRW5UOaL8/ZwFDPLvbiyrhCbPl1nGmNLVlG2Lk/zyelQIbShySfF5sPSngJPf3SafAZSbhzacl1RjzlUleYER7AhLpIQKPzMNdmnT0Iv9MQp3HTY52kjTPLiuSA/lhSpfTRFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=RkIQ1vH3; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="RkIQ1vH3"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA4D9114B38;
	Wed, 22 Apr 2026 23:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1776892102; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=NHiqOP2KJ37adFNoTH9HdW5j1eVo4s6FcjSokPSfjvY=;
	b=RkIQ1vH3ByaNS1tbOeNI3MMUa3MsH/+2xEDYsncuwYc5wW3iP5WKjCXVtET+M0BYMzqm9i
	/MrhTpRv2mJyrdvNPNAsSZRSCoh+q89G+DXFJekuaHDfgNoKxEQ3ZYIwSUbP3PaH32xRJ4
	Gt8fRxqX5IPWSA52JPbexMPgaIOO7BttJnB2RqA1pdYoosxub6QbU155cnTHvbfmYxFRoL
	oBybj7YMJZfAp7xyPrtdjbyB1TD4oT+cFV5dkDg1CpslLdefEPGpWCdsZfLkiCBJKHWYYO
	tL2St/nPMgpLEYACr6wsApKbh8bKTCVzkeQjsWn1LrYaXDgDlEdWo6PgqDszvw==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/panel: simple: Add Displaytech DT050BTFT-PTS panel
Date: Wed, 22 Apr 2026 23:07:25 +0200
Message-ID: <20260422210806.80948-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422210806.80948-1-marex@nabladev.com>
References: <20260422210806.80948-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add support for the Displaytech DT050BTFT-PTS 5.0" (800x480) color TFT
LCD panel, connected over DPI. Timings are taken from the datasheet
from 16 Nov 2023 is available from Seacomp:

https://www.seacomp.com/sites/default/files/datasheets/DT050BTFT-Displaytech-Spec.pdf

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: "Kael D'Alcamo" <dev@kael-k.io>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-simple.c | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 236bd56208ccf..9f4c907ae044e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1902,6 +1902,39 @@ static const struct panel_desc dataimage_scf0700c48ggu18 = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct display_timing displaytech_dt050btft_pts_timing = {
+	/* The TYP pixel clock are recalculated from tV * tH * 60 Hz */
+	.pixelclock = { 30000000, 33264000, 50000000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 16, 210, 354 },
+	/* Datasheet Figure 3 indicates, that tHPW is part of tHBP */
+	.hback_porch = { 41, 26, 6 },
+	.hsync_len = { 1, 20, 40 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 7, 22, 147 },
+	/* Datasheet Figure 2 indicates, that tVPW is part of tVBP */
+	.vback_porch = { 22, 13, 3 },
+	.vsync_len = { 1, 10, 20 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
+		 DISPLAY_FLAGS_SYNC_POSEDGE,
+};
+
+static const struct panel_desc displaytech_dt050btft_pts = {
+	.timings = &displaytech_dt050btft_pts_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 108,
+		.height = 65,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing dlc_dlc0700yzg_1_timing = {
 	.pixelclock = { 45000000, 51200000, 57000000 },
 	.hactive = { 1024, 1024, 1024 },
@@ -5319,6 +5352,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "dataimage,scf0700c48ggu18",
 		.data = &dataimage_scf0700c48ggu18,
+	}, {
+		.compatible = "displaytech,dt050btft-pts",
+		.data = &displaytech_dt050btft_pts,
 	}, {
 		.compatible = "dlc,dlc0700yzg-1",
 		.data = &dlc_dlc0700yzg_1,
-- 
2.53.0

