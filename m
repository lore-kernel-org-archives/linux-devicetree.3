Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8003B103B
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506216; cv=none; b=FS3Dk2d5Pd/HHcB2iI1nBuUoFaXjck0ssGUM18/7pY0OqACByHMSVhdHhmYWYpUM4jHYt2MoKADPQG8OlE/Eo07NbN1ZRK9fjZ5XCBIwO5+gsszDEThp9uwePPaCLBAx83oCjnegfwfRcCefHNxjEs4BJjKx2CHgvI4wBajPoZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506216; c=relaxed/simple;
	bh=r/bbII9aD020V2/LAtT76aUh9hHr+gLtRWgDFPIhPa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGmJ/ygQChJ5/rWHeKxHCjGmAFMdVBNrDwQYs+uqXc3Xgq21kNI6JHFmGuv0WMdwlCnZX9t8K2NJElDeUgFLV8MFlh9RBQZxSXqpJZTzId7CBulkX0b6iM4RL8OBWZ9pBXVk4esfYDSaBhOt/6nMJr0779fMIDGfy0vPaEdzuoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gL94Q+8B; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gL94Q+8B"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304d8362a58so2205319eec.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506214; x=1782111014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lenEIxoLi6+YCq/tfMwIzvmfL+sfiBY8pQSkNEn0Xhs=;
        b=gL94Q+8BhWAgbyo1ZXlLRRQMZ1F+FQ0F7M/SrfUZXRKezKbSBuj+bLgSxcUWtqsTAj
         mlQsk7GQnJs63bt/u+wusE0/8zIGO18OaTDw+Dgqi+8K/PYyCyORU99Grl7v5kJeLbTK
         v837mUMEnjAxU2sNC0JVyKDoeULo5fJERmT1lIihSsjWw0LXVYKOUiVm44sVGcTOedy8
         aUy3w96YUKVx3H0iz0965zi4J05EMesuH+2Asu2TlZtxXu7D76kbGGQMcFpvlwwrtXtE
         d7euC481f4bxCak0kwEjPXNrpDhIULHeW5Q15moXUadueM/fK1gIinveU9x4NCvjc1SQ
         INgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506214; x=1782111014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lenEIxoLi6+YCq/tfMwIzvmfL+sfiBY8pQSkNEn0Xhs=;
        b=g+PrNZE2n7IYt+FAo9D/OGSlf2uzZVvPMH2DzKP4BLkNxU4gd26q6wAVdQPgaMcD36
         4M1GXFSt/TmppK8ULCR0mLGBse0yMgltlRUpATdOuvkU5tHw4N50ZIk1+bYS0k/OXb3O
         jbAp639kDnr+Mke0K9bUoF7pwyU8YJ2jpbgi4OEYVAy8th7/35PYj4rSRqR1jwGlGV1c
         iC6JcV+cWwi2244DYD6MhCHMd4MNJgOyZpPRnWP612pcKfCyc0OFTbLEWTuDsxB7eoBo
         nOW4ZMuEiJSDZmXfyE7OO3a0hewNzwx8CbMrPNppxz8BxLWW1Au6C/AchHAVKTzID985
         CMbA==
X-Forwarded-Encrypted: i=1; AFNElJ+2y9UEWx6QpsYYCfRXJZeRsUSMfL044zJKTpnerWNhHoGaBdYN02DhYU0qpeF0nv//ZlkJ5ZQnMyut@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5eaK+pZg+979fROkIUIi3T4XrOKkDWb/mv4c5ZB1Uo+n5TMKG
	wCVcvIpfDLliXsgg4g31k1M50YYpjKrHmVH3C5lE78tpEO0KiedE/icl
