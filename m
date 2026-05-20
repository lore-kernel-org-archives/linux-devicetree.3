Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9EB2ED843
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245516; cv=none; b=O0TJUzKYcgZSKB45ywZZOLLuBva4AD76BbjYccKjrpC0vaYTtOqPR/vCJBLCHsrH79xOUi0bcDIce/zS4tMFBF1GZwp3HCIHcrpGY0xdHJg9X9i+e0zGWjQ0jeZ1MpfwbuoM4iI7Y/pmx53tPnfZkD707xR9v3zTp8TNXQmCYxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245516; c=relaxed/simple;
	bh=IfW1mk1oO65qfqGh1XWmKHmZoIBL9vQ6FHuE2MESpaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jd2pshplZLz/n5M8ROJdCwuPu2ECK6PWJ6ZcN0j/nYY2Aqbyf/3pS3OBo+OrNGGMOEJoLKR09CMOWL2APRLkrFK9POqg7egdwMxAagnAHPHl0U9gJEB3wIWmHx1sbJz4LX57IqOiobOQPyDQQHGPzDjoax1j6T8YegqodBAQZMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HY4atRlT; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY4atRlT"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3664df32e91so4559013a91.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779245513; x=1779850313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jx43HXyXFoFdaLMUvboXe6TnzGo/7OAUQHqaJ3dkRtk=;
        b=HY4atRlTShWO9Nn4DbMBDCbKUe/Dq7YugjKhWI9HrqZ1KkSo5PhuelF3ZoNMaVwjqp
         yiZwwqZ5kpUyk45a3IWvTpPUJk3IMZ4wd3RtzNZPAO0MKx2k0c8hc165mPvh3TMD56Z4
         KUUaHvLnc3bPOHfiKIP2GMi+iodNt03NwFBcYe3KmaYSj5YrRTsBNFdaHa7ySLNmqnQQ
         uU3dy5KkAhJbcieBtuNyueXUrVCBDTASWSAIsZ7KWmV0XOtSY2BSvBHi0mjM8B0ibWJG
         fuph15BkPVrkCnQQScBCDYaJbK2ixrkAmq3N+NiwEnVjLmPwEhuBNLZRtAc4MFkF+9/P
         dlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779245513; x=1779850313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx43HXyXFoFdaLMUvboXe6TnzGo/7OAUQHqaJ3dkRtk=;
        b=ZSjLuxT3hrrUeOCo4o+QTjrDRt7nto14sM4J7IVv5/fvJnPKh04SxP7HCQKENPfvh4
         7HTK+FNIBiUMQM5VIXgq7QZYKFoykgTdtW5tO6tgx/voyjJH7DscuFiRzCql05RIUAGP
         8B9GLayxlGeid9piyt43WnpgzsJdQi75OoEd+HA6jFkDHwFnUgTseQ4rUqo54WCkTx/a
         i9RKarEE7ViRzgUs2PnmI8OMOjY4MImdThJutaWYtgh4tkMiKHMfId5BpvPttFGGe0S6
         IYdm60mNIil00qNpLDDPzpag13fPO9oHfcrgOTSTzpuDGYKYdkkvpm5d96WPc5csT5DC
         DPvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WbuEP+A9EPkGUYUpWdJd5ygexA/Vk3Yt/sFcmChLeGlWKl5BA2ytaaUThxnBgk5yxLtf8K7r4QDh3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92mZDv3ZhpNmu4Ewy1Gl6Z5Am7xdYEEx8vwCRb171hQkKCBND
	6JC7OQUl+oaBk/Qaba8UsHRwFp4fwHUW+18/dKdgx7PPtDSU3pphLgrO
X-Gm-Gg: Acq92OH2NW2ZS5lI1aDlJxtPZ0cd2jOnc4LYmvqsUtIL7Xfod//sDuAwL7oHMp6T4Yf
	XKTgPUImWIbbuBWSoOM9MbhJpmLEeYM2p3vR+acr0QoaDa95bYbJSZm94szDP4wWVnN8Ms79nLN
	cq25l3FnBRmSpGo7f8OoABEIsZfS6WUjOY/WqtXaQzjwpuguQBaG6IJqT9ON+i3QrNf2W8FC3ie
	oTJ1W15VHllWdONVftYR/lBFTIH8nLamL2zKlD9FfpHcHKYA37quQtpKEFKgG5/LUiCPsikrqWN
	zSF8YhDhNg/GbLOQuAgXHu5q2izh4Rsfx+ssStnb4J3F2X7h8a1r2Tyh5oCO7l7xkiBBrPlfgWr
	lqBNBINwzcuPZfu9/Ruste25bk075PIcJ0HkGAf0LCVZDnRWTQmX3s7DXuXThbOYYa59i3SEMoZ
	KlTvubSsfBn4m5KQUZ377Cu+j3fcSJtgWosU2mkMcbCYYT2ouX
X-Received: by 2002:a17:903:1b4e:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2bd7e7b58a8mr239228905ad.9.1779245513328;
        Tue, 19 May 2026 19:51:53 -0700 (PDT)
