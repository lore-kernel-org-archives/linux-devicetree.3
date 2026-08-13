Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0573F7A8C
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 22:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786660191; cv=none; b=fL1c4NGoiibZGo0w51GmVVBgkTwB4zKU+go8il0B9o47aytt1BOrwPEc3pdy9mlYM9QwUJp6dnIVID2Rbp47bdCoyuTr7kKiOXtWY0CGKzUbqyHW6E7FNtvVVyZByEmoGnrPW4Q0/J7TeS8lKFmdaysl14Up7dIKDn60dlLZAiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786660191; c=relaxed/simple;
	bh=Eol9WmL1O9f4MknTj6uP8Y6OkojPYS15FpPdbxYO2eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLc/q/5J9u502pjCN07bVxSAgy3dMl2k3R6ueWwKeSR0MvZfHCIi88I/Uch3Zu6r3afMHTrDnBLHIgJcV8bQFMsKLuHOBw7PjZx//9LIwd37xkHMBvyTKghVQ5902GnqXe2s4+6y+3CvdvSswXHa9mRqWf/feOhLZwwcfi4tWKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=AAggATrq; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="AAggATrq"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8f29ec73064so1946456d6.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786660189; x=1787264989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMqFoXd0sNHquHpZhWWDvUj9eRzJLL5tulsVnJoSaCk=;
        b=AAggATrqFgMAHTz0oU4WzmeMTq3qM765C8x1qVIQIzYEPuz5+bvRXlQuMPVmD4OxWv
         jket0ZTzgcYgfVvvF6XXx3lE7Z9h/0l2LhTWCxHNPZf0KoPHVlUumQnv4T33VQhP9VU6
         gz5io2pk/Nt6m2JpChc8yoCaFp9lZ05Sr9H+t+pPqgezIcdUj8WUiXBfweo8BeJx+jwC
         e6Bm8c0QfxaUYsBbhNOGwpo+f58v1hChqKOI4DL/wkNm/yzIQv5Q9t0o2VN8i1FQZgaP
         kV26+pYdlGi6iNbopa/UGeP877M7XrXf2sbCH5zzdpvIUmUazZlGKsHutLUKnUhCblm1
         Fxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786660189; x=1787264989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMqFoXd0sNHquHpZhWWDvUj9eRzJLL5tulsVnJoSaCk=;
        b=hBjznK6J3T+QZBS52PX3+eCC6amF2Q9kCkKTpiHjzvZLIlZjtQ4Vgz9aQqPC4EYY/m
         ls1512rakLx65AFGED1j/d/Tx2RRsB0hhlDGu2sUu4sUwVdxYhZnaplOSk3Bw1VyHHWC
         KouR6WxqicEZATC9ahcabxqKVpvMUepsdSsauFuLbrItZBFeEasW2AiCokCp0OezPmfT
         Ct+PtGbvDgTgKvNxNpL3XWlxDT1T5p3lzgKtyUsGsgC5qxX0kN0sxCv5AF5qeOYaFCGB
         Hf67wxTIBKyK3NkS+LX5Q5SJU6B5fdU4ZH87rmbPprMbngOu0ZlovDrY+ESp45fUbNRN
         S4YQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFR00wnRJ4kgpnAoxCHJFZFYZD7UBQ8aiWWtDaVALY/uiM7miO5cF1hcUbT9elnw/qVNNzzTDQMXJL@vger.kernel.org
X-Gm-Message-State: AOJu0YxhYaY6x+fJV4cl8nZ2oidRu2R2rGqFAU0gMZx57McA7JmOBZbn
	MqhktT2MwjfZkjIyBziiJVtYVvP3BEsE2hYEUhBHUFcgwKMpyXsDMrJuQgqbWofZnWdJRGuqlGZ
	QWhivGbk=
