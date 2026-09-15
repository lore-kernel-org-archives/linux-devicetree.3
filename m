Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192B400E11
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441847; cv=none; b=YQFrlusX19+h6EuSkbQjpkC7Zy9XY9Z0G7N9UkclL2QaV85x1zn+dSv9tLB7wwPzSQ4Asqou09sEXaVnJ1l1rzgWXKPtd1u2I1Z2aMKu/byq6UhfYKThOTNkAl34GcctXlry7hZzQ/0pYSoxp6wpcHICE9NOBzl6SNo8uBEUsgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441847; c=relaxed/simple;
	bh=WDz5ldOwC1ipeFLGJW3j0d9LLVpM+Mtws88tNhcwYoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbKta5BDigYUo8hGL7vKOdttgivKmq1M+wDn6tjtNa0nAycpBq6btSAaKciTotDIBMfKc31hUQBb9SSJBVVsQOnjg+z9mt22nq/HZU1KjpK3TbHNOHxsZNFp4uvwsnYJU9MbWri+e1IRg6/WvKKIi9qiTP86OXJl2nhD9SDUC3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=cCB/464P; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="cCB/464P"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ef19aso30854911cf.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 20:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789441843; x=1790046643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OreA8W0F8O819M9j39kOjSL4ZJkwhBc9Zj4iMK3ajYI=;
        b=cCB/464PIWsudLABjHbLiyRZ08CXH8sf2a/V+5d01Xeaai9Sbu2tzpajKMlDmUa/7y
         zilRl+JMQAT/FC3+QZz9rkbNVR+oQPLWvhmxUtCu2/zhMDuUhvCt6LMA/s8UKgehsZ1B
         v8j8eKUAb28YmHwiZG7mdK8GcArqcLER+mNRDg47IwMDrTLFr+fpK0y/0wm4K+knHgrS
         bJS4GcpOxABKT9g7RllS0/RPNG9Zn8vOTT9/VLdvOeW080SzIQ+FNrlfZzdKAMXm5GYu
         7TLADjXeJuJmBY7Xy5hNFnZT9zEmw2lWDFeMpe21SJ6zKTDfToS4PUUo7BgaQgZNJ8L6
         5Osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789441843; x=1790046643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OreA8W0F8O819M9j39kOjSL4ZJkwhBc9Zj4iMK3ajYI=;
        b=l4vHdTEa2uIKwq5ZJpVtma236XziT0qvRZn6FrIMjTVtjIZq7TSW05ydr+WKVGQOax
         vu4G3Ice5UbNF0G4LEuBg2xInD44Et9GjFO7y8chVuXgsm1WS8NISQ7/fpjAnLlNVNF3
         VBcvuZhRzsGUxGjGh6s9sDGbWbR6F1d/IozF3LAxjk7mkvbTGNwqyAu3y7VrpAAma9aY
         lH1U+0Fc9ktECF7dYiQWaRak5ZupxsFzGOSdmLKtzLyiqLppSYTWW2ndDmiQBAnnFCV/
         sEoftcVv9KFNps0JDC0BKQOIzTEqXLsq0DSj4RdHFfu85r/n6YWYpdLYQv28gaIaDun1
         Ky+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwXhZ0W7j3vGZgb99pG1Xf8nLQlxxXFJIChACy4zfOFVgCepAw6gTe6vJf1J9BdtoGtckn8FXFtTkbe@vger.kernel.org
X-Gm-Message-State: AFuF++kgRUEU6L+LFS2+Wdj4wRM+mDh/NADPuABkLtmk2XpkHCJ8YREL
	Ho4c0xZ5hZGiqDZQGOeZZNocYkN4awiDSW/w8awo5oCIdMCAsKMW/Mq46vU4LX0qYcA=
X-Gm-Gg: AYBFou3tzIygoxFSwHOa3JbZAt/TGoc/wMROgklhyro5lx8RwjlyKdDo0OemT9vFI5I
	Do7Wo2w3hlf3g7Z6eGXwYL3FAsjkbHOy6Ck16fVJWKWA2IDcBfrY2TdWrEiApcNX/E+gPOYQ+GI
	qVOUaVllTG45L9tSsq03LnCRAHp4pOvRxe8yQGFB0c5DNmjy8GK3UiS5j/9g/C5KCQhB4eVhDEF
	9IYECPXXOnbnJm+fn5+Aoz8w8tCF7oj1yv/dhKWjR4Tncd62I9wKGdTs4LP4yEkRfhUjcBsgO52
	9mVZSMx+FOsulY0httK6bsC6YiLyhjwDPXSc6gLAvdwIVeCvJxtClcmA6UkmMczYnmTWlDMsznh
	jTK2In40jOWMpV2wBFLXGq8TBVdkPmZMT1/dgJkyE5kOEGqYjIiO3qozoZOfVC0LgLgbT3atia6
	B9ELKgMygUCizCVWeJKCyHaOXr11npRXOyPabBZwjiiq6HY8yRz2Lvr38Pm5JGsUswOb9StT/bk
	7g=
