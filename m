Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708B741E6DC
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205291; cv=none; b=sYQfDkk3usw3L4KD2+XGAKRPVxnkbceauxpn4XIbjeurC8wNjUTYO31y+bILzxDRnZl8MryMM13mkIoDePBwng1bIQPQNuTAzBK9rFPJU4kjjo2P0sV3+U02GtnYgSgshdNcp3JGfwFzXiIzr91jnISkv7co106CrYCfZTMSFss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205291; c=relaxed/simple;
	bh=ZeoHOrcCtYoooj9iNeyIvUVAJBLQSZ8butMUSbwnfGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhylX8egGq3dpMZCqcpofEb4fUOqXuYwrCiTsi58fgcns2uyyNnbsm/ZYYX/SXSlqYJ3DhGsaJLfLsrp/BeGJ9T2TXQvpNanKoet1k4Mk0VoKrkZmgqlimXYLz5RGdbZ8UrIRrPlrmSJ9ShXFSiuLJDlenvjE5DnZuJLuQhNNLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bV1oetyw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bV1oetyw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso9813225e9.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205286; x=1784810086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45HS0HXfnOqn/cim05cwGxtOaeZqHee/zE0v0a9vY94=;
        b=bV1oetyw6DCZqPlLTxyC7KQwAYdwEQZBPUwy0DeiE24WWhV6xTU7ae+fPo5C3DYz26
         0D4EgMFmgvDFqaZ3VfNg9Tth/lQVL7HKh+Z2ddvclPvJYQVYXna7uvgGbiMZu4mKOyH1
         1FLn3ITWGx+xS5tr8xAeJBINo4/mMMBWpk7d6fqy1QbVfxigigPheyGnalQcXqBmrxkc
         lZsAjOhrIY94r5xUgnVzY5154BWAPePTKu68N0ZasZEX40o44TXmZCS7MAkLUKws3rz8
         NjL3f4CbCefWRoIsS10TD7mccR2w63Lzh22h4gXLFkm3uUT69zKoI3pvgLIyO5jINLjS
         171A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205286; x=1784810086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45HS0HXfnOqn/cim05cwGxtOaeZqHee/zE0v0a9vY94=;
        b=l7XHBruLXCjPLESEbwm0WYDXr+rviWuQJ6MsTvmjwkpXNuJEHgXMF0Eau51PO00fUv
         /Zs4Vh2F944KZc9izLeStBEcwC4kF1+bajx/J3SqJpRzEy7GRjNtPS5PAPhjohB3KJ/5
         sZ876MizOnxKi2C0WOMuoqZbM9SQX1So/FFwN1ZSaJchfD6rC80lbjNVFUq8IF+kc0U0
         GyvB23gl+3DNykXokz8/Ph99SrfdSy8W7O/qD4RefPsoYyHYwvjpx9PtcxAgbup9sSiR
         oBH87RMCqwBb8PZdcbccuuk5OV7tvL+43ZWsjV8kj25EuxyMGsA9GVBRVszC/wAiKjYp
         oN3w==
X-Forwarded-Encrypted: i=1; AHgh+Rpimz7BGKqW3/ewjYTnpnitmC4xOFVSycp/v4u6J+9Thh10VtrZtjx9VdO4A6DbkhPiynMBr6CR+kC0@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/A3XTzsU7ENpieNUz8kqpu8HuxtDn0Ixgxz4fzzq71zaG9wG
	YRvLevdmvYGm4xOYDgC9y7iBgCFW5VEtSeRHt6fXs0D/g/h0e3jG28BN
X-Gm-Gg: AfdE7cnltw1uX0HG7FVyYnN9+TuaaYtcCrDqSWIUdIk8dlG4hI+LbMByuNyjeFLIulp
	hjvINCC5FBQP3yyFQobHdJsBMoyEZ3neNyO5qWcC7RQOgZGTY2w2XeZlTZ94EFIcMouMMyoazUV
	km5/GBOQLIKkY2VaJA2T16/sj7qb5+TZRq9JxK5AFV1Ramulz6lHAMjcnycjJUDtpkD0CPDGZo8
	zSCsTPtCuQaq+HXF1nxg54GDldQQWFvQCa6r0jyKYdlV01mawCjGvF4tMmkG5neaWqWVdP3PCyO
	StTKiWIIzclgPfFosRWb18KyBRJEjjTn2p4LB59ipOrDRZQ2G25PNCHJu9A5Brroaac3w3bONdq
	Wts6uhLW0E8bvc08GBoFyaf6BBilRAgqSRxPKZJva9B9YcpF6DNPg7H1W+KVtY9GsaEITaah4NT
	L35obLUJe+y/5dKEgv7BPZf+8c2fsUf1iFzoKQUIyG/ANsl9WOYR/JHTaacLe3wHTfb2S9b+BVz
	L2OA9F5bzLO92sW
X-Received: by 2002:a05:600d:8444:10b0:493:e46a:ab with SMTP id 5b1f17b1804b1-493f8837638mr181771255e9.34.1784205285938;
        Thu, 16 Jul 2026 05:34:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:34:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 5/8] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon support
Date: Thu, 16 Jul 2026 13:34:31 +0100
Message-ID: <20260716123434.2576253-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
resides within the CPG/MSSR block rather than the WDT address space
itself.

Previously, this was handled by including a second register range in the
"reg" property. However, this is architecturally incorrect as the CPG/MSSR
block consists of two distinct regions (0x80280000 and 0x81280000) that
contain registers for multiple peripheral blocks.

Since the CPG/MSSR block is a multi-function block, introduce the
"renesas,sysc" phandle-array property to allow the WDT driver to access
its control register via this shared regmap.

Mark the use of a second "reg" entry as deprecated in favor of the
new phandle-array approach for SoCs that require WDTDCR access.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Updated property name to "renesas,sysc"
- Updated description about deprecation and use of the new
  phandle-array property.
- Updated commit message

v1->v2:
- No change.
---
 .../watchdog/renesas,r9a09g057-wdt.yaml       | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
index 975c5aa4d747..322b6921c147 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
@@ -48,6 +48,17 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,sysc:
+    description:
+      System controller registers control the start/stop of the WDT, and halt debug.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to system controller
+          - description: watchdog IP instance index
+            minimum: 0
+            maximum: 5
+
   timeout-sec: true
 
 required:
@@ -73,15 +84,29 @@ allOf:
           minItems: 2
         clock-names:
           minItems: 2
+        renesas,sysc: false
     else:
       properties:
         clocks:
           maxItems: 1
         clock-names:
           maxItems: 1
-        reg:
-          minItems: 2
         resets: false
+      allOf:
+        - if:
+            required:
+              - renesas,sysc
+          then:
+            properties:
+              reg:
+                maxItems: 1
+          else:
+            properties:
+              reg:
+                description: Deprecated. Use the renesas,sysc property along with
+                             the watchdog IP instance index instead.
+                minItems: 2
+                deprecated: true
 
 additionalProperties: false
 
-- 
2.54.0