X-Gm-Gg: AR+sD10l9HdITtkPaXWssX/q7bw0W6+uUCQXnC24uClNONhgBcPZCpJ+H1MjbFQixYo
	up7wh087HnMCRS2B/NFxU+ElcI6cYQ4QDhslUYleFwACQ53txuJ3lNeGlJDeiEnKOAt6nAddKhy
	JP7qwM/O9WXh1insN+cjXYiwkKHEnwJa/U1Da/qpf1i9/7t6JlgzyG642rq/+YHrvV2oZsc6tCW
	S1KqN6PjFrpD0/TAt1kUDKznbYff7FIGQYG7Zkf3ei2y4aBPMGahXYziKfbHZhdBl97F2olJgnd
	Uv4Hl/L3wx5BpT+x4pVd0OYh/1xyA3HZZgybPYYvBgtO0aIxqZNxOMCrInM1g8bjbl8ikyFgkQk
	PDd+LoGIvxIqeacSoIMCPoBOIaYXcuN7b0gDmU5LrNG7c/SVSjymCWCW41WyhDDSlfMcgDctx0v
	5/lk/k1/1cZAlX3yVvS9aSFkGx763ZLFW80TSkReLXuYg1JyBezD9fYqEOtP9NYNZ/
X-Received: by 2002:ad4:5745:0:b0:907:c056:d648 with SMTP id 6a1803df08f44-90a91cfcd61mr13880936d6.2.1786660188696;
        Thu, 13 Aug 2026 15:29:48 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a921ea2dbsm2367506d6.7.2026.08.13.15.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:29:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: misc: introduce pci1179,0220.yaml
