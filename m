Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECC14071D2;
	Thu,  9 Jul 2026 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593280; cv=none; b=Wh+QVi2V32TwTIIhQymGbREUHMp1DltfKR6zDGFKQYPadeWwF//RBv6UTLDecqdthfDjwxRP5F8TOYnCfnoYW/Hknb4DDDQXgLet8A7joZzJXa+1u2hoA7yANVmTj+I8d9JtSloFkmMuTWBZHZd1nXZ3+uzVVQ/+OAV+PTiCw48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593280; c=relaxed/simple;
	bh=g3NFv/k1bhmvy3mt7HV2c3qJ0TtBnuA23r95Ywj2Yqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLNSMJTMUNVuBOrQYe0DhmvU7b/fN9wg8MnXkWAlMabv8DnLp7YCMKue61F8/8UeVXWgwTiJotiVDwXvxexToA8xslkWxzcXlEYB00Hp6PC8bxfxvopza55WYNmC4ZTc6gAz1zm+k08VgHaRIx1wPvKSEgXO3OVJ08+TjBV6Pug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZHBUf3P8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZHBUf3P8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783593278;
	bh=g3NFv/k1bhmvy3mt7HV2c3qJ0TtBnuA23r95Ywj2Yqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZHBUf3P8g1Mm3j1yWaPhbdKA0EFBKAw6f/yo49Qa6AvisFaFcTvbCE68BOHjFminq
	 VCPMb3OAd/iMauOW43+52q6YC4sBeQ8nVOf8XikeNuTSj4+rtfttXXFF//cm8b5cqw
	 Hqf5I4WSjok8GxCFHYIBj14KL2/jAALVC9mef/P3kdx2WdNfF5EZstxY0Z2ipbKS81
	 sfUZGnpAvXMiq14pgfrYxycAi04eBxMG5Caco6apHpCr0j1MB1+nXOuV+88jzLMY2l
	 O+PNvtNuw26r+SI3cxpn4Po0OfpI2WzzNifNOapsstOinzvE6EopxQQqrDgHTkOJ18
	 udAxN8mAvoymw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 12A4717E05D3;
	Thu, 09 Jul 2026 12:34:37 +0200 (CEST)
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
Subject: [PATCH v3 03/11] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
Date: Thu,  9 Jul 2026 12:34:23 +0200
Message-ID: <20260709103431.46616-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
References: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
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
 drivers/gpu/drm/mediatek/mtk_dp.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index f656b85b8421..12400383fbb2 100644
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
@@ -2680,18 +2687,28 @@ static int mtk_dp_register_audio_driver(struct device *dev)
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
+	ret = devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->audio_pdev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to add codec unregister devm action");
+
+	return 0;
 }
 
 static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 {
 	struct device *dev = mtk_dp->dev;
+	int ret;
 
 	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
 							PLATFORM_DEVID_AUTO,
@@ -2701,6 +2718,11 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
 				     "Failed to create device mediatek-dp-phy\n");
 
+	ret = devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->phy_dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to add phy unregister devm action");
+
 	mtk_dp_get_calibration_data(mtk_dp);
 
 	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
@@ -2870,9 +2892,6 @@ static void mtk_dp_remove(struct platform_device *pdev)
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

