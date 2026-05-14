Received: from mail-m15571.qiye.163.com (mail-m15571.qiye.163.com [101.71.155.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC51F3D7D69;
	Thu, 14 May 2026 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742432; cv=none; b=XM6TF0/LIDx16bsEsoZf8bOVTwhAQomcYdeiwD65LG1MTv3g4BoICgLUm/jcekl9VZuhzWDJOdYJtPOpQGYgN5/Mc+iNhZtZ/Y4IiDk2nlSoBR1gFMMKuy2r2vkABChibJnoIFXMllDcjehLX0LGN3viW8NJyvzXgMfv+2TgeMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742432; c=relaxed/simple;
	bh=FsQJwH6Q252ZJYU4o2l1hQojYCQR26K036eOx+zG3Ho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ChFbScPxDdrIyeggq/9NBXXcD3jzdwdS7m6zpzqREZw8ggb0Tm9T1exkhtpYhdwbZYKzjAvuYCoTAOQfa6WjYMu30oborHlN0Kg9I690EnZU7hgtI+EOFXC/JeYYygN60+ACNnHF7SMP4BVPAF8opkJ+VMyqtUA9gJhLm8REmZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=NrU0CC/V; arc=none smtp.client-ip=101.71.155.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="NrU0CC/V"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e617edd3;
	Thu, 14 May 2026 15:01:41 +0800 (GMT+08:00)
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
Subject: [PATCH v1 2/3] dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpoint
Date: Thu, 14 May 2026 15:01:32 +0800
Message-Id: <20260514070133.2275069-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514070133.2275069-1-damon.ding@rock-chips.com>
References: <20260514070133.2275069-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e254a841903a3kunm8191ae6fc25ff
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQxpKVkIYH0IaQk4aTEIYS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=NrU0CC/VAcnfiQm/EUehxDAsCdt2Jl8H3ccTe19ujkKotcY14TrCEGnc7MAFSqzYiJH0SrQ+VxRHn7iClwYsWjJlsugAYnh49xi35wYEnfpn4pYdK0kaOFGeQVXFxjEiXz0oMpJFFEO2KQyNji30oFMhLVfbueiUtYoDB9Su/b0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dC8FUSJBCxLbTISYLGihAR7+rreBTAJQQ7RRG/jJYok=;
	h=date:mime-version:subject:message-id:from;

Add data-lanes property support to the port@1 endpoint for physical
lane mapping configuration.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../bindings/display/bridge/analogix,dp.yaml  | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
index 62f0521b0924..a82f9b7776c0 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
@@ -36,19 +36,35 @@ properties:
       Hotplug detect GPIO.
       Indicates which GPIO should be used for hotplug detection
 
+  data-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    deprecated: true
+    minItems: 1
+    maxItems: 4
+    items:
+      maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description:
-          Input node to receive pixel data.
+        description: Input node to receive pixel data.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
-        description:
-          Port node with one endpoint connected to a dp-connector node.
+        description: Port node with one endpoint connected to sink device node.
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  enum: [ 0, 1, 2, 3 ]
 
     required:
       - port@0
-- 
2.34.1

