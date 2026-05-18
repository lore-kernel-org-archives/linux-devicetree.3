Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA243F65FF
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119627; cv=none; b=jCNML6sHbW2abYWGh7HO/k7Xmgk5Y0hBhVHdK2nK7Ojn4X5CIjh+77EcIk+h4SSx0Ea6/oFjwHhGSpNJ71MKKclsiBqTNjhi4jQ7W4oQO0FT9hVOzcqHWAPUWYLCyG60PugFT/PI/Po4z3sYVj/YYcW27dguraqhUa3qBKN+rjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119627; c=relaxed/simple;
	bh=Xm5Boyim7sdrxeyIokp6SD1lIy0FcgEcbXWyXpnbQr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uw3AJVGZKZBOsvUGtfsPk2wkLguC21z7JdFu1s39YpgFK/bbizKUZFel692Md6NAL7t4kHgEtq/TJa6SDG8EnHhKASg2VQsQdGpGblnNl7M01uCKlWuBj7hSF7lpPJ4swmHfb7DECSPMXijWtmVBBIzfTQVD2ZKV0AprW1tLmD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5De4wUy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5De4wUy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so11340385e9.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779119613; x=1779724413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9onwht8Dq0fj2+O1hssa5nW2YVplvEKVA+74iuHZx0=;
        b=Y5De4wUyA5LUPNRVvDh7Jn+C8v6vLl7DsQ4xI4HYu/3HhOyzpyQv89uE09ykyyk2xW
         L9Pl0cbNJsZ3878uAzlSeQFPPNdjG6xTGyFrTclO5COMWzfjKgZjmz4d9T1xlzFAu6Qo
         gvOTcg55h1ZGCLlP6P25vzFfhClnQAVfELkWKCyAi0s0tF3OYxGNUE9UukCmW1rWgf21
         0wXzvQ+yIrp3YrGtbEtigR12kkPa729Yts2fP95hmTZVF2qFX2GyWQR+QcmW0KRaGFtU
         0nWfGhW5knNjcSBCLHrGci206zhZq86hM9YBp6MTDR6yo5zp06++fYvaadjKVEaBZVNw
         k/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119613; x=1779724413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9onwht8Dq0fj2+O1hssa5nW2YVplvEKVA+74iuHZx0=;
        b=aA4VqcO7f8nZcjNr9O5lmXR8PiEs3DCBUJShpbspK9TVBvQJ7eUwS+f/ily8TjUxpR
         AaCi05ECadnGpxg9qfqdN/g0Tj/ffiIKFQ9hPbij7OJRY8UpymSjyUvuaIKx9uvEkJmf
         ktFuWR4nfzG9Ay/6uWaBsD4UBxl+DC2byUS2Ixb05dH70ZmtO7W6TDm50HXU0jxiMoXD
         Lhk0GKbX3TeTw3Wkh/1g+PvC8yyaFg5weZekVhnnz7ZNxlwajn7QVC8T8s9JCnhwHqHg
         0io/buHNXvtI+AN6ysGPIcMdaeLmM+vjo1LIJvdhbdYt/64ifRRKfpXsp62CBrLAFaAx
         /9Nw==
X-Forwarded-Encrypted: i=1; AFNElJ9ryMs74cYUej4/cH5jsO7ZcEniGsLHm4DUqi0EpG7F6oZSKEJAUxcCDq+Ld/VJIrOUB4M2HEj5bE4t@vger.kernel.org
X-Gm-Message-State: AOJu0YzlWDFqAxMZXdPLR04W4k3RHswzn/8AAw8P8SS6vFw8FCoIO9nJ
	emMHVd17xqvWRN/YVaAftifdBPmf78j7ShZvMGTBxwvo9OMG7c/FFQEQ
X-Gm-Gg: Acq92OGzCVSbqD6y1rkjX9bZGgB0OjD+yOJHRYaxHIroRl4G/RHWvxkZK8Yr2K2eLS6
	XX+ujwLU+coffnoMt1JfRWFm+TuSm0J6ZQvGMCgmALksVSUU0EUNptwdot03VcARoDLvgoMiMpN
	WY04zXiPBjeYCVmxs5eiatJ9MNUwjIqrIWTa+CofWeqtVnQR+t8TnYq9VZFb8dvBdzOceKjMi4M
	cQO3HMkccML/+wgeqHrKGnsCIKH52Y84oh5JDRf17mujLWI5IarvP74RJ3pflkCZYA0d44RwX6w
	zzJstiyGtlcsKhAjiESFVzTk6l/L3A5K7ZHBCsX8EpOxoWu2jv2EZCYlBNcBbB66Jg7CB9vEWY7
	Ok09uDY4ETmZ4elncYxSAPj92heXitoyGCv5RGs5DJzD9gxl75lAQYDU5gSfKu+zzMDuqY2ze6F
	K1n31fST3NmLxQtT8Wl79JwvfdDQSlX0d6RSxO0GpyiDGaRcAT+ETWAdVmxWCvY/q0yaYWxeeyU
	qbygIYkY9edwK9nveWy01b8S+yOY+J+zeSG0Q==
X-Received: by 2002:a05:600c:3e1b:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48fe60eccc3mr235450415e9.13.1779119613010;
        Mon, 18 May 2026 08:53:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2409:d26f:6d8b:b2cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm450054575e9.1.2026.05.18.08.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:53:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
Date: Mon, 18 May 2026 16:53:21 +0100
Message-ID: <20260518155324.168948-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the PCIe controller found on the Renesas RZ/V2H(P) SoC.

The RZ/V2H(P) controller is similar to the RZ/G3E variant but includes
additional registers and configuration bits for PCIe lane control. It
supports multilink operation configured as either a single x4 link
or two independent x2 link controllers.

Unlike earlier SoCs supported by this driver which only feature a single
PCIe controller, the RZ/V2H(P) SoC implements two controllers. Both
controllers rely on the system controller (`sysc`) for configuration,
but the required registers reside at different offsets for each instance.
To correctly identify the controller instance and map the corresponding
system controller registers, make the "linux,pci-domain" and "num-lanes"
properties mandatory for this SoC and restrict their values according to
the hardware capabilities.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated commit message.
- Dropped un-necessary new line in schema.
---
 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
index 90086909e921..149a2973b16e 100644
--- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
@@ -14,7 +14,7 @@ description: |
   with PCIe Base Specification 4.0 and supports different link speeds
   depending on the SoC variant:
     - Gen2 (5 GT/s): RZ/G3S
-    - Gen3 (8 GT/s): RZ/G3E, RZ/V2N
+    - Gen3 (8 GT/s): RZ/G3E, RZ/V2H(P), RZ/V2N
 
 properties:
   compatible:
@@ -22,6 +22,7 @@ properties:
       - enum:
           - renesas,r9a08g045-pcie # RZ/G3S
           - renesas,r9a09g047-pcie # RZ/G3E
+          - renesas,r9a09g057-pcie # RZ/V2H(P)
       - items:
           - const: renesas,r9a09g056-pcie # RZ/V2N
           - const: renesas,r9a09g047-pcie
@@ -220,7 +221,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g047-pcie
+            enum:
+              - renesas,r9a09g047-pcie
+              - renesas,r9a09g057-pcie
     then:
       properties:
         interrupts:
@@ -235,6 +238,20 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-pcie
+    then:
+      properties:
+        linux,pci-domain:
+          enum: [0, 1]
+        num-lanes:
+          enum: [2, 4]
+      required:
+        - linux,pci-domain
+        - num-lanes
 
 unevaluatedProperties: false
 
-- 
2.54.0

