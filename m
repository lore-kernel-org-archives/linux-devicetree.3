Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA16124677B
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781976248; cv=none; b=Vmvj8JHm3xM5lgBFj28A6w3V+TOOvPe+X6mYvJvMwsfpyoJUToCPcmM/39xE4MCa/69IV2gWpRC2qkb5OJAv/EguRJ5C8Gv28HzZL1CxHFDiMWxJ5AAz63ebN3/fwPq+tNB/eishP+Zzpqr4EIY7nbVSk1cYqqSFE256StCoGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781976248; c=relaxed/simple;
	bh=OrG173MpmokmQwAQnBCzHM3/1E6eo3eaEAN1nJggyq0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iicWJB823LEEkjMs0CUF3+yzVcRgiSHSyER7U1bXe7ecDnE/FZUMWHYmAUwa/EMzKbMD8SsfET15Le+BrWgrGgnqgpHxGeVu2rFuWYV0Vpjc+wvk9yLZzjP9DjqLl4xwLpANwAFpC89iPqfedT9IpxAKzswRzd2ugW/9WfuiHL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMwPyswu; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMwPyswu"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso1599109a91.1
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781976247; x=1782581047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VjVcopPtCu5wMI8L2H0z+lagnebo1hucNi83hHVH/j0=;
        b=SMwPyswuMb4j1/r5qsBc/VBaGKeizc+7B4VAkw4IDmsUc4I3XHIir7ep4hPdb5F0+M
         fWYnPJ9geKF2UwKrCfGCcbV/bGZqw8LEyYiU/nrgmuO+T8hM8YQ1hFBQofWWhKa/+zCi
         OWcVpuxivH3j7BrmxyqzbrY9m67EcrT4nj0UfnD+aM9DE2PUUTHhRBCF68Kqb9lluez3
         8MXJXR57L14laQzxF03T1U5a1UBGvyoN0MIe1OVtnXu6n+PF/t5BK3R+/pXZw5Y56gj/
         haXiuoJTYRvGq/cq3Wuk6Ylmp3AS327zn9cQ3ByFddcZPGYgTH8YskGCbbH2uRHRT7e/
         Drvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781976247; x=1782581047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjVcopPtCu5wMI8L2H0z+lagnebo1hucNi83hHVH/j0=;
        b=U1B6OH4s8SM9Yq6sHpg50Q6k/NWbrAO5nBFWHsS9+wa6OAM0keFNnqe1yqPMp1ni7m
         LsAakvzJ7c/idzrP+bIZ855MUp5bU9N39+2eb7iI7myl+ieT3zWfIbPWm5XZx/jozVnj
         VoOV/LMjniq7DOCPBOsE2VN5mITBgNcomo7FLhKGYdeok5kqbTeqfQDOLGm6Io/yuSpg
         wyUvQQpWea5+I3xZEhALFD6qvEUGyODSOfnTv04KUumP09+5mk0OmK2HD1QaejYttCCM
         SqYuuWDl4ChhNslCXKRoEIRV4/yEaqPcJTkbCfqaGV6zro2UxNlAkrpZOrIjKKGmKHHz
         +hLA==
X-Forwarded-Encrypted: i=1; AHgh+RpOydxCnb3cul+qC1K02bJiaWgDFXr9cow9wLq1uVeUFNYQ4UZ9MahVeazZsZ/0BUtU5NmpD8br4DGP@vger.kernel.org
X-Gm-Message-State: AOJu0YyI3IKYL01w2S8CLtNMTmE2DLaY1rC/EtGuE5uk9bMXVNkI7bbi
	7u8xyqJ+UlVUXhcdj5aYK5NKe7hA00zmwY/gdDhxqF5Dj4OQ1fXwmo2y
X-Gm-Gg: AfdE7cmFh1ozVnUMdRqSm2RGp+dfBVUozGPENSyUTsE42+SilRFeiIhezlzPJc3b9mC
	rDj3XJbRjRiKwNq6YPWCr4Z9Eky9QEv732NLjtHgy7gp0YrQ0sJkB2wudTbcdk5cedGbolstQk6
	LGuday24qfB2Jf2w7fprvDaHS1+MyiMCMxxjiAp1ScYYScQEkBvhzM1Y25KEupA7FuMNqe4JdV/
	kIYINKYz8jdC7PKaPRQ3jIhbo/d4S9/h5nGSM0quIi2dHLTNiMvnTZQBZp9sz7NpxUd/94wUQLi
	QKhNpHhlKCs0WsxmJ1F0tACFF/p6DaHzOj/RuZtgYhqNsiM+iYv1/s2+DLgh3tZTlssgJOX3RuL
	BtJWFKuAEVNd5wnOJVR33ADWgKOFswf7MF4i/STHI5BhmTrw+qvz5QugHJRuwdmnhHf7zOqLvKY
	RDz0pRDgvRr64rKQZWxKbmKJPcIxDePmgBxw==
X-Received: by 2002:a17:90b:4b86:b0:36d:f28b:72e0 with SMTP id 98e67ed59e1d1-37d161465admr7528238a91.12.1781976246960;
        Sat, 20 Jun 2026 10:24:06 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2409:40f0:303b:e45d:521c:1231:d388:dc73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15de5d3dsm6109920a91.10.2026.06.20.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:24:06 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH] dt-bindings: watchdog: microchip,pic32mzda-wdt: Convert to DT schema
Date: Sat, 20 Jun 2026 22:53:54 +0530
Message-Id: <20260620172354.155565-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Microchip PIC32 Watchdog Timer devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../bindings/watchdog/microchip,pic32-wdt.txt | 18 --------
 .../watchdog/microchip,pic32mzda-wdt.yaml     | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt b/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
deleted file mode 100644
index f03a29a1b323..000000000000
--- a/Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Microchip PIC32 Watchdog Timer
-
-When enabled, the watchdog peripheral can be used to reset the device if the
-WDT is not cleared periodically in software.
-
-Required properties:
-- compatible: must be "microchip,pic32mzda-wdt".
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- clocks: phandle of source clk. Should be <&rootclk LPRCCLK>.
-
-Example:
-
-	watchdog@1f800800 {
-		compatible = "microchip,pic32mzda-wdt";
-		reg = <0x1f800800 0x200>;
-		clocks = <&rootclk LPRCCLK>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-wdt.yaml b/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-wdt.yaml
new file mode 100644
index 000000000000..5d91a7e22f17
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-wdt.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/microchip,pic32mzda-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32MZDA Watchdog Timer
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+description:
+  The PIC32 watchdog timer can be used to reset the device if software fails
+  to periodically service the watchdog.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-wdt
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
+    watchdog@1f800800 {
+        compatible = "microchip,pic32mzda-wdt";
+        reg = <0x1f800800 0x200>;
+        clocks = <&rootclk REF2CLK>;
+       };
-- 
2.34.1

