Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820F13E1204
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 19:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946284; cv=none; b=BhFhY+gK3KnnkvwvQFP5cgTXvoFPz8H8EKIaQE8IeuiUfVl4hIwxBT6HnXha4RJPBOJi+dmxd5CcuMn3PRQMGVmAUtwk7cppwOBHlTPt+qZILRN0XaDTj+1qV3QeSrFJ3ZjqjIIeQvO14bonqgny4haYapf8nCCmrB9soi91utI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946284; c=relaxed/simple;
	bh=j50omREjNPnkIZ2Q/S1IZiVP0CjCo0xozY68eQEpOZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ErzfWx2hAxYUCU3lNMKJMBaZJcEn1mG+TqbN57qpg0Q4STW8mUC59fzaz+Ey5Hl9rt0AkTetJ22G8CHBTSyP/fIvOZ/HtnY0xCSUeloPNKt38TUIkrJPU076qBuaNFGcD2xDmyQvwemjth2suBwff4d/cGse/SLUWTjLNws/Rkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=VO5+a/X/; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="VO5+a/X/"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137335bc3caso5737732c88.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 12:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1780946281; x=1781551081; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SpBt+3akFBCUF5Ott3wYRAj9ArzdqAatXrQaEYGn4U=;
        b=VO5+a/X/hD04380qkcdBUp4cGA5iX4tBZcCqqFR9DfF4MhfCyCBAfXTRNwxsOVx6O5
         tIc7wQFHFNORGQmWHYi8gCmi8o/TnW4EaBwTq5DroSlTK+a4YW1pTCcDaST/xfoxVv5W
         A+RVIbQt5CS4B5oAGQvF9n1YLAfP8tLEv1fMOAx/z8gqnWnqpuLB/D898jrRGlqfoUu4
         VQKML6rYbGgt3gFtqpd7HUGGPG6t+dxKRinU85WAV57Z+53oZBFviICK8o7D4JNR59g5
         VlMWhpYMrTe9NHNKcABrAebXaYYe5UGYdRXxanw1jtJ/Of2/O5nNTHxAxp7jVDMrd2jB
         sUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780946281; x=1781551081;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SpBt+3akFBCUF5Ott3wYRAj9ArzdqAatXrQaEYGn4U=;
        b=JKs7TYLULHj9tuMIWyAtJkUpE3vahKwB+1/WyJM6zUxLF9R4xbqccLzlYInQCCJExv
         KeAUm4FnafI9KWkIKt6cJ9Sd+BswzZxRBvYEd31tsvBU0yaAwXOmxB/kROdyp30ltLCo
         E+X21q10elL2EYOgBDBLTpeFbYTQG/TJi2XuTr6zrl5ptUYpRhKIFFYJj6/hL4K0OSju
         MiLLzXA9uQE6VLth6mhbV5LH3HTNumltzaRgtiFJMhzzVabGsxJc9wEgiPKZEN9GNgw5
         vqAyzePGg08T/R/9AAYfbKxRkDmS87+BP4Z4ADXARdJgNvyztGwEeYKFsDHdBQmvLlUQ
         SX/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+IBsxmHxo6I1cK641zY3arQu4mh+c038y4i0eaMeq+Y2rINGGbPjHjNittcuFF4o8WKF68ZSbL8dKe@vger.kernel.org
X-Gm-Message-State: AOJu0YwRbrql8NGeIN3OACbQbWVyOzeYcF+Mica/Ffw4/PrlJNMiUmgv
	kqVKQLO6HAJ79w+dLKrDkXQxUNN1PbWRlmM6g4rk3RWsYFWLUNl16TK9yjoBETk+ZNcxFxkFVw5
	AwsvR