Received: from ultimate.. ([58.84.62.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe7270sm198267065ad.50.2026.05.19.19.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 19:51:52 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH] dt-bindings: clock: via,vt8500: Convert to DT Schema
Date: Wed, 20 May 2026 08:18:53 +0530
Message-ID: <20260520025131.17772-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
controller binding from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../bindings/clock/via,vt8500-clock.yaml      | 122 ++++++++++++++++++
 .../devicetree/bindings/clock/vt8500.txt      |  74 -----------
 2 files changed, 122 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/vt8500.txt

diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
new file mode 100644
index 000000000000..9c312d11a6a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/via,vt8500-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Clock Controller
+
+maintainers:
+  - Michael Turquette <mturquette@baylibre.com>
+  - Stephen Boyd <sboyd@kernel.org>
+
+description: |
+  Clock controller bindings for VIA/Wondermedia VT8500 and Wondermedia WM8xxx
+  series SoCs.
+
+properties:
+  compatible:
+    enum:
+      - via,vt8500-pll-clock
+      - wm,wm8650-pll-clock
+      - wm,wm8750-pll-clock
+      - wm,wm8850-pll-clock
+      - via,vt8500-device-clock
+
+  reg:
+    maxItems: 1
+    description:
+      Offset of the PLL register within the PMC register space.
+
+  clocks:
+    maxItems: 1
+    description:
+      Parent reference clock.
+
+  "#clock-cells":
+    const: 0
+
+  enable-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset of the clock enable register within the PMC register space.
+
+  enable-bit:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 31
+    description:
+      Bit index controlling clock enable.
+
+  divisor-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset of the clock divisor register within the PMC register space.
+
+  divisor-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Bitmask describing the divisor field inside divisor-reg.
+
+required:
+  - compatible
+  - "#clock-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - via,vt8500-pll-clock
+            - wm,wm8650-pll-clock
+            - wm,wm8750-pll-clock
+            - wm,wm8850-pll-clock
+    then:
+      required:
+        - reg
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          const: via,vt8500-device-clock
+    then:
+      required:
+        - clocks
+      anyOf:
+        - required:
+            - enable-reg
+            - enable-bit
+        - required:
+            - divisor-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    / {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ref25: ref25M {
+            compatible = "fixed-clock";
+            #clock-cells = <0>;
+            clock-frequency = <25000000>;
+        };
+
+        plla: clock@200 {
+            compatible = "wm,wm8650-pll-clock";
+            reg = <0x200>;
+            clocks = <&ref25>;
+            #clock-cells = <0>;
+        };
+
+        clksdhc: clock {
+            compatible = "via,vt8500-device-clock";
+            clocks = <&plla>;
+            divisor-reg = <0x328>;
+            divisor-mask = <0x3f>;
+            enable-reg = <0x254>;
+            enable-bit = <18>;
+            #clock-cells = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/clock/vt8500.txt b/Documentation/devicetree/bindings/clock/vt8500.txt
deleted file mode 100644
index 91d71cc0314a..000000000000
--- a/Documentation/devicetree/bindings/clock/vt8500.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Device Tree Clock bindings for arch-vt8500
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be one of the following:
-	"via,vt8500-pll-clock" - for a VT8500/WM8505 PLL clock
-	"wm,wm8650-pll-clock" - for a WM8650 PLL clock
-	"wm,wm8750-pll-clock" - for a WM8750 PLL clock
-	"wm,wm8850-pll-clock" - for a WM8850 PLL clock
-	"via,vt8500-device-clock" - for a VT/WM device clock
-
-Required properties for PLL clocks:
-- reg : shall be the control register offset from PMC base for the pll clock.
-- clocks : shall be the input parent clock phandle for the clock. This should
-	be the reference clock.
-- #clock-cells : from common clock binding; shall be set to 0.
-
-Required properties for device clocks:
-- clocks : shall be the input parent clock phandle for the clock. This should
-	be a pll output.
-- #clock-cells : from common clock binding; shall be set to 0.
-
-
-Device Clocks
-
-Device clocks are required to have one or both of the following sets of
-properties:
-
-
-Gated device clocks:
-
-Required properties:
-- enable-reg : shall be the register offset from PMC base for the enable
-	register.
-- enable-bit : shall be the bit within enable-reg to enable/disable the clock.
-
-
-Divisor device clocks:
-
-Required property:
-- divisor-reg : shall be the register offset from PMC base for the divisor
-	register.
-Optional property:
-- divisor-mask : shall be the mask for the divisor register. Defaults to 0x1f
-	if not specified.
-
-
-For example:
-
-ref25: ref25M {
-	#clock-cells = <0>;
-	compatible = "fixed-clock";
-	clock-frequency = <25000000>;
-};
-
-plla: plla {
-	#clock-cells = <0>;
-	compatible = "wm,wm8650-pll-clock";
-	clocks = <&ref25>;
-	reg = <0x200>;
-};
-
-sdhc: sdhc {
-	#clock-cells = <0>;
-	compatible = "via,vt8500-device-clock";
-	clocks = <&pllb>;
-	divisor-reg = <0x328>;
-	divisor-mask = <0x3f>;
-	enable-reg = <0x254>;
-	enable-bit = <18>;
-};
-- 
2.43.0

