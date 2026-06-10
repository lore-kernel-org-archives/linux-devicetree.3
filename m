Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25D03E120D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090946; cv=none; b=haWjj/U+mYP/cE1gHYfJsfi1Q49Bn05KdCgBb9cxW9yv0PvbmiDtxrqhXyTWsn9VEXxIZznq50zeABApiJpdLqEanwOCnz2XevBvHNzdOjLmBQY/3EyvQj3kz0qqQpToIR9WbQ7uxGaQ4VtRHPlZuuc8EEUZtxSu7yD/QKaZWfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090946; c=relaxed/simple;
	bh=fJ/X2iMoUiRd4gZpRf8wNUnMn9HbcgDtYX8aA5wPIMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N8Gq/Tgxut1UIQGXs8LrhfV77A8AkkLbLb+Tdx77mL9ocuvwDEv9V02LGlPBajNL4KMVUWhtf299RzF16nWFy+YqrSmzHhrFn1MxEzdAkFLq3W/NyFwGESG9yH2CGsjRhm+BJnPU2uRlBJmK4Sb9J6CjTWos02CTrxYBbYo0nNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bibuHV0U; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bibuHV0U"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b903567fdso6675879a91.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781090944; x=1781695744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA6ihoM1lqsXloyq8orrS5aE2lQH5FPEqZNihMpid8o=;
        b=bibuHV0UsfcXyutMNZyHkGE6QOYfC0gxv23qr2wK2QQeZxiqneFsq6YagsrHeMAPJ6
         OG+JSI9pNtHKXhdHHoWyM3SDAzX6YdNkjMACYPYMxJCVuXy4gYpzCzJdFe3w0mh8ETEp
         FPwpruzS1znb5hVBfN8HTwvk0ymqv9jJfBeph6Z0fTDp1I0WIxno0SouY3pJ74aAgNJO
         OZiOhg39QbqXC/Sd8OZpeZdEz4X4eVmeIU8fHfg8+mqIkrpFX5MzKI531IKdlDL1R/lg
         DW460hVv9rvxJNW4yTL64Oz/fbA8fm3JVbneqUMVVfSEYYbO0IJRfHkaWLatb2cc9BLk
         5jYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090944; x=1781695744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WA6ihoM1lqsXloyq8orrS5aE2lQH5FPEqZNihMpid8o=;
        b=qw9lScel2sSvjI54c1IxdnUhL3sTo3QxooyZGE36d+OzxMC+PleS+Vcax2ughPoUB7
         8YIfteHBzh5gzirjLW31kf0kq2Wm9BwbU1/WwK3taTaYUe9jmWxsubdQblQ9BbVAxpsF
         WmGalsZMdb4axSQ/jILPXPfZC0IBHTMXv9lhnOyrNMVDH4TkAAt69y1/hHX2i2SJEP8G
         chzrRd/gN6dY67i8HtthQI6xb9wrk8hrXd8ieiD1aaP8trZuFCv1xIU0s64TSFk3ZhGo
         0db2T4iT49oBO52tS5TdM7PWAMknTfpnx16F2HPsNo4Egms53u+Pfowvs8IOQtDd1zza
         qxZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9H2ChmXzI/nMko67/7kkWhYksGYWD50soYB9DybULNQDrT1Ou0TjpPwM4ItPQQoquQykWOC/5ADogv@vger.kernel.org
X-Gm-Message-State: AOJu0YynP73EuZeDgzfnsujNacG7dgHchcGdVCWVvErVEMHIcLGBtqil
	TKr+WxQ3/g0daa3/Aiqm4isTG+o2ZFjX0pcvvAb1+sRwImdwrGBFGPvN
