Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D519AEEB3
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779621339; cv=none; b=dQuyCoHXRT1UVbfZsfHE5TBxoySDPr2XFhq7voqy4EB7H8UMW3XeoDxlhpMvV9ONB6z9+TUmNONrTN0p3OFteGDEegG9tzsxZ2u4KygPpS6yS/0OYgwRz+aAoV41tkgRIwoPMtb1W6pTA+CSKz6IIr7Js4VKam1ic+yvSexN8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779621339; c=relaxed/simple;
	bh=kjZPi/r0RroY+ClFqeJNnj8q1owdSDC54noh6custV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCnIZirY1DwAHXCrOrux4TxOiqrkmMGKUtgGsuQC6KpxFBr4FqGVymjhvY4YRjM9wDdPTO0owWoO3g4ZBLY7EB7Zm+ddwB2dg2dvo3gSRlYbnskWhfK7Ssf0aDshue7VvfTBT6YmTsEhoNkQqhO0KxExHSpysJqEsCeDOf1fSv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLg6gxah; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLg6gxah"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bdeed4f717so45158125ad.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779621337; x=1780226137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tMbYM6D21RSnrC33rDKKKRvanVXihrBst74X+roYqJU=;
        b=nLg6gxahhkHGO/5ltrZ2h+Xfx7Ml5ByVRB+Do3QcyYTJnAWGQazE7HLxkZejygfM/J
         pgdqy1qZlORzbbji8DoOq1hs51l/syppahkNzdZlITYkuSzAD3NVoAWZPgPPxOEaHZ0K
         7ooRveXlqYP6JXNt1dncHk0u4wkPgLTl7uLSGiB5qbe+b3lyad4fVk3ZRBuYsUli/AOA
         rjel5oJjH3apTtM4j8x/jTA7KRoT0RlaSjF/0MFA/XOiCst4+apog+I00J401IMbOY7I
         zqsZgQAXZF8IiVBlRMTV9ackT0PjqMTe2izVnRUr4a5AfEUT+7jThZOiTF9dEaBdwinu
         C8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779621337; x=1780226137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMbYM6D21RSnrC33rDKKKRvanVXihrBst74X+roYqJU=;
        b=HFvhvBhDPvIZuCkDqGGk5rGLruIk397avokkWKojatav54BwxyeYXH2fWtMP3EeHRQ
         mbxSvVcHdp8Za/ayKnMdEqEG/1pyMw4Uay+ll8NNLUL1HJof+RaRSP3AcKhGr2qAE4hj
         oUKaN59QmhHTSbWZudTaiGOwjbPluNl+06dYBkld+UN6Oh6AHbTsY8ISZURxE655S4lP
         S6hHIF9FHsC41w13TLzCNaITaA4v1phZCcUGgixExb8r1GVgoafNHSk01xvALZt9E3w+
         9Y2ewwXHz55jAd4RhYCe6bn6zA8D8Lf/93OmAk7gHX2NQkHQwFYTDsb7ikNHzFWsVlO0
         0D7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ZCmKQxo0sCgBes1iLYctBfkg9kXE9p9a6ocI6wWS6kg6x9KFHZyQ7pvHEnEFPoIl+H4bkdW2mANO/@vger.kernel.org
X-Gm-Message-State: AOJu0YzGgXd+8NGnTa8vLjRMCkhebExe54dk6j4MK/vziZ0Tt+gPsP1+
	3xV20bK0DXLkPdE+QNfXO7uXTxmiIq5q0E1BGKTj3Vf1afvvAbZXoUD9
X-Gm-Gg: Acq92OGgGOeydT+ldU2hqL2oJhbCynfUdwv3n87dUCzwgGWqgR2/2eaKXYPAwe8kgfo
	2QE+FX9TsTuGuYlQWP1U0CHfRe60ClPI9K7EVcNB4c9/jopWWora9lcmxmJiHQYulOja2tIaY/7
	Pe10qyD4wnlCQMiDf1jH5tJVcdmCy8KdmRIHF6V9JlALBnU0M2FrxO8ggvhYL2ChSNXysadaQt8
	drnRRXCKqWUW2sFJmXWTSoJ8W7CO6MHmOmZpcFODhjiYQhnN/UtebWZCLokWTkEvTsMhCVKpa0P
	4W669ETR386irIpl5Yg1ZHbOtJonfkzgwIcomHPSlUpGxQcpAb37hp4rex2Tm3ggAiYBv1w4kpO
	CbxKQh53uh3D2ZDZ15e0N1G9/gELGI5emaL6I7wRZ+Rop0j06IeniLtcCtpXy2+g68yoN1pAkuV
	1KPaGUCglF/JS7re3bJQ/7Es5IM30ytLxXH0HemcrXVvW0zKHAfUH6ZNVN2qBkHO4ciHE=
