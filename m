Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96B40E8E1;
	Thu, 23 Jul 2026 22:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845057; cv=none; b=dBMzF+QeZlknCeIM+gVwEkQtA8SA05PiJJcBU/SjsTzDsEzpN20mo7wxJ7Fd+S5TH+vAgWH65WxkaemIY2QsIwKd7HwIrB1VdVpxW6QXLosNNlLcrEAxlMgV1E0nYL68k2NYMMcm84NgHwspCDv+r/eHlsawUGHJ9dy/H4n16Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845057; c=relaxed/simple;
	bh=y/lO7F8aMpUMG5oPz9h/2IJLrrfqoLfzB6/FlPP331s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kV4ZAnW9/WC43Tei5Rj6oPaKb84yj08+ukR6MHWcOt/ePCrBTvqCoglNyg1JfZxYB01ZLcEv1cpTgPSAmxWuKTf2wgbLtgOfKmLq0eewvHVzjQNBoVU0chwoSLx0Vca6umrVarS/FtHK6HDvR+HgpZNPSiAAwdlIGO6b45cR7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Tz5OSW+R; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Tz5OSW+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784845042;
	bh=y/lO7F8aMpUMG5oPz9h/2IJLrrfqoLfzB6/FlPP331s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tz5OSW+RvTbt91ofVnUc7GzzJs4ItwGSLoEzvQLhjfJwabVw7hSXikFkBdGA0fZqF
	 VVE8PHCYbNFvgIiyIoBNJuoPMawRqLK+QjZELsRNNRlmZaI8HO9WKjvlKOs/SPzVkY
	 8d1f1hksDujI40VkhBokj4VXILvWeG7W3+KyG0gUpz2+F+hBSAH1xSQI5Bw6MbGcmN
	 LPdgf5jG1XYROGpMpgaQcZRZqXaQ7zPFNN9VhRv/+3u42wlIdAM9dGkWtF14AaZBw0
	 2Ud3fsZ+KAm3UDUm6ybUBLFWx5diB063a0nQOR7nxTOacEYOdbZIpOmRnzj17DzKS+
	 LV0kTPNsqxXUQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A27C217E3869;
	Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 127E9480031; Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 00:17:13 +0200
Subject: [PATCH v5 05/15] drm/bridge: synopsys: dw-dp: Support
 MEDIA_BUS_FMT_FIXED
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v5-5-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4165;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=y/lO7F8aMpUMG5oPz9h/2IJLrrfqoLfzB6/FlPP331s=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpikvGLxLkuJRqy51PyM+Mv9gb6K/JdKUr0K
 SgJEgzDDhdzf4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqYpLxAAoJENju1/PI
 O/qaiaUQAJLFF8KzbBeBtkGYOeR7ki8bvHjMrMnFnk2Ll/t31XPZMni0oec3W5y5araUm1+Fukn
 KgLkiOKbJ0b3W9zoTm9/C8qOIV3AZpBsxpuyFD8F68PUoMKQ7hsfpk/Mc1Zxo73EI9DYDcBuepV
 ChWtwDsr8LzY77Y1MV1/HeDdyJyS2gTs9z+azgpszAAj9kJVLVsnKmtnoh3ga1wUZbrrJ9rp/30
 z3RmsWYapM04mTSTq7Gk9xXpnIGcYRYlr/32Mo7o3Y6EBubGJlMTPkrS1nfqmmw3GfY4ZXF0/ca
 VvVjA/VPXpze6EVSeFSw8iYDFG7WralzYNHWMKu6a5mh6+V6gdKJ8apvebfWuUA72vnjHNfAoZJ
 HUux7eoG8YAp5EoGobt07fBi3/vgnoU+1TiTflUY2gCXj+yul38NrnsGfx8W9rAIlLpbGQXWdIt
 4FBm3fvAVVGmpRl9dAIHtXdIgcDbDCOCIzMpkzj0eLD/E5z/8LgnysqfZjuC3G8z7GQaYgfvxew
 WiQ7py71+9E5egqWKexWO3xPB5kWaL4/mInIeK0AmP5GnW6pRgt4cgh16OOqf/ieKbL1rKGRPhm
 oAt1D49GHL4kBDcgoNHU+16nuf1pXH1+C/zj9UrYYJH/MdzX4hUPyjunugu0+JKFLscB+LZBeSN
 cjDVSD6iwt6ja1+it4MRATg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for MEDIA_BUS_FMT_FIXED, which is e.g. requested for USB-C
