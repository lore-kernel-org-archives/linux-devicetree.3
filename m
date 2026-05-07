Received: from mail-m15586.qiye.163.com (mail-m15586.qiye.163.com [101.71.155.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289D35F8C5;
	Thu,  7 May 2026 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154339; cv=none; b=Pp0p6Xn1m4HyNuiHIDedIMJ2+DwxjMQw/OwWHkz9Otw/48Pv2zTrMVYnTiupe8oizmWlvBIFkqoZnnE7Vtac6IObz2GMXfwNYnQijL0XDIh8kLKr+gJ5uR/cIGao8QubZM0IBBZKTpefeb7GXNvCzvx8rdZkAp6YKaCNxNhXkE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154339; c=relaxed/simple;
	bh=DYE+2araINQqipIx2HXs6oN5B0DRkH/1y097NhGrlGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W3e0ZD4uVma2T55fyn6C6gIUC9pHJpE1mWSxw4kfArxqmjP09f9s/GWpNo5znzQ+h9fc/0Mz4nkew9cMfwdzcM2BpU0V0ypJSZntTmUGroCCP5G78xdSq0gX3TxwwtAl15Gm3UivM7HT+gEo6FrGTIeVlkt4Mh3fEjCoIrPuscI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=TCpLxdTh; arc=none smtp.client-ip=101.71.155.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="TCpLxdTh"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7b63a6e;
	Thu, 7 May 2026 19:30:08 +0800 (GMT+08:00)
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
Subject: [PATCH v3 08/10] drm/bridge: analogix_dp: Rename and simplify is_rockchip()
Date: Thu,  7 May 2026 19:29:46 +0800
Message-Id: <20260507112948.1115003-9-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507112948.1115003-1-damon.ding@rock-chips.com>
References: <20260507112948.1115003-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e0233c61103a3kunm4d1cbcd72724
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGR8aVk5CSklCGkpKTkkfS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=TCpLxdThrUwHdhggNzCo7rZFnWPGLHoodtlNrV56KmLr6IwOSdQDvXDTJeCEx0qQa0VE45bPqgwnVYfpvDQ2pQqaSoUZLMymkQQVvSkjyI7oPxOCyOlhWMR5ckRWseJGoEZk/IFpxqMH2JgUzl54uT5D6co94VsbKBfBdMTGFI4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=yxyhioPJ/C/ruQxeu+dWUVuehT1Lu+ASVR8wSqPK8uo=;
	h=date:mime-version:subject:message-id:from;

Rename is_rockchip() to analogix_dp_is_rockchip() for naming consistency
and readability, and simplify the code with switch.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Suggested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- Add Reviewed-by tag.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c |  2 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c  | 18 +++++++++---------
 include/drm/bridge/analogix_dp.h               | 11 +++++++++--
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 3e46350170d4..d45c81c1d77a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -870,7 +870,7 @@ static int analogix_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	struct drm_display_info *di = &conn_state->connector->display_info;
 	u32 mask = BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) | BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
 
-	if (is_rockchip(dp->plat_data->dev_type)) {
+	if (analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
 		if ((di->color_formats & mask)) {
 			DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
 			di->color_formats &= ~mask;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 38fd8d5014d2..6207ded7ffd5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -72,7 +72,7 @@ void analogix_dp_init_analog_param(struct analogix_dp_device *dp)
 	reg = SEL_24M | TX_DVDD_BIT_1_0625V;
 	writel(reg, dp->reg_base + ANALOGIX_DP_ANALOG_CTL_2);
 
-	if (dp->plat_data && is_rockchip(dp->plat_data->dev_type)) {
+	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
 		reg = REF_CLK_24M;
 		if (dp->plat_data->dev_type == RK3288_DP)
 			reg ^= REF_CLK_MASK;
@@ -123,7 +123,7 @@ void analogix_dp_reset(struct analogix_dp_device *dp)
 	analogix_dp_stop_video(dp);
 	analogix_dp_enable_video_mute(dp, 0);
 
-	if (dp->plat_data && is_rockchip(dp->plat_data->dev_type))
+	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
 		reg = RK_VID_CAP_FUNC_EN_N | RK_VID_FIFO_FUNC_EN_N |
 			SW_FUNC_EN_N;
 	else
@@ -233,7 +233,7 @@ void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool enable)
 	u32 mask = DP_PLL_PD;
 	u32 pd_addr = ANALOGIX_DP_PLL_CTL;
 
-	if (dp->plat_data && is_rockchip(dp->plat_data->dev_type)) {
+	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
 		pd_addr = ANALOGIX_DP_PD;
 		mask = RK_PLL_PD;
 	}
@@ -254,12 +254,12 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 	u32 phy_pd_addr = ANALOGIX_DP_PHY_PD;
 	u32 mask;
 
-	if (dp->plat_data && is_rockchip(dp->plat_data->dev_type))
+	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
 		phy_pd_addr = ANALOGIX_DP_PD;
 
 	switch (block) {
 	case AUX_BLOCK:
-		if (dp->plat_data && is_rockchip(dp->plat_data->dev_type))
+		if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
 			mask = RK_AUX_PD;
 		else
 			mask = AUX_PD;
@@ -317,7 +317,7 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 		 * to power off everything instead of DP_PHY_PD in
 		 * Rockchip
 		 */
-		if (dp->plat_data && is_rockchip(dp->plat_data->dev_type))
+		if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
 			mask = DP_INC_BG;
 		else
 			mask = DP_PHY_PD;
@@ -329,7 +329,7 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 			reg &= ~mask;
 
 		writel(reg, dp->reg_base + phy_pd_addr);
-		if (dp->plat_data && is_rockchip(dp->plat_data->dev_type))
+		if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
 			usleep_range(10, 15);
 		break;
 	case POWER_ALL:
@@ -465,7 +465,7 @@ void analogix_dp_init_aux(struct analogix_dp_device *dp)
 	analogix_dp_reset_aux(dp);
 
 	/* AUX_BIT_PERIOD_EXPECTED_DELAY doesn't apply to Rockchip IP */
-	if (dp->plat_data && is_rockchip(dp->plat_data->dev_type))
+	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
 		reg = 0;
 	else
 		reg = AUX_BIT_PERIOD_EXPECTED_DELAY(3);
@@ -837,7 +837,7 @@ void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp)
 	u32 reg;
 
 	reg = readl(dp->reg_base + ANALOGIX_DP_FUNC_EN_1);
-	if (dp->plat_data && is_rockchip(dp->plat_data->dev_type)) {
+	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
 		reg &= ~(RK_VID_CAP_FUNC_EN_N | RK_VID_FIFO_FUNC_EN_N);
 	} else {
 		reg &= ~(MASTER_VID_FUNC_EN_N | SLAVE_VID_FUNC_EN_N);
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 854af692229b..7b670dd769e9 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -19,9 +19,16 @@ enum analogix_dp_devtype {
 	RK3588_EDP,
 };
 
-static inline bool is_rockchip(enum analogix_dp_devtype type)
+static inline bool analogix_dp_is_rockchip(enum analogix_dp_devtype type)
 {
-	return type == RK3288_DP || type == RK3399_EDP || type == RK3588_EDP;
+	switch (type) {
+	case RK3288_DP:
+	case RK3399_EDP:
+	case RK3588_EDP:
+		return true;
+	default:
+		return false;
+	}
 }
 
 struct analogix_dp_plat_data {
-- 
2.34.1

