Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D632AAB5
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280622; cv=none; b=LuJPi6wB5sJWGZlUS69lNL536SNR+IkzwmVrpS2CKoCaxtkjLrkuNebAMZuXrCuVU7zDvQPIJnpYBPtVHwcEasfpBOBfVJMIbFVFxJjptrULy1Yiytw5ID/8ai0ivu8oOe3lmMpQtb18j0xPIMVmjZ4ftIF747E0pR+0w2H0wZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280622; c=relaxed/simple;
	bh=2Oa3gWUqiv60AmEEbko4WvF89zBxld/jaKyNngfmtjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ekeySXc7bR48pog/EKL8nri7IBDv7oA47S9U0B+Uh+d6zIFSMs1H8crmeVEpG4KtqKt4l4sricxfRijBWY3YlfrSs6y8XeR8G8ZbM7/5U+Ap2B/s1RPOqzsbkhI1EpCVONxumRnwP7JU6j4i8JJwIGfANEsgGDN/KVUgwHq3/6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwQFkaVE; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwQFkaVE"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c8584e80d59so246027a12.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782280620; x=1782885420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vTuRJJKfRZ8rcgDCBsBsq6iRcx2SeEj6L1B+EwY0TA=;
        b=UwQFkaVE7FwHguWEzb46w5730UEpo/Jc1pMq/wlNl/IQqNrtsuEen6t5FZGzpghAoV
         ilmhZsOI0i/1vMFV/itfXESmGCP8kx0ZPp7uIoAL683hhzd06q+U4hbaZDH6pEvmtvHB
         sb/2ho+SDoGoe3rnxRGNaTUlWqGhGchWraEJ7g9cVE/JVAJxZSiUSo9jG57RVbiiGMnD
         1HIj11Vu9+47eIeEURerA0mkg5oWl1CYBo/vwg5HrkkvumfHeM9msV/znAvarY1cTmaL
         H/nGIU4ogSWOrsOZrLFVulvanwkMgtxoS/nCXWJqVI0lKBO0t2ccT97BF8HxKTKy7Tqd
         ARyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782280620; x=1782885420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vTuRJJKfRZ8rcgDCBsBsq6iRcx2SeEj6L1B+EwY0TA=;
        b=oHkd/3I9GZ0g9yXJZ91V1PmU4iYHrUhg3TJaw9hTGQiNmRUX80bA0iVYUwNUWM0kHP
         EkmUr0g3rB7I4A90rsBPbMa/x0oKdDYJQK5i5szKjskb2VV/XFr9k3585mFxeDW8Cx31
         2LB3RF60Sa9b+RyJ1FYTGeZdi+SR7CgYmFRvDFmAFURdwfFe8J7jPDaNMOhGKwI4AwiU
         V0nRNUf1l4GOKFM7UcqgcPMk6RKbON9cUfdomyOHqTgRlQe99ypaH8A2zuGWTghRp710
         jTsy24bb4alvopYww90dnKCW6DrqGlGyHnk7eyHaFUB03+j7MImsO2QsCRA76oLuSwyf
         LOOg==
X-Forwarded-Encrypted: i=1; AFNElJ9e+U+nsNvuQZr6Ow88BGAAw3/LiWXMvrhGsH3dFdBrQvrjlQyoZ4/VWQ42+K6j0AYIoirXom/WCnUB@vger.kernel.org
X-Gm-Message-State: AOJu0YzIurrXwmp23yCzFDBZ87jcNMg6BeAZiWsMZVJYT850+RjpRSVO
	kiA6hyOOl/J5/dARzllEdgj0fNVtaPDWXZM8aU438o1LANhyPQlHSoYW
X-Gm-Gg: AfdE7ck9e10zICLHUEAzZuQV3+AVPj/hrmMeWMAbh6/cCcWY7XbzVaO7U0usMD8V/B6
	jKjSEzBzXFhFXarINhgKR4FKgG4N4LcTNtEnJ16jaXk52qS8PiPzFc8yUUvn/gCdhAwKrMH3iKe
	gI+tJVdBX1GOodwNEFqaFUPtpzcylVmcwS8RxQ8n+5jkoK11Yv3SOFzoyt3qpk6tnebexwiVP9A
	JTB3oIBieZzwe3DpPq8qj6IdpBCoG0alQtV7kWlEEg4UIZP/GGnclzcDq/FWq+k5yLT9xvYxqpD
	Q+6K3bBirGOPVFUxMD3lLj0Dkgt1WtUFEG7JXe/GzEdRsHPcAUqs2L1FSD/5PxBSQKf+pmwRc7F
	OFvKJ+/kmgzsaXN5YWr3T3WTWLgESMU2e2rg/VWFH574uW9cS0otoSCQvh5oJKS3LqGNnie9e8z
	ptsLfWuTd/mcH6HWW+PKZPB8mUKkiYgD8=
X-Received: by 2002:a05:6a21:69b:b0:3bb:106d:77be with SMTP id adf61e73a8af0-3bd1527d66bmr8223822637.44.1782280619978;
        Tue, 23 Jun 2026 22:56:59 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([103.28.245.138])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c91e65bab0bsm524110a12.27.2026.06.23.22.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 22:56:58 -0700 (PDT)
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
	Udaya Kiran Challa <challauday369@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: watchdog: microchip,pic32mzda-wdt: Convert to DT schema
Date: Wed, 24 Jun 2026 11:26:48 +0530
Message-Id: <20260624055648.127399-1-challauday369@gmail.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:

Changes since v1:
- Fix example indentation
- Correct example clock specifier from REF2CLK to LPRCCLK

Link to v1:https://lore.kernel.org/all/20260620172354.155565-1-challauday369@gmail.com/
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
index 000000000000..a5dd633c3e78
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
+        clocks = <&rootclk LPRCCLK>;
+    };
-- 
2.34.1

