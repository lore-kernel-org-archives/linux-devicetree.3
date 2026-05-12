Received: from mail-m49225.qiye.163.com (mail-m49225.qiye.163.com [45.254.49.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9AE4C6F10;
	Tue, 12 May 2026 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580135; cv=none; b=ckk6fb7NU0IrxrWAySOWPPgk8kDHkJBIPI7djCsUdGealIkyKxrfqR2YjQ6npTlEdUUmNYoto+hFTC+jYTKmTLGcD+bi0L39l7KBqwJytsZ1t6OvobsCB2AyENDsIZuNbhNu7MdEinuuipafUFKBY29SQBiRc3vjYS8xhlyE+E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580135; c=relaxed/simple;
	bh=Ag+8igEwO+FSzZ6NOs7fIIS/GRFyia8E9F8yANMYI8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nMDqu97qQN7LHpEsaQUeoAk/b3dtAQwTvjmCJkJ0qg89LWhJWj1wZHEUdCmgQXpl9NE0H3QjwS+4B9PCZKaKlxvVen1Hhb61qx0qKA/d5CLJ6B/Qat3vlZ2PR59ZNfSeOs/S/rtbhADdCp4KR4BXUAkrWWVsmOa4F9dO9HueyNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=K+3nL3XW; arc=none smtp.client-ip=45.254.49.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="K+3nL3XW"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e1830305;
	Tue, 12 May 2026 17:56:51 +0800 (GMT+08:00)
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
Subject: [PATCH v4 02/10] dt-bindings: display: rockchip: analogix-dp: Add per-clock descriptions
Date: Tue, 12 May 2026 17:56:36 +0800
Message-Id: <20260512095644.1946084-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512095644.1946084-1-damon.ding@rock-chips.com>
References: <20260512095644.1946084-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e1b9e2cdc03a3kunm05d2ddd6129038
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTB1LVkpOQk4aTUtMSE4dHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=K+3nL3XW2POmmcUJ5vdRALsdx9hq84cPmwZinUo+zLTAC5ZqUm3H71c9rFkSw+w4CNEfHGADH2P9ml69EdLbN7cooayhXT7VAS+Dg60o10ReK8R/4QPHedYvlDEu88GSsKAh0dpoCvSWYbuSyhj1WL1B3NmvI4m6uT+7ddAMu6E=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=g6TnEj69MTc0WgItceMOUMSjBJQFQm6ryXhi0BKwYoM=;
	h=date:mime-version:subject:message-id:from;

Supplement dedicated description for each clock in the clocks
property, clarifying the function of each clock input for the
Analogix DP controller binding.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Modify the commit msg.
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

