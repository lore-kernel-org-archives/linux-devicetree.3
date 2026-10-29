Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287788;
	b=wgDLcA528Z6D5azJEROO6MHz9TAibDGmt7OcCy1aYZJaaLieV+YIpaGm53D8N3zYAYTK
	 uVToBjJZc8V6gOPx7jSZEE3ozxsUIVUU0meAAN/Qzbniyy3ZDfR5uqUaTmFE0M7yX+4Pn
	 /iqZ/3T9SAZEAGA9DNpBvUSMX3M0CdGZSSwMTHTUtoZ1PTjEJYP3dTpPL85ktmArcTFFr
	 pdQafSYIOn+WByT0cN5Z+DTgo/aTRQW3Td+OujU7s6IB8w3L8vEOt8XZQze7ciDb/J3qB
	 vIr82WQBEnt/C5G3vhkWo4ZQm3rfs4wvOkKo+qARw9bZK/IMgA3UQbJm7CKAGh/GH4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
	b=QpADe2gV8dWi6KpaPr8DXgGecrSJ2+iy2UleM5AZK6Vt6cZOvNtd40ys1lK2wvLcSpVD
	 WsyYLpWy+ikrTRYCPftFWrFBA8wxRoM6Ipkon7+490dbiTrNGAGw31QQfGYeSTtf/fjv+
	 lf9aVvEjC5Sqhoq5pMopRoKWph++hOo6tDOV8f2KZZP1T/HnsCrCqNDRCK51vIe6GUHpG
	 jc3v6vrmm0uA672bxjB220gqfiXuuOT4izcvCluRwk6Ldu7VwDxJN331uhD7rEyI+dCJf
	 ctKc/TYfuj0llepamblEp/O6DhsRNV0aX3TLHzT1rA2nWf5X4razLIwHfjmzXgD8rPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I/Ayijzq";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58141606A322
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 15:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58141606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I/Ayijzq
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso365676166b.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287787; x=1793892587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=I/AyijzqJtk+0Keg1vkGw22wFN5Ptg6AEueeNJfZVfw/XLEHb4rT1UOB/I9jn4wGiQ
         gzrC1vAUUg0LLaGG6N8fsoJUBgGiOOwgtRNr4HzEkKJ1NDMFfCTxgmFwmD3o0/UM1vcv
         qRa4wgLoqUryVEz15l2Scf3SQzkuygPM4CleOcCkxJ7Eox7wy8YUCHKl1Ib2EiKzgITx
         VcImxrEOLuDAdjPcXfdxQPGoPpUyjggEOoBQzSYjuT3HXQ2ClGO40vBGHUzxzlGEq3AO
         z4TPJZ/WVs+LYSoZstlJ2SdIMsMuKbl3+3QMXSwE9/v7TDz4UQt+J023PZSB8HERFN/p
         m48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287787; x=1793892587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=iKJHtP8Bh65Sj7Gy3T7TRCpeFGmZG2PbraPCRH3jsbNL6xg6jf2idlwQfdX+qshBEj
         RvTABtDSKEjJ/Mbgb+xbISlBkuId6zQu5xWwGtiMNdUonllOfXid74fLuAAHGmonNIsu
         YemFjupYOdEPMsp3neYZxHs7D9o/tgAMGZjATZGjlUY/gBXzzjhyE8eKShnDZXADkxr6
         lmZh5JBZ3a+J4tcC9q/HhoWL9oWJBqoKR/ANrrPZ+A9nGVD5/4QISMtr7FydoINhlIJH
         mM4VGVw2EGqoaY+MiEQTP4/aO3Hp9Mi+wxegbmQJG0TJK82GEtSVURdjp/jQBLZCovvq
         K3Ew==
X-Forwarded-Encrypted: i=1; AKwUvBxb5BHsTU3lw/ow9LfAlFmyfvxCGpZ7oa5fXbUEO9OycHB4GPHUtzHlsc5+SB+rzaWsmq20tLPOjfoi@vger.kernel.org
X-Gm-Message-State: AFq9FYLXj0HJdjqoZM3qDSiq89thQA4shnUV8H5mLYHl6ICerhy7h8hQ
	WIv93p76IJk3I7Y1897suu5D6jFIyJSrrHocVocH4U7+VuHmL73p8gDW
X-Gm-Gg: AYBFou1TQAXrM0OxJUTg/fQXeryS0z1WVUkPOjyij//8/DRMuKowZ1woZVENZSGnbxN
	tMu9RmSk4HgwijH8outMEPvmUgD7rhThN5N7A4FD0K6Ag1uZU0T9Oc7ZxiWyyfYph1zeR2gz79e
	7KEoh6B3hmQGX4WdXk5Lo+ZcjlMMSHZ6lKMwVDN8uK0isO5BI2Y5J/8orCQrQKszSOLzj/z9esC
	7YplYgwi9Xtw4gbiTtPxycvFEw89XdhQwdYgwPq39RQ8n8Whuwqztqc4IjHtZ1jcVytQ79QwXS/
	GGi6Ka8prG5x+mOWp5ILRWbJSMDCzUqjjmgZbpflK51ud3Bh/95lAegDIi5nQ/Dk5tuFkkd1bUJ
	MGKIRpdMqN/tTPUuyY6H8+Fp1iYZ/WVCIVkRjzDDt+2tGbXRSI7uJ9D1zOAzmG92ovz3831Dd4V
	Pcea27nem8v3zFGyFpz1z5wM7WY+rLMsU2YpzvgOPsP0wa9Xq3XOOuaNKMpSVnuROqzUUGP8Z7P
	IbF2FAYPs6jBIrVZYrBwvhzjQnrJTJYiRMOQWA0ewSSdqylMTNlkUzBaebSJ40QwXTL3ZImxnf6
	Ns7OC9KfT+Q+1zaLvN8gsY1lu3hxcQQ1oZSVmbWHNX9SRgkiiA==
X-Received: by 2002:a17:907:7250:b0:c2a:b1cc:158d with SMTP id a640c23a62f3a-c49bdf67b9emr532113866b.32.1793287786503;
        Thu, 29 Oct 2026 08:29:46 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 09/11] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Thu, 29 Oct 2026 17:29:07 +0200
Message-ID: <20261029152909.234584-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

Parameterize configuration based on bus flags passed from the bridge or
panel. The list of supported flags includes now pixel clock polarity,
display enable (DE) polarity, and data alignment.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 7dea0cac61233..d8f41d1ca350e 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
 	struct drm_connector_state *conn_state;
+	struct drm_bridge_state *bridge_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	struct drm_display_mode *mode;
@@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 	mode = &crtc_state->adjusted_mode;
 
+	/* Get but flags from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, output->bridge);
+	if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
+	else
+		bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	else
 		value &= ~BIT(PIN_LVS);
 
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
+		value &= ~BIT(PIN_LSC0);
+	else
+		value |= BIT(PIN_LSC0);
+
 	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
 
-	/* XXX: parameterize? */
-	value = DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
-		DISP_ORDER_RED_BLUE;
+	/* configure DE signal polarities */
+	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
+		value |= BIT(PIN_LSPI);
+	else
+		value &= ~BIT(PIN_LSPI);
+
+	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	/* configure DATA order and alignment */
+	value = DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
+
+	if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
+		value |= DISP_ALIGNMENT_LSB;
+	else
+		value &= ~DISP_ALIGNMENT_LSB;
+
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL);
 
 	tegra_dc_commit(rgb->dc);
-- 
2.53.0

