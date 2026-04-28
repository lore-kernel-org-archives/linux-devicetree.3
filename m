Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31DC75809
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777389473; cv=none; b=k975A/8D0vwx4k+CVwUmk8aeFeqojFugXYjZipSUuyRPIDldPhWBnDwelVeGAeGReKyYOFApGDYZSWEhO9fFvqezeFaAI2ZDz39dZ2nhuINNNWHojOs9q+vhUxOLjMzlRJBxLN1/6YgJ1NpyoBwK77iP2hda1IykZwG1B3j6QFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777389473; c=relaxed/simple;
	bh=7n+1n3tAUVlUb2NTZ6/xqHUyMp1IQXVl03uYXR/xiLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T9EmWpxuy9EYQgx0ljlOBFqb2ByyEWMDHihAyN8/G8U6B6W2t9hzmrXSOH6OMpxO5WYVfS9tlXgb6LaorSOoFWnibA3v/ngdmNIwvOK1+0qcEaWmUMnv3KIedQMO9/4Sg540s23D8A+wiodrVYvCFV8Tt4phihB0FYjLeG13ukk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=eC+j3vpM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="eC+j3vpM"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8f97c626aaso998507166b.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777389468; x=1777994268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RY/5ve0AYi87wKI8M4T8nphzcR95Syd1n7GrDKReYDI=;
        b=eC+j3vpMThJMO9eS8Tb5kwA+1637H+Xk+Z9MKCLQfN6cFpXwVf/4ShiMKgwLXtJP8U
         wA0k+XbUDI5lT35v6J00GnIgAbpPFC+Qx0McUXaTGUWPW4oJFuKMv46neSzFVsR9w4S1
         O74Vjv5Meu6B8C7JbmNbZrDtbyJSxMhzdyTowneDqRw5dRX3LBevSXoQmGHxNKJnbD35
         mXV0X81hctDamF6ocvq6scq0YXsz8bOXQQrdeKojmuVHlU8T194XKsxu85k+F9tUzeaX
         HDIajVKNzrrY0r/RGekp0vNXqdiw6nWIc8flY4nnACsSS6ZDr1KJ9jx1gbiS/Qtzaqmb
         7zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777389468; x=1777994268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RY/5ve0AYi87wKI8M4T8nphzcR95Syd1n7GrDKReYDI=;
        b=UNW3DJlzuj4CjGvDh1DVMZuJuy8sNCxz5PckIo05TZsrbhP8aLNIiBQr7PG1SKou1Z
         8mqYUsVygCAsZJZ5hGRG2ygA9dFntKdbpaX5pvbqIEi05lT8jk259gbQuUhDQuHZ6OC3
         Tl/Rb+sq5sI6sgdAJY+qvtx7YcYxpmDhqadEP0DHl/GzljqTr2vZlC5hTiL2bVSly5WU
         D9ExfMXgLrbW/5gN1ZrhQBumTUpTfuF2bUmCyeYE6BlspzAJ7RT5jM3RGHEG84Ax881g
         xtOMnOtFFkCfK+WOUZ4xtuJi8i1ofiq1y7y9Y4gvSVcS2wes5rAqzuxAg+duiLLEgLmz
         o0vg==
X-Forwarded-Encrypted: i=1; AFNElJ9Cg/Ige1y5V2L6d/gthXxOiSmN3KZQ1CfK5Q6VCtHor2UKC+SEngKCLhifTLAt83gPxh7F6GwVsgai@vger.kernel.org
X-Gm-Message-State: AOJu0YygPJP/JaSlYYS40sh9tycJemx3EVyqcdJlg3zB4OPlVMUgj2t3
	XCLp/rRLwFyMyvtPSJGYMYTKBZKE4xml8NPeTOZf2zKimgOLL32Fhj0DEaqiw/0JT+I0YINVVXd
	rB7hhPsRhfQ==
