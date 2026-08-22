Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1244B38236F
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787391560; cv=none; b=e9uQpBXOSJL3BEXOOk/9fJ1zZUd2C2/dGkHKNeayrseLlcLym6ntjjaVusH6ZhpEVI1L3w1rAc2frHx64m0Ew4rJIf11XtEznKyIdu66t7SUM/ywXapZgPBTqgMIVAKGsTZPsa/IZiW6IujKGyBejnneCOn8HnXPu6qM5aWcG8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787391560; c=relaxed/simple;
	bh=rLm5a5u88Ko2fvDm7bp0f0F2l+AzEXhbjaQ3SBGLOLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BQAKnG5eAmgC6zFNwW3Iy2D8i58UdF6P2Suvecyclh+XRhEBCKexHY/vdOelWuDjNIwe/51GmmTXe0ToUPVcd8BXJKHsQBiwTgSnyx+Ve8V4ki66uOlJ26d4TFWOfMbEllSI8aAM91NCTpzwJzuFKnH0C84gc9WnYznVvoI4r/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdzV71uE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdzV71uE"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-395ea741d07so165786a91.1
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 02:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787391558; x=1787996358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWkv33Y+74+gq7J0O5ontHRvQtInE5grEbn+LzFrXq4=;
        b=qdzV71uEZKplt1ES2ZjN1sHtNtIZIPmGrZAKcnlhRqEk7dpDwcfGQJ26dlXe47o4+O
         COjv6hZSVARrRCkipRO9wWwyZOfhMNcha0KDXkeoxi7ceLvRL+thnYVWu5ObNu4GoiJh
         ekH2tk/XXaZYWMsJI3jA5D79q8ul0cSaQJf4Odc4QnNkfMs6Uh9Oq3M4d12kykrXiscZ
         xMJ05nfKJq4NVtkFAT0cWEuVAesgrbtbjrV1A7A7P5AJaLsswysfC3m/mi7fCPhnkR/M
         l0RF/rjXAykTuv5KDRZnfw19J6x38so1wEYBTsJtmx5/vCzlzxF6PHD3sQ2Aj2nMKyEc
         VpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787391558; x=1787996358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWkv33Y+74+gq7J0O5ontHRvQtInE5grEbn+LzFrXq4=;
        b=bwLJC2gl9yrcwtAJzSEcn01Zg11tWO+bImOtk59tVGOat+M6Rczw5tW++PZx1or5Ba
         ZCr6BAp2/ueGNTmWpHEmbN8WUiSJ5HrANqf7cTrNix1pn5eYsjQJwfvsY3ovE2PzJHzk
         LWdWxPC2FcUAKcMWj07a17GRvmiAMbs8LcImd+swOgEx6qRiDZ3oIM/Z8uWLK2k0IvCw
         v23EZldegzcatjr35e6wTmfvwYIpp//o1OQbMp0a9mMmGSHLHArViOH+FhRDtPCEOmq9
         GiMLenii0ndTudij49X5tpRlkwtB+3AmdaT4avuWG59dWrLGnlufK+eZjaFNVUBGliHK
         EXTg==
X-Forwarded-Encrypted: i=1; AHgh+Royv5t+cCJxbKmC0dDykpe6d9gJtU/XIFaUIadhCUhYFntZZTIssnHewXkSCgt4exmYi97Gk/Pd8Gfu@vger.kernel.org
X-Gm-Message-State: AFuF++lWJrm+AtgCjVXKbz687u/oF/61Y1uX3PzNA/B2L4u4Y+uB334q
	xtjFEV3IfPSKivchPYRanFGwC7pZpnGrVr70dKvnzddAQRc+0oc7mhZL
X-Gm-Gg: AR+sD13x/7NB7PudcUMJSp0krkw9BbbQ+Wp6T+y0XFKYMEVrM+uZ+OJ2EdEqHijN2E2
	ub7oRs0fws20ruqT3VJUDqK4APNNahAO9148PlbdMeyDBO9YUTKgDK1hTd448x+l2jMWGs6zv8z
	DMu4jabutD3mriURNT1/GNQos2iZFgvCsHaiYgsWTSB4IX85/ApRystnHo8CzWpv661OcdmYUzp
	SxG/YOyiZoSxKCr4PN3dzLPmj8MT27WAJYmi5T8ikZ03dIYUQ7445QnYQoCXA13Rp12ZPIOP97M
	CB+h1NkDyEhmYSOfPxJz+0TQpLMOpNXjMTzPC0AfDqENPrLeBR8CShn5vosJtceZMkiXZXqV5kf
	HGWuYeIdl+8qTWqLpfQGnYtiMxP9EDGonSniC4k7pUX8BsYei/fP7Ex6r1uJOuoShG79xPXJsP6
	3heP7x6XwJurT4aKZ2GGGCcdunvIvUhLfOp7/2ZGClBztEW1NTOLSh9Hcr94HfcJE=
X-Received: by 2002:a17:90b:3945:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-395c37199b7mr23933867a91.15.1787391558342;
        Sat, 22 Aug 2026 02:39:18 -0700 (PDT)
Received: from Ultimate.. ([2406:b400:53:4f23:d4ee:2200:a28b:c285])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d8d26sm2171183a91.10.2026.08.22.02.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 02:39:17 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Udaya Kiran Challa <challauday369@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert to DT schema
Date: Sat, 22 Aug 2026 15:08:29 +0530
Message-Id: <20260822093829.46295-1-challauday369@gmail.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:

Changes since v4:
- Add Mediatek Soc maintainers in the send list

Link to v4:https://lore.kernel.org/all/20260326181726.64957-1-challauday369@gmail.com/

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

