Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0FD407CE0;
	Thu, 23 Jul 2026 22:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845054; cv=none; b=dmoXfnnMKAWXFy6vNlLOWA5HoJ3fM+Ogjbn7W7IRXKlRLZ8tvK6CUQ+m85N+L/eGCb4g/bjFwn1tyhUGRDgQINvl+JevBjlYs8qZqg/imzTpNQ2pgiegdzi8+CDhKZCHyxn9DDNWbhY0uBfvLNWCJYCiHcr18bgqUMDtOS6pAO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845054; c=relaxed/simple;
	bh=9OEEVTGH6CtYBorsugsyey8Z+5Bz4/YUYRXLfK0S0LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZZmKbEi/uLjCQjgGTtGWKnZX1aqupHVmXC0wDraA6NFB897sXe66UN06DyTV4Um6L+GhdPjP1up2QchQgmksXiwQndySMPzeQJN4nLXobmZLRcpD3QmI+4ENau4w7uyzrnEJKOLl6hPrq4qSe0Ykwby/Mt2JxZbMmsv65omj2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iT9Wi0cA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iT9Wi0cA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784845042;
	bh=9OEEVTGH6CtYBorsugsyey8Z+5Bz4/YUYRXLfK0S0LI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iT9Wi0cAWTk0BPVkRYcxlGX3MliTvt/gODTwhFi4S0nfu9V/IBde4G62OY1yd00Kw
	 iJcyaCzuqpPJ1517o0eqJ2qgwPAAfz0sOVrurasLJyilM0UEZxyI6Fa+oElt6nMhxZ
	 LI26p1u/ZznLKxEpI/Q+u/zTWcmwRMEVgtsUpjBsEbLPcFelJsKEpRz/072136dFGG
	 CkHW3J/zZ0AG4lzcGdFp/v7Fw6YkehxjjknVmRgGPMGu5Cl8iRXLDsl1nIpf+Ceddi
	 6t5Z6Wu33kg8P5JxprZm0J/L6CEi5BK4zT75SkVqkZfFTVYIzWu1YqjROKTEWwlWjU
	 7CFqYuqwWr2Ow==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC39217E38B5;
	Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 159B4480038; Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 00:17:15 +0200
Subject: [PATCH v5 07/15] drm/bridge: Add out-of-band HPD notify handler
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v5-7-9445c2e87441@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9OEEVTGH6CtYBorsugsyey8Z+5Bz4/YUYRXLfK0S0LI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpikvEEFbg1F+E1M6qoMRfvy0KuRci4qdYC6
 V79mAVPRAvWn4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqYpLxAAoJENju1/PI
 O/qarzAQAJdojaS8SDGjiYlZdLf0MSDQ65NzfF7jQsJfIDqC+0s7ey9pDH+0dZZGJIqlBr6xblz
 wXU+f+LBaxkYcKbHKC4WFAxiaWim5PeAJJM8hkS9q1YvuO+bHiZJAi39YfopEAxlAfUBF7BDpm9
 hMq/UJD/gvzRC4PgqJDxo29UcRiHqyw/wwFkO1K+J+9wZij09KuwbdSF/tGhbqTVrS0kBfQpzZj
 bMC3OSSBBUQYLfPe0tlVEpMDA6m6xrpsJUnVXCQOBoQupExYhlAWmzsFLcMYVl4o4erhgs7sS8c
 IP5ec8CevrRcb5/wUhAvUHye/K03ptXojnckLqZoMP9Q1Ih9PpDerzH4iX+bYtIPa/es/M19CNC
 osykMeKpI98CToC+F5zA6TBZoXEMkFFbAD25grA+Dt6NsUFrUZT1Fbc9iocYirN0H02kay9+bYm
 cACXoKBq+nijkk5FGZH2ZaA/aMiSK+1pAevN0N/54xw3MXA5yTZ4yVSbqoUoBKYXIGXyERf2YgG
 7qNNWNJ/XlwTVCCeRWqXkWUOkM9TApCvOi/zWM1w3qgbDShW9tZ/zCiP7lkrO4fEozHcN6yIiMD
 1BSsNidIJ58nN9p4Fw+zlTyNN9S+6cdpT6Pb3v69TIUZ4qVZRKxptkSSfpdOM1GOFrju2rDRJ6j
 Ey+bvpCT/H68s4ct3hl8eGA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

For DP bridges, that can be used for DP AltMode, it might be necessary
to enforce HPD status. There is an existing ->oob_hotplug_event() on
the DRM connector, but it currently just calls into hpd_notify().

As DP bridge drivers usually also implement .detect and that also
generates calls into hpd_notify, this is a bad place to force the
HPD status as the follow-up detect call might force it off again
resulting in all follow-up calls to the detection routine also
failing.

Avoid this by having a dedicated function for OOB events.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c |  6 ++++++
 include/drm/drm_bridge.h                       | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8b54069fa53a..632cc3ae3b54 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -180,6 +180,12 @@ static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connect
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
+	/* Notify all bridges in the pipeline of hotplug events. */
+	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
+		if (bridge->funcs->oob_notify)
+			bridge->funcs->oob_notify(bridge, connector, status);
+	}
+
 	drm_bridge_connector_handle_hpd(bridge_connector, status);
 }
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3ac84ed57ab2..f38010d2edd1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -540,6 +540,20 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
 
+	/**
+	 * @oob_notify:
+	 *
+	 * Notify the bridge of out of band hot plug detection.
+	 *
+	 * This callback is optional, it may be implemented by bridges that
+	 * need to be notified of display connection or disconnection for
+	 * internal reasons. One use case is to force the DP controllers HPD
+	 * signal for USB-C DP AltMode.
+	 */
+	void (*oob_notify)(struct drm_bridge *bridge,
+			   struct drm_connector *connector,
+			   enum drm_connector_status status);
+
 	/**
 	 * @hdmi_tmds_char_rate_valid:
 	 *

-- 
2.53.0

