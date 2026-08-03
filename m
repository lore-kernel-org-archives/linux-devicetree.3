Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC243031A;
	Mon,  3 Aug 2026 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780657; cv=none; b=YwIvk+FwPYNT2cz18pu71D4pw2kOw2RZAtsWo8zIzzZcRuOuml7WPhrq1IMc3IqX7yTlad1fDVglXxVO+IAcsvkydJhT/7zpso6wzZFNOQseEzz3X+/YNTCG6xGfGbiNr+AQ9PGaykkcXgKV6fsLtRQBLZXKb3pouxmYAMGigME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780657; c=relaxed/simple;
	bh=Aruh5826b4wtnxe+k2RSV4tTeWw4FEiWIslPr3Y+k4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cdf7199ApQBhF1dcy0TPAsVa1rqjRZnaPndflx+S+xJAK8QCrjyjVMRCQp+lnmZpNWteC84rxIugdTB1gVGluvdL5fYMB/C7y6fK9tmw0O4aR9t5RQ3H+9BCXJHraVK052zRJ5sHWKQwBskGfjGy80u7rhT+uOoILBXBcjPIvXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mSJ0pTHH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mSJ0pTHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780653;
	bh=Aruh5826b4wtnxe+k2RSV4tTeWw4FEiWIslPr3Y+k4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mSJ0pTHHWVV8zTxw2HDA7G2WZ2FmevEUbcTX+haILU+Be7mpnV6tqNr6n1PMDE2Tz
	 AlHH+WwgCPFmf1lYn+5Q4ThKWGXEWaRYvQh2BfnCD8yWx/hTmMK5h70Nilm++ZY6R1
	 fInBfBtGV95r/NIY2kdnABvdm9c8k5lwkBlZHg/LDBzs0uvRzZ6p6emEhGCZUVDlrn
	 aLwiVs9xyLWf/v6ZGCZdAnErEHBBqcbZCjp1zFxc7MLREO4QD47FtW5z/Wejuh1gB7
	 w5mKtL1KePGwEm77lwpVgDnfVKitDYXwatM9jAnbtuC+vuaenDJrOZHp7cpDr7vQFD
	 vQ0LLS+AFt8Rg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 489AC17E0235;
	Mon, 03 Aug 2026 20:10:53 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 79750480062; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:18 +0200
Subject: [PATCH v9 17/22] drm/bridge: synopsys: dw-dp: Protect sdp_reg_bank
 from concurrent access
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-17-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
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
 bh=Aruh5826b4wtnxe+k2RSV4tTeWw4FEiWIslPr3Y+k4Y=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E8yhIO8BZ7FGnbgyT2xSBAKvjm6mFpTL
 BuKe2JvfIqWLokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhPAAoJENju1/PI
 O/qalewP/3Aqct1OjEEN3uR0AqUaagiH4nkmlfmNLkdgMATAie4QKABebBRbo9LqcQexWr3KOUc
 0vzosJEJgcOJ48kzuC6DqKwRBYtzrlXKJGkw2ofyQ0S7EQ1sNYzLgT/SomleK0qwHGaK178Gh/O
 TERFAKISEWmXm+9KLIMGkTryeeyRPl5pouhHI40nU3WzZvtcpYXZtgoenM7yr1BctmTd7W5hhYi
 C6ZDT/kgMcV/RGj534lrsEEIs8t5mMMB/sAZTMKcaa6XMR4VjCngEJhkjHBRtE8u8UqwYWXYoFm
 yLOJtKm7qCo1yoYcQ2fpp+Ek/st5O0HdUAHF0OxZAd6S2GjK9yIJGa/M7J9Jdc7lTlnKDL5HuBJ
 TcRTVjDGVxuQ4OEj7hKInq4AqVfMx6fRWWBDQQKVE3EasqZixFimO25Fsn6vMySl1MxZ/FqAlnP
 FtzGloXy28cTA3bEF+4JgvvQyfCf4V2YBfNUjV5yJt9j70geblLWQ5VR7mJHvHJo6E0XVvw4mSd
 2acNR5QaY5I1bn5lyECe4UfQDRStrPy/wn8ON8Rflmm90qbv2Dj0aVhYBDYrSJjbyDUhg9Ye/Aa
 TxQ/2VubkmdyYGHytMNC7n7hSJIxfbChiSxhLfHk5MyU4ay9yrUK978Ekk0qmA3v2vEz0/0lkr9
 H6VXUCdllBVLhDpRkrFwrcg==
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
index 501b28abeca2..19b6c11f672f 100644
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
 
@@ -1702,7 +1706,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	set_bit(0, dp->sdp_reg_bank);
+	scoped_guard(mutex, &dp->sdp_lock)
+		set_bit(0, dp->sdp_reg_bank);
 
 	ret = dw_dp_link_enable(dp);
 	if (ret < 0) {
@@ -1746,7 +1751,8 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+	scoped_guard(mutex, &dp->sdp_lock)
+		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2249,6 +2255,10 @@ int dw_dp_probe(struct dw_dp *dp)
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

