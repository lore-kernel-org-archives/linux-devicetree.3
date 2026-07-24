Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B01F37F308;
	Fri, 24 Jul 2026 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784916217; cv=none; b=htoGKaxZW+4yNYEHCx5R7VJLM2tlvI8E5Lrd5gZhqWl1pi0dzSzzwKyCeeW9z/Te+XsZCL1Nagm3/NN1emb9NcYbnwBfO/0LK7xJJ3j8v3XeKbaM9vJpseDhi9iFvSu/Aw9Fd2a6fWfTH+RtN4OpcHxRrjJtnqc+fk+bX2gbng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784916217; c=relaxed/simple;
	bh=nogzzR9ac+VbBTxMQhGcK30fwo5nnt6PIgFs4AkbXPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jt4+HQVkILBJgXjD1bGsj3X/wVu7Xrb/ls4PLIP+u//pt5FZWlQ58dGl+3lJbRw8nNU2fLk3aWCYg/gb7+9YTmHLGErHRcBBT4ODU/Le6bwcuIQ7H20u4sibQVJcf9EvDD8skZoGh3wHbI1ftdtCwb0Gh6PobtRadaxyq4Awpc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Tbv65sBU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Tbv65sBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784916209;
	bh=nogzzR9ac+VbBTxMQhGcK30fwo5nnt6PIgFs4AkbXPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tbv65sBUiBo74GFRzSouEaYE4InH7Rp2K8sW6umilrNjJz2xi+1mdcK7XFh6SAhib
	 aLS6gCnORBfk5bGhGYNR3Fel6kS56RK+qR2LS7Id9rdH8bYnrqbRaokK9xh8+mVgRD
	 0ZJpUZmdqoVLh8/akWdBDuwun6FcQOaFla4N5N6eWdDfHDsMibBpzmDecFi06l4KDh
	 q3gl9QSvsHeZY4rLmWs6WS2mJiuB2MFZ75EL/ywJxQ+V8UXMEHLxBwJJrGo1l4ZSVh
	 MHkmvdumUHTKNb6SS+vOVjC2U4Jjose5Wb1XszJnxQisbrz7npkTmYGQ9etK0/ZlZ4
	 cpDXZJtkR86GQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9416D17E02A5;
	Fri, 24 Jul 2026 20:03:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E924148003D; Fri, 24 Jul 2026 20:03:28 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 20:03:31 +0200
Subject: [PATCH v6 09/16] drm/bridge: synopsys: dw-dp: Support software
 triggered OOB HPD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v6-9-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3756;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=nogzzR9ac+VbBTxMQhGcK30fwo5nnt6PIgFs4AkbXPM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpjqPDqZ/f7V3zBft434SH9bJtIq9/RCUVbW
 EIvy0iKhu56NIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqY6jwAAoJENju1/PI
 O/qaolYQAKSGM6hajEeGls67DawyYjNw2/UuVCOWvCwUqO94Z1MnLB6tXz/RvEPxejuddvUnPTM
 TP9AGA89aSxHl1XsQb6PY6DdhSkt5xRnwb9doAfkfxC8KD2W83IB2nEwyYrImFMVvQMVwuwvE3Q
 ePb+TXBI4zH+0LWVwx8SemJvpL72LU39EoyRB9s/Qf8XpNnbmFPfcoDJE29CzXd5yYs13cnnMF8
 nSaF1/4si//tTo15og1liqC4opBlSYcReIEdxl0ckOz19sucgG+nL12BxKpKFB77PpM6cC5k467
 1UHQ46pErJmeT0jbBm6QxO2E7+MHB04/UoiUMc+Z436gBYIUIrA9JxK6z1tLa8IJNnQ6AnmgIu9
 o/pY4mO25cizKJqNBBnqZoGCmJfWQi2ye7SYXVefex/B9vjoY9esYqao7lGPKqp1kMHkrFurcOK
 +Bab3uFbfrtx3OS4NC4uyjmsjfJVtSd1AP7PM/jrANtKON5KwdY4nXXmRDGm/doxs0V0gWImj1H
 auk5aTD28AjOrOvGoOBKOHK3V8MT7uLWZe61XuPlNPFu/QBrQE5dfu/jdAL9/9fRLl+oNxlvNby
 HWkyFTujscZJxfMI5Kv3I7I9zFi4EgB+dZCeqNZhSikqYzXl9hc5bpROysip9Ka9E3Wlzt0d7eG
 1L8Lw9Qo78QeatyBpZu8xmw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for USB-C DP AltMode out-of-band hotplug handling. The
