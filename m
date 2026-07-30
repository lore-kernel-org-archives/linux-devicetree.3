Received: from mail-m19731103.qiye.163.com (mail-m19731103.qiye.163.com [220.197.31.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A824F1A9FA0;
	Thu, 30 Jul 2026 03:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785382396; cv=none; b=abI1sPy5zt/QBZjuHdnx4iNZ1T014b+ilwjQxGJ9pZHGufo+zqKTRNkirZHlUjuX4qOA5lGUmYO7ehIJX/mh7PtNGMcDGNHxXGQ0CTBHgz1IpNsYfjvfo0TVtLF3f77sGQ9o1R4hu7ul9+PRRBnqtq1b4tkSentwC9Ue1ktD9MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785382396; c=relaxed/simple;
	bh=iDoVBLHkDb4p/1jahlJ7Ys37qZ+6h+WWlnrkrs7xY9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uhi3FX0qszJV+E1fK62ewqczqf5aq5e2lxhUOnQk/s+DuujXdtlA4zqY4iKNuZl+C8zba6LpO2mpbBIQpG2wIcQSvfQmPMU5mrnuzI+03FIxj7nttoy+asosOCKYkw8vD7LDV7Y1H/GdSwA73OBpmYAdUZJ+aFdm3ShnM8lSfwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=jzjCBuJJ; arc=none smtp.client-ip=220.197.31.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="jzjCBuJJ"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 481c5dbc7;
	Thu, 30 Jul 2026 11:27:58 +0800 (GMT+08:00)
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
Subject: [PATCH v1 2/7] drm/bridge: analogix_dp: Return bitmask from analogix_dp_get_irq_type()
Date: Thu, 30 Jul 2026 11:27:39 +0800
Message-Id: <20260730032744.381566-3-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a9fb11087dd03a8kunm040f79123746d8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSxhCVh5OQk1JTk8aSUpLSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=jzjCBuJJMs9KiaxN7pQlbpwJGxBZLiAbbOVxyV7GEYPB6S64uW2MCFtZcN5McW12BxogcI2f5o5ZynPrVAVXgnRuTvOnQx0L4KhakvX4wNUDx2rONQsIY8mqyay9R9a+zVa8G1YuWYMKU3EVSW5nuosJVvUQucxNoEOdcACBpNg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nibWolBMkK6jl5RmFsqVCP++4t5LFaYADZM67lC/RMo=;
	h=date:mime-version:subject:message-id:from;

Analogix DP controllers support two sets of interrupts for hotplug
detection: HOTPLUG_CHG, and the pair PLUG / HPD_LOST. The current
driver logic relies on PLUG/HPD_LOST and does not consume HOTPLUG_CHG,
nor does it check for INT_HPD for IRQ_HPD events.

The existing analogix_dp_get_irq_type() returns on the first matched
interrupt flag. This causes the hardirq handler to unconditionally mute
all HPD interrupts, including HOTPLUG_CHG and INT_HPD, creating a
limitation for future extensions.

To prepare fine-grained interrupt handling, convert the return type
from enum dp_irq_type to a u32 bitmask. Accumulate all pending
interrupt flags instead of returning early, and add detection for
DP_IRQ_TYPE_IRQ_HPD. Remove DP_IRQ_TYPE_UNKNOWN sentinel; use zero
to indicate no pending interrupts, which simplifies code and
facilitates future extension for additional interrupt types.

This prepares subsequent changes to pass specific irq flags into
mute/unmute helpers for selective interrupt control.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c |  8 ++++----
 .../gpu/drm/bridge/analogix/analogix_dp_core.h |  4 ++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c  | 18 ++++++++++--------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index d414f4ff40c8..c04af9fd4092 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -704,10 +704,10 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
 	irqreturn_t ret = IRQ_NONE;
-	enum dp_irq_type irq_type;
+	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type != DP_IRQ_TYPE_UNKNOWN) {
+	if (irq_type) {
 		analogix_dp_mute_hpd_interrupt(dp);
 		ret = IRQ_WAKE_THREAD;
 	}
@@ -718,7 +718,7 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
-	enum dp_irq_type irq_type;
+	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
@@ -728,7 +728,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 			drm_helper_hpd_irq_event(dp->drm_dev);
 	}
 
-	if (irq_type != DP_IRQ_TYPE_UNKNOWN) {
+	if (irq_type) {
 		analogix_dp_clear_hotplug_interrupts(dp);
 		analogix_dp_unmute_hpd_interrupt(dp);
 	}
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index c7997677a286..c2eba77f9a81 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -120,7 +120,7 @@ enum dp_irq_type {
 	DP_IRQ_TYPE_HP_CABLE_IN  = BIT(0),
 	DP_IRQ_TYPE_HP_CABLE_OUT = BIT(1),
 	DP_IRQ_TYPE_HP_CHANGE    = BIT(2),
-	DP_IRQ_TYPE_UNKNOWN      = BIT(3),
+	DP_IRQ_TYPE_IRQ_HPD      = BIT(3),
 };
 
 struct video_info {
@@ -193,7 +193,7 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 int analogix_dp_init_analog_func(struct analogix_dp_device *dp);
 void analogix_dp_init_hpd(struct analogix_dp_device *dp);
 void analogix_dp_force_hpd(struct analogix_dp_device *dp);
-enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp);
+u32 analogix_dp_get_irq_type(struct analogix_dp_device *dp);
 void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp);
 void analogix_dp_reset_aux(struct analogix_dp_device *dp);
 void analogix_dp_init_aux(struct analogix_dp_device *dp);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index ea8401293a23..f4f859cb2936 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -413,8 +413,9 @@ void analogix_dp_force_hpd(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
 }
 
-enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp)
+u32 analogix_dp_get_irq_type(struct analogix_dp_device *dp)
 {
+	u32 irq_type = 0;
 	u32 reg;
 
 	if (dp->hpd_gpiod) {
@@ -426,17 +427,18 @@ enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp)
 	} else {
 		/* Parse hotplug interrupt status register */
 		reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
-
 		if (reg & PLUG)
-			return DP_IRQ_TYPE_HP_CABLE_IN;
-
+			irq_type |= DP_IRQ_TYPE_HP_CABLE_IN;
 		if (reg & HPD_LOST)
-			return DP_IRQ_TYPE_HP_CABLE_OUT;
-
+			irq_type |= DP_IRQ_TYPE_HP_CABLE_OUT;
 		if (reg & HOTPLUG_CHG)
-			return DP_IRQ_TYPE_HP_CHANGE;
+			irq_type |= DP_IRQ_TYPE_HP_CHANGE;
+
+		reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA);
+		if (reg & INT_HPD)
+			irq_type |= DP_IRQ_TYPE_IRQ_HPD;
 
-		return DP_IRQ_TYPE_UNKNOWN;
+		return irq_type;
 	}
 }
 
-- 
2.34.1

