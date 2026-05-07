Received: from mail-m32114.qiye.163.com (mail-m32114.qiye.163.com [220.197.32.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F722311C2F;
	Thu,  7 May 2026 11:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153411; cv=none; b=fCh8PnNJaJktDGdJ+Uy9cw3FgCfUQRkDZJBDU5dMzgl3PsHPKDvejlT6yN1C24aw+UcSz0+CnBDpcJK4JCod5BLmxbBxcgNwZA4Soif9hzG3xATvoTHG7zgxHCG3brbtBoIE9U+EpsVy6+KUUzqT4OF+YUXYIKLe4edFMWFmsks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153411; c=relaxed/simple;
	bh=5wLGSoKqqy6dOK6gE+cLJ6lfk7J+bhdsHcn5CYkPC58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G7trMj86SSndeDXngjZa4QyPdDh7FeEix1Kaa8FYpxvYf0WQSjv05iAxI+us/3pTBfHv4CG0GfsnjtBZgEhxYw6Dk8p/+vyjIhaYKyugh+xZlEaSOxjAMOvN8N9FUgX08+CB0r0k4/6Xpp1jkB+4P3ifS8mxlBuZcXAO1GkLoyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=L1zfI8ak; arc=none smtp.client-ip=220.197.32.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="L1zfI8ak"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7b63a3b;
	Thu, 7 May 2026 19:29:57 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 02/10] dt-bindings: display: rockchip: analogix-dp: Add descriptions for clocks
Date: Thu,  7 May 2026 19:29:40 +0800
Message-Id: <20260507112948.1115003-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507112948.1115003-1-damon.ding@rock-chips.com>
References: <20260507112948.1115003-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e02339b5c03a3kunm4d1cbcd72698
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUNLVkNMTEhLSEweGExMT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=L1zfI8akAB34lMldFIE3/Mo6XdJxj05JxGEeLlXteZhNJBQqCwuoQzQA+aN0hxkq+q+42DYrrztGlC2gA8qvXYegv/pexCkYLB420nlV4o+k8N90M7EyTsheirLTG5hfbTSC9++krJI7FKO8zWNMhCbahxBAQuwpXfM0w7tZ7t0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=w818RurETCJS+GlpNeVFl+AKbJrzyGMsmZ6uPaaY+NI=;
	h=date:mime-version:subject:message-id:from;

Add detailed description for each clock entry in the device tree
binding.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index d2bc8636b626..0651853a7a5d 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -19,7 +19,10 @@ properties:
 
   clocks:
     minItems: 2
-    maxItems: 3
+    items:
+      - description: Reference clock
+      - description: APB bus clock
+      - description: GRF or AHB bus clock
 
   clock-names:
     minItems: 2
-- 
2.34.1

