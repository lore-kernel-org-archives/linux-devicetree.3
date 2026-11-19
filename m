Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110889;
	b=SNsI4cnDWIbEY4yPG7oTgR/ADxJ884DUoCJr+MthtSALXUd0W0tw9JU1db9uojclDJxO
	 klucq+aeAD/El6XeZpXBVAGk1MPP8iS+V0ROEvxGPK/5vLH5CcEkUEMjnk6pXb9OogO99
	 UePeLfUMsmKdVrh/613m9PjA7lhQHiysq9X1WA3Mf4Gpm3xcCvSS8BFC/0od/sCXzjK9Y
	 gf16CAHqNgXUWHGszRhPFyVBzUPcfd3mXVnYl2HHQbMhI4hJTpGsuKtegtPuNBR1ezG5k
	 mGa9Fyp5I4a1teve6lORF3ttZQ4O44V+z8HhkKL1J45lGy/Pem9/RRwRn6ML4FJXYCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v3k0HZdPqxYwdAA2PNjfVeZTkUhOnuqm9brEsVD8HB0=;
	b=rPutl+Pv4IF97UY7lWxbqx7OZRwauBxAo3c3sym+9jsl5bJVAry6eBbklr60pABC7Tlx
	 AIeKbfP3d7gGpguemYxnoYL42lSgYu6VVBHdIOwNzvzJqlvzG0II9rly37I/9HYdzjRE8
	 kjnrca0JRWEiw8x7eRxaGlyFCGmYuudPE2mZHkpcxXiphaOU+NcViGa93AiP6gWoVNZC2
	 mVNksGPebBIdcGOy8lkq9ZT1lJqrPWebvgYTavzOrdE/UkgCiDPGvlIrS+1hGj40AwNq/
	 YBeGeONIN+Fe4swAo39KlR3bTdD7LEZvdol47113N5j6r9QPAecBDHfv0ws9zEGq2xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kqmfwdwX;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D1606A334
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095D1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kqmfwdwX
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so21933695e9.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110887; x=1795715687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3k0HZdPqxYwdAA2PNjfVeZTkUhOnuqm9brEsVD8HB0=;
        b=kqmfwdwXxr1CxzfuypFiYpFZLFTytHnGxdHfOUFhNZFb0aBOQC+WdKIZOLxfMve8sq
         aFJ1KD2PtvdWbZXiz975dXb70PfjIUjrRHrE0xnYW5OY8+Moc6Mqo/aohybGZTGUh9Xf
         gPg52Glexjt4TmJr0k0Xz9UGyqDdwrUGv4s+q9p8W0dcMPuZ5gaEl91kcN8Am/jsWRh1
         RpV55Zu1KYj4UAu3Z1T3/f9N5LIMwVMlO9hndQjWM2CS5gnyUk48ZmkeIbq0Gxu4NMjG
         4mw6J3z+tQjF21h9HqMKZ5hEIwoDy1dmte86rVQO8KB66inmn13qRgJAbYuNe4KQa8MO
         vSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110887; x=1795715687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3k0HZdPqxYwdAA2PNjfVeZTkUhOnuqm9brEsVD8HB0=;
        b=qYVMeyIMT3Bdgg1X+3FIQm1L4Phdopd1vaUg2V59zrZpDItCB9zhUI0qMBHJjjj4W0
         P/TnCE7fuS/SQIJ9DjFaHSeyZlrggPnKnwZM6PUhR9Q1yEYxW5IEEaGkFyksdsfHgFKu
         HrTImttcfnZZZYNOwDcCMdZiAD6FTykIJueKC38apEjzcrRdplz88OG2EO2WefEo2RnO
         6tSGvt9a8GIaoT2DKaFSnXsrEk+zP2uGRGe3FH+6aCZ1ZX+pda33rxsxUNVVOMzD1/F4
         I5giyJ/Oac68I+AIdBLP/IciS2+IBpK8XDyT6qHgfp5vgMGROFgPklJXfwbOs+hmq0hc
         valQ==
