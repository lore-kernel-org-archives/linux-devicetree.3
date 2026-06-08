Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AD63D47BC
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941285; cv=none; b=q2j6Z4pFaHqzatkWpwO/RFCOGoThmrrQJgElKIXdtS042nJM+mE7MoDb7MMxzkiIH/1IfWmca4KZaD1+k1Pe093+YVV+aIkCQVd7UOWKvL4UbF56dEDlYpX59tssS6kGMTDJpAVqk3ELz6ES0bH3OkDXkrh/Muf4cLDgMwELvCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941285; c=relaxed/simple;
	bh=XayICwFkwW/+7qGqZ2kcYZqH/kP1XVeb1pbxcTbir+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EEe14Lh7O/579Cgo55GeArVnYu5GZnINdqMrAy2/FeFCa6NZOnUQPc/kKhbSSkEMMgiT5ULtXm0zHbQf/sTWnGd51afd0Appp4HXkALbXw8BWThJBHVJs2D4E/B+ILAqRTNWB71qYVyPUpLdxGrMA84tEgZyPa54Q9Fjw1ebw1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq9N/DYU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq9N/DYU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso2214025f8f.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780941282; x=1781546082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQnDKAgbConHDQBUycm84vQeAcwqNLay1jFwOQCu2Sg=;
        b=fq9N/DYUWBbkV6ARncoyoN/WZ7SdHEYBN/Xyd7BxNCkJK+kUgxYxL553dsQpW8qaTE
         ZjF8x9qqIrp/IcUmbff6/zBaBZ2YGa0JJVj4kYIABVqRW6kkTD+lN3dq9DUcLtrhVrq4
         Sk7cd92fqutwYNiJzhha2t1s8bR2HJRevMlHiws8tP+toEkFSmIFlJPW7HqpdouVKAHO
         r5++xZLiPR89wRaSUheICbK5Kh9qDlKQeRcT1RGl9FiTBVBfC57sEyC08FZvtYwPp2r4
         6j5TJbCRN0cPKVN9Wor12woOw9gjhtaZzH9D93DW3V1QomtXOW1KDSAgjFL8ifpU0hUe
         bZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941282; x=1781546082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yQnDKAgbConHDQBUycm84vQeAcwqNLay1jFwOQCu2Sg=;
        b=HrzaXpxaGJe0gklA8E2SNCltGqrURkaf0X3gxdEO0f9RzwQeqrd/SqaLJedxBhoiNF
         1QJFNo5VcA22KA2kW1gqRPB4yW4veacyTReKQ8DqleYiErZnGY71/nxduciTL4mW3x+G
         4/m6m7mSz9q3MwONBIv/dmvE2bJXyZSuTJfEBhrWql0k3Y7QCNwYl+zGvcyX4yH7xIZ9
         hjSjaKlfIrJzDX0Obfuo4JPi/TdNogUxDvc+79eA/5zEvDkoN4frdICyBjhJrBcTIatN
         SJhSrAJGZWxNrKtmsU26lGGu0BISOb1I6oH1MriK/e5LPjRD6wnHa/GHLMnKFkGA+pzP
         I0Lw==
X-Forwarded-Encrypted: i=1; AFNElJ89a76r9EHVFnLAWwYzqXlcFSFWeaxWHYlcbF2SGgNwY4pEa2S4xIPCKvP1qmPW2/jCm7Uta2HMqG+5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0NLev7g8g1qSIoUHq96nGGuGz8qDxnwHWE8e9n7JBj1jxSLv3
	aqfwHiCrNVyQBZJVvUO6utFPvrbhvQp+3q8L7Tq3ARGWg9FTXhPmIXxL
X-Gm-Gg: Acq92OER3cvyCEf92rVlEuM1u31CjGS6pnCmj1tOnewqFsuaN+3fCEP9ZBkG/T/72gV
	6zwvUBgQago1Bf2aOHzO9lckV90SKbS7RKQn31Z+vRNQMt8qi+QKrR6iFJv0KxJufad1gYMCB7T
	gPKrkdyx/0LcMrBZXhHXaoum1UXFjHbZPioE1OUQMqsRF4IfQ1xfCn7nAKl94cX3jnWj0SbuBcu
	s/57UR0FagVT7HLmMTUArqUsd5Nkp/zAGaJ4vj1YuD75DJR+LampSUwwkICtSOHb49ygnbjsndY
	VhD8eHRA8A+hlgZgV5bCoZm+3nGYfHONc7JdcIwirW+5f2V7F65hZ/6HM6+3dTKiAGx7LVEApj/
	6+WEMsbCErYuncnrdH2jOxBhoKQBDaWqtBikuAGVPr61tGd+WnnNYrF3kEBDP1N2d+j3ADz4JbN
	/ew7p8espCcLp41zUeu4e/5OvoGMf0nl7m1ioC7/E04xUsclSxg4ZakIE=
