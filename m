Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81C58003D
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778350794; cv=none; b=jLXGoOdV5lXI9BrhnhbImNd9y680PzCGYsGgEnURbaMJMxqMPfgc+PnhzC0ukBIgp2Yu6/bDPfF4TNNlSuXiqigUrUp2xXiprwHJTkfI4TfQQR60EcR7PKbbfzq0Xl6JtGcOqCv5aMxJDWiDw/x0yPN/QN77+uY2hU79mlWuY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778350794; c=relaxed/simple;
	bh=czzcavk29id9M4UhdT5VweJ32WxTo3MgrbsazJMzg0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahS71shc+Hw1qIRHeFgb0mrPv7/Ca9rEVRkloBBpuKJJ4q5AleqNezzeq+kUuj6KcK2D5WsEjA4Ay7l64FE3sTofsCpqcPrDfb0elWIPOYD+4zkCSqFaLcdj/ND4vc00jqzrxq4s4+UUp2bma28tShLGnqsmYYCUiDJFIPVY1Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X319pr1C; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X319pr1C"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-367d88b9940so313157a91.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778350792; x=1778955592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frOdwOepJTp+ZENuZWChoJcmDuk9+nILW6mXjQtPtmw=;
        b=X319pr1CNBcamLZ2TfgHkdXcXfU6V+1eWBcEdGe+9QsY6wl3fmFsBvnpi+MAgLHHtp
         zfCaZmFcprbAOO+pfPbKQ/fdU+UJuiKH+aRBznjs+nvwM2CQNeF763oiyJuxw0NekBLM
         B+96vRgGnTTJEuAmtazWWMGoU98bYra36YVbCFKhoo4RfCET5VYfToZB+rwNVca5ul9r
         axjWgtkhBd+Ng16RCxRGBVCbycNHWJICpxiPXORrbMKtEg9fQp06+FhKFtsqKrR+39Z9
         +ByF2Kb7mhnBbCQ+8mqwSVmfa3LBZdDSS5P7NFRPwklI3pBEefS1eu4NONVFEhtb3veQ
         40Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778350792; x=1778955592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frOdwOepJTp+ZENuZWChoJcmDuk9+nILW6mXjQtPtmw=;
        b=sfKejopizPDTV1KAfdLxf8/PgP6eX5Aw8Qb5izWjc4K16+oN5M3mwYkLxtHntzL5ck
         dEde/3fQ+gBnDsHSws59x78AgPXF+o7peEdvckPDMv8mEHoAAs6x0l0Lv+aRYGnF+J31
         Ml7uizPPBMe8xPQSFEQ+SbSh/GcisCA9Xxs3Ryt9lGFo//RMei5rcnCmMLcxPYTK+WVn
         66YijZHKFpM7OjH3LF1jk/Ml7anXZW/jjdnZczMPKEz8TpC1iY7e8Igxup/YR/iUScJQ
         w7qQXs0Do8Kp+sjXCO+NUTMVp5HgCxn6Opm9HlqrMYkIk5yBTXDDGHO/DKsxMcikHDDH
         FK1g==
X-Forwarded-Encrypted: i=1; AFNElJ9vhznmb+wxgjtkz21N5oI9qwUGE39SYOug5PBNaL8OvIsPAwC4JoycGI5CsEvxlmcSQmtlNTVORPJ/@vger.kernel.org
X-Gm-Message-State: AOJu0YzOQ1SUJuPTyr4ntq5RKjA3iwWn2tP1nFa16CyVYJZ4V97IeXNK
	3RHRevZAPKM4aqccamg9gZZtf+mANAqtu+NECe93A98b+FOCMiugKGEy
X-Gm-Gg: Acq92OEDwW0nfapOzDAyUT03YAO31vBTR9ySMtBlPwt9eYn2LB93hkQz/NyVyq/gv8a
	hmlK6wiG2e6ZH0CQzHEf/ZBimCsKx+axOimc4tIxqIPfI7quoLYByEiHdT492v6j352Tv914U++
	Jo7hqTfTUSS52FnhtDy3GeC6oAgTfU9joq2QLbtJDxLyyCr6X973oqpwkrF0+qqWKYyTVYGZMvM
	MSQUl4MyCdyMrF12QvhZRhXpuxIGVPIVF0bHwN70pPIuYhTa/6cXeftrZtGgw3UeglcWms6/3cY
	xnqp85P3pSEMOeQMV2Dva2N5vC94Y3M/bk2FkjOgWn7c2M1riF44I+KP1wsveLvNyWeIoVKGccf
	ec9OWv+iDSOMuWcK8tonsHpAYsjAE5FhiLNbBl6tBjhcl8nu+bOyn+wb3+sPprXoj38tQ86eSF6
	zZG6mqnRQ3ImoD3AUOpZ7wvCgpiTH8mxjP8VU=
X-Received: by 2002:a17:90b:1c0a:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-3664c8db251mr8171762a91.2.1778350792243;
        Sat, 09 May 2026 11:19:52 -0700 (PDT)
Received: from ultimate.. ([58.84.60.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d63bad27sm3414683a91.10.2026.05.09.11.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 11:19:51 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Sat,  9 May 2026 23:48:08 +0530
Message-ID: <20260509181909.21871-1-challauday369@gmail.com>
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
index 000000000000..09578de45d8d
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
+  oneOf:
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

