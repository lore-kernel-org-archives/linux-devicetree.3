Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70602433E7F
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 17:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783185299; cv=none; b=eELKTwQg5r+pUS348NPpUVl5GyfroQ7Ivbt2Gte2GvzzpqMa9c4kdle/zJoIlW5eYbN7r5V3jTB3nP/9sX8GSm2y/vZDA5IymtUa9CnnVpVoBvXOOwIhpJyKbe9EIO6+y/b5CS4ANrGtoHzXZ00iR+vZhom4q9h0QaJyYtligBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783185299; c=relaxed/simple;
	bh=NNneVdy0HhxnlGFqTwE8omGAtOyN6+sEw6Qa8xG+YSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPLKpzPakWUkb8v0ZXzZKi51KC4BG8A3k57zH6cbqA/o+CkUYTxqqW1Sk4ATaOCGersPfAg+x+MtIlW6gXXMZEKaVqR64V+cPB/CriUyxTXcjKVlocFKZBRxSZhBXgv63s/crGuv6/jZSWjOc5wGELdI1FG/jxt1xVirSeLcGOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbfJ0Jxz; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbfJ0Jxz"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-842358aaf36so807758b3a.2
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 10:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783185298; x=1783790098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6kKI5J8Ttv5I5yUn+NLV5sWRapXSwcPAxycZh/dkxc=;
        b=cbfJ0JxznZueHu7afssZnib+ma3xmpWl9ynuEYQPl2wTJfq3N6TKcSIPPQFaMr2mMW
         83b7uvAiVUJUirC4A/YI7y3jAYLid340UzF4ic04/gJf1jLccjjri+bGyg/nc8BsmXB3
         Pzbx01yC+hCt5FdDy9pFvBVFaGEc+3PAG7pmn0odc3Yq7YSsusjIY1nWxt7TVNvu04fC
         PjFnu2QVhklOM4LPjGmIQdnVHg3Ai3TFXpCnD0r1/2DRYRkZHv1YisSNTxLP+ffmqLLS
         Y62pbXu+LO/IfCbZgkAzQ7CpipNODBPPb/OPlCTc7d0X+FoHuxQM45JJEaesuQ2Ob0GK
         bPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783185298; x=1783790098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k6kKI5J8Ttv5I5yUn+NLV5sWRapXSwcPAxycZh/dkxc=;
        b=sDpBCL5TW1G4m4L27Q7HB6rCTdaEs4WUDxPm4ODyLPhabqlzZKlYiq/+Go6gdZAuV2
         kzeEGSOuLCdaLT5mf+jRolH0Fwr0QL8dYD0Qtv2IpKLqMXdIrUwgpqz7eg6UycI2WTcM
         XbQ1q2xlxFDtzl5K18E6Aypvr1BULlrMuBSUW4YIX55Depskyl0oGWqYL88oq/dJI+Wu
         VYsrGiKeX4Ve36QRbSv2Yi/wGKIPvtsuDq9g/X3U7TvEetxx0Ykug46ubu/PlRAHySUq
         b2Wc9qdR2ciTuZ+f98RbzUZq+4exfFke59KZv3gKAZve8Z6qDfJGvcVyxf5IUymtuGJk
         BMFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oBsFxPmIM6nSJGrOLq0SKrIFXqeNPDzpbhjPVHdt6+Ex80KC+xJscwTQUnwDBk920qO0p3CaSkv6K@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9UDSY2W8DgxdsoBwW1hdSSyVubpsa5P38z99mM03S/ePNjaau
	0fSW5LtVfQvR5FpL5getJD0jo8BSvX/iB7XfWHtmK7KR6SjvXScjtYL0
X-Gm-Gg: AfdE7ckyzMhI+j11M3VGJiQFSbel/hP/S9U76/pR3EDtzdcKaekwgIisB8Ys4zdjcoH
	vfrKQW7Ue9FAe/zI1b98C+Q5oJutv3rFBmlUvvrSpQIuEFcUBKU8PqDhbzwT4gO0R/XFy3Di/gO
	1CR1ntVwQcgTeTg69DVpkkKuKfEqoDCS9hrY3LgG2WpBuqeO9qlIe+hUROQCeVGP9JHk2FUsErz
	PRMHB16EaXb2bBL9a6bcO/zENMtLGctdBZAEWKWtEZ/fuRda1a5h/6h5Epah7JbmII/JrwSbk+0
	WbbDTN4Fc/ePD2TgbZNXXUbMzA2anqdkXOfbRWJt/0lg23DLG0ooVEBPIsBMPxfIvVtO5s6ToWC
	1tJmJS5eumaQxT7zomifrKE9JI0Y3hyHsC0l8oo71lUlK1OmzUeYX4iudV/SoUYjnuJIMaM1JNJ
	qD+QWi
X-Received: by 2002:a05:6a00:4f92:b0:842:2ddb:e305 with SMTP id d2e1a72fcca58-847f6f69949mr3837076b3a.43.1783185297621;
        Sat, 04 Jul 2026 10:14:57 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm1379101b3a.32.2026.07.04.10.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:14:56 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Sun,  5 Jul 2026 01:14:07 +0800
Message-ID: <20260704171411.1413349-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704171411.1413349-1-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings description of the thermal sensors in the A523 processor.

The controllers require activation of the additional frequency of the
associated gpadc controller, so a mod clock property required.

The calibration data for both thermal controllers (THS0, THS1) is split
across two nvmem cells at different offsets, requiring the two cells
to be read and merged. To maintain backward compatibility, the name of
the old cell remains "calibration" and the new cell is named
"calibration-second-part".

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 54 +++++++++++++++++--
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..6f5b2f3b9 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -24,6 +24,8 @@ properties:
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
       - allwinner,sun50i-h616-ths
+      - allwinner,sun55i-a523-ths0
+      - allwinner,sun55i-a523-ths1
 
   clocks:
     minItems: 1
@@ -47,11 +49,16 @@ properties:
     maxItems: 1
 
   nvmem-cells:
-    maxItems: 1
-    description: Calibration data for thermal sensors
+    minItems: 1
+    items:
+      - description: Calibration data for thermal sensors
+      - description: Additional cell in case of separate calibration data
 
   nvmem-cell-names:
-    const: calibration
+    minItems: 1
+    items:
+      - const: calibration
+      - const: calibration-second-part
 
   allwinner,sram:
     maxItems: 1
@@ -107,6 +114,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun20i-d1-ths
+              - allwinner,sun55i-a523-ths0
 
     then:
       properties:
@@ -132,6 +140,29 @@ allOf:
         - clock-names
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun55i-a523-ths0
+              - allwinner,sun55i-a523-ths1
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        nvmem-cells:
+          minItems: 2
+        nvmem-cell-names:
+          minItems: 2
+    else:
+      properties:
+        nvmem-cells:
+          maxItems: 1
+        nvmem-cell-names:
+          items:
+            - const: calibration
+
 required:
   - compatible
   - reg
@@ -176,4 +207,21 @@ examples:
         #thermal-sensor-cells = <1>;
     };
 
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun55i-a523-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-ccu.h>
+
+    thermal-sensor@2009400 {
+      compatible = "allwinner,sun55i-a523-ths1";
+      reg = <0x02009400 0x400>;
+      interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+      clock-names = "bus", "mod";
+      resets = <&ccu RST_BUS_THS>;
+      nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+      nvmem-cell-names = "calibration",
+             "calibration-second-part";
+      #thermal-sensor-cells = <1>;
+    };
 ...
-- 
2.55.0

