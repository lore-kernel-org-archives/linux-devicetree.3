Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E54A2E36;
	Wed,  1 Jul 2026 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908433; cv=none; b=Sx7xwIYMeJ6WC3wzNIu/Y0eFVveLiqoxaL+bDFL6+gIkEdH7gYBbT28997obM62tdZAgNiB5meSgfki4K3ZJj2X481tGUtxI9Jf2Wn7wP5b1PyzQT2JXBB48ecLA0srduNeyHJPpj4Xw2t3MJ/MlzHmTIN5JY/oZnekzHEAfAQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908433; c=relaxed/simple;
	bh=1ituvx4NOXspaaiMu1RL1FikTCV/DEZyG6ZgJ0WQA3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8nIHV4AjrdibOqETa4s3nJs92DfrEDH1BiU9caPOFOVOmOA95FqogCey8k75OI2rfV4l6/JiuGsBAPLzBS8D4szGiUQJxtMxuq6vc9f4VF7OrmGfvtpMDlJP0Kq5CJdiKbT+wMx6V2kOOAdfYmDo64avLyUANNoy9BQWJHdrE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QqlnROMS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QqlnROMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908430;
	bh=1ituvx4NOXspaaiMu1RL1FikTCV/DEZyG6ZgJ0WQA3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QqlnROMSQPSdPvOMDGGXkzg5jsP8ix9VdIkepYU0Z6Oqr3oIXXfnz1/3Okflr82o4
	 hXNDcLIBovRSlUDWFxmQxsk2r4NwRfXEb771RDGlUv7oV3z8YMwRxn4+fYgxHSqVwW
	 98Xv1+4NdCnRl/IoakD/Za7EzxvH4uBZ+Y/3MDNGyVYc8rR62rmGct3C95015VHM0n
	 A0d5cCfFOAcc+vozZFeta7W1CuXZgydbjUSuuWgcTlQXZCs74N26Fl1ht2+hzHD+iy
	 rCXPyjblGwR08bHOL0oN0o6Jqn6AFVeFGHIbDKpyVJ98zZ8MpJSNxCegd6WsZ9B1T6
	 oKc1W3KsCzjOg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9A1F17E0F44;
	Wed,  1 Jul 2026 14:20:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 03/11] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
Date: Wed,  1 Jul 2026 14:20:16 +0200
Message-ID: <20260701122024.19557-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During probe, this driver is registering two platform devices: one
for the HDMI Codec driver and one for the DisplayPort PHY driver.

In the probe function, none of the error cases are unregistering
any of the two platform devices and this may cause registration
of multiple instances of those in case this driver returns one or
more probe deferral(s) in the "wrong" spots.

In order to fix this, add devm actions to unregister those and
remove the manual calls to platform_device_unregister in the
mtk_dp_remove() function, as those would otherwise be redundant.

Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayPort aux-bus")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index eefbc7e0f9c8..2c738c16dafa 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2670,6 +2670,13 @@ static const struct hdmi_codec_ops mtk_dp_audio_codec_ops = {
 	.hook_plugged_cb = mtk_dp_audio_hook_plugged_cb,
 };
 
+static void mtk_dp_unregister_pdevs(void *data)
+{
+	struct platform_device *ext_pdev = data;
+
+	platform_device_unregister(ext_pdev);
+}
+
 static int mtk_dp_register_audio_driver(struct device *dev)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
@@ -2680,18 +2687,29 @@ static int mtk_dp_register_audio_driver(struct device *dev)
 		.data = mtk_dp,
 		.no_capture_mute = 1,
 	};
+	int ret;
 
 	mtk_dp->audio_pdev = platform_device_register_data(dev,
 							   HDMI_CODEC_DRV_NAME,
 							   PLATFORM_DEVID_AUTO,
 							   &codec_data,
 							   sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
+	if (IS_ERR(mtk_dp->audio_pdev))
+		return PTR_ERR(mtk_dp->audio_pdev);
+
+	ret = devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->phy_dev);
+	if (ret) {
+		platform_device_unregister(mtk_dp->audio_pdev);
+		return dev_err_probe(dev, ret,
+				     "Failed to add codec unregister devm action");
+	}
+	return 0;
 }
 
 static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 {
 	struct device *dev = mtk_dp->dev;
+	int ret;
 
 	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
 							PLATFORM_DEVID_AUTO,
@@ -2701,6 +2719,13 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
 				     "Failed to create device mediatek-dp-phy\n");
 
+	ret = devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->phy_dev);
+	if (ret) {
+		platform_device_unregister(mtk_dp->phy_dev);
+		return dev_err_probe(dev, ret,
+				     "Failed to add phy unregister devm action");
+	}
+
 	mtk_dp_get_calibration_data(mtk_dp);
 
 	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
@@ -2870,9 +2895,6 @@ static void mtk_dp_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP)
 		timer_delete_sync(&mtk_dp->debounce_timer);
-	platform_device_unregister(mtk_dp->phy_dev);
-	if (mtk_dp->audio_pdev)
-		platform_device_unregister(mtk_dp->audio_pdev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.54.0

