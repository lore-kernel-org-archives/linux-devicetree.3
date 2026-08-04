Received: from mail-m3289.qiye.163.com (mail-m3289.qiye.163.com [220.197.32.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CADF33A708;
	Tue,  4 Aug 2026 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832383; cv=none; b=vB4vC5NSXYHKmMG4wcc9H+eYlT6tmreMMj63yzIXwpUlDw2Cib0pusuaIfxljWqqLYqNatBrfjYh7GGMlxLfQU9x0mUXx4PiN0iN9FcdEgAKQnxX/D/hW4XA261D1rMx4CBr4uwCzeRrtexSE74wp2xsvVfsS8CqLIavQjkO6jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832383; c=relaxed/simple;
	bh=slZ4K7V+nMriYNb7XZV2wvUDmS4S/5MyrbBnw5Yq+Fk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tp9VW4eOuMcUjF3vSWsLyAPXgfkV73gQdIAKJRyUcAgJqUNH34qzj/aiZxoHgLlgKp/2zD4J7bnNyp4p2irld6mvpUm+9heGTo3JA3PBqAXUuYQIUXqkMUJsIFo4CJWFPF/c0s61fTXL128ELvFquc5U2y9yG5H+LOLja2+Fing=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=SohnfUmi; arc=none smtp.client-ip=220.197.32.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="SohnfUmi"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48b4fff2e;
	Tue, 4 Aug 2026 16:17:35 +0800 (GMT+08:00)
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
Subject: [PATCH v2 10/10] drm/bridge: analogix_dp: Handle HPD notification from downstream bridge
Date: Tue,  4 Aug 2026 16:17:17 +0800
Message-Id: <20260804081717.741404-11-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a9fcbd97bed03a8kunma7b8cbe762b0fd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRpDVhpKTB1NSBkeGBhCTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SohnfUmi0MZZEoAoDsZj4vPpj0X0DbQuo4zvxtT26IBgh1dIdNilNr6K5vn773a7/9DDuE9+7RowCZoyy88k4FreVSgDOL4RJO4F7NkhijLqAu4OLzholJq7wh5HuRfyMDm1MCBnf+bXvqoepyUHq8os4msiCivz/uh6DCff1tg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ihFySqm5GnqPJHRcWS06V+nd4nWFCQ2/QSaKuoAhvMM=;
	h=date:mime-version:subject:message-id:from;

When the display pipeline includes a display-connector bridge with
hpd-gpios configured, the connector's hotplug status is managed by the
display-connector bridge through its GPIO, not by the Analogix DP
controller's native HPD. In this configuration, the DP controller's
internal HPD polling in analogix_dp_detect_hpd() does not reflect the
actual connection state.

Implement the .hpd_notify bridge callback to receive connection status
updates from downstream bridges. Cache the connection status in a
connection_notified flag, and use it to short-circuit
analogix_dp_detect_hpd() when a downstream bridge has already confirmed
the connection.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c   | 16 ++++++++++++++++
 .../gpu/drm/bridge/analogix/analogix_dp_core.h   |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a5a50b9ab8a7..f0476a60ece3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -68,6 +68,13 @@ static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
 {
 	int timeout_loop = 0;
 
+	/*
+	 * Trust connection status from downstream bridge (e.g.,
+	 * display-connector with hpd-gpios).
+	 */
+	if (dp->plat_data->next_bridge && dp->connection_notified)
+		return 0;
+
 	while (timeout_loop < DP_TIMEOUT_LOOP_COUNT) {
 		if (analogix_dp_get_plug_in_status(dp) == 0)
 			return 0;
@@ -1247,6 +1254,14 @@ static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		DRM_ERROR("Failed to enable psr (%d)\n", ret);
 }
 
+static void analogix_dp_bridge_notify(struct drm_bridge *bridge, struct drm_connector *connector,
+				      enum drm_connector_status status)
+{
+	struct analogix_dp_device *dp = to_dp(bridge);
+
+	dp->connection_notified = (status == connector_status_connected);
+}
+
 static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1259,6 +1274,7 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.attach = analogix_dp_bridge_attach,
 	.edid_read = analogix_dp_bridge_edid_read,
 	.detect = analogix_dp_bridge_detect,
+	.hpd_notify = analogix_dp_bridge_notify,
 };
 
 static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index bcb5674801a2..cd8a5d52f973 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -169,6 +169,7 @@ struct analogix_dp_device {
 	bool			fast_train_enable;
 	bool			psr_supported;
 	bool			last_bridge_is_panel;
+	bool			connection_notified;
 
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
-- 
2.34.1