X-Gm-Gg: Acq92OF+Wd2K1lewpJmygIYbV5q80daAOrUkGfzRo0aFD6WiQVtn9Ulcna+0Dv8SsMw
	Azf/W0sRh+pmdCmCc/y6OhZ/JIHcGCM38jHHQAvRWjUWQZjxQkGRHGokdqzp6lVm3GcpO4QB9PJ
	EZeLLk/x1e5GW0KpXo1yBkDnJMvUqHmfCVn2+2sz78dKIiFFLP/p3T1pOlMRp9C+G3ubTtci+HF
	kBPf/HB3IrjT/xyr7ZZ9dIcN8IY1IEikRU6YvI9sliWcal2PHJl7ErV7WXfDsFzVUaNjbgDmFeX
	PvSQMkJHkseB7gmph3iSC5bC4hknX/2EpFRo6wJY5ResS9Ju/jlMwr7oZ9fV5CD6MIXIs8V8bzC
	ZdwelHXuEHmyWL98rc8WsLsfZxkm8KAnXvi7bCyil7PjNIe8Vaboq6J505iMsL3BL54Vp0D/xc5
	ex9c/4K2jQPpdTurSsiMYXg7ZFsGUiqiXzyMea/Ek9nCOVjZMwcwBQknyl/NUgXiZp5vn5oq6XK
	LU88+kpH3YN
X-Received: by 2002:a05:7300:6da4:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-30820c0a172mr6428010eec.3.1781506214227;
        Sun, 14 Jun 2026 23:50:14 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm13516812eec.30.2026.06.14.23.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:50:13 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 1/6] dt-bindings: display: verisilicon,dc: generalize for single-output variants
Date: Mon, 15 Jun 2026 14:49:58 +0800
Message-ID: <20260615065003.76661-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615065003.76661-1-a0987203069@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing schema hard-codes the five-clock/three-reset/dual-port
topology of the DC8200 IP block, preventing reuse for single-output
variants such as the Verisilicon DCUltraLite used in the Nuvoton MA35D1
SoC.

Rework the schema so that variant-specific constraints are expressed via
allOf/if blocks:

- Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.  The
  generic verisilicon,dc fallback remains the driver-binding string.
- Move clock and reset items descriptions into the per-variant allOf/if
  blocks; keep only minItems/maxItems at the top level so the base schema
  accepts all variants.
- Restore full items lists for clock-names and reset-names at the top
  level with minItems so the names are validated against the descriptions.
- Keep ports in the global required list and keep additionalProperties: false.
- Add an allOf/if block for thead,th1520-dc8200: five-clock (core, axi,
  ahb, pix0, pix1), three-reset (core, axi, ahb), required resets.
- Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core, pix0),
  one-reset (core), required resets.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/verisilicon,dc.yaml      | 80 +++++++++++++++++--
 1 file changed, 73 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 9dc35ab973f2..0c41286b8223 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - thead,th1520-dc8200
+          - nuvoton,ma35d1-dcu
       - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
 
   reg:
@@ -26,14 +27,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: DC Core clock
-      - description: DMA AXI bus clock
-      - description: Configuration AHB bus clock
-      - description: Pixel clock of output 0
-      - description: Pixel clock of output 1
+    minItems: 2
+    maxItems: 5
 
   clock-names:
+    minItems: 2
+    maxItems: 5
     items:
       - const: core
       - const: axi
@@ -42,12 +41,16 @@ properties:
       - const: pix1
 
   resets:
+    minItems: 1
+    maxItems: 3
     items:
       - description: DC Core reset
       - description: DMA AXI bus reset
       - description: Configuration AHB bus reset
 
   reset-names:
+    minItems: 1
+    maxItems: 3
     items:
       - const: core
       - const: axi
@@ -59,7 +62,7 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description: The first output channel , endpoint 0 should be
+        description: The first output channel, endpoint 0 should be
           used for DPI format output and endpoint 1 should be used
           for DP format output.
 
@@ -77,6 +80,69 @@ required:
   - clock-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-dc8200
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+          items:
+            - description: DC Core clock
+            - description: DMA AXI bus clock
+            - description: Configuration AHB bus clock
+            - description: Pixel clock of output 0
+            - description: Pixel clock of output 1
+
+        clock-names:
+          minItems: 5
+          maxItems: 5
+
+        resets:
+          minItems: 3
+          maxItems: 3
+
+        reset-names:
+          minItems: 3
+          maxItems: 3
+
+      required:
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nuvoton,ma35d1-dcu
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+          items:
+            - description: DC Core clock
+            - description: Pixel clock of output 0
+
+        clock-names:
+          minItems: 2
+          maxItems: 2
+
+        resets:
+          minItems: 1
+          maxItems: 1
+
+        reset-names:
+          maxItems: 1
+
+      required:
+        - resets
+        - reset-names
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

