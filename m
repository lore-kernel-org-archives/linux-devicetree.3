Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71746383C77
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353125; cv=none; b=Q7+cZbyc/UrvSLKfRvsewp+pCdqWpLawqO4CLKIuS/i+9rCyTdchBrh/gO+Z77r1EtphR6iJBC0nUeZrwrAYM5umEr4HR+ezDoFUDGL2WB6cGAuAIFKTOW1MX+e54gFn/BH091Ur3XSMdHztoJyUfSXhep4xOkl0Lv8/hfTHLyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353125; c=relaxed/simple;
	bh=hqGFzcRAEPnMTd/jfO+lOHuetEfMmFQ2/+xsz4yB2YY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HJV5B1xwQnDsuXND6ZNqtaIyrfFvkN4wNgNMbIeNCCGGb2nV8bieWszmAlC4pYGAT9xOaiDgD5YSAhDoU/rC4rjkcHGbCM79/E+qK/HdX3Sn8rGWQvsOZ+r4t65akSKV4GaVyoljZbTAoeJBXhBR60rdElbiK6BkCr6bhY4DxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjNnrrP7; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjNnrrP7"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso1787817a91.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353122; x=1778957922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pp6CLbJl76WQm15M0o32CAsBSD/I1ik0M5zbpMwsEQw=;
        b=XjNnrrP7zWRN8bZyZZcuSLDENd8015p+z8zAtL8+MU7nPkw3AmhI71yQ7kpk32y8Nd
         HXG+tA6xU31Na1F3O/4oXPUnSMvCOOZFZUsW6F1vDA8yD9zA1TE8fj+Uj/BI440+tHZw
         4WUnwjy2xkM5hD1fwMzbLQR/S28Qtl4JVEpelTLjqq5gYwZ3K7sXgSdCQprgU1ak1szW
         QHMCR+vjc7rwxrlJUN551LZI8xkd4EDs8AoJgo8iBOI5T9mCjQqyMnnmxL9/rR5/ptCC
         XwNc6WfXbs/dEZWITe3EltuqrUbz6hitP1pwtRPimNTxZiOI1FtOXIP7iPuXQnk+WRTo
         nERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353122; x=1778957922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pp6CLbJl76WQm15M0o32CAsBSD/I1ik0M5zbpMwsEQw=;
        b=Jdu2A/ive3r8Z9pmAym0DQP0OJDNhOxU/EKw2+EhAoJmanlb/AliyMTMCuugD/f/ce
         CZlZ6Mcl0C5uQ+Ffge1pJd8Cm5qkihcv2cZ3cgIpqk46WFAanE52q2mYF4w1gd4iMdNE
         iGKdo4dEaIc0wMQps2I7vYri0ZHMGnom5iftD7Q7aeothQsIztRhvRMvUqjwQyR8SYVQ
         nvQz67YNX9tnRemz+m77+luTnsXIkCLoGCeD/Acxr3QLCp2E3y+SCiy/Ha0Mh8y5eVtz
         1pVKWnLs6A20hy79EJt+uLxUwasLH0PzrULlrJayTyZD2SxCJa4ud8pn7KwW1cFtRdCp
         xEkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Bot1s24GrOiaNjGhDlWh/vIlhClevk+stT28yAMLBBFKvzQzY7Ue8wpqW/LZuk2ZM/ht4hxQBZAky@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Oj/NAKCvABERLwiBxz8gkIg0jA7K6wzFZKr3XYpQptgwodPZ
	uhK40+nxcpVMuV8vnIvxxRR7706Pr/1UynfOU2RJIByK1W6pPVHfybsT
X-Gm-Gg: Acq92OFRVkMdrjzroluVKbAC92TJzWlAIvkkFByfCRQ8ltm6qr+CXmT0j5WsakcD5ru
	ZmJC0GDaE9B9eBUm8/Qxii9RzA25rLq7uKLJH8E62PGZWC3/ur29M9EHySDAup5cH6ZSC/xNFbY
	UXbX8pCG5tCgwVssHUlBCkDil2AxKi58wyxAMHEdfF/wb7A3y+KvIoryFLWafuIEh+l6uWl4guW
	W4HhAQpJn7qjb5oUj+gVLit5EOfZgvNIb8O/A/5k3tS5D8r/seToLFK479SQ+KM2U24jeTSQRoU
	XRo8e7UeF8sXMbNBj+GJ+Vw0ndnrpU2n0HvDbDGLMJImT4GWn7HtZGbvN0sqq7fCOT7V0aM8iYS
	lqY01n8ghxLQ+owcmYM+M56nk1LAms0pgtRqu4tAqnsY8TMhc7b7AS/q2xTtUM7RNqnJjHCmGOG
	VaM0e9HHV9CeIONsPbJ+fBv+RNUtysjDf1p1ysF3a5LzfNzQ==
