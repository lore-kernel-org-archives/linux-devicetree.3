Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B80F30AACB
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633372; cv=none; b=tvBC/LMxFMmTA/m/qVriA3WfOcqJa9dTcd+zP+Ft3YWHvDxAV0t3viaKBKK2aXhLqI4kEB8yyAh8REeIzA+irp99k74YbAtGEbOLaP7r6SYYG3jklbtZjLuj84w7BPeZTBwemWXN+H7aZQXgEd4eRjw2NHaiJL9By1jnqYqERK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633372; c=relaxed/simple;
	bh=n/SigdKyXTHXAMOgdOkyYoCjrKeCCVOvmY9wB8H71tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egEfBBArMoSGpRHQYmd0QWTJPNd11oFM74I/1gzFoU/kVX0pI4r1fy92sdoTgD81bJ1t/heRN5X2S4icrdX2LCZm03tY1p7fSreU+lo9sC8d1vr9EmSfwvF1XfEXr6MuUGxBe3rwMDJBEnKhRiyOAuOVw4DgBosZaJEwXC+9ysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKSOcbl9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKSOcbl9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so2057851f8f.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633370; x=1775238170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH3wFzr09f4BWW4HDYRhxglvtqStayE7wEn/6/CruX8=;
        b=UKSOcbl96vhqeSAzYGgkmsBQhIwxl/VG2DzbXXfSprmGSxV24tBoKFyGHgWP1J6zcX
         3wWDMszdnbmTH8v5jwVEAtstM7nPB5mcMre6V1QMxKFygMxXmLcM2vy12l76sNDUyYnn
         P94RTNvGsaEy7pRX73f6DYawxTcg+HND+mY3doiVXyAsRAvE5aRveGZaNS8zvEUEf/oX
         JktP2htCpH4dwGHNgkIo8K2N/Vp4hCoFmahnDdWVAvWbd1EdQHFxprSqqt7oa8NdCA95
         o0PhvgT/jEhkeVaef+0vMulDGCkeNyJSWYjSgHfVnHMRr9FnnlQ/qA6Z/hLTiD86GY6k
         mQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633370; x=1775238170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VH3wFzr09f4BWW4HDYRhxglvtqStayE7wEn/6/CruX8=;
        b=Yr7t5rLzzmk9CmHh82D+c/Os8ZtiSVpUIJOrPQVJgRGMGR9Nf4Km7t1OLLf3IJegxX
         Awwq/UIqo+Gwg8QQpRrIOLorBjAB4JQRnt2/+9KSv2fLfNMlMoZoubK94DMq9meh8TTi
         MWTiKWXiDasrwG6ZGOL9/sCwEo1gFU7zTJoIvrrTcheT6lVX4Ag5j29fjyCek8iqjta4
         xy3fq6ZEbcsnf0XCNs5f1oSSJFvSqjdl+QgkW1GfAcYo6BkK6O+4TAkGFpL20sPbRNbY
         pRYCT0xl93spbcdA5kQBq6RiOdX2B6cc/iVubHAQKqu2wbYxncn4CTOwCkES9z2F+g33
         Q8aA==
X-Forwarded-Encrypted: i=1; AJvYcCVDHSrW9qgq8ntsmJAchneVXb6YbZcuWNtSCAayKB+8vHPn8eqqICrPS0nUyjCop2a/VSHIE26Qz1Fz@vger.kernel.org
X-Gm-Message-State: AOJu0YzPbqXhn8pf4h84d7/fxZClj5h+5ZIm2Wp1kANPtIC+l9uQ6R++
	LsQDkJr5d8t/GlWHMOHt17hFimKUXEMMRZ3bGIe79sTBM0ExqFORaMfV
X-Gm-Gg: ATEYQzyfOzt07C/VBKGoXegCPNgns0Mb+0PpgtqAqougdZfRMbBPNKXYm+sd7u2Xieg
	Yyf77uNZfoWz1HzIgG4tcPVqVuspmN7zBgp/tWQkEUigE1l71HEKGXQR87RyXe0maQapxcNY3+f
	vncCP8qjUaPqkoe7EbCimfVjfAodE1AgL6LWWXJJPCB/JrwSthZgTPFouftEYGGLYEVXiZuMH0W
	oGeQOcpGpGPecbWILCOUfLr0RkFDFBH2iMiLGOsKP/k4fusefIO54uRGyV95T3QdgTzHC3RFXVM
	3l+m7Dij/s+EnxK9erhPuXK5VOBFY2XrP2DqqnCE5WX3M3E/O5UAa0Qe61e9VulOA1oiYMmWtr7
	LVmqRSsn119TasREkR/TtAJ9WXi/QnQQjA2rpLCquZb9AyvrK3kO57k/yBP405aKXT4x+L0hsZf
	F+3lUqJd2zcU/dKhr0Xowtuf3xxlXVdrFva0DEcu1LtUPHaXwFuDmVkhQGiQeBCL+kI/6QLApkb
	oIr6Jol9v5wQrr/Wx6CN+pVBTzjsN0OOGJmU+Hnm1cm3RI=
X-Received: by 2002:a05:6000:268a:b0:43b:4ec7:f90c with SMTP id ffacd0b85a97d-43b9ea4a504mr5718573f8f.26.1774633369466;
        Fri, 27 Mar 2026 10:42:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:cad3:5596:28d0:27e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm15965933f8f.1.2026.03.27.10.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:42:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
Date: Fri, 27 Mar 2026 17:42:43 +0000
Message-ID: <20260327174245.3947213-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for the xSPI Interface on Renesas
RZ/T2H and RZ/N2H SoCs. The xSPI IP on these SoCs is closely related
to that found on the RZ/G3E SoC with some register bit differences
in the configuration registers.

The RZ/T2H variant has a reduced clock configuration, requiring only
the AHB and SPI clocks (without the AXI and spix2 clocks). It also
requires only the hardware reset (hresetn), without the AXI reset
(aresetn).

The RZ/N2H variant is compatible with RZ/T2H and uses the same clock
and reset configuration.

Update the binding schema to accommodate these differences using
conditional constraints based on the compatible string, while
maintaining backward compatibility with existing RZ/G3E and RZ/V2H(P)
implementations.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v1->v2:
- Add RB tag from Rob for the dt-bindings patch.
---
 .../renesas,rzg3e-xspi.yaml                   | 60 +++++++++++++++----
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
index 7a84f5bb7284..bf50d90051c9 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
@@ -24,7 +24,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: renesas,r9a09g047-xspi  # RZ/G3E
+      - enum:
+          - renesas,r9a09g047-xspi  # RZ/G3E
+          - renesas,r9a09g077-xspi  # RZ/T2H
 
       - items:
           - enum:
@@ -32,6 +34,10 @@ properties:
               - renesas,r9a09g057-xspi  # RZ/V2H(P)
           - const: renesas,r9a09g047-xspi
 
+      - items:
+          - const: renesas,r9a09g087-xspi # RZ/N2H
+          - const: renesas,r9a09g077-xspi
+
   reg:
     items:
       - description: xSPI registers
@@ -53,28 +59,38 @@ properties:
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
@@ -109,6 +125,28 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: renesas,r9a09g077-xspi
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
+    resets-names:
+      minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