X-Received: by 2002:a17:903:388c:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2beb06292f1mr117852515ad.31.1779621337177;
        Sun, 24 May 2026 04:15:37 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58d9fe9sm63738125ad.65.2026.05.24.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 04:15:36 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kblaiech@nvidia.com
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH v2] dt-bindings: mmc: mellanox,bluefield-dw-mshc: Convert DT schema
Date: Sun, 24 May 2026 11:15:28 +0000
Message-ID: <20260524111528.107251-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Mellanox BlueField SoC extensions for the Synopsys
Designware Mobile Storage Host Controller from text format
to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
Changes in v2:
- Fixed unit-address mismatch in the YAML example block per Sashiko bot review.

 .../bindings/mmc/bluefield-dw-mshc.txt        | 29 -----------
 .../mmc/mellanox,bluefield-dw-mshc.yaml       | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/bluefield-dw-mshc.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/mellanox,bluefield-dw-mshc.yaml

diff --git a/Documentation/devicetree/bindings/mmc/bluefield-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/bluefield-dw-mshc.txt
deleted file mode 100644
index b0f0999ea1a9..000000000000
--- a/Documentation/devicetree/bindings/mmc/bluefield-dw-mshc.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* Mellanox Bluefield SoC specific extensions to the Synopsys Designware
-  Mobile Storage Host Controller
-
-Read synopsys-dw-mshc.txt for more details
-
-The Synopsys designware mobile storage host controller is used to interface
-a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
-differences between the core Synopsys dw mshc controller properties described
-by synopsys-dw-mshc.txt and the properties used by the Mellanox Bluefield SoC
-specific extensions to the Synopsys Designware Mobile Storage Host Controller.
-
-Required Properties:
-
-* compatible: should be one of the following.
-  - "mellanox,bluefield-dw-mshc": for controllers with Mellanox Bluefield SoC
-    specific extensions.
-
-Example:
-
-	/* Mellanox Bluefield SoC MMC */
-	mmc@6008000 {
-		compatible = "mellanox,bluefield-dw-mshc";
-		reg = <0x6008000 0x400>;
-		interrupts = <32>;
-		fifo-depth = <0x100>;
-		clock-frequency = <24000000>;
-		bus-width = <8>;
-		cap-mmc-highspeed;
-	};
diff --git a/Documentation/devicetree/bindings/mmc/mellanox,bluefield-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/mellanox,bluefield-dw-mshc.yaml
new file mode 100644
index 000000000000..a992a4a00460
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mellanox,bluefield-dw-mshc.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/mellanox,bluefield-dw-mshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mellanox BlueField SoC extensions for Synopsys DesignWare MSHC
+
+maintainers:
+  - Khalil Blaiech <kblaiech@nvidia.com>
+
+description:
+  The Synopsys Designware Mobile Storage Host Controller (MSHC) on Mellanox
+  BlueField SoCs is used to interface with storage media such as eMMC or
+  SD/MMC cards. This binding documents the BlueField-specific extensions
+  and the differences from the core Synopsys DW MSHC schema.
+
+allOf:
+  - $ref: synopsys-dw-mshc-common.yaml#
+
+properties:
+  compatible:
+    const: mellanox,bluefield-dw-mshc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /* Mellanox BlueField SoC MMC */
+    mmc@6008000 {
+        compatible = "mellanox,bluefield-dw-mshc";
+        reg = <0x6008000 0x400>;
+        interrupts = <32>;
+        fifo-depth = <0x100>;
+        clock-frequency = <24000000>;
+        bus-width = <8>;
+        cap-mmc-highspeed;
+    };
-- 
2.43.0

