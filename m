Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B903E211A09;
	Tue,  7 Apr 2026 20:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775593879; cv=none; b=WB6IkrdVymREQ9Ci+VnAhju+0WnPrp8aH0p6Db+zgVQ/vALcbPGotuGKprbV7vHfohN879NvGaWctxM2ok5XIDGJ6SK3Wf5LZm5DCTfiKbS0zCbkAj27MaTGsJkTWkkZ8v3DOt7rSTMM7rm6jFADqKDP2cslwkIkw7tZwZ/iAE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775593879; c=relaxed/simple;
	bh=sY/qAjfheVSKS7GOkyQE2R6aPeXn6dVjldPyq7zwbuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/8WB40uCZlnzzdCwufkoMQs9rDALJopOF7phRyq7Jtx3uJKJiTgecMvvVdbkGW2TF0h1o42I9KHcSOBChDiLgeI6Udx4cMVPobdwtMTW0Plp9IaBXqwTSZIaLejT+qxrbhjmQ7qmfgo3nO89inENWbrsLsoDDWCiN6OpZqZlO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=C6sH8Sez; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="C6sH8Sez"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 346E7112920;
	Tue,  7 Apr 2026 22:31:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775593874; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RwGojZZwnPB2Qi4y3PwNB23w143mIOosJ80bqFOX4q0=;
	b=C6sH8Sezf8+VVX/nZXFiQqwE+EV5Jx1DBy8rNBAfos48AlzzTuAvGW5E/NGn8Spi/KVMSv
	Uap9qGtMgQu2pmHdALKKDyHbCb/eZS43D/HY1Z1QcjVUFayATR6PVxHwRSjl0oW5mgydU+
	y+PvZ6dcD3AHUGiN7PtmnixXkpy1XEXfUMrTpVDDMDiY3iya8fUysrUT+lnQPI17ox1NxU
	wdhKaNqjJCnJ+/1vx8xJCXDT/VmRh6P/uWMDg60L0ik9GWUMWSjKzojrPeurQ831JU/AwN
	atuBVz6LrMnl0QDmCyZkz3zrYh3jEAR0MURiXSvJ29XRoDbXyUdyadIwNe75lA==
From: Marek Vasut <marex@nabladev.com>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: display: bridge: lt9211: Require data-lanes on DSI input ports
Date: Tue,  7 Apr 2026 22:31:03 +0200
Message-ID: <20260407203109.34302-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The Lontium LT9211 is capable of 1..4 DSI lanes per input DSI port,
describe the lane count for each input port in the schema.

For example Linux kernel driver does already use that information and
fails to probe if it is missing.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
V2: - Update commit message, indicate Linux already requires data-lanes property
    - Add required: data-lanes
---
 .../display/bridge/lontium,lt9211.yaml        | 43 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
index 9a6e9b25d14a9..7cfe92a8bcd72 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
@@ -36,18 +36,56 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           Primary MIPI DSI port-1 for MIPI input or
           LVDS port-1 for LVDS input or DPI input.
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+            required:
+              - data-lanes
+
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           Additional MIPI port-2 for MIPI input or LVDS port-2
           for LVDS input. Used in combination with primary
           port-1 to drive higher resolution displays
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+            required:
+              - data-lanes
+
       port@2:
         $ref: /schemas/graph.yaml#/properties/port
         description:
@@ -99,6 +137,7 @@ examples:
             reg = <0>;
 
             endpoint {
+              data-lanes = <1 2 3 4>;
               remote-endpoint = <&dsi0_out>;
             };
           };
-- 
2.53.0

