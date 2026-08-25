Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA63F327E
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651456; cv=none; b=IAbK65asLQdmnTfcz3HsEtA2R86PDXJxApP6jjJFyUjEHqmmQJV7p8NbDt3mMcGmKG95DeXK/08veFxpTBMAGV1pgiLAsnC7aCGuRo8Lk8apSYS65wNsntQhi85fhlM6ZnJSJynJ3hhuskgJbQWCQozpaLDGLwCioscyhAa7GMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651456; c=relaxed/simple;
	bh=fPsx0SfrTfSAP/j85Sl/Gt76Eker8kHxBzMkDcoroC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+W3Oe4vkFkr+XUvPK7/OwF/yt/YJe6yshSQCio5kTPWZkehgr6rN3Lek0k+8A5hEo8VwA/4uE/yJMKQN/Dm1TGEl+fo5hHi0eiRwTPlNIXFWTLWwT5pCV6bA6JJWT+hTFIbtPdhv209G3aPw+rxaLyYgA9KPYAyGibad+S+Ldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFR6OJvR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFR6OJvR"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1671ec8692so646299966b.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787651453; x=1788256253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJ3p+mVClRMlOVJV/bCuCffvTLJfprkh1BUh6AmAvCI=;
        b=fFR6OJvRBXHeSNwcShnAJ4RViD2s6e4VvSMYYiPf7Wp4our1TbDt4TrNu21Jplj4G1
         tzVPb4yn7KIqd3ztna1Esadke+SxGurXjVJD6JdoieeXeAFr1lj9dkNSWeQyNsT3nGej
         Atsefymdb8qp1esploynJwGdB5+NXcbCsa6hxVj6qxGQ83DTm5+R2kxdUMNVYy0yrp7+
         zaV9yEqXs5ORc1JyuhsnFquVf59lrwUWOFcUiLeQMfRPydB/Hd2GKBRIQoREWObz9igz
         7mRWZuW/2BLTjSTDs0pfOoC6SBZy/ogLRoQKw/4neJnfV6JnbGfbqMfV6h/RmYbG59yE
         BNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651453; x=1788256253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJ3p+mVClRMlOVJV/bCuCffvTLJfprkh1BUh6AmAvCI=;
        b=Qtf5mhatRQakCJUWKuAxRms5I9eXGxeFVnSMDNdhhe9Gh7QoCufRK+syA9G/ZKeuT5
         iSAU+NriM/GYXO7WZ8TvG1F/Oyf5FOx+t/Vm2+cb2V/7xC1v7B3rprFxGAiblOrtUOp9
         2m/yRm9gX2EoQnHrkTUJCdDPzClPusjTTVC4CvjBhFLvMHe67+IXAqyTf998gk2DZoN7
         4naTflawewyjxG0JkTGNEDfsxPTfSBYUPU5NFbg3bH9DWR65RI7UAGvTOmqIkODlPQhZ
         JNUGOj+Qego3OGvxdJGDpmcZQ2IuPgJ7s2EB6JqPTYYSwuRhkSpiMlhudbsppiBYrM6N
         WRrg==
X-Forwarded-Encrypted: i=1; AHgh+RrtlN5apj8kN1cJf8z9p8FstqAH4p0YU2fPTpLwawVKB2NyXUUtRzaZzRKD7Q78p2TX3QIGwUymrugM@vger.kernel.org
X-Gm-Message-State: AFuF++lVcZTaogY5ZTguy2FcetRelwhKkUUnR3k2GcMMr308eBmqkBes
	6wsdq2LtwusKNbiPXF7WyE41BIZ9FK4wEUMnFAEQSoT/Pi9xb5xpl060
