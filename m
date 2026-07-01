Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6067639021D
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926367; cv=none; b=DPV5B/rvMo2uNF/Judk7Wihu7E1J2kt8Xq9sBJbxMB0EFp/RFkTSiF+oUMb2bShTZxIh7YZf8B9Vm/pbG54BbvhUeuGUYpriGStmIcRq3HLq8Cq0M+8x0HF0ZL/XhVtvj6dvY7g5iHrs9BnZBNk5ZRxwNv/BfaKEH8fOY79XILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926367; c=relaxed/simple;
	bh=5bhvD+nRcVIb8srILoT2JhrwKmYl6bpoUDx5N2ye8hE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uzPFb5F+KYYg8De/SQNCjiaXYqkVL4xwZcimoRF1bbXEh7DZO8aImhIMNWRWHRtyY3/xlxnS0e5TUd5RwhwMfz4VM+JYNaUXreXfa+AR87jIdmyW+52GH6+CNEmKsgzqWrfxgkjPSL2cO6IlcfyPjIsZQU/7aUZfABGHrooVI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qD4CTrmn; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qD4CTrmn"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-842358aaf36so373461b3a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782926366; x=1783531166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tj4zAkM97ykSNm2NxrzOr6EmDioqKrT1a10snYm0euI=;
        b=qD4CTrmnKdKQ8e7YbnPbMttj2+NW66kyAZlUMZDTxXaacbJDNFs4lNd56CjR0def25
         pCNDBf7UbjG2A+bXFywKDRIGKFcV3Xwv1UAVvJqQxxowdoalL0QGj14PZKx/wz0MYFfM
         Qomu06GXqnDW2Cx7NGT1nz4M23lCui3Eo8ZLYMEto3VFLSYn8Bo/Xm8M41JeLNZAou5b
         WPAnxAMvPsuq/y3V7KzMQOSvzsAakZrq51Dyhu+Q1VphE3ltMv9J4awRv6TcT/4eDcep
         0K+LRmPWT9k7TvF6fFDYOQakQ2YmQLbCK3QhP/DVVLOWKzPLSd+8cQYN2E6/rslv66+/
         PiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782926366; x=1783531166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj4zAkM97ykSNm2NxrzOr6EmDioqKrT1a10snYm0euI=;
        b=W74/FvOc7ZoemiprnkgjgUnZ1VQmhMn6sBi13pi/Qj6WRtsvIhzdjN3ybV/UHSwnyl
         Yo4Te3XtROOK7tUV1J+FI4xxTeAVxV1EZ3JDz5oRUwvbU3//bTF9ZSiGRp1VmTDUg5/j
         8BqXmCt0NenqtnQMzekQXzKIrckan2dNjM2zCVUmZijy8Fdjwxs8fFns302vBvYhK4L6
         edAVVdFwiodsIcE5D2iTb1FrAb4hwQ7VXB+6l+tzUxEIdapTBZaZulVAEMwTA+ZrTTtP
         qp+l+vcTYhVP9cYWiSc5TZJ2C8ivLZsXlMgoWvAWLmNkvrKD2DdispbNRSGO04c+hthc
         n9dQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rHfxxcTQ+TPciPKFrEHCodMICUVjcEJERiuuxn7WzvMkuJy/C9sBF43EjzxrMZVc4q83zRT5M+doR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx52KJlyyumOXsl3T/45bdn+4OY5t5N2aBsuxG01FcueQ659xB
	At7cLxTinHkOGQ3KKQ/eSNI2xS/M8YmB2NC3PxEYNWay008GWaMQ1CCT
X-Gm-Gg: AfdE7clmUxMXMokfxiA4Y5MZolK9bzSB8Ncih2I3+zbGWmS9u1eCTVRqJoGoSzMyr/n
	iuVDXDT/gSO1Gp7eAWfOPwq8xljjX51ngO9yyoo2xqwoDegiuS0+B023YMsJV8M7P6GURvsWMeE
	7JtwRzBSL5LUBahe3Iu0keaPIwxkUj+HbU8UsdMpRjJgIGhZpCU4C7m+KKJO1fPNXMGXYj4FHrX
	uhnVtXngfeWbsWDmKNllZpXp5JPxrZoz49wuh52LXBfCHayST9YsOrzpWADDLDXqBi/oBFmcDQp
	B0rEgGohdVto3r98CRSDFGIc0gMOVBeKAo/TUYAuZdZdK/3CC4il2xNBWIbDMXNFGQvyStuObkS
	VvKHgSvEFiGez6yXHXIQurhOLOIWY9gPn2dYyafvHvTO4+3vfGmDhOj9ne8UswkbIMtB04ZGuC4
	E6iUVTnUrLJDosJi+PK8bdTCoB39Y9BA==
X-Received: by 2002:a05:6a21:116:b0:3bf:b4ed:5579 with SMTP id adf61e73a8af0-3bfed571ba3mr2768071637.59.1782926365419;
        Wed, 01 Jul 2026 10:19:25 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.164.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5c4c3sm22724178eec.2.2026.07.01.10.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:19:24 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH] dt-bindings: watchdog: microchip,pic32mzda-dmt: Convert to DT schema
Date: Wed,  1 Jul 2026 22:49:17 +0530
Message-Id: <20260701171917.263050-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Microchip PIC32 Deadman Timer devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../bindings/watchdog/microchip,pic32-dmt.txt | 19 --------
 .../watchdog/microchip,pic32mzda-dmt.yaml     | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt b/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
deleted file mode 100644
index 49485f831373..000000000000
--- a/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* Microchip PIC32 Deadman Timer
-
-The deadman timer is used to reset the processor in the event of a software
-malfunction. It is a free-running instruction fetch timer, which is clocked
-whenever an instruction fetch occurs until a count match occurs.
-
-Required properties:
-- compatible: must be "microchip,pic32mzda-dmt".
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- clocks: phandle of source clk. Should be <&rootclk PB7CLK>.
-
-Example:
-
-	watchdog@1f800a00 {
-		compatible = "microchip,pic32mzda-dmt";
-		reg = <0x1f800a00 0x80>;
-		clocks = <&rootclk PB7CLK>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml b/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml
new file mode 100644
index 000000000000..01638624e334
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/microchip,pic32mzda-dmt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32MZDA Deadman Timer
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+description: |
+  The deadman timer is used to reset the processor in the event of a software
+  malfunction. It is a free-running instruction fetch timer, which is clocked
+  whenever an instruction fetch occurs until a count match occurs.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-dmt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,pic32-clock.h>
+
+    watchdog@1f800a00 {
+        compatible = "microchip,pic32mzda-dmt";
+        reg = <0x1f800a00 0x80>;
+        clocks = <&rootclk PB7CLK>;
+       };
-- 
2.34.1

