Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795114877;
	b=pbJGLJJy37AskZgfFqr4AJa37/dpBwkvib5ihNDCKdPsXQ4ObqMv5SjgPEVxI7rkXpaT
	 8MW/aWdqgMUjlY2nd2UTMHXSHH29eZuEE85AN+3SpcHnxzbB3xnVXkBADe+lTLEHxXyzM
	 kcEc03lu6mSsQqw8z58vLseJKp9Ljk/wRZLptpFGBi2yjPLz4mSLbSUmnXiiw02+6pNtq
	 cZIUD4C7B72AGer0xtLyN2owEkvJiyBCKj9dXY7JI6yz6VX3napUCtSkZwLG8GKB3BVJo
	 KznnjTOGcaPpf9kcNWccv8rperxTwh3Dwi5yEdRgE2CbGfC/jCLgMMs3oogBd/MWexA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114877;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tTw2kFuvywgIUR4xINRvQyeh53+KN4qnrt55NrFhdow=;
	b=DwD17tGRu1oquKcPocRXCHK3ab6WbA8bgzxK5/X260oDGqTQcYP7gO/cXCVPHkVlyaOa
	 jUJ0+5h+bQSTBuLrNhp7JoNZkpha5uDKF3a2h2UAMDDObjFcK/TlqBp4BLqe+2RLReOwY
	 EUPSXb4NvPh7wyOlmAnrSDtf8s7iiHZJXiYXjaPJgBGumFSZK/0+xnnm6/elLr/2p+Unt
	 +RsYxG8m8nG40rSTK0T4MiEHjDwb8o8nbgWCNWOte7oLnOmCPZIBB63MbAZ5Nn1CXI/y5
	 qdEQVf4kJENFU+aiZiRLtMeg3GXYxPONgAuP23vETK8ZiiBh/6FhD1PjdiLYLMzsgbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJnsEKzT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99140606A332;
	Thu, 19 Nov 2026 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJnsEKzT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795114877;
	b=HzTR0zaAd8pqVm0hfpxcIqblupogJddEuk6pB2+mLwgQg024eZXGcBGi3wVCP/oEHOc9
	 Be0JWpVC0wourCy9FZHq2+rYKhud0rSkcwtqhNFtJcsgwph7w1IAzHqXh7yKORgcQy3qp
	 X5Y/2YIp4uLfmOH7D83uOZ2LiaUeY7pFv9ZPDdQE4ZPG4L+Msn8nHXHGq7bJ5oYux6IpE
	 mPvHuRUVIW02EiDHmaDz8Fda126yadsCtUgI9a+6J3lmH70tkYUE+etAAh9jOddm4pQOd
	 FeauRjIAz4iC6BmxOCL7Lno24sAVu+Y/pSQOsMbVQTSf9IgDUNnguPa7LKhaRFJpJVw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795114877;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tTw2kFuvywgIUR4xINRvQyeh53+KN4qnrt55NrFhdow=;
	b=BK5ekFzwWJwwJIyj45LnIWHFNtMLgfGQIp8K8NrGEbVlCSPXAEFsjAdzUuKZlK5Ijcgr
	 qz0Ss5JRtcwbmwUEfnHhSGRwOAcSJMbkurgqJCOS+dJolUZv9Jg/Zjkp21cm1fCZ0wHa+
	 NoZH8iiFPBK7RZZwf7d6ZBVPhoEnA5BNsZmTBVcO2Z4TdnnrP3X3VcP/uTf7F3ojS7Bql
	 adOJvGaSyiQ9ulNXndyexCnv+jLL4aXifqPr/dCQs1sWTdnTTdjZo4U2NffWwO44Y8rSR
	 sNCvZCUoRky5hwSiQpOox3Cr/twyGNcVfGGp80PZwpZ9rBW6AdneJmdNAMzDrn7wlsQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59D041F000C6;
	Thu, 19 Nov 2026 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795114877;
	bh=tTw2kFuvywgIUR4xINRvQyeh53+KN4qnrt55NrFhdow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AJnsEKzTAX3bf/AlANUJ1aKaaF2IAaCuVlKMRXRsWoQW7a8sSQwvzMS0h2SCJjcWF
	 RF9L/ABQeHmc99rAr2ciFOUqtfN7pQMRjUQL7aU501vH1bXhUhGkcOsH4g/edufyyB
	 HHHEaDu0nmj1Cq7GlgpkB6lPvzrLuB6cADVGKmE0DGKFLay+huqsXNi72mifMYurbA
	 dQjJs/h6PGs9NBBMZYGkIF1o3PxvBTEkjnr6ZaXM2KqlwvVpmZ2YaAEkl5IkVrDita
	 xuVpyymipi51/ifLNPj/OPGkV63lVhbR7ilYaVL53ATYqvRF9uvdFRPO9jUWwrYrh5
	 lc8RNulx6TwSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C92EE4B3E2;
	Thu, 19 Nov 2026 19:01:15 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Thu, 19 Nov 2026 20:01:13 +0100
Subject: [PATCH v2 2/3] dt-bindings: display: panel: Document Anapass
 ANA38407 DDIC
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-b4-ana38407-v2-2-bddc251bd43f@dxdmail.cc>
References: <20261119-b4-ana38407-v2-0-bddc251bd43f@dxdmail.cc>
In-Reply-To: <20261119-b4-ana38407-v2-0-bddc251bd43f@dxdmail.cc>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795114874; l=2686;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=Vc7GWKoAIzq9GzojXTrkIbSyMezk2qqPaz6Iw8WRLJ8=;
 b=xHnINgjLttYaOs9C8YL4X/4dczu+rpVXzgyplRavOTclyKCbFSR4u8pcDPtFnZuLx6XrNO13l
 8CP7GyZDOGLBs10uywhjJib4SmKsSxq1EcppmOOLvFaGHVKR5gNq7Yj
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

Document the Anapass ANA38407 DDIC and the Samsung AMSA10FA01 panel
found in the Samsung Galaxy Tab S9 Wi-Fi.

Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 .../bindings/display/panel/anapass,ana38407.yaml   | 68 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/anapass,ana38407.yaml b/Documentation/devicetree/bindings/display/panel/anapass,ana38407.yaml
new file mode 100644
index 000000000000..7811ea355026
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anapass,ana38407.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/anapass,ana38407.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anapass ANA38407 based MIPI-DSI panels
+
+maintainers:
+  - Nizat Mikayilli <nacht@dxdmail.cc>
+
+description:
+  The Anapass ANA38407 is a DSI panel controller used to drive AMOLED
+  panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - samsung,amsa10fa01
+      - const: anapass,ana38407
+
+  reg:
+    maxItems: 1
+
+  vci-supply:
+    description: Analog voltage rail
+
+  vddio-supply:
+    description: I/O voltage rail
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - vddio-supply
+  - reset-gpios
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
+            compatible = "samsung,amsa10fa01", "anapass,ana38407";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 125 GPIO_ACTIVE_LOW>;
+            vci-supply = <&panel_vci>;
+            vddio-supply = <&vreg_l12b_1p8>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e282fbb04e6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8228,6 +8228,11 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
 
+DRM DRIVER FOR ANAPASS ANA38407 PANELS
+M:	Nizat Mikayilli <nacht@dxdmail.cc>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/anapass,ana38407.yaml
+
 DRM DRIVER FOR APPLE TOUCH BARS
 M:	Aun-Ali Zaidi <admin@kodeit.net>
 M:	Aditya Garg <aditya.garg@linux.dev>

-- 
2.56.1


