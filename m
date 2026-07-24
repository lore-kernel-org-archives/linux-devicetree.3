Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14BA37F012;
	Fri, 24 Jul 2026 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784916217; cv=none; b=JUc11rtdBnwsGLrcMwfNVF4g3T44kOuAnWAMmUc7EaiRP6JAC93blH5aT6KyNAhOdFD2XY97aZH9N0fToR4QKS1qngRkR+OLbEg2WRKrycyaDxmZed7KZFXtam4ZqnPxmBdpiE2PBQ5MCOWrx0FLoqNuphmFZxAIQI+ppE0xS+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784916217; c=relaxed/simple;
	bh=dD8wMemlHuF99b5V8VTvaNJwIEsVl6jSjpD/ac+VXXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxp6vJVX7+8yTjf3mHlsZGvfyAavA/bOKEUyaKEun1n3kPaSertsqCfXkhT2fdyQ9KV+nApCa34Wne0oE65KpXo+OLGBv9RhxdvP52KyzjPDYa/mdILYnmyznoE+aGrzXlvCeHIP+NkeZGuyZVVNkoHlIeCYXC0zgmIdhB8Ob5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fea1z+t5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fea1z+t5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784916209;
	bh=dD8wMemlHuF99b5V8VTvaNJwIEsVl6jSjpD/ac+VXXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fea1z+t5+ZhpBkOI2wPHOM1IBxPRP5jrtAFpmfVFZQNuO8r3OsBmJ5e6+zqNlGN51
	 t7Ei0nT20I14w2vsLLV06kT61X2gpKq0+GJZqKRbquVT1vTGHe9Nj/e9MzFgQ3zcRs
	 4BmmnGuBfCSoYfCFlRMmWuIpfs/8PiSvB5ej+lqbSOIIfA4n4HWNkUWrkKBNifTwDz
	 oVxcPKIPPBWsz6YXYGZdRQ2S3a+dzLaxzj7Cd4cNZk3jQsQBuSQqlb1tOgePDawrm8
	 AMempwCiBIG3d3c75O64Q/is7T+UHvVIT+lbJJLIeYJfq29INtCbwAaJNM5OGDFDcx
	 oiMQnfFoBXiAw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9704E17E02AD;
	Fri, 24 Jul 2026 20:03:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EA96B480047; Fri, 24 Jul 2026 20:03:28 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 20:03:32 +0200
Subject: [PATCH v6 10/16] drm/rockchip: dw_dp: Implement out-of-band HPD
 handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v6-10-041d99a19c4e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6500;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dD8wMemlHuF99b5V8VTvaNJwIEsVl6jSjpD/ac+VXXg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpjqPDp0lL9aFJMsPmCeJT8l3NQPY1hE82Gt
 MKMLEc8r1F7RYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqY6jwAAoJENju1/PI
 O/qa2BQP/imT9bDZ/z90BkrvrAvOOwx6q0BJHvCyJAoNGNjuDVh3C5QwZDswP/9VvrzUnxSOZ3v
 DpnN3I+0SCiUa+upE6yB2GlbXGJ9bqm7Gq1zfkm8NWm9kAiD+rIDyG32+zKoXhFWdADCkYAIKBC
 AwPpE5OsWUlnNYHQmYnJ47A6T2CniPFox2ks8/qejHpxBZ14pcsQNarr19jr66RA/B2SkeoGiQi
 NfTjVcIh5D9W/PGLhTOWAdoeer5qwXvJYijfvhS9gxvtIz4rf9Ix412ErfA/ZrtGCJGDf439A6l
 OLKlQr2N0W5ffbDGIe5y5Qk8cZmVGRIwodnAPNsQZBOmxNy6LrYKrIFcTpTO/PwQCGzmWwLFPxP
 2F0nuqreSDcXQ1AYz8cN7JYTYb8hELuq01c/e8q6L3Ei89kXggZIAJM1tF2SoU5L3rmIjm+eIKa
 W1F+HmPD1x4RDUzQ/xjQp6tDCDqnrbz2JCHv+JxN87ZNYWngx5PGBS4ouho4vcizV9GQPEedKvT
 Uj3PkgPZSRydWDS1olqx/UndaMWPhkmn8H8wYgUntXL2TInhq5BoAIRvoh+oURjttKgcN9xPiiV
 FIHUf+5461ctJpY6x9W5rQkPKXWWYMfL27dUsqaDDhQN8z0oXbKM4QligAmC/gwOE7vACrRyVm8
 iSuWspnGja7PLSrh+IxosVA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Implement out-of-band hotplug handling, which will be used to receive
external hotplug information from the USB-C state machine. This is
currently handled by the USBDP PHY, which brings quite some trouble
as the register being accessed requires the power-domain from the DP
controller. Thus this patch prevents massive SError problems once
runtime PM is enabled. Apart from that it avoids custom TypeC HPD
info parsing in the USBDP PHY driver.

In contrast to the USBDP PHY this does not just enable the hotplug
signal when a DP AltMode capable adapter is plugged in, but instead
properly detects if a cable is plugged in for things like USB-C to
HDMI adapters.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 124 ++++++++++++++++++++++++++++--
 1 file changed, 119 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 005938dc66c9..ee0bd696064e 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -7,9 +7,12 @@
  */
 
 #include <linux/component.h>
+#include <linux/hw_bitfield.h>
 #include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/videodev2.h>
 
 #include <drm/bridge/dw_dp.h>
@@ -23,12 +26,54 @@
 
 #include "rockchip_drm_drv.h"
 