handling itself is implemented in the platform specific driver as the
registers to force HPD state are not part of the Designware DisplayPort
IP itself. Instead the platform integration might provide the necessary
functionality to mux the HPD signal.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 38 +++++++++++++++++++++++++++++++++
 include/drm/bridge/dw_dp.h              |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 591b75c4cc36..2042bc00f906 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1852,6 +1852,19 @@ static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(struct drm_b
 	return &state->base;
 }
 
+static void dw_dp_bridge_oob_notify(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
+				    enum drm_connector_status status)
+{
+	bool hpd_high = status != connector_status_disconnected;
+	struct dw_dp *dp = bridge_to_dp(bridge);
+
+	if (dp->plat_data.hpd_sw_cfg)
+		dp->plat_data.hpd_sw_cfg(dp->plat_data.data, hpd_high);
+	else
+		dev_err_once(dp->dev, "Missing platform handler for OOB HPD handling\n");
+}
+
 static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_duplicate_state = dw_dp_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1864,6 +1877,7 @@ static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_disable = dw_dp_bridge_atomic_disable,
 	.detect = dw_dp_bridge_detect,
 	.edid_read = dw_dp_bridge_edid_read,
+	.oob_notify = dw_dp_bridge_oob_notify,
 };
 
 static int dw_dp_link_retrain(struct dw_dp *dp)
@@ -1993,6 +2007,19 @@ static const struct regmap_config dw_dp_regmap_config = {
 	.rd_table = &dw_dp_readable_table,
 };
 
+static bool dw_dp_is_routed_to_usb_c(struct drm_encoder *encoder)
+{
+	struct drm_bridge *last_bridge __free(drm_bridge_put) = NULL;
+	struct fwnode_handle *fwnode;
+
+	last_bridge = drm_bridge_chain_get_last_bridge(encoder);
+	if (!last_bridge)
+		return false;
+
+	fwnode = of_fwnode_handle(last_bridge->of_node);
+	return fwnode_device_is_compatible(fwnode, "usb-c-connector");
+}
+
 int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 {
 	struct device *dev = dp->dev;
@@ -2037,6 +2064,13 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 		goto put_next_bridge;
 	}
 
+	if (dw_dp_is_routed_to_usb_c(encoder)) {
+		dev_dbg(dev, "USB-C mode\n");
+
+		if (dp->plat_data.hpd_sw_sel)
+			dp->plat_data.hpd_sw_sel(dp->plat_data.data, 1);
+	}
+
 	dw_dp_init_hw(dp);
 
 	ret = phy_init(dp->phy);
@@ -2086,6 +2120,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 
 	dp->dev = dev;
 	dp->pixel_mode = plat_data->pixel_mode;
+
+	dp->plat_data.hpd_sw_sel = plat_data->hpd_sw_sel;
+	dp->plat_data.hpd_sw_cfg = plat_data->hpd_sw_cfg;
+	dp->plat_data.data = plat_data->data;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 
 	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index a82412a9e769..79b2cdf0df99 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -20,6 +20,9 @@ enum {
 struct dw_dp_plat_data {
 	u32 max_link_rate;
 	u8 pixel_mode;
+	void *data;
+	void (*hpd_sw_sel)(void *data, bool hpd);
+	void (*hpd_sw_cfg)(void *data, bool hpd);
 };
 
 int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder);

-- 
2.53.0

