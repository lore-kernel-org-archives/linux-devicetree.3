Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216DB394780
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 20:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788639092; cv=none; b=lxb/St12PcmHUttpD0PcWPnMdUhSDiTXRAsPa2lEEcTcxG5JfVXmCtvbVNIzD14UYE/COg0V+RAO1+Z/4Z00CxzxWD8PZ8f1X8E7/4hTXZXqSJtW7w/tWd4UWM4Fpd5xw0VJu8zgf7ILHzAqGt2H669umdu3fh5sQ9XI7bEAwrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788639092; c=relaxed/simple;
	bh=qhttRoS/05uXW+khvr91X2irPodqrAuuPZhTGsFnsP8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=U+hbvEP7f5iJvRQ1MKNRi/g3OBEa5GZ7cSudCX1nYPjzqbvc6pe8D0v0m/7xZo51GxVCmP1W32o/k1yDwOVbYLNWOQBYSjcG/AwBf78N3ozHIKwBBdVp9K742qyx7ckfLqXM+N0JMqxhDpAH3pU2yt+Ork5lCjVxaapsR4cJi9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9jEEmJ+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9jEEmJ+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495590dde14so30674945e9.0
        for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 13:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788639089; x=1789243889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DyusgtkJrwmIrV7BTtWKlsjRW22JZpFJGCsu6sZUiKQ=;
        b=Q9jEEmJ++ze6nFm3m4Xl3FiWODG1VRyZ3Y7IkKz4S7o5VpfhaDO3ihp+xkn2Kqi+W1
         jAk+XX2kfWyz7HIqAs6dmOSJbWGppgEVl8mk0VSM8Jqk+FhUXSkSBsf/Qpe/DszpuoW6
         KzE5V0Sdc8HXBRdYVm8lKfuSiV8ZcoxS9cmTPODrTG7sknuIfNqIzF9By+YHYf0zjYKH
         PZCElGwhHc3yIhs/gTf1WFaFsjXrAqADGJqZruL2t0UxAqVtayvp9ATkYKirlBgoGzbn
         NRGyZC1WUum1N31GeTWJ2pf7Do+LyaiSt4Ek0a3Mj1lwkDM7Y0hqqQtgaU8ZC24UOP+0
         mh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788639089; x=1789243889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DyusgtkJrwmIrV7BTtWKlsjRW22JZpFJGCsu6sZUiKQ=;
        b=RaKrVaGImc40+sJVlizL+zgvCjacNu0jjd3OAmytSRVPdk0f8TRMIylaqO+vJLhgRw
         IBAaHlOIj0nNE6mUFej2tmMqlo3GWhAZGOdjGt7BN4St7142QpMYaExH+wxKQUKWj/rP
         mOn5kSa+6XRULPFAHTEFaBzLoiExjJm38MVZqoci1BKAvYwl7IJpHUI/QlWbDyTjudMx
         WJcevflY31HGkm5D1OqdmpCIxL5e7Vu9ZdEGfhTaweRYgYrD+R7WEH9viflAHVBt+b4/
         VzFiSKCdwd5M7ZK1wPYGbbjpXFdDOQpl21blYXRkt+woP9kxSk9dDMRGv5KnmMMHID2Z
         OyGg==
X-Forwarded-Encrypted: i=1; AKwUvByEgkZzEY7fPBngEbctm/IJN3MxwgvRtnWJsOzqT6L83FEKaAgg1ZaNE+gMZcC8SfVTTdFNSOQiQd7z@vger.kernel.org
X-Gm-Message-State: AFuF++nxJrjW0UHgo209Xd2Ymykv+esje/COrp2kwb5onI2RDYpQp1JO
	5uYFK+9wFR028zGvVZ5Yzps61/oJ21mDdZLLyT7CuKZ2UMF4FCkICDgS
X-Gm-Gg: AYBFou37yfjaz7WELJhbiSlsZvsMDUyHq1hON7anu1QI4jVrJUkCnIU2zO1LPkDEZps
	hnGL+q4Xqc/FUo1Vysn2WlzVERAa9RVZy/9CIGi3Y6KxtVDqHtZBZqajMLpcF8PlBMJtAueZAAP
	1YVSGxQJzOS7Uy8mndbzmF/e+OzzFKR2VMunrx56AcLGzn7XVEw4iSS/159BbMARWTDaTP3JVt0
	UhNMLJfV7SQTK45tB/rb0ItpzJnjMmpxpqNvpZwzG+13/L/luwNciYbWTRQktQdvDffJAMWJzxn
	nN+k9vlcZiCusfeDQp4COM2QJG4HNH9Yr4shQ5AcWbRk6wC3OwXCvlbCbASBPhBv39oOKBBKBzz
	3snPC4GvsLMJk4OFvUgbbPHgkoo4mHKlP79/j1t1TwXQBqA5EjY5/RLt2w3GNoHvPX+pZDD1HFa
	zi0LOZ9O8anyqru77yBXg5mj4sIfvuuAx4F+aWKTr1D56lJfZNhVCH6oDkA2PdUxiAhQflH15k7
	s9Q+j7t+SudgvtUJcMVKXl0vE12Hw==
