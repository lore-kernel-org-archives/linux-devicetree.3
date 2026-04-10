Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839A230B53A
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804531; cv=none; b=cTT3r7XtTM2OKQ4KhaUvu2zRVnFFAgNRj2Owad8IHN7GVs83bbJbvPMlPcutB0Ii5PovEjsUggF3lBtzJHg4eYxd4UUpWc1zZ1GDZGj59DC2n4LMJJnfBLs1EWgUNkDsGGiYO2s2K32PYVwwWp5QygL91c6cnpiOq2zSIc0PN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804531; c=relaxed/simple;
	bh=IuZLbhjufjxuatAqULD1povK/boUq0AX/MpCbd6+qIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N9qoW9RkLxw29YizUe+oQW445E0idy4/E4xYdVTpPA4FCEZZxbWqDf6NE0xUgKHFifDa5bUVPVpjm2wvMYUTgwg3PnkFVjvlX90/fxMhnivZzfNBobNBQ5gdUFq4t+fifrkw9jf2Ta9K3FIgVEXMpWM5jxeqA/jAipmhD7mBDFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SR4+bUQC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SR4+bUQC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aaf43014d0so10745415ad.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 00:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775804530; x=1776409330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN9ZhQizaGY72Aojgi9U/wrnRhfDHkvXpIHON/TB20Y=;
        b=SR4+bUQCYTLaswodplrw4Mqs202347ivZis4beGbvemSAm4zero7Q76qXk4sr/I6Az
         BAUOFj3wqCj957fHpZADT/s1UMxUzfL3nAo43joxA3LXt+sAvPSN4QdCmyf0xVPnEjE+
         o+20Tacjg4bwIB3UpE7nucZLgm8wNP4R9E66ClacjsnAvDnYAbh1Cpk5EnV/QV3oVyAX
         LUl/Ijw8L2tX7Z1Po3VrRa+Z/Rqir4CJrPdmIeCBlxUyHmsNlvWjUiuBcRWyZwPSNoMN
         GwRJTjiZ7gHz1yy5xOlM0DDQKKbCceLo3DZNUL7pOWuaaT0k0qovg0fBpztUsjrbz4Qn
         7kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804530; x=1776409330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nN9ZhQizaGY72Aojgi9U/wrnRhfDHkvXpIHON/TB20Y=;
        b=IGMjSJELC54v8MZ9JhT6frJUYiEC8GZ5Aofr9mZXJPgu25RkTOqp8HVr9y/7tkW8Km
         oF48g7PUVI/pRK7YVOGOnZhtJg/bimz0KTmH25vPRCo4DM/4cW/+dAtEvsqEloAuN/AN
         Wc0khuPhGETzLbru5SggvvRDNfZqOMiNdr8B6eEsqGFlGsBG2pEL8VbxKB6EpBrxPXpo
         DXKxUomQJdrBpZnOF3O+kSXOvzbdGI+/iUDDEuCN8T6ivbHUotX8VumnnLNnxKhjEXQj
         bZ42nCtqH2hOmGDtRd+/fEZM39KBLborO5ghowT0NcQPhFVLLlQFMNsFuFHLQJVPIaG0
         0E+g==
X-Forwarded-Encrypted: i=1; AJvYcCWLRYIFVtT7vqPnTMFoGFQF6VBvFzs+D0qOGpBS6VqyueBiZ2NkcRGSxdBQK/JMI7HOSFBiHDgMvjZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YyHBP5ac/jxgTItox4q0Wn+AsvEqmfUB4a4+Tp3K65qS+I0xQvt
	dTKzPYEweWvWBrScP5gsgXWrbPeZARYBwRtl3A3j5uN6VRIoffMVHtN4
X-Gm-Gg: AeBDietZp1zPpAAc5bs8sJy1ommFplV95x6i3Wfa1CRAZWM3Xvt4aAAloNVjUzacndf
	EWYJBPYAt2zJSG1rco7uie67Z8UmoLroRHdn74t2E2sVzLAQqSaQFEh58Kv/iG+5C+rzQ8fRxkn
	zkvnyPzAwAahG60ujJJoUcuH6tolRo0NSZ8PJDAKFsaNAzaOuD34M72XcSUCgFL6sPANdQGnFa4
	hHBmW777MMzHIWIYMQToE477QGaoCA3bhc1cQvJK+yZ9rQV8r/U6Zq2pqx0rlxJOhbxqZ5LF17L
	zEdPHYIeGF0GDUJuTYnQOlHFrz4qIv+hVOl1gYAfcj0r4js5+hClnH2+se1jCN3hD1zcG35UBQj
	xDvCFn99Vtmol7826B+B3lQcL7nvyIU8XLJL0K296Gv4EnKDSv0fri7CugpIJlz2MbG0q3CQU+A
	a+QR5j2YlSA30sr3SL2qNTXdykC+ayy3rV9N8GpJJuWb+5xw==
X-Received: by 2002:a17:903:40cb:b0:2b2:4e5a:9471 with SMTP id d9443c01a7336-2b2d5a38464mr19559975ad.22.1775804529733;
        Fri, 10 Apr 2026 00:02:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d025:c808:7be3:a746:1e98:3ec7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f09e85sm19310315ad.47.2026.04.10.00.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:02:09 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Date: Fri, 10 Apr 2026 12:31:53 +0530
Message-Id: <20260410070154.3313-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260410070154.3313-1-Ashish.Yadav@infineon.com>
References: <20260410070154.3313-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP720 eFuse.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
new file mode 100644
index 000000000000..72bc3a5e7139
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon XDP720 Digital eFuse Controller
+
+maintainers:
+  - Ashish Yadav <ashish.yadav@infineon.com>
+
+description: |
+  The XDP720 is an eFuse with integrated current sensor and digital
+  controller. It provides accurate system telemetry (V, I, P, T) and
+  reports analog current at the IMON pin for post-processing.
+
+  Datasheet:
+     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
+
+properties:
+  compatible:
+    enum:
+      - infineon,xdp720
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
+      Supply for the VDD_VIN pin (pin 9), the IC controller power supply.
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
+            compatible = "infineon,xdp720";
+            reg = <0x11>;
+            vdd-vin-supply = <&vdd_vin>;
+            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
+        };
+    };
-- 
2.39.5

