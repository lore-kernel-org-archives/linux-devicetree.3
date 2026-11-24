Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535662;
	b=N0UUmE332aFQnuc4IONeTkOUqwoMtGfFvB9j2CRFt3hjo8l3H7B7KDNI64FXeU6l+cgv
	 na6XX6j9fqHYm+4qpefQqf1Z4AIrqgNqVeJJCZiBOdOPh1MKLtoStrplGaavS51fE5Uhw
	 Fc4K6ONp+MGmATz5zCQ0v5JIAzTVYBQbylybMljoeEaGlnzzUnGRHZY41Gjmi3RYNiP9N
	 rbBsJ6EAHoD+Rmw3vSdZnnGzYNpAZBJXU/iZWaXujAhY3X+Jv4XSFokKEY9ULBSc3Amf7
	 jA7yXE0vZjWr3IeU6MmM/1/riG5xL3F+zDutlBrevbPodOPGiuas9Vogf9nxK220PYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535662;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=5CJANeA2ON+YlQW2j7eJ1/GHr+S6g6Lga9FVar8L/40=;
	b=eUXHUKMyWJWZTdexUPyxXRYTq8hcyZF0a83/DAg0fD4e4nB20x1eYJR8H6EaLLuRjPkg
	 8w5WmBE0pta0SmX7q849qE3ZrAzViNBNrwDd9heYLhHNDYttLA27/+wtwlmiDTGNzej/N
	 p4Qd+2Xh+J2RdnBKEgy5uHbzNL1tzP9zvczGKvSefMnWGOhVyaI4cdT2DTlO1gr3TjguP
	 hMYEYiVywj+tUrdy2ihJHJ4swzarU1YK/nTACIBTeuwebqf/BUU9ctv0rv8jx+sFIHGTT
	 oULNQ40YP4PssnQHCZjoeotMC1MX5TmJcJG9tZl1NV6GOXso1BU2WfEZ0kIazGZBXyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qWX2bgYw;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F2606A321;
	Tue, 24 Nov 2026 15:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qWX2bgYw
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155420euoutp02ed0ecbaab92d1c1cf87102c5dc34c838~rBit0TbQu0431004310euoutp02Z;
	Tue, 24 Nov 2026 15:54:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124155420euoutp02ed0ecbaab92d1c1cf87102c5dc34c838~rBit0TbQu0431004310euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535660;
	bh=5CJANeA2ON+YlQW2j7eJ1/GHr+S6g6Lga9FVar8L/40=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=qWX2bgYw2t+0Nqlg6Vnkcux4xnPMv/lYfTLNK3NDN0nKRYZAYMh78BetiPcK7yBtd
	 hn4o5g4rX5zGF+HKrY1RDJEde5mrGzrMr6ga4x8FLAtNk93UoiacMPRQTAgpcel30f
	 3RkeLXaBY+eIcIBs5opNjLEQPpwwp/EhNqQ1lOfU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6~rBithxDoI0891008910eucas1p1X;
	Tue, 24 Nov 2026 15:54:19 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155418eusmtip1a63961ed3150b3c24dc76d254ccce2ed~rBir2paU90146501465eusmtip1e;
	Tue, 24 Nov 2026 15:54:17 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:47 +0100
Subject: [PATCH v8 11/18] drm/bridge: inno-hdmi: Make the PHY configuration
 table optional
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-jh7110-clean-send-v8-11-de92635dd857@samsung.com>
In-Reply-To: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>,  Byron Stanoszek <gandalf@winds.org>,
	Owen O'Hehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3000;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=/L2+KcjssdSwNg9HKRbt0chlmto0vxPs1WCA0fQ47cM=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhZVZo7bGTuncVHhR/bFtvafl5zyFOyb4h4p/r/st
	pzQwb6fHaUsDGIcDLJiiixnN0YbSf5jeFp+/PEvmDmsTCBDGLg4BWAiU1Yy/Pe5MnWd77MT5Yuy
	wuK2OCf2R7FIyIbMOlWTeqHoPT97VgQjQ/PbjrUTjuUe9lpaffSn4Rah5K/ncpZ7+dhtfprLfvS
	AJSsA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6
X-EPHeader: CA
X-CMS-RootMailID: 20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6@eucas1p1.samsung.com>

The pre-emphasis and drive-strength values in inno_hdmi_phy_config, and
the registers they are written to, belong to the PHY integrated into the
controller. A platform whose PHY is a separate device has neither, and
its own .mode_valid already validates the pixel clock against the real
PHY, so the table only bounds the generic check.

Let such a platform omit the table: skip the table-driven pre-emphasis
and drive-strength writes in the power-up path and the table lookup in
.mode_valid when it is absent. Platforms that supply one are unaffected.

Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 0932ec47f151b531f63e7c42c715a6ae7fe252fd..19cea14d142667f7f4534db8fbcf7806f2f37943 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -533,8 +533,14 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 			       unsigned long mpixelclock)
 {
 	struct inno_hdmi_phy_config *phy_config;
-	int ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
+	int ret;
+
+	inno_hdmi_sys_power(hdmi, false);
+
+	if (!hdmi->plat_data->phy_configs)
+		goto out;
 
+	ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
 	if (ret < 0) {
 		phy_config = hdmi->plat_data->default_phy_config;
 		DRM_DEV_ERROR(hdmi->dev,
@@ -544,8 +550,6 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 		phy_config = &hdmi->plat_data->phy_configs[ret];
 	}
 
-	inno_hdmi_sys_power(hdmi, false);
-
 	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, phy_config->pre_emphasis);
 	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, phy_config->voltage_level_control);
 	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
@@ -555,6 +559,7 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
 	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
 
+out:
 	inno_hdmi_sys_power(hdmi, true);
 };
 
@@ -831,7 +836,8 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 	if (mpixelclk < HDMI_TMDS_CHAR_RATE_MIN_HZ)
 		return MODE_CLOCK_LOW;
 
-	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
+	if (hdmi->plat_data->phy_configs &&
+	    inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
 		return MODE_CLOCK_HIGH;
 
 	if (plat_ops && plat_ops->mode_valid) {
@@ -1108,11 +1114,6 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 	int irq;
 	int ret;
 
-	if (!plat_data->phy_configs || !plat_data->default_phy_config) {
-		dev_err(dev, "Missing platform PHY ops\n");
-		return ERR_PTR(-ENODEV);
-	}
-
 	hdmi = devm_drm_bridge_alloc(dev, struct inno_hdmi, bridge, &inno_hdmi_bridge_funcs);
 	if (IS_ERR(hdmi))
 		return ERR_CAST(hdmi);

-- 
2.34.1

