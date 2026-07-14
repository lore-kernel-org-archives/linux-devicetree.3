Received: from out28-93.mail.aliyun.com (out28-93.mail.aliyun.com [115.124.28.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651B120ADF8;
	Tue, 14 Jul 2026 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027734; cv=none; b=q9JM+6PGTt/wfDCj4ZD2qAslvSg91yo1bgbIxHqVzRXS/FCkTyWRvQORtKhsj1mZVVK2uhOLtCeyUPw/oTGdQLYn71fs8gCrO/t7WyxU5FyfTQnIpOlVRlSdycArgThF5fgAeprFrvMoer4GaRiuGy1NEOC2e2D0NPNEdDDqL1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027734; c=relaxed/simple;
	bh=9O5Xzh1c0+Aw3GvLxfYPqHy445IgC9DGFwRE5DrXz4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oK3HVcZOoRFB3eU8iFYeiih+J4z94Kqdh6n/W8AkbbvrvEu8QGTYM9datLL3WX+jabrYdvPmbktJwxN2+ASX9Rt18BA/qli3+z4GwYF0++CcCMm6cwviGKeOnk0Su8c8vLeQ3ji6WaU75Ay3x2OeZvZk41Qpg2pH8T+QUAbhym0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=pPpehO4b; arc=none smtp.client-ip=115.124.28.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="pPpehO4b"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1784027723; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=K00io+MKxH1CZBpwH8+XpMZEpdq5IjEcNFRMXJ/soPo=;
	b=pPpehO4bGR/gVmt/XDNqhxuueFTAmRf1+wwarkDxmKNCSpNCmNTVBLaAjGuZLnXJhxjVxrpC2wLYr31c40uzR9eu6ZAOviOFvjlwBG7GRjNiPkZjnZQ5VnSeu22BAW3X4veM1hk5xvYDNw4bsKWWOKbzzf81KxduY/tQiPUlwyuY86RETV9860XMgaFkdyjPKdcNYvCtr2dcDZTtQd5Y5Uoc0SwTQzNqpPXQT2oA9y+9SWIlEKqY5bPidBWZyDj4l6iYaRkEzO8ZJUg/Wroq69OF1dLoJ5wiwlTjgjZgZ14g6qkDtdqMcTkyV4TC4F/RNUINzXKDLFMFTWw/PcjlDg==
X-Alimail-AntiSpam:AC=SUSPECT;BC=0.08401342|-1;BR=01201311R781ec;CH=blue;DM=|CONTINUE|false|;DS=SPAM|spam_ad|0.864217-0.00116855-0.134614;FP=12538500737878943026|11|2|18|0|-1|-1|-1;HT=maildocker-contentspam033045213054;MF=syyang@lontium.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.iL2321x_1784026712;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.iL2321x_1784026712 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 14 Jul 2026 18:58:33 +0800
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
	hfxia@lontium.com,
	Sunyun Yang <syyang@lontium.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v16 1/2] dt-bindings: bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
Date: Tue, 14 Jul 2026 18:58:27 +0800
Message-Id: <20260714105828.2763677-2-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714105828.2763677-1-syyang@lontium.com>
References: <20260714105828.2763677-1-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
index 000000000..d664641be
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
+        bridge@41 {
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

