Received: from mail-m15588.qiye.163.com (mail-m15588.qiye.163.com [101.71.155.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6968360ECE;
	Tue,  4 Aug 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844019; cv=none; b=PnUOkPJiVjsyMvXu7awvEjz2UeEZ8BkbaRLP7bn7OkQzm5yze69VWq6124/+DV9OTbRByiUiJVgDHMcOHCav6Ch09BOGZCEqMGWGUIgNveAtcYh+7aI0mcDtO6F6vYLKIUc7YVb9ybkzTKmqwWiNL3wXkpkP+m4GeKQ4CyLWmi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844019; c=relaxed/simple;
	bh=iQQraIX2R/eSNcCd+92PzjuBC1PDwefamqHSldfYo3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R6gRh8k/0FXKmfDIz3psoT1EWNkm92ghosTavlmCjnkxSvDxEltc37aoqj4DmxmJHeySgVu7JeKOLtgsGnGgIXE6nikJzVkg1cQw3mCXEe9kQ8cUSWr8XqJ53Xdst7V9lGAstrrZHsri7bDqKMlYHsjaFRt14GTWTp4+TCrW6T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Ilny2gef; arc=none smtp.client-ip=101.71.155.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Ilny2gef"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48b4ffefa;
	Tue, 4 Aug 2026 16:17:31 +0800 (GMT+08:00)
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
Subject: [PATCH v2 06/10] drm/bridge: analogix_dp: Simplify analogix_dp_config_interrupt()
Date: Tue,  4 Aug 2026 16:17:13 +0800
Message-Id: <20260804081717.741404-7-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a9fcbd969af03a8kunma7b8cbe762b0b7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHx0aVhgZSxpNHRhOSRhPTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ilny2gefQCJVl3LsNpL98tknZMCCkF1HpMnI5+cdtFnRPSjTzQ8Jc16OvD1DyrXO2TnYQSB/xfiFICjIG66lJ6VuDMdiTVGhWB3fzIM+ljsYLAB9d9TIazH/KVauSbJeVNzXI56hGRzOzaGOFUDXLhvcSCKy2stkF8/I0eb+uDU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=2pOneZc7dpt16hg70UmlDabGGhoDjNds+kJxO+jHrek=;
	h=date:mime-version:subject:message-id:from;

Remove local COMMON_INT_MASK and INT_STA_MASK macros. These constants
are only used once inside this function and bring no reuse benefit.

Replace open-coded register writes for COMMON_INT_MASK_1~3 with
direct writel(0) calls.

Leverage analogix_dp_unmute_hpd_interrupt() using the full HPD_IRQ
mask to initialize HPD interrupt state, removing duplicated register
handling.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 25 +++----------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 816be79a8da6..42463e18f392 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -18,12 +18,6 @@
 #include "analogix_dp_core.h"
 #include "analogix_dp_reg.h"
 
-#define COMMON_INT_MASK_1	0
-#define COMMON_INT_MASK_2	0
-#define COMMON_INT_MASK_3	0
-#define COMMON_INT_MASK_4	(HOTPLUG_CHG | HPD_LOST | PLUG)
-#define INT_STA_MASK		INT_HPD
-
 #define HPD_IRQ			(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
 				 DP_IRQ_TYPE_HP_CHANGE | DP_IRQ_TYPE_IRQ_HPD)
 #define COMMON_INT_4_HPD_IRQ	(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
@@ -178,23 +172,12 @@ void analogix_dp_swreset(struct analogix_dp_device *dp)
 
 void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 {
-	u32 reg;
-
 	/* 0: mask, 1: unmask */
-	reg = COMMON_INT_MASK_1;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_1);
-
-	reg = COMMON_INT_MASK_2;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
-
-	reg = COMMON_INT_MASK_3;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
-
-	reg = COMMON_INT_MASK_4;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_1);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	reg = INT_STA_MASK;
-	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ);
 }
 
 void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type)
-- 
2.34.1

