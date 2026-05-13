Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980A40DFD9
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675927; cv=none; b=iAWU8LB4r3Rcpc1aEpkD0ubWQjm+Cyl4RJpVpcd7UKlry0z8XS98e4QMakKDAo0D3JFQEIuV3Impy4uDB1F6eIRlAJ9NJ0mbbZS/toLS0LwUz0ELlUZP7D4PQOfxZx2EdHaQZN8tj+99tLfsXLcv5An97GiNJpNY5px4D9lmkV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675927; c=relaxed/simple;
	bh=b2OlSn4WF3y8/RSQ+iOs3GW/MpfGun75gYUek5/CNxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d7DQOMLuVkaVBmtsj76L6lk/8JOcYBDxrLIONegEZC9jzzot3TIEImdrpru3v+RJ2izzirURD2+N6u/wLu072d7a65dYwzcoXgt0xY7+/y7ppVzRzsJoxx7yvNs2b3FKafPoPq0lvySPg27lqC0wmWB3VjOrM5m9OgLNDc9GP+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKAtzWcM; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKAtzWcM"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c80227c9572so3101113a12.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778675925; x=1779280725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jqvBXeJXJh63I38FnftbeguVo8Usv6dqi6l9cFjldQU=;
        b=YKAtzWcMBx0PU+tddvQCvbC0xrsAsf/x0TbMFjLIcIuaOvylpVP8XIxc/uf2g67Q2d
         oYZIx5/61hobSyThUmB5/dxTtDwx3cOZuLRD/aYukPegBTYMRynn1EIOUhYnm5De44k1
         WDKNk0KReZ6EjEuD0OTjmAwZih4Bx2rT3SebuXA+AbK6SDb2Yri72SOC7vBRNB2aoqwU
         OdXRu8uB6So549tEaeDwdsmJHS7E6OSgIDXoO/gRsa8dC+ficOJXTr5y6akJb06liq8u
         LKGAx1OBHyx6opFYp9IHAnF8P5tS9GG5B1cy6vvoTsBOoILi9irnODnsa7AseQoqWeBV
         4NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675925; x=1779280725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqvBXeJXJh63I38FnftbeguVo8Usv6dqi6l9cFjldQU=;
        b=ActEjJPibUra5V+XsV3fZzlacrzslcVVjVEvOUgilT1TZkJkD2Xc2XPLNmpUz3UqGL
         ffS2GPVJDF9gewZjywo71LVtDBA1xK6jQSfMfNg1DkQf/0K7Upb5N6lP7TBKRUsAIrE/
         sKjW2/RxgOUjIhlgTy+D1zpJ0mAWRkw2CYbzzBHRkq+XuQ8pGh5SMYjckYrh03vFeokt
         jqOP4bkzDOa0GPkgnigGKwwavVmbzWgI7tHnJ1H9SxnKFJuYo4X4HuFi5dWYuYpQFOx3
         AZVkGqgC6Yroj21xAej/Q7rqRaSplTfqVa5IMOBwAEpEAIpsEAPPQZ8ul/vuq1Sl9zcO
         yh8A==
X-Forwarded-Encrypted: i=1; AFNElJ/h71h/1Icv7x7Z9wTXZV6MKwTZEGEygIMnUHuFqxyCewDIfLQ7GqlpwPQNJq9VvBIZrLeKM0YtLAT2@vger.kernel.org
X-Gm-Message-State: AOJu0YxHyJnP104VTZLRn7pC47Ax/ovyxxFRaOXly6n93AyuSOy2ZMWB
	/KVc89QKVQCwqWsaKft1FtPLkqPSrguUWAXdGaR7KsLiSHICSQxbLoi1
X-Gm-Gg: Acq92OHRwL7oQY+pn+CYXVPyo0rij6qAkb1v9RHkWJEZQ4ZE3LZDVPYmvO7DwuKMHmF
	/sNyOkgSbwk4N6HFo30BnvkgIETyovminkRnfnBjCTxHOH/0M3slMKHuUS/3fb4pWDfS0fTy6z6
	InGTLaPF9tRl4ONf/DI3+EfXJF+PK/ZfsvfnlhxjnMSQPLvosL8VdAkt3rba5isAj0q5d0QtaFs
	LVLy6ncR+PVDqHtCvULSmaDAJ4tciHuirtE9m9a/IR/Q3PqlScPgOz1gqxh802L6w4zZq8S27Ut
	MBK1QAuq418VVOmen3gK7fWL4h60i4kxZeZIY+DkukV79DdG/avUNQiWNhxxslLpdFd9paECu62
	VSp8y6EtdKKN55TkanegFvAjg8b3FV8Bz15n6WjiB9m7rVXPkrWBeThwkVCgPtyUlt7o7JMFK0I
	KeVoKy5KCXXYA5E29gg4UB7/2N05+LoJh+guXhjGsp032oxlvK8hDIhHcpzdzAfvKKnzCNyMsI
