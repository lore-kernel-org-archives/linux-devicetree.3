Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A00388377;
	Thu,  6 Aug 2026 00:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785976759; cv=none; b=qDBm55miRD7wNuPwAuc6ttS6aBpVB7y6phFDA1Ki09zjYoLH+TANDKmqh9R4vwuPVLrYMB3e4oyQ2nSVSot8tHKid87vqB5ZlVyI5GNjQypuO7R71cGAGtAwI61+7Trr1LRfLgILcwWhynKyKbbqC4BUra8vTJd3LBweMa2Ri00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785976759; c=relaxed/simple;
	bh=/pny3r7ktgDc2Z+IoylC5iAQmlaEL0Yh0JrwtTyx240=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IS6T/dgNom18AHX2PcZwBGxvk/tD8RgSTNseDg4t1RuUttN1OnqCxNsqSX5ZwwJEUP/yC6AnohXhgnU5ZwdTAcxx7BWVIUiBTKuzXBR8PQyhMe/MXFkZy7Xb+7CUX11ID4XPyQrQ/03wC1frS228UJ4X5QhICtbtef2aZee+yKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aG64Ov0N; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aG64Ov0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785976751;
	bh=/pny3r7ktgDc2Z+IoylC5iAQmlaEL0Yh0JrwtTyx240=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aG64Ov0NQjtVWfmCPFZcPSn5GI40uY0Rw0cmishWEaYkAjoqIB+1E25aclhEab97U
	 00fgG7tGrJO2W+7PtdPuJHycXOPlZBXlraWmC7/JRXULI8u0raIDV/hG0j4eeBURjB
	 qpdS5fKtRnpbbiDOXktXk8IlV/GjqhRzwwkUgl8jVeLCK+A2YkENqwuSxAlERX6u/A
	 NGQ/XqXpasbH3lIegAwuEAPaHvurTnHNLyvbOiF1VwUts8rOeMcUsHWogDuoRgylNh
	 fvTwpXPWMX3HFXtDJ+NeJ5KY0z3yKd6Sb7fL/PPZmYlw6K8e28Z2UADxLjSU6VOflh
	 ftDBvIbuM3MEg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 846B317E084E;
	Thu, 06 Aug 2026 02:39:11 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9E287480061; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:22 +0200
Subject: [PATCH v10 16/21] drm/bridge: synopsys: dw-dp: Protect
 sdp_reg_bank from concurrent access
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-16-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
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
 bh=/pny3r7ktgDc2Z+IoylC5iAQmlaEL0Yh0JrwtTyx240=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz167wZVFaB2j2JT4LQKLFTVJWIbXQdcXOk
 qqJYVWBwAzDtokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9euAAoJENju1/PI
 O/qacE4QAIeBECduSDd7RLHt7dZy72CUXmLfxhcAccV9cyo4IA+NxxpwzEYzBepPzLKUlqsVL+f
 z7lAxnNUbGSBlR3wx0oPMYPDY5vsCdCXa5x5HnAqDF6k14WhyoWNlsonC8+bnnM/Yz5YRJVcxav
 SE6HD3YOr5xhR3TPp0gsdMYwo6BcatJLo+zYDk/z/hqy7igM7oxyAmziFuMu5oXgPtj9C3tsq/g
 i6MeT807KiefEeb30tno7sYGVkSxV6LMAUfmBxC1/xDGCLSrrh8G+n//xh529l1/wTJSTP0xZMo
 h/aCnt2b9jon4EAOLHxuLHqnHNWg7c+YjlqiBJz7ed8LcYd1LpCX/rOLKvGkYwLxVZynGwzJXr/
 VvwrI5mp9OjAHlqOgvuGwIkm7CX+DEbymncatH2P7uc+DMnIM8TKczkYCge2PX2xexF7mMDhDYR
 NimiJRRr9/1vWJ9QoU9VYQoqaP79K52MFwB/NyUlxVF3mO53wzgskE7VACjpKd0cVAHXbRCznXU
 7lvniktXVgLkWGvqf2RIKRZAS/k07LACv9qQ9b/DAl6auOD2w9KHRPKfC7jgeraEUUQNnPHFC+3
 z5vKZn7FjlgjgKJW6qyB6tLRVThzX5s0010zKHnEsrgT8WlPo0aHu/HUrXJIj/FXOz0FfBy01/D
 5iMAA1gaxsGjEsE2kG4sygw==
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
index b8ba884d04ed..a63fe1fc0969 100644
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
 
@@ -1708,7 +1712,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	set_bit(0, dp->sdp_reg_bank);
+	scoped_guard(mutex, &dp->sdp_lock)
+		set_bit(0, dp->sdp_reg_bank);
 
 	ret = dw_dp_link_enable(dp);
 	if (ret < 0) {
@@ -1752,7 +1757,8 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+	scoped_guard(mutex, &dp->sdp_lock)
+		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2229,6 +2235,10 @@ int dw_dp_probe(struct dw_dp *dp)
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

