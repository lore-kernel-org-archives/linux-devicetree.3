Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B93C33C53F
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443999; cv=none; b=dRwMDWW/m5CvO+PEWNqSEYCT0wZ+EXdnuePd9mrL0M8ilHuWvi1lreiyLZ0mkQQKm+cJSPUOI8poeNIR8nebx8SprnQ4osHxNlC5hBWEwYTFvHlSD0fTzt0Ky8tI+Jc9aQoI3u4TjDVZTJOwRgqtQRTaiSVEcZIGpI4BJnYZ2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443999; c=relaxed/simple;
	bh=DCs64t6ILvp1G2L1GiCl9DEexyP+6/3Iz6bAhpmkNTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZLDudb3DVzd0R3f542U3EIDiZ6khOv5SqcQl3ejfTqOqTnfyoGUiukbjl4sda3uWNiBgc6WVe2PMutHS0yu8kQ9rHV3eu4k7aOrH4mPOIX0CssQ1CE6DYeuJmUxSRgdT09G4u395evW8N6XKXS4CfE+qtJVPMpfd7mX+9iAiyPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOy4y46a; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOy4y46a"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad9f316d68so13814655ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774443997; x=1775048797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2a6VH5mySpW506GVneDmVFhcW10r6kZBilzxo1xGBaY=;
        b=DOy4y46auRf2pARfIaX1XeCOy0cQ/jpoVHCgWOVH8NxJZTBxS0InfgEtM3jjX+HFh0
         G/Y8+to/dBzHqxepuRm8iTA/SyWIHYd1V0pj+bydZ+j52yecRA09ewSIO9Gps98MGwX+
         PboiHv5fw7wdoRubhm3I8EA2/SkJ6Ppf2u077zkh1V9fRvIJ0TBxoFhpbfuWFo4bnHdH
         PANIdg2T6ysrPJM6uaEKOl3TTItiQl22u6L2i83+CYKPxYlL4GvXbncFOZmFjko+wAaq
         +5bKn7C7SriWkNlAX8rn+rB7C5gGiTjebfbcaRBr5g7CYc254e/0DYkdBOuUfm/8SaaB
         4ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443997; x=1775048797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2a6VH5mySpW506GVneDmVFhcW10r6kZBilzxo1xGBaY=;
        b=BgtBy4PApeuyLTZacRonOrGeUs5cUvHFgl4RE7pTZvHbK43eYmuPslCjmni6SqVBt9
         EW237of63LLvAAR3PP5Wgsybph4spTYiEPxfUpVsIqJACjU+BP9akc54xMsDuaz/vmIA
         K5vIMWqOnZOVqc5GZxZ/g+DaaWTRxcMVbPNi+tFMFzeWhpcU/rw570/qP/+zlFydiVrq
         FCvmxd72TRs30pAjjhzrvYKTmTVr36pVPUWaTi3uhffoQut+hb0OF07zW/lwTOZobYt6
         LA0kx0ezvhxKf4RRZLlvJGyT/c8zNhFzotv26pZhQbwt0kPqct+yi6GHmjDiS7IwiCu9
         LFmA==
X-Forwarded-Encrypted: i=1; AJvYcCUTvcxHpal44rJZk4YEOmrZLYpWGtkVmDYe+TNY9l5+UmdgfvJ8DKxOryNwq9D4e3il5xVkyVBYKmNd@vger.kernel.org
X-Gm-Message-State: AOJu0YwkQ8zHAPILsQCdGrbOeGQqwzno2GUV6wOa3SAvQqg8P+CvzWbm
	OG8aIo2Lmkq2PSWJu4OALKEDmtzUXw/ghLhi4qixSxCC9g2TvrMOentc
X-Gm-Gg: ATEYQzzM5rbIkPpqq+UnHllRb2KDfxfYxQ8mmG0wKWc7/ytr7yl2oXyZrBXjRwK6Gys
	MFNWPDRt413Lf2wz1EHX84XdSD2mN/ev0dOPx8URrOk9Gbnx/NVxsZKlYo8XDHj0o2nMJ4FkRN+
	yVaziyhDZqvyIN3N1e457rMvu10rtq1ppX6WJUG5H+BGIL2vZ3xKsOZ0SuXIgcr+V8VNP7p3AG0
	UX4AIvtX8BeJ2jANJqfOj87kST1l4NPQI6U0EUvl8GP4gYn4bMBk1vLzLmheOjF/DIr2fyenjYh
	SpGpZmgpBH6ggh8bB2woXDX3QuOeQO715P4vHhakMHJvb6qknbb9Xusgs6k13JFQQ0yjEK0qUKO
	DcuazGRSQLoWG/bkA1zNYgISZUXotsIadSxlkxN0U9PVvBgdNL1v415d1b/FvWvlrSR6hLcfL0e
	9J6IcY0uLABU6XSJ/WDrQJIcikf57Nt0XDzsr/MYIZvY9TcHYHjWZ7Rdp4r8gss01Fr3zSYIxYe
	7Y=
X-Received: by 2002:a17:903:1aa5:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2b0b098902dmr38868845ad.11.1774443997437;
        Wed, 25 Mar 2026 06:06:37 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08369617dsm234356445ad.71.2026.03.25.06.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:06:35 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	lee@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: reset: st: convert to dtschema
Date: Wed, 25 Mar 2026 18:36:21 +0530
Message-ID: <20260325130623.36710-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the STiH4xx reset controller bindings to DT schema.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes since v1:
- Changed unevaluatedProperties to additionalProperties
- Removed the Suggested-by tags

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../power/reset/st,stih407-restart.yaml       | 31 +++++++++++++++++++
 .../bindings/power/reset/st-reset.txt         | 11 -------
 2 files changed, 31 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/st,stih407-restart.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/reset/st-reset.txt

diff --git a/Documentation/devicetree/bindings/power/reset/st,stih407-restart.yaml b/Documentation/devicetree/bindings/power/reset/st,stih407-restart.yaml
new file mode 100644
index 000000000000..0dd7f5e98157
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/st,stih407-restart.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/st,stih407-restart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST SW reset controller
+
+maintainers:
+  - Lee Jones <lee@kernel.org>
+
+properties:
+  compatible:
+    const: st,stih407-restart
+
+  st,syscfg:
+    description: phandle of the syscfg node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - st,syscfg
+
+additionalProperties: false
+
+examples:
+  - |
+    reset {
+      compatible = "st,stih407-restart";
+      st,syscfg = <&syscfg_sbc_reg>;
+    };
diff --git a/Documentation/devicetree/bindings/power/reset/st-reset.txt b/Documentation/devicetree/bindings/power/reset/st-reset.txt
deleted file mode 100644
index b63948737d80..000000000000
--- a/Documentation/devicetree/bindings/power/reset/st-reset.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-*Device-Tree bindings for ST SW reset functionality
-
-Required properties:
-- compatible: should be "stih407-restart".
-- st,syscfg: should be a phandle of the syscfg node.
-
-Example node:
-	restart {
-		compatible = "st,stih407-restart";
-		st,syscfg = <&syscfg_sbc_reg>;
-	};
-- 
2.52.0

