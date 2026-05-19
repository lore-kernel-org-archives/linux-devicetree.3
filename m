Received: from out28-115.mail.aliyun.com (out28-115.mail.aliyun.com [115.124.28.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435A38AC79;
	Tue, 19 May 2026 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199116; cv=none; b=DESOEU61DAS3k38d1QTv476leM+jOaKiUCoDQH33Ss+CRNKH1v+tV7i6E1nabRH85Mc2G+bmH4l95tAs/w032NRCuoe7JArpJQczgJrwYPjNZMbbUgRE//vQKxtArIzntlGApsHLFJl3SRVf5hWbDJvp//azu/iaEgV8dRFBybw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199116; c=relaxed/simple;
	bh=FwZilHJvlu5BcKUF1QM9XkgeYWA0R8eDrcBtZ+1ty8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ft6tGkIfRg8pJafrsx9bixDqP27MPqN9v1aHl49pSyn66Q84ECzJJO7POpRjLEY8Hyb6SE4vR8biMcfFIXTu1cwyaMxGpJG1wAmhR874pZAwtcKXBhFDiEgqYBGyAQWQdvrgAYIAffv+faiSk3IhPK8K75tWCRNvp6BwORACTkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=LBwnIKrZ; arc=none smtp.client-ip=115.124.28.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="LBwnIKrZ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1779199103; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=eVZn7MAONGMHowrlbF8Q4henpwp8Ya3lVGmR/icgdNU=;
	b=LBwnIKrZx7joCtYEeLPv1qZZavAADk618AuAx54IUkDUKLFM62hz7iFy7LgF8RM4Js4Qh38YtamLGH5w7bjxjXJ6YSoO70T/5EJb9oMmq18YQMZ5E2Qg54U58WoN8tZJsToyGMEFzGRAukf9FD4ISKXZhweeF5Lxxg0eGIezb2MiINi2/R+qBZ3nOdaZarlMccDNrFkIrcSZl/Cr6rt24D6hMPzVGoN9Dx1rI/kIAqW3wMDvW4Q71INmrricod0VyLO1HPxZZQ3Ki2wkJEhgM4WPbhSHk4YBqHj0RkqeYr6OYyJi3TGFdsDzumDiGRC8ihmeoPssbN/EWT+iYiBIjg==
X-Alimail-AntiSpam:AC=SUSPECT;BC=0.0855436|-1;BR=01201311R191ec;CH=blue;DM=|CONTINUE|false|;DS=SPAM|spam_ad|0.867174-0.00121929-0.131607;FP=12538500737862165938|10|2|17|0|-1|-1|-1;HT=maildocker-contentspam033068005250;MF=syyang@lontium.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.hbB8zIT_1779199100;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hbB8zIT_1779199100 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 19 May 2026 21:58:21 +0800
From: syyang@lontium.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	maarten.lankhorst@linux.intel.com,
	rfoss@kernel.org,
	mripard@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	tzimmermann@suse.de,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	xmzhu@lontium.corp-partner.google.com,
	xmzhu@lontium.com,
	rlyu@lontium.com,
	xbpeng@lontium.com,
	qdchen@lontium.com,
	llzhang@lontium.com,
	Sunyun Yang <syyang@lontium.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/2] dt-bindings: bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
Date: Tue, 19 May 2026 21:58:15 +0800
Message-Id: <20260519135816.26996-2-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519135816.26996-1-syyang@lontium.com>
References: <20260519135816.26996-1-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunyun Yang <syyang@lontium.com>

This commit adds the device tree binding schema for the Lontium LT7911EXC.
This device is an I2C-controlled bridge that converts eDP 1.4 input to MIPI
DSI output.

Signed-off-by: Sunyun Yang <syyang@lontium.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../display/bridge/lontium,lt7911exc.yaml     | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
new file mode 100644
index 000000000000..3290b10ce883
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt7911exc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT7911EXC eDP to MIPI DSI Bridge
+
+maintainers:
+  - Sunyun Yang <syyang@lontium.com>
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt7911exc
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to RST_ pin.
+
+  vdd-supply:
+    description: Regulator for 1.2V MIPI phy power.
+
+  vcc-supply:
+    description: Regulator for 3.3V IO power.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for eDP input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for MIPI DSI output.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - vcc-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mipi-bridge@41 {
+            compatible = "lontium,lt7911exc";
+            reg = <0x41>;
+            reset-gpios = <&gpy8 8 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&lt7911exc_1v2>;
+            vcc-supply = <&lt7911exc_3v3>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    bridge_in: endpoint {
+                        remote-endpoint = <&edp_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    bridge_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

