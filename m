Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B867259E33D
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 18:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892467; cv=none; b=ZT6Ma5SK8hokZcEQa+NXrE9+vHlPSeztevqsu2hUweazmdWqcZqkyzTy/KrWL6VZkXb3x95bhGKKVOLQNp+Qzmw4IgoiY0iN8YTlUtRwWylvZGcj7oshTG3KMB/r/YTfOn+9JQq+l2JE5hL0Yf3HYpx9GGJBzuiyirh6p89KNM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892467; c=relaxed/simple;
	bh=yMIqHAyYFGtS2eBd0WBVHOU4tQ7yI35DjGOHB3lvWEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlQo+XmslwFkqqko1N6rq7VRZBmrrtZDaLF9O4fMP8cHAsKYw0gDXSc486+BT6j478SAo1x6+780oROPYYoQEuNN2Q6OjWomu+mCtxLK7dEMyl+etMmzxx9+e+8ryve+3uIfwWTei/8BJkcrQA51uZcR9lIQ+eUL2HWbb7pumCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNaNuL8f; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNaNuL8f"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8687630fso42507275e9.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892457; x=1789497257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRuj29Ji4lepfajyUf6OsbyzRBUwpagoj3OZk9BKOfQ=;
        b=rNaNuL8f6E6kKRL5HP186VbzBYBgRyTR4LhaxrREJLNkjfP7uRv2301sBpO+G1DGE3
         sAR2MKhOc6ue4gOTa3o30oUtAn2C7F3AsPvTtAh9ykSBvBKKSRQcxc/iicL9d9p5xrTR
         qGT/BTofCLLISlGSMokNIIVsPb7+Bcar12tUqWNH55bBB/T+OU6uWufUX20eWMa6uo3X
         1710F5zeE47H38y0FSkiltdmOuN9AjOS2glr+KQ6JVYgaCECqTlYIsoldTUF5wniO/ZT
         GagHlifgM6Wa5Y5ybqdo9bDA0y63/GwlW0jX5v/T74QEjugzTpgtVYO04JijomluahMp
         Lv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892457; x=1789497257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HRuj29Ji4lepfajyUf6OsbyzRBUwpagoj3OZk9BKOfQ=;
        b=Zng3u8LYc6ZB9H4gQabEQerq2sg0wDq19blFXYU6wP4COk9GoU4m4nLf8iPnrHfJtV
         QFFRnE20AecIOi8wee/1q3jjhe281wZ/y4kp95FHT7D0iu0eN8VpHpw1rGQU7cauoKTw
         6gYE5IiyrjmnH48eCF8XsvsMudpYbhTiCHnwyESpLXeRSXz5XUHBcQ4F4qfZiMxvhF4D
         0XY5wvxNt5zPM+UOyrLwAxEYvjRow+bZ9loPGB3WYxyjmdl42GttndCl9i4kgrQI6I63
         ukkEQ4sV81tnwP6qGgy8vXrNK9KSZ0O7oYHwAZ10PDa57hpLrDoa7CTyHAh+mEyfFxbt
         Efpg==
X-Forwarded-Encrypted: i=1; AKwUvBwe0P8hNd0F3RtitPv2y00SHj/6yhbMQZvuwyQXls5Ig7mlbjIjPjc3jaPQaO6kpg4CyYXghwQqv/2e@vger.kernel.org
X-Gm-Message-State: AFuF++kdELdK71eAkCDYxsFaQuEhfKk+W4Tqvy1f+HXNkHgGlkWSiAN/
	KQVc9IpeL9LlrUmcsDj8cZvDQHWQzqUcUmEdsYePYtl8NXZkASHZpSdD
X-Gm-Gg: AYBFou2/peyVbp2/uZHkChF276nZcgRXKblo6RfufnGWJRKU2ls0BvQQsV9OhKkIprk
	iuhSi5MdnXPAEYxr1p9fPVZxtuaXzRBojLIKqPvJ8kCCrwFF3LYs+UTKJVm6QecChFtAKTPKlm3
	TVMk+F3N/O+xw+2MjNlKx4/59b0mOv0hdPDJRWNpOrCH6sE3SK26fzunguY8Fydfp7YvtMmoyPi
	tb1Xq5SAihBRofKzngT1bQb78gFiM3dGCjQbqT/BiUUImUjqGaz+AvDJAUwUz+m8fuSlHEw83Pm
	BH9TwwHcbJjuUZRkpzch5r9jtqGsytawXfQoQFEMe5Rh32uAxNIxDK3prqQbnRrwyw07+hmljBF
	dYdBYEcfLKqhykP3Uik7NPSS308kKzLwgqQ4ykt+6B4iOhj0eU6/qmlvqElcxzqeVsNrLhwzJmX
	as5kEEuNzQ/hBij/A/8rR524/RLaQ5mKJvM7XQEj3l+V0uoL7rWT8viTuNfdoMRoEWS4zmbyjmk
	xM7rsnmS3ljUjZnjdjwo2VQOv+DF3J7
X-Received: by 2002:a05:600c:474c:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49cf828cd70mr287272355e9.16.1788892456722;
        Tue, 08 Sep 2026 11:34:16 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm312095435e9.0.2026.09.08.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:16 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
Date: Tue,  8 Sep 2026 20:34:02 +0200
Message-ID: <20260908183403.2107-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908183403.2107-1-okerixx@gmail.com>
References: <20260908183403.2107-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
address 0x70 and is distinct from the Qualcomm reference EC that the
reference designs place at 0x76.

Signed-off-by: Oleg Keri <okerixx@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../lenovo,yoga-slim7x-gen11-ec.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
new file mode 100644
index 000000000000..37337de86b0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Yoga Slim 7x Gen 11 Embedded Controller
+
+maintainers:
+  - Oleg Keri <okerixx@gmail.com>
+
+description:
+  The Lenovo Yoga Slim 7x Gen 11, a Qualcomm Snapdragon X2 Elite (glymur)
+  laptop, has a Compal embedded controller on I2C. It reports board
+  thermistors, battery cell voltages and CPU fan speed, and drives the
+  keyboard backlight.
+
+  This controller is not the Qualcomm reference EC that the Snapdragon
+  reference designs place at address 0x76; it speaks a different command
+  set and answers at 0x70.
+
+properties:
+  compatible:
+    const: lenovo,yoga-slim7x-gen11-ec
+
+  reg:
+    const: 0x70
+
+  interrupts:
+    maxItems: 1
+    description:
+      The controller pulses this line while it has events queued.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@70 {
+            compatible = "lenovo,yoga-slim7x-gen11-ec";
+            reg = <0x70>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 38612eca2987..e35679264e22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14882,6 +14882,14 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 F:	drivers/platform/x86/lenovo/yb9-kbdock.c
 
+LENOVO YOGA SLIM 7X GEN 11 EMBEDDED CONTROLLER DRIVER
+M:	Oleg Keri <okerixx@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
+F:	Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
+F:	drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
-- 
2.55.0

