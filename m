Received: from mail-m49220.qiye.163.com (mail-m49220.qiye.163.com [45.254.49.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D63E2877DE;
	Thu, 30 Jul 2026 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414703; cv=none; b=gk3Eu9k20agYT2enGhgbJ62KntEDOr4/VSbYKb/xpU+3zELCj5LrFQZWkqnBYCkfhjaQ7sRocLP/x72nlpyrRINGwsuZWnBrQ/c2ChV4/uaRwDlgHJSpvSkCjCQbphlG20myd6MUV0FlwEmDy6T20lH6TvcaIE/4Y87J1+3QOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414703; c=relaxed/simple;
	bh=IykQzerDeo/4fDfwDpCXZo1aSS5CczrT+2it/yBjHzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qmu71Phua/MbQIqJqAhuDKz3bu5oxeB+QWsDTECUBz3qAhITlSn2Om0iExr2i6xzqYqN8VGKp230b5yAdOE3BkLsdUfEHgFKScjlV4LQd7rmJ9MzM8DjOp+CQ5sETOL4OzQurBLpDJImCCpV2bAjdRtdljnilOY/Uq097AxKb1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=gYJOxO7V; arc=none smtp.client-ip=45.254.49.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="gYJOxO7V"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 481c5dbe5;
	Thu, 30 Jul 2026 11:28:04 +0800 (GMT+08:00)
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
Subject: [PATCH v1 7/7] drm/bridge: analogix_dp: Skip native HPD interrupt ops for GPIO HPD
Date: Thu, 30 Jul 2026 11:27:44 +0800
Message-Id: <20260730032744.381566-8-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a9fb1109e2a03a8kunm040f791237470a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHh4YVhkZH0tNSB5KSB1KHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=gYJOxO7VF2rBVMVcyxtDaQbEIiRD8BHO9RhDcf5VOdmDEfAazaJn7nefWbKsz/97jaA/H7ycR33SCuXgNMrUIdh9tHHVuYb8jZDSTBancIYUCD62YdiduN+KXFTn+d6bg22iDytZarUOxe9toeCbZPFs7XRSs2DMwd0pRngWVXU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=fbciKp0LoMzz95JiE7ECSmclFwuRl2dYOZQo4Ge7CaE=;
	h=date:mime-version:subject:message-id:from;

GPIO HPD does not rely on DP controller internal native HPD interrupts.
Skip native HPD register manipulations to avoid irrelevant operations.

Configure interrupt routine mutes native HPD interrupts when
dp->hpd_gpiod exists. Add identical condition guards in hardirq and
threaded irq handlers. Drop redundant dp->hpd_gpiod condition inside
analogix_dp_clear_hotplug_interrupts().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  5 +--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 32 +++++++++++--------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a292bc881b6b..91fa7569950a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -708,7 +708,8 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (irq_type) {
-		analogix_dp_mute_hpd_interrupt(dp, irq_type);
+		if (!dp->hpd_gpiod)
+			analogix_dp_mute_hpd_interrupt(dp, irq_type);
 		ret = IRQ_WAKE_THREAD;
 	}
 
@@ -733,7 +734,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 			drm_helper_hpd_irq_event(dp->drm_dev);
 	}
 
-	if (irq_type) {
+	if (!dp->hpd_gpiod && irq_type) {
 		analogix_dp_clear_hotplug_interrupts(dp, irq_type);
 		analogix_dp_unmute_hpd_interrupt(dp, irq_type);
 	}
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 981ce3810e90..cf1f9216c742 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -177,20 +177,24 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	if (analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
-		/*
-		 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
-		 * pair can be used to implement hotplug detection.
-		 *
-		 * On Rockchip platforms, configuring HPD deglitch to 2ms and
-		 * using HOTPLUG_CHG interrupt for hotplug detection is proven
-		 * as a better solution via engineering verification.
-		 */
-		writel(0x80, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
-		writel(0xbb, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
-		analogix_dp_unmute_hpd_interrupt(dp, DP_IRQ_TYPE_HP_CHANGE);
+	if (dp->hpd_gpiod) {
+		analogix_dp_mute_hpd_interrupt(dp, HPD_IRQ);
 	} else {
-		analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ);
+		if (analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
+			/*
+			 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
+			 * pair can be used to implement hotplug detection.
+			 *
+			 * On Rockchip platforms, configuring HPD deglitch to 2ms and
+			 * using HOTPLUG_CHG interrupt for hotplug detection is proven
+			 * as a better solution via engineering verification.
+			 */
+			writel(0x80, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
+			writel(0xbb, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+			analogix_dp_unmute_hpd_interrupt(dp, DP_IRQ_TYPE_HP_CHANGE);
+		} else {
+			analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ);
+		}
 	}
 }
 
@@ -411,7 +415,7 @@ void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp, u32 irq
 {
 	u32 reg = 0;
 
-	if (dp->hpd_gpiod || !irq_type)
+	if (!irq_type)
 		return;
 
 	if (irq_type & COMMON_INT_4_HPD_IRQ) {
-- 
2.34.1

