Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA9739B4A0
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541670; cv=none; b=aPhtGfWS+P9s5V18YWnVW7oC61lDrlCgRYwrLEUDs+OeINFIrgYPGqIEoOVqn5prsIgFT7uSVf/bMv+m3wttGI6mgBUqRt6l9eitj3mf/+kgL1tLg9RAmjLd/1sRa8m9cCh2gaDDriKuGo7D+nwb6fV9iSnw/hdzNqDf/zqQC2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541670; c=relaxed/simple;
	bh=2FY+4h7hB3E2g/vAnzM8D+ctfKyKw0UkzdwKveu8pvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOo6xexHMesERgRrdxtUbaYroOtM8G45ijlbKC9rku+H1CCOFpRZt98EIZGVzF7qhYp7gayu80i5veTVS70bTQBLU1HeeCqB3oA65v9DbZLVXRRrzQvrP+CGSa44v8LW1hW0fFMp1zDuRdy3kI7K7snE5nu13/UmoMfppkmj1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpKblg51; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpKblg51"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7e23defbso401644f8f.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541667; x=1778146467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdHsjRXgE4RkIPMJ+uwSXVihouNvsOsYu4YaJgqIAYA=;
        b=KpKblg51Koxm+Xc1dFb3h4KV0ebQLnhyDFTLRul+oWwQmZiXFpYx/dOndwGlIhjmJl
         ssdPorLDbUGLTp8K2XPiyi9e51e4F9O34+EUA4zgug7auAbQPAs0HpZsb+WY1F7+T8uT
         jrv8fdhho9dLV/uTBaYgiw8WJVMDjMTJlihBZpriwo7ncsqINwQADRv0qQqpc6xaWLau
         Mn25kgxHm10HZ3NlwJnyrFWTm6MZU9ZK9x1bSPVM996836xhCuZeahO8yQMY+sCD++cj
         9684OI6YSYaH0e2algPeMry6Px9hYpAgTw2aeLHtlykB5X/v/JE/zQiVEe9Jjb5HRMab
         HSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541667; x=1778146467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DdHsjRXgE4RkIPMJ+uwSXVihouNvsOsYu4YaJgqIAYA=;
        b=MM3zY7BkVtsoHkXSVqV/5ACUglvUIgNtU0LlWigJUzdpVTkoKfzV5D4rOGYtZn/WDl
         uSTdZoZdlKwvr2Mi1UNJf11WDShjVHIxoekRC89xs6vvcwtYEqG5zwZ5KUTNk3G0IkdC
         mDC5PS8Gy7WUrv/GIZwXzzKSoG+p8LHNg4S4AmtWVk7NTYuH8syvlnTlXw+JE6RH8QLI
         Huq2FcFXXrGZtvYjP/Zz0mdZTtOVNQhO9KMXIxUCHIlCNOIFIQskCBs0x04o46pt2LpY
         gLxyBt70tOJudOIGBqU3FSw8zX1VpxqYfsN2sr9lcEE86Zikq9yl7cECQflfI82WeX+K
         sXEg==
X-Forwarded-Encrypted: i=1; AFNElJ+Oxpr4MhvRRu4aWnNTEuUDTHLRtKUV1DBX8gSPq5SCeUP2TOu/SK+eTcgfdZJakhb/eBXuYmno+UZG@vger.kernel.org
X-Gm-Message-State: AOJu0YzTa7vH0CnDr86R/pGFwoCeWFpZ3rfq6EbnVOX84QSWUxVSRhti
	fGd6+IBTYT2NKPaH5qqQ+naBu2MNos8r1slmWew8Br7nTndYaQPMlQCr