X-Gm-Gg: Acq92OGj92qryVObz4wybF1zFHdRdoVq8mxflXCJbv4qCey+TwThTiGqRfoTU+ULUFE
	e/20tzfCmwT77XUCACujc4V3RUECiwngs6K1sbE82cWkS5LltThPtAwPUF86ptp/D55vTmNEDpt
	Bp069tJichA0MDDZX2N1TgLAPOaLQmnMGT4IaaVOxBio61vYEEI4Ftc6DB3oUnox1pxt6DMCLmY
	4d/gCDtQyu9IpmeSbqiXXWwwTyu3ptlxm4BR6r7wf1g5xFVKT+yOlypVMBtE8sS65zSIh7PpjvB
	v364o6pDVypHoy4MRnSaksUqY3AKmQXXLSARnpU9YKUXuaqpjrLT0WK6RNWQdFAb29rTcG0MFfp
	6xZb81a+UKrrwYqkQ2jl/JRb7i88nI/eZHizG7HfzgC/CfDGuAAk/GRkp844UrBcopeYI8724a0
	aWo+vbPdketlMn6Trfq1U43lDI+tpyj/vv+WfG
X-Received: by 2002:a05:693c:2d82:b0:2d9:f0b3:1d98 with SMTP id 5a478bee46e88-3077b25d0c5mr8589540eec.7.1780946281278;
        Mon, 08 Jun 2026 12:18:01 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db528dcsm21588602eec.3.2026.06.08.12.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 12:18:00 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 08 Jun 2026 12:17:39 -0700
Subject: [PATCH v2] dt-bindings: i2c: convert i2c-mux-reg to DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-i2c-mux-reg-base-bus-num-v2-1-776e313f213a@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAFIVJ2oC/42NTQqDMBBGryKz7pQY8a+r3qO4SOKoUzBKYsQi3
 r3GXqDLB+973w6eHJOHR7KDo5U9T/YEeUvADMr2hNyeDFLIQhSiRJYGx7Chox618oQ6eLRhxDK
 rKG91SXVt4JzPjjrervSr+bEP+k1mib1oDOyXyX2u7zWN3h83a4oCu7TOdK6qjlrztLQtwzTfF
 UNzHMcXpRIUF9MAAAA=
X-Change-ID: 20260607-i2c-mux-reg-base-bus-num-738e5db7e99c
To: Peter Rosin <peda@lysator.liu.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780946280; l=7015;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=j50omREjNPnkIZ2Q/S1IZiVP0CjCo0xozY68eQEpOZ8=;
 b=A6RZ522Dk4OYtp+A+tOPkBRwynLuRbuPcBT0xPmi5dR+6dfJqz7UhVzqayJNzEB473JC5UYEF
 57RoHu5KQZLAzR947KxfjZbFMigRGIy210apDzdoNi5a8G79V9+fgbX
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Convert Documentation/devicetree/bindings/i2c/i2c-mux-reg.txt to
the YAML schema so the i2c-mux-reg binding is validated by
dt_binding_check.  Faithful port of the existing properties; no
semantic change.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v2:
- Drop the new "base-bus-num" property and the matching driver
  patch.  The motivating use case (stable Linux bus numbers for
  DT i2c-mux children) is already covered by the i2c-core's
  of_alias_get_id() lookup; an aliases { i2cN = &mux_child; };
  entry in the platform DTS pins the same numbers without any
  new binding.  Thanks Conor for the hint.
- Drop the silabs,si5338 chip from the example, which has no
  schema and tripped dt_binding_check on v1.  The mux structure
  is the point of the example anyway.
- Link to v1: https://patch.msgid.link/20260607-i2c-mux-reg-base-bus-num-v1-0-f193b5a8fedc@nexthop.ai
---
 .../devicetree/bindings/i2c/i2c-mux-reg.txt        | 74 -----------------
 .../devicetree/bindings/i2c/i2c-mux-reg.yaml       | 92 ++++++++++++++++++++++
 2 files changed, 92 insertions(+), 74 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-reg.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-reg.txt
