Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0965E357A25;
	Wed, 15 Jul 2026 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123834; cv=none; b=MoI+xaIyVmz/z1OMXojY4ziH7ZUmUEvA2QNmcmrvEgBSX+Z6ku0X7LgTT0SnLVeDCeSMZ6F79/eeMeGT1MXMJwbnPxxIQ9/fDnNO5+hY3gI93nnB4Uoe8BtaMIGzxIJzYHOEf9HfcCPzGYW9D6yM+4QaKcK2C18/Rx66Y6RqVQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123834; c=relaxed/simple;
	bh=8PBnueuBT6jwz1nO5Ycv+65fEIKpNJ2+KGYPkC4+P8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTUISTsjUMuONLC48VWH9o0hYFj1UOKg7g9xkH+/gf9cwiplg8Lwk3oJaGbCCy4Ir5SiEYGl/2nz4U8mJjwqj6j8emBKHotENzh1DRCt7+j5xPb8KYaOEb7qGW1jwiksv5tDHAlHeH8kYsLT87iOcMKvADLwLSop4Azc1H60z3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AG6crVkl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AG6crVkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784123831;
	bh=8PBnueuBT6jwz1nO5Ycv+65fEIKpNJ2+KGYPkC4+P8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AG6crVklKLA9pS3xdMs67YIyS1JXJFECwdTMzwg6778EiSgjuhZZXDB4ivkPOoxJd
	 ol0tAiWfwlLNAXbHMY0fiWVeOOa9PXJQ6TNnko3UaA9XfoIWRKR0BNCl4kvzdLasdT
	 zytWKioYb2lCk6+AAmrsghCo6BBOBiVrt/B2r5BgUndicv5hHvaT5CUqYFWe+z/Rin
	 sChND1f70D+hLHUqktBcMkSO8vT5JHHmUKmBtszkcOdT11FoOrp2Bc4wPCTUffHvjM
	 qOgBm678797a4ajRIyUwLEKnkhaZetPxt2Xme4MzIm1gMwOMCNxoTa+aVni+TV7svG
	 aG4lkbyFU7PUg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACF8E17E0E4C;
	Wed, 15 Jul 2026 15:57:10 +0200 (CEST)
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
Subject: [PATCH v6 04/11] drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
Date: Wed, 15 Jul 2026 15:56:56 +0200
Message-ID: <20260715135703.46540-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
References: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
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

