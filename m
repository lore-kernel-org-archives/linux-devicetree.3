Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E49446C09
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627993; cv=none; b=YEX3Prxbvkw2bm/fXt9819gu6Dif/Mlm6h7f8hbnJYMsDB082tr5n+jatEf0F3ga+lePhsFmukMYPPbyPZx5HICXXbyyDBT8QKKlZCdHMHgMiFtMlsyNLR98fw8Y5Gf1UFfUbvdFp7jixTzOtxItL+vt28kcMPwgnHOHu1qcNLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627993; c=relaxed/simple;
	bh=4hhsAxAJjA9CnHKxIGE5+DUar4FrPizlIRDXYPMfD4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSM2z4fR7A0vU8g5VX/7gZ5f9soiZU35hg+7pMdHxiE9srXL5w189awUh01CydWtzFAi2cpeL2oiv0NqJpDg5m5nhl9hrmyMidzfFB95RJt88xhlxgUl35ElDTFCDUibENjBfsFyrjdtQd15Sm+GXg4ONx5np0c8CjVe8WVg8lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQNraOng; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQNraOng"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47df43bfb07so3012489f8f.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627989; x=1785232789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge4jOwru2gdBik+03SVRNyiDvso3mpjCVgnlsYEIFrM=;
        b=LQNraOngZes09ELhRxvcapcyEb8OUPktJff2L42ZeY22O5/NHADDF2l66NnV4sGZ1p
         qJifLkCKqbFLOXO3iymCqAb7XpPO+YVxvx6OycMIw3k6BwR8cOkfCqDAcjKg3NpjhqwZ
         ZQnxqjcgZPHJTV2rzezkVJOz27LUHnKIKoUZsPTXVpQxyye3ZeDgkkn6+bNp7EJ4Gjvi
         xTg3kTnO++esAC+JRYMukC7ISjTdWoNmmmxfU+T2p0mhYxBr76eghxIdr66P8voFrmGP
         ZAW3qHI5g9KTACr5g1MN6KpjJYM9Bw0km4ZmytgAMuuCauua4zVrlIOGHdgZw/xE189X
         pGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627989; x=1785232789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ge4jOwru2gdBik+03SVRNyiDvso3mpjCVgnlsYEIFrM=;
        b=iKaM0eZXc9aD56vGiO/t3NeBzhlMs70mhfLRH1gG456IeaEEKkNHJog9D81o7Jvtcy
         yP0aBYMsutBpOb4ONMM63y41UIFTzoR/5nulm7VJYo4u9wCh3DrNbVLN07dpYVD4okH+
         KhwSg+JMtkc+NCbQeSQkhGVuh1Ta1l0wWcbBs4YoxgyoRKpPn2MxnmCZF6iHC/PKNoJ/
         W1RDKjYCmfDHzviYGDWdlOCMpIW9nJGhNJ0FFTOwTo6Z0QKFqegXpXdLQwULkSkhAayl
         9Zr9RcDbJB/FgGIdsrFVGqP8GqnqdqDWiksZClOykiwmGGo/K4F7esvLE92xLHKNGCq3
         +G/g==
X-Forwarded-Encrypted: i=1; AHgh+RodAAANtzYefKs4nP/ySJgOn2OQKJZHDwr11FfT/kJox04q7tFHMQOzYCbyON56jXXtU4CcUSnCr5xa@vger.kernel.org
X-Gm-Message-State: AOJu0YzADmLhv+3ai8OiE3Zj9j34yaMC0fyrEFOUWe/RmzbFBiOHfwEk
	YGKYhlfe28JkOpEs1c8GLXdDgbYINqwTl6S8rw07W+MT6AkuG/XcLi6a
