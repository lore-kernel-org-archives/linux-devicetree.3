Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414A43A451D
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549063; cv=none; b=CDPgQyOB9YWuOmxiiEjagJ1VnG8/9icjWZpy9ZdGhHiI+PoNEcIgvJHPPAApC7imgouPpRILp7ykfEcJPokI2Z72VASjGGKgnwpg6pH1nB1CMrUKq3u3yNVs7/z8880Q3J8JnhvGdQZC0Gn4oO5Y2rYA6KS6y2uVL7u4m0vLQF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549063; c=relaxed/simple;
	bh=kSAnMq0S9rRTiMDRJFxlgcjS87f4NCkugdQB48GJkAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SYWMl4i2moi/iuP15KgfoAKeNe7BMWVmXGWwOkjy8GYiM7a7p7fEP+UviecqEpIrrwR4GBIvY+4Y8B61HzqXZRKhqs+VYZ6V/6DoGV8FR5BuZdSLk+hBlv4eM65NT9ANXVd5vftF6Rgmqq8uWy8T5SWhHx6KpSvkfsqKTL2Z53s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBGY5hKG; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBGY5hKG"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c70f91776fcso593239a12.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 11:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774549060; x=1775153860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmXdUJlReZ0By21HylCsqPytD1SK1WBkKYIj/89QnSA=;
        b=VBGY5hKGj9jSZr9D3247iNXXnHX9o5vl1zhKuIaF0jgO7KE4/2lj/GZiD2hWMTsBy/
         S7HDKP8cGgO9v14SeZ3j0VoeR4OSzV8mL92jzDmMIoI/FyBcxN9yvfvJXCq+ABXYkR1A
         z/Mdkl7XH3ic0yu+D5I1Ng608W/SLoDVBp+NOJsp+HeX/1/sbOKTUFhH0WX70gbEW2/2
         i+lamKOfKnzeAdIOFF8vPEs/LxCgpYB+RWc7U3dVytYkEBM+yZfl4AQjkWIgI6Gpkqle
         0Jn+WZKDKKClJp0Jx9Z5yJln643/6sh3swudrT3/ovGscbCsN9D3KduOQuQhr+l96MKN
         8JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549060; x=1775153860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmXdUJlReZ0By21HylCsqPytD1SK1WBkKYIj/89QnSA=;
        b=M2eU7nvsgFN43NUGwuE3c9gIx63rMfRjNQF+9l8XhFu7AqWzVk0GrTIKBvCHw+7LjF
         TdCiWSSHhz7SNr8GchFnQnWl6C+Tn8QwmPTyfbK9OEMce2jVHm4qUjYhJAqUu//GpKU0
         xycpGgbNgiwwFJmP6t4Vfh81DmOtELdUq4vcqpwjQuXGGynEF0VDThonDu6nTuCIsuAg
         LuQLuVLIj+IubP+fEzyDRecEjE7q18ZPU+WHpebBAMnUv3ZkkBSFRQL8x1T+PkQJbvmb
         nurYuLczO955n+p/zRZUam/6aiFR35dtLZELNozBkRK+xKOgKb5xxyZiHFPCETMNUfij
         xmLg==
X-Gm-Message-State: AOJu0YwuGFiZxCU9G/jynx8ImIIasOOXjdd7qO36arwxK1JxS+3fpfx5
	Z+wUfxW5fzVYtzZ4dfogMCY5tdxkbooDuQsA1rDk0bFvQ2CGiuB7imcL
X-Gm-Gg: ATEYQzz6RMiyPTgfNHHbuUeSy8FOZg+XOVGh8mzdTASwJo14vxCcN+bag6vI0Ekw69t
	cfMWAaOAPmAayGWVYA4opnOhX2YF9KBSNe84izfNrjtfZYu2D2pkCElGHWcgitGskUAaDfFRkoG
	D6SoJUACli5wvQyk+bR4wgXyl8zyxzKp/NwZYwpp7B6FzmozfdwRkrLdKbO6aKrDpWYZMN1bs0Y
	Zg3mq+X1IuPeA84xAkVFwYYBV+mFgz2BEuzBqfzyd49dbV/CTQpa8Hldf9enZsiCDAWoXeUTVfM
	9j4hhR1UzHtbArypzhsZ6A3W0xShtR5VMO5a0JmN20+zLGNcoSX8RVupvSqUWlS/t+dG+dqwFlv
	QfGSC8GQ5CB942Mk7BXt480USiwzTz4DI3juyJjZkgvNzhxyiStiKBWx94it8uGerxsqMvF2jWP
	Qk5J9Ch8gYbXndbGalwqUy+CY3P24=
X-Received: by 2002:a17:903:1666:b0:2b0:59c4:e9dc with SMTP id d9443c01a7336-2b0b09ea693mr92707775ad.22.1774549060293;
        Thu, 26 Mar 2026 11:17:40 -0700 (PDT)
Received: from Ultimate.. ([2402:e280:3e2c:6f1:e54e:fe5:eb99:ccec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76bbdcsm37701015ad.5.2026.03.26.11.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:17:39 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v4] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert to DT schema
Date: Thu, 26 Mar 2026 23:47:26 +0530
Message-Id: <20260326181726.64957-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the MediaTek G3D system controller devicetree binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v3:
- Fix $id path to match new location

Link to v3:https://lore.kernel.org/all/20260325181509.3430-1-challauday369@gmail.com/

Changes since v2:
- Move binding to soc/mediatek directory
- Rename file to mediatek,mt2701-g3dsys.yaml based on fallback compatible

Link to v2:https://lore.kernel.org/all/20260323180616.23333-1-challauday369@gmail.com/

Changes since v1:
- Drop redundant description for reg
- Drop redundant description for provider properties

Link to v1:https://lore.kernel.org/all/20260315080302.454233-1-challauday369@gmail.com/

---
 .../bindings/arm/mediatek/mediatek,g3dsys.txt | 30 ----------
 .../soc/mediatek/mediatek,mt2701-g3dsys.yaml  | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
deleted file mode 100644
index 7de43bf41fdc..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-MediaTek g3dsys controller
-============================
-
-The MediaTek g3dsys controller provides various clocks and reset controller to
-the GPU.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt2701-g3dsys", "syscon":
-		for MT2701 SoC
-	- "mediatek,mt7623-g3dsys", "mediatek,mt2701-g3dsys", "syscon":
-		for MT7623 SoC
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The g3dsys controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-g3dsys: clock-controller@13000000 {
-	compatible = "mediatek,mt7623-g3dsys",
-		     "mediatek,mt2701-g3dsys",
-		     "syscon";
-	reg = <0 0x13000000 0 0x200>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml
new file mode 100644
index 000000000000..ad3df062d5db
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt2701-g3dsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek G3D System Controller
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+  - Ryder Lee <ryder.lee@mediatek.com>
+
+description: |
+  The MediaTek G3D system controller provides clocks and reset control
+  for the GPU subsystem on MediaTek SoCs.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt2701-g3dsys
+          - const: syscon
+      - items:
+          - const: mediatek,mt7623-g3dsys
+          - const: mediatek,mt2701-g3dsys
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+     soc {
+       #address-cells = <2>;
+       #size-cells = <2>;
+       g3dsys: syscon@13000000 {
+         compatible = "mediatek,mt7623-g3dsys",
+                      "mediatek,mt2701-g3dsys",
+                      "syscon";
+         reg = <0 0x13000000 0 0x200>;
+         #clock-cells = <1>;
+         #reset-cells = <1>;
+       };
+     };
-- 
2.34.1

