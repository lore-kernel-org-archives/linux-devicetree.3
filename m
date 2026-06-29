Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AA6361DBF
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733704; cv=none; b=oJIntxjHbDoZ37NeaUPR67uWK2FZ+Xjyd+HgUDJxESOhcLl2hy5zAlsS5iflIcvb+hhC07+E6zFo5Cnp+FBVXRJt1xie9SgvHiXyMS2+KPINDAmuTm6K/rIFuX+SoO+qWmE4E853qj4BJHb0d/nOHel5JeAMC+XsLDSuCVHOY+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733704; c=relaxed/simple;
	bh=OXXhp2CoI1BTbdEXgATRNUY9YSds4JwWiCwC0lfJe74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iM52MgjPso+NVOv1Oz+k2voGBgHkvDPVbOMUgol27aQzqK8fgFSfj3NGL/ztePg8kK+C0YkxhnZsd1NUTNtagGcsjuFrvTuMcbypCj7H1COMlQgW4lCvLg7rVozfvbeDRmQ+uywX8jOz9ZO6E4LAv57lCZDOkTnwjh9BwZYplXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtTY9Pyf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtTY9Pyf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC0A1F000E9;
	Mon, 29 Jun 2026 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782733703;
	bh=VZ2cAThow40mgVHYKkc++vMUTDUy9udfITVEXZ1Pvpg=;
	h=From:To:Cc:Subject:Date;
	b=LtTY9Pyf3QpZiK5jIb3z/8kcd+v0pcv2cr3nwmHdyVlr+0NUwCgOYXebEQPqr2mS2
	 fmXwJxTu4aYQ7Dn0zzs5XTnO8ZZ6DoaNV/xr5+XQ/aT3Gth3hQxQyTdpzq7p22IxMN
	 dTMAk3M4Q7P2amexlltcF1tq8gZmmfziT/4buif30Bbc3oZ7s8CGrZhPUfNjatA/u0
	 n5AeOdjhM40arfZYc7adlnNSvvXtNa6oDxpmNnfE8L0eO8PMmdLG9wqXwEHUVV1F8H
	 qmHTHo0I+1VmOpVpXDN2v8F2Nb8qasQl5S3PeAc172dZKMpCZ8SskNycBiTTDfrqzY
	 FFXySDgHthwWQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	muhammad.nazim.amirul.nazle.asmade@altera.com
Subject: [PATCHv2 1/2] dt-bindings: net: altr,socfpga-stmmac: add more interrupts for Agilex5
Date: Mon, 29 Jun 2026 06:48:17 -0500
Message-ID: <20260629114818.1746410-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stmmac hardware on Agilex5 supports 8 TX/RX queue pairs and is
dma-coherent. Update the schema to handle the hardware differences
between SoC variants.

Also make 'interrupts' and 'interrupt-names' as required properties.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: Set the top level interrupts to include the widest contraints(1-17)
    Just have 1 list of all interrupt-names
    Update commit message to include 'interrupts' and 'interrupt-names'
    as required properties
    Change minItems 1 to maxItems 1 for non agilex5 variants
    Add same constraint for interrupt-names
---
 .../bindings/net/altr,socfpga-stmmac.yaml     | 46 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index fc445ad5a1f1..63084f762373 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -63,11 +63,29 @@ properties:
       - const: ptp_ref
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 17
 
   interrupt-names:
+    minItems: 1
     items:
       - const: macirq
+      - const: tx-queue-0
+      - const: tx-queue-1
+      - const: tx-queue-2
+      - const: tx-queue-3
+      - const: tx-queue-4
+      - const: tx-queue-5
+      - const: tx-queue-6
+      - const: tx-queue-7
+      - const: rx-queue-0
+      - const: rx-queue-1
+      - const: rx-queue-2
+      - const: rx-queue-3
+      - const: rx-queue-4
+      - const: rx-queue-5
+      - const: rx-queue-6
+      - const: rx-queue-7
 
   iommus:
     minItems: 1
@@ -149,10 +167,36 @@ required:
   - clocks
   - clock-names
   - altr,sysmgr-syscon
+  - interrupts
+  - interrupt-names
 
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: altr,socfpga-stmmac-agilex5
+    then:
+      properties:
+        interrupts:
+          minItems: 17
+
+        interrupt-names:
+          minItems: 17
+
+        dma-coherent: true
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
+        interrupt-names:
+          maxItems: 1
+
+        dma-coherent: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.42.0.411.g813d9a9188

