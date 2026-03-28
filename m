Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA43F375F67
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774687412; cv=none; b=Rx819SRF5p0Zgr/9Y3f2WGKUsVd2YCleCzIdyGv7DVtz7l/In250kfg7RkBpnSYlrWxhror0QOxfAhygvyosuFwCu7ADKe2M+YfRInMdy+uUBhHEmXDPpaaMCkEwJPyEIfdcIDPu2xCTvzgoFbOqcWoBq40HLSetLbFakNuQwq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774687412; c=relaxed/simple;
	bh=ZOYMIbcc/EUyf/Nvkdem/j5BDajcNON6kPzgAvE4W3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KFE4xqnJ2r2quReqxRPt0HfzXnzk7XpMW/9TX+MpOqG6MxpMQXBR6cRb7rJ1+gQwzTP+Rwae8rOPH9XtqwjDCdUb19up0O9UkS5rvlxr/KURiVotor5aBiJ43N7YBd2fZsJs+7r6DSdEyhgYh/b+zfvqZxdY11U4gOyoVxqmfA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAwSuP4P; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAwSuP4P"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829a9d08644so1551414b3a.1
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 01:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774687411; x=1775292211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3nzGNu2xZzw2bp3cLzv9/0z36OymtFn658cP1Xjwg8=;
        b=ZAwSuP4PBN7KPDlUs5Ao2Jk9ml9nmbwcYX1dXpFK0fahwYiY3Jn2GPGchzIS+73DvI
         Mh1yML35DoHs1sDkn1rgxo1jypRrU9u9JeaGRr12I5wi/9GEdh/ObwOboWPKGSggieMo
         tueDH2uvziDxaB3PQD+c9f+2RzUNO06IhperGi2qFNBWhsZV4THHOSMfP1851cH165Xy
         5KXhY31YPcE26CgU4fIUSHWH2mqPC8lxLNq/FTLa1SqO3zliuRfmxhbHx5esoHsE8mZQ
         7Fjw4Quasnj0kPMh//TvYAcpZhYlJTzFRDNcXJNJZWRdIey+rKuC6DvWO+GnUp37GWAb
         nLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774687411; x=1775292211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U3nzGNu2xZzw2bp3cLzv9/0z36OymtFn658cP1Xjwg8=;
        b=byI8ACUbajiAqw9Jw2l9DbdJk8qqSqrSLZr2eWxdIRTl/ZaECTSSW/dMjNgSJoVRNA
         N8qvCsIh2KYLClaxcOjCtCYwUTXKElSaNhracfAVBDnHnT4fb/N/GupbTTfk9E5e/Bvp
         s/P2QvfGC3YLpICEBdh5Jb1d0r5m/xH6plfcfgQboe+eK8U/q/ICVLFG06RVEWJDbSuY
         a3JqaguMvSxNN8o8x+LyS7tkILUXYaMBRXHiRISvp5JQUIyyasAyX0MxJ/XMhE93P8eT
         fVrd2WyUpOPQTdsCKlyv2yjoO2eB6Ua9/cWOcf/gyZrMX4ttQu81ivgvmUW5CW7VSdsR
         VpfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv9flMnRavVgy7gp1tv/QtH778SLZIpVOQ2J16AQCEDmUTUBTsTqe3sSfA7Ov/Cct/iut4VKgYizXf@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9NFlIvysMOoXyuRnhQZukEPigtdnTh7FkaVfq6kp1lz/h4pC
	6NaikqVXFOUwLODyzUmH6VkSUkQC39SIhLvWPGixQOOlBClvD42ajP7q
X-Gm-Gg: ATEYQzzcBbnwHAilvGi++/iic3GA8BLA1HldpLoICWbfpcghMC8bSxtAoQ6PYwE8MRK
	p2QkrWIhmpH2Gdz4KA0j+VtleqDcZ+CwkwTJ3IeQl7dlzGdKqfHh/ljWTCNjQmrq+cuMJaJLuOO
	FiIfSN1QYFELqSS9UID4SPk91k86cA4EBQobejGeNVrfcSlYjY8KyA6flRQJsLNGM3U6b2a2M1K
	h2fapaZhfRwYcGjNpqIR+vRaPBCZXwE1/xilK40g3M5VQVmBjbsSBr2OEBvQcH7ALPHFNBw0jQC
	6PDggYiwYbo5jLQ79kied0TgRfyuWg7t0l6pZrtlsuSTytrJl85m2CXyYueqhtVJteJyMhdFj2V
	Ap32LaQCwfOf96aWqDY/L2uG1goSc1kEXoP4zHmq3J7QX5e0zqnIq6zIuMpswMX9z1cR6/XrXyp
	reinUWXCsKTrTu9ayv3DxvWGqqWxyuz3jN65B7qwAqrhJIBc4rMcCY/0pQv457sQzhx09fJs6a+
	XfcDSCZb0kARDvDM0GkCCPjFiQ=