X-Gm-Gg: AR+sD114PO8PhKRHxrz7WKxaCtSkWm56jE8sX6Uf7gTCNlNXXMDucmIuzUxTZctU0LC
	U4biq+bjhhzUJHHv7dTUgtu35E4nG/0h9gm0yoCu7ye7ieDeONPHj6My2Jo8kLsZflhCouGmnmQ
	0vBrx/3lx4REuUk6LozBbuhbBPcchxBtLwyyNSct9zLCcY7p78lNvbyrYt1YEquR75qn3BU7tm6
	8TvI6fnbcJ/LYuODhMyg2kIoXyoNsFruE85xWlJNoUISC4F8L0JT1hlr+6fWBlGGNdmyiluow3z
	v3zqYnka/WUwS533pbC+GhNvd46vq1RSFsnsdWcJp8zAEm5ushUsJsgjeghFKR+9WvlJ6RsMViQ
	xT/jderS+hzyvP9fiRq7ijah4S25OdlIq4CZuAebBGNDDDZtQaIjAHIK4PdfFOc37v9KipYHztb
	0/MmsUbRcjtC4hBOyMgtVlFEY=
X-Received: by 2002:a5d:64e3:0:b0:47f:70f3:451d with SMTP id ffacd0b85a97d-47f70f3455cmr12905125f8f.8.1784627989466;
        Tue, 21 Jul 2026 02:59:49 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e499c2sm35228691f8f.4.2026.07.21.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:59:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
Date: Tue, 21 Jul 2026 12:59:33 +0300
Message-ID: <20260721095935.439174-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721095935.439174-1-clamor95@gmail.com>
References: <20260721095935.439174-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the basic hardware layout of SMSC (now Microchip)
EMC1402/1403/1404/1428 thermal sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/hwmon/smsc,emc1403.yaml          | 203 ++++++++++++++++++
 1 file changed, 203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
new file mode 100644
index 0000000000000..d7873a37c3295
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
@@ -0,0 +1,203 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/smsc,emc1403.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SMSC EMC1402/1403/1404/1428 thermal sensors
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - smsc,emc1402
+          - smsc,emc1403
+          - smsc,emc1404
+          - smsc,emc1428
+
+      - items:
+          - enum:
+              - smsc,emc1412
+              - smsc,emc1422
+              - smsc,emc1442
+          - const: smsc,emc1402
+
+      - items:
+          - enum:
+              - smsc,emc1413
+              - smsc,emc1423
+          - const: smsc,emc1403
+
+      - items:
+          - enum:
+              - smsc,emc1414
+              - smsc,emc1424
+          - const: smsc,emc1404
+
+      - items:
+          - enum:
+              - smsc,emc1438
+          - const: smsc,emc1428
+
+  interrupts:
+    items:
+      - description: Sensors "ALERT" pin output.
+
+  reg:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^channel@([0-7])$":
+    type: object
+    description: Represents channels of the device and their specific configuration.
+
+    properties:
+      reg:
+        description: The channel number. 0 is local channel, 1-7 are remote channels.
+        items:
+          minimum: 0
+          maximum: 7
+
+      label:
+        description: A descriptive name for this channel, like "ambient" or "psu".
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1402
+    then:
+      patternProperties:
+        "^channel@([0-7])$":
+          properties:
+            reg:
+              items:
+                maximum: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1403
+    then:
+      patternProperties:
+        "^channel@([0-7])$":
+          properties:
+            reg:
+              items:
+                maximum: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1404
+    then:
+      patternProperties:
+        "^channel@([0-7])$":
+          properties:
+            reg:
+              items:
+                maximum: 3
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@4c {
+            compatible = "smsc,emc1412", "smsc,emc1402";
+            reg = <0x4c>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+
+            vdd-supply = <&vdd_3v3_sys>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@29 {
+            compatible = "smsc,emc1428";
+            reg = <0x29>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0x0>;
+                label = "local";
+            };
+
+            channel@1 {
+                reg = <0x1>;
+                label = "chan1";
+            };
+
+            channel@2 {
+                reg = <0x2>;
+                label = "chan2";
+            };
+
+            channel@3 {
+                reg = <0x3>;
+                label = "chan3";
+            };
+
+            channel@4 {
+                reg = <0x4>;
+                label = "chan4";
+            };
+
+            channel@5 {
+                reg = <0x5>;
+                label = "chan5";
+            };
+
+            channel@6 {
+                reg = <0x6>;
+                label = "chan6";
+            };
+
+            channel@7 {
+                reg = <0x7>;
+                label = "chan7";
+            };
+        };
+    };
-- 
2.53.0