DP chains as the last bridge in the chain (aux-hpd-bridge) does not
implement atomic_get_output_bus_fmts(), which results in the generic
drm_atomic_bridge_chain_select_bus_fmts() code using MEDIA_BUS_FMT_FIXED
instead.

For decent support of this, two areas are changed:

1. In atomic_check, resolving MEDIA_BUS_FMT_FIXED by selecting the
   highest-quality format that fits the DP link (first entry from
   the bandwidth-filtered output format list).

2. Implementing a custom .atomic_get_input_bus_fmts hook that, on
   MEDIA_BUS_FMT_FIXED, advertises all bandwidth-validated formats
   from dw_dp_bridge_atomic_get_output_bus_fmts(). This lets the
   upstream encoder negotiate the best mutually supported format.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 49 +++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 3dec7777fb28..812c67fdfb6b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1576,6 +1576,7 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 				     struct drm_connector_state *conn_state)
 {
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	unsigned int out_bus_format = bridge_state->output_bus_cfg.format;
 	struct dw_dp *dp = bridge_to_dp(bridge);
 	struct dw_dp_bridge_state *state;
 	const struct dw_dp_output_format *fmt;
@@ -1586,7 +1587,25 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	state = to_dw_dp_bridge_state(bridge_state);
 	mode = &state->mode;
 
-	fmt = dw_dp_get_output_format(bridge_state->output_bus_cfg.format);
+	if (out_bus_format == MEDIA_BUS_FMT_FIXED) {
+		unsigned int num_fmts = 0;
+		u32 *fmts;
+
+		fmts = dw_dp_bridge_atomic_get_output_bus_fmts(bridge,
+							       bridge_state,
+							       crtc_state,
+							       conn_state,
+							       &num_fmts);
+		if (!num_fmts) {
+			kfree(fmts);
+			return -EINVAL;
+		}
+
+		out_bus_format = fmts[0];
+		kfree(fmts);
+	}
+
+	fmt = dw_dp_get_output_format(out_bus_format);
 	if (!fmt)
 		return -EINVAL;
 
@@ -1800,6 +1819,32 @@ static const struct drm_edid *dw_dp_bridge_edid_read(struct drm_bridge *bridge,
 	return edid;
 }
 
+static u32 *
+dw_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state,
+				       u32 output_fmt,
+				       unsigned int *num_input_fmts)
+{
+	/*
+	 * MEDIA_BUS_FMT_FIXED means the downstream bridge does not constrain
+	 * the bus format. In that case, advertise all formats supported by the
+	 * DP link so the upstream encoder can negotiate the best match.
+	 */
+	if (output_fmt == MEDIA_BUS_FMT_FIXED)
+		return dw_dp_bridge_atomic_get_output_bus_fmts(bridge,
+							       bridge_state,
+							       crtc_state,
+							       conn_state,
+							       num_input_fmts);
+
+	return drm_atomic_helper_bridge_propagate_bus_fmt(bridge, bridge_state,
+							 crtc_state, conn_state,
+							 output_fmt,
+							 num_input_fmts);
+}
+
 static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(struct drm_bridge *bridge)
 {
 	struct dw_dp_bridge_state *state;
@@ -1817,7 +1862,7 @@ static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_duplicate_state = dw_dp_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
-	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
+	.atomic_get_input_bus_fmts = dw_dp_bridge_atomic_get_input_bus_fmts,
 	.atomic_get_output_bus_fmts = dw_dp_bridge_atomic_get_output_bus_fmts,
 	.atomic_check = dw_dp_bridge_atomic_check,
 	.mode_valid = dw_dp_bridge_mode_valid,

-- 
2.53.0

