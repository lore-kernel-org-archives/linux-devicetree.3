Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36BB36CDF2;
	Wed, 17 Jun 2026 18:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722323; cv=none; b=t/rcs6BkkdroSrTxOl/2UlmV18TBW1VzP2bAq0f8UxMGZT9lKQW+dzAsQS74nVkvVJ/vu8Q54K9F+seWhwFnDH82zUA98jwv7LobBgf/FAZTPsPIT06D6dIZvwlJ9Sp+fOomZvZ3gFhq4any6oJwaCoYq087XF16nqbLys3iJSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722323; c=relaxed/simple;
	bh=tDHwRux0qgauDQRJ/SgFhalXY5Xhd44tAAD464FLUWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ea/PTMqBMJI3xSrFSUfeVgTBoNcStsJmwhMfh2O6N4CJsMrWoL0v/PURLEIOIn/r4ObMx6lTBioe1dS73B52eTJ2MPZp698Zswt2a2G74Au05beUJwJPYREg105suG5iaYb22mFLRjVmoI8vnkNy9caBOrXx7/RyVD7fmApEM3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fsFzTKxU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fsFzTKxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781722320;
	bh=tDHwRux0qgauDQRJ/SgFhalXY5Xhd44tAAD464FLUWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fsFzTKxUoCR14ChJpZz4mNX+uUsVs2aSQoL9vPhDTEfZ6BNrXwDnhH0UKBRnMdkbf
	 JtNkGY1kuxS9iYbg8yxjzcmq5lcK7fuPR4VDWOsYvk8xrVYSgIvFAtJ+eNeSW9LHzh
	 pLN8A6klZejQjEDqqfECnoaMHn2bH0C/5j0twmZrr9cjUwv7m8w2vF3g/z81LeVSOt
	 vZvMMSyRVYoZa5MamS3b3DY21OQNjDOOStdkn6T3X5CIKzTHRhSZt5eA1+D3bZxfMv
	 SaK73uYFyc/Ovs60kOnlb+BZcFWKsJK/v0nPvtUQuHe3cG0Iah7xNuXznDsQyEmssu
	 bazzRLNeKAjpw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53E0F17E0B81;
	Wed, 17 Jun 2026 20:52:00 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 17 Jun 2026 21:51:55 +0300
Subject: [PATCH 2/9] drm/rockchip: vop2: Reset AXI and DCLK to improve
 robustness
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-dw-hdmi-qp-yuv-v1-2-a665cfd06d7d@collabora.com>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Assert the AXI reset in the CRTC disable path, and the VP DCLK reset in
the enable path.

These resets are intended to leave the hardware in a clean state for the
next use, helping recover from exceptions such as IOMMU page faults, as
well as to prevent random display output glitches, such as a blank
image, observed when switching modes that also change the color format,
e.g. from RGB to YUV420 and vice versa.

For now this seems to affect only the RK3588, hence the resets are
optional and will be provided in the device tree for this SoC only.

Co-developed-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 35 ++++++++++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4cce3e336f5b..2833fb49ad81 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/swab.h>
 
 #include <drm/drm.h>
@@ -860,6 +861,26 @@ static int vop2_core_clks_prepare_enable(struct vop2 *vop2)
 	return ret;
 }
 
+static void vop2_clk_reset(struct vop2 *vop2, struct reset_control *rstc)
+{
+	int ret;
+
+	if (!rstc)
+		return;
+
+	ret = reset_control_assert(rstc);
+	if (ret < 0) {
+		drm_warn(vop2->drm, "failed to assert reset: %d\n", ret);
+		return;
+	}
+
+	udelay(10);
+
+	ret = reset_control_deassert(rstc);
+	if (ret < 0)
+		drm_err(vop2->drm, "failed to deassert reset: %d\n", ret);
+}
+
 static void rk3588_vop2_power_domain_enable_all(struct vop2 *vop2)
 {
 	u32 pd;
@@ -938,6 +959,8 @@ static void vop2_disable(struct vop2 *vop2)
 {
 	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);
 
+	vop2_clk_reset(vop2, vop2->axi_rst);
+
 	pm_runtime_put_sync(vop2->dev);
 
 	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);
@@ -1948,6 +1971,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
 
+	vop2_clk_reset(vop2, vp->dclk_rst);
+
 	drm_crtc_vblank_on(crtc);
 
 	vop2_unlock(vop2);
@@ -2531,6 +2556,11 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 			return dev_err_probe(drm->dev, PTR_ERR(vp->dclk),
 					     "failed to get %s\n", dclk_name);
 
+		vp->dclk_rst = devm_reset_control_get_optional(vop2->dev, dclk_name);
+		if (IS_ERR(vp->dclk_rst))
+			return dev_err_probe(drm->dev, PTR_ERR(vp->dclk_rst),
+					     "failed to get %s reset\n", dclk_name);
+
 		np = of_graph_get_remote_node(dev->of_node, i, -1);
 		if (!np) {
 			drm_dbg(vop2->drm, "%s: No remote for vp%d\n", __func__, i);
@@ -2890,6 +2920,11 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return dev_err_probe(drm->dev, PTR_ERR(vop2->pll_hdmiphy1),
 				     "failed to get pll_hdmiphy1\n");
 
+	vop2->axi_rst = devm_reset_control_get_optional(vop2->dev, "axi");
+	if (IS_ERR(vop2->axi_rst))
+		return dev_err_probe(drm->dev, PTR_ERR(vop2->axi_rst),
+				     "failed to get axi reset\n");
+
 	vop2->irq = platform_get_irq(pdev, 0);
 	if (vop2->irq < 0)
 		return dev_err_probe(drm->dev, vop2->irq, "cannot find irq for vop2\n");
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index ffcb39c130aa..14b437d2d088 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -165,6 +165,8 @@ enum vop2_win_regs {
 	VOP2_WIN_MAX_REG,
 };
 
+struct reset_control;
+
 struct vop2_regs_dump {
 	const char *name;
 	u32 base;
@@ -238,6 +240,7 @@ struct vop2_video_port {
 	struct vop2 *vop2;
 	struct clk *dclk;
 	struct clk *dclk_src;
+	struct reset_control *dclk_rst;
 	unsigned int id;
 	const struct vop2_video_port_data *data;
 
@@ -329,6 +332,7 @@ struct vop2 {
 	struct clk *pclk;
 	struct clk *pll_hdmiphy0;
 	struct clk *pll_hdmiphy1;
+	struct reset_control *axi_rst;
 
 	/* optional internal rgb encoder */
 	struct rockchip_rgb *rgb;

-- 
2.54.0

