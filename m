Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81EB48CD7E;
	Thu,  6 Aug 2026 17:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035765; cv=none; b=W+ca4yD3KErphikfB4aBr6GKeO7O1hzfmBgiucfz7qxaqtALl29mHe4rpzYF4ss7q6KCLupFntnRxzTfjgffH4JoFtgaGbCGf4WCEV2xAac/iCBMM5RaSFOihZDb1qzX3/BfVTNjmDOddc9tvyfm2C9EUzcUsX4y2HkrWSZaPPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035765; c=relaxed/simple;
	bh=jaeHYjvxDvN5MYMlI1b+NKWwckplfWJLIL504dhs+48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilPfBfiI1lIWcC25M5yheKRzOL5fi0jNUQjTBHrD4aNTedl+LwBfaMGRBV9wsujmpKAvDEwgn1MLxEI/MHI/alsPrX9+xzVCDUu+KjdkysjySLnjXrsrx9Bg/qfDONGk1Lll8TmhZWFoccfGn4h1If3gSgnoGXSHooXBDTh9rC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CJI4LHmA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CJI4LHmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786035746;
	bh=jaeHYjvxDvN5MYMlI1b+NKWwckplfWJLIL504dhs+48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CJI4LHmArxM/Fcq7RYQsrMfnzKu4bD+Lk4GP2TokKl/b8eyFpMKbfEi/xFGOixFnd
	 vvYApO+AeAEXJ0vGomyX4D+pTnTx0wIVEBp6Pw+wqNnwDdMwkZoHgWib20PeniFHkP
	 1EmbQH6psgu5odrh6YNqShbEy5Axogb52mA/b7v6i/2bSfzZljiSfAf6xArhVF/Yo9
	 oTkNNY4vhbiVHPH+6GngyEXezlnCAh4UQrer3wuvBU9Z3CkyTpQY1JdpTI+qoNGucq
	 e1uw0JFn+UDwUhzsYBmhYQZn1Linvj9moLzHNF8AAbMAt/+q2NiwscLaPQixdt+90y
	 RlBCBnaqUpePQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E720417E125C;
	Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F76E480061; Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:22 +0200
Subject: [PATCH v11 16/21] drm/bridge: synopsys: dw-dp: Protect
 sdp_reg_bank from concurrent access
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-16-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jaeHYjvxDvN5MYMlI1b+NKWwckplfWJLIL504dhs+48=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viA2wGszaznDWsbGdZj82hZjJEvwWXdzJ
 rmcRsQKkag9hIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qaO6sP/joabeMEXY/hL4a9DczVI2MyXnBUbrRfhKigTFzS+WJbBjU5wbrZzLj+PYYsI+AvaaO
 YPtkGmO0R8b2sauIMnTKG00SOY0BqDC2QlC+u9ckPU79xYvcMsxsYNnt1Agfah71ckd3JX4GLTD
 bBK/bP2osq11LiQvVF5pe0USN1eGtFgJuaDf3BtBH8k9oBNwd+hGiM3A7XLKxSgjZVdZiPUpE+9
 4cZ2IHyDBwZuko3umw06FhymOg+m8vDRVlMwaRAtpK648b/B6GB/cj8ByuZSQajHRvBs5D6BpDd
 PeZeJxRljhjyfn4GLIj+WWPcNCSyFfuRntlX8f17oln7iyclflwDZl3Pbwm6NWPXn+9J+/Eb02/
 4PRpOkat3jnCyNm2/Pubx3xJAlDn2wwbul4bhXqzBmzAsV00GjSyWf77bFzGl44yavrbUF6868v
 WNIbifV6DWH6GbScEsaond91GWiGh1M2HWk95giksiLIP0LXuhbI2uzwT69Carjr7f9vvBIfSvv
 CjJpb++p7bukrJrVT99VFKwuldKuurm1Muod7HUKN/F43r5AdVR5zUMg7NW5A1ji2DjldpVc85i
 hhwXu/KrSYsD7FbRKTtA0MfCf0rXQbcuhXOsPMEUXSvddRInRuALLF9N76inNqRjanC0enSXDPR
 fDE4O1bi2jRAOlMNCvyEzEg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now sdp_reg_bank is only used during atomic enable/disable and
thus there is no risk of two threads accidently claiming the same bit.

This changes once more SDP users (like audio support) are added, so
introduce a mutex to protect concurrent access to the bitmap.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 31f944e143ea..31495a813e40 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -323,6 +323,8 @@ struct dw_dp {
 	struct dw_dp_hotplug hotplug;
 	/* Serialize hpd status access */
 	struct mutex irq_lock;
+	/* Serialize sdp_reg_bank access */
+	struct mutex sdp_lock;
 
 	struct drm_dp_aux aux;
 
@@ -1048,11 +1050,13 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 	u32 reg;
 	int i, nr;
 
-	nr = find_first_zero_bit(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
-	if (nr < SDP_REG_BANK_SIZE)
-		set_bit(nr, dp->sdp_reg_bank);
-	else
-		return -EBUSY;
+	scoped_guard(mutex, &dp->sdp_lock) {
+		nr = find_first_zero_bit(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+		if (nr < SDP_REG_BANK_SIZE)
+			set_bit(nr, dp->sdp_reg_bank);
+		else
+			return -EBUSY;
+	}
 
 	reg = DW_DP_SDP_REGISTER_BANK + nr * 9 * 4;
 
@@ -1709,7 +1713,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	set_bit(0, dp->sdp_reg_bank);
+	scoped_guard(mutex, &dp->sdp_lock)
+		set_bit(0, dp->sdp_reg_bank);
 
 	ret = dw_dp_link_enable(dp);
 	if (ret < 0) {
@@ -1753,7 +1758,8 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+	scoped_guard(mutex, &dp->sdp_lock)
+		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2227,6 +2233,10 @@ int dw_dp_probe(struct dw_dp *dp)
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(dev, &dp->sdp_lock);
+	if (ret)
+		return ret;
+
 	res = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(res))
 		return PTR_ERR(res);

-- 
2.53.0