X-Gm-Gg: AeBDies24iYTY4QQzJ10Ze8u7f0MUi0+QlU+m6WiOwvgwbsBfDxyVSQwjxEi7NFWCje
	xVQp/VwBtlJXBCRwDynaoBrqrngWlCIUVyihIxbN+u8ha6jtUI/v7HRiqxPxFnNPQydkawjh6cU
	0HAKEOpjkxt7nBQxjLXMvZT117LzfN7A2NmTMuKyLNUSG2CVAbJPFzn/1l2qb8HchNLkUQw2wC6
	BporAWzwHviol2D2YrVOZBLkeiudkrQzJshZiILUZXPau0a+p6bzJo6Nz9FSeK2ebu6qM3si8Jl
	r+G0wxoaGsoRtFDxcx1pvnJUlC+o66eemrQEFgmQpLly7crsXcQ3s7mP2LsFqouopEw8I/KWkN5
	TGzIdh/tGRmaN60s7lH19BL0Mpzx4U1IS7dTaD6BftJDB2QggVRSfYmjSN+x8/i/a39AI0Z76Om
	AE0NuLP8o5QWma6N2BgK67Ws1b98UFoxGsN24zBfVdnTbbqTSlv0T4G29y
X-Received: by 2002:a05:6000:24c9:b0:448:e182:b7ae with SMTP id ffacd0b85a97d-4493d8f4194mr3306042f8f.7.1777541666717;
        Thu, 30 Apr 2026 02:34:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:26 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
Date: Thu, 30 Apr 2026 10:34:06 +0100
Message-ID: <20260430093422.74812-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add documentation for the pin controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
more pins.

Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
numeric ports.

Document renesas,clonech property for controlling clone channel
control register located on SYSC IP block on RZ/G3L SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Dropped Port P4 as it does not exist on RZ/G3L SoC.
 * Retained the tag as it is trivial change.
v2->v3:
 * Documented renesas,clonech property for controlling clone channel
   control register located on SYSC IP block on RZ/G3L SoC.
 * Retained the tag as it is similar change for RZ/G3E thermal bindings.
v1->v2:
 * Collected tag
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 20 ++++++++++
 .../pinctrl/renesas,r9a08g046-pinctrl.h       | 38 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 1a94e396b1b0..fb1fe1ea759f 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -26,6 +26,7 @@ properties:
               - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2} and RZ/Five
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
               - renesas,r9a08g045-pinctrl # RZ/G3S
+              - renesas,r9a08g046-pinctrl # RZ/G3L
               - renesas,r9a09g047-pinctrl # RZ/G3E
               - renesas,r9a09g056-pinctrl # RZ/V2N
               - renesas,r9a09g057-pinctrl # RZ/V2H(P)
@@ -88,6 +89,16 @@ properties:
           - const: main
           - const: error
 
+  renesas,clonech:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to system controller
+          - description: offset of clone channel control register
+    description:
+      Phandle and offset to the system controller containing the clone channel
+      control values.
+
 additionalProperties:
   anyOf:
     - type: object
@@ -150,6 +161,15 @@ additionalProperties:
 allOf:
   - $ref: pinctrl.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-pinctrl
+    then:
+      required:
+        - renesas,clonech
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
new file mode 100644
index 000000000000..5ec5bfc27c7d
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/G3L family pinctrl bindings.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
+#define __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/* RZG3L_Px = Offset address of PFC_P_mn  - 0x22 */
+#define RZG3L_P2	2
+#define RZG3L_P3	3
+#define RZG3L_P5	5
+#define RZG3L_P6	6
+#define RZG3L_P7	7
+#define RZG3L_P8	8
+#define RZG3L_PA	10
+#define RZG3L_PB	11
+#define RZG3L_PC	12
+#define RZG3L_PD	13
+#define RZG3L_PE	14
+#define RZG3L_PF	15
+#define RZG3L_PG	16
+#define RZG3L_PH	17
+#define RZG3L_PJ	19
+#define RZG3L_PK	20
+#define RZG3L_PL	21
+#define RZG3L_PM	22
+#define RZG3L_PS	28
+
+#define RZG3L_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZG3L_P##b, p, f)
+#define RZG3L_GPIO(port, pin)		RZG2L_GPIO(RZG3L_P##port, pin)
+
+#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__ */
-- 
2.43.0

