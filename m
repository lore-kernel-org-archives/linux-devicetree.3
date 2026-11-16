Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812539;
	b=y5tyFRH39zcOX56VbCWdv7Kju556aIOATFT0bjVWShrkiqHc8JNCXVoL2HPdZMva8m3A
	 2+ebN+rVxOIuv2CoCZ/59tIKscmVGnMNHEO400F4hw8kEIWnLN4VQyNKmt1qxYhm8bfKq
	 Oh4Zk9MeIegLKcB1A3CAgLJxejGrtMO6DfFG1fv7QJdohocRPP7n5a5WboJXIuKIvOGEk
	 Apzp2Fy5BzaHVSWTGYVZWj7U9aqS369RnJ4g39ZcFUkYnupLbZzguZVJcH4uCuVF55Jpq
	 aZkpDvooFuntkDeIVgvDqO/CFdghaGmHHX32w7b91CwMURo63IUpf/vOCxEZkAQVgTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2WwhmAqxPEFlsm5zE6uH7fU7EMvllXc0ISVSjbfBGoc=;
	b=1Nsn10rd346FNe5VIWHGIZAnUfEIoZAzngt/s8w34e0PKzW69bVI9AYhk5/fCo7ulC8S
	 Xprr8k+kpyXAVy0lcr/5LfJnL5cKUxcWTsTEolsJLV4F8uAkS7PHNuzVXLB344ngLCA1g
	 KU2f+vzywfur5AbvMbG2husUu9z1xBBhbjXfxYjzfMoJlQfZHNZAOUpfy0BYPx3pH2lnW
	 4XnvOZCvfldi/SK0/CQkgzQCSYh/DIPj6dDKYIjC8X/98r9baF31H+4gXWuMpB2h1Urc0
	 QZnBMk26ypYRyv8jxUSHmeq+474HpwNqD0xxapFLGUNLlIOY7pzQ+5lsGWucfh2GnAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAlBWA1J;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DA6606A8AC
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0DA6606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAlBWA1J
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so24300845e9.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794812537; x=1795417337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2WwhmAqxPEFlsm5zE6uH7fU7EMvllXc0ISVSjbfBGoc=;
        b=sAlBWA1JUDz15Lj0eiQF8oO+/bEklWxeQiMJuyQfxf4XndWTlboQwImwBWyKh6q4RZ
         0QSY6JZkqCwv+BYGX/wyy+WydRcRgjRXXXC/nKPYivx5RGI8sap+Ab4sJr/RpvfqKLAC
         LXMDCvDyyB3Id+VM2BpQp1XwbwTiD8+7MPVJFUpn7TQRaemWrQbX+4YvKrm5s9lWzXuF
         GRZtjwHoUmWSjwb3i3W59HnNe4xNrNHY12jAjqqgN+m0EzpVBa2aLiz3BSmr2lfeJ5W5
         SJU/a0c5a8c/SOVWr+ksuy3Ed1gBufcob7zbbjnDk77C1+WJYjgwJG1+zf8wW2bIJkjz
         iLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812537; x=1795417337;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2WwhmAqxPEFlsm5zE6uH7fU7EMvllXc0ISVSjbfBGoc=;
        b=r4/5BvCXNRmNmCDx/O+NbxDmSHapthgRMjT40GD3IVjhvEj9OnWdMujKovLdTdU42L
         RlIhUuQC2UlQWQ4XyLW0+uFfMFTWah+NABM1LV8VVyNlHbJmRJQYejax9ONS4r62DTTH
         HCr78M82N4URJw/XJ04jJqSoZK13FoLScAXPR1KzV8jY0LACcCc30fJQ4+gB2qjhdeCo
         oTnSKe6B/3EGLRfQV9OyPnTJ8iV1nD1P0S9z+Tcp9Qgl7P4yqu2uxq2li0dfeIDsRFzu
         smjyWkDXAgSKjVP5n0/+ODoLY2UlfFo0m1iU3+IcgUfcq9YNavtJSZ1yWyRTk3gCJ220
         4Pqg==
X-Forwarded-Encrypted: i=1; AL+hErHECe3s5mt+xs3W9Y5ZYY96iCgzpvekHD7wvXlQ5ju/pqAVgDh9QbA/9UJXyBbS00nMGZcBd2NBTGBt@vger.kernel.org
X-Gm-Message-State: APuU4Z96r3egxheplvYrCUuyzeULk2BSTs1oMejFanXfswumT4PSiL9A
	CpJK52Exv+SpL0nmzTuJCeviUq4ljxaArBSEqbfV4rqMK18hZIrBHcXf
X-Gm-Gg: AYBFou3ezUSZHpncPd/V/E7DcMnNyM46Jikkbcv+VgXfAyR9fIpkIkkhDelTP+sZpg3
	YlVRY9VwT3QvbRFhbHM5cybpIQQE6flakoHlasVD9eY+C+WE6Mage2ch2VnzIwp6qzXYxu3Vblw
	gwANU6xlp+Z+kVVbKFdf2/KWpRxMwAjF7cNzA8UfTNInm1EERklSv2l2uW3+yXYKSpvYBm9JBnO
	ZtO3aARxAXbVleY/KkBqEaFNPseigp6n1E32FEGW/MCerIw0xB3p0YNkOhs7vMmT6UKeaKem3v+
	Ds7VYkGuH5xKoBweDr4vFJLn+lKMaXsXR3csroYfoDmHfi3jWigc0tigUOUozWHS4dg30/acMAv
	WU+x6k1TttTUTqiC8ANYC5kJgUUjO8GfE2yuOvncLN/7flBIkqV/HR5pnXVaUZuxor2QCzBguyB
	AJSLwIEiqEZGPLo3IuLogCFVjM7V4wHI1M3VookU5WBVPuoVT8TIksV4VgrbG8WxeBNuIK+URxb
	Y3fNnHVSaNEmK4fpZNgO67q/OEEsE6ihki88yOJcqACSAl1zApB4Fsp01m/cqJN08jB815ZH9EV
	gbYaAp1rPGu4+v86yFcrfT8Gm5NkSWtp
X-Received: by 2002:a05:600c:8708:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb55a7ece6mr210888835e9.12.1794812536974;
        Sun, 15 Nov 2026 23:02:16 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm558777625e9.1.2026.11.15.23.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:02:16 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: display: panel: add Novatek NT36525
Date: Mon, 16 Nov 2026 10:02:11 +0300
Message-ID: <20261116070212.314228-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116070212.314228-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
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

Add a binding for MIPI-DSI video-mode panels based on the Novatek
NT36525 controller. The first compatible names the specific panel as
fitted in a device; the second is the NT36525 controller it is based
on. The initial user is the panel in the Samsung Galaxy XCover5
(SM-G525F).

The binding was drafted during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic), from a description
of the panel and the stock device tree, and reviewed and validated
(dt_binding_check, yamllint) by me.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../display/panel/novatek,nt36525.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
new file mode 100644
index 000000000..5c6e7cce0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
@@ -0,0 +1,71 @@
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
+  panel reset (RESX) is active high in the Samsung Galaxy XCover5 bring-up
+  sequence.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - samsung,xcover5-nt36525
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
+    description: panel power supply
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
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
+            compatible = "samsung,xcover5-nt36525", "novatek,nt36525";
+            reg = <0>;
+            reset-gpios = <&gpa0 0 GPIO_ACTIVE_HIGH>;
+            vdd-supply = <&panel_vdd>;
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

