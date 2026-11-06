Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966345;
	b=mu7K+vEzZNHxZ12vmBOv+k2+IlTOD4ct4bhVNK1X/b7ObnOWn8TlAhuxXridbke4rJcP
	 4tkwmEFu4HIqfUnHZh4Omc+WxysBK+jhpaHSytGzZgOi4Tq1qYh0EOVj/Ej8XrJlBjF9d
	 SuuGZJ/t+G3eCU3slWm+KQPu5P0FD7wXsIF9U+Ahn9fCwQELw8ZWSQvk5AlTmr8iBk3yG
	 dBxfuM1fV9mzJ2oisbNRUsyoxm36oKTy1phxFV/GERLgTvqo06sXBA3WOaQhkS4eC1Jhm
	 jAgp0bBGivvmRXKg4bvO2F33WSPGIMVPOq5IeVii8BMsmkNAGBZz2PnwqBes/93XutQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
	b=tASNW6D3L/tWPBLDgpJh7N5gdTr5q3nVzhx5kkfGebxTeyOFx+dnJVVD30r5IAjq5fiK
	 iI2O7bjB6KSd/ZCNntLVfCQKl5iO1eMuWu7hEqunH7SvXpJcmlJiQebLMV3Em0c3CcPvv
	 2nhWYsatTHLwFx9gv2NEHXhxTzFmXOrONBJKW1s4nVyqWGZ//P0LFBMHu72qzHEV+gOV3
	 P/AqoaCrJ57kXrT9dOuR3Sj8FGYdP2/5tSM5Yna6rbuDP6j9zvnNbdJp6dKdHvG7eicOD
	 q5tKFZYL9Wi4ZoD0I1asHdo0koM+/pW1Laivl5fjqylgDaKfWKGWPgcbmNXVa+df71A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1CissSb;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DB1606A330
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24DB1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1CissSb
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so6891225e9.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966342; x=1794571142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=M1CissSb5XkdN4d4gXjJzhs8CcijcmaIadazjVCXV/VO1cx//bipjqrKdrpXvqft9/
         RTI3Dj6+uBuNnkOTRrg/OmHKHqysmIsY+iBahzWpuajZnRQd0H242tvPXDv1j/HzyNJ/
         lSo1UdOdetE7j8/7aiJZvXPQ73hJsmzLURkNLMV2QoKkzrnyMgvlIajgN0OO0+4y9z20
         6L+x/p9TJHe0cD82unvNqCVdxrYNjoyuJS5Z1Z2R7zh94T5bqef4k9mL8fYS5xEfVUVb
         cfjFMYplFA4XU/XXFEjLw5b4aQ1N6D42LbIL4bYS7g50UzA5kAV9Bhg9No1GZkOg5yXl
         Xq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966342; x=1794571142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=JvB8gMb2N/EpP7RERA7gQvTVtYplzG8fO6HcsW6YvBcWtOyBS/vk/D7ojb/7FPigA2
         QfWrM5AM9Wt6WMLN/aw0pnefZlTml5DBwG506Jh1O2SYoJryk2zS7QYovEJQ5Rwf02QM
         zb35JKzkXV3IjS2zi6VbbsZV3+JKKqGSzB1s13+6uWgW/jKjqH+1Eenu2WeffDAw+mGh
         KXRSpRyMMh2yWa4VfkaridUu4eSVnOyFJHN3Oa3ghK7r4Oi8h1iovpVB7u/cGWjUPl96
         WvXB4wvikCQLW/G6I4j60jLntpnBUF2Q0qfXLhFgupe8bIta8D1UggbVXA41jiwAhN7D
         8b3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxcTJeyQDShjkWd+qTwnYKi643kn/IpzEcvcQ9YN+hosmdRsFbx1h49jgom0VcaM00wKmLEMrn5AleY@vger.kernel.org
X-Gm-Message-State: APuU4Z84f7qEHnmrdCd6nDvQsMJwMb/snGqko1jpdavcxJArSkU0qAuw
	yD90Wzr4JZEmkRX5UrXDT0p2TVfrAg9XchZCcpW81x3qR/W/tf+KXwU6
X-Gm-Gg: AYBFou3m2X4ZGienbN9k0vqMyEkxQriPBpUYb6Kp9bz70+7PSBKgX1haxWZCwC9rUiB
	K1ENCxli8coWSKM6erWjMuBqcEXPejFjWz+xRKdSjNcV+z6GsjDSkoavVq+X21Y4dda2m1pS5H5
	TGfFFbP3VSE9XBAJl6d6D3nxExwcubKjQwE/OnOgoJAE7i/c0xclX7UOsHO5/XZky+eE4TlPvAm
	AUk4p+HejM7WDzpEPCHgzGKeIKvOM8eEUmLg0UUQgZupv3FS0DYdEhjydBLW6zMsIck9dnaXwQE
	cnc5nTc5PFtHGq3Z814PlCXh8yv/PnMTZLRZ9gYH45CPYLXlZlj3ruqYMIYJLySBPv25uI9MRZb
	9b26VIRhUeWAdTHZOHqsVaY14uEINGz/b2c/lrawCcExxFtIQijMg9nVQu8mPbjZIRX2ESN/k3i
	eSe4UK0UPpv4Sca5y4FiG3M1T6IJ3gE0LwIvCFn3LMiz7ZqpEKHlVtVkR/wcoB/rzquVH01azBx
	MKhpDisoE9kE69jdUzM/DL/uRjHg9H+pwKkozOTGy75oV8BQ9vinK+0gm07OldfoHqKT+6e8SeM
	AbXkk6nH5JzROuCmk64+TE5T9FKYlFaa2sUogdyFh49/WBT4M/+/GthAVBT7F3R+pFCeeVIpWgn
	zzDALzXrN1Zfj4x3i3tu+70gujC7Wf86Dhw==
X-Received: by 2002:a05:600c:5297:b0:4b4:262b:88a2 with SMTP id 5b1f17b1804b1-4b6dc30ae97mr35618255e9.1.1793966342377;
        Fri, 06 Nov 2026 03:59:02 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:01 -0800 (PST)
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
Subject: [PATCH v11 1/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Fri,  6 Nov 2026 12:58:46 +0100
Message-ID: <20261106115852.189098-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106115852.189098-1-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
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

