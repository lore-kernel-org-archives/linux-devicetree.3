Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335551;
	b=VXD0ARgiKmVpAWKKWcfM1rNf4gHrb7x/UZJRa/KdxYNaJAkRWJjEOs08teUahedMu3BI
	 iAAkfwkYnI13Ct98P1asZgEd3Zr7bLOMiNh1jNqsh/2WT55AboguAvf3YPWhAlefpG7lE
	 OLgZX04FL3H+btT2iYbrc0I+N2iSjzG2wJ6uspNWxp0L1/NhPnrqfaCIVG8ucpAo1eKs9
	 /oBQLzfRHe+AoMls1392RfisAYfh+6I05ywLuP3IDv8GqYH1JdTNthpUgVeEWym5ILiZ+
	 2ZEtmbsE1Ce05Ihlo5gVjDtu3C7n7eRsx6lkmJRTS67gmhOTKP/7TRqIxbignIVJHlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3z6P0aYlufuvnlooWGHkbmG4E1HPBYeLov8HTyHzM/I=;
	b=oiQnuiODIobk+qQSVQg26cSCL7o4Yg4kn722aTE5Nv8UHNSfWtLyMaQ6xCrUFOvA64m5
	 Ddzmdm/26+COPX2bmWPbbQkgv83Io8LTZYYSTb43wWkUGdNl97tZZIZQ+2bzTmx78NHLx
	 mo3A1qNYA4uEBLv1SU7MkpxkIhiBZjqMxlJXF0yJKgjc3G/NQu1uGO/ImSZFDhAeWJSUG
	 Brn6x+JgmhvJ7B9lV+uBf/NGtVE3OhNbsS26A6jUZqtfpY+B0UzYth24x7HkwC/Eln5KD
	 bkVXnyYE/GofKaav+UptmlCtgIiFHekLiab+5pvDZyhI56WuaotpzLjv9OhrM7LH0Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXgq32eS;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE2D606A33D
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE2D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXgq32eS
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a1623d0so53148866b.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335550; x=1795940350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3z6P0aYlufuvnlooWGHkbmG4E1HPBYeLov8HTyHzM/I=;
        b=nXgq32eSWi/S38LFKr3ad4V0ae7GGVX/f4p0sB3WrHLVWONLqYnLLe4BwtYRv8m/2i
         DgTDUpvyrV39rrSYpz/zMuM86bLcEmIsxS7kvYWIV6TSbb9lunXQsmqJxlrm3ZJLoy3W
         +xAQF7H/boKtDm86cjj6NnZHewJ4CLYZi7lUrNFKJNVbKZfODKoo+fZW5RX0E0DWDvRL
         FmAnxiepSoB/P+Wx7YplAAjc0lPY6RZMBkH/q2PZ16rw3ysHQLy7GG0LJzJcZ7KzEk6n
         4HzazObs1IgnQovd+jb3yoT2QXzwbRV79kPABU4WZtIb6sS1hJJ8vRFL6n7FnBLQoui+
         Q16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335550; x=1795940350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3z6P0aYlufuvnlooWGHkbmG4E1HPBYeLov8HTyHzM/I=;
        b=cOWkR7xgTHTzGFTz/nh3EYwkyU+CgsfCCQGbbWCq1p+6RP5WniSwQPKCL6B8vlUqBM
         8VrfqV2oBKTx6E+QD5m4NrX7rH+QvTBF3AN5jVibUSVjBweIfK1IXuPihjgvpI6IaZEo
         Tpw9k9JwVfpCmmo8GM2+SUj8vgqnTOIngge4/vwgJYgW5id5L8wVkrn1ncsWeg4xWASq
         2N9MtcOUnzheoZVrtlM8eNb7mOdUIBoJjAt0SUYzGJw50bJTRnbdAIe5U6j66XMrddLD
         jgTiLJnz8plzAxGHteGcY9yZM0uO6xc6r7suv0TLCVx33cs/OhLDY0NPMKaLhOxtn3/B
         6zCQ==
X-Forwarded-Encrypted: i=1; AL+hErHU95Qf7hV8qgmfs5M1fzDYVhIWommrUluMaOSIq3WVTJQFTPFG0dH1mrAMNXqf01nmAUggjwJXV/tN@vger.kernel.org
X-Gm-Message-State: APuU4Z/BZtMyEGe2HTYx4nYx8MQ4O5LSkfoaRRYmt81LXav/gdaLXRGv
	pVeK2OvUC/oV+Xqwn0/KX5tTio0H1wxnFSZxDGk1xMv7IT9UYH+L4P6A
X-Gm-Gg: AZFdTZcNf395RTOdg1RHN7YKAK4nc/0rEbU278f5xK3zmCo2S9/Ojl68ECHauxfszKj
	i0tv1MZXRfc/CBWqNFHiChCVHFKyYi653y252tT4bqgo2HZsElJvjf6UCFxPjXFAiKvF9/njBpt
	qP6if+3XTdWmbgtFY5Q5SPqiOGkWB9oaZ7xpT6qolReqQadlJmByIcCKBCN3+XTeDG/V+ymAa1q
	AW8x0aJfg5ElmW0Q0+xIsh2vvrO6iGbo5HUZ4kj+BW2jDjK8E+bhXuWl4s1jV+4gaBahW3gQf8o
	PEkopRxCkm6pkzkJ9tgb0X4AgOabbw19iJqvph01NgnQLtJ0Ao6i2IfBoa2AVmDj2O+4rUD1FdS
	C9rJtW4h0Gw1HZsg7+9PzYwFcRQmBaL0l3vVufkGOKg6gOSDaEJzmQXKpBsenFsWpgZwo8xsp8P
	dn4/5/KsZYEwpExOO+gmvwU8VXInvx1fjRU2FlU243uywh25bLX+UAfoRFDFLX57CCsr29I5/eO
	9tDzyiSs7PO5dkKO+Rt4e/CIKX/FHfhf9m6Bg1Z6q9I4G03kIniHl6B2plgmeBstS+eSaWakcyo
	lTIFEPjOV5kgKFDhWW5NjdNR+JLxfv8teq7zyN3Cjyudf6AssLIsZY1ZOLynFNW9e2V9i44c4Hn
	8YiQQ890iVA==
X-Received: by 2002:a05:6402:274d:b0:6ba:92c3:fef7 with SMTP id 4fb4d7f45d1cf-6ba92c4088cmr876330a12.19.1795335550008;
        Sun, 22 Nov 2026 00:19:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:19:08 -0800 (PST)
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
Subject: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Sun, 22 Nov 2026 10:18:18 +0200
Message-ID: <20261122081820.53199-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

