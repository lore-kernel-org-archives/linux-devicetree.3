Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16F42379E;
	Tue, 28 Jul 2026 17:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260759; cv=none; b=nmB8VJO/ZSXc5wrgPVO+xYxd9SSwV94ErvqUBWHP2ilUhALBmrszFNGqJvQxgKYzycBM2McURdq5I2R4xwcafgUlxvlYu3fUbTS7wW5QMQ6MlNN79giOjG4l/chbjY/rDnJbBl8Ja/S5RY/3yPhBQzPnwT2Bz4FpN9b9Z0KWOak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260759; c=relaxed/simple;
	bh=xx2ceQmEUbIedwsjjbjRenF93i96lCbY3WSb7wtpe/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdpHwU0BnKfBENZelAwu1LW1ZOoXp39otztknUIu1n50b2U196m86nl2bf/NdXjCOYJNwJzKXhWF+jU/nz/9ZX8wM3PoS9KllAspRijCZwMRV56fbHs2WZzH8ZPDFDqor9KzpsrpMfhwNemKlBKDOBl3bNVVoruP6qFa6zRUvbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MLiKDsLf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MLiKDsLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260755;
	bh=xx2ceQmEUbIedwsjjbjRenF93i96lCbY3WSb7wtpe/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MLiKDsLfVUHaqH04VuEbrLsuogJm+icQZggr2kp73tZFXic4VW6ENoGIhJbclInKs
	 PxMy/3KBQ/27kKKd6J6zmUucHR3motgvoIBDjtidGmv5eSb/hPv/Q1G6NutF24K9gM
	 hL5qUZnYwNTMYG0HnANnNSamSXOcB8EYCLXUtxDXufq9ikcJiPZa/7WrRTwCarq5Uu
	 +xliEwMzq8A7Tu61++DIu4/Q5GSGxjipz5dgrVtES0ZXYZKKj0PwZ68i1fTcC9CUEf
	 S1uXZncQjowz3MzyobiDkaKp02/59lGE6hwD280pm/YuyrdV0KyJUS8kueQ/fjZaco
	 UOQFfebqgrBiA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEBC117E0055;
	Tue, 28 Jul 2026 19:45:55 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 22E72480062; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:53 +0200
Subject: [PATCH v7 17/18] drm/bridge: synopsys: dw-dp: Clear only enabled
 SDPs on atomic disable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-17-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2923;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=xx2ceQmEUbIedwsjjbjRenF93i96lCbY3WSb7wtpe/k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z2TH9QEE5IGgxdn2lcYgPGBGBf08gCki
 skZKuJPIDbIpIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qa+tQP/j49CBJZazsEA66kEeViFH0deAbEoQPJyHrmxS473n0LcmIkiclGWOxgkxNKHs656pb
 MHcHUWwH83mJdlxOdZpFY4QKMIUByUhB1HMHGzqvmJ9OJ/m6s5UfKWk5rP3f2TVUF7u1TBCtDfh
 FKBjtp/48EzA/XZ7ALG2w7Lj+C8jRBnW7J1KY8GBy4k5vvnp0JKoC/Iij07dh1p4HRQGQ8mujmA
 ffJZAKRQUfqwA7KPRRgJbOaLbMllR3EhXc4nsBcz/h/d97IWgWMcgt84fOAb0/f4TdwZWY65xev
 eJjIHmLZUSkvtOPfmPvOJYNAnmvjjWOQ3oAHL9uygnZFLf+95AHctVBPtfajrsZ2dnZD8cC+VZG
 S4JIumsZdyHoLvigWa08+CWMqyVyI/0fFBkRyYybWR3k5xO4Iy9r3ButTrVKEjxmaDlJibh9j/a
 FXCWK8PLeMQGrOxPy5405xpcfrstdDuc+flvTCAjACdPXG+p+w82z7lc1BgBIkwc7mSEqCRJNZM
 XUQ00tPH9fcOUyQje60xtjF/8rpJkdGRflL0r2fjOfsS8rrJbhbF1MGhdxdM9o3chbeteW6Fw7X
 c65g9EHGijqyB2C+jo4W8K6wbG6fWCMybIaea3+E6rqP6KKXHRWw8bjWMFbYwbcaAf5B9PzUgMS
 AlMFjfIVKh4fxKXDuyooyJg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

dw_dp_bridge_atomic_disable() bulk-cleared the whole SDP register bank
allocation bitmap via bitmap_zero() resulting in the loss of all
tracking information. This results in a slot potentially being handed
out again by dw_dp_send_sdp(), which is still considered to be held
by the previous owner. Then the previous owner might free up the wrong
SDP later on.

Instead of bulk clearing the tracking information, the new
implementation only clears the SDPs actually configured during
dw_dp_bridge_atomic_enable() instead of the entire bank. The
introduced functionality for that will also be used by the to-be-added
audio infrastructure.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index fcee47c6716a..c0026bd4c7b5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -336,6 +336,7 @@ struct dw_dp {
 
 	struct drm_bridge *next_bridge;
 
+	int vsc_sdp_nr;
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -1075,7 +1076,19 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 		regmap_set_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
 				EN_HORIZONTAL_SDP << nr);
 
-	return 0;
+	return nr;
+}
+
+static void dw_dp_clear_sdp(struct dw_dp *dp, int nr)
+{
+	regmap_clear_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+			  EN_VERTICAL_SDP << nr);
+
+	regmap_clear_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+			  EN_HORIZONTAL_SDP << nr);
+
+	scoped_guard(mutex, &dp->sdp_lock)
+		clear_bit(nr, dp->sdp_reg_bank);
 }
 
 static int dw_dp_send_vsc_sdp(struct dw_dp *dp)
@@ -1393,7 +1406,7 @@ static int dw_dp_video_enable(struct dw_dp *dp)
 			   FIELD_PREP(VIDEO_STREAM_ENABLE, 1));
 
 	if (dw_dp_video_need_vsc_sdp(dp))
-		dw_dp_send_vsc_sdp(dp);
+		dp->vsc_sdp_nr = dw_dp_send_vsc_sdp(dp);
 
 	return 0;
 }
@@ -1738,8 +1751,14 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
+
+	if (dp->vsc_sdp_nr >= 0) {
+		dw_dp_clear_sdp(dp, dp->vsc_sdp_nr);
+		dp->vsc_sdp_nr = -1;
+	}
 	scoped_guard(mutex, &dp->sdp_lock)
-		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+		clear_bit(0, dp->sdp_reg_bank);
+
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2191,6 +2210,8 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 	dp->plat_data.data = plat_data->data;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 
+	dp->vsc_sdp_nr = -1;
+
 	bridge = &dp->bridge;
 	bridge->of_node = dev->of_node;
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;

-- 
2.53.0

