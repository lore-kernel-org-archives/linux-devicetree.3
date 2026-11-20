Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174868;
	b=H+Q/WNCWQ3Bx7MiWzmHLvn6D/YMpWZMCx2xUy9kRVskIiHUDzUmRY9Pc0g4Ll2ch+MFF
	 6WVn1X2H/3b3/sXRX+XvwCeAxTEOwQ5hD0UQosenLBaUiDqyrwR6d8evzcG6Vbi9j7JNR
	 fOH5sfRjNNZ1cSxXVLJBJyM7KGH7dbSJr/nuSKgdhZMrZcehGQu01s0D3jQyuO+XopuC6
	 AM7mfwK+wjzrqfHLJKB0/Pne971mKz828sYzFCTsyP0adM7JCSiS0tmD5vB0sKPrB4P9P
	 UwFo3cvlfH8QCMsyRMuO5R+il+7QMxtdhucBmFJPlO6crmkdwGzNCUMRURalZsv9VSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=N+qZJp3IOLR8W+jXWOKTm3fVJRlvPeQHbpUSJTeUQL8=;
	b=l/+ILZIkBwdXC/Y2aOeg+2D+DFWD/eipkJqCZyl5zPwD2hHLPh2RHobX989TKgMd8Apw
	 ytGibZ22Yhn99ffWdtQdPn8L5WCVx0xUwc966dfRrEYJ2BgC8E4C/w7Ksc4oxlO5hTet1
	 nhMZjAZ7aeBiU56PeqVWXFBHGCfmHIKV0FYRGFMywvF5hrLJ2aZVDAu59kllvrI4Ydg9q
	 3wkdpfqgaJGHQzNEiA7dY/jih2GACq4uoM8uPyds5DYNbP0mhj4zB1JPxMxZPcjRIwhxz
	 Q9K43XDDME+kwHK3BIvt1Z4JuXOZx6jpgzGYlJKce3rX7mB2Y4knv+BW7xwbgPQZrGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isPgHmkH;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B7D606A332
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B7D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isPgHmkH
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb61185057so5480695e9.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174866; x=1795779666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+qZJp3IOLR8W+jXWOKTm3fVJRlvPeQHbpUSJTeUQL8=;
        b=isPgHmkHV9iIYt+n7ShKmBawSwEeRIaHOEnivt4vsy8h1bDt1sj4FlWf3hTPlSsP05
         vdaul1NIZAYpm1OXH1yBtHJx6n+2R5iNAa+VgFgqspJcCGIYeY9dNg78FCUBMUgen6xi
         oAK5f0EnOVnuEZ08WHKLwBFf8X2+nry8/3Hg53LsjgKV8ZXoMidErWSS5AY9torwZdCF
         DUkn4mTHKRKTBwpmAFqLusqW4m0GNIqft/7jzBdlYRln8O+d6ze/dqOcwpypU/O7oKBT
         LZnBRAimH5ChiPKK7BLnIe0heEKK8Og0SoWRcKroAGjFYva1y7as1weBDcCfOBK0XBhi
         6sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174866; x=1795779666;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+qZJp3IOLR8W+jXWOKTm3fVJRlvPeQHbpUSJTeUQL8=;
        b=OsgtEaZmHHM0fVXPOiVuRhByG1zw4feEB0WU2t3s+vFP0XQBHERKnUU0xX/yF+CgRR
         5jYf/a3XTsWkUnOalECNQRF/8csYW1uFQCxKTQJyCRiK8/z3IZc9MuO7Yn7CtLOPAdCq
         Re1Y/Va6hX1SoGI/ztz97aesAnLfMxxr1dB/2jg+Cv5QB9uAdgw4gfYSMmcoAi/bPyjt
         pGISlyauEMa9RK7JplNT5zNVyJ5PSrQCsSv7IEYseSf4hz9q2bqL+kk1N0QjkCMXTzZg
         egjEBfZqzcusQ8imEdDAQ7VG0ZBEPsBd5q4oboXV5ks4UXjhF8eGK8WN9tdxHLxKVQB6
         Ngzw==
X-Forwarded-Encrypted: i=1; AL+hErHhf5inXs6u4uy3S83CdqSowgGoEK9ZMViT0orYKv5n98yrzC+5ZnJVOZtE6ESNf+tHqxyUO5ZUTJ8g@vger.kernel.org
X-Gm-Message-State: APuU4Z/qpDAj1ZZ5o3wvFw5/hPDcqZCqvAfHGByhwzNK1VzKjJTYPPAd
	85lPdvze/nQut1rsEN9FtDOPkEyyu5yWe+Zd/370mQDctIsVGcR5nAVP
