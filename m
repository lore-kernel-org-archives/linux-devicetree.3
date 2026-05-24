Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2282D3191CE
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779620459; cv=none; b=PNtyHvWdKhbcFwfXp7LObgGWrIWuMJ/y3MIL523UU8LnULiz26Oc4D5qLvQ+24AWx3yB2O8IAuBX+9lFhIgPGz2RbU4w9gN/r6SUCmioAdWZsRt+0ZuhuetGjmo/e0QJqxwqcTXOqx2Sd7Ea076gxZdsUjos0vqWlnDGEbeRb6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779620459; c=relaxed/simple;
	bh=sWQOh4l4puXE/Xqjx4bJ4VS+WIF1L+pwK8QQ1Y4yu/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kb+4U09KisYH+JEue5PpiMkY9NYkq+Q369VmHbm5ZDR2q8sWBWIwpjyN9GsFMrrZttV63QAyOMP9a6dVeo9qTuAmIU+7/KIkP994A81uDt+Q5Hi0/7Hgtmz2SrbYJRM7PlO4KnaiU4CvtFhc7T7oPp4p0HIfsClBen1Nkqm39D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMXWfRg3; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMXWfRg3"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so9565081a91.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779620457; x=1780225257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVpHywYEV08yQtd4cipuOyW3xe6a75cgM/PkwquU8rE=;
        b=aMXWfRg3z0Ne3C2BM4EIYFCJBCz9TaUJra3PhPW/Jld8d9beytFG8arr4ktNJD5i72
         s3PdreTZH7gO/cy3FMh2wAIaoq6T80GKfAKc9y6mRfm2r9oq9ss3Wo8W9+MJYi3XSHIJ
         UgHE8UCvP2uC3QubhGay6FIhGEF0j1c+Teu3wYrNmuQ86VpcSxwkFUJ01KsiA1dNtYzJ
         Qb4XDp3BpRvs0wnEi0871j0yqZC+iPhcEru+ZQ1TjW6Iv2QALOPGdwFzNh5QPCyYNGA7
         7Qy0fmga2CZqEpbXmar+psRthewN2FnHWBIRbd18d/YdZBEM+WmBb2xTw2d8EughJkYY
         XEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779620457; x=1780225257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVpHywYEV08yQtd4cipuOyW3xe6a75cgM/PkwquU8rE=;
        b=M8wd79SPz8sUVDFQtRLyw5AXPNU6mAmqcF3K9Jn5g2sKUj6LOYuQjR51U51w+6s9+x
         0rF8LD3WBxtSUcqXIlAF+XEAY2+ML4aig0G7ErxaUafuztlP5LKoHoPs0XCNq209Hnvg
         GxyOLUYrAil05dOYn6UR2GD+eMWztwRlPpctAhzCj8ZArjLxL2pIeS/BoyBXI2mdpxnC
         CNZ0k9k45yfxxOI66HxvgMQLRyFWZOCJCv3KZwoXD0604gaTE9uCbfPp/f/u383lM7Vu
         vBw8vKYXBQ2vhwydQAb91dzQdHRqIxbOXPvpF5N2CjFq0LkNc9RqiigU7brU1TuThlQK
         rVmw==
X-Forwarded-Encrypted: i=1; AFNElJ+KzrQGeuWjRE7Sa9lA2G50U670TXlKwLqgtcnOdn+bvqI3TkQS6QhqfPXHQeudHMDD2w+gEomJIBmR@vger.kernel.org
X-Gm-Message-State: AOJu0YyDX5PCQzLtxW23KGxsW4Hi6EldtkDRLu3XEzl0StxxZJGw2SuG
	lEs5HeVU+k+J1scydYmtEOIFNeN9KdJzxqvjeYnibkLOkQt+Rle77Rdl
X-Gm-Gg: Acq92OGFbvylkwFR7hwfELgEWjElS0qQMeMQFP6RralaHxCRzZwYhV88PxVqs8lgu97
	hiNCLTe4MvKp0jr0kCoBwLCDgGJfCCYGNRCY6Vgbq42jKl9jcQ4Ej/CufTBP6WQcyyqRx2M2u1L
	yjvP/Y2hzaiH2vrmZK7bKSGGOWJCh6fKp/hZsvpN37fuTrv5jhRZHgDHeUDxbpaKPAVtJKMeDFn
	bybtdqTKAMdAh8r0AI6ap1eJSnJvimdB6BEoOciHrWHS6xfNjkRn8pzLQt5u+9hC3XeX21sA1bE
	rtjaIfkQ0KqG8xe+p7Gdvxg3H+4pRQMep3KFkOVFmp9K88UTnwAAaAyZ4l2bCrDX19UZetGQl5c
	rTHZAFfUZWn5BWon/wGgDtYQDEwKwqIZVinsEmQO4MEEB+yfbuVm3BmkxeRL3++Hh1M4HMgnsA1
	R79nuHYF8hPA6CI5sedHctLGW5wblqu6as+mDqHbrnItxQvhYa
X-Received: by 2002:a17:90b:2f8e:b0:366:1172:597e with SMTP id 98e67ed59e1d1-36a67472642mr9787268a91.9.1779620457338;
        Sun, 24 May 2026 04:00:57 -0700 (PDT)
Received: from ultimate.. ([58.84.60.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6772f486sm3726745a91.2.2026.05.24.04.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 04:00:56 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: linux@prisktech.co.nz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH] dt-bindings: arm: vt8500: via,vt8500-pmc: Convert to DT Schema
Date: Sun, 24 May 2026 16:30:09 +0530
Message-ID: <20260524110047.37590-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the VIA/Wondermedia VT8500 Power Management controller binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../bindings/arm/vt8500/via,vt8500-pmc.txt    | 13 -------
 .../bindings/arm/vt8500/via,vt8500-pmc.yaml   | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml

diff --git a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt
deleted file mode 100644
index 521b9c7de933..000000000000
--- a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-VIA/Wondermedia VT8500 Power Management Controller
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-pmc"
-- reg : Should contain 1 register ranges(address and length)
-
-Example:
-
-	pmc@d8130000 {
-		compatible = "via,vt8500-pmc";
-		reg = <0xd8130000 0x1000>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml
new file mode 100644
index 000000000000..ac603fd4efec
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/vt8500/via,vt8500-pmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Power Management Controller
+
+maintainers:
+  - Tony Prisk <linux@prisktech.co.nz>
+
+description:
+  The VIA/Wondermedia Power Management Controller provides register access for
+  clock and power management functions on VT8500 and WM8xxx series SoCs.
+
+properties:
+  compatible:
+    const: via,vt8500-pmc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    type: object
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmc@d8130000 {
+        compatible = "via,vt8500-pmc";
+        reg = <0xd8130000 0x1000>;
+    };
-- 
2.43.0

