Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC34192FC;
	Thu,  9 Jul 2026 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596720; cv=none; b=W1oxqsmSHcRuSCJo+Xdr4F/HrW7i6TG/GNdzIi+CLSD1TzsYM7hL4DC2wPothGqG+rKzjuEiRBOLfET9gf94dl1jcVszYZLT2xHAeJOU+caxin6biGD3YtMW/ezcJ9VvB7rzWGaKjPmykFGYFiTDuCEDv7taHQbx8okKx9seIcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596720; c=relaxed/simple;
	bh=dgSiMPi4AYj3N/GiA52EKPGuymrYrUeC48hkQYWmpzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bu0x9COLNZCYD0RVfHdSXJdfwSiaF4G14T2OOpab3gDDj5Q6YjKRqnlzi7mGB8InD9cwJ+DpVeWr3YNZcquyYNLf/o99JTa28grs/yMFsn9co7y6RtZl5TI5YfcRmrgZwD0tzOx/hqqVjstXlPymsr8sFWysM+peQznfDSIFrcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pu85P2Og; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pu85P2Og"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783596717;
	bh=dgSiMPi4AYj3N/GiA52EKPGuymrYrUeC48hkQYWmpzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pu85P2OgQsZzse2Z+jn/Jhp2XUhUkwrcLXirQIGqooNVjhZMW/cGUbgsROWlkN+ms
	 HQzdCXfnTIERJ98B0XF8QF5NRvp3jnaWVgNXBWFXHFpkRrnOWRk7L43G6N4r2+Kgjk
	 oT68NZAUTEedyg6SxyGdzLXJ6/JU5b/hhA3pmTnFlc3ZKsN95WzS8vuC/xHAN7DZy+
	 nOKEVioW+W1hLEg8O0JzoqmB+xhnn2ksLPKeyhrP9nctHp0Ba8vRQawGH245/ERYcs
	 IybomlvGI72C8L9witIfX7/SvLXJ8vKxf4DmuSeOlk7mRNu3poJclLqgwt1qSqRojn
	 L0CFdsATio1Yg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A80D17E0D53;
	Thu, 09 Jul 2026 13:31:56 +0200 (CEST)
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
Subject: [PATCH v4 03/12] drm/mediatek: mtk_dp: Call pm_runtime_put_sync() in removal path
Date: Thu,  9 Jul 2026 13:31:39 +0200
Message-ID: <20260709113148.49090-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since pm_runtime_put() queues an asynchronous suspend, calling
pm_runtime_disable() right after will cancel the pending suspend
work.

Call pm_runtime_put_sync() instead during mtk_dp_remove() to
overcome to this issue, making sure that the suspend ops execute
and that the hardware correctly powers off before module unload.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index f656b85b8421..0d0507890d99 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2866,7 +2866,7 @@ static void mtk_dp_remove(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp = platform_get_drvdata(pdev);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP)
 		timer_delete_sync(&mtk_dp->debounce_timer);
-- 
2.54.0