X-Gm-Gg: AYBFou006vdlWVEyGy9mspMo+w1nSkqjmlTceBkdqfNI+crAw0sJHBZWF7TRCKw7br1
	GJvE9tqAzJe6i/bL/oLMU4WkpbjgWYFSD+zBvN257aT/n3VCae07VmQA72gQlYY9BzHSjhtwsaX
	egC6uGSIEXrpwTELr5nxPPPDR6Irh5IfBr5ZqK5Zy0/GlOBEVP7PUFP3nULWFNUhUZgTxu8rJ5I
	dZiHRnYpL6Ci+7UHchR2LQsrW3TU4C+EnJuu2acPUO0sgDSGnYbaSH8Nqqyoa5xrMmcaE60M66d
	Tx3loILyXwMGpdAxS6eN8xbae5mNAzePXcwX68hANoN7lRTYgItXIhgOtBr/swOuZfhPsofxbga
	TVlbVNG+JUiHC2HkWks/i1mwrXRPow4+f0Roo1ZQ6huRmXd9hMdqWJzw/uvVvY106uMI4+qjA5e
	0QV8Y0Ocml/p0mkzhdzYNHgSLhWxzm1YX1YKQ69CIjpmv9rMlNBHiGIjgkbkV90KgGH0FpJDqQ7
	lwQ4s4yIisEEOdv25ntxJttqfpj5UPuXdHkuYrrCLR5+CkGO79uZ8gkXAkcO8RzT9J1DuLJgr3+
	3ghOA6rbYPvv2u7Au46ND5j1aQ==
X-Received: by 2002:a05:600c:848a:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb88813462mr53820315e9.20.1795174866206;
        Fri, 20 Nov 2026 03:41:06 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm27419345e9.4.2026.11.20.03.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:41:05 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: display: panel: add Novatek NT36525
Date: Fri, 20 Nov 2026 14:40:59 +0300
Message-ID: <20261120114100.978148-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120114100.978148-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
 <20261120114100.978148-1-tadilhusrev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DT binding for MIPI-DSI video-mode panels based on the Novatek
NT36525 controller, as fitted on the Samsung Galaxy XCover5 (SM-G525F,
Exynos850). The panel reset (RESX) is active-low, and the panel needs
three separate supplies (vdd/vpos/vneg) plus an optional backlight.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
v3 -> v4: no changes to this binding.

v2 -> v3: no content change. Resent as a fresh, standalone patch
(previously v2 1/2 was a diff on top of v1's own patch instead of a
complete patch against mainline, which Krzysztof Kozlowski correctly
flagged as a git-management mistake on my part; see the cover letter).

v1 -> v2 (addressing Sashiko AI's review of v1,
https://sashiko.dev/#/patchset/20261116070212.314228-1-tadilhusrev@gmail.com?part=1):
- reset-gpios is the physical RESX pin, which is active-low (asserted
  low, released high); describe it as such (GPIO_ACTIVE_LOW in the
  example) instead of GPIO_ACTIVE_HIGH. The matching driver fix is in
  "drm/panel: add Novatek NT36525 panel driver".
- Add vpos-supply and vneg-supply: the driver requests three separate
  regulators ("vdd", "vpos", "vneg"), but the binding only declared
  "vdd-supply".
- Add backlight: true so dtbs_check accepts the backlight property the
  driver already parses via drm_panel_of_backlight(), instead of
  switching additionalProperties to unevaluatedProperties (which would
  also pull in every other panel-common.yaml property, not just this
  one).
- Fold the compatible string into a single, driver-matching value
  (novatek,nt36525-xcover5) instead of samsung,xcover5-nt36525, which
  never matched the driver's of_match_table at all.
---
 .../display/panel/novatek,nt36525.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
new file mode 100644
index 000000000..9158125c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36525.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36525 MIPI-DSI panel
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  A MIPI-DSI video-mode panel driven by a Novatek NT36525 controller,
+  720x1480. The first compatible string names the specific panel as fitted
+  in a device; the second is the NT36525 controller it is based on. The
+  panel reset (RESX) is active low.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - novatek,nt36525-xcover5
+      - const: novatek,nt36525
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: panel logic power supply (vdd_ldo28, 1.8V)
+
+  vpos-supply:
+    description: LCD positive bias supply
+
+  vneg-supply:
+    description: LCD negative bias supply
+
+  backlight: true
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - vpos-supply
+  - vneg-supply
+  - port
+
+additionalProperties: false
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
+            compatible = "novatek,nt36525-xcover5", "novatek,nt36525";
+            reg = <0>;
+            reset-gpios = <&gpa0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&panel_vdd>;
+            vpos-supply = <&panel_vpos>;
+            vneg-supply = <&panel_vneg>;
+            backlight = <&panel_backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+...
--
2.53.0
