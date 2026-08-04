Received: from mail-m19731110.qiye.163.com (mail-m19731110.qiye.163.com [220.197.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B753E7BCC;
	Tue,  4 Aug 2026 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785836004; cv=none; b=R+aSuPC6cK+xlCrm9WVYCUT2iP8P2wtEKdrDbCku7O7CIJYrVQbCCAxROrUzWHrnRJ7/wrmQZNNwa9eWZdd4laCE0kLWytMo0KCLjFWKXwrvKGfdBwhWzSXffEcqY5YtXQSywiCQLMpaE+V2rr45CZPhzZ37/n03iTSo0vmi3YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785836004; c=relaxed/simple;
	bh=cUD/E9kxs8m+LBDGITFdmdcgwtIYbt66jX7jFGSVfUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qzpax5zNVR400jKlh5dlTgYpah3z7qR8ZL4LE/GcWdxwv6u5Sf9vDVfiUnwynMHCnccELFJVDyCZvU+EkBy81nk2/OQSWHu4HvSwbEdlvkqusFn8Q+gUp2vkG9Dk49Lj7t2ApYuqxACaziBXHJt04CahtpqvNLHAPsHM7dseYqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=AJ68viMF; arc=none smtp.client-ip=220.197.31.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="AJ68viMF"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48b4ffedc;
	Tue, 4 Aug 2026 16:17:27 +0800 (GMT+08:00)
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
Subject: [PATCH v2 03/10] drm/bridge: analogix_dp: Add IRQF_ONESHOT and simplify IRQ handling
Date: Tue,  4 Aug 2026 16:17:10 +0800
Message-Id: <20260804081717.741404-4-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a9fcbd95bcb03a8kunma7b8cbe762b08a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGkJIVh9CT0MfQh4dHh8aH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=AJ68viMFBWXHxnjGTpoaeHbV7UH+To0yZHQkuIi2zsNchT/UmmiTJ1GDwIZYD03Jnq+zFQVW3M2aCgFS1hncqlC/JqqXa8vmw5RtkyqizLA8Wv/BS2eJ8u/QN0D++8gil8tiBGoW4oecZs7+bH2LtMcjyRCssLrWQuOsUNY8EE4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=jE0sGXJbI2reJDuV1UC0Tv41kr0JIA5TRuBvGefwpJk=;
	h=date:mime-version:subject:message-id:from;

The threaded IRQ is requested without IRQF_ONESHOT, allowing hardirq to
preempt the threaded handler. This creates a read-modify-write race on
HPD interrupt mask registers between the hardirq mute and thread unmute
operations.

Add IRQF_ONESHOT to keep the IRQ line masked during thread execution,
which eliminates the race and makes the per-event mute/unmute calls in
hardirq and thread handlers redundant. Move interrupt status clearing
to the beginning of the threaded handler, before
drm_helper_hpd_irq_event(), to avoid losing events that arrive during
the event handling.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c  | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 7ef8ef812b55..4fe248e66515 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -707,10 +707,8 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type) {
-		analogix_dp_mute_hpd_interrupt(dp);
+	if (irq_type)
 		ret = IRQ_WAKE_THREAD;
-	}
 
 	return ret;
 }
@@ -721,6 +719,9 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
+	if (irq_type)
+		analogix_dp_clear_hotplug_interrupts(dp);
+
 	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
 	    irq_type & DP_IRQ_TYPE_HP_CABLE_OUT) {
 		dev_dbg(dp->dev, "Detected cable status changed!\n");
@@ -728,11 +729,6 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 			drm_helper_hpd_irq_event(dp->drm_dev);
 	}
 
-	if (irq_type) {
-		analogix_dp_clear_hotplug_interrupts(dp);
-		analogix_dp_unmute_hpd_interrupt(dp);
-	}
-
 	return IRQ_HANDLED;
 }
 
@@ -1403,10 +1399,11 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		 * that we can get the current state of the GPIO.
 		 */
 		dp->irq = gpiod_to_irq(dp->hpd_gpiod);
-		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN;
+		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN |
+			    IRQF_ONESHOT;
 	} else {
 		dp->irq = platform_get_irq(pdev, 0);
-		irq_flags = IRQF_NO_AUTOEN;
+		irq_flags = IRQF_NO_AUTOEN | IRQF_ONESHOT;
 	}
 
 	if (dp->irq == -ENXIO) {
-- 
2.34.1