X-Forwarded-Encrypted: i=1; AL+hErF1q3sUSik457fMTs79SBB1zFnLBpIg0vl7BCHyO86apZvXgeSsxnyGbsiLG2j9bfeUokC9ydqUUCrl@vger.kernel.org
X-Gm-Message-State: APuU4Z/Dyg9ydqrPSkG+MbNfoQDcEResWPTSo1NOitRBu4gVU2gCbN58
	paaSfzYdUYDPdek5f5X+m3hq/ct+VuPlxB4mBG4zCQIzwdP0wheQVboR
X-Gm-Gg: AYBFou2oP0EjXggE5EJVUdIoLIwcyC0iqLHa4oWORRFTvEwZKE7V9swFqcyExLRD5IA
	JaD/kRYOUJCDvEaZT+YyQb3yul3/mIiHayZVVuQo0H1kT7koh3rfPueZU8UW54yMBaqUCv7Zg/r
	1CUAmZMquM9T2V3Lr47/oMFWReF+b896D9805EmpRowKXRrqI55EgPV16STUnwfORiobqiNYNAS
	FEZxRIGMknRJCSMnd6zPWv8oXl2JKyRvIR1Gz7341UjeZmGjAkfVq+DU/EZdRkKZzJxlg+jB5jv
	gDtgjHAUFrjDxGm4+vI12JAxsJ6FZoQb6nJeGSi8htYTbhlzm5p8h0wcP9kwNjJZ1QlTo0JcJ8T
	2Ajwb2fEszGVi+eAohx+ci84c3N2mAQxAF2px5/YKhvJ6ry3TiBTDqwDkT9+iglR9nwoKNd5AxI
	y+xa1nmlHXZfxwtuw4n5uvScxGBUv3JcOK3dhRs7X1xJS23kmuMUy1plMSvM+ti6DeJ3vEkXtxy
	MObtNa/HlxAgB8YD42+pEaWUN+lAnluZ1DgtpFjFFhTM6O4DAaFZbvHoh0vPQMOlFHP8UMVx02f
	4tCygh4jvxqr/Kqnh6esYNoQBhrDpgceDM93WrD8mYsQjrUOuFcjSDOjtUr6UmmxAybTTfMFy67
	uVd6wwfTEA2K/JrBP4w3V+A1gbiQ317FfqL8PA3QqKiWi1p7tuhzrp/+X129Exa8mebx/SN8ZyE
	z1p8gjvbkZwX0V+Tri9fW7Rz5ytvEuxDl5WRuy9Q0ic/YHrRf7UAAqGEJzjKhuCkaUoPzWQxqCc
	jlvO7Jucx8/QgNtSIDgZWqkAwLCE2f9djDnvbm/wcfntgEDcZT3N1Qf
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr7783735e9.2.1795110887406;
        Thu, 19 Nov 2026 09:54:47 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:47 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] drm/sun4i: Add DE33 shared plane driver
Date: Thu, 19 Nov 2026 18:54:35 +0100
Message-ID: <20261119175437.2520400-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DE33 makes its plane channels shared resources that mixers select through
routing registers in the display clock block. The existing mixer-local
plane initialization cannot represent that topology.

Add a driver that owns the shared plane register space, programs the
default channel-to-mixer mapping and creates each mixer's DRM planes
from that mapping.

The driver is only added here. It gets registered and used by the
mixer driver in a later patch, which switches DE33 to the new bindings.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/Makefile        |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c | 209 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
 3 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index bad7497a0d11..501e3d867918 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -16,7 +16,8 @@ sun8i-drm-hdmi-y		+= sun8i_hdmi_phy_clk.o
 
 sun8i-mixer-y			+= sun8i_mixer.o sun8i_ui_layer.o \
 				   sun8i_vi_layer.o sun8i_ui_scaler.o \
