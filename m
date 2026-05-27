Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585C83F44DC
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907391; cv=none; b=uVvdlsTdrqml1eI3424HSs0DP8lASXP0KPw09Gd6QaleMGDiuD4V+lvRdHuUe8uQlBR6Y9SHBcCSSLN+e5+IiP8HsEGy9/S33QUJ2peD1fjc+WoKQ3R+MFWxA4fmGbHeTWSPVbbN/4fuK7ESKE+qHW5vEVuBjp67EbKtyU7TI40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907391; c=relaxed/simple;
	bh=S6cOIQ9icy+P7rvUpdDlaXAeTozliAus/Ll9N8r1BiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZZESvNoFo/s97tkPXNtm0SHAv+sR+gB2fdwZFm9mKhfU+JwM8t30hP69n2YMhJKGxk2n6hxS0+ItBXWXrLeIZvrToqI0hXV7cnk0grGuQU2Uc0g3VqKBogmqGJadX9lrAKEMmrC2QOAg3VszurTHtoyMzM+GQ3w4L4tYHgOSdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QItF5Xvp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QItF5Xvp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso37127205e9.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 11:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779907384; x=1780512184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lodW82P5YwYpxQxDxn5G0N2M8jp9f8jZPuN/5IUlEPw=;
        b=QItF5XvpEtR8S5uuWNtP51OkSRTA0Bs+xRVVhIemCje46HJIxLZi44crSIr2YuPx2l
         6B5JF33fkAbwUs1YSPjRFaNtfzakCpP2G6mBo8uzLSyu4cK+N4yWaJEGPC0JppTifopW
         ms7ZiMNc/x5r0PBhUIl/2uqZy5Zn/QzU9H207xihtG47H9E2OU1hxFW56bQwuQHvrDA6
         a7G3hwrGdMYw1QMNQESS70hM1nI7qTjK5u33VQhfYGxdb7QeqR2FY000PMEvTcU7QajD
         9CuOSCLQsEF/di321W5qO0CxpVAi4JaGjhLcK3unSiEhsaBj/mSE+EYLIyaQw0Z8v+wr
         YVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779907384; x=1780512184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lodW82P5YwYpxQxDxn5G0N2M8jp9f8jZPuN/5IUlEPw=;
        b=BeKI5A/kVyL+9bxSVDl/XgkH8+D93j8RJsN+2V1DQrtIMlMvm0zevRU9TmzHVoR/bO
         wOgVNJVDi2DrUNUSPq4lINGb0K1izIl1wIL9BJpYW4T092kJDqggo+xKZvSyG9j9B2Of
         abPO/PfXjpFpFraHOnYrCspwlxBUzJxy1wuqLhIp1RXdKYbmRO53nMfZrjEH2AaXKtuU
         5sfqNFQa2e2oWONbR6KmrLnOh5UAcLTQ42nmadxM0tOJqT6/sZNOP0bUJnis+Y/S0ytD
         FdpiaEJEdsrQqorX8Lw3TRKgKfvgnxp80o/pvts8nwz1W6kpOStbE0EI04rAbASuKA/d
         XDQg==
X-Forwarded-Encrypted: i=1; AFNElJ83GKBrC96yEmbGm2cQfJyYEmQnp75YNfZXBm/tD88d5eQcUnw1Tce52EsOe/U1JGNxeAI/4neAKk5i@vger.kernel.org
X-Gm-Message-State: AOJu0YxvZ3Jjg2moTw00cmZUyXKsEkyMwg8GpIGWCEHoDIhRKmoYkazg
	xyhfG5xRzGneBQVBtG3OdyxFKOHR8PAl2gK69SCFG+KQ+pX1Wlrjm7er
