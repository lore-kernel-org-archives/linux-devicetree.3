Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599623B19AF
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782676770; cv=none; b=aO3O2A6sLOHm/VVaSlyYyuTbxnGYQ1L3MrIlmYFmsbq/IqrqLWh9PKnZl4R+Le4JVUfvGcqX8a4AGAkNXyVeBSnzalMCxGuVWzFXL0FEVyPT0aG9deudcoZctihXZkgGcLue2X8e/8NuBv0KVXHT2yDhWj00A/FW3Lq68M0cGP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782676770; c=relaxed/simple;
	bh=cXtZZSnybSvHM0AdrQqoqzCvxpsEwMyY+x2tMzfR6k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvDidb74DuehM/pIvs+tZ+1WspUWkidahj3fnoc3pYoD4axkYoUB83mMZlzggoJKZAv37XcC4WJGdWrCmy8nawA3K9vSciOZYCLJaHMjFsEWeLJlA1FW0IPm3P6VNRsA0nU9RZoapcbhUi3Yyw9REUuiEk+UIp+t3DwCCitr3JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouFL01GW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouFL01GW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4926fe5be4bso17995355e9.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676767; x=1783281567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNNZfoB+jlMGGkF2GNJR9f6JBYB+xNRQZETStwnODfQ=;
        b=ouFL01GWUQPOoe2KaKkB1HNamKiGaNlbXAnyIzNDpSVbwC/ajC7iTqVPKZnz5WMJyd
         QQqNYMyCbsNdsPPTHpDoo/laWURmEY1QPDx2vBZD2QfNw9SodyTeD+EJNw8qCKsB/EtZ
         8qHjufXYTBXbZAboUhjvoMXjs2UXavYqhzjjGuGdXaO597+NX5/E5E4EnDJ1ClRbwRiW
         G8WR+U2HrFsXQ/s041Mm+vhrsjt9ny5SE66hp7E1q0TNtW/juRP1hF8mk0jAY7LdCPEq
         0HRHVWIrZD3M4ZlQT0UfL03s2IGgdZIpYANbJbV4Qige6hrQxctOYnyQ8EvBk02IZLXB
         EYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676767; x=1783281567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PNNZfoB+jlMGGkF2GNJR9f6JBYB+xNRQZETStwnODfQ=;
        b=bME0pfGOhmXdOe9fr3ungkOW+RAnzV1WEagH9FwTSG1KLyjJH0Y9SjCiSMpJgtwDdT
         4PsdQLZPafRd0hkMtcK38eDCIs05K30qtc4HDIFTM2EHwy3KF4b7Akk242E9RsZuVIP+
         LMfU9zQ8Arh7NlKBwf3UIKVX3bgsMdS3i/UJSvIjgnp7QZD1fm5TQqCBMPf3VIVRq9IF
         wHVUN8QdeXwTYydniivk964CaU4RDEZVL9DZHgp2JtmtsQfkHS6M3weBjVRW+ftdg4TL
         sY/HeNj2Fs22Lx5F/vYRnE3tJd1pqGJw0fkWkxAl39rrBElNtkVwQ5uWpjOtkqh+5JiN
         evpA==
X-Forwarded-Encrypted: i=1; AFNElJ+mtTQsNSRiovenRBY6D1vPkEH0MAo96XAABW0boG+zKoT/7kKUb12Ttd6kUAdRfvQ0NJgxTVpwfObT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5b6IJN7DOBPZzMwwoU50q9UlTaBsemarv5XfSvr7JSdeDcamu
	h81PQeId90x6bfKEjYtkPfXKtFD8FppyWl1XI1jonHedpozsCBW2AkOn
X-Gm-Gg: AfdE7cn5OHYzqZVliRXv/kH6YhcktDzIT+HUtJIttvcytMX3D4kkKiMWFTSyulBSFAU
	Wck6HwOOl//t2PN4bRVK32lOCGmd/w5DT43e11UY4Owz9SWGP/3G0U918SvPG4Fdsc5CczLdaWj
	p4tPafyE0zPDdtUSO8rRvHFcxDc5tbDZiLlUSNoWfE6vwpjgmvWaUsHQkzfFzygIKknCsUFbEh2
	pQIIQdXzH8+76Qzj6rl7aCKFRoIW+gZRFidOoBeC1H7x5Aizl/ZLjZKX/fDIwtNCOVI5/TFL6ut
	48QSgBCgXs2J6tqfZT7qFq2xXSpqWtPGwhLQt/s63OyVcKM0lw6kBAH9rim2OP8M5zifoEFd+w+
	yUf0cecEOmrSjqpQQGJgJyII4LacGr2h1QcPV49tqr5plH9MCPYy6W+pIadBUY0YVFhBujbFP8r
	dgTN7NxmOfihLGc1H8jNO25pk=
