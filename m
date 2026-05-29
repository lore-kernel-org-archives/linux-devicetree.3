Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D41E373C1D
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033368; cv=none; b=qHDdrwZn6lu5gXSckMpe6eHVaQ4kgAn2ZJb0ca9vv3WhnLw9HRlG4LXNEySgadOADK6N5yomOiToPP4mvCBmEupb8b56JME9kj0cSZzZePzI3pDKu6jc/7V15oUh0ok/Vpz2teKjefdG46lR3R/Y+JsSL7AdFYpX98fHWvpyzw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033368; c=relaxed/simple;
	bh=bGpViLgDOuMg6X8rxZCJcFHPh8n5Qjq62mIqTNLO9v8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gZzfui6T7s7gQJeHOct/s5zKbS3t63mSGWXDos2Y+JbtOIuL1pX3pmob+SPxoLXg82JDR/XltCNBRBgkqiNvDU2/rr9AmNGvuTJC8SSnHadQWCZXAkQX6pkJycxVkEXNqXkaydT15zfehybfVAjo41KoFK1v7UihR/0NL43NCT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaTuGJ5C; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaTuGJ5C"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36ab8816a35so3253814a91.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 22:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780033366; x=1780638166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOwMbh24jrEy6yAB6LutdCHaAtEQQQizVVpWOUlxRRA=;
        b=TaTuGJ5C13bmJOCfmx6RjcjTuDgVrP6IEUbW/DeLKi8ZV+0/t8ikzsDUkJ0gNHSD86
         +rrGFwLHXFw8y3V7Byu5GUOFKls9Grz2F3Cz7jqhNn2lLoC3ziNLQGWxsC+47CjlH7EM
         ZVdEhhviFwH125xAA+EPrbhUm2qjjq1k3JBHDSZRJ2hu9342zcbpTFeDvKGtvppCgdMn
         qbP3VEH2EniUN/UDjeGxuXXM6LfM/YaORRPAbzCaA464tvIoKBTBHB+JmUeYpa32EgFB
         bPt/G/fvguOQuO74F7+NeCN/sXz8WMPhHZSMmPShdQq85+RYw2ovfUuJMPXJXIbaKwVB
         QEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780033366; x=1780638166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mOwMbh24jrEy6yAB6LutdCHaAtEQQQizVVpWOUlxRRA=;
        b=jShKDbp5KRLqiNEl1f7Ak1bJR5oo0JODqTqjdwGYNEjMRcHmXP1LwgIdlVPC8ycbWp
         n4v01JlSfO3+nsmmc/g4OHu/vp1e+OUgbjvDwS7IHdtrnnCOeiHnzj29QJdKKH7A16Ur
         obWEdg0z94fxqrdmr37+JI3aNUHeQLTVbPB0EPx1kQ54kHNDOk3s3wFyMXxvBOeJlCZw
         ERczwpu02xQZBmpo2n12POK5CkUBOuVPAtrw2ihJwxakrituPiVtuLJSiaiu4/5JeOzS
         132xqX/9P3/IvKhuVxEGQLmvzgcB1xhy1PYROl9X33ENZKmT3J830p30DVCy7YG2WAFn
         Sj5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9CWgC0Mia84qgb2nlUI8E3kUL6wS5Cl6H0sLfel//3BQeJ2oeB1Cu4c1HRgmhVU9BbyF/UygPjUWYO@vger.kernel.org
X-Gm-Message-State: AOJu0YzqMD2FIfG1ZfYnaazb7REG6crDHiquA9K7teVA1+n9lOki3RyB
	1IY003+oOG0pG2YCp/0d5KFEryKPDDVy0kpcej/RjuxRHeD3aAGE7IwIw4RB+A==
X-Gm-Gg: Acq92OFtA6/FfxkoRixA/fjilb0Z0moTZpqI5+Idh8xhb0fJE/yFEoRtccfxS1jVbeQ
	AgNaT/gGcJHOyZA0pkfUrilCaKm5HUuyVZuJER23XYRtSCipfqTosDT/YS+NV32tVSlnC8MVC4t
	uE4SuXZJcunHRRU4Tw1089rbVKoCzl87k/cawFY/W1y/bl8l+vF/3RyvmRsa+fiF2+5awEtLjiP
	N7QzQoF89i4RVb6EEIabnSP8sxaZY02Cxxe+U/XeK5bhJdOHJ3IUtkRtYUpgLPV9MhD6KcocZXQ
	9Wb+ObsyE7elSzO+KvL7aNlpuWI37HrHG3gvs0eipoc48J8zW6ZWcYTLTPfrj/wa6kAXNl19ssC
	TRUtTUYSYnODTFidrV026kxbFk830pJs7nCvs77QmL67Ke08BN19hohINKRgde1348MJC9kYjvz
	v0cMVJAQ/99Q7AB0o8KQ87IyOmgH9SnIbAIr4+IACeFjJ9jA6EyRlZ/QTD
