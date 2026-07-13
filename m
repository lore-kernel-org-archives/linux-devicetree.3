Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E1438007;
	Mon, 13 Jul 2026 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783952885; cv=none; b=V+7/qafJs3hNVc4FNBLjkalJ4d0joVEMwdmOAPqjFJ1WS7J/+NhqsB69sTWxmFOKhyODu+Nh0/BH4PJkRq16Jd1r5MhIWBx9GZz2OIMiDATyGdHHjvV9NabEQpIyHHXM1qjbzxAU1dyH0uw07tkbGTdAVQcG2TamTs4kSi5BPbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783952885; c=relaxed/simple;
	bh=tL6TyKHmRqiOdYNp5OoOuzXNWh3Gfm4maiiOQlsWErI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nY6JSEyONnfrpkSl+3DxU9eMYGQF3Ce6Js/ns5L8D6yCshzCxbA6V289eBy/13r4SwOBZJpdB3oSlDky9DP3cOQMsc66+t2lyzYL9talbL9zEi6H0Taue8K8dD7NuwFf9QN2PlLyFpplfdauj1zaLcW2ODfzPl1T8JyPvdhkhuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iH+K1zN7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iH+K1zN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783952882;
	bh=tL6TyKHmRqiOdYNp5OoOuzXNWh3Gfm4maiiOQlsWErI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iH+K1zN7qE8DKbgNEoG9bFma87EyjUY8Gt2+MZGPZr8dS0e0Y3gMdIC3l5rcjkvl/
	 zy5LrMeb7rSSWHVllxu3alg7mUC7TY7LS2Dfa/cLdaGn+hzP+9BqY+Z8WdPHKqS/qC
	 mGDhw72RDwFywNA501Oa6+wwGyAUQh9On+7uySf3pPcDs/kTw4LZ5lFWpxvfJhVN4L
	 XD7zDXxuxyXKNHAzVb2Al210ABFbvf6AoQZnB50CnlBqMEyGFp1HlBqD8K6pFXNxfU
	 gQAijlJitE4kkmNZSc3UnBf3u2irC2A2xtrth+uS6fMSjp+RYPrzLKjh4phK4Gi42A
	 BoAs2BlZDwbWw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D27C917E0720;
	Mon, 13 Jul 2026 16:28:01 +0200 (CEST)
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
Subject: [PATCH v4 08/10] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Date: Mon, 13 Jul 2026 16:27:44 +0200
Message-ID: <20260713142746.40259-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
References: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
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
index 93bc507d77e2..1726f5a2683c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1731,6 +1731,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
-- 
2.54.0