X-Received: by 2002:a05:622a:1388:b0:531:1c2c:9087 with SMTP id d75a77b69052e-5311c2c94ebmr24380071cf.17.1789441843270;
        Mon, 14 Sep 2026 20:10:43 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ce4ec298sm118563841cf.16.2026.09.14.20.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:10:42 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: misc: introduce pci1179,0220.yaml
Date: Mon, 14 Sep 2026 22:10:35 -0500
Message-ID: <20260915031038.1087264-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915031038.1087264-1-elder@riscstar.com>
References: <20260915031038.1087264-1-elder@riscstar.com>
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

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Added BAR2 and SRAM to the block diagram
    - Updated parent addresses in ranges properties

NOTE:
  Despite being a PCI device, this endpoint function device uses
  the devicetree "pci-ep-bus" model to represent sub-devices that
  are accessed via the function's BARs.

 .../bindings/misc/pci1179,0220.yaml           | 154 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1179,0220.yaml b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
new file mode 100644
index 0000000000000..fca3d331097de
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
@@ -0,0 +1,154 @@
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
+    ----------+........+-------------+...+-------------------------------
+    |         |upstream|          |          |       ----------------   |
+    | Toshiba | Port 0 |          |          +-------+ PCIe pwrctrl |   |
+    | TC9564  ----++----          |   I2C    |       ----------------   |
+    |  SoC        ||              |controller|       ----------------   |
+    |             ||              |          +-------+     GPIO     |   |
+    |             ||              |          |       |  controller  |   |
+    |       ------++------        ------------       ----------------   |
+    |       |     US     |                                              |
+    |       |            |    ----------------------------------------  |
+    |       |         DS3+====+          downstream port 3           |  |
+    |       |            |    |--------------------------------------|  |
+    |       |    PCIe    |    |        embedded PCIe endpoint        |  |
+    |       |   switch   |    |~~~~~~~~~~~~~~~~~~~++~~~~~~~~~~~~~~~~~|  |
+    |       |            |    |  PCIe function 0  || PCIe function 1 |  |
+    |       |            |    |-------------------||-----------------|  |
+    |       |            |    | BAR || BAR || BAR || BAR | BAR | BAR |  |
+    |       |            |    |  0  ||  2  ||  4  ||  0  |  2  |  4  |  |
+    |       | DS1    DS2 |    ---.------.------.--++--------------.---  |
+    |       --++------++--       :      :      :                  :     |
+    |         ||      ||         :   ---.--    :.......           :     |
+    |         ||      ||         :   |SRAM|    :      :           :     |
+    |         ||      ||         :   ------    :   ---.---        :     |
+    |         ||      ||         :         ....:   |clock|    ....:     |
+    |         ||      ||         :         :   :   -------    :   :     |
+    |         ||      ||   ------.----    -.-  :             -.-  :     |
+    |         ||      ||   |translate|    |M|  :.......      |M|  :     |
+    |         ||      ||   -----------    |S|  :      :      |S|  :     |
+    |         ||      ||                  |I|  :   ---.---   |I|  :     |
+    |         ||      ||                  |G|  :   |reset|   |G|  :     |
+    |         ||      ||                  |E|  :   -------   |E|  :     |
+    | --------++--  --++--------          |N|  :             |N|  :     |
+    | |downstream|  |downstream|         ------.----        ------.---- |
+    | |  port 1  |  |  port 2  |         | XGMAC 0 |        | XGMAC 1 | |
+    --+..........+--+..........+----------+.......+-----------+.....+----
+                                          |       |           |     |
+                                          |USXGMII|           |SGMII|
+                                          |       |           |     |
+                                        --+.......+--      ---+.....+---
+                                        | Ethernet  |      | Ethernet  |
+                                        |    PHY    |      |    PHY    |
+                                        -------------      -------------
+
+allOf:
+  - $ref: /schemas/pci/pci-ep-bus.yaml
+
+properties:
+  compatible:
+    const: pci1179,0220         # Toshiba TC9654 (a.k.a. Qualcomm QPS615)
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
+    pcie@0,0 {
+        reg = <0x0  0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges = <0x83000000 0x0 0x0  0x0  0x0 0x1fd00000>;
+
+        dev@0,0 {
+            compatible = "pci1179,0220";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            /* Ranges will be updated dynamically */
+            ranges = <0x0 0x0 0x0  0x83000000 0x0 0x0  0x0 0x4000>,
+                     <0x2 0x0 0x0  0x83000000 0x0 0x4000  0x0 0x80000>,
+                     <0x4 0x0 0x0  0x83000000 0x0 0x84000  0x0 0x200000>;
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
+        dev@0,1 {
+            compatible = "pci1179,0220";
+            reg = <0x100 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            /* Ranges will be updated dynamically */
+            ranges = <0x0 0x0 0x0  0x83000100 0x0 0x0  0x0 0x4000>,
+                     <0x2 0x0 0x0  0x83000100 0x0 0x4000  0x0 0x80000>,
+                     <0x4 0x0 0x0  0x83000100 0x0 0x84000  0x0 0x200000>;
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
index 6096dab7121e8..aa6b805e1ab2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27670,6 +27670,12 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
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

