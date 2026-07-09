Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535DA3B8BA4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625362; cv=none; b=ZtvYOd0mtMONtEFcVk+mDbn4sYLF32t27QQ2PvUDkwZfMHn2d6oFREqXABIWY6v+xtoEClTKokdpBC5XKxZsvSuNCRPvMnzk+OWQPT2j6VxpAG6fLsEJbxrFxvMS7fs+r4sMJv5+HDXPlRGaOD1pbTI4Mt9hu43vEd2Jx2butB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625362; c=relaxed/simple;
	bh=Gs0fws9+Gd/2rQ5zcAPdBNSEeReL3xcHI6nMcWwIRUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZCmFg+2hdUemOzgpun+kl7UCbiKUB7MU8P00mxDnQaMsC8zL4EZP5+7ecfYpZWiKdN0dANXE7m7t8QzZl79mTiZ946OodNRCnBQg00LjHJHQ3Y6os2f3gpIsQ5xgNa7cf45PpsELKak5CIk5qDHEuyTx8k5lc5WE8KEsXgWtdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwGvkOXy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwGvkOXy"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b7612475so1347405e9.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625359; x=1784230159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oB3E49QZBjfmGTKqlsRL4IImHG0MNtyTR57h7Jogqb0=;
        b=GwGvkOXyt3WUs5jMUdAzqywbfVNlW39T/d6cwW0eyCNxO8G72AGAI+v9BSP13D1nlC
         3KDM7DwSfNmxf8wDthHSX5XgLAsvKKxPmMtuRKDmXorZR0jsf/s2AH05vCDDGabGu4Yw
         tF64nYeOqGFV+tkfpt9xPJ1uWjtDc38Rk+zQSFg5PukapHU2SaMqzM42JLDjU0USB1k2
         SNkSYEp+nRMy/WPB6MwN1ABLcXSdew4+bZSzy23Agoeyx00ILANTQcGmgcuLXWBT/cuz
         m2K9bM3naMq1BZRT75+IL3vWs0uCGfXT/OxzEtdO3V6mocLlUYwNvjmDeo8cn51xCNtZ
         N8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625359; x=1784230159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oB3E49QZBjfmGTKqlsRL4IImHG0MNtyTR57h7Jogqb0=;
        b=jITbB1LL/UduIp1T0TMGIntjanMfEdw8oCLYuszksgWzzTcCwAf5khtLlS1zfjeM7l
         /x/fd3Vxccb9UztiheNTlhq0C7IArRUPCqs0/23lBXn+IPN8ITYMdIoh7dQFJh6xlTNv
         EDiis396n+rUDdUyNIrL/SwHxTZ1q9hztt7wthfT/nwq64PjAwTO8EbWS2Zi0Xcl13ps
         bsqPropbw9vhuiFulHYrvSS/Yl6Di03/VadkETmAPhkgmwcKUT17Gq/E8VwSPhS6rwv4
         649YlYJ6j/QTdu2tO1/8HEfgzskFsl/0s+fuhP93sg/MGHeSf/kwVD89p39Ws1uMbqUR
         Fojg==
X-Forwarded-Encrypted: i=1; AHgh+RrPpWreGXrgy7lHdDE82hMOJbeWi3PcSuVKQxrN0S6Q0ECRUrxeq0Ch3RjOVWxBhyFXkhvEnAUWp59z@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjr71iMvU5cc90JXZWKxiaM2ZD1UX3tPhMBLDAxmn6/vCgrrsv
	pvO+9FRQb1KFQ8wbAwCwxaZBKZnxeuwMKS4f+nDtwm70DJzM6hTVPMtI
X-Gm-Gg: AfdE7cnrPc5usXF7tJ8VahBLeaYvj8MAtAhC1R/VAuK1c275tgrZLMk8sI3Tqm0nU7j
	mPJNUTcQL57GfgR7/fyYo5kLxkHjcp225ZIjXIOY6wnLr5QYcv7EOW6DgKOH19msSn+vywzn5oN
	pV3WvkuJqZFzGs9AtDSiY82hQXu9S+rt0M2bnvmWzCpMvnCfIUdQCcOkMH0sM+ET3ZxN2tQEyfu
	yjJPExYA/T+YhIWUKat41pBZfLv6EdChJ5MmljIhroyVv2/X//nWYtPrPzuRj4iySGb3EScD0Tj
	+g1sdR3lYuDCyRHP7t6JyOUN803LFUFPQRDtlwWbqEGBvhWFvT3O5dXKM1eE9n/j08dQEE4lflL
	+rK9kH5F+h/EJiJsTNhch6oQ6Oe+CymCtuscTrqRu8kSMhB2dogdKzi55TZuNnZBJqJtqfgil50
	g+/OB92kttqc3e99z0sSxf
X-Received: by 2002:a05:600c:8485:b0:493:e4cd:def1 with SMTP id 5b1f17b1804b1-493f2c113d4mr3457625e9.11.1783625358666;
        Thu, 09 Jul 2026 12:29:18 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm84366045e9.3.2026.07.09.12.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:29:18 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v19 01/12] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Thu,  9 Jul 2026 20:28:58 +0100
