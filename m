Received: from out198-21.us.a.mail.aliyun.com (out198-21.us.a.mail.aliyun.com [47.90.198.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D6C27FD49;
	Wed,  6 May 2026 01:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778032079; cv=none; b=cA3qjhJc4x94fWeq0xS9tGzrqS2+EtY3OPeGqlbJkeX9f/DNOJ/NqJSdOYblR24+EOiE1FpNHeoLL5VhLPdJEeRL/jkTBqkJKIuwhsGKmWWhz1XSL3Wz9nK4fDRKv0UkT6ACB2hqE/IsGnX1FjDkNl8LRQQ/jI2gXz+spNfCP8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778032079; c=relaxed/simple;
	bh=p0urNjm41sZeAN6q7Acv0PPrW6hXjInS+UEK+XxkjEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NKOWYhPsa7dHAdmtthU6OYORpNSdpYZqRfruK4y6l+qSlzlMj0X26r6Sz5GjtkaPgasmtR72e7HSq6Xr6WXP3UyhGLk3kEyYQHAyfYM7NVj9WfBPKIvFxxCVeEWodF9l/EMT7AAxTbaW7M3LoAcR/Tdi9HBCQtDdl8xeXSG05jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=V4dmwTtt; arc=none smtp.client-ip=47.90.198.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="V4dmwTtt"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778032064; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=po4JbBzlVnZWMf/PF4TZcy9SSjh11o50cvR1wsP/N14=;
	b=V4dmwTtt0oN1F9o9dsUpvtMLJyrDQ9GdcSumgwp4W4JG/+ujHwVuQlyZYQ8bVFEHK5N8A66lFS8PEag6GRS64hQ72Ql09Yyd3uXOXVNUoJ/7KF6zIhTtpmu06mMYWh+9E5J4AijdkKILijijcYQNKDDuqNTL8lMtjFMEMNyN3ACJHA9q1YFAQA0X+M0zXkxHOP1+eruU0VhVIySgCzI32FplxND+SooAPyR8T5b3QxxdSUBDi1ioMbJDjYn46M23sA/obFBEuEDF8mobZvi/awcHvt32WowKtM/KKHvZyRrmkhFTp812kEipfrlAvTdzvd8zwcG52Rw3+ouUuMeyBQ==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.09618295|-1;BR=01201311R661ec;CH=green;DM=|CONTINUE|false|;DS=SPAM|spam_ad|0.867174-0.00121929-0.131607;FP=12538499638350538034|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045220102;MF=syyang@lontium.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.hQNamk6_1778031116;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hQNamk6_1778031116 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 06 May 2026 09:31:59 +0800
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
	Sunyun Yang <syyang@lontium.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
Date: Wed,  6 May 2026 09:31:52 +0800
Message-Id: <20260506013153.2240-2-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506013153.2240-1-syyang@lontium.com>
References: <20260506013153.2240-1-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunyun Yang <syyang@lontium.com>

The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
and output signal/dual port mipi dsi.

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