X-Gm-Gg: Acq92OHKcyTK9ap5RFkW2XYa0JPIudm9gtRTRBEwugGxZv5qB6Wm+hFFIqdr28PxsM1
	wQR2AiVWHfIsO9j9JATX2713CzqljhZlxGS/+IWv5Wod1RmeM5m8ZGgOwm70ecpAgTxt0hovKf3
	nHTPJn5bQkRiuMuyTLfnxoWiwXqP/zifMG+855rt9nBDX5FKAej02HR4C0gZ3f5eegnKoU8+l7L
	rdHh4FypWpXK/ysaHglATFPfgaZPCE5cfnhGMA92m8obFy4aWhGhs7VyifIkYO3ETSRK4FhnOke
	/ZOu7+8G/xmwnFYQrCZX0opcl0mjOKVsYEmV2KR3qgGEyAGAtVJ0ubRGncJpEDqQftpvxX3EDA8
	n8zziMlxQ4hyrNxjE6nYyKgovI4MgdMSrwn8w9PqIPiyTyAvpzvJp88Ey59oF67OrVRkaLc3HVt
	KOrLPDoEBiXM7nfxBRyYGMof2DKQ==
X-Received: by 2002:a05:600c:c8d:b0:490:6869:46d2 with SMTP id 5b1f17b1804b1-490686947f8mr207785505e9.0.1779907383635;
        Wed, 27 May 2026 11:43:03 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490809ca202sm35312935e9.6.2026.05.27.11.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 11:43:03 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Andreas Klinger <ak@it-klinger.de>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor
Date: Wed, 27 May 2026 20:42:53 +0200
Message-ID: <20260527184257.141635-3-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260527184257.141635-1-wafgo01@gmail.com>
References: <20260524205112.26638-1-wafgo01@gmail.com>
 <20260527184257.141635-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the bindings for the Sensirion SLF3S family of digital
liquid-flow sensors on I2C.  The family currently covers the
SLF3S-0600F, SLF3S-1300F, and SLF3S-4000B variants.

Variants share the same register map and differ only in the flow
scale factor and calibrated measurement range, both of which are
auto-detected at probe time via the product-information register.
Per-variant compatible strings are accepted for documentation and
future-proofing; new variants will fall back on the generic
"sensirion,slf3s" compatible without a driver update.

The data-ready interrupt is optional; without it the driver falls
back to polled I2C reads.

A sensirion,medium property is added so that the driver can start
the sensor with either the H2O or the IPA factory calibration
(default H2O).

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Andreas Klinger <ak@it-klinger.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-hwmon@vger.kernel.org
Cc: Maxwell Doose <m32285159@gmail.com>
---
 .../bindings/iio/flow/sensirion,slf3s.yaml    | 68 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml

diff --git a/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
new file mode 100644
index 000000000..f58cf199a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
@@ -0,0 +1,68 @@
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
+  Family of digital liquid-flow sensors from Sensirion with I2C interface.
+  All family members share the same register map; sub-types differ only in
+  the flow scale factor and the calibrated measurement range, both of
+  which are detected at probe time via the product-information register.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - sensirion,slf3s-0600f
+              - sensirion,slf3s-1300f
+              - sensirion,slf3s-4000b
+          - const: sensirion,slf3s
+      - const: sensirion,slf3s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Optional data-ready interrupt line.  If omitted the driver falls
+      back to polled I2C reads.
+
+  vdd-supply: true
+
+  sensirion,medium:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ water, ipa ]
+    default: water
+    description:
+      Calibration medium the sensor is configured for at probe time.
+      SLF3S sensors are factory-calibrated for both water and
+      isopropyl alcohol (IPA); this property selects which calibration
+      to activate.  Defaults to water when omitted.
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
+            compatible = "sensirion,slf3s-0600f", "sensirion,slf3s";
+            reg = <0x08>;
+            vdd-supply = <&reg_3v3>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 06a8c7457..096ef2fe7 100644
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
+F:	drivers/iio/flow/
+
 SENSIRION SPS30 AIR POLLUTION SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
 S:	Maintained
-- 
2.52.0