X-Gm-Gg: AeBDiesKEei2KMOrCu+EbisTLmQMJ0uagwyqZRuNkvueDjFTH9ooQB1f+L+L2OFLdtk
	pMs4+a1L6Rsbgypx5yyjfH7hNHrOuYApnYIwSt/2Vnf8s8wAtTB3tWzbZUTC3qufsww1I4kZBXB
	3hVzXlfQ5MaScz22lX8B07a0WV/7XGqVzul79Qq8bIQVC8xNz8BoxrJnkyKiphHtmqhPjPo0Lc4
	3KyD5OOjvtU1uoEf03pKheKNd/K4P/DctMa5EY8YpL76JKJztIQH4kmCN/SJFPZpaphRQ73FVbV
	IV58KnDCD9l7d3kHlRMEOLQbUCasjZvCCJTe6/7AgcsXduMC1wakLNp69pSjhC4kL7k50k4lCsC
	1qAxNe5PylbU4f5t5sZ+6U1oIC5E5zhZIB8zBcw9/ILZesXD2OxwcGLDAxUQM4M7S/6kULIYfrT
	Jt8B3RZGreSwFGBC19Pou6rWyt9pY4o+LNPhUb0oifPMnwy8qCdEk92gY9k5voln2mSvwSmAWu9
	XyAePPBcMRjUTjP3qGvlESu0BSf3A==
X-Received: by 2002:a17:907:8b95:b0:bad:667f:efa3 with SMTP id a640c23a62f3a-bb8026bcbb7mr172309266b.11.1777389467428;
        Tue, 28 Apr 2026 08:17:47 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c0828d0sm115205366b.56.2026.04.28.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:17:46 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 28 Apr 2026 16:17:25 +0100
Subject: [PATCH v2 2/2] drm/panel: simple: Add Team Source Display
 TST070WSBE-196C panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-imdt-dsi-display-v2-2-cf7294b5d7d6@imd-tec.com>
References: <20260428-imdt-dsi-display-v2-0-cf7294b5d7d6@imd-tec.com>
In-Reply-To: <20260428-imdt-dsi-display-v2-0-cf7294b5d7d6@imd-tec.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Add a dedicated panel driver for the Team Source Display
TST070WSBE-196C, a 7" 1024x600 MIPI-DSI TFT LCD panel
using an EK79007AD controller.

The DSI timings were calculated using
"linux-mdss-dsi-panel-driver-generator" [1], reading the downstream
file "dsi-panel-imdt-tst070wsbe165c-video.dtsi" [2].

[1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
[2] https://raw.githubusercontent.com/imd-tec/meta-imdt-qcom/refs/heads/kirkstone/recipes-display/displaydevicetree/displaydevicetree/0001-Initial-bringup-of-IMDT-Display-3.patch

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 236bd56208cc..0010bb3db484 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -5936,6 +5936,39 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
 	.lanes = 4,
 };
 
+static const struct drm_display_mode tsd_tst070wsbe_196c_mode = {
+	.clock = 52477,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 160,
+	.hsync_end = 1024 + 160 + 12,
+	.htotal = 1024 + 160 + 160 + 12,
+	.vdisplay = 600,
+	.vsync_start = 600 + 12,
+	.vsync_end = 600 + 12 + 10,
+	.vtotal = 600 + 12 + 10 + 23,
+};
+
+static const struct panel_desc_dsi tsd_tst070wsbe_196c = {
+	.desc = {
+		.modes = &tsd_tst070wsbe_196c_mode,
+		.num_modes = 1,
+		.bpc = 8,
+		.size = {
+			.width = 190,
+			.height = 121,
+		},
+		.delay = {
+			.prepare = 20,
+		},
+		.connector_type = DRM_MODE_CONNECTOR_DSI,
+	},
+	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
+		 MIPI_DSI_MODE_VIDEO_BURST |
+		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+};
+
 static const struct of_device_id dsi_of_match[] = {
 	{
 		.compatible = "auo,b080uan01",
@@ -5955,6 +5988,9 @@ static const struct of_device_id dsi_of_match[] = {
 	}, {
 		.compatible = "osddisplays,osd101t2045-53ts",
 		.data = &osd101t2045_53ts
+	}, {
+		.compatible = "team-source-display,tst070wsbe-196c",
+		.data = &tsd_tst070wsbe_196c
 	}, {
 		/* sentinel */
 	}

-- 
2.43.0

