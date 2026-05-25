Received: from mail-m155110.qiye.163.com (mail-m155110.qiye.163.com [101.71.155.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6B1384CEF;
	Mon, 25 May 2026 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713964; cv=none; b=VMOuqdglXtqPq/MFcdg3fd/kLo+7CAuLKq/oGfGs9CRBK6Mxk3ZY2c00i4+qJznSnOFtrHY1kMEV9EkoSlxCMkfLWZz8vzlWvObnVWpDDfbs4+GJaSWgAJRlYZXmCrI6PSYoujgSKfcCXuoJJLH60Va4NL3plnWzi3R58fArHqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713964; c=relaxed/simple;
	bh=5vXJP8Vuiu1CH5UAIAXTTfoRHnUIfuqghOY1srnWbgM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MhjPiBECK82C7xJ3/sc6Oh0Vl2VHvyHvPTrOYw9P1ET2kCkrODRYqBDA4No9kXPbNAdtq2V0P+9xFzE/iQakIFo+Rdk2Xeil+4CWMRjAcQXxnS/8ZkAfLGjUjHwRDMgmxOA2XdDvMJfgQnEcsBkZdKMCam6l1Mf1Wc6zPOphRNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ghkyyKOS; arc=none smtp.client-ip=101.71.155.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ghkyyKOS"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fbb28c54;
	Mon, 25 May 2026 20:54:03 +0800 (GMT+08:00)
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
Subject: [PATCH v8 08/10] drm/bridge: analogix_dp: Rename and simplify is_rockchip()
Date: Mon, 25 May 2026 20:53:29 +0800
Message-Id: <20260525125331.140059-9-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525125331.140059-1-damon.ding@rock-chips.com>
References: <20260525125331.140059-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5f3313f903a8kunm7b8971f5af5cdd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ04dVk5PQkJLQkseGE5KTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ghkyyKOSXhjG1KgAK0N3YEDEbf8ufER/jUb9rHAedrTRQAklPSLb2/FCIIzoFZ/kh2d0+EbEdJ5VTO1MUF6HzlEqe0MtxADtIlWRcn2kYB6hC14+oltq4TuIWmIfPjNCwMhwd0twYryoUNyFRXneE1W2B08guqvr6/dqLBRjMbc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Iic8eH/ZjacAbCYnZDsN1M7HxjET5lpUzehxwlD86N0=;
	h=date:mime-version:subject:message-id:from;

Rename inline helper is_rockchip() to analogix_dp_is_rockchip()
to follow driver namespace convention consistently across code.

Replace chained equality comparisons with switch-case layout
to improve readability and simplify adding new SoC entries later.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Suggested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- Add Reviewed-by tag.

Changes in v4:
- Modify the commit msg.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c |  2 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c  | 18 +++++++++---------
 include/drm/bridge/analogix_dp.h               | 11 +++++++++--
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 573900c2cefc..c2fd5b978fc0 100644
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
index f84c1d48d671..ea8401293a23 100644
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