X-Received: by 2002:a05:6a20:2454:b0:398:b178:a53f with SMTP id adf61e73a8af0-3afb001eb6fmr3057937637.40.1778675924611;
        Wed, 13 May 2026 05:38:44 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688fe2sm19800776a12.9.2026.05.13.05.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:38:44 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	brgl@kernel.org,
	bartosz.golaszewski@oss.qualcomm.com
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH v4] dt-bindings: i2c: convert davinci i2c to dt-schema
Date: Wed, 13 May 2026 18:07:57 +0530
Message-ID: <20260513123758.4955-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments DaVinci and Keystone I2C controller
bindings from legacy text format to modern dt-schema (YAML).

During the conversion, the `interrupts` property was made required
to match the strict requirement in the driver probe function. The
custom `ti,has-pfunc` and `power-domains` properties were also
properly defined to match SoC-specific hardware features.

Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v4:
- Added conditional allOf block to enforce power-domains requirement for ti,keystone-i2c compatible.
- Dropped automated bot tags from commit message per maintainer feedback.

Changes in v3:
- Fixed a typo in the author's email address within the YAML maintainers block.

Changes in v2:
- Updated MAINTAINERS file to point to the new ti,davinci-i2c.yaml file instead of the deleted .txt file.

 .../devicetree/bindings/i2c/i2c-davinci.txt   | 43 ------------
 .../bindings/i2c/ti,davinci-i2c.yaml          | 70 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 71 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-davinci.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt b/Documentation/devicetree/bindings/i2c/i2c-davinci.txt
deleted file mode 100644
index 6590501c53d4..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-* Texas Instruments Davinci/Keystone I2C
-
-This file provides information, what the device node for the
-davinci/keystone i2c interface contains.
-
-Required properties:
-- compatible: "ti,davinci-i2c" or "ti,keystone-i2c";
-- reg : Offset and length of the register set for the device
-- clocks: I2C functional clock phandle.
-	  For 66AK2G this property should be set per binding,
-	  Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
-
-SoC-specific Required Properties:
-
-The following are mandatory properties for Keystone 2 66AK2G SoCs only:
-
-- power-domains:	Should contain a phandle to a PM domain provider node
-			and an args specifier containing the I2C device id
-			value. This property is as per the binding,
-			Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
-
-Recommended properties :
-- interrupts : standard interrupt property.
-- clock-frequency : desired I2C bus clock frequency in Hz.
-- ti,has-pfunc: boolean; if defined, it indicates that SoC supports PFUNC
-	registers. PFUNC registers allow to switch I2C pins to function as
-	GPIOs, so they can be toggled manually.
-
-Example (enbw_cmc board):
-	i2c@1c22000 {
-		compatible = "ti,davinci-i2c";
-		reg = <0x22000 0x1000>;
-		clock-frequency = <100000>;
-		interrupts = <15>;
-		interrupt-parent = <&intc>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dtt@48 {
-			compatible = "national,lm75";
-			reg = <0x48>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
new file mode 100644
index 000000000000..b94ac06dce36
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ti,davinci-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DaVinci/Keystone I2C
+
+maintainers:
+  - Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,keystone-i2c
+    then:
+      required:
+        - power-domains
+
+properties:
+  compatible:
+    enum:
+      - ti,davinci-i2c
+      - ti,keystone-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ti,has-pfunc:
+    description:
+      Indicates that the SoC supports PFUNC registers, allowing I2C pins 
+      to function as GPIOs for manual toggling.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@1c22000 {
+        compatible = "ti,davinci-i2c";
+        reg = <0x01c22000 0x1000>;
+        clocks = <&i2c_clk>;
+        clock-frequency = <100000>;
+        interrupts = <15>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@48 {
+            compatible = "national,lm75";
+            reg = <0x48>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index bc3bcc641663..50a11a8d71a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26396,7 +26396,7 @@ M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
-F:	Documentation/devicetree/bindings/i2c/i2c-davinci.txt
+F:	Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
 F:	arch/arm/boot/dts/ti/davinci/
 F:	arch/arm/mach-davinci/
 F:	drivers/i2c/busses/i2c-davinci.c
-- 
2.43.0

