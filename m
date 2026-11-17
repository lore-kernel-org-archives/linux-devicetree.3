Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936805;
	b=BBizhHFmGcHQsc4d+v085J9+FgOLnEp3wAihDrNNdORo+S4BgLXJPwzJQCOBsLq62T6J
	 c5RoeH/AGU186lmyOEpfJitpeSRk8JG8OR4W0oBdUsRAG7NTi32cp+RvRUquZOfEN86ql
	 RDb0IplObxOGczbyg/nWtxKxmbtiL5B0kLCWiPLdgeKG5xqwEDh+N/CUqjMAdatAfIwM1
	 URraphqcV/sGBkIOocvgw2j+9OLZ2rnNEFnm8PporS4BMqMUKo2PfNiBTFoKOccZwfWgU
	 j2RgHyQmLTczWqa/iyVXjSLKPwotQ+3DR9duzdHFiIh54tXNh8wRAyPyWxfA7pjFiVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nPNbdnKmC1IshOZY/jqyrmwNTqB0zBU0VIUMMJN3fqs=;
	b=uV+xVWT0KNQKE/9MEOY+DE0TcsuCwpD0iP98bc3Zp2ce64fJrztc0zewaLS5tY9YJIXi
	 f5KLKKRD//L2sAamv6AVyLrZkRJ+I5WuxXMdFle3Pusk+AiLYHwA/UsL1hAoh6ckFuSFC
	 DZbs9hCyNguAB6qV3BcdNBivrptv7FgEV7Q7vG3iHxfvRP4NcMOdrL2FvXgThD0+SjYDw
	 EbPsvPgrs87l/+yEj1Ova+HEwJrvteLFx6Eo79OfB2hnQ24aogxiL1pun1HYXrHUgIhZR
	 rlC8fION21mkilq58CQlIMFNBK78G8u5HEGcKov5x82wcrZ7qfSafzLoLj7/W9XbCLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdH7XdVC;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89711606A33B
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89711606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdH7XdVC
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so1081105e9.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936804; x=1795541604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nPNbdnKmC1IshOZY/jqyrmwNTqB0zBU0VIUMMJN3fqs=;
        b=hdH7XdVCcf8hrErmOtGqsa4HPKtGAJMQRSKwkFF14KLhtf6xJ+6fiowJuwG2x9ZLGZ
         T5YJ+60EqItzhJM19VhrTrXBxOQQdcFWhPRoEZS6ZP4UQijKIytfhfsx0/fRm6ffn2hE
         kkg8n2F1bjHaa8lq8+RjgdUOWFsIw8sNwCTcxPR2lHXU3UBdZnDM9yO2/STtZ+OgJnUL
         W7DvBTRk48PC8iWQotztDm5Wrww5KNHNW+y7PP6xTAM8YlT+CvjxJvRUTK0/7O8cc89u
         4wf/VnkNgxhd2uMAcdGIERnc1FE/D9YmLAU1LfLLX9SPm+tU4eUIz6l0ynya4+MB95es
         IuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936804; x=1795541604;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPNbdnKmC1IshOZY/jqyrmwNTqB0zBU0VIUMMJN3fqs=;
        b=1jUTLj1QjDKX0dh402LmPe9LPFr5ifsmXc34FB851GgXLm/4L2OsZr51H+k1kErDT7
         mz/OUUklMndbxfef2IMEXllLmzoTYaXlbul/4ZBLL/t2bbzLnvhE3n7jvDJGASiceWx/
         tqMh0S5ZKlL+EHcxx4szc70/mE87uClkaxq3J+3umnvLklz+74Be9DvdaoEMbiXkUmP8
         fARP3wP/HEJibQ8pq3uu/4tFN4pjymUdjsT3iJwPqOAjxacYdrqKmLy5jDEZ6mq8p2nW
         biKcQ3/9qoV9xwRIHjsAK16KiFhj1EgKQZ2LcaSBns1WgkzmDYIRrsnTff4VH6PXW87D
         rgJg==
X-Forwarded-Encrypted: i=1; AL+hErESxaArIUXHWOzw4GEWmym7qRXnwXsUDDI6ac4LWTC8v9iySEzo+aSUp22SsZ+HS7ZT4IRhtBWGkMTB@vger.kernel.org
X-Gm-Message-State: APuU4Z/DEHPcXqNOmuodAoXQpxlU6Ku3//LMZA7lBul/2w8BO6agaDfR
	wR8J/9In9e6peWfskNjzkXGksGrm2f9BNYe15xf40+IEMPtEu1V/JUwH
X-Gm-Gg: AYBFou1jrVRnHgWU17glBJJOKCHtDHzEZUYyOH3Q2G+OAYdrnT1TPAiU0lfesBDINVD
	mu2QqUaZSneFQaOUKxB4lIiTiMcjywUQ98PCjyEqcicR1UGdqVGWbcyrmEl3xwyRk9CtObdBGNC
	MLpb9PrllaNu4UzfEu4n3RtJ7SNMQQxEd5i2pAV5PTS/1pEu1eSx5mHZRRLJpjUGVuCeJ6waNaQ
	8IrGxtJ+wOww2gWnsAa5O5Ua3/62mQsFGLsaPrk9mwGWz75IWODyK6jzHwf2CB8ZGb3XrqD4Cqw
	ngjEkDLF4d2Vy35TE3Wos1gYWU8+3WoZjs64horAbXjgUtnofiU+7jzYZdL4zthBDYox1IFX/rV
	2gi5FJO7Iz483bPUkU7tw5YInXYuCJGJptqKVM8Dz7B69Ohg4zS0XRuOjpdEIE5y+FzWjQfJilw
	BQaaB1BTuLNHxI3PBBtX/aWohdjYUt65n4u0PhJqla1KIc7603KmVnNHnUU5XHLWZ+dyveVFNaY
	xZpMjgm3T/eGgieKE69xlEbDvM90Y+MPr/RTJYaANHSO8ZSH0axZQwfyMIJU4ZsW9V4Q8b67EZh
	zX4nqugdqg==
X-Received: by 2002:a05:600c:6992:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb68b9f729mr199623315e9.9.1794936803812;
        Tue, 17 Nov 2026 09:33:23 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8220sm79269585e9.5.2026.11.17.09.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:33:23 -0800 (PST)
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
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: add Novatek NT36525
Date: Tue, 17 Nov 2026 20:33:18 +0300
Message-ID: <20261117173319.1852638-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117173319.1852638-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
 <20261117173319.1852638-1-tadilhusrev@gmail.com>
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
