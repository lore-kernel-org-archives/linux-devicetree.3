Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B459A38B14F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261090; cv=none; b=HRnSEz6rj6HPVvEmC/9vga7Ndhuav0Zi8sO1HeIYZwdBTDIeEGc1LufnGmc8rAoUJNOdr2WWHPZNmScgXoc2jMgTxoAPekfr5NVe3q84Nztq4JCBej5aXoE40v3DZJWdlzA7dI8Xk7cnJZPuRj6CZINMtKnJfBMS8MAmqYKZYrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261090; c=relaxed/simple;
	bh=inaWaAqFrl/RRSGGSiCftox16Qz2GHyEHZxNuyQj1Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7QX8bvXzfd2t0SJF/bctB5isik1MM4lN79kivy27h8UtZf3ePRo2u+Oz/0z973SfO1kapbqqtiO02U8GYgGg3xYPlE31lvDcjOB1Nor7IlEnBPeJVsMRFi2/FpBuJT+lmgkqR2kBmC61Y4QwIP9u/DOpWdPIn6yBfv4KbJ2wQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKMGs0fF; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKMGs0fF"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8299f1ca894so2463840b3a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261088; x=1774865888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyXu0gtjiBhx9nuUYM0Mf+9SNK/PonIri6dLaS9aeOY=;
        b=DKMGs0fFXDTxj0LwCACalOF2w9xVMtJcbttiLmCaCXPgbaEsxum48NmO4XuDIQwdZ6
         7gWv8qO61X7w1q+EdYNbHZWZWyTZ2WNApzAwcUtzc7Du5WalB3oexwrTJP6yU/+o7GC/
         RN7RHsNPHyQJEfF32fGa8QUQPvm2yaoHjVBRfvvPLO0Tin03TdvWKMWExgXhH82mou6z
         +6Fd1w32I51iiTAlkB/xJ7IzncfvOn1ApGbB8jA/AavT9TbG4zK8g3llZeeZ8gVGGXjZ
         EKftQJRyvFs4aNtYZRfXbyEek7BKQRLSxWIZMsXHz0vjnmhSxXCdsrH2qAzjTpimVKv+
         CBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261088; x=1774865888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oyXu0gtjiBhx9nuUYM0Mf+9SNK/PonIri6dLaS9aeOY=;
        b=VLLGDwBijUYq5+f+mb2XbV1AZMiYXVA6MeOBu8F4PmEbl5RSsrqhS141YPkB5GPS6b
         oIuTQ3EERnqBnNyRITuQINyzhhEniK4cPgxLV3CqzlTgWnnMj/3TBdrrlX4zjGy21Wnr
         DOiYVWEQru7UYIbEHFy25pebnfAHkNUus3vHjRT4QczvrMiPR3u79RUCDN3l9f0Tt3L5
         0O5sDHVOaOUjDQvlT6pBNUd9F+1yXjoPjxgw7+EmKyC4HdT7iJMF6wlrUSuRsjVg3nAN
         sQ5yWieSmlGGq3/nXi19wOvfErwhAk95pq5ikuLjP3o5QhAxhsIYMxo4NKLMHn2CFbBW
         d3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNkUiatODy5FZ3G4OTiDmVPjoY5s4G+YEJY2N/kM10n5VRfbq3zgSQSmAXoS3GW+aaWFXa1Fn/6+k7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn+p1q9kFCpfZ87uAfUnHYZ8N5AYm6LW+MWR/DHFonfU1O335g
	F7TlwY5pJYOGTmb05G9q+gj+DSiinNkk3+p0vCJMMGWvhrTvAgqFaFms
X-Gm-Gg: ATEYQzwd7n81gmXp2h6Eo61FMZttaZg0Qw6t5c2AG6vKR/E+WU/C3ajWc//wGxoUwYv
	slIw42f7c5pbJBx5frh3aS6tx16Tq2sx0BXapi+yrGTUHinrvoiJyFpmskRLBup3Mdlx8c5TKSZ
	08wwgPU/X9bIPp4KNV3ip1MtFCsn7GFnwmvnqE8CjzjsaD0daYOmUC2+Qwy4T8QMhBg5vZs7rib
	uf2QFEBmVkIaD4xKknMRW3We4geM0bftwo0U+0sBPRcCeihywXjcCqvhFUeObnUvn4amNKUcyiS
	yFwWQC2B8qrUly5lN3nEiUlSPQvcG+RUZ5mkTh8L/wsXPPINimi9b2hGej95A4Nv5JGToCDFOGQ
	37kFPBgReUGP+LDJFboHsn7Ez5BSwSOWRr2REKROl/L+tMEBePkMejYHQhXGx+TuQpOF6VNeYn2
	4fv0YU/ICHOoSm26oj/tcfbFTwMI5QXrYMbwukt6KYOnSpOulo3Zjtpxr2B1ADLSu1J4C6VQftp
	mqRrkYvhzFPtNffZ406lV4=
X-Received: by 2002:a05:6a00:1c83:b0:829:9f46:280d with SMTP id d2e1a72fcca58-82a8c23fb65mr8571011b3a.1.1774261088009;
        Mon, 23 Mar 2026 03:18:08 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:18:07 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v15 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 23 Mar 2026 18:17:54 +0800
Message-ID: <20260323101756.81849-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323101756.81849-1-a0987203069@gmail.com>
References: <20260323101756.81849-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 140 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..ab18702e53f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton DWMAC glue layer controller
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
+  Synopsys DesignWare MAC (version 3.73a).
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,ma35d1-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: nuvoton,ma35d1-dwmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+    description:
+      Register range should be one of the GMAC interface.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to access syscon registers.
+          - description: GMAC interface ID.
+            enum:
+              - 0
+              - 1
+    description:
+      A phandle to the syscon with one argument that configures system registers
+      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-txid
+      - rgmii-rxid
+
+  tx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+  rx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+required:
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+        reg = <0x40120000 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+        snps,multicast-filter-bins = <0>;
+        snps,perfect-filter-entries = <8>;
+        rx-fifo-depth = <4096>;
+        tx-fifo-depth = <2048>;
+
+        phy-mode = "rgmii-id";
+        phy-handle = <&eth_phy0>;
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 98ebb6276bc6..c25903c74484 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -69,6 +69,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
-- 
2.43.0

