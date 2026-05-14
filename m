Received: from mail-m49220.qiye.163.com (mail-m49220.qiye.163.com [45.254.49.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A261D798E;
	Thu, 14 May 2026 07:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778743039; cv=none; b=JgIK3q4oE2NSdWOZ8u1kS3P56Ne1B4bgy550ZjUpK/+vtNUR95uQQR+6IMsLkEDAufybJsMQyJF9CxCTMWSXRfCzEPP8Js4595e30OytUnha5Dwr/pdg6oPt9xr80vxE+vDHD+zgDohblodi9Xg4lmSJSwVkqs7rxtf1PG3+EdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778743039; c=relaxed/simple;
	bh=Er7U39LE4VPg/jo79HMvgeOl3kVCY2u0yFiq077qxGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SmWW0L8EFz2d0CReYeAEUx+sUhvf5k/J0DRVB8XvN6g3TMxTQpBp7MR7xMUhH/m3FHTWJpUfrYo3yw6z9tusWAsHfxWU5gqROiFEcucvHlHPzdJ7NFFs5DOC2cjwniBPbOf/mN7pgr2jqy28c0719BxmJkatXZTTdf8EgWHc2zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=e1hZG9KJ; arc=none smtp.client-ip=45.254.49.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="e1hZG9KJ"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e617eddd;
	Thu, 14 May 2026 15:01:42 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 3/3] drm/bridge: analogix_dp: Add support for optional data-lanes mapping
Date: Thu, 14 May 2026 15:01:33 +0800
Message-Id: <20260514070133.2275069-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514070133.2275069-1-damon.ding@rock-chips.com>
References: <20260514070133.2275069-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e254a8b0103a3kunm8191ae6fc260b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTkhDVkJMQ0IdQk9LQx0dHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=e1hZG9KJoO+Ws7pEFiY/PHjFwzylmGB1WQMxCmFnVaWAvL2emRB+btxS2O3t+wGivh1rY1IKwKxm36M35nisKhqjppmgG3JspcV2bPsYuI7woBaWlot5UKYQXxRkvCk//OCbUA3aTyidBztz5OtrviSnIM25w2br11uFMxoBuyA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1Rr7zTu0FUPyYlb5Cxw0+2EZUM5K8ihGlQO9XaHuTvQ=;
	h=date:mime-version:subject:message-id:from;

Parse the optional 'data-lanes' device tree property to support
custom physical lane mapping configuration.

If no valid configuration is found, fall back to the default
lane map (0, 1, 2, 3) automatically and keep the driver running.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 56 +++++++++++++++++++
 .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 15 +++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.h |  4 ++
 4 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index c8eb3511f92a..a7d19c3be7e0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1234,6 +1234,59 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.detect = analogix_dp_bridge_detect,
 };
 
+static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *dp)
+{
+	struct video_info *video_info = &dp->video_info;
+	struct device_node *endpoint;
+	u32 tmp[LANE_COUNT4];
+	u32 map[LANE_COUNT4] = {0, 1, 2, 3};
+	bool used[LANE_COUNT4] = {false};
+	int num_lanes;
+	int ret, i;
+
+	memcpy(video_info->lane_map, map, sizeof(map));
+
+	num_lanes = drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
+						   video_info->max_lane_count);
+	if (num_lanes < 0)
+		return -EINVAL;
+
+	endpoint = of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);
+	if (!endpoint)
+		return -EINVAL;
+
+	ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, num_lanes);
+	of_node_put(endpoint);
+	if (ret)
+		return -EINVAL;
+
+	for (i = 0; i < num_lanes; i++) {
+		if (tmp[i] >= LANE_COUNT4) {
+			dev_dbg(dp->dev, "data-lanes[%d] = %u is out of range\n", i, tmp[i]);
+			return -EINVAL;
+		}
+
+		if (used[tmp[i]]) {
+			dev_dbg(dp->dev, "data-lanes[%d] = %u is duplicate\n", i, tmp[i]);
+			return -EINVAL;
+		}
+
+		used[tmp[i]] = true;
+		map[i] = tmp[i];
+	}
+
+	for (i = 0; i < LANE_COUNT4 && num_lanes < LANE_COUNT4; i++) {
+		if (!used[i])
+			map[num_lanes++] = i;
+	}
+
+	dev_dbg(dp->dev, "Using parsed lane map: <%u %u %u %u>\n", map[0], map[1], map[2], map[3]);
+
+	memcpy(video_info->lane_map, map, sizeof(map));
+
+	return 0;
+}
+
 static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 {
 	struct device_node *dp_node = dp->dev->of_node;
@@ -1266,6 +1319,9 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 		break;
 	}
 
