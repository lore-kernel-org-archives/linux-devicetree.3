Received: from out198-18.us.a.mail.aliyun.com (out198-18.us.a.mail.aliyun.com [47.90.198.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCE923393F;
	Tue, 19 May 2026 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187849; cv=none; b=pui9A1sT8eHRFeym/xjuUydG1u75IiT2d/N0+VIgqt5hIccYwZgjcojy0ensLINKBoz1np44cKADfZd8nMVax8ZI3y8uTkFFv7igd/OSdBbGxBKvre3b5Wz2+mReIdwx7CzOVjG9V2QdrSNEsujCz/B14tEEY069ioeN8J4zSg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187849; c=relaxed/simple;
	bh=FwZilHJvlu5BcKUF1QM9XkgeYWA0R8eDrcBtZ+1ty8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kRZDAOlOc1kfOuDX+LVhFU6h0I6t/fizovD3VoEBwtnMtDjTEXFFY811dZhcJFFuzi6U3dnKtulNOa+re+DOT7u42rYKTiqfNZsgF/251oZoz6c9UDQdMeIoYxg/8Zj8OJVMWbtPZrzCS+qq2RTaYJOqCDIMdjMBteeFmfLd6Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=obJ+KhI0; arc=none smtp.client-ip=47.90.198.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="obJ+KhI0"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1779187827; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=eVZn7MAONGMHowrlbF8Q4henpwp8Ya3lVGmR/icgdNU=;
	b=obJ+KhI04r6BXv801feKjAGuI7ak0BKPXMaym57GRyxvY0yc2k3+I3/euyysOFtbCLAlPF+DVL0p0VdwSnhgzI8+ldZSPQHefQLrnlrsO0A/NU1HkoAFquSzQ0M6LcpYHxVPPQC2oJKijIsU+VMx/EZyO5GiPeb+vkUy/XaHWucScYhz7SOsz19gzH/L/zMTOJXHubs9uTolYRYxOiVuOy9EAJySmxrHOU8sZGL6WpsqYJpOVNYtENAeL2qmjgr8itaYz7dIfj7R+MDxGPYSQf+rbcYjaNdO1apj/Psr9z5yw41FLxErjhljgEZTDloq48t5x6ll7JXvDjJF6D9Ygw==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08633456|-1;BR=01201311R851ec;CH=green;DM=|CONTINUE|false|;DS=SPAM|spam_ad|0.867174-0.00121929-0.131607;FP=12538500737878943026|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=syyang@lontium.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.hb62lBI_1779187824;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hb62lBI_1779187824 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 19 May 2026 18:50:25 +0800
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
	Sunyun Yang <syyang@lontium.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/2] dt-bindings: bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
Date: Tue, 19 May 2026 18:50:18 +0800
Message-Id: <20260519105019.22622-2-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519105019.22622-1-syyang@lontium.com>
References: <20260519105019.22622-1-syyang@lontium.com>
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