X-Received: by 2002:a17:90b:37ce:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-366053f7f37mr10321916a91.7.1778353121682;
        Sat, 09 May 2026 11:58:41 -0700 (PDT)
Received: from ultimate.. ([58.84.60.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d628474dsm2703647a91.8.2026.05.09.11.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 11:58:40 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v4] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Sun, 10 May 2026 00:26:39 +0530
Message-ID: <20260509185735.21557-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Epson RX6110 Real Time Clock devicetree binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v3:
- Add conditional validation for SPI mode properties using anyOf

Link to v3:https://lore.kernel.org/all/20260509181909.21871-1-challauday369@gmail.com/

Changes since v2:
- Reference rtc.yaml for common RTC properties
- Add conditional validation for SPI mode properties

Link to v2:https://lore.kernel.org/all/20260509095713.5818-1-challauday369@gmail.com/

Changes since v1:
- Reuse common SPI peripheral properties
- Drop redundant SPI-specific comment
- Remove unused labels from examples

Link to v1:https://lore.kernel.org/all/20260504183728.27412-1-challauday369@gmail.com/
---
 .../devicetree/bindings/rtc/epson,rx6110.txt  | 39 ---------
 .../devicetree/bindings/rtc/epson,rx6110.yaml | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/epson,rx6110.yaml

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt b/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
deleted file mode 100644
index 3dc313e01f77..000000000000
--- a/Documentation/devicetree/bindings/rtc/epson,rx6110.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Epson RX6110 Real Time Clock
-============================
-
-The Epson RX6110 can be used with SPI or I2C busses. The kind of
-bus depends on the SPISEL pin and can not be configured via software.
-
-I2C mode
---------
-
-Required properties:
-  - compatible: should be: "epson,rx6110"
-  - reg : the I2C address of the device for I2C
-
-Example:
-
-	rtc: rtc@32 {
-		compatible = "epson,rx6110"
-		reg = <0x32>;
-	};
-
-SPI mode
---------
-
-Required properties:
-  - compatible: should be: "epson,rx6110"
-  - reg: chip select number
-  - spi-cs-high: RX6110 needs chipselect high
-  - spi-cpha: RX6110 works with SPI shifted clock phase
-  - spi-cpol: RX6110 works with SPI inverse clock polarity
-
-Example:
-
-	rtc: rtc@3 {
-		compatible = "epson,rx6110"
-		reg = <3>
-		spi-cs-high;
-		spi-cpha;
-		spi-cpol;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
new file mode 100644
index 000000000000..3466f74736d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/epson,rx6110.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Epson RX6110 Real Time Clock
+
+description: |
+  The Epson RX6110 can be used with SPI or I2C busses.
+  The kind of bus depends on the SPISEL pin and can not be
+  configured via software.
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: rtc.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: epson,rx6110
+
+  reg:
+    maxItems: 1
+
+  spi-cs-high: true
+  spi-cpha: true
+  spi-cpol: true
+
+required:
+  - compatible
+  - reg
+
+if:
+  anyOf:
+    - required:
+        - spi-cs-high
+    - required:
+        - spi-cpha
+    - required:
+        - spi-cpol
+
+then:
+  required:
+    - spi-cs-high
+    - spi-cpha
+    - spi-cpol
+
+unevaluatedProperties: false
+
+examples:
+  # I2C mode
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@32 {
+        compatible = "epson,rx6110";
+        reg = <0x32>;
+      };
+    };
+
+  # SPI mode
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@3 {
+        compatible = "epson,rx6110";
+        reg = <3>;
+        spi-cs-high;
+        spi-cpha;
+        spi-cpol;
+      };
+    };
-- 
2.43.0

