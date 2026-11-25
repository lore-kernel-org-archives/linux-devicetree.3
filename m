Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601994;
	b=vsnJyAi8Jpy+xeAZCR6u/X+2UPoAqdisJ3UGc3CIiIS1cs5nus8DXQ6kjDsS8zalh5Ve
	 wYYP0yjT0HX+dZ22p94rrZL58r+AqKUM+AiAl+bRaTzVUj5ftil0TjSfIpUfIEDaFi/76
	 vmkq+LJbKZDGz1H3Cadp7MqouDPaHccMLgBAPwfGQERv7igx6BFxt3mrvkJtKL33B4nA/
	 ZG85eGFS19d3IJpWK+xePepX4LOCAhpzRWQcFyabCnblfd8yl3eJjNUqaHxW59D9ULEhn
	 d6KuzxcF+VAqk7Pcr0LQQpfYVhGLFmvZ6IEbkYkMnwaVMEkk3ofQpLTiaaxt7Tv0MJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601994;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=P/qDb93psmYu3KOkMzDXsv4Tt820FhpXDB93gJkIxRo=;
	b=WhXLhlTKtvGz86JuT/LzE7hEQiRJnc//Riwy6AYdDNrBVrok8XfZQCA9nG2J4RTMSdrP
	 05QWg1/EcQu/muJcJ0qvhduUgUk9HdOUs4K0XYGxzoBcRqOi+tnGBrwwud2tndsXzUGAU
	 htc5VF0Gv6Q2Tl4acAnH3EjMs0sQZiPsfPhokC0IBKIeUDbPqwd7YenAVXUbMw58iTVBd
	 RUGbWBgW6It1CMBPlcMoc3FJlGyvnatBoOerEBhVZICAdo4eI+TyzcQ57ICPuR0Ba55zH
	 m8Gxw2QDQARV4JGw/QlbO7ABoIAvQ++WcP/vUl99Wcc6kC1djOxM+bfq6mG4mGco5iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=VdHVFlvm;
	arc=none smtp.remote-ip=185.136.65.227
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F4606A331
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B1F4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=VdHVFlvm
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261125101951acba6872d4000207e7
        for <devicetree@vger.kernel.org>;
        Wed, 25 Nov 2026 11:19:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=P/qDb93psmYu3KOkMzDXsv4Tt820FhpXDB93gJkIxRo=;
 b=VdHVFlvmptoJBl8kFclQTPJVqz3lFkwBHmleZQHxH259bD+Nu1G1DlRxcGwmfukZNI6xF6
 9cTdmyh88nf7A5See8uN3VHxIdTe1cciwnYiSzvu8HUsNqN77EMDhYvnmzo9JcFksrnzw4Au
 pCe85Zm77HV2eodV3347MtnA4wyNjLrHPd5TL/z+zP+fP7e+GgYvpswv3/9fYZaV66is5cv5
 SR0cQCmsFEmlOaAGT1sMoByhqspWD20MO2aRErawz6Kb94dTy0T2+liiMRROItLnGM6GXCQA
 zNu8Z9zRNf33FXK3u3dt6CyHoDU9kvE0eoc2tQKrPmfXdUg58GJpvUyA==;
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
	Andrej Valek <andrej.v@skyrain.eu>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 3/3] drm/panel: simple: Add support for Techshine TS-P0700031A panel
Date: Wed, 25 Nov 2026 11:19:36 +0100
Message-ID: <20261125101936.103094-4-alessandro.zini@siemens.com>
In-Reply-To: <20261125101936.103094-1-alessandro.zini@siemens.com>
References: <20261125101936.103094-1-alessandro.zini@siemens.com>
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

From: Andrej Valek <andrej.v@skyrain.eu>

Add display timing and panel descriptor for the Techshine TS-P0700031A
LCD panel.
Register the panel in the of_device_id table with the compatible string
"techshine,ts-p0700031a".

Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 33d954f3ee289..8eda4f74bc44f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4827,6 +4827,35 @@ static const struct panel_desc tsd_tst043015cmhx = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
+static const struct display_timing techshine_ts_p0700031a_timing = {
+	.pixelclock = { 44900000, 51200000, 63000000 },
+	.hactive = { 1024, 1024, 1024 },
+	.hfront_porch = { 16, 160, 216 },
+	.hback_porch = { 160, 160, 160 },
+	.hsync_len = { 1, 1, 256 },
+	.vactive = { 600, 600, 600 },
+	.vfront_porch = { 1, 12, 127 },
+	.vback_porch = { 23, 23, 23 },
+	.vsync_len = { 1, 1, 128 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc techshine_ts_p0700031a = {
+	.timings = &techshine_ts_p0700031a_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 165,
+		.height = 105,
+	},
+	.delay = {
+		.enable = 25,
+		.disable = 25,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode tfc_s9700rtwv43tr_01b_mode = {
 	.clock = 30000,
 	.hdisplay = 800,
@@ -6179,6 +6208,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "team-source-display,tst043015cmhx",
 		.data = &tsd_tst043015cmhx,
+	}, {
+		.compatible = "techshine,ts-p0700031a",
+		.data = &techshine_ts_p0700031a,
 	}, {
 		.compatible = "tfc,s9700rtwv43tr-01b",
 		.data = &tfc_s9700rtwv43tr_01b,
-- 
2.56.1

