Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269289;
	b=ypfGhn4g5yXPO6RtSIY4KldUOnAMBsBlYdgliFlTZ9WKtlXo/4yJTqEHub6ZohYN6Plx
	 3x85qPMVMPZwOh0EAQZ1qjkOdJs7P80yk/OUtaSEBe6cOG2l4/yK1oVzjBtSkhGBMneE1
	 Rpwm2iXPLPxt0Q55vNhCHb8d8cKOavPxEmNPPvCgkyWe7TYEr6q1u5KO99QMhB3p3izph
	 GhaxCjav6GCE/ZKuJTB6w7MOoCqUlTAeR//KNhiY5xTIeGcodDcCmvfaEqHJA1fU+PiLu
	 Ef2xa7Rk7AEUtaU7XKnyqPI8KeK+Forrk1Ypd4N7k1yKJ/FgQZ7/yvVu25KHkZX+87w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
	b=T7/k7ivFBachYYjAcYIVuaGXwlEtVFkY0K8QWaNfslTzdYBHUfTCYsSu9VF5kFPnrKHx
	 mLYiiXHRx9Fh8MuCOkM4CBQPuegPjzmLtHqGD98kDkk5PoX2y+9Eo38odj90ZOPhoSZVF
	 eBc9NiuUiacm1xqzQPnD9N2QLS76Wta4Q19Y/B7hhMb8fgy8B9n4qI5zCUAFK7HAHMSko
	 843MVe5s50Xx+SPIR8Vbx6trTWQtVNEqxiRL6pFSBZI2gCy7rz52GbVXE/FVIUy0eZ3dF
	 keMiIyfZzG+yVuHHbWlTGtthwfF8iHP47kO+/AfNcdGEjy4VssSUISssgwtV1Ains2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR93sN0J;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0AF60A2608
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0AF60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR93sN0J
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so13749645e9.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 16:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269287; x=1794874087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=TR93sN0JjFV2ftO9VMO3mmKie2OgvCyhqtAkn5jH92BrIESPpmCbBKlTf/KudKxMoc
         +dhLdg3CWXQvUfsg3Ax/YBy2cOXyRjPfOsuJmuq4Ipi8zgvynxDmFFg5LK0tbmtEM9K0
         NoaZqZJ4dq3dEyIRI8dvU0crh+QL8kPCTCJVWXjbHRBLeqbcAsUpRBj33F4MvVyS7kFq
         /s1M9Zvh3DhAeQi6pceWe5QV3IlyfcAxuip4wLDbCkfLck/aUBIm+oOAEKmauS5C+qdj
         IcJQhjU91XRCmczDEeadT2AlsDmaBsp9/8tX+V7dQAslaoo08PxSo+k18nFHs1kj61PV
         zGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269287; x=1794874087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=Ktlov726B30/R6+sS5DDehINvt6e/sW4rpsYGqxBVHEGIXYCN8OE9wOGMSezxu+sCj
         ER8X7ts8V6YLOwGZYkIwjiEIuSRzU+WTOdiV39b84fP8O4+mt3w/0W/XtBYxlG1R6p/+
         4oqMFV6F/C63bHSzWpWqhnua55rszxZjK6DWwxXWPQmuHeElhIMScXfkzRxS9X8ZxzOv
         EljeAdFLNFcMf9xzBVmZvHJ7hRIi9RtXqMaklVQTS0R42BlvlG1IXVMMXr4SWa0i6sfZ
         c+EZAgxdCwg/Vu1YTl6WHc75gDkeyAicjpwquV0uXMNKVflmqM5f34f8a84CO2fE3u0D
         N2XA==
