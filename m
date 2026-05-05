Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B7E31F9A5
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980255; cv=none; b=TXO6zeSQOZdwMw0tkgfStNE6IxX2Fq2aAHvFwwAdcRJcfdQo8OvmHJaLp7ogI1wdXlHQNSprMU9rTQ8B+Vr7tHpQsbM35tBcg8rZS1Qrn5QHQ0Avl6SPiM0jHg/E/fjb5QjJY5b/yUL0pCpyphWT2oG6MfJhw3zWymBpenqredc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980255; c=relaxed/simple;
	bh=FVEHtU5Z6195zJJAYmRnFoFpIiG39ejppD1izDSTya4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sx9lqEK6V/d2quBpy/Wx4rYl88EW4r8vQ4CKWbBSEkMltAQ4IJftsScLirxn8h9qLDGgzs+RXveoSiVM5Zl6Yzj3TntCF4N89AvDFfGgphaQdLciTDoMwjHKElB2pzTtmjNp9OQ6TFQjk+z31YCHQ2EhzMlFq1F1zGw1QhPukuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Up3wRqGz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Up3wRqGz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d102471a4so18108875e9.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 04:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777980252; x=1778585052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RhR/bcs6oyD8dx69WfVrYrpk9XZKcpx9bamSBwmfAs=;
        b=Up3wRqGzVE9uFDtayO6H8Mkqc1//ATyVa2XhKQ6df/8BkWVCp+/CQ0LhosFAKjwZQg
         VPTvgVndukOLxMwCwr5a+e4i8aROcclvKi/vj/hKIt37fUN5ghBhpWzOT2zXalix8xL1
         WKM9gvryzci1nprLzgdqDS+I63xjxuwlOhwFuxh4G/nCYAD+bgqoQnWO+sqEAHnaWsna
         J1TKt9MNRS7RPermt5Jrt5Q6C4suVN5G9Z51fqqOE31EJG9G4/T6BR/213DFKJZ3xvnm
         Tl6lKEw5SmvssoqXpQgdj09wYPVpTouwF9zM9lApsB/9WMJcnspmFlbB54hgtlwpAPJY
         va6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777980252; x=1778585052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5RhR/bcs6oyD8dx69WfVrYrpk9XZKcpx9bamSBwmfAs=;
        b=I9xmfwgDkwvp1OenK9f5xX2wztg3yomR9K1q3Eouglb6qmYqf2uk07enG+w5PF9JxL
         Qv0zXVcAiC4i/vZMwKqg4MqlReya1aoTZDX32rWzJCj0Yqb/rROBvojOfMOEwaZ8oxPy
         EDUE8Wkt2M45nQYik+fbT2M627MIjPUj/KdkbHA3i06VtrpCdieoRSph0NS3u0KJ6gUs
         +P136BjOr10P2vHf+7qGmVJobTiZeUfIhmrhPNR/FcukMXzhVvDOFctvtMiuHfKoY5fW
         NGkQRODDoXByN1XNJm63TLnYyTHXtznbpmJKr11I+CqtfSoS/pcfi3dM7+NU9CrBrvvg
         TfyA==
X-Forwarded-Encrypted: i=1; AFNElJ8YLuE53mV/Jau2ZbQwBW6TGwWdfeRS1YqWIn0wthvN5sCUL/V40hCZc1DSy/pznGLkEjahxKVcHwlU@vger.kernel.org
X-Gm-Message-State: AOJu0YzqEPKWh+p+SWiG9N2PXwCh4QRPgs5BiKi+L0eFSvzsVdK9rXXk
	Xm7odpdSBZssGzUtJw2gYzOn0PUDCMhwzM3kAPYiIlLPX6PKqVyWqo8EjteqKQ4KUSY=
