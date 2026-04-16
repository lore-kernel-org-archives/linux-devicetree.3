Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED08D371D0A
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 20:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776372533; cv=none; b=YsJm8QOsHE2EzyC1SwYbcgdvY0N6H2EnmLsuY4WDoMx7NiM54DK2WDiAcw0UAiQFg1h4XlSqKUSbKk8DgmXIgqDTiBzWSLoeiBoFeL4JOcp+0fJGok2Uy2pneUuDtWYPJbaPtSw1Z39RcBOF92gQGVvE1UOSAaD21E0LJmZF0M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776372533; c=relaxed/simple;
	bh=v1vfoqnG7mr3y+oTV1y9cm3RZIb9k31IsXz4+V/BCFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0Wteh2xDodPFUNq36GjSjicvq0p9OdSZrHRJkNl6cgwZRLg89+YcVFLC+2MFuGshaa/HzxTi2Z019c7VMCuxro+KFfH4HIddHDqy2nA6gfiL08RgJoMUyPqXvWMgP//v333kAXFheWYAtEeo5vbqLVrGcvSEY/7WKAyVmdIIRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bh9vYMR9; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bh9vYMR9"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-672bd8d2400so336929a12.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776372530; x=1776977330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhNecU+tmFElmowxJNTJwmYaqHoa2Fb9XKIuMgIj0n4=;
        b=bh9vYMR9pjvLIFcNxYrcj01P7qICcSCaMeF7xiDJO3/helVPlXEJsPyodTf1x07Cu5
         ULZrMOPeuXEYvRdhQf7Myhdx+WslZvKIhV+6owAI7qi0ADgECSGcuQWQM1skxD6Dr/6J
         g5q0Ej6BkD3xFAUwt5i6vN8FPv+o5m1ar6fnnfgVjrFqLAbvRznrgKJtqKYMeqQWGxM2
         Y2NRcJ9curNmPq0CEsNtiP2qBDy37FtkX9TB7DKBL5CQUECxUQ86VDMVQOcs8FP9+68m
         28VbK7uN6oiyzHxbYSWwAZycp9l1olFEX47FGK/Xg4YQV0RVgOQ+SOgQDcrBjHScA0M5
         OZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776372530; x=1776977330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhNecU+tmFElmowxJNTJwmYaqHoa2Fb9XKIuMgIj0n4=;
        b=Xfe00wYfytQNJrGvYcLxUS8pUdidLCrz92wR2zeGu8E7s9rt9x9RWBjkTt1T7ySKVG
         WvhX1t6ap7N1I/1QhQlH9bY9e5sVxgYcrc9VWdMDOABK39/OLWIsqIDrq6UrfSAGfdP9
         ACOmbYGj2/QImCpYWVZmMTJAg7dT2J3sd4+KZxtm+7ecnqxlcls7F9CwvAFy6pyVCNJq
         PLaN5ApH2C5P4KAfp2LqVC46iRdjp24HdvpG60F64LaQOFdP2s7+AF+JhJDmfYNwZCPn
         0Og6XyyO9q8nJ2nNdlbE+RocvSAF5Ea4z0hnFTax/pTSCv7TDMA0hCqt4WMs3YDfcnLj
         XTJQ==
X-Forwarded-Encrypted: i=1; AFNElJ86Zw00i+XVyn5Y0PIpEyeJ0V4IxJ3t/LRMmLQjF6IWBkHDMTpbOcSsjR7QPYBc8VIDJ4JTdVQrOnXO@vger.kernel.org
X-Gm-Message-State: AOJu0YzHv2fai64hxCN7c/w+4DnT3DlpNEpcwoaRG8Bo3Emk7FnGPlQH
	znh+liH2Lk+RTvZ4q92TPqd5bUNi5KfTgFEBsgFmxMnw6ADBlO103/Y6
X-Gm-Gg: AeBDietYd1oMEieWRU6Au/EKw5VwgDgVUp6blMyCPLN9NwlC1TU0OLAPIKELkgYEZv3
	GXL5bIhYcELFRvZiVosv0bFgztSS/k+WcmUACzckcum+FjI0jLj8s0T2N55CauhK2mkRLzAMpzY
	vhBN5/YYcteQ6eAyZawLy/gshIR4vcvobjGoxjUQ90RdgDM0m5LVK4duyRLSVF0kqvrDcf0lmlS
	MecJrrFK/I9EIf4ab/o55PxNDgZW23+MTtWyRxYjOCpV0SZPOHg3Qw7gs6ATXwK64KlHYw8LoSQ
	NamxpUoBbkdbpOYIIXj1SDVYOGUgXQEJCMjsFALz1P89vSQTn53mCoIWUo6F+FsKnmRzhBifsh6
	qS4CgMCBLSg+nXDhsBwbCK7DuVkcC/jaEL+OhaAm+goxJYZ58I2gqe0QnvNM/IFk/vjyCgY/H8m
	5br1z/TaAh
X-Received: by 2002:a05:6402:3048:10b0:670:8d21:dcb with SMTP id 4fb4d7f45d1cf-672bfdd8356mr78643a12.19.1776372530217;
        Thu, 16 Apr 2026 13:48:50 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::d908])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6723800b6f1sm1437962a12.26.2026.04.16.13.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:48:49 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: wbg@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH 1/3] dt-bindings: counter: add gpio-quadrature-encoder binding
Date: Thu, 16 Apr 2026 22:48:17 +0200
Message-ID: <1663eb2f4bf4c826cd190fa9974fb55c321e7073.1776372319.git.wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776372319.git.wafgo01@gmail.com>
References: <cover.1776372319.git.wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding documentation for the GPIO-based quadrature
encoder counter driver. The driver reads A/B quadrature signals and
an optional index pulse via edge-triggered GPIO interrupts, supporting
X1, X2, X4 quadrature decoding and pulse-direction mode.

This is useful on SoCs that lack a dedicated hardware quadrature
decoder or where the encoder is wired to generic GPIO pins.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 .../counter/gpio-quadrature-encoder.yaml      | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml

diff --git a/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml b/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
new file mode 100644
index 000000000..a52deaab6
--- /dev/null
+++ b/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/counter/gpio-quadrature-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO-based Quadrature Encoder
+
+maintainers:
+  - Wadim Mueller <wadim.mueller@cmblu.de>
+
+description: |
+  A generic GPIO-based quadrature encoder counter.  Reads A/B quadrature
+  signals and an optional index pulse via edge-triggered GPIO interrupts.
+  Supports X1, X2, X4 quadrature decoding and pulse-direction mode.
+
+  This driver is useful on SoCs that lack a dedicated hardware quadrature
+  decoder (eQEP, QEI, etc.) or where the encoder is wired to generic GPIO
+  pins rather than to a dedicated peripheral.
+
+properties:
+  compatible:
+    const: gpio-quadrature-encoder
+
+  encoder-a-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the encoder's A (phase A) output.
+
+  encoder-b-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the encoder's B (phase B) output.
+
+  encoder-index-gpios:
+    maxItems: 1
+    description:
+      Optional GPIO connected to the encoder's index (Z) output.
+      When the index input is enabled via sysfs, the count resets
+      to zero on each index pulse.
+
+required:
+  - compatible
+  - encoder-a-gpios
+  - encoder-b-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    quadrature-encoder-0 {
+        compatible = "gpio-quadrature-encoder";
+        encoder-a-gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
+        encoder-b-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    quadrature-encoder-1 {
+        compatible = "gpio-quadrature-encoder";
+        encoder-a-gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
+        encoder-b-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+        encoder-index-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+    };
+
+...
-- 
2.52.0

