Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C98E4921BF;
	Wed,  1 Jul 2026 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908405; cv=none; b=BJZXQJ+bij4EqDSDF7chZH/aOvR8G2zjmr/8XzLaej4s0Lb23uf8BqLrvdvDzHBDUxyF9p5CFXkXZtYZmq+3uBuLRZzOi5utpfGh6WM64ljW4RfLo7J3B23jOn5Qy3X9SwErButHz0Ejraj+PzE0BTfppoGE8zOD5Se3PxsQBzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908405; c=relaxed/simple;
	bh=lCnTkuoLSs95jOyae1GDu2ZIdMgN7tYB2OyAcBoBEuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIm4S8SB8LLI/Nrvk+hogJsho/CHHNp+EBqXibOd/xz+q2raPk+Onz74PDPV+7OETAIoXzdAMTnk78CU9LxArspl/ymIT+gagh4ZHaJdgWVbQB33ANlJD+HjooUW/gfzaHZTElcBCraadnBxR/6LWMxMfPeOlm8gGR45IUQTKoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XTFeuDcO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XTFeuDcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908402;
	bh=lCnTkuoLSs95jOyae1GDu2ZIdMgN7tYB2OyAcBoBEuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XTFeuDcOQ5PyvS30crabtfSq7Onx49w/CsiJ+4bJXf1bmT4vurdo6zZSzGIr4BcIl
	 K0Z6UVpr5uMiQxfGjxDvfoVLE1h2IU3u8SzyD9wg/gUXuH4HGvqDN2i4SCvfOgVWDt
	 uaDYp35gj99Q8Fxu101yVw53njRScbwqFt3sy5SYzHv8yPyaBNTUPYep6P0qmQcI45
	 5ZN9SdSk+cjYbuYj0ddQ38qrOQ4q7BQwJBUPJlEDiHlFrTK3pKHtziioXdJDYj2VNG
	 gTVdwKvO06/4EiELbpom1frv8qP1q/XQTJB86rJI3Fd2vTep695sFKfudD/S5czdbA
	 tp6L2EqjqBe2g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED04517E0CF4;
	Wed,  1 Jul 2026 14:20:01 +0200 (CEST)
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
Subject: [PATCH 08/10] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Date: Wed,  1 Jul 2026 14:19:48 +0200
Message-ID: <20260701121950.19454-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
References: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PM Runtime at the end of mtk_dsi_probe() so that the
mediatek-drm mtk_ddp_comp_power_on() function is able to do
pm_runtime_resume_and_get() and, analogously, the function
mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
device.

This makes sure that the power domains for the DSI IP are
turned on and off when necessary.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index fc6f846208d6..9e4e4152090e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1677,6 +1677,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.54.0