X-Gm-Gg: AR+sD11KZPExCBbgtypPylNBa31UJRzLlANuzULNz/bIj0+QAujB824qxhPsZkPZAV0
	c5NW6jQWCLb4Nnsa4y1utmEwimEAlxT4zHCnjOLKMjEtSaUQpnx4SiurLMcIFTV0e3nQ/5iqM2y
	he+vCXdfSnE5DdAsVz0S+tPI1QcaMl4OUFJRGb7+4zyZ5sBfwovC0K9NqM2L1o+Y38V7iq52cfc
	0Dg21jyl4KCJiBQUxLlSJ9qM9Kart7PV0u/fs9S1K/uffsja4STByoJo+XhGwxK0HhediUn2Xv6
	63h+mXMD3qIQYEgWlKI47Um7Io/dP15x0T88mv+c75DO4YZ/xGI6n/eg+Iape3LkkKHTXZEfou/
	GR7a9V0bFXWq6bIEiGF2vrCTiydaOa7i/xpHZleLtxSrQWQEDOPSi7KTpBRaULqyj4Vn7eLJG3h
	voscWoh5c5mBR8zOjPc7q058Vy4a9oQNOMue4hwWrOPyTqxEMlbGGxsAd0jrrGU6LjFC8QCKEVy
	MS+rXadcij6
X-Received: by 2002:a17:907:c008:b0:c24:6505:8f66 with SMTP id a640c23a62f3a-c2491e83843mr2908890966b.13.1787651452698;
        Tue, 25 Aug 2026 02:50:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629929dsm1749320666b.23.2026.08.25.02.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:50:52 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/4] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3L SoC
Date: Tue, 25 Aug 2026 10:50:40 +0100
Message-ID: <20260825095047.9971-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825095047.9971-1-biju.das.jz@bp.renesas.com>
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Extend the existing device tree bindings for Renesas RZ/G3S PCIe
controller to include support for the RZ/G3L (renesas,r9a08g046-pcie)
PCIe controller. The RZ/G3L PCIe controller is similar to RZ/G3S but has
some key differences:
     - Has 3 clocks compared to 2 on other SoCs.
     - Has a different set of reset signals

Add device tree bindings for renesas,r9a08g046-pcie compatible IPs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
index 09d78bd1a577..911b1976bf53 100644
--- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
@@ -13,7 +13,7 @@ description: |
   PCIe host controller found in Renesas RZ/G3S and similar SoCs complies
   with PCIe Base Specification 4.0 and supports different link speeds
   depending on the SoC variant:
-    - Gen2 (5 GT/s): RZ/G3S
+    - Gen2 (5 GT/s): RZ/G3{L,S}
     - Gen3 (8 GT/s): RZ/G3E, RZ/V2H(P), RZ/V2N
 
 properties:
@@ -21,6 +21,7 @@ properties:
     oneOf:
       - enum:
           - renesas,r9a08g045-pcie # RZ/G3S
+          - renesas,r9a08g046-pcie # RZ/G3L
           - renesas,r9a09g047-pcie # RZ/G3E
           - renesas,r9a09g057-pcie # RZ/V2H(P)
       - items:
@@ -87,14 +88,18 @@ properties:
   interrupt-controller: true
 
   clocks:
+    minItems: 2
     items:
       - description: System clock
       - description: PM control clock or clock for L1 substate handling
+      - description: PM control clock or clock for L1 substate handling
 
   clock-names:
+    minItems: 2
     items:
       - const: aclk
       - enum: [pm, pmu]
+      - enum: [pm, pmu]
 
   resets:
     minItems: 1
@@ -215,6 +220,8 @@ allOf:
           maxItems: 16
         interrupt-names:
           maxItems: 16
+        clocks:
+          maxItems: 2
         clock-names:
           items:
             - const: aclk
@@ -223,6 +230,28 @@ allOf:
           minItems: 7
         reset-names:
           minItems: 7
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-pcie
+    then:
+      properties:
+        interrupts:
+          maxItems: 16
+        interrupt-names:
+          maxItems: 16
+        clocks:
+          minItems: 3
+        clock-names:
+          items:
+            - const: aclk
+            - const: pm
+            - const: pmu
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
   - if:
       properties:
         compatible:
@@ -236,6 +265,8 @@ allOf:
           minItems: 23
         interrupt-names:
           minItems: 23
+        clocks:
+          maxItems: 2
         clock-names:
           items:
             - const: aclk
-- 
2.43.0

