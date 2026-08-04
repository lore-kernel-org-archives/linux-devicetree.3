Received: from mail-m21470.qiye.163.com (mail-m21470.qiye.163.com [117.135.214.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3093B1006;
	Tue,  4 Aug 2026 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832391; cv=none; b=as/7yKXhZoFLlQ9NiTGGoIVrYKzDFzGkjG2m6RecOO4zYUMaMyb+U5EXb1ec3ToVj5kmuleXGgaLBOrEjWJmZTka9crbuw0rpxReWofEbGfhn/un5MCT+rprykp9DzQIIEw08m1g1XY1x49aFy0xzaFfFyxQU2EEDazTH7bJwYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832391; c=relaxed/simple;
	bh=34Spl24dW4XTad86li3s9TJAOOlWdbSIAeFm4If3zBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r0GS0ObBQyzu7DGhNOvbj5u+wZ5xtE7cad4BoyEGcCz7OMcM0dNiJQU7wV5cubnhpCUbi4TLesH0/Jy1EvmevvmpbLrEJjRgG5BsrTVmGy6EPyex6UtmSrpjSovY+2LFs6JnZnCh3Br5k6OYRyhRnY/OjrL6/xMS47UHmauC2is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ZdcsLqXp; arc=none smtp.client-ip=117.135.214.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZdcsLqXp"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48b4fff14;
	Tue, 4 Aug 2026 16:17:33 +0800 (GMT+08:00)
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
Subject: [PATCH v2 08/10] drm/bridge: analogix_dp: Skip native HPD interrupt ops for GPIO HPD
Date: Tue,  4 Aug 2026 16:17:15 +0800
Message-Id: <20260804081717.741404-9-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a9fcbd972f403a8kunma7b8cbe762b0da
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQx5LVkhMH0MaS0xLHRlJT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZdcsLqXpStn6Iw0ho7KZ95d2hq3I5UifDk+gNcAsmurzm5b2bxwqxIYwhNljq3Ml8e1SRPLlVL11I93xofyjGx371ZtR8ci5B5GeN0rtMHld493l83PNtYwufIc/zB3a+YZO4j28tsJFQRKmS3JNr/plBMxo6ZscHDLNj5+PEQo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=/GuR0aZbsHKQkwSeMUqSwIZq3i5kXGEPG6xmtyWBKbM=;
	h=date:mime-version:subject:message-id:from;

GPIO HPD does not rely on DP controller internal native HPD interrupts.
Skip native HPD register manipulations to avoid irrelevant operations.

In analogix_dp_config_interrupt(), mute all native HPD interrupts when
dp->hpd_gpiod is set. Move the dp->hpd_gpiod guard from inside
analogix_dp_clear_hotplug_interrupts() to its caller in the threaded
IRQ handler, so that the function operates purely on the given irq_type
bitmask without implicit mode-dependent behavior. This makes it
reusable for future callers that may need to clear specific interrupt
status bits regardless of the HPD detection mode.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Adapt to the newly added IRQF_ONESHOT related commit and expand the
  commit msg.
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  2 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 30 +++++++++++--------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index d207cc864bdc..f05db455b430 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -720,7 +720,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 	bool hpd_detected;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type)
+	if (!dp->hpd_gpiod && irq_type)
 		analogix_dp_clear_hotplug_interrupts(dp, irq_type);
 
 	if (!dp->hpd_gpiod && analogix_dp_is_rockchip(dp->plat_data->dev_type))
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index fa8e2f104d6c..4b210e685747 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -182,18 +182,22 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	/*
-	 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
-	 * pair can be used to implement hotplug detection.
-	 *
-	 * On Rockchip platforms, configuring HPD deglitch to 2ms and
-	 * using HOTPLUG_CHG interrupt for hotplug detection is proven
-	 * as a better solution via engineering verification.
-	 */
-	if (analogix_dp_is_rockchip(dp->plat_data->dev_type))
-		analogix_dp_unmute_hpd_interrupt(dp, DP_IRQ_TYPE_HP_CHANGE);
-	else
-		analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ);
+	if (dp->hpd_gpiod) {
+		analogix_dp_mute_hpd_interrupt(dp, HPD_IRQ);
+	} else {
+		/*
+		 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
+		 * pair can be used to implement hotplug detection.
+		 *
+		 * On Rockchip platforms, configuring HPD deglitch to 2ms and
+		 * using HOTPLUG_CHG interrupt for hotplug detection is proven
+		 * as a better solution via engineering verification.
+		 */
+		if (analogix_dp_is_rockchip(dp->plat_data->dev_type))
+			analogix_dp_unmute_hpd_interrupt(dp, DP_IRQ_TYPE_HP_CHANGE);
+		else
+			analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ);
+	}
 }
 
 void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type)
@@ -413,7 +417,7 @@ void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp, u32 irq
 {
 	u32 reg = 0;
 
-	if (dp->hpd_gpiod || !irq_type)
+	if (!irq_type)
 		return;
 
 	if (irq_type & COMMON_INT_4_HPD_IRQ) {
-- 
2.34.1

