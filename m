Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF89371D05;
	Thu,  6 Aug 2026 17:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036278; cv=none; b=f23FCnxBdTQVWZWIN2PlcI99ZoXcy4Rnkitk0LKUFSw+re/u5CNSe+W85duUP0RSWeNjPSiJPlHqtPCESdXpJVxx9ONXT8Q8Wbq0RTc9lS02Iu+SJMxxRttX/mEDiWhdWFIqPlcAffiESrShhdLsVylyEaBrQRyVMrwaDDKV8s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036278; c=relaxed/simple;
	bh=JD88w8teGMGJhjYFcaBdeCra3Vbfn/1k/AlbKAvT/vA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erj5VTDe9wnkYLf04sII85RoJtKCwuKSf5t5RiS5ES5V/aMtNzUit1l9VTxmCUesx7f5fwo2Ho2os0x0spvoQia5FV1ubZUt0akFwOTE3M+B91GSX7SrTNYn/Cs+0GaixGkS76BE1jQKTGsVQQGHhwot9CkecMEXR6ID47PO7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p+BljBTx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p+BljBTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786036273;
	bh=JD88w8teGMGJhjYFcaBdeCra3Vbfn/1k/AlbKAvT/vA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p+BljBTxL+XjBB8RLPLOfa5AI4WNo5Iz2Kn92mLg2C2Qns2dI2/cc0gJirou8Q6/F
	 VY1AeXklyqCNFp4IUBCBqG23DET74CsDbz77j4Bn2MtZDi5F1taGHN3vIUjg6fuy0m
	 MmxGx3ZTVuJsPVFyM9z4POhz921X5XPIPDuvTQhFyOcww2dlhKj2EhkFDz38R49CY8
	 fswRwYQ8ctNqfbS8yZHvM5A1Z17Qt/azORs7s+9x9NMHZTOEgFTOVaVpXpH6E1htvy
	 BoQLoP2rNtb+/Pds7+3ZYfjeUVN3rMMOBER9Hx24ZYw31lnq4DuT6CxlrahtAviezT
	 9CtZ4mbfBDkWQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B87E17E051A;
	Thu, 06 Aug 2026 19:11:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 126DB480064; Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:24 +0200
Subject: [PATCH v11 18/21] drm/bridge: synopsys: dw-dp: Clear only enabled
 SDPs on atomic disable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-18-0d508505f383@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2746;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=JD88w8teGMGJhjYFcaBdeCra3Vbfn/1k/AlbKAvT/vA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viCbYaHiWG8DwHONme1EUDHgeIK2gbHEs
 febCX8XcQn0v4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qaweYP/At5atQ0smgY+XI+uJyLeDTNGGfHFGk0UCnMKhoCrMSzfoqw+ZS70c5BiIZxpkHlb6I
 c/qj/9b+hM0vqBYpLk7jwfFuFNp4ijcaYNLkYSWWf97Qk6c+sHA+brxuczgumk+z0WUKbO6p5aN
 5HCcDDiiG4YQsrcc1lukM5DwrPDfXhx6kNXg1nFtcQJ/JC5Ym5mTzreFYf79KUilLUHTkhelOjN
 HFTubo0nhm5tO3XOonewX88us+qhBDnd4b38xlGpwTKUCysRxLNW1dTp7P90QiW0CDmaePZn6ZB
 0SOeBazTAxPDDi1W+Q+WA+fRguS2KETTV9R09KGqa8DZnkzbJbSC2i9lW761JZ4SPCd+ZYxVB9C
 kPTYf/Ilu79VA7FFsrk24Uc0OAKU6HRUI1/mJiR0ddaYEgwIiGsSU1P2sB7RP8jNSlY7GF3WK3A
 mMe+no68c9z/Tm6otll6P5mfoaJZcP6hkdKf3X/KsWmZC4+bKVgmm+QsnJ3/VMnYaulFSrniZiQ
 7wXfEq2FuURFO3SaoHDt9BZx6ylIadbIji7Dr7r8LA9otPwE169U7CyTs4BiamWaWhprCeXHZBZ
 bOLX6JS3TJz6QQEXGH3q2PIdp5nIVPpW16xLFPEsPR3DTZGEONP89BwMSN31dLt//nLYVzoer1O
 0wdiEOrFnEPIJnEdYAog2ew==
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
index d8682ccdfec8..39e21524a965 100644
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
@@ -1755,8 +1768,12 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
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
@@ -2349,6 +2366,8 @@ int dw_dp_probe(struct dw_dp *dp)
 	if (ret)
 		return ret;
 
+	dp->vsc_sdp_nr = -1;
+
 	bridge = &dp->bridge;
 	bridge->of_node = dev->of_node;
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;

-- 
2.53.0

