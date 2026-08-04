Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DA7423E9F
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829190; cv=none; b=P/mbAiF0Zv8yrN9HFAmK14GXnuVV3dipCkK2N1lm2Lu/ZKHpDvXegMKr7tbaNJk2hwPY1v9wCcU+Ml1hFKzfYNMKhd5k2gWComl+y9Ckaz/O31y0nFVNqRtISkWSXNHXbxLgANuIvySOdMi9H3oiWTskPLuz+KK8g+BMADPW304=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829190; c=relaxed/simple;
	bh=g/sKPj+DwuN9kUfEp41jOdEPpHaIoqSd61n1vxX//90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ffk/jtyK7HpFGQLAzWggAosg+BrwkHK4/y7VMO9sbo8zGUWdK0MurzOLNRDG/mgTbAT8j6P8aI8dUaaVqdxkSidI7hhhZRizJNvhJoNvPSQHkrhBtmjCFMq/05zKxUAMw8goGaadkiFhYbAd7Am7byfHNK3jQeeEymxbaKwJn1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VGm8sWce; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VGm8sWce"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785829175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksSHwp132uHGThlbNgyf5HwZ9dfAc/nnIU5yUnzrGXE=;
	b=VGm8sWcezOHtrmBvxwDqFpBGsoMqiO4+Mqt/W0Jtv6PRRDp2INtlvbABC2lOnkoC5g1506
	7mdV9bFo32SLB9E2ZpgimLv7PfgRlGhSRomdGNWOkZoaHtiYkpEOAv1BOwXmTZxaNL57d2
	8eUYBC2olD7cHAfrs0UsgqxXmdjTaKo=
From: Junjie Cao <junjie.cao@linux.dev>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	mitltlatltl@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add Novatek NT36532
Date: Tue,  4 Aug 2026 00:39:20 -0700
Message-ID: <20260804073920.85191-1-junjie.cao@linux.dev>
In-Reply-To: <20260804073419.84727-1-junjie.cao@linux.dev>
References: <20260804073419.84727-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

NT36532 is a driver IC used to drive MIPI-DSI panels. It is found
in OnePlus Pad 2 tablets with CSOT panels.

Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../display/panel/novatek,nt36532.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
new file mode 100644
index 000000000000..c1ab793dd718
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36532.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36532 based DSI display Panels
+
+maintainers:
+  - Junjie Cao <junjie.cao@linux.dev>
+
+description: |
+  The NT36532 IC from Novatek is a Driver IC used to drive MIPI-DSI panels.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - csot,ppc100hb1-1
+      - const: novatek,nt36532
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA
+
+  vddio-supply:
+    description: regulator that supplies the I/O voltage
+
+  ports: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - reset-gpios
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "csot,ppc100hb1-1", "novatek,nt36532";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&vreg_l12b_1p8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.43.0