X-Received: by 2002:a05:6000:220a:b0:485:943c:886d with SMTP id ffacd0b85a97d-485943c8a37mr8746674f8f.7.1788639089126;
        Sat, 05 Sep 2026 13:11:29 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.184])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm14421414f8f.4.2026.09.05.13.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:11:28 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2] dt-bindings: net: wireless: Convert WL1251 to DT schema
Date: Sat,  5 Sep 2026 20:11:08 +0000
Message-ID: <20260905201108.415713-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments WL1251 Wireless LAN Controller bindings to DT
schema.

During the conversion, the following updates were made:
- Added the 'clocks' property. It was missing from the txt binding but
  is used in device trees (omap3-n900.dts).
- Added 'spi-cpol' and 'spi-cpha'. These were present in the original
  txt binding's example but missing from its property list.
- 'vio-supply' and 'spi-max-frequency' are no longer required. The txt
  binding listed them as required, but they are only applicable when
  the chip is connected via SPI.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v2:
- Rename the example bus nodes to the generic "spi" and "mmc".
- Drop the MMC controller's board-specific properties (vmmc-supply,
  bus-width, non-removable, ti,non-removable, cap-power-off-card,
  pinctrl-*) from the second example; they are not part of this binding.

 .../bindings/net/wireless/ti,wl1251.txt       | 64 --------------
 .../bindings/net/wireless/ti,wl1251.yaml      | 85 +++++++++++++++++++
 2 files changed, 85 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ti,wl1251.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt b/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
deleted file mode 100644
index 88fd28d15eac..000000000000
--- a/Documentation/devicetree/bindings/net/wireless/ti,wl1251.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-* Texas Instruments wl1251 wireless lan controller
-
-The wl1251 chip can be connected via SPI or via SDIO. This
-document describes the binding for the SPI connected chip.
-
-Required properties:
-- compatible :        Should be "ti,wl1251"
-- reg :               Chip select address of device
-- spi-max-frequency : Maximum SPI clocking speed of device in Hz
-- interrupts :        Should contain interrupt line
-- vio-supply :        phandle to regulator providing VIO
-
-Optional properties:
-- ti,wl1251-has-eeprom : boolean, the wl1251 has an eeprom connected, which
-                         provides configuration data (calibration, MAC, ...)
-- ti,power-gpio :	 GPIO connected to chip's PMEN pin if operated in
-			 SPI mode
-- Please consult Documentation/devicetree/bindings/spi/spi-bus.txt
-  for optional SPI connection related properties,
-
-Examples:
-
-&spi1 {
-	wl1251@0 {
-		compatible = "ti,wl1251";
-
-		reg = <0>;
-		spi-max-frequency = <48000000>;
-		spi-cpol;
-		spi-cpha;
-
-		interrupt-parent = <&gpio2>;
-		interrupts = <10 IRQ_TYPE_NONE>; /* gpio line 42 */
-
-		vio-supply = <&vio>;
-		ti,power-gpio = <&gpio3 23 GPIO_ACTIVE_HIGH>; /* 87 */
-	};
-};
-
-&mmc3 {
-	vmmc-supply = <&wlan_en>;
-
-	bus-width = <4>;
-	non-removable;
-	ti,non-removable;
-	cap-power-off-card;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc3_pins>;
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	wlan: wifi@1 {
-		compatible = "ti,wl1251";
-
-		reg = <1>;
-
-		interrupt-parent = <&gpio1>;
-		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;	/* GPIO_21 */
-
-		ti,wl1251-has-eeprom;
-	};
-};
diff --git a/Documentation/devicetree/bindings/net/wireless/ti,wl1251.yaml b/Documentation/devicetree/bindings/net/wireless/ti,wl1251.yaml
new file mode 100644
index 000000000000..10873bf401b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ti,wl1251.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/ti,wl1251.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments WL1251 Wireless LAN Controller
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    const: ti,wl1251
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vio-supply:
+    description:
+      Phandle to the regulator providing VIO. Required when connected via SPI.
+
+  ti,power-gpio:
+    maxItems: 1
+    description:
+      GPIO connected to chip's PMEN pin if operated in SPI mode.
+
+  ti,wl1251-has-eeprom:
+    type: boolean
+    description:
+      The wl1251 has an EEPROM connected, which provides configuration
+      data (calibration, MAC, ...).
+
+  clocks:
+    maxItems: 1
+
+  spi-max-frequency: true
+  spi-cpol: true
+  spi-cpha: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        wl1251@0 {
+            compatible = "ti,wl1251";
+            reg = <0>;
+            spi-max-frequency = <48000000>;
+            spi-cpol;
+            spi-cpha;
+            interrupt-parent = <&gpio2>;
+            interrupts = <10 IRQ_TYPE_NONE>;
+            vio-supply = <&vio>;
+            ti,power-gpio = <&gpio3 23 GPIO_ACTIVE_HIGH>;
+        };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        wifi@1 {
+            compatible = "ti,wl1251";
+            reg = <1>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+            ti,wl1251-has-eeprom;
+        };
+    };
-- 
2.43.0

