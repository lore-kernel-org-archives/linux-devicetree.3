Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602452;
	b=RTH3AwHmB2wIFU7Lbg+xejfLIjV5F1sQhT19PEXE4txSAQMk+O6IZ+IwXwlnGypccFJo
	 106KBpEPuvH3f4Sw5kfgeVvthD5ipcQQFYdDy3xRHCMVI5Oa9iuANgRGfMvxg1m2Pk+v3
	 jntZKtpzzTHOqZdB4NfKpDX/7uSd2fKDDxx6ZnBQhSrswW3wCj9o1bsroG2eKG5Ego6QY
	 kVImKq3hBbGyY5XO/Fl5sNo0RYj0mfpzN68JjOX2ZOEknC8q4KaK+CCygtWBchuvfA/sO
	 wNvBQ9GDd1BzhbW8twb0xqvJSw/l7C9V00sTSoFwZ2KWKNNA5IDy9DDSeTT1lbj27Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602452;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=TM1ZXV+pZoDHqfR9xCDgo0xwUmHUJWJgxll9qgsqzgA=;
	b=cMKPz8kMUgIT+ErSR4TKBcAFWT/CVTbtWOdSUxuC013r+0o9Wmq3n+QVDHsoBHAXZCgd
	 Hd1bsJ8QVRV/ir3a27DtWj6DyBnOWJePuzqzy1h02cbPEFZQXAEcpkT0A7f15SkZA4cia
	 9+u1pmUqLvSmxm/YCz7075ruJ1nmMc1nyumLNzzTARUS0yRj6Yqs+6SpKE1OUDEuKjRLK
	 +Xw8g+D0hiBGIXjk/TfJ57f/nc/FNAzwW+meMgz4u1J1FzfgZ2LLnkDYL/m1qZeQgjoX0
	 N7jBVAPtwRe/LM+Yx7vIq+zG2kpu96PdPdF/sdq2IAYfm/VcbpG1ucl3llKDxp+OQ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=erNPrA3h;
	arc=none smtp.remote-ip=185.136.64.228
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3773606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3773606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=erNPrA3h
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202611251027311ae3bb1ef2000207f9
        for <devicetree@vger.kernel.org>;
        Wed, 25 Nov 2026 11:27:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=TM1ZXV+pZoDHqfR9xCDgo0xwUmHUJWJgxll9qgsqzgA=;
 b=erNPrA3h+YmaySWBY/xROvYldf0EsClbrWgI0YK/E52f3XofRbF+psmhab4lHT+aBUNWym
 T2ecR5AYtOIHlajlVJm0cAb3fUi6snmO8ydj5L9SRibOpYGccFw8T3Ho0npTIzkursiNIwaU
 rP2PCSRfSJ2BngKZCRU8h4CAxjNvhsEc2/v5NKEieXow+ga4QEY4b+nsGF/slU/9qPQXPiqt
 em517uUwAvNFVhrXS/MMBk8Ufy2S6ynbPq+6BxICwGKMJdluOrmayeUsQHaDuP1yPGPPBUSf
 egQWJADGDW2qAV8xa0l8a7vJDK7mDbVk/0CJp6+VUY+2WVJ7PcR5Eamw==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	thierry.reding@gmail.com,
	sam@ravnborg.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Wang Yang <yang.wang-wy@siemens.com>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 3/3] drm/panel: simple: Add support for Goworld ILI6150H6 panel
Date: Wed, 25 Nov 2026 11:27:00 +0100
Message-ID: <20261125102700.126248-4-alessandro.zini@siemens.com>
In-Reply-To: <20261125102700.126248-1-alessandro.zini@siemens.com>
References: <20261125102700.126248-1-alessandro.zini@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

From: Wang Yang <yang.wang-wy@siemens.com>

Add display timing and panel descriptor for the Goworld ILI6150H6 LCD
panel.
Register the panel in the of_device_id table with the compatible string
"goworld,ili6150h6".

Signed-off-by: Wang Yang <yang.wang-wy@siemens.com>
Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 33d954f3ee289..9beba399119cc 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2543,6 +2543,35 @@ static const struct panel_desc giantplus_gpm940b0 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
+static const struct display_timing goworld_ili6150h6_timing = {
+	.pixelclock = { 44900000, 51200000, 63000000 },
+	.hactive = { 1024, 1024, 1024 },
+	.hfront_porch = { 16, 160, 216 },
+	.hback_porch = { 160, 160, 160 },
+	.hsync_len = { 1, 1, 256 },
+	.vactive = { 600, 600, 600 },
+	.vfront_porch = { 1, 12, 127 },
+	.vback_porch = { 23, 23, 23 },
+	.vsync_len = { 1, 3, 20 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc goworld_ili6150h6 = {
+	.timings = &goworld_ili6150h6_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 85,
+	},
+	.delay = {
+		.enable = 25,
+		.disable = 25,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing hannstar_hsd070pww1_timing = {
 	.pixelclock = { 64300000, 71100000, 82000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -5921,6 +5950,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "giantplus,gpm940b0",
 		.data = &giantplus_gpm940b0,
+	}, {
+		.compatible = "goworld,ili6150h6",
+		.data = &goworld_ili6150h6,
 	}, {
 		.compatible = "hannstar,hsd070pww1",
 		.data = &hannstar_hsd070pww1,
-- 
2.56.1

