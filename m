Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF40F309EF4;
	Sun, 12 Apr 2026 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013534; cv=none; b=Si5bTRZEM8KoGhcc3Q+olFkoflZsmCUmAs7woxgDXk5j+DJmRnPM1tTaFOxm2j7rYJbep+Qo6bMwpmnZ3d68zXtoulOZsLxXL3ly7FN0Ik/91kV9GsKI8eMjEIo5mR5bIMjyKZJSaRczg98u62cDJF7185y+KlRc6m+CFn1HJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013534; c=relaxed/simple;
	bh=nINj9FtXsbv9p+uMbfKSjZ3iQpZizEUU7lJBoujxA+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=SVeszlxrVXhGbLBAhJqu1SmuAJ+E3ttFhm4LjT3B4eL/QC3XPn7wTkThd5BHyjXtNZk2+oHtxa1gcX7O6b1OrjG7Gfl4NQgA4yzv8CKN+Swt6dG2vtepsei/6FkJ1VsnQKe8Q2MDvS6EcuePddgP9U5sHDseH5ENaQSEOW7QPts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8wwOTJh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8wwOTJh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028C1C19424;
	Sun, 12 Apr 2026 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776013534;
	bh=nINj9FtXsbv9p+uMbfKSjZ3iQpZizEUU7lJBoujxA+4=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=c8wwOTJhboMXKadw/Dp9XcvEuKRuZ740YI5Q+6FDr24fUDfVtgFK0DJYVBoUQEm4a
	 ID10WPdZ3CzwaXVIyrTiWcqFNqakFlZtnc9nf6NQ8QBVz8dUebMk72CbbT3Wvj5f1+
	 SvwKGlLfJbDC7eDXPfEZSLW4Rz4yMwvOy9KGqdAFp7ovIUbNCtE49LxGg7uLLte9RB
	 nF34OnUMXT8i2hVadBqswaRkMR1NgicMdlx5jKe4MstX8w0uUpyZWWA+cdjYd6iDj9
	 AJJu+jEPLfIkl1pwJ/h+aomzsFRnmmjylggSYUYJ3hIriIg/iXct9gLdnSBkWwQj+N
	 rsrcKC0yWz4Iw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 12 Apr 2026 18:04:37 +0100
Subject: [PATCH 1/5] dt-bindings: interrupt-controller: Add support for
 secure donated SGIs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-ffa_ns_sgi_gicv3-v1-1-af61243eb405@kernel.org>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
In-Reply-To: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.0

In GICv3, SGI security is defined by interrupt grouping and configuration
rather than by SGI number alone. Linux conventionally reserves SGIs 0-7
for non-secure internal kernel IPIs, while higher SGIs is assumed to be
owned/stolen by the Secure world unless explicitly made available.

Document secure donated SGI interrupt specifiers for the GICv3 binding.
It describes "arm,secure-donated-ns-sgi-ranges" for SGIs donated by the
secure world to non-secure software. It excludes SGIs 0-7, which are
already used by the kernel for internal IPI purposes.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 .../bindings/interrupt-controller/arm,gic-v3.yaml  | 27 +++++++++++++++++++++-
 include/dt-bindings/interrupt-controller/arm-gic.h |  1 +
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index bfd30aae682b..664727d071c9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -45,17 +45,24 @@ description: |
 
       The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
       interrupts, 2 for interrupts in the Extended SPI range, 3 for the
-      Extended PPI range. Other values are reserved for future use.
+      Extended PPI range, and 4 for SGI interrupts. Other values are
+      reserved for future use.
 
       The 2nd cell contains the interrupt number for the interrupt type.
       SPI interrupts are in the range [0-987]. PPI interrupts are in the
       range [0-15]. Extended SPI interrupts are in the range [0-1023].
       Extended PPI interrupts are in the range [0-127].
 
+      SGI interrupts are in the range [8-15] which overlaps with the SGIs
+      assigned to/reserved for the secure world but donated to the non
+      secure world to use. Refer "arm,secure-donated-ns-sgi-ranges" for
+      more details.
+
       The 3rd cell is the flags, encoded as follows:
       bits[3:0] trigger type and level flags.
         1 = edge triggered
         4 = level triggered
+      SGIs are edge triggered and must be described as such.
 
       The 4th cell is a phandle to a node describing a set of CPUs this
       interrupt is affine to. The interrupt must be a PPI, and the node
@@ -136,6 +143,24 @@ description: |
       - $ref: /schemas/types.yaml#/definitions/uint32
       - $ref: /schemas/types.yaml#/definitions/uint64
 
+  arm,secure-donated-ns-sgi-ranges:
+    description:
+      A list of pairs <sgi span>, where "sgi" is the first SGI INTID of a
+      range donated by the secure side to non-secure software, and "span" is
+      the size of that range. Multiple ranges can be provided.
+
+      SGIs described by interrupt specifiers with type 4 (SGI) must fall
+      within one of these ranges. SGIs(0-7) reserved by non-secure world
+      for internal IPIs must not be listed here. "sgi" must be in the
+      range [8-15], "span" must be in the range [1-8], and the range must
+      not extend past SGI 15.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      - minimum: 8
+        maximum: 15
+      - minimum: 1
+        maximum: 8
+
   ppi-partitions:
     type: object
     additionalProperties: false
diff --git a/include/dt-bindings/interrupt-controller/arm-gic.h b/include/dt-bindings/interrupt-controller/arm-gic.h
index 887f53363e8a..52c2f3f090c5 100644
--- a/include/dt-bindings/interrupt-controller/arm-gic.h
+++ b/include/dt-bindings/interrupt-controller/arm-gic.h
@@ -14,6 +14,7 @@
 #define GIC_PPI 1
 #define GIC_ESPI 2
 #define GIC_EPPI 3
+#define GIC_SGI 4
 
 /*
  * Interrupt specifier cell 2.

-- 
2.43.0

