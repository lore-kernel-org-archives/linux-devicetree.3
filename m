Received: from mail-m32106.qiye.163.com (mail-m32106.qiye.163.com [220.197.32.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E381319B5B1;
	Tue,  7 Jul 2026 04:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783398170; cv=none; b=GcoTnENNpjBFp/Soo0ZIH0IwcJD50lHRpQ2jDyzAVX4OU4rTbU3yw1WDi6ZI1LplO7JxZcUrG0ZKCDdiIVTnRLorw0fj3pQMPSqHzwYV9u2gguvX9F0PdNsNVB1hoDeaQkhJjRZ8HrVLA1LFjRkG3HCCYVtxCHzUwDxKHZr53Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783398170; c=relaxed/simple;
	bh=GIAdeH8wm9WTSGRXHgKCuMTsRPgcIZ40zkZ7olu6cjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AnFHBkWp3djXA5lucje/JhqxztuBvRa8BsY5nAV0PLV2fpp0iUkSj+BpPf/SK0vxHNJdtgMlIolceU3bT0wpYagVCBF7lnpzYS33VD0ecnGShFAUkXS577V+h/7gz0//Bn7XWEkdbYFLJJqwcwPSFSsZR2wjOXyqiUaXJlM2LM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=gtZy8sc/; arc=none smtp.client-ip=220.197.32.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="gtZy8sc/"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 452ef582f;
	Tue, 7 Jul 2026 12:07:17 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/5] dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpoint
Date: Tue,  7 Jul 2026 12:06:09 +0800
Message-Id: <20260707040613.1992841-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707040613.1992841-1-damon.ding@rock-chips.com>
References: <20260707040613.1992841-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f3ac243f903a8kunme8126cdf5bc65
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGklDVkgYTk1NTUofSR1CSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=gtZy8sc/CcIj6t/A5SakZ1J/mTu9QtdnO6YE/WgWpip3PUEwkVJsqwBw34aYYU8JAoT0yy2J5wPH+bO2M38OnphV2dcYvQEG+/ewMXmfHxpoDQ11e3mK83orYsJEX8dIe77OQOcx+yYnOVu6BnOJvgQPPpSHxe74ODkhig+hHuA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
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

