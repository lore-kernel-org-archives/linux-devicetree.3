Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779EC3FFAA8;
	Wed,  8 Jul 2026 21:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547882; cv=none; b=bwmoc15tHza0p81SZOwcE7CdYs19Vudw7N36Ao5Wn+anJiHYhVylvCXxHjbLeXXzWaCOXDwycv7Y6x1ujXyXaECkvctCF2gGjhg26bSAaGp333V95yTRsIR/k1uyBmazwmZr2JosjZb5KOTMeV3m/UH1aWTmy+i+7K6IKqVC34A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547882; c=relaxed/simple;
	bh=9plGv+lce7EtVXWIsCW46kOTvzURvxmyne5/JsliDBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFykFAY+RERr+/8ezJHJpYJ0g+NViZM5e6R/hTJrXGh0yE6oy3Wef6Oel263PxKc5H3u0WkdB8krvXvzjLxlXyf3RTcNRDNSGiX/pdXCLITFqgMehJxFA5noYYUFtx5P0vTdqRr0rgXxiNKXyl1ejT95ETvffRfUZgw87ZnmRbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ns9ssnAb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ns9ssnAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783547879;
	bh=9plGv+lce7EtVXWIsCW46kOTvzURvxmyne5/JsliDBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ns9ssnAbbNfo/FXvR5qx+j+bcBOliVejnkFsYrX23n0neoZS9oxGG15D5UcOJcXo3
	 W2+fzGCKScmOy6mvkxmrEov+PRF5bt3sfPjidiP+CmdGVH8o89co8UfVFh5XkL5UQl
	 R7xst4H4+ByTs4z9bWtwgdAwRkI4bTYq3tixSVMcTCDydzJr8dUtjrusY7kQr/aZIK
	 QUmniJk+uxpm5eR15pHU4nWmCDQPtrqQkGCCGaTdH8Sfy0hgD1JiPJUJgwLW4hkTJJ
	 sPYdBC/i9/v5fCVO0OVCzrKturKk+v4FHOaofuNwAS944Txw9GrmO0tQZBA0yZyxhE
	 XBT3f174cIbIQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D479417E0B79;
	Wed, 08 Jul 2026 23:57:58 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 09 Jul 2026 00:57:33 +0300
Subject: [PATCH v3 11/14] drm/bridge: dw-hdmi-qp: Log resolution and
 refresh rate in atomic_enable()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dw-hdmi-qp-yuv-v3-11-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The debug entry in the HDMI branch of dw_hdmi_qp_bridge_atomic_enable()
logged the mode field as the fixed 'HDMI' label, giving no information
about the actual display timing being configured.

Extend it to also include the active resolution and refresh rate,
retrieved from the CRTC mode in the incoming atomic state:

  dw_hdmi_qp_bridge_atomic_enable mode=HDMI:1920x1080@50Hz fmt=RGB rate=185625000 bpc=10

This makes the log line self-contained and directly useful when
debugging mode-setting issues, format negotiation, or TMDS rate
mismatches without having to cross-reference a separate mode dump.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index cfd1b18c06e6..0e6142301791 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -752,6 +752,8 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 	struct drm_connector_state *conn_state;
+	const struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	unsigned int op_mode;
 
@@ -764,9 +766,15 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 
 	if (connector->display_info.is_hdmi) {
-		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u\n", __func__,
+		crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+		mode = &crtc_state->mode;
+		dev_dbg(hdmi->dev,
+			"%s mode=HDMI:%ux%u@%uHz fmt=%s rate=%llu bpc=%u\n",
+			__func__, mode->hdisplay, mode->vdisplay,
+			drm_mode_vrefresh(mode),
 			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
 			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc);
+
 		op_mode = 0;
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 	} else {

-- 
2.54.0