X-Received: by 2002:a05:6000:46cd:b0:460:1492:4f0d with SMTP id ffacd0b85a97d-4603063c591mr16901396f8f.34.1780941282010;
        Mon, 08 Jun 2026 10:54:42 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3529e0sm56269275f8f.28.2026.06.08.10.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:41 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v2 2/2] spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema
Date: Mon,  8 Jun 2026 20:54:18 +0300
Message-Id: <20260608175418.1936892-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608175418.1936892-1-tmaimon77@gmail.com>
References: <20260608175418.1936892-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Nuvoton NPCM FIU binding to DT schema format.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/spi/nuvoton,npcm-fiu.txt         | 58 ------------
 .../bindings/spi/nuvoton,npcm-fiu.yaml        | 91 +++++++++++++++++++
 2 files changed, 91 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
deleted file mode 100644
index fb38e96d395f..000000000000
--- a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* Nuvoton FLASH Interface Unit (FIU) SPI Controller
-
-NPCM FIU supports single, dual and quad communication interface.
-
-The NPCM7XX supports three FIU modules,
-FIU0 and FIUx supports two chip selects,
-FIU3 support four chip select.
-
-The NPCM8XX supports four FIU modules,
-FIU0 and FIUx supports two chip selects,
-FIU1 and FIU3 supports four chip selects.
-
-Required properties:
-  - compatible : "nuvoton,npcm750-fiu" for Poleg NPCM7XX BMC
-			     "nuvoton,npcm845-fiu" for Arbel NPCM8XX BMC
-  - #address-cells : should be 1.
-  - #size-cells : should be 0.
-  - reg : the first contains the register location and length,
-          the second contains the memory mapping address and length
-  - reg-names: Should contain the reg names "control" and "memory"
-  - clocks : phandle of FIU reference clock.
-
-Required properties in case the pins can be muxed:
-  - pinctrl-names : a pinctrl state named "default" must be defined.
-  - pinctrl-0 : phandle referencing pin configuration of the device.
-
-Optional property:
-  - nuvoton,spix-mode: enable spix-mode for an expansion bus to an ASIC or CPLD.
-
-Aliases:
-- All the FIU controller nodes should be represented in the aliases node using
-  the following format 'fiu{n}' where n is a unique number for the alias.
-  In the NPCM7XX BMC:
-  		fiu0 represent fiu 0 controller
-  		fiu1 represent fiu 3 controller
-  		fiu2 represent fiu x controller
-
-  In the NPCM8XX BMC:
-  		fiu0 represent fiu 0 controller
-  		fiu1 represent fiu 1 controller
-  		fiu2 represent fiu 3 controller
-  		fiu3 represent fiu x controller
-
-Example:
-fiu3: spi@c00000000 {
-	compatible = "nuvoton,npcm750-fiu";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
-	reg-names = "control", "memory";
-	clocks = <&clk NPCM7XX_CLK_AHB>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi3_pins>;
-	flash@0 {
-			...
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
new file mode 100644
index 000000000000..0f95def01910
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,npcm-fiu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Flash Interface Unit (FIU) SPI Controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+description: |
+  NPCM FIU supports single, dual and quad communication interface.
+
+  The NPCM7XX supports three FIU modules:
+    FIU0 and FIUx support two chip selects
+    FIU3 supports four chip selects.
+
+  The NPCM8XX supports four FIU modules:
+    FIU0 and FIUx support two chip selects
+    FIU1 and FIU3 support four chip selects.
+
+  Alias convention:
+    The '/aliases' node should define:
+      For NPCM7xx:  fiu0=&fiu0; fiu1=&fiu3; fiu2=&fiux;
+      For NPCM8xx:  fiu0=&fiu0; fiu1=&fiu3; fiu2=&fiux; fiu3=&fiu1;
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-fiu # Poleg NPCM7XX
+      - nuvoton,npcm845-fiu # Arbel NPCM8XX
+
+  reg:
+    minItems: 1
+    items:
+      - description: FIU registers
+      - description: Memory-mapped flash contents (optional)
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: control
+      - const: memory
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - enum:
+          - clk_spi0
+          - clk_spi1
+          - clk_spi3
+          - clk_spix
+
+  nuvoton,spix-mode:
+    type: boolean
+    description: Enable SPIX mode for an expansion bus to an ASIC or CPLD.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    spi@fb000000 {
+        compatible = "nuvoton,npcm750-fiu";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
+        reg-names = "control", "memory";
+        clocks = <&clk NPCM7XX_CLK_AHB>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&spi3_pins>;
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+        };
+    };
-- 
2.34.1

