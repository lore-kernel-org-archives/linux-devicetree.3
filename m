Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2804BE43F
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 18:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495819; cv=none; b=RnUJonKcoZJZQh0FMp2IZKqxqx1pjzIur/GOtUmpXqZzvy73PCy1W9nYjwkXn3GsFGSaNkbBk22mD6vg3Wr3fiSPk3j0/ri5WpHfM+mNr9NMn+JE54pWAbLwyOS+u3MTEJdybO+GpKpKzTvcqK2xA6QKq8ngZ6yR6l94JdYjyv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495819; c=relaxed/simple;
	bh=963GP+t5IUCBT9XPYFDACpdciFOeVIQkmhBxfjiI+ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TtGmlR4hgC0UwHWdtnadquPIMyWFVgmoRnXjwALODBbc5tqMKiompQN6I6cyuoIg0GzPsAxOe9Xb7g2aVv68RKqt/gwwedmjZ/cZjemYDKBDL7pXzawv5gSVNEVPZ/RvUA+om8oix782on2NOAZKT6VHdwzX/78+seFq+z8paW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=IYeOsEXR; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="IYeOsEXR"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c8so8923785a.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789495813; x=1790100613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eO+VSnFW4SLLPEShEGSwpEobnC/ryHIzzk4xdTun4DE=;
        b=IYeOsEXRtfOUcEalxBu5dTFPgktDJB64YrofMvVlA6+92xGJTQJLehw3kRpRJOWDtF
         L0MxF8zUT397HeQu6AbjRXnjeLkfzBYRcEpm3qUeBoH9y319rW/gWRx9NPtzKxXwPie4
         UDLeKKdyY3AdVkhPOJFgbYv6xQB4BUt28thXi7qZIgQ8R9lTVDna4/6dZxygggKo97FE
         LFboUKpSVZU7U7jzRG4cqE1F0xuf82cfw3qgFZArfLKv2VCUCvc5IVaNUue31i+Wjn9b
         s4MDhyT16bQKY9oG0RHpjFxWFJ4ft67t9BcBUyiltSG0phYcHxMvHNu7peX10RbT9eZq
         /E2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495813; x=1790100613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eO+VSnFW4SLLPEShEGSwpEobnC/ryHIzzk4xdTun4DE=;
        b=pcoZqMCbxeBQQ583SWgEwcYpA1EV7E3cbIQ20bEzcqpuI8m0CDQVHRXJN0BUfdp+3E
         IbU+m8Zx14IzcRxWbY5hAfIOjIqZWI3czi4CvZII+v59jAkYvLX8iMEgcQGDqQSz5kBM
         iZAvZa25xu3qzKE0qWGqBdsND+Ic2X/fLFh/XU7mtpZxyR0o2R8x8iQuf4WkxmVBjCoZ
         bxG5ZQLkfQS1D58C7i1rOChmPZz3JaFTKFAMV8vPDeif/ByboZdt1FHkXLZNXj26Yf/p
         /6AHlq3wQC0B55tG+GYrNfnPNnPTL+ZQMNUO7nVUzMPK/wUj4zjf3oSgo7/eGDHyHJ6M
         2cKA==
X-Forwarded-Encrypted: i=1; AKwUvBwp8BPzyDKEj5v0Yh9qrl4MahhBNsUVWoBBbHOJcYqc+XMK5Kk5Bk4Z+Fj206hNCoC7g69967qegfEZ@vger.kernel.org
X-Gm-Message-State: AFuF++mjx8Tkz/3paCHd88IGGLZ0WUTWMNYW1FbcdrPoQDVBvdHJ7Xs5
	IIRCchRucOhnef3qlNKkSu/NYS4vz1TFd9B2Ow+xUcMU6z+o5Mzg+zWFH4CD7ARsMNw=
X-Gm-Gg: AYBFou1NRhf+EPLHdpyJGrSIbN2zRvUHiF03NZ7cgiXo5WrZXmLK+PrfU7srGZkG2zR
	FzR5bjqZOAX8VVZ5Lra3XnMDNFSofil93wIzMoB0lI49rzJapLoMK4rqX7bRSfMo4lQN7exNhOZ
	n77xiYyAtpBpoR3rYv75eGMblS8rNC+8lMNPlIj4fIkEyX347Ek8MQokDy/814eq5GByRDx2uTh
	UyxwlbmYQwTlK55DhzuL4ZyMhb5eRkh6jvFibDbuWgfmjW76FrBS/ZEBGgNgdjJmSlLiTPN9CC6
	W2b2/3u6l0ccWI1tEZVeaB55ghzEwmlptRyrJuq4HdLgOHwDpatFLkFouRotPjN1IlXs+p0r/Zk
	CKn183XiTd+Za9kIwMaJa/PHYK1he812njdsLnQxMt7HbpH5zG1fuKHsWRXkzgNczVEqSn0nH/C
	GM97aRSQflYxUL26tbdcwZWozXX0/2SPORmHZUKbr3X3M0uBsMJNqPhFE+RtnoHfisnGG/s2fJC
	u2z0OdauU7xgg==
X-Received: by 2002:a05:620a:468c:b0:939:a199:45b4 with SMTP id af79cd13be357-93a29a77442mr1200928985a.39.1789495808599;
        Tue, 15 Sep 2026 11:10:08 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7824f72fsm14648485a.28.2026.09.15.11.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:10:08 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: misc: introduce pci1179,0220.yaml
Date: Tue, 15 Sep 2026 13:10:00 -0500
Message-ID: <20260915181003.1633543-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915181003.1633543-1-elder@riscstar.com>
References: <20260915181003.1633543-1-elder@riscstar.com>
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
v3: - Fixed a typo (TC9654 -> TC9564)

 .../bindings/misc/pci1179,0220.yaml           | 154 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1179,0220.yaml b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
new file mode 100644
index 0000000000000..51c8293cd924d
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
+    const: pci1179,0220         # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
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