X-Gm-Gg: Acq92OGtJsHVrFgU/32PsE0iXuN9KZChn7K9AqtTFcY3YogCbyqNjoVXEBpBShYsVgX
	U2tIE0l1sqJpR7zLnCWSoq7cmQzlhRZXtgsvCMq6fLmE7IH6mnI1vw5Ng05jZnP3Zy2aKBqtaVo
	P7/l9HUoqvvTjC0gPmhYLH51PKV92vKLgbprdyU5c97d9pvpP3K1lfsQ+pIJIhhbHIlDWqz62nv
	HHluq3YWHTvSSPnSFe5BT0+iptmvp7+ANwL3ecdPo0goFIwTfoQf1YRm4AkhuFY7H2R1xpxPpp2
	zHZzubX2x2/CrY5uXCBTm3BOQm3mOrXn/CCPj9IFfTCI/+FuC8wn9QM2dtfzamULSDDlXqMvTlS
	Pp3B6vZWU92xqKMmidfwXzGfJKyCBAOaKkDgqrNflyLzRg+HupPQ3AhzOIE9txpTNlxpwpgxVOp
	A1MTLDZKgD5DrVG0TUaglxOUVrKLZc7Gx0n0Ia2Z81hFIs0X3ieJsQug==
X-Received: by 2002:a17:90b:5783:b0:36d:ae6a:22ed with SMTP id 98e67ed59e1d1-370f0f43e72mr27042985a91.22.1781090944288;
        Wed, 10 Jun 2026 04:29:04 -0700 (PDT)
Received: from hc-pb-01.realtek.com ([123.51.179.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376460ee14fsm2027651a91.1.2026.06.10.04.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:29:03 -0700 (PDT)
From: Jason Li <jason.lee651024@gmail.com>
X-Google-Original-From: Jason Li <jason.li@cortina-access.com>
To: jason.li@cortina-access.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: serial: Add binding for Cortina-Access UART
Date: Wed, 10 Jun 2026 19:28:19 +0800
Message-Id: <20260610112821.3030099-3-jason.li@cortina-access.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610112821.3030099-1-jason.li@cortina-access.com>
References: <20260610112821.3030099-1-jason.li@cortina-access.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding schema for the Cortina-Access UART controller.
This IP is integrated into most CAXXXX SoC family members.

Also add the vendor prefix for Cortina Access, Inc. and the
top-level ARM board binding document for the CA8289 (Venus) SoC.

Signed-off-by: Jason Li <jason.li@cortina-access.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../bindings/arm/cortina-access.yaml          | 29 ++++++++++++
 .../serial/cortina-access,serial.yaml         | 46 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  7 +++
 4 files changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cortina-access.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/cortina-access,serial.yaml

diff --git a/Documentation/devicetree/bindings/arm/cortina-access.yaml b/Documentation/devicetree/bindings/arm/cortina-access.yaml
new file mode 100644
index 000000000000..ec0320ed0c0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cortina-access.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/cortina-access.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina-Access SoC boards
+
+maintainers:
+  - Jason Li <jason.li@cortina-access.com>
+
+description:
+  Boards based on Cortina-Access ARMv8 SoCs targeting networking and
+  access applications.
+
+properties:
+  $nodename:
+    const: /
+  compatible:
+    oneOf:
+      - description: Cortina-Access CA8289 (Venus) engineering board
+        const: cortina-access,ca8289-engboard
+
+      - description: Cortina-Access CA8289 (Venus) reference board
+        const: cortina-access,ca8289-refboard
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/serial/cortina-access,serial.yaml b/Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
new file mode 100644
index 000000000000..5d7fdd954491
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/cortina-access,serial.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina-Access UART controller
+
+maintainers:
+  - Jason Li <jason.li@cortina-access.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: cortina-access,serial
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    serial@f4329188 {
+        compatible = "cortina-access,serial";
+        reg = <0 0xf4329188 0 0x30>;
+        interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&apb_pclk>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index dd94c50e97f9..837e2a92e7e8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -367,6 +367,8 @@ patternProperties:
     description: Chengdu Corpro Technology Co., Ltd.
   "^corechips,.*":
     description: Shenzhen Corechips Microelectronics Co., Ltd.
+  "^cortina-access,.*":
+    description: Cortina Access, Inc.
   "^cortina,.*":
     description: Cortina Systems, Inc.
   "^cosmic,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index 20bd55913b2d..cc261888fae0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2820,6 +2820,13 @@ F:	tools/perf/tests/shell/lib/*coresight*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
+ARM/CORTINA-ACCESS VENUS ARM ARCHITECTURE
+M:	Jason Li <jason.li@cortina-access.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/cortina-access.yaml
+F:	Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>
-- 
2.39.5

