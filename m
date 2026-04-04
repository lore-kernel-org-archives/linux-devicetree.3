Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690CF3246EB;
	Sat,  4 Apr 2026 03:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775274092; cv=none; b=ccgCnE9pMhYkbBgQ5h2PePJ+FPtrGsFzt9FILVcPfrSAsJcwbmamHZI8Jyx7QEZg8LmQvIXfPqFt4+pYdCcjW2JwPHFYlqn+aSAL4GtGVky2E4A6SvrwnDP5dWwPir2A2X8/+1X4MK3FmdMaoDWjFAPZzOEjg34K/5RpjbOdCC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775274092; c=relaxed/simple;
	bh=q++nQVep0JbuGC13ierZL9G8PIDJwvhIiVuaFhHHv8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITvwF7MFW8vacbf1WVPBNQaIENemRSDbhULcgn4ImHPOCv5UnxUC4nQBB8Z6xfhRL3JpofG9rLD5VRdtw4kXa+ywDvXsqUIiHwQm8Q4IK401dOTYsrUzJscaVf0d6Z+UcaKxXwRCMKAJ7ibYhLtA2ypCzJxjN5Gnfx2oBv/rFWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=EEToSnKe; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="EEToSnKe"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E699112C1D;
	Sat,  4 Apr 2026 05:41:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775274088; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ApgxGQ153IAfgJWC/bMyIf2DW/ZJRfgpNGeMYExnZEE=;
	b=EEToSnKeWDrAtLrTk/ulw4nZTqY+G8oP2hUaEgq50oYXnXijFe8nIlzb+aeQa05ZHoPDiD
	TZtOmxkB5Udt/8u52CxGCoYdCz+DDgvpGf6q16zVIsZR8fmq3SN/CSLoFmL7KD1zbFYiuz
	AW/Xt6TyHQL5J1Zx0o4kekQx8A6g9u+T7RgQc0+4qoT95wykDS9M4pVb6IcaayvfiFfFGd
	5t2qXKWG5D0DrXjw8pFo0IghpJNsyXbsxexXDjQnlmYvtN9WaZ6eezAfDs5sMmawMIhdHk
	Q26+UqM+Ug2CcCAXGLBNzAmEJWiOB1FbGCqz/XT6D7rRB2i3eVn/9cHUDr+Wmw==
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
Subject: [PATCH] dt-bindings: display: bridge: lt9211: Require data-lanes on DSI input ports
Date: Sat,  4 Apr 2026 05:40:18 +0200
Message-ID: <20260404034123.340818-1-marex@nabladev.com>
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
NOTE: For example Linux kernel driver does already use that information
      and fails to probe if it is missing. There are currently no intree
      users for this binding, so no new warnings will be generated once
      this is applied, but a new user is about to be added.
---
 .../display/bridge/lontium,lt9211.yaml        | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
index 9a6e9b25d14a9..5264fb2b68b78 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
@@ -36,18 +36,50 @@ properties:
 
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
       port@2:
         $ref: /schemas/graph.yaml#/properties/port
         description:
@@ -99,6 +131,7 @@ examples:
             reg = <0>;
 
             endpoint {
+              data-lanes = <1 2 3 4>;
               remote-endpoint = <&dsi0_out>;
             };
           };
-- 
2.53.0

