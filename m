Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841854;
	b=iomFn5na5dF+nkbRRCO/RR8RQgFTp/BxtejKQ6iyZKgVXFc0SF9jsW005XKq5+IJDEh1
	 iQzYOMDo5Z1tQpWrmPSva0VBKU0wEmmQI97hAOzU2h/Fqr0df4xuW28eEzLwLnii75DrU
	 UCuil/x5XWy4oPlEqcU0fMCdZfru7uKf3X2z5XAf4zwySZPhSPejOh4riMYvj3NZjb+Gs
	 dFpqKvGPIu0KHAcEbtNeh3q3btPUXDwwzUhmHRWCHpwRwJT0JJBEcmCpcSQfr6llgdxlI
	 36+AkQw+8nC0PaR3TyHK+bKhU8pU/lNFOGDAm0TdHnJBXlk/Lb1EorROEevZGvb6guA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3z6P0aYlufuvnlooWGHkbmG4E1HPBYeLov8HTyHzM/I=;
	b=Iv10neNYUiXCRJHdnu3XfuRMV6DMHPIq1F/X2OnbvWyTXVcQmmslm3G2MfVJQ1z1NfRq
	 s6cRJfy1NllJPGlXF6rmoTcMan0+JiS9vXI0IvpLSIlYV7YZjDRVNNJpzEQaEhJ6isaUZ
	 8Ao4cV3Eeqxwgvlg6u0tko4xjnxWQC0G2VntD6wF4CyOoOqVJlzuZ0CQQg1NeAMc0EeNk
	 pIb/9lgDjJsE2lyem7DoKvblGSIyTVkOKa9n039Uc74MUMxJgoJxsGrf4b9PoLQHYLSCc
	 bv/TSFXW1GEfAxWu25j/6j7OgFrY9zKCDJvDtjf3q1p4XQOXZST9v5Yjp7N2mVxrJRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HNMo3ME4;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2996C606A8A9
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2996C606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HNMo3ME4
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50a4a2132cso455631966b.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841852; x=1795446652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3z6P0aYlufuvnlooWGHkbmG4E1HPBYeLov8HTyHzM/I=;
        b=HNMo3ME48Cp69TMDdUcMT8gRRbVDtFtLfzuaUUXVp+363GiL0Jr5A7fmdD2Gh8sFBL
         av+ntTf1MtChIIz0dO2ZGk/eu9AiEZStTlM4xZ4OpLz/aFzEiDtyPqdVxpSg1mVv1wO5
         E01JwKTLqAVm5a2spO8XxVjg6opybrYgkWZ/bsLCLfvcHIr6AgknOjre2EHnRx9LwuIF
         8Ae+ZVm7dIDoTeYmDlVW/bti7P+uXtU4YI1ysY1TbdPtE2xJpMmxvnNdxGqwwTCaxXl7
         r4RZIKj38g6AJDXshpIVZyOgo801qcz/WOQuxI2O+38wq92PQTFnUks/6rUGe1X8s9/P
         +wVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841852; x=1795446652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3z6P0aYlufuvnlooWGHkbmG4E1HPBYeLov8HTyHzM/I=;
        b=s80ZpRrQRe+cC0/mdR6WMnjQeaJ2gtzWxNtRkiHvWzgjeUdiBl3gfMwBuQYkvc2b7o
         vGgnDAjyfS8EPLvoRwyq3XVMZwe0+X3hmtQlmCRn5ZzfZDqBBFJJQDXynIf35Ajk2gxj
         K7eZBpqTFS4U6PKF7vyo+KPVk6crNBfwtJy05J54ld/Ix6/uQE3sds5+YveV5WBAUcEt
         IIhg9Dls6axKzoyyxLbNp9/nPw323RrTk965QkHLyJVkRxir95o9Q50zE60gnPjpoRO5
         oThlw6D9fO/Y9BazfqJ9qVzFHS+2Y8D0xHh0nPUjPMiA2V6CII1vHqKEMrePaht7KWSm
         SwGg==
X-Forwarded-Encrypted: i=1; AL+hErHlyct+dmGqFZbRZMSyGK+2f9Hkhi+qbWGx+xIfFY+2AFR5UVNat33jA2UbKIPiSiQiTSUW1lo7UoAR@vger.kernel.org
X-Gm-Message-State: APuU4Z9hiZv7FpDp+CHwC0WUzRxNml3MPo6hHHg7xYqwNeI1n9HHrlMy
	FroDgQXD/CUq84yIoQmkmVaq5CltKGkLmJYiqWNIhZXsZSqjFbBtdbho
X-Gm-Gg: AYBFou2UQSix3oFHj67+gxnEYHWUwzBqaL9+buYLeWWsH9m9SPyLHGPYZwEgYDpoKoz
	NsETBWSEvUWjxDjt2Jy/OozziBOqnrL4e51dFyMJ3fpf87ep9Iq0f5pxH6XqRMlQad8l61Xwnhr
	Xxrv87pVY5wQyBmCJWdRhKLHvMOxi6ryftXXQE9Gx9cA6e0fxTqTrs1VnrF9Pck0Cor7H31BnbQ
	gCYXBrKXI6IdmG3hiB2Q63JVZ/wHaBcoMnA8JNde3hT2uECh1XbA9S9R7WcD3Espqi+PYK6yRCJ
	X7o9udZ+0aEVOZhiCqTiynLGtMgp4z3NquPD56Tq/gWT4eRkw2gF7wVAUWp4Uggm+Ngpf819G+P
	dOX5XQNQ57mL8PunC2IXE1Ppr7P+C+gEW3J/usshwLY7gSDELNzOfHyTO5ix6hoFEXU1tHF8C8q
	QTHvVs5NAmRNOhbPQsUwWzRgF+1SzASZUHVcgBgBfASGUvL1TGHeN+R5RfRhe9bONHr2LCwyQym
	1MEPMqregLE+GRjJ7MyGs+jTFRSvlxe8EcBoteQ3IbgNvZMAmW76KKaMwsrSW7wxji0LreLyQNz
	ZHCUuJVDAhmHP/Bv+gHij0g2w+DBn8OGmWd8HWtVM/zixBA7aeAtf1X2wheObENvj2ecF+kWGXn
	HDoDX3yfE/Q==
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c509637e31dmr872386066b.22.1794841852361;
        Mon, 16 Nov 2026 07:10:52 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:51 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 10/12] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Mon, 16 Nov 2026 17:10:15 +0200
Message-ID: <20261116151017.274764-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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
index d48d498068ac8..faecd6f94359f 100644
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
 		value &= ~LVS_OUTPUT_POLARITY_LOW;
 
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

