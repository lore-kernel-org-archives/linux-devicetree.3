Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEFC38E8B4
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689013; cv=none; b=iIM3ci0HcREZDtVWjPm7OAWC7ZKVrtA/1ShcbasKWwyy/1PuEksjXCQs8yT//JNcYrCUZKTbE5mtqxS+xBmx8S5WH5DvDhQJwpF2rjhTF58irPkGCAFNYkzpTXmCYMvovdRtQIOUpYSYE88SQ2R4BtjMo/yXoLjK3L+YOJYHlts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689013; c=relaxed/simple;
	bh=cVQgizF6ZHuttfzTKghNr42GW67RE2CmawLpVo5MP6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYE44iU29CJLUnOs1m4qYn+Mi+edFvaivgrtC4VQ+RWmwNDwQnjgzSi5PtXguA/BhLLDQ2ePW4EAb5IMqMtfSsCwd0B3hlawiN3YjMrMyCUNP7TAeuiIIjKCDsXoSkeecGyKqCIzd4nDH+xXXjZisJIL7H1WWakj79RGgsiBtDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wNCGM-0001Rr-HJ; Wed, 13 May 2026 18:16:46 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 13 May 2026 18:16:40 +0200
Subject: [PATCH 2/2] drm/panel: simple: add NEC NL6448BC33-70C
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-v7-1-topic-panel-simple-nl6448bc33-v1-2-9bd4b7d0eac0@pengutronix.de>
References: <20260513-v7-1-topic-panel-simple-nl6448bc33-v1-0-9bd4b7d0eac0@pengutronix.de>
In-Reply-To: <20260513-v7-1-topic-panel-simple-nl6448bc33-v1-0-9bd4b7d0eac0@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Add NEC NL6448BC33-70C 10.4" 640x480 LCD module support.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 236bd56208ccf..bbbbdd399d1c3 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3659,6 +3659,31 @@ static const struct panel_desc nec_nl4827hc19_05b = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 };
 
+static const struct drm_display_mode nec_nl6448bc33_70c_mode = {
+	.clock = 25175,
+	.hdisplay = 640,
+	.hsync_start = 640 + 16,
+	.hsync_end = 640 + 16 + 48,
+	.htotal = 640 + 16 + 48 + 96,
+	.vdisplay = 480,
+	.vsync_start = 480 + 2,
+	.vsync_end = 480 + 2 + 31,
+	.vtotal = 480 + 2 + 31 + 31,
+	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
+};
+
+static const struct panel_desc nec_nl6448bc33_70c = {
+	.modes = &nec_nl6448bc33_70c_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 243,
+		.height = 185,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+};
+
 static const struct drm_display_mode netron_dy_e231732_mode = {
 	.clock = 66000,
 	.hdisplay = 1024,
@@ -5520,6 +5545,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "nec,nl4827hc19-05b",
 		.data = &nec_nl4827hc19_05b,
+	}, {
+		.compatible = "nec,nl6448bc33-70c",
+		.data = &nec_nl6448bc33_70c,
 	}, {
 		.compatible = "netron-dy,e231732",
 		.data = &netron_dy_e231732,

-- 
2.53.0

