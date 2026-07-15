Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D08644B68E;
	Wed, 15 Jul 2026 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116175; cv=none; b=CqEyUguBXitUZgSmPq7swid6+vp+5YKRJCcmKJ0gquFrlEQtOSltICAj8fTzJ4/q5lEseH/Evu/J3vYkEEV4F6iBM0ci520wx3XJ6xRN9p7nb/RSP2b3YmHRgy04+ZkTLHDhIH9G/7ClsT6Xm4V5vHMU95PJxBN/GvCX0SiG9NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116175; c=relaxed/simple;
	bh=8PBnueuBT6jwz1nO5Ycv+65fEIKpNJ2+KGYPkC4+P8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/tS+YTRPqdW7eWEUaOyusp4jeDtMjUcJk3ARKUbl9FjE7Z4R/ipU/X1CHlDNlmigAbllYdXAtC2R34e8WDudOMFK5jHJzvS9SB2trrGo+hzgSTeZC5vS4Sf414HhILIxsYDx3pQ8ZeqLYGkW4tdV/HKlGq73w7EFAGMKtPWdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kSGFzSEv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kSGFzSEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784116171;
	bh=8PBnueuBT6jwz1nO5Ycv+65fEIKpNJ2+KGYPkC4+P8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kSGFzSEvgZwYM/kyBHJictGBvX5F62HfU3vEDw4uVqE/6lBCeB7Js+5WxzmWcv0Uj
	 Maazr/dmdChKePCFNsakmx3TX0bjqClp2zPH/Q+WbJ9l6JTU3OJfTwAbSURGFkh8Ea
	 Gcst9acwA2ggdEGdTAJmQZn5S2Z8pPTFJBp8pk4C2R+AfdV25Aw03Dv92EZBA93OVf
	 BW9/6hkgPUL/vzjomfi89ep5l0Bny2hHsKU7igwEHPsAK11nQp6slBHyto5kF45vva
	 IjN7pjyLY/v1vn4g52xg9+AdHPSfvEBCiyLbd8PVO4qt6CwhfVK2Q5u4TutUUYXwBK
	 Ei6ZrlffynNIg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E0AB717E0DFB;
	Wed, 15 Jul 2026 13:49:30 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v5 04/11] drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
Date: Wed, 15 Jul 2026 13:49:09 +0200
Message-ID: <20260715114916.19690-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When binding the dsi component, the .bind() callback initializes
the encoder, and then will optionally trigger resets.

Should that last operation fail, binding will as well fail but
the encoder is never removed from the DRM encoder list and if
the driver gets removed afterwards, this may crash the kernel
because of an use-after-free condition.

In order to avoid that, cleanup the encoder upon reset failure.

Fixes: 605c83753d97 ("drm/mediatek: mtk_dsi: Reset the dsi0 hardware")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 8ab5c3431dbb..e3d7338c35e3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1090,7 +1090,13 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	return device_reset_optional(dev);
+	ret = device_reset_optional(dev);
+	if (ret) {
+		drm_encoder_cleanup(&dsi->encoder);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void mtk_dsi_unbind(struct device *dev, struct device *master,
-- 
2.54.0