X-Received: by 2002:a05:600c:4443:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-4926fc8cd5fmr146664495e9.27.1782676766742;
        Sun, 28 Jun 2026 12:59:26 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:26 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:58:57 +0300
Subject: [PATCH RFC v5 02/12] dt-bindings: soc: zte: Add zx297520v3 matrix
 clock and reset bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-2-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10831;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=cXtZZSnybSvHM0AdrQqoqzCvxpsEwMyY+x2tMzfR6k4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UYDoA+QurQkMZJw9fJS2Gk8g8s1gZ+k3l6
 QEt2w+d/HuJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLiJA//S0R0ePt6i6JlqXk6FbNih0g3OlJqEpl
 Sx1ZbtJtT6Vvgn14nObA0w5AV+U+97ddEbSrpW3WqOcgUT+KcMe9Dj6xK3fRCKKGeVjHRrPhyMw
 wNszT4z76Ph9+CZcIgvODI5vCiIru3Z55ULVsokXUTzilgAt4MjjQ2aSV/KKfPP7F9cM0lr99oA
 8IzYJhqaMtcgIbTgx1U9o9UedYIPniL1hjFqpo6rtQa/RcFpynpra9S3Mrg7xldszO2zcm/s0bF
 vRsEnhKhWXd0rGBXy6Ai/piqxZvIRDLY5wAolVDFTnviwZS+HWLqEVmZ1pImoALVmzhK+w/ngWi
 AJyzWLMI4/N7AM5spLV4W6sYuseT4EgN+rMZhkquDR/1yuELuv/cT/Qkmy2A6FTiSvFc/UJBkym
 /ZMuKbkgvB5NQ4RuIwd5m6jK9udLmB4s61KQmFoWJzkxCtl8ac13ION4QPtV8gsVEs7DxAWL1Lq
 wQBAt+1jMfJQbW9h1dAn3qt8o25IRin0r9Glrb31Zoy0XbJwWWBoLWdDyTOqGYrSiD/tiLt4LoL
 kAtxXtOVF5dhSx9y4qDi81qDZfH8Tjdz+ndt3KkrhwVvvwUZFomXD4AcwH0W6M/OPN41z97YCT/
 0IfuUGctQRnX5afHmkvg9Y/EX1aPZrzQ8qYiJ65+XmxMJcrGoWIg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This controller contains clocks and resets for high speed devices on the
zx297520v3 board and hardware spinlocks that I expect will be necessary
to communicate correctly with the LTE DSP firmware blob.

A simple MFD driver will instantiate independent clock, reset and hwlock
drivers.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes
v4->v5:
Move binding to soc/zte
Remove topclk from the example
Add #hwlock-cells for hw spinlock registers
Add more clocks I stumbled into: sram0 and another LTE related device

v3->v4:
Split matrixclk into its own controller again because syscon/regmap
deals poorly with device nodes that have more than one memory region. As
a consequence I am passing all PLL outputs generated on Topclk down to
Matrixclk.
---
 .../bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml | 177 +++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  37 +++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  10 ++
 3 files changed, 224 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml
