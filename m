Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B183D6CD9
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 22:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787177714; cv=none; b=ONj1ld4Y3tS9pZkpDtt5uuLVHtq6E+8863v2hgkfthvbYCSi3U7F5VDsLkggr3R2ZZabFPczXzFuEQVjzydkG2B2t9CPwoqbjBIB1RaVBZOuFLpaDVAo+5GpCgO4K/gnADwiqt2+lOkro577Za4yd/xKc7AsLyv6vcmIzuVsCVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787177714; c=relaxed/simple;
	bh=7txVex1YKsBI07yDFKbwJTfHfLkjP2vFWNMOmdjl6zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVK8wJA17+X/ktFqpptFNHilnHli/IM9rUgyTL1aFq9imS83KDqon5nvfQSon4ui0wLmCj2a55aqidSH/dGChiKFuXdRyj9SMQQmaWB4fmUsCW+if0A2JkgW4v6xDTo89swJ3N6wPDZNmCbVmIs2oJ9KLDWGVnrktcMa2Wr46Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puGV6GVT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puGV6GVT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47362928f65so1443318f8f.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787177711; x=1787782511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sA0r2GQyCCtQoQ8S7Fp2dZh+KlreJQPZUV/cexVXnbE=;
        b=puGV6GVTQ5mLmLS4gLlJ2aT61et8OSbzH8kYIJLH+jZuDD/IU1BWzzbNcaSJjVpjzK
         w3X4V6WE+4RywcSDUgCkgwLAoRKWrgo9++kl8Pd7yzI8qI4G5/TxTG1iSrYRNhiRubBm
         K8py9Z9bBjplNn+0r8ySX9PYCWvkrAFQqRU7bVeixLor9eiYcMu8DJy+m48vopDkBw/N
         QhGp/H3Nr2CC9yhIv6nUsTL6edk2Lavk7lQhQFOWhcMx4o3Y0+8imoqPbige3KpgNSXC
         TMg9t760MZMQQSpfN3cQoO+1FcU5KLenkk+ujFigTe7hAsM6q+lHj/MT9+TCtAUPOilX
         FN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787177711; x=1787782511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sA0r2GQyCCtQoQ8S7Fp2dZh+KlreJQPZUV/cexVXnbE=;
        b=FHCNRIKHqorCAfDIK0Z6dx3fh3uTC73sA2gXS4y1xOhO5XHwqML/GIDnju09+k9fk3
         aLX/KeDR3Q/gGY+S/1GtTaAw25f3GlCP98uD4rQ/O5KSwhmJRZ5Wg69vgys4NvyBLK3/
         7siggy9MfAm2ABZk6MU3GeOsvsx6FM8eBXBXm6eRh5rUDP8/Fr3fEZtxHkK7kprczpcM
         nPncxp68aSUjD3D0PROSzM9dp0ICP6D7bymQGjUtg9grXow+QQoScUX/Xdp7rNRV2kwu
         8a5KLLmKBeGP78ArHfvhX61cz2ZyCMrg43P/bw7y5xWrAclATbrXP7OIYITdUFaOUS94
         2s5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpCKX4oD51bwffdAnvRVK+RTPVRO7zP3ekn7QTF4kAiK1f1nm9L+Wa7SEudz7KG/UTJilgZIys4OSjO@vger.kernel.org
X-Gm-Message-State: AFuF++ljtrCrsFNVUPsnLLLF0gNMlKH+OZn/j0y5BlvArcyJHcWT/AsY
	QH2mUC0BXO6HdLaITLzueX0Bw/6hk6dO4KtLlgEgzQEVhSUz4PVyNn2D
X-Gm-Gg: AR+sD10Ma+3UHk7VS2qkpahzh9n7wWm7RKjaIstOwOp5EjKGphh0NfPwXJi7b6VtkE/
	c4KMErhYZc6aQrf7WFJ2fpeE7bkZ9mpLILeHejz/V4XDBu7maAwzKbxFWUmvsenUfRduVQxyxsQ
	pnDR4hvLzTT6r0pAuR4GASVW+ijOMtEwyOPALheLmjMDN8mbdebE4fcG00acSO90BzWJ7h5AvFG
	8mBbV9F6U4WFV8GiWESRVB8m1Y76Dj34dlBcWo87Vq4xQvS8adrksOCU3jz/KPPabuky91+6gNQ
	3tmjT9WkKY1JmxRbhJoLkldS4KW8xKz4PJEBteczIfD1z7xOrHexHbvQ3zd3P2iQtBK3fe4Ngr/
	nU2uAvQN4WF/+121cngcffwR1yI9NAl8arpG8/wmbfG3d0EaKzPlzlbX18WV97yo1PsgxZzfv+i
	wMXqH2yMfpXit5wRiBDR8WD5Ku5v1X5KdDZZ6QcgwvY2aHeOZPFMPHwlVH09PVUrUhaUBO45ToS
	VCw6AJy5AjJlNxVlNu2vPAmYZSHrQ8yft5mVkhYedfvihnk6Uki67Q=