X-Gm-Gg: AeBDieuf6J6lmAIcBEDMt0iYBWbFhvtMAZJ6E160LAWOrGxDQbF2ogsei0qccev8QW8
	dQUBtYtnt6wq5tl7owrESFfjhpyTaALWidDe5X6EuArXZ3kFwFYx3k/o4FVFqO318X97Qq1Gg3p
	pVSq2/4R8XkIP/ybXKiLQ82vEq/5qvpfIqcdaUMsqz0rEKIDguLu65ndxpEXjWxFj7o/LHUrvaR
	/+5jP3RE32mSXbUPaBPDv/DyucN4pq+xtqhIK5v9j6tiJt0rmbjYHkvMGAX98a+pMiUle3lDcio
	xYuUgj5yYV438Kdh0aor9l6br9zYe4uwsrW9TD794pWKn4MnMG7+VTTBPd7ys144oE7rKRzGcMP
	B9HxtvhflUvy0Qqc5ONpf1y70jiN5OEX+4H+cdaQlQmafGt9k3SaTKwz41u7Egz5bG8FaAPgkYZ
	mCsqnMf+TzwjyY2L1cOn25y7g/rRYU6Efj2XsnyhIjlGFNqMYdHuYaTARTzjjdbikDAQuqnrOx+
	8a9Zy2r4P3ClK+X56mNoBrXEJZDwh6MM93cZy2f/Ru1sm9VINWRYytMyA==
X-Received: by 2002:a05:600c:3487:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48a988a6ec9mr238315625e9.20.1777980251748;
        Tue, 05 May 2026 04:24:11 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm339946455e9.11.2026.05.05.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:24:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
Date: Tue,  5 May 2026 12:24:04 +0100
Message-ID: <20260505112405.667796-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document xSPI controller found on the Renesas RZ/T2H and RZ/N2H SoCs.
The xSPI IP on these SoCs is identical to that found on the RZ/G3E SoC.

The RZ/G3E HW manual (Rev.1.15) references bridge channel 1 and its
bits, however the hardware actually supports only a single bridge
channel (channel 0), matching the RZ/T2H design. The references to
channel 1 and its configuration bits will be corrected in a future
revision of the HW manual.

Update clock/reset constraints to handle the SoC differences.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Used RZ/G3E comptiable as a fallback compatible for
  RZ/T2H and RZ/N2H SoCs since the xSPI IP is identical.
- Updated commit message to reflect that the xSPI IP is
 identical between RZ/G3E, RZ/T2H, and RZ/N2H SoCs.
- Dropped RB tag from Rob due to above changes.

v1->v2:
- Add RB tag from Rob for the dt-bindings patch.
---
 .../renesas,rzg3e-xspi.yaml                   | 56 +++++++++++++++----
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
index 7a84f5bb7284..e2633476bd54 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
@@ -30,6 +30,8 @@ properties:
           - enum:
               - renesas,r9a09g056-xspi  # RZ/V2N
               - renesas,r9a09g057-xspi  # RZ/V2H(P)
+              - renesas,r9a09g077-xspi  # RZ/T2H
+              - renesas,r9a09g087-xspi  # RZ/N2H
           - const: renesas,r9a09g047-xspi
 
   reg:
@@ -53,28 +55,38 @@ properties:
       - const: err_pulse
 
   clocks:
-    items:
-      - description: AHB clock
-      - description: AXI clock
-      - description: SPI clock
-      - description: Double speed SPI clock
+    oneOf:
+      - items:
+          - description: AHB clock
+          - description: AXI clock
+          - description: SPI clock
+          - description: Double speed SPI clock
+      - items:
+          - description: AHB clock
+          - description: SPI clock
 
   clock-names:
-    items:
-      - const: ahb
-      - const: axi
-      - const: spi
-      - const: spix2
+    oneOf:
+      - items:
+          - const: ahb
+          - const: axi
+          - const: spi
+          - const: spix2
+      - items:
+          - const: ahb
+          - const: spi
 
   power-domains:
     maxItems: 1
 
   resets:
+    minItems: 1
     items:
       - description: Hardware reset
       - description: AXI reset
 
   reset-names:
+    minItems: 1
     items:
       - const: hresetn
       - const: aresetn
@@ -109,6 +121,30 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,r9a09g077-xspi
+          - renesas,r9a09g087-xspi
+then:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      maxItems: 2
+else:
+  properties:
+    clocks:
+      minItems: 4
+    clock-names:
+      minItems: 4
+    resets:
+      minItems: 2
+    reset-names:
+      minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.54.0