new file mode 100644
index 000000000000..bbec0eb837da
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml
@@ -0,0 +1,177 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/zte/zte,zx297520v3-matrixcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC matrix clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This controller contains clock and reset controls for high speed devices on
+  the zx297520v3 board: The CPU, RAM, SDIO and Ethernet clocks and resets are
+  found here. This controller requires PLL-generated clocks from Topcrm as well
+  as the fixed 26 MHz and 32 KHz oscillators found on this board.
+
+  This controller also contains hardware mutex registers for synchronization
+  with different processors on this board.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header. Resets are defined in the
+  'dt-bindings/reset/zte,zx297520v3-reset.h' header.
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-matrixcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 KHz external oscillator
+      - description: Main PLL output from topcrm (usually 624 MHz)
+      - description: Main PLL subdivision factor 2
+      - description: Main PLL subdivision factor 3
+      - description: Main PLL subdivision factor 4
+      - description: Main PLL subdivision factor 5
+      - description: Main PLL subdivision factor 6
+      - description: Main PLL subdivision factor 8
+      - description: Main PLL subdivision factor 12
+      - description: Main PLL subdivision factor 16
+      - description: Main PLL subdivision factor 26
+      - description: Upll output from topcrm (Usually 480 MHz)
+      - description: Upll subdivision factor 2
+      - description: Upll subdivision factor 3
+      - description: Upll subdivision factor 4
+      - description: Upll subdivision factor 5
+      - description: Upll subdivision factor 6
+      - description: Upll subdivision factor 8
+      - description: Upll subdivision factor 12
+      - description: Upll subdivision factor 16
+      - description: Dpll output from topcrm (usually 492.88 MHz)
+      - description: Dpll subdivision factor 2
+      - description: Dpll subdivision factor 3
+      - description: Dpll subdivision factor 4
+      - description: Dpll subdivision factor 5
+      - description: Dpll subdivision factor 6
+      - description: Dpll subdivision factor 8
+      - description: Dpll subdivision factor 12
+      - description: Dpll subdivision factor 16
+      - description: Gpll output from topcrm (usually 200 MHz)
+      - description: Gpll subdivision factor 2
+      - description: Gpll subdivision factor 3
+      - description: Gpll subdivision factor 4
+      - description: Gpll subdivision factor 5
+      - description: Gpll subdivision factor 6
+      - description: Gpll subdivision factor 8
+      - description: Gpll subdivision factor 12
+      - description: Gpll subdivision factor 16
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+      - const: mpll
+      - const: mpll_d2
+      - const: mpll_d3
+      - const: mpll_d4
+      - const: mpll_d5
+      - const: mpll_d6
+      - const: mpll_d8
+      - const: mpll_d12
+      - const: mpll_d16
+      - const: mpll_d26
+      - const: upll
+      - const: upll_d2
+      - const: upll_d3
+      - const: upll_d4
+      - const: upll_d5
+      - const: upll_d6
+      - const: upll_d8
+      - const: upll_d12
+      - const: upll_d16
+      - const: dpll
+      - const: dpll_d2
+      - const: dpll_d3
+      - const: dpll_d4
+      - const: dpll_d5
+      - const: dpll_d6
+      - const: dpll_d8
+      - const: dpll_d12
+      - const: dpll_d16
+      - const: gpll
+      - const: gpll_d2
+      - const: gpll_d3
+      - const: gpll_d4
+      - const: gpll_d5
+      - const: gpll_d6
+      - const: gpll_d8
+      - const: gpll_d12
+      - const: gpll_d16
+
+  "#clock-cells":
+    const: 1
+
+  "#hwlock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - "#hwlock-cells"
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1306000 {
+        compatible = "zte,zx297520v3-matrixcrm";
+        reg = <0x01306000 0x400>;
+        clocks = <&osc26m>, <&osc32k>,
+                 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D2>,
+                 <&topcrm ZX297520V3_MPLL_D3>, <&topcrm ZX297520V3_MPLL_D4>,
+                 <&topcrm ZX297520V3_MPLL_D5>, <&topcrm ZX297520V3_MPLL_D6>,
+                 <&topcrm ZX297520V3_MPLL_D8>, <&topcrm ZX297520V3_MPLL_D12>,
+                 <&topcrm ZX297520V3_MPLL_D16>, <&topcrm ZX297520V3_MPLL_D26>,
+                 <&topcrm ZX297520V3_UPLL>, <&topcrm ZX297520V3_UPLL_D2>,
+                 <&topcrm ZX297520V3_UPLL_D3>, <&topcrm ZX297520V3_UPLL_D4>,
+                 <&topcrm ZX297520V3_UPLL_D5>, <&topcrm ZX297520V3_UPLL_D6>,
+                 <&topcrm ZX297520V3_UPLL_D8>, <&topcrm ZX297520V3_UPLL_D12>,
+                 <&topcrm ZX297520V3_UPLL_D16>,
+                 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_DPLL_D2>,
+                 <&topcrm ZX297520V3_DPLL_D3>, <&topcrm ZX297520V3_DPLL_D4>,
+                 <&topcrm ZX297520V3_DPLL_D5>, <&topcrm ZX297520V3_DPLL_D6>,
+                 <&topcrm ZX297520V3_DPLL_D8>, <&topcrm ZX297520V3_DPLL_D12>,
+                 <&topcrm ZX297520V3_DPLL_D16>,
+                 <&topcrm ZX297520V3_GPLL>, <&topcrm ZX297520V3_GPLL_D2>,
+                 <&topcrm ZX297520V3_GPLL_D3>, <&topcrm ZX297520V3_GPLL_D4>,
+                 <&topcrm ZX297520V3_GPLL_D5>, <&topcrm ZX297520V3_GPLL_D6>,
+                 <&topcrm ZX297520V3_GPLL_D8>, <&topcrm ZX297520V3_GPLL_D12>,
+                 <&topcrm ZX297520V3_GPLL_D16>;
+        clock-names = "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3",
+                      "mpll_d4", "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "mpll_d16", "mpll_d26", "upll", "upll_d2", "upll_d3",
+                      "upll_d4", "upll_d5", "upll_d6", "upll_d8", "upll_d12",
+                      "upll_d16", "dpll", "dpll_d2", "dpll_d3", "dpll_d4",
+                      "dpll_d5", "dpll_d6", "dpll_d8", "dpll_d12", "dpll_d16",
+                      "gpll", "gpll_d2", "gpll_d3", "gpll_d4", "gpll_d5",
+                      "gpll_d6", "gpll_d8", "gpll_d12", "gpll_d16";
+        #clock-cells = <1>;
+        #hwlock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index de1c08b6a5a9..8a6aa456a708 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -94,4 +94,41 @@
 #define ZX297520V3_HSIC_WCLK			86
 #define ZX297520V3_HSIC_PCLK			87
 
+#define ZX297520V3_CPU_WCLK			1
+#define ZX297520V3_CPU_PCLK			2
+#define ZX297520V3_ZSP_WCLK			3
+#define ZX297520V3_EDCP_WCLK			4
+#define ZX297520V3_EDCP_PCLK			5
+#define ZX297520V3_SD0_WCLK			6
+#define ZX297520V3_SD0_PCLK			7
+#define ZX297520V3_SD0_CDET			8
+#define ZX297520V3_SD1_WCLK			9
+#define ZX297520V3_SD1_PCLK			10
+#define ZX297520V3_SD1_CDET			11
+#define ZX297520V3_NAND_WCLK			12
+#define ZX297520V3_NAND_PCLK			13
+#define ZX297520V3_DMA_PCLK			14
+#define ZX297520V3_MBOX_PCLK			15
+#define ZX297520V3_PDCFG_WCLK			16
+#define ZX297520V3_PDCFG_PCLK			17
+#define ZX297520V3_SSC_WCLK			18
+#define ZX297520V3_SSC_PCLK			19
+#define ZX297520V3_GMAC_WCLK			20
+#define ZX297520V3_GMAC_PCLK			21
+#define ZX297520V3_GMAC_AHB			22
+#define ZX297520V3_VOU_WCLK			23
+#define ZX297520V3_VOU_PCLK			24
+#define ZX297520V3_LSP_MPLL_D5_WCLK		25
+#define ZX297520V3_LSP_MPLL_D4_WCLK		26
+#define ZX297520V3_LSP_MPLL_D6_WCLK		27
+#define ZX297520V3_LSP_MPLL_D8_WCLK		28
+#define ZX297520V3_LSP_MPLL_D12_WCLK		29
+#define ZX297520V3_LSP_OSC26M_WCLK		30
+#define ZX297520V3_LSP_OSC32K_WCLK		31
+#define ZX297520V3_LSP_PCLK			32
+#define ZX297520V3_LSP_TDM_WCLK			33
+#define ZX297520V3_LSP_DPLL_D4_WCLK		34
+#define ZX297520V3_SRAM0_PCLK			35
+#define ZX297520V3_GSM_CFG_PCLK			36
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 43db72bb59de..81ffc8bc34c5 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -29,4 +29,14 @@
 #define ZX297520V3_HSIC_PHY_RESET		20
 #define ZX297520V3_HSIC_RESET			21
 
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_EDCP_RESET			1
+#define ZX297520V3_SD0_RESET			2
+#define ZX297520V3_SD1_RESET			3
+#define ZX297520V3_NAND_RESET			4
+#define ZX297520V3_PDCFG_RESET			5
+#define ZX297520V3_SSC_RESET			6
+#define ZX297520V3_GMAC_RESET			7
+#define ZX297520V3_VOU_RESET			8
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.53.0

