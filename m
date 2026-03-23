Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E88F3CB2C7
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774289200; cv=none; b=GhZ+iX+JQTMxbSw+ps3cxGQkKJR7OCVYQUevsbxKdbO4JZjJ3qSLIQyM+r/qeViLmgVWLcUItQFxrblcQZwQftz1I+bUbRXOdv/AwB9IOmVnaYJINnP0MJMwke73V8u7fu8fsljF9eyr5klCWqjg3YhKxx4utYvuIW0Db0EBgFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774289200; c=relaxed/simple;
	bh=oYVb6IB8vuK7oooMBnIMMAeKhMm0YnJCXhRyyefWgPI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WvuMQNh6hNuj9J/9K8CSLbvRaL/LtO64B6RNxhbRVdHFvqeaJTTF3extIwSW+/giIKJwOJIRndK59ouBkOl2nw3F4DZvJQ+QB6Mpg5JTbCJhfFjniGf9VhNWFc88lQ5c9iFtBzvooPo/xFozpv0pqqhqGLFdSzdD156PIICe/Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdMjEM6E; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdMjEM6E"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a8fba3f769so20726695ad.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774289198; x=1774893998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8HqRm0EdCu6tW3UpEhK+1msajrct2ot7sic3FIGjze8=;
        b=CdMjEM6Evpa0XPLqWlxnDbRVuWgZf9EUSQhpQc90tBhdAtuMd1m3J+/Eu3sl9oxEYG
         ofeJheKJ8KjAK0w7fxp+iutdIH13j/k5N9iU9xF9SJlnGtnc6UTrOcmXuS5k2l9hjyGR
         ZHuRK/lZ9YB5oMpw4s0HhKN1m8+oafwTy3elC0W4bhLf0PCpmG6Wk3WkcOTOgImwoLDq
         PcfWaJCFWXulStYGE/JY+5D76m/sbF0gmNNZaq35m4YRDdo3DmmFq5kBHCsJ+NS+17Lx
         JfwWqiNCKtJkF6lTXh35ihbsNRQU286YrEdD8A9kxQEfLsIyL8370HTkQQyYmfg8cN7a
         5nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774289198; x=1774893998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HqRm0EdCu6tW3UpEhK+1msajrct2ot7sic3FIGjze8=;
        b=hAmlSXo+/zcQ2MF6LfKQQ7CncMpN7+UgISg9QpnzGHsaAcqMc+zmUNxURd59oog87x
         vll7bTKeP3AhoLT6x9IJRf5RHSLtx4zH5pUQL9HzeCmlzaPWE4iTwT6pqAyjyNLgvu14
         42U4J0yvvIyv5nkjOag5k2SBSp4U/UhOq0RVh1h18PB/PJfVsMYvdUETwQmBRIiXLWZj
         /P2CV8jylkDfI5DumNP9XUhZjBThYWKJQJR/j83XzGxMTOa01vft4mStcLaJfHcsIJP8
         Lo+LGM6CWI2FWq3jJk4PLwEcGk1ipO94T5k/55cv/nVBEMKTkgCejREO1CPB4ovBPNXf
         ePwA==
X-Gm-Message-State: AOJu0Yz2AqFoWHn9EijRA7W9O813FSr0GxaNdj6dcwJ/zz1EJGbCenvU
	o7yMaR2BObm6shFWV2qnxZakccLABuiQ/q3YF9uaaXnNPkFMUc8dnw5Y
X-Gm-Gg: ATEYQzwPJDFVlFVWV5jkZYJKQjAC1CemdkTEgJ7aWU1Bwn2OKUzxK6oZLiMV7PxKTLk
	Pj7h09vxyOrBZt8idDnyEn7opvCUX49v9vwibcZTD28CMwdEgrMW8++PycWhkSOIr7+ZTeiJh3s
	is+BmK/5cpmZBNaQxFmh+ITDL5tix1NIIKEWsf1CNDdbK8NLcxnZlbShtjgVVPjiSAJoxad5IjP
	A5CcTIeregyn/mYEZgtM7Ho/S6IkuD6HCMclpHL5zHC98TlJofvTUADeYvbWuZco/Vpfnc3Pb+k
	sn8CzZe5N51Fq5md0WfmCRw+FPsxkytJ3Do9itBYkL+hGAHg73s9gbnQJdTUG0kx9Azl6JyUps4
	Izc3KC9EjvUvs1E0msa3fcdgsCMrrr7SDLNdesMUcP3H/VmRbtbDdnyUeA/0FB/tjT69PXmnuy4
	8PCM18YN9mRZwMsCZ6hdu9JSBDSnbG
X-Received: by 2002:a17:902:f70e:b0:2ae:478f:2ec with SMTP id d9443c01a7336-2b08277b109mr115939885ad.29.1774289198421;
        Mon, 23 Mar 2026 11:06:38 -0700 (PDT)
Received: from Ultimate.. ([2402:e280:3e2c:6f1:a6d6:efd3:68fb:e380])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835161a0sm139824155ad.10.2026.03.23.11.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:06:38 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v2] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert to DT schema
Date: Mon, 23 Mar 2026 23:36:16 +0530
Message-Id: <20260323180616.23333-1-challauday369@gmail.com>
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
Changes since v1:
- Drop redundant description for reg
- Drop redundant description for provider properties

Link to v1:https://lore.kernel.org/all/20260315080302.454233-1-challauday369@gmail.com/
---
 .../bindings/arm/mediatek/mediatek,g3dsys.txt | 30 ----------
 .../arm/mediatek/mediatek,g3dsys.yaml         | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.yaml

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
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.yaml
new file mode 100644
index 000000000000..4eea36632e63
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,g3dsys.yaml#
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

