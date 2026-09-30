Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4C93C9888
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751966; cv=none; b=caG/97RH1C7hZYHQwfFxBhei6MneRusMY5oSzC8VlnVdJZSrQQ8qAoHsnEESrva/EuCo6fxAUc6Mce/BymEoHpnm0Q1hM7MSggk96KeDpIDXa7nKDoXBQsL23BgRxgP528cbSnRqqh5SFemxCtBrdsM6RHDnWP+iqSeEBrrGUeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751966; c=relaxed/simple;
	bh=Ha01hsZDiYdgpSf73lToPHzbXl2XlTznc+VkbTZDF/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLpDYjasXB2DbGU2fM0OzMgtkcSi7DqUljlA6PsN6esz8zNTnVPSROAAtg4pHNKDdtv/h5vp4hgmNux5GPB4ZGWktnJsGHSJ8GyyU/kiEW1qIxuz6ZxBfI5qgvNngi3wm/dgkd8Jq6bwLnWKlFUqkMLyzRUEf4VJQbf9eI5YDg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ra4fq7ob; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ra4fq7ob"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so2900403f8f.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751959; x=1791356759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvheFf3XK3bdnPCaCOmKnThnJ8pBY5xBPxq0xunjLCk=;
        b=ra4fq7obcKNyz+B5Kp8w4ukzfSiDFBX9NpafdZy4Edt0eWOiLPFCWa7prR3UjD1fVq
         9PPvwqO5PKYk16grj9CiKtavxJRbT+BQE9LHaJgeJMp0cNO9YxunBzPXz4VCv/TncfxG
         nDQuD+CQsQyxkey/G187rplVgjroB3v6IQywT0bgMbLaoqh0uNBFFWPgqu82Kik0E9Ll
         D6LesyrPjEKB/qtjQszWfrdLSJsagZtyzuNQZ6weHpFGYyt2OaSdq8wKVgcmuEpmDdFU
         c+fCWg/kBgP8mTiiaG3whBeo7etSM4/PHeDg/NRDf7XdW/4outerQIuBy2O1/ta7MnKX
         BSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751959; x=1791356759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvheFf3XK3bdnPCaCOmKnThnJ8pBY5xBPxq0xunjLCk=;
        b=vOY6kYFfuIZ1nhywuLy8TVSsfnpwJEF6p9P1sTa7Kq2p+dywUX0fFOKh+a0eY+uOOu
         1NwRCz36lPw+Nirz3AMlZUUbzJ9KV5SSEVzafPJ7BXMB9bp4G8NDEwx2+FYd5SttPp7M
         0Rr2aL84Loxsvw3AZl7AwH2aiatf8hN9hqO4L5/Y5qZgoFhJ3QwIz+/L8t8TlIADqADB
         nt50fjQA55uOuFM6BNYH0kMt2xdPq2AW8pDOIal8bReARCC6TAEaN+2i6JmvqdfTmoqe
         i0hyQnNDycOFy519IRo12i48hb2X9ltKWnUWkhiNl6/HYz5pv7730f14k45EqtwC81AC
         6DqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCOnJiwM6N7s3Z5AigGN64WrB+as8xPeFK0R5eHMw0xc3qnkXNFhVDNVWZ7uOz2sUptSTG+GTcZnOH@vger.kernel.org
X-Gm-Message-State: AFq9FYJHymFkjZ+qOCPMzJeDjfPysMxFkm38Ricn4NY9xMHtKE5SYeHw
	xxa5OzFKoaMfvMqrRJ/5dY18ixnxIdqbzEjh64qoXf8bFZKInn06UAbC
X-Gm-Gg: AYBFou0vb/kQ5T5GgJRw3gFgYpDFnHdXa+qwtmilR90vSQD24nEN5ne2fAwKyVtfNKp
	PHO0zSie8yGQ8HnPRRTycfnTZv59FudRtVvW3NMe7X/uNIXSyf09qcFecEviCpgxUlSe/A7G7jz
	sOQN5mGeV1d8fQAYN18fTlMO/WTZuCnJBueSbuOmYo6o5KO9t4vZYTkwPh17aNqbiCBBVN8Myrm
	V8MOEaalH0BS6hvaYg2Jnu9oopxu72vBujeiNSpeKFZddCMb/OyHlplwn+ZGaq7HyRUPidjekYu
	XP9PZdNIYQGGS7AO6dJidRzFVlRqZrm2zAw8Fn5KsH3Lz/DaR2095U9io7Pi1101f4gy2eyZzd/
	BLwS1vLLht2m3sQxZeWZ35S36ufRDbYWzFJEVOTm575ja4UrJq1uTyL643cAfcmyHdCn5TdLVr+
	Fkb/bdSwHBsGOaBW8LzXYJMRvFa35ucaquf0fqDyglEShqEM0bpUOVmYkTP5whjeTprOMPISEm2
	7dcLMvpC+3dLCXRRwGO6VamGUWzGQ==
X-Received: by 2002:adf:e00d:0:20b0:488:89ad:56c0 with SMTP id ffacd0b85a97d-48b03c72c0amr13090f8f.11.1790751958677;
        Wed, 30 Sep 2026 00:05:58 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:05:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v1 2/6] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Wed, 30 Sep 2026 10:05:31 +0300
Message-ID: <20260930070535.47130-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930070535.47130-1-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parameterize configuration based on bus flags passed from the bridge or
panel. The list of supported flags includes now pixel clock polarity,
display enable (DE) polarity, and data alignment.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index bc1c93c7554c5..e72e076b13d5f 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -103,14 +104,19 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
-	u32 value;
+	struct drm_bridge_state *bridge_state;
+	u32 bus_flags, value;
+
+	/* Get but flags from the bridge state. */
+	bridge_state = drm_bridge_get_current_state(output->bridge);
+	bus_flags = bridge_state->input_bus_cfg.flags;
 
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -123,11 +129,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	else
 		value &= ~LVS_OUTPUT_POLARITY_LOW;
 
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE)
+		value |= LSC0_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LSC0_OUTPUT_POLARITY_LOW;
+
 	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
 
-	/* XXX: parameterize? */
-	value = DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
-		DISP_ORDER_RED_BLUE;
+	/* configure DE signal polarities */
+	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
+		value |= LSPI_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LSPI_OUTPUT_POLARITY_LOW;
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

