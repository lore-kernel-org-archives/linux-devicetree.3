Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19C633B6D0
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780174507; cv=none; b=pusBbkGOksUHLj5wnfiUnX5pd9c/SLdwg0/yYEYgDIWXo1YYDOXfddg3AoWidbehR6qu6YRRoa76ZuGMiGkjbnO5oA1LVuKKxHgEMydkK+Icsz/3JfrqysnOL+bW16g7HQrHN8iaevQgxvwqK00tzPsbR6I28iuWZai7vRxXQJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780174507; c=relaxed/simple;
	bh=hwGl3EPuphO2HwbxFoFnDldoXbDsAWGoIy1kLT4Cp5g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=niyUBkHZxC3t7HUw6SkVH+yVuv3UPzkXx1aTvnB26ruZsVlptAnOwx3LpaiU0lFrmNOHBQJpUJ+6HQixo57BI9EBb6B3ayOLDi3obguINqYNdZYVxEF9LjLaUAYtWu2hdi2kjnjD617kTpisd3ZuWG66U8sAVoaXRWFu+Zv2Bxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6MuVJXM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6MuVJXM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45efb698ef2so259018f8f.3
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780174504; x=1780779304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fP/yeBc6tDGnYnwkYYiLHLYGfPjF9AFGOqGTC6mRuYQ=;
        b=K6MuVJXMtCKJnnL3zr6rtTD7fo0JObyDg1Mq7XSDFppzGCnQ5AYO9cU5YkrVe770MD
         bYgNcty23Y+TMUMEjQFLgndu15pMoh2nL+rmwU4f+t9eWlclbT0r8bTw/KPJkb8r/d6p
         +Ywm7VTN6wfruN74hEd0kYIa3NK61d4G5c1M3CPWLts5f8HbofwpQh/yduNL7zWvI5qH
         E8xw4mlwqEOLGocJyDWp0dek3M5n1KN7zxva86RCLs069IkuS45FCmlCiD76vhd1OGg5
         MPHO3yFSW7yZGxOnPzRshLGLj6nAuNld7jqnnfhGOFjNKjFik0vA4km7+2rCXE5hYiti
         WMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780174504; x=1780779304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fP/yeBc6tDGnYnwkYYiLHLYGfPjF9AFGOqGTC6mRuYQ=;
        b=GZ0+kKvXkWJ04qcA+mNszIQQbj7DGFWd5yYZcFVlQ6sa44v8kUhNQcDLLi6BVMRO7R
         YpOeFGvT2IWgIQuhAHf7V2MIdrBjnd9FFS+jK41B21kScC5jfCSYCfL/jS3jbvo0OcDM
         kQpKBn7HW3pn2kshv0V/gnclis6FHw3zta+3NYcdh4KocE4ftDHtXL78SkH8jNbDm1xF
         fl6JUG3LrAZiuMMBz1vqKddoRPr2uhg5cVup8ureWao4TbOJ8DfW+h0uiE63n2Ls23PV
         WuY+5zfbY5sJApZONS+OX2CwFRlaeYlqrTwZGHDX0HYk6NFcFACCud4fWv/LPjZoxo4I
         i0wg==
X-Forwarded-Encrypted: i=1; AFNElJ/sQUaeIlHCfNOKRdcTGPsrU8gDbgUZyyg2fbpI7mcI3yRcRGMdE4l3c1HK7OBgdL5Bx3yx7TRQrUcD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywviued5C79Pzktnh+M8lLOCSFCqOZWvHt98Gvx1oYHU8Fmgp3M
	ulRWdb6zhssc1nE2gAxgxmECC2Vcb5ItxqjmmTEe50uayQiVmYr7olfz
X-Gm-Gg: Acq92OEuxPidzWdWDfbh15v1ZLXHlLdV3fue1/CEgfH3w2MbDEAU8D5KNGdW34O+kUN
	r0Mp3LaGjFlxlEd54u60jP9XrAQVWUrg4CljGordkjQ7IGRLIXNG6jchbdY10z4RG55aAq/ZmCL
	GFwRdaPt4nO+6vX3C02Zi+gswuGm4WBVF/vrW5iFbGuXyXuTUhDXv1vrz+Vk1iw4UBpEmEme53d
	fYVPUN4g0SterYQX4yfMODbIrjkQCHd+K9fAsaL9QsDkSsQHte3e3cl2x1Vp0Q1nbmEmcRK9Xam
	P3MhUi4p0nd8JBfyEaKC12b+5/dQwguf8OCGRC+csBalfgEamzeOFkowot3Mb4rQeJhA7sRi3O4
	wGucqwZ0e8mtT4rTY3YV4OpvnwlIDOIMugpAiZwWDzvrXrNbJelQpIYZFpOYdKdkq4AJ8hfkes8
	xLopRIEsErHZRYtN0=
X-Received: by 2002:a05:600c:6287:b0:490:5429:1513 with SMTP id 5b1f17b1804b1-490a2901c14mr93218935e9.6.1780174504103;
        Sat, 30 May 2026 13:55:04 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cab0e94sm132288225e9.12.2026.05.30.13.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:55:03 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor
Date: Sat, 30 May 2026 22:54:31 +0200
Message-ID: <20260530205435.37326-3-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260530205435.37326-1-wafgo01@gmail.com>
References: <20260530205435.37326-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the bindings for the Sensirion SLF3S family of digital
liquid-flow sensors on I2C.  The family currently covers the
SLF3S-0600F, SLF3S-1300F and SLF3S-4000B variants.

The driver auto-detects the variant from the product-information
register at probe time; the per-variant compatible strings exist
for documentation and dt_binding_check purposes.

The active calibration medium (water / IPA) is runtime-switchable
via the in_volumeflow_medium sysfs attribute and therefore not a
DT property.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 .../bindings/iio/flow/sensirion,slf3s.yaml    | 49 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml

diff --git a/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
new file mode 100644
index 000000000..dc41120e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/flow/sensirion,slf3s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SLF3S liquid flow sensor
+
+maintainers:
+  - Wadim Mueller <wafgo01@gmail.com>
+
+description:
+  Family of digital liquid-flow sensors from Sensirion with I2C
+  interface.  All family members share the same register map; sub-types
+  differ only in the flow scale factor and the calibrated measurement
+  range, both of which are detected at probe time via the
+  product-information register.
+
+properties:
+  compatible:
+    enum:
+      - sensirion,slf3s-0600f
+      - sensirion,slf3s-1300f
+      - sensirion,slf3s-4000b
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flow-sensor@8 {
+            compatible = "sensirion,slf3s-0600f";
+            reg = <0x08>;
+            vdd-supply = <&reg_3v3>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 06a8c7457..222a03b6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24187,6 +24187,14 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-iio-chemical-sgp40
 F:	drivers/iio/chemical/sgp40.c
 
+SENSIRION SLF3S LIQUID FLOW SENSOR DRIVER
+M:	Wadim Mueller <wafgo01@gmail.com>
+R:	Maxwell Doose <m32285159@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
+F:	drivers/iio/flow/slf3s.c
+
 SENSIRION SPS30 AIR POLLUTION SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
 S:	Maintained
-- 
2.52.0

