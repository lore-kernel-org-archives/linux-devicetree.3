Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556594307AA;
	Mon,  3 Aug 2026 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780656; cv=none; b=CvoFKhCJUgYtlDjMgqB7dHtj2aHSK2vfjXKR+11+Gh1RxsmytFjaGgcXVChYWKWn78zYbKM+s+XaWqwSPmr/Qu0AMKQMtWt7/EZliNaiQsE/7L/LrJHMe27njhy/AC4jFhYxQsim+t5JdCTX+G4uNFgD4NS54OnZ2dIYHAx8VMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780656; c=relaxed/simple;
	bh=W1DWjzmrjuk3PygoGjrJSXgr4rE7/rYJZFBCfsWa26I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCtpnWifMU0OawSuZYMA1Lb7QWc5yd7+gTuaDi6Dzqz7Q/yycLXaF+PsTaWUiiRbEyi7vfFrK3OzM+IzzElIsCwUPztYO3YbqfWEGhC/l6JevchQ84pMaENiN+EtbVZJdOPJNRdRe0ujQWrzngnb3pf6usHt37641HTio1pTTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oAi3o9+f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oAi3o9+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780653;
	bh=W1DWjzmrjuk3PygoGjrJSXgr4rE7/rYJZFBCfsWa26I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oAi3o9+faaEi7bKxXpxuoTxjKBou2jiMip3VO8ih429FrMxd0daozCvxmFyc/hgy2
	 vFvmXmkXG2IyjYbf9eywjX3z4YrXAzeOlX/oyW2L7HTpk4VERYq8Vgev3/E1VcDhjj
	 9ILfvd7rLyBCMPKRiEgBbqWWAqUPwUVHHMWIp/NOoFv9nAfbkOgH7wew/BjEDTbBiq
	 zWwlsXlITzVbHh5xmyv6MieiDhBQrm+Q/4zWmg/DjEoRkTj0c7vfmLmbH2eSzyobKA
	 h20GxuqV45zFHz5d8zR1+tE0KRXTBaRATpQ6b9CcObT/s3P7ltPk8/NQTWjCzuVOgg
	 nl1Xo1m9RDjYg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 476B817E0053;
	Mon, 03 Aug 2026 20:10:53 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7C735480065; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:20 +0200
Subject: [PATCH v9 19/22] drm/bridge: synopsys: dw-dp: Clear only enabled
 SDPs on atomic disable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-19-2e6e46135312@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2746;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=W1DWjzmrjuk3PygoGjrJSXgr4rE7/rYJZFBCfsWa26I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E+Hx2rjRLnA+GIT79MVmOd7GYZL99ZGy
 TCsecRUbe29dokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhPAAoJENju1/PI
 O/qaOG4P/AmrVOf38b4+dUs3sNcSQT4T+2yhUJ4WXcHIOaFfxrwnlWPlc5AUP96IXEz9UnKFoMd
 Su62LwCPv+lXYSOH57h3HLEqZULNklQ1SZuKQy2dk+Y7pIU87SEJOkZ6JPUE4grVITrv1x2ll6J
 7HFarseQjHwix9o+EyAbxLzlL0Os7+WCju91evyUP8VZTILKJC9xAJedpOXTpMVd8Wq6VeSt++t
 JrvY6ASNI1tZaOU+d4WAIcxAfPmxFhktr5DvxRZdOmN0NVzhJKpbzlGtRwSmmPbYF244yvcAPfs
 fYEj08hurUAjdi9j+aVrK3L7We9/q38G/yo+sRPM0xKFBtMn69kEQMtnEYUgPNuXJZ4tHaORv8E
 NGj61CfdlNgjOkObYyxXnl4uNlhGJlnLLO1GBqItRv5HrSVHM49pCJUHtPCwmvbMNoIz5hNUc+E
 roMZKDe0cjogs6LhyVzJiZ3ZGoD0DUiB1zVMOMKWTnfFb5DgtvHDpbLQdTY0xuJQJJX3v9vxsJW
 YqA4E4W+W9yyTFvqd6RmOzDvflqHt7JDk9eh6iYEZyeEh9POC3tsN1sNcE8aB5MrmTWKA9rqCIB
 XWlYy6/RogHjGqTHeo1oda3ywtNM7aYJOMLgIpFqy7jsEH+w1KNerpJyFxAgs5PdWv0kyzI+5yD
 DLQSNlL7oUnqpegaeTFUvtA==
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
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 05d3485a4d8d..d8c6a99e93b8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -337,6 +337,7 @@ struct dw_dp {
 
 	struct drm_bridge *next_bridge;
 
+	int vsc_sdp_nr;
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -1078,7 +1079,19 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 				   EN_HORIZONTAL_SDP << nr,
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
@@ -1396,7 +1409,7 @@ static int dw_dp_video_enable(struct dw_dp *dp)
 			   FIELD_PREP(VIDEO_STREAM_ENABLE, 1));
 
 	if (dw_dp_video_need_vsc_sdp(dp))
-		dw_dp_send_vsc_sdp(dp);
+		dp->vsc_sdp_nr = dw_dp_send_vsc_sdp(dp);
 
 	return 0;
 }
@@ -1748,8 +1761,12 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	scoped_guard(mutex, &dp->sdp_lock)
-		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+
+	if (dp->vsc_sdp_nr >= 0) {
+		dw_dp_clear_sdp(dp, dp->vsc_sdp_nr);
+		dp->vsc_sdp_nr = -1;
+	}
+
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2338,6 +2355,8 @@ int dw_dp_probe(struct dw_dp *dp)
 	if (ret)
 		return ret;
 
+	dp->vsc_sdp_nr = -1;
+
 	bridge = &dp->bridge;
 	bridge->of_node = dev->of_node;
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;

-- 
2.53.0