-				   sun8i_vi_scaler.o sun8i_csc.o
+				   sun8i_vi_scaler.o sun8i_csc.o \
+				   sun50i_planes.o
 
 sun4i-tcon-y			+= sun4i_crtc.o
 sun4i-tcon-y			+= sun4i_tcon_dclk.o
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/sun4i/sun50i_planes.c
new file mode 100644
index 000000000000..05607445cc38
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2026 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#include <drm/drm_device.h>
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "sun50i_planes.h"
+#include "sun8i_ui_layer.h"
+#include "sun8i_vi_layer.h"
+
+static const struct sun50i_planes_quirks sun50i_h616_planes_quirks = {
+	.def_map = {
+		{
+			.map = {0, 6, 7},
+			.num_ch = 3,
+		},
+		{
+			.map = {1, 2, 8},
+			.num_ch = 3,
+		},
+	},
+	.cfg = {
+		.de_type	= SUN8I_MIXER_DE33,
+		/*
+		 * TODO: All planes support scaling, but driver needs
+		 * improvements to properly support it.
+		 */
+		.scaler_mask    = 0,
+		.scanline_yuv	= 4096,
+	},
+};
+
+static const struct of_device_id sun50i_planes_of_table[] = {
+	{
+		.compatible = "allwinner,sun50i-h616-de33-planes",
+		.data = &sun50i_h616_planes_quirks
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun50i_planes_of_table);
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer)
+{
+	struct sun50i_planes *planes = dev_get_drvdata(dev);
+	const struct sun50i_planes_quirks *quirks;
+	struct drm_plane **drm_planes;
+	const struct default_map *map;
+	unsigned int i;
+
+	if (!of_match_node(sun50i_planes_of_table, dev->of_node))
+		return ERR_PTR(dev_err_probe(dev, -EINVAL,
+					     "Device is not planes driver!\n"));
+
+	if (!planes)
+		return ERR_PTR(dev_err_probe(dev, -EINVAL,
+					     "Planes driver is not loaded yet!\n"));
+
+	if (mixer >= MAX_DISP)
+		return ERR_PTR(dev_err_probe(dev, -EINVAL,
+					     "Mixer index is too high!\n"));
+
+	quirks = planes->quirks;
+	map = &quirks->def_map[mixer];
+
+	drm_planes = devm_kcalloc(drm->dev, map->num_ch + 1,
+				  sizeof(*drm_planes), GFP_KERNEL);
+	if (!drm_planes)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < map->num_ch; i++) {
+		unsigned int phy_ch = map->map[i];
+		struct sun8i_layer *layer;
+		enum drm_plane_type type;
+
+		if ((i == 0 && map->num_ch == 1) || i == 1)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		if (phy_ch < UI_PLANE_OFFSET)
+			layer = sun8i_vi_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+		else
+			layer = sun8i_ui_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+
+		if (IS_ERR(layer))
+			return ERR_PTR(dev_err_probe(drm->dev, PTR_ERR(layer),
+						     "Couldn't initialize DRM plane\n"));
+
+		drm_planes[i] = &layer->plane;
+	}
+
+	return drm_planes;
+}
+
+static void sun50i_planes_init_mapping(struct sun50i_planes *planes)
+{
+	const struct sun50i_planes_quirks *quirks = planes->quirks;
+	unsigned int i, j;
+	u32 mapping;
+
+	mapping = 0;
+	for (j = 0; j < MAX_DISP; j++)
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch < UI_PLANE_OFFSET)
+				mapping |= j << (ch * 2);
+			else
+				mapping |= j << ((ch - UI_PLANE_OFFSET) * 2 + 16);
+		}
+	regmap_write(planes->mapping, SUNXI_DE33_DE_CHN2CORE_MUX_REG, mapping);
+
+	for (j = 0; j < MAX_DISP; j++) {
+		mapping = 0;
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch >= UI_PLANE_OFFSET)
+				ch += 2;
+
+			mapping |= ch << (i * 4);
+		}
+		regmap_write(planes->mapping, SUNXI_DE33_DE_PORT02CHN_MUX_REG + j * 4, mapping);
+	}
+}
+
+static const struct regmap_config sun50i_planes_regmap_config = {
+	.name		= "planes",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x17fffc,
+};
+
+static int sun50i_planes_probe(struct platform_device *pdev)
+{
+	struct platform_device *clk_pdev;
+	struct device *dev = &pdev->dev;
+	struct sun50i_planes *planes;
+	struct device_node *np;
+	void __iomem *regs;
+
+	planes = devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
+	if (!planes)
+		return -ENOMEM;
+
+	planes->quirks = of_device_get_match_data(dev);
+	if (!planes->quirks)
+		return dev_err_probe(dev, -EINVAL, "Unable to get quirks\n");
+
+	np = of_parse_phandle(dev->of_node,
+			      "allwinner,plane-mapping", 0);
+	if (!np)
+		return dev_err_probe(dev, -EINVAL, "Missing mapping phandle\n");
+
+	clk_pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!clk_pdev)
+		return dev_err_probe(dev, -EPROBE_DEFER, "Unable to get mapping\n");
+
+	/* Regmap is registered by display clocks driver during its probe. */
+	planes->mapping = dev_get_regmap(&clk_pdev->dev, NULL);
+	if (!planes->mapping) {
+		platform_device_put(clk_pdev);
+		return dev_err_probe(dev, -EPROBE_DEFER, "Unable to get regmap\n");
+	}
+
+	if (!device_link_add(dev, &clk_pdev->dev,
+			     DL_FLAG_AUTOREMOVE_CONSUMER)) {
+		platform_device_put(clk_pdev);
+		return dev_err_probe(dev, -EINVAL, "Failed to create link\n");
+	}
+	platform_device_put(clk_pdev);
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	planes->regs = devm_regmap_init_mmio(dev, regs, &sun50i_planes_regmap_config);
+	if (IS_ERR(planes->regs))
+		return PTR_ERR(planes->regs);
+
+	sun50i_planes_init_mapping(planes);
+
+	dev_set_drvdata(dev, planes);
+
+	return 0;
+}
+
+struct platform_driver sun50i_planes_platform_driver = {
+	.probe		= sun50i_planes_probe,
+	.driver		= {
+		.name		= "sun50i-planes",
+		.of_match_table	= sun50i_planes_of_table,
+	},
+};
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.h b/drivers/gpu/drm/sun4i/sun50i_planes.h
new file mode 100644
index 000000000000..9b4f77a6b94e
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (c) 2026 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#ifndef _SUN50I_PLANES_H_
+#define _SUN50I_PLANES_H_
+
+#include "sun8i_mixer.h"
+
+/* mapping registers, located in clock register space */
+#define SUNXI_DE33_DE_CHN2CORE_MUX_REG	0x24
+#define SUNXI_DE33_DE_PORT02CHN_MUX_REG	0x28
+#define SUNXI_DE33_DE_PORT12CHN_MUX_REG	0x2c
+
+#define MAX_DISP	2
+#define MAX_CHANNELS	8
+#define UI_PLANE_OFFSET	6
+
+struct regmap;
+struct drm_device;
+
+struct default_map {
+	unsigned int map[MAX_CHANNELS];
+	unsigned int num_ch;
+};
+
+struct sun50i_planes_quirks {
+	struct default_map	def_map[MAX_DISP];
+	struct sun8i_layer_cfg	cfg;
+};
+
+struct sun50i_planes {
+	struct regmap				*regs;
+	struct regmap				*mapping;
+	const struct sun50i_planes_quirks	*quirks;
+};
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer);
+
+extern struct platform_driver sun50i_planes_platform_driver;
+
+#endif /* _SUN50I_PLANES_H_ */
-- 
2.43.0

