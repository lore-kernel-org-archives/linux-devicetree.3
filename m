Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA91499F0C
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784163; cv=none; b=UkvX6A+f16RwmA4BsyfKMLehXBdgGRNjgE5LA1x10gAxzncD2Ro6jt/8TxxDysnTQxn359gwI5JnzU0sDq6dBfo0oGjQy297P05o11bMvor/DOrPfFduiCKNXVUf3IY7sM0IAfAGK7001J1qRglvSR43cTJV0CB1vA5oepxlhi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784163; c=relaxed/simple;
	bh=Ot25WLyqVRhsBXv9+FeXxetochqDJHUpqUPvyel2wpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=To01GjXEv7U8Q/Vt+gmVnVFS3e9AgxZaSfB8bsNfxoT9KVWbTYkQLp6kPOEOzPMt+xNOGBfGKCMUJNVF7grPQqRItubXmaEpHt9eLrRF1Muo+NItmhVWMg+GesKSIE3oj00K/WpCvvKYMycKswIKLImG+Ry2k4bJ+F0OMJHYAqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sn+yLEwg; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sn+yLEwg"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-836ce6cbe1eso26381347b3.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784158; x=1789388958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E15zTz6LSPQ0+KOjqcr732bl7v4sHhRkFWWTNxNbp1E=;
        b=Sn+yLEwgWmdhSx7HuDYyyh3JG3XfyR3YL5z76XD0N7mow0r2y+FxosGcND0dRQcQnC
         MIUKVA+JXIOH5qMlhHRP4jXZr2bjIgo9Dy7TWUABo1KOmn9T8UkQ5O3qURvbjW3rFutJ
         loMZEZ6uZGU5lJfQrDkcuqw4PJ8G0arDg4QokLCX2DC2SYfDABCIw45EnvSU027swpAP
         Lvxt5SaIPqMd8xF/dfVrP2LioUJfACguN0PJRSmIOfTl7eA2Zp58l/lhS+WhYS4oWPNv
         QA3bU279XXckipIQIfMZwQwH2nW1kgWB5NPvk+460KuLfelYoIJi2swDJ4HIPOwiy/so
         oIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784158; x=1789388958;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E15zTz6LSPQ0+KOjqcr732bl7v4sHhRkFWWTNxNbp1E=;
        b=A7dDYd2Z7IisAvFOuuz+Ti9yQVTPON3QNYaRnG2HPqxJJ4lbWRkuJt6rn6avdeOZ4Z
         Fmp0W2FSp9WJ3u0W64OLHxZbXRxSjF6J2Ron5tWB6AY2QTn/E41psc8eQuhEIGqinpm4
         lIQnwmHwJlcSBr9DQu/2dtYf5xsrywYysNN7MbXmzZ35jkr3LJtFGaWTHm60ttboswl5
         D2Y0PMx9ghAVvMHrqgLXokn3/48EZqWXvuMiIeJRNb0lCABxAAs4axdH7FjxIY6y6qpZ
         rWTz//DLazeQPRDwGur8aPdZixZdR+lCjPsNwPTUjavNzPeT2PHrZZEeiOogXKD7byCW
         E9/w==
X-Forwarded-Encrypted: i=1; AKwUvBxoJcL5OxPc90+HPqOD4Tax2fldVacRENMLfexGIkfHruODfEoF3NSrq1UFStMY1eJq5NG1D21K+2uM@vger.kernel.org
X-Gm-Message-State: AFuF++nwg0yfWik+fFqglMSFFBr4hkDZb2ZAA3hTKGNixcp5/13x5Ofr
	XBro4w7a5o7cjDMXBqXjN3p2pDnnrzY73aGS9Xg/i1TCIE50z9/CEw0=
X-Gm-Gg: AYBFou2sK4kv4JQ1ylyM5Wt74dKUwaooh2mRQ++It5zOrvnHprgdYvvEb41Mb1yfM01
	i3BIr5fg7xg8peJU1T/PAjiNKFDKab0N0cdUN0+YGFzXO0sjy06DBrMCpljrmb1oTHOSCjQ2kjj
	nGNH+kSwaSxDfoGvYC8/Fc14wAH43VI7A71wtu0mHiHjNCsLSkZ829xySLwTfGPVnjQfTpQhRwW
	MyuqB1l4XgnOS3dYc3VI16KoER3PZOd6K/demcm7aCniSe8CIQbYRfkXL5J1rFECKrLbbBTJCMn
	Ii+/ZNeTycK/GaSS96f8/ycgPKXGdus/Dpl02B2Cy1tuQ8mpmzUmLTey8JSPj7MCzxX3Jxu8KwV
	KqIbWCMaiAjlfsIoirMxoG68zPdS9CIyR6tLhf071+6fD5rg7iRgHPkjGbiOPlJEF+piYuBN/ut
	ZpqRYXb1ddAY8+ibjRk6kvH7epy9TH6FJG5Qgj68+u7eyG4Gc5BeiMI55C+C3UC+/FMbDmGE/pj
	+wDicmFEoGhfDW1xhYMsAhXkeHbVNO4f11qeJE=
X-Received: by 2002:a05:690c:e18c:10b0:858:6dab:206f with SMTP id 00721157ae682-87124c827c4mr65766617b3.5.1788784157765;
        Mon, 07 Sep 2026 05:29:17 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm70511967b3.45.2026.09.07.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:29:16 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Mon,  7 Sep 2026 09:23:29 -0300
Message-ID: <b961c25f0b67968b6ef891f2dd3527508a374261.1788711082.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788711082.git.nico.antinori.7@gmail.com>
References: <cover.1788711082.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Notes:
- Patch series based on 7.3-rc1
- Carried "Reviewed-by: Krzysztof Kozlowski <...>" from v3 since this
  patch did not change.

 .../bindings/display/chipwealth,ch1115.yaml   | 81 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..6b037c40242e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/chipwealth,ch1115.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipwealth CH1115 Display Controller
+
+maintainers:
+  - Nicolás Antinori <nico.antinori.7@gmail.com>
+
+description:
+  Chipwealth CH1115 is a controller for monochrome dot matrix OLED
+  panels.
+
+  https://datasheet4u.com/download/1576606/CH1115.html
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: chipwealth,ch1115
+
+  reg:
+    maxItems: 1
+
+  chipwealth,inverted:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  chipwealth,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 0
+    description:
+      Display start line offset. Specifies the vertical alignment and row shift
+      along the Y-coordinate.
+
+  width-mm: true
+  height-mm: true
+  flip-horizontal: true
+  flip-vertical: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3c {
+            compatible = "chipwealth,ch1115";
+            reg = <0x3c>;
+            width-mm = <12>;
+            height-mm = <8>;
+            chipwealth,offset = <8>;
+            panel-timing {
+                clock-frequency = <0>;
+                hactive = <88>;
+                vactive = <48>;
+                hfront-porch = <0>;
+                hback-porch = <0>;
+                hsync-len = <0>;
+                vsync-len = <0>;
+                vfront-porch = <0>;
+                vback-porch = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 73acf72c01f6..16a4a7a158ab 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -331,6 +331,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chipwealth,.*":
+    description: Chip Wealth Technology, Ltd.
   "^chongzhou,.*":
     description: Shenzhen Chongzhou Electronic Technology Co., Ltd
   "^chrontel,.*":
--
2.47.3

