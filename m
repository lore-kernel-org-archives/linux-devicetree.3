Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1BF415F31
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341190; cv=none; b=O/SeXJMAtT4If/+FIg/yc9zECYybc8vg3zZAYq8DTumRc+kDfSHqhBU0oBV/Zj5KvBijphKrIoJazjzXKqyaM+cha6BtpQ+2gqS7xOqS/fPfCzVvwieCyw7F+dZTlNKKAcMXHEw2u3dN54IXV7u59Uco9JQJ6/6194DpMVxEIes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341190; c=relaxed/simple;
	bh=sQgfnd23VGdSK0mFthNBFhUgPoI3OOPXcxa4p+50E8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUjATPbd43yzGXAdvMt2EML5aXK5EhOCeH9MFVxgVCnzgWQh3QrDCrFV1TTOxs2ovIPb4W0/+1miUkRlzMAmF8BpusiNND2w+BvAlNgYyIwE3o15w9MVwjdpeIjwjwxSYZna5GPBGg3rAw2G04+AQQIPkYZcWFY5djJeEU+zFX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZQ1ejT0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZQ1ejT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136CC1F00A3D;
	Wed,  2 Sep 2026 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341188;
	bh=MDGFl4qA8hcrqIE4Qo7wyZIkox36iPq9ZdIRBSD7yrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jZQ1ejT0cMuSR8mvfh6lGpxbo9Jhe3PmIBl/DSst8Bc6UWVElLNawFkh4h/U8YeUI
	 aCieoaQldHKxDtPhCYrj32lHCMalTkxzkXhpVwsAl1BcjO6szTPNh1juk28TtkoDSD
	 tvpeeTDFtleMnSgoDse975ubwWSoV6wCatNSL7WjCfooX3KIq+J3L4PmD7naxMtusO
	 rWEeqxsZnKPRg0fnymLyT5FFyoQnboCSgHbFJ/1LuUhhbzxmYniQwKvj/jOXJvQJEe
	 J/ARLWwGVC2e1n2DFW5KfLfQkkwsdiQ2E34t9b1MjkW4HmXAl3IB3dej1i6RpVrGF6
	 j/vOURa2HW5QA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	rounakdas2025@gmail.com
Subject: [RFC PATCH 1/2] dt-bindings: edac: altera: agilex5: document new edac support
Date: Wed,  2 Sep 2026 04:25:50 -0500
Message-ID: <20260902092551.488203-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20260902092551.488203-1-dinguyen@kernel.org>
References: <20260902092551.488203-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Agilex5 EDAC module supports ECC on a few additional peripherals. Along
with support for ocram, ethernet and USB, the Agilex5 EDAC adds support for
SDM QSPI, CRAM SEU and IO96B.

The Agilex5 EDAC also exposes up to 7 named interrupts on the manager
node. global_sbe and global_dbe are aggregate single/double-bit error
interrupts that fan-out through the manager's IRQ domain to the child
peripheral ECCs. The remaining named interrupts are routed directly from
dedicated controllers (IO96B memory controllers and Secure Device Manager)
to the GIC.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: add if/then to enforce maxItem of 2 interrupts for older platforms,
    and 7 for Agilex5
    add if/then to enforce interrupt-names as required property for
    Agilex5
    enum altr,socfpga-s10-ecc-manager and altr,socfpga-agilex5-ecc-manager
---
 .../edac/altr,socfpga-ecc-manager.yaml        | 85 +++++++++++++------
 1 file changed, 61 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
index 136e8fccd429a..16940b49471cd 100644
--- a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
+++ b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
@@ -20,7 +20,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: altr,socfpga-s10-ecc-manager
+          - enum:
+              - altr,socfpga-s10-ecc-manager
+              - altr,socfpga-agilex5-ecc-manager
           - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-ecc-manager
@@ -33,7 +35,25 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 2
+    items:
+      - description: Global single-bit error
+      - description: Global double-bit error
+      - description: IO96B0 DRAM controller error
+      - description: IO96B1 DRAM controller error
+      - description: SDM QSPI single-bit error
+      - description: SDM QSPI double-bit error
+      - description: SDM single-event
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: global_sbe
+      - const: global_dbe
+      - const: io96b0
+      - const: io96b1
+      - const: sdm_qspi_sbe
+      - const: sdm_qspi_dbe
+      - const: sdm_seu
 
   interrupt-controller: true
 
@@ -235,28 +255,45 @@ patternProperties:
       - interrupts
       - altr,ecc-parent
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: altr,socfpga-ecc-manager
-then:
-  required:
-    - compatible
-    - "#address-cells"
-    - "#size-cells"
-    - ranges
-
-else:
-  required:
-    - compatible
-    - "#address-cells"
-    - "#size-cells"
-    - interrupts
-    - interrupt-controller
-    - "#interrupt-cells"
-    - ranges
-    - altr,sysmgr-syscon
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: altr,socfpga-ecc-manager
+    then:
+      required:
+        - compatible
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+
+    else:
+      required:
+        - compatible
+        - "#address-cells"
+        - "#size-cells"
+        - interrupts
+        - interrupt-controller
+        - "#interrupt-cells"
+        - ranges
+        - altr,sysmgr-syscon
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: altr,socfpga-agilex5-ecc-manager
+    then:
+      properties:
+        interrupts:
+          maxItems: 7
+      required:
+        - interrupt-names
+    else:
+      properties:
+        interrupts:
+          maxItems: 2
 
 additionalProperties: false
 
-- 
2.42.0.411.g813d9a9188

