Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com [45.254.49.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA91A9FA0;
	Thu, 30 Jul 2026 03:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785382405; cv=none; b=uu2msguEfgjO8vNVwf5IPER02i4vNDJ7bSk5AgaDL6qPyFH9DCO4Y4SPGNpGhn99Z1yQeykGqjk3qaaCSoRflB8VAFKypnviehx/XMFWdNKFRSs/nkoYihqg85JiOXxAb3W384APXnjXsFD2D+vFDmJTlAyw8gsQEFqw44Msp0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785382405; c=relaxed/simple;
	bh=p1wNd7E/0PjEGux9/htqeyVEMutbRFXr3Lwyrl3uhLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZP8KL22it+eekmjmqx6eWNb8gQB4v7lJSeV4brX6KodPDS0LfwQEP0nQh65oxphk4iSnQrk+hNqWnr6mBmP2B8wMclmnnVcYZFU9VmCm95WbqfeRVnb33iBPZpLmgCXGbIIDF/q9//ZBOERLU6xW6lB8QeyBst1H4mV+8p7Xgas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=kkqG58EZ; arc=none smtp.client-ip=45.254.49.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="kkqG58EZ"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 481c5dbe0;
	Thu, 30 Jul 2026 11:28:03 +0800 (GMT+08:00)
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
Subject: [PATCH v1 6/7] drm/bridge: analogix_dp: Use platform-specific HPD detection scheme
Date: Thu, 30 Jul 2026 11:27:43 +0800
Message-Id: <20260730032744.381566-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730032744.381566-1-damon.ding@rock-chips.com>
References: <20260730032744.381566-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fb11099f703a8kunm040f7912374703
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTx0aVh5MQhhPThgZHh0YGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=kkqG58EZk/bq0j0078a+tutvBffDoUkUeP5DBcaR2GjxzGZwKm+vFqJzXagP3ujiMTNjxaw7l8eFPr8XwwGj5tTQXqi9q4jFdaFv4E2US4QkXaNiFMb+7PW+9LSmrGF1+W4uatEIaX4Ik8C4Ssv13JBFxiim95ziqeDO0f6HoUw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=elyGK4QoDPo3Zn9iP3mbc9y7RPMCsYI4PnIQJ5KkDHs=;
	h=date:mime-version:subject:message-id:from;

Hotplug detection can be implemented either via HOTPLUG_CHG interrupt,
or the combination of PLUG and HPD_LOST interrupts.

For Rockchip platforms, configure HPD deglitch to 2ms and rely on
HOTPLUG_CHG interrupt for hotplug events, which is verified as the
optimal solution through engineering tests. Other platforms continue
using PLUG + HPD_LOST pair.

Adjust analogix_dp_config_interrupt() to apply platform-specific
interrupt masking and deglitch settings. Update threaded irq handler
to check corresponding interrupt flags according to platform type.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c   |  9 +++++++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c    | 16 +++++++++++++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 5af4150f0e7e..a292bc881b6b 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -719,10 +719,15 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
 	u32 irq_type;
+	bool hpd_detected;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
-	    irq_type & DP_IRQ_TYPE_HP_CABLE_OUT) {
+	if (!dp->hpd_gpiod && analogix_dp_is_rockchip(dp->plat_data->dev_type))
+		hpd_detected = irq_type & DP_IRQ_TYPE_HP_CHANGE;
+	else
+		hpd_detected = (irq_type & DP_IRQ_TYPE_HP_CABLE_IN) ||
+			       (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT);
+	if (hpd_detected) {
 		dev_dbg(dp->dev, "Detected cable status changed!\n");
 		if (dp->drm_dev)
 			drm_helper_hpd_irq_event(dp->drm_dev);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 42463e18f392..981ce3810e90 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -177,7 +177,21 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ);
+	if (analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
+		/*
+		 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
+		 * pair can be used to implement hotplug detection.
+		 *
+		 * On Rockchip platforms, configuring HPD deglitch to 2ms and
+		 * using HOTPLUG_CHG interrupt for hotplug detection is proven
+		 * as a better solution via engineering verification.
+		 */
+		writel(0x80, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
+		writel(0xbb, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+		analogix_dp_unmute_hpd_interrupt(dp, DP_IRQ_TYPE_HP_CHANGE);
+	} else {
+		analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ);
+	}
 }
 
 void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type)
-- 
2.34.1

