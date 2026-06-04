Received: from mail-m32104.qiye.163.com (mail-m32104.qiye.163.com [220.197.32.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9B3F6C48;
	Thu,  4 Jun 2026 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563518; cv=none; b=JpSl63BrWu3bIWrVHn8PDKNC+JS+tZDWIXxxJNGg5UH8llmL4b9jJV7/l/BPR1v00A1Is3wHY1YOqjR1YU40kWWxiusWRyYr3qoGI1Q8t+uw+FEj6Mx1CqnsPxYrmXw+4LX6wTUYqptvAazICKqNga7KkwukJ3r6ZoojWYG7q8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563518; c=relaxed/simple;
	bh=GIAdeH8wm9WTSGRXHgKCuMTsRPgcIZ40zkZ7olu6cjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uDtc8wdVpMfUzsioI274d4WkSGC46YxHxLgOuJ1RgB49ueNNSDkNrN3EwosHqjF/ZSruH7v2RZVsYH975Sv0+nt7rbJkINxh5wTfjit6Srvry5V1dKtcO4WF91QT27YK6DOPvOVBKmzAFToOJip7ZzB+BiKEIcY6NmVrCDsPWU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=GF8lR1sA; arc=none smtp.client-ip=220.197.32.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="GF8lR1sA"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 410f6c9cf;
	Thu, 4 Jun 2026 16:53:15 +0800 (GMT+08:00)
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
	Damon Ding <damon.ding@rock-chips.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/4] dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpoint
Date: Thu,  4 Jun 2026 16:52:17 +0800
Message-Id: <20260604085220.2862986-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604085220.2862986-1-damon.ding@rock-chips.com>
References: <20260604085220.2862986-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e91d6358203a8kunm52a01cd04098ec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGB1CVktNQh9LSx5LHh8YQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=GF8lR1sAeaW3nR5F2c+Jj+S+6Xc7eQANpNg/ZoyrH3+wenSo/oqCAOIjbMdV/kVVEUod7R3lbW/x8vPbSIWCDPNgHcewKaz5XoFROewWQAyYIA+kfPJXmt+1L0tWO/7XNEU+5QUmoQ8+cY6InwWqtSoUWNTmbFFUIcYoDYb7hQU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=b+nSKBFe+y1XdWvizakdBtzYyTbwGeDxxK3jwOpDtv0=;
	h=date:mime-version:subject:message-id:from;

Add data-lanes property support to the port@1 endpoint for physical
lane mapping configuration.

Lane mapping is mainly used for below scenarios:
1. Correct PCB lane swap and differential line routing crossover
   without hardware changes;
2. Adapt mismatched lane pin definitions between SoC and eDP panel;
3. Support multiple panel hardware variants on the same board
   by configuring data-lanes in device tree only.

Additionally, add data-lanes setting in Rockchip eDP DT node example
to show actual lane mapping usage.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Add lane mapping application scenarios in commit message.
- Remove redundant deprecated property 'data-lanes' for eDP node.
- Update port@1 $ref to /schemas/graph.yaml#/$defs/port-base.

Changes in v3:
- Squash data-lanes adjustment of Rockchip eDP DT example into this
  commit.
- Add unevaluatedProperties: false to both the port@1 and endpoint
  nodes.

Changes in v5
- Add Acked-by and Reviewed-by tags.
---
 .../bindings/display/bridge/analogix,dp.yaml  | 19 ++++++++++++++-----
 .../rockchip/rockchip,analogix-dp.yaml        |  1 +
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
index 62f0521b0924..ecf206871cdd 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
@@ -42,13 +42,22 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description:
-          Input node to receive pixel data.
+        description: Input node to receive pixel data.
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          Port node with one endpoint connected to a dp-connector node.
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
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
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 6548f157fd96..39dafe75a680 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -160,6 +160,7 @@ examples:
           reg = <1>;
 
           edp_out_panel: endpoint {
+            data-lanes = <0 1>;
             remote-endpoint = <&panel_in_edp>;
           };
         };
-- 
2.34.1