Date: Thu, 13 Aug 2026 17:29:41 -0500
Message-ID: <20260813222943.1655453-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813222943.1655453-1-elder@riscstar.com>
References: <20260813222943.1655453-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for the Toshiba TC9564 PCI endpoint function device.
The third downstream PCIe switch port within this chip has an embedded
PCIe controller, and that implements two of these PCIe functions.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/misc/pci1179,0220.yaml           | 150 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1179,0220.yaml b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
new file mode 100644
index 0000000000000..30a76f377eec8
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/pci1179,0220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 internal PCI endpoint function
+
+maintainers:
+  - Alex Elder <elder@kernel.org>
+  - Daniel Thompson <danielt@kernel.org>
+
+description: >
+  The Toshiba TC9564 is specialized SoC that implements a PCIe switch
+  as well as an Ethernet AVB/TSN bridge.  In addition to these, the SoC
+  implements other functions, including a reset and clock controller,
+  an address translation unit, and a few other devices.
+
+  The PCI switch has three downstream ports.  The first two are exposed
+  externally, while the third is used by an internal PCIe endpoint.  The
+  internal endpoint implements two PCIe functions, and attached to each
+  of these is a 10 Gbps capable Synopsys Ethernet controller and an
+  interrupt controller that converts internal "wired" interrupts into
+  MSIs delivered to the host.
+
+  PCIe BARs provide access to registers that manage almost all IP blocks.
+  The SoC is modeled using a PCI endpoint bus.  The IP blocks are bound
+  to platform drivers that access the hardware using MMIO through the
+  PCI BARs.
+
+          ------------------------------------
+          |               Host               |
+          -----........---------------...-----
+              |        |             |   |
+              |  PCIe  |             |I2C|
+              |        |             |   |
+    ----------+........+-------------+...+---------------------------
+    |         |upstream|          |          |     ---------------- |
+    | Toshiba | Port 0 |          |          +-----+ PCIe pwrctrl | |
+    | TC9564  ----++----          |   I2C    |     ---------------- |
+    |  SoC        ||              |controller|     ---------------- |
+    |             ||              |          +-----+     GPIO     | |
+    |             ||              |          |     |  controller  | |
+    |       ------++------        ------------     ---------------- |
+    |       |     US     |                                          |
+    |       |            |    ------------------------------------- |
+    |       |         DS3+====+          downstream port 3        | |
+    |       |            |    |-----------------------------------| |
+    |       |    PCIe    |    |       embedded PCIe endpoint      | |
+    |       |            |    |~~~~~~~~~~~~~~~~~+~~~~~~~~~~~~~~~~~| |
+    |       |   Switch   |    | PCIe function 0 | PCIe function 1 | |
+    |       |            |    |-----------------+-----------------| |
+    |       |            |    |  BAR  | |  BAR  |         |  BAR  | |
+    |       |            |    |   0   | |   4   |         |   4   | |
+    |       | DS1    DS2 |    ----.---- ----.----         ----.---- |
+    |       --++------++--        :      ...:                 :...  |
+    |         ||      ||          :      :  :   -------       :  |  |
+    |         ||      ||   -------.---  -.- :...|clock|       : -.- |
+    |         ||      ||   |translate|  |M| :   -------       : |M| |
+    |         ||      ||   -----------  |S| :                 : |S| |
+    |         ||      ||                |I| :   -------       : |I| |
+    |         ||      ||                |G| :...|reset|       : |G| |
+    |         ||      ||                |E| :   -------       : |E| |
+    | --------++--  --++--------        |N| :                 : |N| |
+    | |downstream|  |downstream|      ------.----       ------.---- |
+    | |  port 1  |  |  port 2  |      | XGMAC 0 |       | XGMAC 1 | |
+    --+..........+--+..........+-------+.......+---------+.....+-----
+                                      |       |          |     |
+                                      |USXGMII|          |SGMII|
+                                      |       |          |     |
+                                    ---+.....+---      --+.....+--
+                                    |  Ethernet |      | Ethernet|
+                                    |    PHY    |      |   PHY   |
+                                    -------------      -----------
+
+allOf:
+  - $ref: /schemas/pci/pci-ep-bus.yaml
+
+properties:
+  compatible:
+    const: pci1179,0220 # Toshiba TC96564 (a.k.a. Qualcomm QPS615)
+
+  reg:
+    maxItems: 1
+    description: PCI Bus/Device/Function config space address
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+
+examples:
+  - |
+    pcie@0 {
+        reg = <0x0  0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges = <0x83000000 0x0 0x0  0x0  0x0 0x1fd00000>;
+
+        pci@0,0 {
+            compatible = "pci1179,0220";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            /* Ranges will be updated dynamically */
+            ranges = <0x0 0x0 0x0  0x83000000 0x0 0x0  0x0 0x4000>,
+                     <0x2 0x0 0x0  0x83000000 0x0 0x0  0x0 0x80000>,
+                     <0x4 0x0 0x0  0x83000000 0x0 0x0  0x0 0x200000>;
+
+            pci-ep-bus@0 {
+                compatible = "simple-bus";
+                #address-cells = <1>;
+                #size-cells = <1>;
+                /* Map 0x0-0x3fff to BAR 0 */
+                ranges = <0x0  0x0 0x0 0x0  0x4000>;
+            };
+
+            pci-ep-bus@4 {
+                compatible = "simple-bus";
+                #address-cells = <1>;
+                #size-cells = <1>;
+                /* Map 0x0-0x1fffff to BAR 4 */
+                ranges = <0x0  0x4 0x0 0x0  0x200000>;
+            };
+        };
+
+        pci@0,1 {
+            compatible = "pci1179,0220";
+            reg = <0x100 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            /* Ranges will be updated dynamically */
+            ranges = <0x0 0x0 0x0  0x83000100 0x0 0x0  0x0 0x4000>,
+                     <0x2 0x0 0x0  0x83000100 0x0 0x0  0x0 0x80000>,
+                     <0x4 0x0 0x0  0x83000100 0x0 0x0  0x0 0x200000>;
+
+            pci-ep-bus@4 {
+                compatible = "simple-bus";
+                #address-cells = <1>;
+                #size-cells = <1>;
+                /* Map 0x0-0x1fffff to BAR 4 */
+                ranges = <0x0  0x4 0x0 0x0  0x200000>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 15c7dc516f7cf..7b7966ad3dea5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27615,6 +27615,12 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 PCI DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.53.0

