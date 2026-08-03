Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513CD431A28;
	Mon,  3 Aug 2026 18:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780316; cv=none; b=rvyXexJZgFlzTYOeAbZb+QOukycGHdwbmExKbM7zHPYSPqTgWCIsu4Up/FgTD4PXVp3LgsmDC9Z8I20Sgh3MfC4MXdFtY82mtANKc9maRZQvc3EqkkOiNaHkln6H0uSnh1aNYmLYXHUc04ZCt5wLVE+8w/6273vR69yEkvn2za4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780316; c=relaxed/simple;
	bh=8QSlSuWPiGUI9AoT3cgCttdenutXBFd4174AAf6FMNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5aD1m14YPPIIBnrFWBuWNzISS1Uc6gfgZZUbKt2p6g6oQ55kAxWjXOs1k13+bSW4ybbcNzfSlfVDXQRFEOeJpUWDBkaSgU9KDFBBQwlgJyk7Q6GCdrCARdNEFmTBdMwykwUciw/UE+xv9Y/kyqH2ih/rlZbXBUDDhBsAQkLcMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GPK5u8x7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GPK5u8x7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780304;
	bh=8QSlSuWPiGUI9AoT3cgCttdenutXBFd4174AAf6FMNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GPK5u8x7ivnJImWzJ6RaMDQYWb7AFxErHP/Tvo+ENejQvg4F86iph2muOFonrSUUt
	 nS69yWW81u1DouzN5kARgD2ppfF8Jywe++OZLBnn7Rwa8HqOybLUzNZYPxC8eoYx6C
	 o+KdEPoo36skYpq5OGGPVHkjCmWbZIJafF6fXxp8ljaEZpWEcx6lXnU22suFua4GTK
	 wWvv3NdC3hl4W24DobIq9uPu+cjSSsrbBUO4JEdS+aDxwkyhosvWvvSHmPI06nfl7h
	 I1wCCOkgPrnu6koF13zAxK8vGJbG5j5BOPUDkn3cYvNbyBh8Jg+gC0mamEFW9F67ir
	 6bb6HEzTUrqSQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77CF917E1229;
	Mon, 03 Aug 2026 20:05:04 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 78096480061; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:17 +0200
Subject: [PATCH v9 16/22] drm/rockchip: dw_dp: Add runtime PM support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-16-2e6e46135312@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2728;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8QSlSuWPiGUI9AoT3cgCttdenutXBFd4174AAf6FMNQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E+r/JK6rbBd1bJ9mvGx4sWIcG9hMWAzL
 ogdh+35JamkGokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhPAAoJENju1/PI
 O/qaOZUP/3b9R5tMruY8nj7UyEnLFf4P8GQHm7Ep5EgQsyOlEZ/c08WCzZKziN+BpV43pBcbL/E
 Gmj0Ck0vagJwKBChFdc8mD9+BTAfqNCL4t0yPatigmgdXdim2x5Tomb0qEyc3ZvIW2atTrSLdWU
 jjiZ+mryQ1Cw21axGGSYUmcXQOjcjW+VJRA+eShVu1IBlxPAIcgL7N0RWCJxODCsTzfjx6Z9ExM
 +a9i6oj2AWNzysU019JxLTYRftHETmONWCQkGWP8+oAVX/a7UfuBvXozWj6JFwKLUVTBT+IXV4d
 lXOkafIRhvo9FAyyBu8ujX68nh252ccrtzVENanrztK49CVRkyWbloD/NLGbPXTbcNrdZSFibP4
 t1IuAQnXggGvB0HhD57VMAYRXG+/nKSFLekF/ByM2vD0gb6PxaSUvlNIwjZZ3rHy7aUNS1OmkRZ
 UjQTnX4/1PDnohzW4nn+u+2H+A9bKJK8CiXrNGZkOCl0HoNj6zQPMO/KmOqQ537SmQnz/NxH92w
 qKKCKCM9cIuwUC0ny1HMa2CZ9ihoBvHFgybMv5aMFZKJgmL0GCmK9vOuy05NJkBrJdsYIBQcYW1
 hio64vXAaHSpP9KrNdWYDVO9rsd03D/i/XMcnjrVL3jJw+NsHX0d9cXhHftBAAXbjdI8psWBiWo
 MQggY0cR0vavULlUqTO0qaw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for runtime PM to the Rockchip RK3576/3588 Synopsys
DesignWare DisplayPort driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index d516b3910b51..dde3881efad8 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 
@@ -194,7 +195,7 @@ static int dw_dp_rockchip_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rockchip_dw_dp *dp;
 	struct resource *res;
-	int id;
+	int id, ret;
 
 	plat_data_const = device_get_match_data(dev);
 	if (!plat_data_const)
@@ -231,16 +232,21 @@ static int dw_dp_rockchip_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->vo_grf))
 		return PTR_ERR(dp->vo_grf);
 
+	plat_data->autosuspend_delay = 500;
 	plat_data->max_link_rate = plat_data_const->max_link_rate;
 	plat_data->pixel_mode = plat_data_const->pixel_mode;
 	plat_data->hpd_sw_sel = dw_dp_rockchip_hpd_sw_sel;
 	plat_data->hpd_sw_cfg = dw_dp_rockchip_hpd_sw_cfg;
 	plat_data->data = dp;
 
-	dp->base = dw_dp_probe(pdev, plat_data);
+	dp->base = dw_dp_alloc(pdev, plat_data);
 	if (IS_ERR(dp->base))
 		return PTR_ERR(dp->base);
 
+	ret = dw_dp_probe(dp->base);
+	if (ret)
+		return ret;
+
 	return component_add(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
@@ -249,6 +255,24 @@ static void dw_dp_rockchip_remove(struct platform_device *pdev)
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
+
+	return dw_dp_runtime_resume(dp->base);
+}
+
+static const struct dev_pm_ops dw_dp_pm_ops = {
+	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_resume, NULL)
+};
+
 static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {
 	.num_ctrls = 2,
 	.ctrl_ids = {0xfde50000, 0xfde60000},
@@ -283,5 +307,6 @@ struct platform_driver dw_dp_driver = {
 	.driver = {
 		.name = "dw-dp",
 		.of_match_table = dw_dp_of_match,
+		.pm = pm_ptr(&dw_dp_pm_ops),
 	},
 };

-- 
2.53.0

