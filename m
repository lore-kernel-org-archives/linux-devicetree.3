Received: from mail-m49205.qiye.163.com (mail-m49205.qiye.163.com [45.254.49.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09654439F9E;
	Tue,  4 Aug 2026 08:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831783; cv=none; b=HaPLWRrP/77DNLcRqKia3MOx7MlkFSbjSR4poMgFRub8hNjkhsLI8PY1/WqWOItjbuydnXd96DR63Rd4RDkF0cD0XzN1aTbTMmtUGABCr9RTHq+h929g9ApJWb00J3KMQZtwy42FjJ1X2igjZxXD6ce1W6urC8GVEzvEuu5nARE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831783; c=relaxed/simple;
	bh=4utsPspCznIst6RwhQpK8VJpuzAjSNRRAyrAu1lTS5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LlPdgGGdpN7Li/dJgJ4oYHvTXYK101teEERdj8seeXhp2PFVWkA+FVlAkNXTrgNvBseQlt8vVKnCjs68PeP9Mmz6/7ciT6SjY06NA+TyqTM1Cj1Ru31vUlFu6Fjrw3vIzU0LmOPmdAGJAlt+OStm4ntZQc7qW/sK125Dv+GAgDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=RoKQnGWY; arc=none smtp.client-ip=45.254.49.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="RoKQnGWY"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48b4fff21;
	Tue, 4 Aug 2026 16:17:34 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 09/10] drm/bridge: analogix_dp: Restrict forced connected status only for panel endpoint
Date: Tue,  4 Aug 2026 16:17:16 +0800
Message-Id: <20260804081717.741404-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804081717.741404-1-damon.ding@rock-chips.com>
References: <20260804081717.741404-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fcbd9777003a8kunma7b8cbe762b0ed
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQh4eVkJIQx5LSEIZSkkaQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=RoKQnGWYAYRI7Qa3lvdPLalCuoRZUR+wcRtqd5S/f6K2s5PC8vLunb1kwJ2FtSXrOKj+EjsbMUpc4rPNa7/jF6u0e2FWxLzMut6IPJfCzd8Pe77wh/8rQUm0TUcIT8/l6fGkIfjWfxuH1pVFAv3CiSMUrqdCxJRBYxp0qEbz6CU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=++hasEF6aBrRfCl+8wlVRjHt23leSsAweKpeIh4oR8k=;
	h=date:mime-version:subject:message-id:from;

Limit the shortcut which unconditionally returns connected status when
a next bridge exists. Only apply this logic if the last bridge in the
chain is a panel. For all other cases, rely on analogix_dp_detect_hpd()
to report accurate hotplug state.

Background for the special handling:
- If the chain ends with a DP connector bridge, the connector relies
on analogix_dp to perform detection. We must avoid hardcoding connected
status here.
- For intermediate bridges such as PS8625 / PTN3460 without detect
support [1], historically the bridge connector defaults to connected
via drm_helper_probe_detect() when no per-bridge detect callback
exists. Maintain compatibility by keeping the shortcut exclusively for
panel endpoints.

[1] https://lore.kernel.org/all/4939d55e-b560-4235-8295-adf8e48d9b74@samsung.com/

Reported-by: Heiko Stuebner <heiko@sntech.de>
Link: https://lore.kernel.org/all/5209243.oAaWjsssbx@diego/
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c   | 16 ++++++++++++++--
 .../gpu/drm/bridge/analogix/analogix_dp_core.h   |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index f05db455b430..a5a50b9ab8a7 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -906,8 +906,15 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
 	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
-	if (dp->plat_data->next_bridge)
-		return connector_status_connected;
+	/*
+	 * Only assume connected when the bridge chain ends with a panel.
+	 * Panel bridges lack a detect callback and historically rely on
+	 * this shortcut. For other next bridge types (e.g., DP connector
+	 * bridges), fall through to analogix_dp_detect_hpd() to report
+	 * accurate hotplug state.
+	 */
+	if (dp->plat_data->next_bridge && dp->last_bridge_is_panel)
+		status = connector_status_connected;
 
 	if (!analogix_dp_detect_hpd(dp))
 		status = connector_status_connected;
@@ -920,6 +927,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 				     enum drm_bridge_attach_flags flags)
 {
 	struct analogix_dp_device *dp = to_dp(bridge);
+	struct drm_bridge *last_bridge;
 	int ret = 0;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
@@ -934,6 +942,10 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
 			return ret;
 		}
+
+		last_bridge = drm_bridge_chain_get_last_bridge(dp->encoder);
+		if (drm_bridge_is_panel(last_bridge))
+			dp->last_bridge_is_panel = true;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 2066e575ce10..bcb5674801a2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -168,6 +168,7 @@ struct analogix_dp_device {
 	bool			force_hpd;
 	bool			fast_train_enable;
 	bool			psr_supported;
+	bool			last_bridge_is_panel;
 
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
-- 
2.34.1