+#define ROCKCHIP_MAX_CTRLS 2
+
+#define ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL BIT(10)
+#define ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG BIT(11)
+
+struct rockchip_dw_dp_plat_data {
+	u8 num_ctrls;
+	u32 ctrl_ids[ROCKCHIP_MAX_CTRLS];
+	u32 max_link_rate;
+	u8 pixel_mode;
+	u32 hpd_reg[ROCKCHIP_MAX_CTRLS];
+};
+
 struct rockchip_dw_dp {
 	struct dw_dp *base;
 	struct device *dev;
+	const struct rockchip_dw_dp_plat_data *pdata;
+	struct regmap *vo_grf;
 	struct rockchip_encoder *encoder;
+	int id;
+	bool hpd_sel;
+	bool hpd_cfg;
 };
 
+static void dw_dp_rockchip_hpd_sw_sel(void *data, bool force_hpd_from_sw)
+{
+	struct rockchip_dw_dp *dp = data;
+	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+
+	dp->hpd_sel = force_hpd_from_sw;
+
+	regmap_write(dp->vo_grf, hpd_reg,
+		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, dp->hpd_sel));
+}
+
+static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
+{
+	struct rockchip_dw_dp *dp = data;
+	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+
+	dev_dbg(dp->dev, "Force HPD connected=%s\n", str_yes_no(hpd));
+
+	dp->hpd_cfg = hpd;
+
+	regmap_write(dp->vo_grf, hpd_reg,
+		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));
+}
+
 static int dw_dp_encoder_atomic_check(struct drm_encoder *encoder,
 				      struct drm_crtc_state *crtc_state,
 				      struct drm_connector_state *conn_state)
@@ -71,6 +116,35 @@ static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
 	.atomic_check		= dw_dp_encoder_atomic_check,
 };
 
+static struct regmap *dp_dp_rockchip_get_vo_grf(struct rockchip_dw_dp *dp)
+{
+	struct device_node *np = dev_of_node(dp->dev);
+	struct of_phandle_args args;
+	struct regmap *regmap;
+	int ret;
+
+	ret = of_parse_phandle_with_args(np, "phys", "#phy-cells", 0, &args);
+	if (ret)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * Limit this workaround to RK3576 and RK3588, potential future platforms
+	 * reusing the driver should just add a VO GRF phandle in the DisplayPort
+	 * controller DT node.
+	 */
+	if (!of_device_is_compatible(args.np, "rockchip,rk3576-usbdp-phy") &&
+	    !of_device_is_compatible(args.np, "rockchip,rk3588-usbdp-phy")) {
+		regmap = ERR_PTR(-ENODEV);
+		goto out_put_node;
+	}
+
+	regmap = syscon_regmap_lookup_by_phandle(args.np, "rockchip,vo-grf");
+
+out_put_node:
+	of_node_put(args.np);
+	return regmap;
+}
+
 static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
 {
 	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
@@ -121,19 +195,53 @@ static const struct component_ops dw_dp_rockchip_component_ops = {
 
 static int dw_dp_rockchip_probe(struct platform_device *pdev)
 {
-	const struct dw_dp_plat_data *plat_data;
+	const struct rockchip_dw_dp_plat_data *plat_data_const;
+	struct dw_dp_plat_data *plat_data;
 	struct device *dev = &pdev->dev;
 	struct rockchip_dw_dp *dp;
+	struct resource *res;
+	int id;
 
-	plat_data = of_device_get_match_data(dev);
-	if (!plat_data)
+	plat_data_const = device_get_match_data(dev);
+	if (!plat_data_const)
 		return -ENODEV;
 
+	plat_data = devm_kzalloc(dev, sizeof(*plat_data), GFP_KERNEL);
+	if (!plat_data)
+		return -ENOMEM;
+
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, dp);
 	dp->dev = dev;
+	dp->pdata = plat_data_const;
+
+	res = platform_get_mem_or_io(pdev, 0);
+	if (!res)
+		return -ENODEV;
+
+	/* find the DisplayPort ID from the io address */
+	dp->id = -ENODEV;
+	for (id = 0; id < plat_data_const->num_ctrls; id++) {
+		if (res->start == plat_data_const->ctrl_ids[id]) {
+			dp->id = id;
+			break;
+		}
+	}
+
+	if (dp->id < 0)
+		return dp->id;
+
+	dp->vo_grf = dp_dp_rockchip_get_vo_grf(dp);
+	if (IS_ERR(dp->vo_grf))
+		return PTR_ERR(dp->vo_grf);
+
+	plat_data->max_link_rate = plat_data_const->max_link_rate;
+	plat_data->pixel_mode = plat_data_const->pixel_mode;
+	plat_data->hpd_sw_sel = dw_dp_rockchip_hpd_sw_sel;
+	plat_data->hpd_sw_cfg = dw_dp_rockchip_hpd_sw_cfg;
+	plat_data->data = dp;
 
 	dp->base = dw_dp_probe(pdev, plat_data);
 	if (IS_ERR(dp->base))
@@ -147,14 +255,20 @@ static void dw_dp_rockchip_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
-static const struct dw_dp_plat_data rk3588_dp_plat_data = {
+static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {
+	.num_ctrls = 2,
+	.ctrl_ids = {0xfde50000, 0xfde60000},
 	.max_link_rate = 810000,
 	.pixel_mode = DW_DP_MP_QUAD_PIXEL,
+	.hpd_reg = {0x0000, 0x0008},
 };
 
-static const struct dw_dp_plat_data rk3576_dp_plat_data = {
+static const struct rockchip_dw_dp_plat_data rk3576_dp_plat_data = {
+	.num_ctrls = 1,
+	.ctrl_ids = {0x27e40000},
 	.max_link_rate = 810000,
 	.pixel_mode = DW_DP_MP_DUAL_PIXEL,
+	.hpd_reg = {0x0000},
 };
 
 static const struct of_device_id dw_dp_of_match[] = {

-- 
2.53.0