X-Received: by 2002:a05:6000:480e:b0:481:5edd:1b6c with SMTP id ffacd0b85a97d-482b1e976bbmr15302612f8f.7.1787177710505;
        Wed, 19 Aug 2026 15:15:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-7-219.pool21345.interbusiness.it. [213.45.7.219])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482b14c46f2sm9732950f8f.29.2026.08.19.15.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:15:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v6 1/3] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Thu, 20 Aug 2026 00:14:54 +0200
Message-ID: <20260819221458.30040-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819221458.30040-1-ansuelsmth@gmail.com>
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the "airoha,chip-scu".

Add additional binding for additional clock and reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 20 ++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..edecc635807b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -30,6 +30,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,an7583-scu
           - airoha,en7523-scu
           - airoha,en7581-scu
           - econet,en751221-scu
@@ -50,12 +51,30 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  airoha,chip-scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Chip SCU providing the registers required
+      for configuring the PCIe related clocks and resets.
+
 required:
   - compatible
   - reg
   - '#clock-cells'
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-scu
+
+    then:
+      required:
+        - airoha,chip-scu
+
+    else:
+      properties:
+        airoha,chip-scu: false
+
   - if:
       properties:
         compatible:
@@ -69,6 +88,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - airoha,an7583-scu
             - airoha,en7581-scu
             - econet,en751221-scu
     then:
diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index edfa64045f52..0fbbcb7b1b25 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -14,4 +14,7 @@
 
 #define EN7581_CLK_EMMC		8
 
+#define AN7583_CLK_MDIO0	9
+#define AN7583_CLK_MDIO1	10
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
diff --git a/include/dt-bindings/reset/airoha,an7583-reset.h b/include/dt-bindings/reset/airoha,an7583-reset.h
new file mode 100644
index 000000000000..410e19802cf7
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,an7583-reset.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+
+/* RST_CTRL2 */
+#define AN7583_XPON_PHY_RST		 0
+#define AN7583_GPON_OLT_RST		 1
+#define AN7583_CPU_TIMER2_RST		 2
+#define AN7583_HSUART_RST		 3
+#define AN7583_UART4_RST		 4
+#define AN7583_UART5_RST		 5
+#define AN7583_I2C2_RST			 6
+#define AN7583_XSI_MAC_RST		 7
+#define AN7583_XSI_PHY_RST		 8
+#define AN7583_NPU_RST			 9
+#define AN7583_TRNG_MSTART_RST		10
+#define AN7583_DUAL_HSI0_RST		11
+#define AN7583_DUAL_HSI1_RST		12
+#define AN7583_DUAL_HSI0_MAC_RST	13
+#define AN7583_DUAL_HSI1_MAC_RST	14
+#define AN7583_XPON_XFI_RST             15
+#define AN7583_WDMA_RST			16
+#define AN7583_WOE0_RST			17
+#define AN7583_HSDMA_RST		18
+#define AN7583_TDMA_RST			19
+#define AN7583_EMMC_RST			20
+#define AN7583_SOE_RST			21
+#define AN7583_XFP_MAC_RST		22
+#define AN7583_MDIO0_RST		23
+#define AN7583_MDIO1_RST		24
+/* RST_CTRL1 */
+#define AN7583_PCM1_ZSI_ISI_RST		25
+#define AN7583_FE_PDMA_RST		26
+#define AN7583_FE_QDMA_RST		27
+#define AN7583_PCM_SPIWP_RST		28
+#define AN7583_CRYPTO_RST		29
+#define AN7583_TIMER_RST		30
+#define AN7583_PCM1_RST			31
+#define AN7583_UART_RST			32
+#define AN7583_GPIO_RST			33
+#define AN7583_GDMA_RST			34
+#define AN7583_I2C_MASTER_RST		35
+#define AN7583_PCM2_ZSI_ISI_RST		36
+#define AN7583_SFC_RST			37
+#define AN7583_UART2_RST		38
+#define AN7583_GDMP_RST			39
+#define AN7583_FE_RST			40
+#define AN7583_USB_HOST_P0_RST		41
+#define AN7583_GSW_RST			42
+#define AN7583_SFC2_PCM_RST		43
+#define AN7583_PCIE0_RST		44
+#define AN7583_PCIE1_RST		45
+#define AN7583_CPU_TIMER_RST		46
+#define AN7583_PCIE_HB_RST		47
+#define AN7583_XPON_MAC_RST		48
+/* RST_PCIC */
+#define AN7583_PCIC_PERSTOUT0_RST	49
+#define AN7583_PCIC_PERSTOUT1_RST	50
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_ */
-- 
2.53.0

