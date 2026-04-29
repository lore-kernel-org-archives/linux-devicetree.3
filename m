Received: from out198-22.us.a.mail.aliyun.com (out198-22.us.a.mail.aliyun.com [47.90.198.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA030336EF8;
	Wed, 29 Apr 2026 04:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435882; cv=none; b=ahtnwwGgBo3ogek2enSQqyJhLRIvGQghnIY3r3HaKF8uUuSEc5NpnMWODXzFI5P/HmDhiP/DdFu118/SX1So7XOcWPFp7UVSDSJqhWo9TUFlOSZr8yGbJzZFq7H0hR3645mWBNRsRoZ5qwbLmmQPn5+dW1SeXm6biBPTlrrsmCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435882; c=relaxed/simple;
	bh=/bZXwUNgvMDgqCPzD8kNpCeQqVayHYu5T+1Mc6pxWz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cPdjDJGeHRlRqjfptTdN/Ai7xIaiD1JZv/SgRffta7NlQnsLIdhjbmD+ZVDPQ81oBLZHxfEiH8volSsydFOO2xY6AyA+zT0PsJfAFh/rYOtxh2C/FtcBd80n7rT8AwJfNGegOShg8YxsXz41CiiEgolWbo1xTZW2MQCWxrslZ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=WYqm2nGL; arc=none smtp.client-ip=47.90.198.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="WYqm2nGL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1777435869; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=LznwDmo8lURTRzj9CF7qq+sRSbzkNdWUrUNKawWQh3Q=;
	b=WYqm2nGLcdM3iRLXw5XmsSydai/awueDXbR31KCZ82HZHyGpJ3Iu+NcND0xTmywYrpVsY14LgbTXPQzluPAsgCsHpAfrzMFI8Q2kLNI5RN/iTv03q+zgOAEEwx8GGDAU8P1QgvOIXQz4vKXS+DeeML0sMcVsXTNO1G/+JgaB5H2Ly9twYlPz1QBN8q1JjoLvgGLXREhqOvpE9Wym8nT8FGeo1nb4QkER9zCYPV7/E41x3w/2XZCK9R8D8YScp99tAtGP8FOWiAgvOeWQoUWk/eH1vfuGAP0KQiauBJxykClorpPQvQdEUVjehESmO0c/qE558a8IblbTPgurCoJI4w==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08680541|-1;BR=01201311R121ec;CH=green;DM=|CONTINUE|false|;DS=SPAM|spam_ad|0.867174-0.00121929-0.131607;FP=12538500737866364210|10|2|17|0|-1|-1|-1;HT=maildocker-contentspam033068016216;MF=syyang@lontium.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.hMViCjO_1777435546;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hMViCjO_1777435546 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 12:05:48 +0800
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
	yangsunyun1993@gmail.com,
	xmzhu@lontium.corp-partner.google.com,
	xmzhu@lontium.com,
	rlyu@lontium.com,
	xbpeng@lontium.com,
	Sunyun Yang <syyang@lontium.com>
Subject: [PATCH v3 1/2] dt-bindings:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge
Date: Wed, 29 Apr 2026 12:05:40 +0800
Message-Id: <20260429040541.3404116-2-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429040541.3404116-1-syyang@lontium.com>
References: <20260429040541.3404116-1-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunyun Yang <syyang@lontium.com>

The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
and output signal/dual port mipi.

Signed-off-by: Sunyun Yang <syyang@lontium.com>
---
 .../display/bridge/lontium,lt7911exc.yaml     | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
new file mode 100644
index 000000000000..0525133443ca
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
+        description: Video port for MIPI DSI output.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for eDP input.
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