+	if (analogix_dp_dt_parse_lanes_map(dp))
+		dev_dbg(dp->dev, "No valid data-lanes found, using default lane map\n");
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 17347448c6b0..634fad241e69 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -137,6 +137,8 @@ struct video_info {
 
 	int max_link_rate;
 	enum link_lane_count_type max_lane_count;
+
+	u32 lane_map[LANE_COUNT4];
 };
 
 struct link_train {
@@ -175,7 +177,7 @@ struct analogix_dp_device {
 /* analogix_dp_reg.c */
 void analogix_dp_enable_video_mute(struct analogix_dp_device *dp, bool enable);
 void analogix_dp_stop_video(struct analogix_dp_device *dp);
-void analogix_dp_lane_swap(struct analogix_dp_device *dp, bool enable);
+void analogix_dp_lane_mapping(struct analogix_dp_device *dp);
 void analogix_dp_init_analog_param(struct analogix_dp_device *dp);
 void analogix_dp_init_interrupt(struct analogix_dp_device *dp);
 void analogix_dp_reset(struct analogix_dp_device *dp);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 6207ded7ffd5..f5f55bd25062 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -48,16 +48,15 @@ void analogix_dp_stop_video(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
 }
 
-void analogix_dp_lane_swap(struct analogix_dp_device *dp, bool enable)
+void analogix_dp_lane_mapping(struct analogix_dp_device *dp)
 {
+	u32 *lane_map = dp->video_info.lane_map;
 	u32 reg;
 
-	if (enable)
-		reg = LANE3_MAP_LOGIC_LANE_0 | LANE2_MAP_LOGIC_LANE_1 |
-		      LANE1_MAP_LOGIC_LANE_2 | LANE0_MAP_LOGIC_LANE_3;
-	else
-		reg = LANE3_MAP_LOGIC_LANE_3 | LANE2_MAP_LOGIC_LANE_2 |
-		      LANE1_MAP_LOGIC_LANE_1 | LANE0_MAP_LOGIC_LANE_0;
+	reg = lane_map[0] << LANE0_MAP_SHIFT;
+	reg |= lane_map[1] << LANE1_MAP_SHIFT;
+	reg |= lane_map[2] << LANE2_MAP_SHIFT;
+	reg |= lane_map[3] << LANE3_MAP_SHIFT;
 
 	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_MAP);
 }
@@ -140,7 +139,7 @@ void analogix_dp_reset(struct analogix_dp_device *dp)
 
 	usleep_range(20, 30);
 
-	analogix_dp_lane_swap(dp, 0);
+	analogix_dp_lane_mapping(dp);
 
 	writel(0x0, dp->reg_base + ANALOGIX_DP_SYS_CTL_1);
 	writel(0x40, dp->reg_base + ANALOGIX_DP_SYS_CTL_2);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
index 12735139046c..ac914e37089b 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
@@ -209,6 +209,10 @@
 #define LANE0_MAP_LOGIC_LANE_1			(0x1 << 0)
 #define LANE0_MAP_LOGIC_LANE_2			(0x2 << 0)
 #define LANE0_MAP_LOGIC_LANE_3			(0x3 << 0)
+#define LANE3_MAP_SHIFT				(6)
+#define LANE2_MAP_SHIFT				(4)
+#define LANE1_MAP_SHIFT				(2)
+#define LANE0_MAP_SHIFT				(0)
 
 /* ANALOGIX_DP_ANALOG_CTL_1 */
 #define TX_TERMINAL_CTRL_50_OHM			(0x1 << 4)
-- 
2.34.1