Message-ID: <20260709192916.630794-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
controller is similar to RZ/G2L but has five clocks (core, clkh,
cd, aclkm, aclks) and three resets (rst, axim, axis), so update the
clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
It has an internal divider for all modes except HS400, and a 2048-bit
divider compared to 512 on others.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18->v19:
 * Updated commit description
 * Updated clock and reset description with AXI master and AXI slave
 * Added else condition for reset and reset-names.
 * Renamed aclk->aclkm and reordered the axi clocks similar to resets.
 * Retained the tag as the changes are trivial.
v17->v18:
 * No change.
v1->v17:
 * Collected tag.
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 108 +++++++++++++-----
 1 file changed, 81 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 4d66966ce290..6d229a41a4b5 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -18,6 +18,7 @@ properties:
           - renesas,sdhi-r7s9210 # SH-Mobile AG5
           - renesas,sdhi-r8a73a4 # R-Mobile APE6
           - renesas,sdhi-r8a7740 # R-Mobile A1
+          - renesas,sdhi-r9a08g046 # RZ/G3L
           - renesas,sdhi-r9a09g057 # RZ/V2H(P)
           - renesas,sdhi-sh73a0  # R-Mobile APE6
       - items:
@@ -86,11 +87,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   dmas:
     minItems: 4
@@ -116,7 +117,12 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  reset-names:
+    minItems: 1
+    maxItems: 3
 
   pinctrl-0:
     minItems: 1
@@ -155,60 +161,106 @@ allOf:
         properties:
           compatible:
             contains:
-              enum:
-                - renesas,sdhi-r9a09g057
-                - renesas,rzg2l-sdhi
+              const: renesas,sdhi-r9a08g046
       then:
         properties:
           clocks:
             items:
               - description: IMCLK, SDHI channel main clock1.
               - description: CLK_HS, SDHI channel High speed clock which operates
-                             4 times that of SDHI channel main clock1.
+                             2 times that of SDHI channel main clock1.
               - description: IMCLK2, SDHI channel main clock2. When this clock is
                              turned off, external SD card detection cannot be
                              detected.
-              - description: ACLK, SDHI channel bus clock.
+              - description: IACLKM, SDHI channel AXI master bus clock.
+              - description: IACLKS, SDHI channel AXI slave bus clock.
           clock-names:
             items:
               - const: core
               - const: clkh
               - const: cd
-              - const: aclk
+              - const: aclkm
+              - const: aclks
+          resets:
+            items:
+              - description: rst, Core reset.
+              - description: axim, SDHI channel AXI master bus reset.
+              - description: axis, SDHI channel AXI slave bus reset.
+          reset-names:
+            items:
+              - const: rst
+              - const: axim
+              - const: axis
         required:
           - clock-names
           - resets
+          - reset-names
       else:
+        properties:
+          resets:
+            maxItems: 1
+          reset-names:
+            maxItems: 1
         if:
           properties:
             compatible:
               contains:
                 enum:
-                  - renesas,rcar-gen2-sdhi
-                  - renesas,rcar-gen3-sdhi
-                  - renesas,rcar-gen4-sdhi
+                  - renesas,sdhi-r9a09g057
+                  - renesas,rzg2l-sdhi
         then:
           properties:
             clocks:
-              minItems: 1
-              maxItems: 3
-            clock-names:
-              minItems: 1
-              uniqueItems: true
               items:
-                - const: core
-                - enum: [ clkh, cd ]
-                - const: cd
-        else:
-          properties:
-            clocks:
-              minItems: 1
-              maxItems: 2
+                - description: IMCLK, SDHI channel main clock1.
+                - description: CLK_HS, SDHI channel High speed clock which operates
+                               4 times that of SDHI channel main clock1.
+                - description: IMCLK2, SDHI channel main clock2. When this clock is
+                               turned off, external SD card detection cannot be
+                               detected.
+                - description: ACLK, SDHI channel bus clock.
             clock-names:
-              minItems: 1
               items:
                 - const: core
+                - const: clkh
                 - const: cd
+                - const: aclk
+            resets:
+              maxItems: 1
+          required:
+            - clock-names
+            - resets
+        else:
+          if:
+            properties:
+              compatible:
+                contains:
+                  enum:
+                    - renesas,rcar-gen2-sdhi
+                    - renesas,rcar-gen3-sdhi
+                    - renesas,rcar-gen4-sdhi
+          then:
+            properties:
+              clocks:
+                minItems: 1
+                maxItems: 3
+              clock-names:
+                minItems: 1
+                uniqueItems: true
+                items:
+                  - const: core
+                  - enum: [ clkh, cd ]
+                  - const: cd
+          else:
+            properties:
+              clocks:
+                minItems: 1
+                maxItems: 2
+              clock-names:
+                minItems: 1
+                items:
+                  - const: core
+                  - const: cd
 
   - if:
       properties:
@@ -247,7 +299,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,sdhi-r9a09g057
+            enum:
+              - renesas,sdhi-r9a08g046
+              - renesas,sdhi-r9a09g057
     then:
       properties:
         vqmmc-regulator:
-- 
2.43.0

