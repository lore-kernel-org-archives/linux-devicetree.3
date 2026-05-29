Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E853A4F26
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036123; cv=none; b=uTMRBwRgoJEhp9Kmj74od5pAL2UN84bjeGSh6VX10ibhJptzQfPuI5pZI2M19LI+8m73/jJTzoVwCb73XW2GZW6xa7ozQqIpYohNv9sTnnV2lDmDfyGp2y1ZvSYKVDHCxShZAgaMyGXZt7h7ov+FhEyeCvFj2lfyzHSyPsHpqwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036123; c=relaxed/simple;
	bh=RUZnKY6xu4XwYRbNJvw8NSe02bg60PLa087+CBdhzxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMbGBt9mskgFfVe/I1oqI+lwXGkHDgRA8dteLSKFUeDesfR2Yzz2iwvfDr1jlOIa5YN1eLD609Swcx2nGF0m2jQbohwi9uAU9zF9bPSfw84RslronLKpwquvEd8CLTh2IS41BBLJW2vcxizn7eQSiCPWsfrQ93ZgGL4L2Lwi+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=lpBmUqEo; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="lpBmUqEo"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b0c968fe8so3189878a91.3
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 23:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1780036122; x=1780640922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1BXKQ5cO0sS+w6dWfKU1RmTE2+q5/z7tw+KfuVhcBA=;
        b=lpBmUqEotsre7mFuvHqHBbW7HbMa+62ji3W7XhCfrPP7TDBvnPHAVAms8L+h+ryMNw
         WJDCuge4BCk0Y3+vo1sqqy/dG+PEU3vFnpzTn38tOUl4NHzDsiKVpytRXwu5nmyedCbe
         LPw7+hirJ3LrlnPvA+8xxm+k9wQaNLZS+TD8u6SV+hTyMhBv8l/AnNm24ymdu7DxYWgz
         m0H1SnktaHCRh4f/rUU2gjqOjHOY18gk1iHPA1rJ4+IJtHmxQM7X4BL0XyAKS/0/EPBs
         fIZ4CxBfG4Uo0hgF7wAZ5nSiTsD1ieUAPXgTzyDURiJlWarlRIEh/Q4SOXmFFyNN2Emh
         GZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036122; x=1780640922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U1BXKQ5cO0sS+w6dWfKU1RmTE2+q5/z7tw+KfuVhcBA=;
        b=J56cc9tnB6sd85r64KrsjVcvIB75GxgOzh/Kds6A+WnTHuSyf3ZzU+rfENWN95rLPQ
         xkXqMh3g6fJt953jG2TjvRhBnJ52u6RpDXasdikILX8XLWQBbBppQ5vf84QBXTM1Fy+W
         7HHg2K8A1JnhnzjmjdwZHTPjSvHZxurjKzPtdiKN0IS8t4GYL/obYokruHOq2EwhppFz
         wAfAegTshYy3oAvxco50xpt3RHfmk5OzgZvegX2RA4+k/XauzvBr9Aw2PVwNqxibhiDI
         nk9K8oSQbXUmiSCBaHTNv2ZTUPL5cTsI5bnFtc2bqo2rPo932ahjLs6pjzMBRsZ21H/y
         ga2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8zsa7WzFdmOcpY/as6uDM95aMXhki8uR1CaVVMz8CZ/9NhmzeRuu/XOgGOOB/gBgQS23j5xUm+z7/5@vger.kernel.org
X-Gm-Message-State: AOJu0YxzDX7NEwX54U1TUuqaop9JnSbuIHJW6VZQXEWvRANJXNPEGS9f
	xJw85Az6mA9ERyqG6k2l33U+24IFzdgFyeTeztmHHvpkPEqv672XRlCk7ZEwXMG3q6c=
X-Gm-Gg: Acq92OGMkJ3ac809CkN7qkosb76pxHUnGpz4UM/aCO67PzXthqjD4oTSae7oPvsrEa8
	3RO7fxxw0wyZYmTdGLAx3UB22QrMK4kPrcCwBMniPfZYwC0FYuO8iXQrFVf+C9sCpimQEpdQZ63
	BWmk101/W9D5ywe5nwx8XseARHFunp/l3lXl5KbG4bhV5jUiM2ntGWxfTgSzg+9T8qnJZxZ1OHu
	DXCRlEffbPXXMrSrvZMMK54gMKxvwe0dh697vXh/DcAQ9kThm6ZFNz3g0gARYq8XXAgHQMbay51
	ma78q+yaOB3Y52Y2edVJjkONmxchN5Eq+JYxlGsZc1KC7X+CSKhlUOIX/vKyGdfFyXFYW6Mb2l+
	ys4+Pq5xcy/D0kQCR10yuKDSOI2oMAPdvhjmqdToJB64oLBgazxYNO1PDzOG4OCmkf+wd2DHtVu
	Xq8Sxj3h/SyIFJDVIe7kNMlQ+yZQ==
X-Received: by 2002:a17:90b:1dca:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36bbcd626b1mr2097204a91.7.1780036121753;
        Thu, 28 May 2026 23:28:41 -0700 (PDT)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6a340b7sm717087a91.11.2026.05.28.23.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:28:41 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Kever Yang <kever.yang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: display: panel: Add Ilitek ILI9488 panel controller
Date: Thu, 28 May 2026 23:28:35 -0700
Message-ID: <20260529062836.203990-2-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529062836.203990-1-igor@reznichenko.net>
References: <20260529062836.203990-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Ilitek ILI9488 panel controller which is found on
the FocusLCDs E35GH-I-MW800-CB MIPI DSI panel. Add "focuslcds" to
vendor-prefixes.yaml as it's a brandname and a website
(https://focuslcds.com/) for Focus Display Solutions, Inc.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 .../display/panel/ilitek,ili9488.yaml         | 63 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
new file mode 100644
index 000000000000..ea7449273022
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9488.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9488 based MIPI-DSI panels
+
+maintainers:
+  - Igor Reznichenko <igor@reznichenko.net>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - focuslcds,e35gh-i-mw800cb
+      - const: ilitek,ili9488
+
+  reg:
+    maxItems: 1
+
+  vci-supply: true
+  iovcc-supply: true
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - iovcc-supply
+  - reset-gpios
+  - backlight
+  - port
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
+            compatible = "focuslcds,e35gh-i-mw800cb", "ilitek,ili9488";
+            reg = <0>;
+            vci-supply = <&reg_vci_panel>;
+            iovcc-supply = <&reg_iovcc_panel>;
+            reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+            backlight = <&pwm_bl>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 11c55b5df0e4..ce195c72db6b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -602,6 +602,8 @@ patternProperties:
     description: Flipkart Inc.
   "^focaltech,.*":
     description: FocalTech Systems Co.,Ltd
+  "^focuslcds,.*":
+    description: Focus Display Solutions, Inc.
   "^forlinx,.*":
     description: Baoding Forlinx Embedded Technology Co., Ltd.
   "^foursemi,.*":
-- 
2.43.0

