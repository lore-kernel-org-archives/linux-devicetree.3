Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210803CCFB4;
	Tue, 14 Jul 2026 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029529; cv=none; b=udITrzCuNE7+E0exg4CLThXGD0jCm4xPbqYlAmqI7KQT+gzSH/c8WfqSJoDxKuOz1XD05aFnYBC5Qsg/xtd/FMELbCsrD5sXESsIuSNDa7qeyHs1or36v0JRydrHVttTT+3mOcyTdI4rbx7BkrKg6XL7cx/ROxkx/U1focFJbGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029529; c=relaxed/simple;
	bh=U8wbtuZ0GvoDAp1lslwGMJcS1iFdvCK1ZvJJYPJhSSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NeieRuPuh4K1Vu5YjOvunZM92TK3TM0gT52TqgP26rJjJiCDVexix27C/9jf3PW/f65SqG5cwFa75hharsWWQfJw/L9xmb1Tynq3NOC9HB75I/ZHh7G5fEBd7mrrMs2R2VaAYmsaqsOCrIslT+x7ZykTqp30e2RS8HdWh7NzddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ji+nNJTZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ji+nNJTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029525;
	bh=U8wbtuZ0GvoDAp1lslwGMJcS1iFdvCK1ZvJJYPJhSSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ji+nNJTZWXvTWQSbmF2AkkMNLjNj4HlM0dqQhdeKNaTl0lpgyN0G1BkXgQk2bsDmH
	 Bl9N8uWO/ErEIaGuBWu6DZc5PxKczFNaRKywqywgUYyOnulAfWCcFvDLeNagBAlEup
	 WwR3dxqm2UXiOwvBCc4X/7w6r+KVd6x9XIfXTHMuB2nQN0z/IsUfp2h8E0VfJkAQyy
	 4F/nAqdk8roWDfXKyVml7MexM0d821S00smLpvKi1sdQM+TVpK84fL5ymYjfoZJwms
	 Y5XUmz6SKirNS1LUTMzuR68+LlUNsBBN4BWGRABlcux4p9Jc9DGOk6H3qPG3fNoggO
	 Cvlv+XndG0YMQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C931217E0B89;
	Tue, 14 Jul 2026 13:45:24 +0200 (CEST)
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
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 41/46] soc: mediatek: mtk-mmsys: Populate multimedia subsystem subdevices
Date: Tue, 14 Jul 2026 13:44:09 +0200
Message-ID: <20260714114414.184512-42-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The multimedia hardware subsystem contains all of the multimedia
related sub-devices, and that really is by hardware design, not
anything software related.

In order to allow specifying a correct description of the hardware
in devicetrees, add support for probing subdevices of multimedia
controllers, specified as subnodes.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index f501a29a7697..6c02b898741c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
@@ -489,6 +490,13 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return PTR_ERR(clks);
 	mmsys->clks_pdev = clks;
 
+	ret = devm_of_platform_populate(dev);
+	if (ret) {
+		dev_err(dev, "Failed to populate child devices: %d\n", ret);
+		platform_device_unregister(clks);
+		return ret;
+	}
+
 	if (mmsys->data->is_vppsys)
 		goto out_probe_done;
 
-- 
2.54.0

