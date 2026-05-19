Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BAF3DCD8E
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177396; cv=none; b=W79EXy8cgR7vkOfmMXtheYxoZBCGZ8sqiMzpmjTuM9xiBfI8wWUylM+o2N5FLo93YJ3iX5OYL9GC9YP6w5Uljpkx2Eeghh4fvaDS5KCdBhttzMaU2ElgZgVxtqTCWoL5+FubZ7dAy9Q/4G9BNXe54Kv+vzv4xqRWCeJVAGICPfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177396; c=relaxed/simple;
	bh=Sh/ti6qXHF35XoxoQyD9WRUyK1ZDYF1GoWwDmjUE72M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cTATRZabLSixyV/wFXsCFtEJ2RD05m74N+6yxMAltDHrvdCeTZjTyBcUwKWuIoUrJQomxkpFSvaobCRvaNFmHi/o25HilfPQgu0SdGua/lMYcNa2bhPSDRX1M33mVvpLz/wul6JDKT7iyKUOJzIz55VmjaYmdzQ2W/punZKkET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAt3Rb9O; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAt3Rb9O"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-369ee210febso1012795a91.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177395; x=1779782195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE9NxNSmgFTXWaGpF8piD6Zi9f5RomnIPJRQYF5twSY=;
        b=UAt3Rb9Op9UYZej/m3O89Ginjkl3q4gBN4cQW/OHUwQZ/U9Zva/TtnBwYJWtxCgng/
         ZL5PoB6vZPTrmrVsdOQiY1COZZZCkVmyrqHoJ05OPGD6c9lWdBeU5vAubN7egOTrt/yZ
         FS2rIgjX26CFmzQ6U2lJTIvg3MItQBcuCAQ+50AgAS3ZoxdFUi5p3UXa5iTsX0E2Ba4b
         qUjlCLiYUor8Wt5Seb27Q5e5xA9Kppykyl84GhAPrt/4FuSJaOHm9YGBrEe7fFLDx582
         Ea9OhnOE/5h5aQ5/6nPWCT9dEpslNUP9NTSCX1ZG3vP0Lna0QVIhqFDzwLdPJRcwvxzy
         4ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177395; x=1779782195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yE9NxNSmgFTXWaGpF8piD6Zi9f5RomnIPJRQYF5twSY=;
        b=H7gSTn/9uvbsCl/Jyurxx34uiZd5Q6+QqvLuNL2IwhJgXdbcF+I/UFmwGhcB/sNG+E
         9hR1FCfO0kA5eQkhMVJIqPErXVDZWdGohu0blHarbZIH4F4KnLWTS8klNudKHR/ZmQOz
         WQz95XowE23naqZ/B/mmomRX4gUflyFliaWIW7Rf/74lbn7Q6DJD4pOwYqIxXjCTN+L4
         EtdH4mvu7kY8/SOa/OJHD80fw/yz+LpL8piIRGJ5CJqZEpgnvRL9DZ/hjudiPyZl7BU9
         GMdvAB9FtQotWHQduYGPfWhVkuEwIy1wzCJcZax35w7CN/3s9zJiz6hWDt+ZNIAL13ve
         QpDw==
X-Forwarded-Encrypted: i=1; AFNElJ+rA6XtC+utfmSMpIDCuoGSIfiqHOkWqHHll7npGJmijW7IKKzl3O1Sc0d8FeyrZ7dbClWeXF365A3D@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+QHqw2T7JxOI+IpFyAmHccJoEfVHV2n/dCkmmSLn8OrwGVAJ
	/jTMUwAsuO33UWUL3Evl7WsPijdHv1kH8fQm9/IIvNOukpb3ESxzJKQH
X-Gm-Gg: Acq92OEETHQTM4zFT25ELSGjUF7QwgvZOYUcq+VH+FecVd9n/QIHPvTEsR6t3ZbUu8K
	gB7ahUvLpdSw9Zlbupu3/PetRgPXgB0vEUcJXYUznd5PNCJdoaht+SsEhsP/FtTdTPajiM3ACRH
	eSOUFltgyf2OGonONX9Y5TjCLoFwUFih/DaZnm9n7BQOjvtAdjt7huxyIk/gSe/wAEJuiMHyMHd
	zD0mwUSyTH7Ma+DDizggCLapqVLY/2V+fV2/Pv6CnICyUhUpCTHqNVzVcMoxK2gbZIZVsuAUdFJ
	A21zsEkIRmaWiTYGkH6EWVSa+1U4LYv8AhCnzZf+eMWRyS+ihSuCeD2ile6NGUKGX8Nt+HWsGNp
	Pu+UJ6UMQqxf5iDkU14W4LAlfHNvRM2Ji9B6PNmk6IL3xf0CTb13p+OUf6GCZCSCjAUWo0kR8dR
	oB9EOLwptmDktMCSKzIM7sGkK3HyVcPi41XxLey9Wifpaj
X-Received: by 2002:a17:90a:c106:b0:365:c8e3:ec53 with SMTP id 98e67ed59e1d1-36951c953d1mr19112176a91.20.1779177394692;
        Tue, 19 May 2026 00:56:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:630b:f287:3279:f420:ef8:5c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm17116652a91.5.2026.05.19.00.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:56:34 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP730
Date: Tue, 19 May 2026 13:25:57 +0530
Message-Id: <20260519075558.91466-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
References: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP730 eFuse.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 .../bindings/hwmon/pmbus/infineon,xdp730.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
new file mode 100644
index 000000000000..a7361a07891c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp730.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon XDP730 Digital eFuse Controller
+
+maintainers:
+  - Ashish Yadav <ashish.yadav@infineon.com>
+
+description: |
+  The XDP730 is an eFuse with integrated current sensor and digital
+  controller. It provides accurate system telemetry (V, I, P, T) and
+  reports analog current at the IMON pin for post-processing.
+
+  Datasheet:
+     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf
+
+properties:
+  compatible:
+    enum:
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
+      Supply for the VDD_VIN pin (pin 20), the IC controller power supply.
+      Typically connected to the input bus (VIN) through a 100 ohm / 100 nF
+      RC filter.
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
+        hwmon@11 {
+            compatible = "infineon,xdp730";
+            reg = <0x11>;
+            vdd-vin-supply = <&vdd_vin>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
-- 
2.39.5

