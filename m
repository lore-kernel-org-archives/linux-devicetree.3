Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4EB367B69
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865150; cv=none; b=gzQaSGBKChXhU0Yo+nkigAHu9JPZeeg2xZsJVhZ5Mn4ANP/FZeQ8xdPhQIPW++BRhVh9X+aoG47TOb9sF0yZ++9fg6SvwyQNrDHyNBo3fD1nJvPHjZYBJENokfHk9ZSFvv0InGO/y8AbdHdsaNnS7f+nFTEZWjYlMx3RZGGtpdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865150; c=relaxed/simple;
	bh=nc5m+bp6mN1sPIsGE38DpxKGU4eoOEzX/WayhXyLTfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j07ELpZtqdWDuDtct6/6oqPI2SQmu2ptYdBjxW7KFYPS/qOJifTsHthaPrmQbiiwNgecDPtp2YLZhv3Krve/4l6rJwbckBBa8VdNfQVzFwbYrJ+SFjGcTqvebUt2oo+gobYhVg8IKKlXtjb8xgDhjxf5v7NWgg5gBwJ0uVhD4L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzXCOA9V; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzXCOA9V"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so2865054a12.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 03:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781865146; x=1782469946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejJlf4ORDhRW+CuMcNt9CGcahTZgVcQIjfGmn7OZ17Q=;
        b=OzXCOA9V/eoliVpWNlvAMBHCW713hRwP2s3LrItv5+wKleLASsBpTXF0Nu7yRUgMzn
         QcWTV2GoncZym5REgSpExf8eIWU2Zt6X5p3Dp4st41E4W7gXvhl0aK+Igt1uPglRkHkf
         gBmXkG2zvPaCR/UkhU1Se0dINXAKw4RIVTHFoN2n+TAkawF9OMPvtyYintsDcW3ZIxjI
         fEV/Q4yObh6zRInrgrQBKxDjNOJWbFt1hW1+7/KxUAynA5LF5Mf7xGPmzyqNeZB0c6EC
         Sup3EnCZcl8wSQifbk9J1D+AiZeS+PTBV9EBPqbk0CXAOhQvWII6ZH/Hec3maIGoLq0N
         adTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865146; x=1782469946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejJlf4ORDhRW+CuMcNt9CGcahTZgVcQIjfGmn7OZ17Q=;
        b=dax48TERgnUQkXLIMqPFJ9i9ERaqoCjjSPfW/WBgj50ydiF2At56MRA1VvyqUuwNqK
         Qv3BxqI5Onpstgwpcxknyouz2uNt2azx8wOx7F9KaY7g3ErRf3bgeK7RBerhkmSgwNm2
         X7HphNCudc7T7XD7d+azCuCCjJLfJ0qHbQXP5z5/8PPqUJTVmA6FQ3MYAOC5XIn0W0Tm
         qwEztUI0vYPK/lEYamE4GeINikiG8VVk2IRtDuB61QeG3sVdw4sAPbnsqU/wSmWhU7q1
         9toPAYoRWDWClwR8Cgwqk5TfmcBhditoI7yyR9B4/GLa6Taf8E5HE/JQnQjTkERoYIjV
         pWpA==
X-Forwarded-Encrypted: i=1; AFNElJ9HXAodDtafsEL0Ki71YzDb3ElEPXPsJMkpGp6Muh7hL65XdOtrZOOZYyh0qcn/M14OxQ8Prothf//E@vger.kernel.org
X-Gm-Message-State: AOJu0YxDV2nyi52CY5n/HAPG+JujT7eLRXx0mAiEHfgg181mUXACcvSL
	rCikMUuNz8E+fufIyUjef0ErEDljRwB9vnP5/Tvq1R0EohNwZ/sdB3bP
X-Gm-Gg: AfdE7ckK4DioBWM8pY5FbqO0SaRD0x2VDfeYrfDCl79Uz5MKu7LPUk0i12sxsvZ6/5A
	Fi5XA6k6ZgkkphGmFWxSj/D2/RksZQ4WnBN7pYBA25nrO1I3sLuhEBxAWQvacRG5kgFczwooVRV
	xlbSHsoyHalPAtojY+kbx9LS5eZAOOX1c/Sj15x41JNJpwfaHC4QUa+ugfSkD1Qx/G/A7i715tF
	o6b3ZG5gApbq3RpSkquah2oNJg3MMmcZmQpoNQRQTG9XrIFAIQwti9VDp0nALi5bpxMf39X2v1D
	eMn2e08nPEJ1ZLr9FM/mOuE5Rw1y07g1Fsz5H32ITOiS66rxKMo0mQua+WnWpwTggtuIXvi0+mv
	sdBNW6TyRweQJFx9Obw+TR9NvvKzpmHuLP86J6o7ZDzw/lLDhR2rIV04i+gTUgjwAfz0QopT+Zm
	KW2L9nMqRH0nPVBvDXvC4SET0dXv5tvqpT+Q==
X-Received: by 2002:a17:907:934d:b0:bfe:ed06:5a15 with SMTP id a640c23a62f3a-c098bd62af7mr162171766b.51.1781865145730;
        Fri, 19 Jun 2026 03:32:25 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490cd59sm76702466b.16.2026.06.19.03.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:32:25 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
Date: Fri, 19 Jun 2026 13:31:51 +0300
Message-ID: <20260619103153.216444-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260619103153.216444-1-clamor95@gmail.com>
References: <20260619103153.216444-1-clamor95@gmail.com>
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
 .../bindings/hwmon/smsc,emc1403.yaml          | 191 ++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
new file mode 100644
index 000000000000..bef07b599720
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
@@ -0,0 +1,191 @@
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
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - smsc,emc1404
+                - smsc,emc1428
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