X-Forwarded-Encrypted: i=1; AL+hErGnSz58xHxY5xbY8A8P61llOKKWfSFSESSZASHKUele4x3A8TFKHFes9Y3yVXcC35BPGkFzVJc0q+Iu@vger.kernel.org
X-Gm-Message-State: APuU4Z8oJ4bETYnxeUWMZoYOxsK4dcr5CgiQuNd9tdhkEjOB8DUipx81
	3tIHQ6WKBF9YYo1zv8QluuFF8SoBklTAlg7zeWC+a5DPtJp5Ua66qMmA
X-Gm-Gg: AYBFou29Mk7DOVNRJXdV6dJ++FgIIQwSV1pHv0uvEMGgOH6rZThctncdS7JEOWT0Ciy
	nl9xpSMvTkPef+KDTmJLUA9o47ZTvN6aFAV2n8wIGgE/joaH0AnKpbDgprBxC1DGD8GKSDEcwA4
	S2BU8PbPk7/yzwf6N8h0ULsE998cUkv/0jMw9sxOG7VJAymB89eYCUpw2nxyvxnS31zG845A4Be
	OqvQrydQ118ufxWMziZHhNaKaNCVKr33eY0Pgz5Olp0PvjyPfpfMO9yG/Nu4vDFy4GBaLPMs93q
	A1Bf3ZXL7wI/mzPFdExDxA5M49nsE0EBOmHLfmy6soIclY4p3EpPbsrcVrf+54RKERYFeYf/2EQ
	5osErgcnwU5oN7pY+Rt77QTvZbbp5mdkHMZwAsDNxkeiyxHklswohaevnqoe4Inz18dgLR1ptqM
	N4m2Z25OYFag9dLsxGS39uoI22gyHPxHMlfXbiSZEhf/EDt2WFp6OSdaz1uK85ZP9SkTXUr5fbS
	t6zGCCOHupzilEcpMzNRXpF6g1RXCfaFE9UcvSK0Ox6U68HomhWGi+gxAbA3wFy6q16A+tbSf62
	+wiKwHdsJy+/ZnG8Zp/Y7O3SKdFB0h0+Rd8BdoNQo+LeFo2mONxkgfNlAjMgdWEwEsmgICVpK3R
	Oe9cF0ijgqDVC7bVyDBmStCritmjxIZ05HqABVoLyT/hL5hybrg==
X-Received: by 2002:a05:600c:55c1:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4ba01db744bmr16387325e9.11.1794269287318;
        Mon, 09 Nov 2026 16:08:07 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:06 -0800 (PST)
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
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v12 1/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Tue, 10 Nov 2026 01:07:46 +0100
Message-ID: <20261110000753.508-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110000753.508-1-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the "airoha,chip-scu".

The register for clock and reset for normal system and PCIe are scattered
between the "SCU" and "chip SCU" registers (they are 2 different register
block, the name is taken from the programming guide)

- Chip SCU provide register access to some clk gate and clk rate
- SCU provide register for reset, PCIe clock, other clock gate and PHY
  SERDES.

Upcoming and current airoha clock driver all follow this pattern of
declaring one of the 2 register and use a sysconf for the other as the 2
register block are tighlty coupled.

EN7581 internally handle the syscon with a direct reference by the use of
syscon_regmap_lookup_by_compatible while AN7583 wants to make this
explicit in DT with the new "airoha,chip-scu" phandle.

Similar to EN7581, also AN7583 permit the selection of the serdes line.

Add additional binding for additional clock and reset lines.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 25 +++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..05cd20ce3ab9 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -31,6 +31,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,an7583-scu
           - airoha,en7523-scu
           - airoha,en7581-scu
           - econet,en751221-scu
@@ -57,12 +58,36 @@ properties:
       available serdes port.
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
+      properties:
+        reg:
+          maxItems: 1
+
+      required:
+        - airoha,chip-scu
+        - '#reset-cells'
+        - '#phy-cells'
+
+    else:
+      properties:
+        airoha,chip-scu: false
+
   - if:
       properties:
         compatible:
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
index 000000000000..433a5c6180bf
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
+#define AN7583_XPON_XFI_RST		15
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
2.55.0