deleted file mode 100644
index b9d9755e4172..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-reg.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Register-based I2C Bus Mux
-
-This binding describes an I2C bus multiplexer that uses a single register
-to route the I2C signals.
-
-Required properties:
-- compatible: i2c-mux-reg
-- i2c-parent: The phandle of the I2C bus that this multiplexer's master-side
-  port is connected to.
-* Standard I2C mux properties. See i2c-mux.yaml in this directory.
-* I2C child bus nodes. See i2c-mux.yaml in this directory.
-
-Optional properties:
-- reg: this pair of <offset size> specifies the register to control the mux.
-  The <offset size> depends on its parent node. It can be any memory-mapped
-  address. The size must be either 1, 2, or 4 bytes. If reg is omitted, the
-  resource of this device will be used.
-- little-endian: The existence indicates the register is in little endian.
-- big-endian: The existence indicates the register is in big endian.
-  If both little-endian and big-endian are omitted, the endianness of the
-  CPU will be used.
-- write-only: The existence indicates the register is write-only.
-- idle-state: value to set the muxer to when idle. When no value is
-  given, it defaults to the last value used.
-
-Whenever an access is made to a device on a child bus, the value set
-in the relevant node's reg property will be output to the register.
-
-If an idle state is defined, using the idle-state (optional) property,
-whenever an access is not being made to a device on a child bus, the
-register will be set according to the idle value.
-
-If an idle state is not defined, the most recently used value will be
-left programmed into the register.
-
-Example of a mux on PCIe card, the host is a powerpc SoC (big endian):
-
-	i2c-mux {
-		/* the <offset size> depends on the address translation
-		 * of the parent device. If omitted, device resource
-		 * will be used instead. The size is to determine
-		 * whether iowrite32, iowrite16, or iowrite8 will be used.
-		 */
-		reg = <0x6028 0x4>;
-		little-endian;		/* little endian register on PCIe */
-		compatible = "i2c-mux-reg";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		i2c-parent = <&i2c1>;
-		i2c@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			si5338: clock-generator@70 {
-				compatible = "silabs,si5338";
-				reg = <0x70>;
-				/* other stuff */
-			};
-		};
-
-		i2c@1 {
-			/* data is written using iowrite32 */
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			si5338: clock-generator@70 {
-				compatible = "silabs,si5338";
-				reg = <0x70>;
-				/* other stuff */
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-reg.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-reg.yaml
new file mode 100644
index 000000000000..01ade0771c60
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-reg.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mux-reg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Register-based I2C Bus Mux
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+description: |
+  This binding describes an I2C bus multiplexer that uses a single
+  memory-mapped register to route the I2C signals.
+
+  Whenever an access is made to a device on a child bus, the value
+  set in the relevant node's reg property is output to the register.
+
+  If an idle state is defined via the idle-state property, the
+  register is set to that value whenever no access is being made.
+  Otherwise the most recently used value is left programmed.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-mux.yaml#
+
+properties:
+  compatible:
+    const: i2c-mux-reg
+
+  reg:
+    maxItems: 1
+    description: |
+      Offset and size of the register that selects the active child
+      bus, relative to the parent node's address space. The size
+      determines the access width and must be 1, 2, or 4 bytes. If
+      omitted, the platform device's own memory resource is used
+      instead.
+
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the I2C bus that this multiplexer's master-side port
+      is connected to.
+
+  little-endian:
+    type: boolean
+    description: Register is accessed in little-endian byte order.
+
+  big-endian:
+    type: boolean
+    description: Register is accessed in big-endian byte order.
+
+  write-only:
+    type: boolean
+    description:
+      Register is write-only; the driver must not read back the
+      current selection.
+
+  idle-state:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value to write to the register when no child bus is selected.
+
+required:
+  - compatible
+  - i2c-parent
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c-mux@6028 {
+        compatible = "i2c-mux-reg";
+        reg = <0x6028 0x4>;
+        little-endian;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        i2c-parent = <&i2c1>;
+
+        i2c@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+
+        i2c@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+...

---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20260607-i2c-mux-reg-base-bus-num-738e5db7e99c

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

