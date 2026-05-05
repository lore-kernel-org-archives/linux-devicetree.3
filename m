Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DCB26C385
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976810; cv=none; b=kSUiLr3/BnL1kzSGLlmqmRT8Xoynlkgo+3tKSeFfV7q/Mrjqg3aQAc5X2y2W7PZrD7UHDcjjo3ip4aLzPV2DAT0VJbtRiVW9cn+uYdj+yt12j23paZEEWcDhD06+S6rqjI89aXSmeRSdnyJ08W3mo+jMMeOdGZun9gK5M7/r/us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976810; c=relaxed/simple;
	bh=BNQcmIUcI/sLEEdMaIwi95O/OjrcePYCPJrqUygwTgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mh+56t+C0za9NPLsO/CkaJ7+/W2kxdY1DO6i3OXWELqaEjke2siQtMrWX9dpR1tNOXS7i7eJ+qTosqHAppDbKIbfqXn7kLlRcAXkZ4B8zYD5Snd7mJl0upzoNEw3Vmh7t7CZBwHCSh8Ru0hXLJu4kQ1McybF8/Se4Dc7Un9vK/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIXQOwu7; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIXQOwu7"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36523acb0c1so1377373a91.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777976809; x=1778581609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jtWi+BJEmMiKBLc81hfsFIIWmO6WhR/hALIJ9C45EQ=;
        b=dIXQOwu7zB1tEJgWSyY4KD5pxGYKtakygcC21CgTB5itCV4q+2IX0yhPNTZ5HaJVZH
         BCb0rN2NCqdRaFkcAz3aNOV6jUHanm6PzmuloxueQ9RHJarj1S5cXBBHzd0qrlNAvMSt
         IeUjEu0mOqslVPO4cuIlOi7J6lQ3JNl9yTyJkx5FKwyugp86keV3dsIz5Q4FM8PTUbJ5
         os7XFX6RuYhtHRX2K2d4VRhJ8dAnjvVexax9EqPQCzOl9+fkYmZKpMbprS8irAl8EQLE
         kTgx+0e8cecgFMKh16DDRem3D7LkwYn+ZEC1oQgue12eky+QpXno/GwJNqcr4G/QjEE+
         /HVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976809; x=1778581609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jtWi+BJEmMiKBLc81hfsFIIWmO6WhR/hALIJ9C45EQ=;
        b=Be0uro6u8D0vUHZ5GwQOG5MpupkVWf5TRYQDLJcv055AES36FwwI1+PHD0+xr7zfSP
         rtXQjcjgKXuT1DjnIpBVM3OpYqi/lN6oOighc7GpVKzPvKlWybkr7zi61dDT/u+GPrgP
         Ktec1rMtzTO8ML6pVWsicS1w2O0Zk4sg1wOeAoCo9KMyNGjBGtuI1PeyLHsAI+RZL/Kj
         Kx8JdhS/WD0CkLfWvL1mnUNwCea1GQudPkHx9Fk3/dYz9cC9vCth9OKzi026hVGa76UV
         jE8M0r1SXJuqCPh5fLfZU1Y3BJ60o08318T+nXLwdFGUjSyXzvivTSr+JWKGk7Vo0EOT
         H+kA==
X-Forwarded-Encrypted: i=1; AFNElJ+N8eDvKvhVxfzUTKrt45ILv2VKwNHH02YNvZo3edBDWXbDkC3YUoer369qeEimrOF1MbIEcprnnOjV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Jjj+BI8bBmGjmbJG4nVI6ViQC4P1QeCfIp97rPJ76OzWs3fT
	tnOXbB/lX+swztn7mkpgdlOjZ06+XG4QZQP8xHHnOSdsWICBfboZ4+tH
X-Gm-Gg: AeBDietURxQAZ9l9y24YutBpgVHaXaN5b0zzEA5T5eA2REgVpGN97TkqOj5IjxUA/kg
	An8g+H/yzsu4+gE4ukwajA4fnYczK1uR+OAHElvXmJJsEm7bD1jp8QY1897a23+HW3GzPlqRzyG
	1b1qEBDJALLavHMYAtS+0PM89AVVsV6kBEnEyDX29HF1uqreKEi5SUWudQDco8+vKig/Im+uv6Y
	J2Q5LSfxNw/kpGHpdhlon8TjLP/pf9c57wVE3VoRDMMmJrPTyhNmTNJPtbthlAl3VzkZ68riZyh
	HLt9TivZvRJMxPF1K54BJ5xHumoxW1qfdT5t1fz2Dn5dGBEkoNXPuHWLK8+WlSv7rciiKa/xmoK
	VY41TS0PerFK/B1S8b+3I/uki8SXyWiNb+5R65SbTgRTFrpYGww7hn6kI1fcBdeV61QkWhxlEZv
	WDC/gnqUvL3Qqv6WNSGpz/AwX4SrSCrLk4yjmJK3QA2vRVpfF4AevFvc9+AmQbhBwdZGPaT+Fpy
	7C73WKdAQk=
X-Received: by 2002:a17:90b:53c3:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-365774d3260mr2619605a91.23.1777976808405;
        Tue, 05 May 2026 03:26:48 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00ad4dsm18983102a91.11.2026.05.05.03.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:26:48 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: andi.shyti@kernel.org,
	wsa@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH] dt-bindings: i2c: convert davinci i2c to dt-schema
Date: Tue,  5 May 2026 15:56:26 +0530
Message-ID: <20260505102626.5726-1-chaitanya.msabnis@gmail.com>
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
---
 .../devicetree/bindings/i2c/i2c-davinci.txt   | 43 -------------
 .../bindings/i2c/ti,davinci-i2c.yaml          | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 43 deletions(-)
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
index 000000000000..89c639d023a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ti,davinci-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DaVinci/Keystone I2C
+
+maintainers:
+  - Chaitanya Sabnis <chaitanya.msabni@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
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
-- 
2.43.0

