Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838E53F6C59;
	Thu, 23 Jul 2026 22:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845056; cv=none; b=Kvr5WaDtGJOrLT7J268deGT6WaGmgwjbBfHxVKaE53IQbsCpL5oumOWGPPH080nEt0qIyZT9wVFkCwBSzMjaV2k+d3JQsu7TMSlv/yPEiXIy61DHB1916LOryMJoqoR66LYtFAxcz2mO8xAeCXnSwYytgscLBIuCE9Sw4w0FOrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845056; c=relaxed/simple;
	bh=KYozak7rIfIhFylDJ62mqmda5vQGHAVtZhaEHfRl5tc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YNrVMWTNhDa4Idv+hGSbhvSwLr6byqsUperW0I+HbyYydrvuRC16glewRihtuD2XlwWz3qvQN/R2Y/gAjId9v0L6LDV57dxSGhzktbYjwctsiZr1dzfv3yH5ejEbcNEX/KrX+Go+JdeNWEz/5mzu6qeGtZr9vGbeNa4RvmQo2rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KdXwRV0g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KdXwRV0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784845043;
	bh=KYozak7rIfIhFylDJ62mqmda5vQGHAVtZhaEHfRl5tc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KdXwRV0gqM3toPRPACwtJfFPRLoRLmM6oWg2F7igcLp6J4bzzfIg9JSLjrAzDJaDS
	 ulJgkjWq6Qq/RrZsxoIzuf/z5dTZ/4VL+gc8t03foRzSntQ1wXAepBT3IsUAd1i63Z
	 tuZpbXhqRngnnocJ/BHxG9BMYylJ5cTuJku4koZf7yLOmfMfhmEN6i4Lo0xRC7Y9ZC
	 AprTV2NCWt/UxS9H1n25BcKOHXsx5bemcM9k0lGD1hJaAoXA5kazRdjhZRgZoH+X7P
	 os98r+SLTJx3bW3MwBYXr70ee/5lGFOmV966/Up7JUqdukUp6kDZxkOzaZ/dVO9cdc
	 c7OHz2WtuYSFw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3DAF17E39BB;
	Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1C431480048; Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 00:17:19 +0200
Subject: [PATCH v5 11/15] drm/rockchip: dw_dp: Add runtime PM support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v5-11-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4368;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KYozak7rIfIhFylDJ62mqmda5vQGHAVtZhaEHfRl5tc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpikvFvd+2eWWxFgYSd9KMxTdgGjzaCWYNWr
 DoDDsu1oONL64kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqYpLxAAoJENju1/PI
 O/qaILcQAJlL3+e3pZun+4gmOOkKA5W1MNbrBn9wM9MDRX7zjgxIeoTXkaNXP/9s6CCecoYJJls
 yOhN1MuN9wrKOCa8h6d9s8NshHJHGPWeRXmDJnXLvtiP4ONrjJ5vVOgCD//s87TdaMuP0aHOlTD
 Lnj66PuQ6ke5rtNglslnkJLYrpEvZcTYtnboCqMnSEr9N2zt0NWqkMw7d3VkTxpaFYF/u/TI4N+
 YANijCFEfsIGqRV/q8KRfaQXh+hjxWXfN+DC+/Q/E5r4cN4e5K2gZLeOKYcY7O6Gi5+qaWN874H
 iLr4dAX6i2B7hZc1GetQj+cZsmUVJie/uxMg+v1Rrv4UIFb4qEQnJSV+nmVySm2L88QDcuo2rCW
 5sFLi7rxFCS/VKv1XhtGioe3lX5Z0hyI1ly+bAotw0F3LTjS0YSivybOWT/c3DhHlguTa52jmhH
 qQqNk08ZpSqvEjdEhsuscqFNBRlz3Mn8zZBWqAc74OLDoFzaUQWUT8f81musSsXtIckwh5f8eDc
 HsX5OO/mn3U/HXSutUq93ujeXJzDkQLvyiMbBR/6ZjWSuxPIKLTCeeAfwUOjp+/IEYLe/h4YYu6
 FrcIceymfsrf+ciUyI1IsJLKQ2WuAl/SlzxhO9aBKaYZeh5WPxQWp5gdCfzI4W0Z0NKAA0/WY9x
 dSqTNDgvgymEab0INsZgv8A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for runtime PM to the Rockchip RK3576/3588 Synopsys
DesignWare DisplayPort driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 65 +++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 0ecbad24dd4e..b1a69d8821a2 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 
@@ -54,9 +55,15 @@ static void dw_dp_rockchip_hpd_sw_sel(void *data, bool force_hpd_from_sw)
 {
 	struct rockchip_dw_dp *dp = data;
 	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+	int ret;
 
 	dp->hpd_sel = force_hpd_from_sw;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(dp->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
+
 	regmap_write(dp->vo_grf, hpd_reg,
 		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, dp->hpd_sel));
 }
@@ -65,11 +72,17 @@ static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
 {
 	struct rockchip_dw_dp *dp = data;
 	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+	int ret;
 
 	dev_dbg(dp->dev, "Force HPD connected=%s\n", str_yes_no(hpd));
 
 	dp->hpd_cfg = hpd;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(dp->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
+
 	regmap_write(dp->vo_grf, hpd_reg,
 		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));
 }
@@ -165,18 +178,32 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 		return ret;
 	drm_encoder_helper_add(encoder, &dw_dp_encoder_helper_funcs);
 
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	ret = dw_dp_bind(dp->base, encoder);
 	if (ret)
 		return ret;
 
 	connector = drm_bridge_connector_init(drm_dev, encoder);
 	if (IS_ERR(connector)) {
-		dw_dp_unbind(dp->base);
-		return dev_err_probe(dev, PTR_ERR(connector),
-				     "Failed to init bridge connector\n");
+		ret = PTR_ERR(connector);
+		dev_err_probe(dev, ret, "Failed to init bridge connector\n");
+		goto error;
 	}
 
+	pm_request_idle(dev);
+
 	return 0;
+
+error:
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_resume(dev);
+	pm_runtime_disable(dev);
+	dw_dp_unbind(dp->base);
+	return ret;
 }
 
 static void dw_dp_rockchip_unbind(struct device *dev, struct device *master,
@@ -185,6 +212,9 @@ static void dw_dp_rockchip_unbind(struct device *dev, struct device *master,
 	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
 
 	dw_dp_unbind(dp->base);
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_resume(dev);
+	pm_runtime_disable(dev);
 }
 
 static const struct component_ops dw_dp_rockchip_component_ops = {
@@ -254,6 +284,34 @@ static void dw_dp_rockchip_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
+static int dw_dp_rockchip_runtime_suspend(struct device *dev)
+{
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
+
+	return dw_dp_runtime_suspend(dp->base);
+}
+
+static int dw_dp_rockchip_runtime_resume(struct device *dev)
+{
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
+	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+	int ret;
+
+	ret = dw_dp_runtime_resume(dp->base);
+	if (ret)
+		return ret;
+
+	regmap_write(dp->vo_grf, hpd_reg,
+		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, dp->hpd_sel) |
+		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));
+
+	return 0;
+}
+
+static const struct dev_pm_ops dw_dp_pm_ops = {
+	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_resume, NULL)
+};
+
 static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {
 	.num_ctrls = 2,
 	.ctrl_ids = {0xfde50000, 0xfde60000},
@@ -288,5 +346,6 @@ struct platform_driver dw_dp_driver = {
 	.driver = {
 		.name = "dw-dp",
 		.of_match_table = dw_dp_of_match,
+		.pm = pm_ptr(&dw_dp_pm_ops),
 	},
 };

-- 
2.53.0

