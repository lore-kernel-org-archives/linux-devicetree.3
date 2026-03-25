Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B0C31F9A6
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462563; cv=none; b=NX42s6xA0CJ9phLFX1g/Yc+ngkk/cO8vzR23+hbHS8+QbphSVLDP9j9iBvZu3XI+qcsiRLOcdkTBesE9L6MsYVpuKSzbGua+sBoGLYvlZFT7tYJx6y45NLrEXwkpXewVy7B2pKP+OnVbHTSqst6W8Zy9DQVuaAyQGatfuTx2sfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462563; c=relaxed/simple;
	bh=S+8lY2Dakx92ejxlJDy+GDZksDwV8eC5gYF73nX9XkI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CCumr0aMxsFo9ZuCFNyiPOqqAVukiyKdE2nJJfDRsUPyP2HzWY8iAEJFAa7ocoThA9fISKFfABaLUkYCQSdaIrJEnzBXnJ7+A/2/wzxkDLNiR38IwzLSQvLCXXGV1IRWoTpo76+Fy3EIQBo3zsOzm5tKZNd+kQWyqag03mxcra4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJLR75gn; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJLR75gn"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c74f0c3fc16so80309a12.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462552; x=1775067352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7W3IGN1xflh4MK7qagWeleuB8V9s0be5KVlxYBqtols=;
        b=HJLR75gnDOp7rMxY8uQ4cFw2qaboUXh6s2cz3Fy/ZN/QiWQZRE/3GHkX6bnJ8O3eZj
         mNze8mesY8R7+gb/J9cdfBXeS4Tj62V0KPl43nKT6akY+8ZurKPTl+FU1ucL1quqKUlo
         GEOMSYRVoNvX2QAU5vTNTos9jmcDVT6d/ChNOUotgdENqqTl0X006saeaU0vsubXUd91
         uC8gHL8f3JfoGpyDp/HLbro8bKAT+X3n7oMrDsNEjVa0RMu8F15x6DlQ3gUcjTDFulOV
         YUGsDlJynENRgUC1gzjSw13/c7cl/u/ztjIMU5zzCHVBcjIv/L5fnvNh1jL20XitIu8h
         bZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462552; x=1775067352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7W3IGN1xflh4MK7qagWeleuB8V9s0be5KVlxYBqtols=;
        b=QCfguKSjY4S7QCTACgm04aPf/kBCZmSqX8sbTzJ7PVoV2NPvPtH++TU2fypsOwHEd5
         TJkMRtVVBgf45sN4gKrhBJLD/EXs0K8ttqkbKsWO5kaDg5mBrEMLweANnbiS8g/ejZMA
         Wx/0mcuKgOwXumZAcyMosbBtlEpenkAArHXG+0ibOChBC6Wffw88FSdK5PptPRq1fEsK
         e7/vVCR1QUJhhPQtPqrcbZSuxPDMwBlLtLK53B3L29fpZ0VoyAtUxKhXCSCp6w8MNIWl
         jEhik4vO24iLRb2MixKxJajPr6MFzKXTTJiLwtmfIeuvTTBYB+tuFaMwGwIl5VESpoYN
         ckOw==
X-Gm-Message-State: AOJu0YzEzh4gOvBdgkT9JCSz6bmtB3v4dPRfbL2z4D3cNSDrf2pP+hwr
	X+nmPyA9jJbuPKlxny44aU0eS9sUBzdI1w2Mt1T7ir5ECM2Vgw7EUJNqdJwmXJxe
X-Gm-Gg: ATEYQzxuLXPTUjlefalo53Y5pMwSyK3XfSm30J6mak1Idl8imbiMBHI7ZISMZD5aYQy
	HvNrq1IguckVmsyw9cqKUNOh8DOPyX5nAJ3P9ZoWiEBTEGWmnWuJjoDcZM9ss6NND1MS5lLPqv0
	ahrGK5qQx6q2Eq9DXJGJ8xPZFCGSqmmSBbawvOPAVNd6EDYlNynb0c174xMQ5NSLdKQj6bTZsnG
	YpJ7V+YVr/yQuaqAG8QN81h9/5RL3C0VKGqYcWH2Dnx3Xcuz85SvJb8r9ba22qN77e38L9ivOzW
	GrXZRkpLz+ltXt0UbldhD6Sb4qwRx4i+SGt4EsLZqtUP9JwR0Ac0OnZ2Egr4t+q2c004dc0OvNc
	Agwkaf5Ts7HbDW+pslvh+OIs6pbM7L50TPnvmsvuvpHtpcCn6AmAwPB+xTWvfXfCzcjObk9+ck+
	pBYb+9uSCiVyq47Y/VmGieu/9EVz+t
X-Received: by 2002:a05:6a20:958f:b0:39b:df1a:455e with SMTP id adf61e73a8af0-39c4ada16dcmr4596946637.46.1774462552215;
        Wed, 25 Mar 2026 11:15:52 -0700 (PDT)
Received: from Ultimate.. ([2402:e280:3e2c:6f1:65d1:b1ab:51e7:2823])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76739334e6sm127592a12.18.2026.03.25.11.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:15:51 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v3] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert to DT schema
Date: Wed, 25 Mar 2026 23:45:09 +0530
Message-Id: <20260325181509.3430-1-challauday369@gmail.com>
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
index 000000000000..adfbf1ffb416
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt2701-g3dsys.yaml#
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