X-Received: by 2002:a17:90b:3fd0:b0:36a:35df:769c with SMTP id 98e67ed59e1d1-36bbcd9161emr1595513a91.15.1780033366405;
        Thu, 28 May 2026 22:42:46 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:93ae:ce9d:fecf:bae0:f194:40fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6bc0b2fsm578157a91.17.2026.05.28.22.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:42:46 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720/XDP730
Date: Fri, 29 May 2026 11:12:17 +0530
Message-Id: <20260529054218.5184-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260529054218.5184-1-Ashish.Yadav@infineon.com>
References: <20260529054218.5184-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP720/XDP730
eFuse Controllers.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 59 --------------
 .../bindings/hwmon/pmbus/infineon,xdp730.yaml | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
deleted file mode 100644
index 72bc3a5e7139..000000000000
--- a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
+++ /dev/null
@@ -1,59 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-
-$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Infineon XDP720 Digital eFuse Controller
-
-maintainers:
-  - Ashish Yadav <ashish.yadav@infineon.com>
-
-description: |
-  The XDP720 is an eFuse with integrated current sensor and digital
-  controller. It provides accurate system telemetry (V, I, P, T) and
-  reports analog current at the IMON pin for post-processing.
-
-  Datasheet:
-     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
-
-properties:
-  compatible:
-    enum:
-      - infineon,xdp720
-
-  reg:
-    maxItems: 1
-
-  infineon,rimon-micro-ohms:
-    description:
-      The value of the RIMON resistor, in micro ohms, required to enable
-      the system overcurrent protection.
-
-  vdd-vin-supply:
-    description:
-      Supply for the VDD_VIN pin (pin 9), the IC controller power supply.
-      Typically connected to the input bus (VIN) through a 100 ohm / 100 nF
-      RC filter.
-
-required:
-  - compatible
-  - reg
-  - vdd-vin-supply
-
-additionalProperties: false
-
-examples:
-  - |
-    i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        hwmon@11 {
-            compatible = "infineon,xdp720";
-            reg = <0x11>;
-            vdd-vin-supply = <&vdd_vin>;
-            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
-        };
-    };
diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
new file mode 100644
index 000000000000..fdbc577bccdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp730.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon XDP720 / XDP730 Digital eFuse Controllers
+
+maintainers:
+  - Ashish Yadav <ashish.yadav@infineon.com>
+
+description: |
+  The XDP720 and XDP730 are PMBus-compliant digital eFuse controllers
+  with an integrated current sensor.  They provide accurate system
+  telemetry (V, I, P, T) and report analog current at the IMON pin for
+  post-processing.
+
+  Both parts share the same PMBus register map and direct-format
+  coefficients; they differ in the GIMON gain step exposed via the
+  TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
+  (XDP720: pin 9, XDP730: pin 20).
+
+  Datasheets:
+    - XDP720: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
+    - XDP730: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf
+
+properties:
+  compatible:
+    enum:
+      - infineon,xdp720
+      - infineon,xdp730
+
+  reg:
+    maxItems: 1
+
+  infineon,rimon-micro-ohms:
+    description:
+      The value of the RIMON resistor, in micro ohms, required to enable
+      the system overcurrent protection.
+
+  vdd-vin-supply:
+    description:
+      Supply for the VDD_VIN pin (XDP720 pin 9, XDP730 pin 20), the IC
+      controller power supply.  Typically connected to the input bus
+      (VIN) through a 100 ohm / 100 nF RC filter.
+
+required:
+  - compatible
+  - reg
+  - vdd-vin-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        efuse@11 {
+            compatible = "infineon,xdp720";
+            reg = <0x11>;
+            vdd-vin-supply = <&vdd_vin>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        efuse@12 {
+            compatible = "infineon,xdp730";
+            reg = <0x12>;
+            vdd-vin-supply = <&vdd_vin>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
-- 
2.39.5