X-Received: by 2002:a05:6a00:a902:b0:81c:717b:9d39 with SMTP id d2e1a72fcca58-82c960b1473mr5412817b3a.56.1774687410773;
        Sat, 28 Mar 2026 01:43:30 -0700 (PDT)
Received: from pranav.. ([2401:4900:c0bc:73e0:ffb5:d097:4f0:3e88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b20csm1795725b3a.8.2026.03.28.01.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 01:43:30 -0700 (PDT)
From: Pranav Kharche <pranavkharche7@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: [PATCH 1/1] dt-bindings: media: convert hix5hd2-ir to DT schema
Date: Sat, 28 Mar 2026 14:12:38 +0530
Message-Id: <20260328084238.201452-2-pranavkharche7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260328084238.201452-1-pranavkharche7@gmail.com>
References: <20260328084238.201452-1-pranavkharche7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the legacy plaintext binding for HiSilicon hix5hd2 IR remote
controller to JSON Schema (DT schema) format in YAML.

This binding documents the infrared remote receiver found in HiSilicon
SoCs such as hix5hd2 and hi3796cv300. The conversion includes:

- Standardized property definitions with types and constraints
- Reference to rc.yaml base schema for remote controller properties
- Addition of include directives for interrupt-controller bindings
- Proper example with GIC interrupt specifiers
- Schema validation support for device tree sources

The new schema enables:
- Validation improvement

tested with: make dt_binding_check DT_SCHEMA_FILES=...
All schema validation checks pass.

Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
---
 .../devicetree/bindings/media/hix5hd2-ir.txt  | 26 ---------
 .../devicetree/bindings/media/hix5hd2-ir.yaml | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.txt
 create mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.yaml

diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt b/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
deleted file mode 100644
index ca4cf774662e..000000000000
--- a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Device-Tree bindings for hix5hd2 ir IP
-
-Required properties:
-	- compatible: Should contain "hisilicon,hix5hd2-ir", or:
-		- "hisilicon,hi3796cv300-ir" for Hi3796CV300 IR device.
-	- reg: Base physical address of the controller and length of memory
-	  mapped region.
-	- interrupts: interrupt-specifier for the sole interrupt generated by
-	  the device. The interrupt specifier format depends on the interrupt
-	  controller parent.
-	- clocks: clock phandle and specifier pair.
-
-Optional properties:
-	- linux,rc-map-name: see rc.txt file in the same directory.
-	- hisilicon,power-syscon: DEPRECATED. Don't use this in new dts files.
-		Provide correct clocks instead.
-
-Example node:
-
-	ir: ir@f8001000 {
-		compatible = "hisilicon,hix5hd2-ir";
-		reg = <0xf8001000 0x1000>;
-		interrupts = <0 47 4>;
-		clocks = <&clock HIX5HD2_IR_CLOCK>;
-		linux,rc-map-name = "rc-tivo";
-	};
diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.yaml b/Documentation/devicetree/bindings/media/hix5hd2-ir.yaml
new file mode 100644
index 000000000000..91cba6ec88c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/hix5hd2-ir.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/hix5hd2-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon Hix5hd2 infrared remote controller
+
+maintainers:
+  - Pranav Kharche <pranavkharche7@gmail.com>
+
+allOf:
+  - $ref: rc.yaml#
+
+description: |
+  This binding describes the infrared remote controller found in
+  HiSilicon SoCs such as hix5hd2 and hi3796cv300.
+
+properties:
+  compatible:
+    enum:
+      - hisilicon,hix5hd2-ir
+      - hisilicon,hi3796cv300-ir
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ir: ir@f8001000 {
+        compatible = "hisilicon,hix5hd2-ir";
+        reg = <0xf8001000 0x1000>;
+        interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock 0>;
+        linux,rc-map-name = "rc-tivo";
+    };
-- 
2.34.1

