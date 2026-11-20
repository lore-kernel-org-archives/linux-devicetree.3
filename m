Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217751;
	b=4P2zzLGnHCLroxDyQauzKEDn/20Xq6SkUu/5cfV891BMwaKdFvxSV0dF0q4emhRjJrQ9
	 tSjAUOKyvTUj/CWGs4EDGjf5VflI8fO3s5wWZZBQjqBUg29/Om+8krsPUqeTsAUkgOj7x
	 tYJH1oFApkLGdVC6XQE3wmJS9TqgmrUjMrcRTHZyakWV7teBn8Xmkmit3YMwonbk/CEe4
	 2i6U7XqWMP+JgyurO6xWkmIkDoxMNl91JlheiafJzSfeqers1iNBvWOwFJzyIr+AOSGiC
	 4CJLNJdOKgkDcgZSV66dNX8rWR4NBUqaPz+eZY5OMTNwwfl83TrYlnSexImqOwabWBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g56+Yp2TKqJ5xV2s8BFdZoIDvKQ0/BGu0qh6iDTvIhE=;
	b=Kr/+QucNxl9GQ4PLd8/QYqLjpo+anShY2iO0urevBZqcupU6WtBaYvQuiN/jSJBllSUx
	 iqXnb1DUxy/tOuS/GIa8rcn+0SVyT+9noTLnfTdGBhLQkZI33rJvK0VAJGOiMeHO7b+KA
	 VO/enSWJohHR2ndifmOxKJF8r3WFuZsH9pMuDoJ/0gggBGGHK5I3i3BB41ZWqC1S0vcYd
	 UAdqzZ80xbDG+ch5qnSv7QWvB3pac1hyYyYV4e4h7PKdqXJHMOXYJNaQEhRVbab0I30Yx
	 q+DOXRyXs2plQaZpqPowal8zzeDQr3uGR/BKkkBn4GwkRYtpXQLOb+LoxQhMWWkdbGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMJdzpWU;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34729606A6A0
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 23:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34729606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMJdzpWU
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49d64a88222so1648839f8f.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217748; x=1795822548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g56+Yp2TKqJ5xV2s8BFdZoIDvKQ0/BGu0qh6iDTvIhE=;
        b=gMJdzpWUCdoMFvsTMfYqoRfTfROXZG+RA1LGemimeWigE7+o/8xg6ie0qG9DmSwvy0
         HqZj8ThkLGNqmUpXWmvxvWkH4h9ZMhcO4s5l+RTDbm1HG3SLMJWvi0LmdYrCZwjDUkUE
         B/bhYqKnfxedTfdjvZtDyBCwe3W9Z4rIvvOas7b+SbJYB7Pcy7F2bk/NYZ9rSOH+0l6H
         954aKZWKo7AuuGOnolCdxD3R5VehevZZKCRbM3Zqs2RXThiGLfXjL4qLCd1ZdNo+XcZB
         mhZv2Eg1TShS1YsurmB3StyyVvRTmD4Al3JRFx5x+joBMvkb8wkT6bOFdZjKsBpmV+TJ
         k4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217748; x=1795822548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g56+Yp2TKqJ5xV2s8BFdZoIDvKQ0/BGu0qh6iDTvIhE=;
        b=2iuq25q9QMhdyPVEhWz0KL2We476cnMRNg3XhCkC4SGUifPaDoA5xzqtKGgr7iwlZb
         9dx/yGLC2HpV2AeuX3BL5e7Kp2T4SoOKjHAmGgQmh+qGcq+VtzESGChaDkUS35bke6zl
         MNIGWQK0SQSwGWSBwJZU1/GIQVsNpxa9oPfgH/HEDy/TwTStzW0PmVqIurkO3t2cwuTV
         2FEact2fC4/1pD0OXr9iU4RG8GPNGo0YgfX5uCcF7xG0S93cx609BO+avav4poxhYCVJ
         py6szklZlT6XKESjtt/ZDPtKrPrSWzfOY7wGe/MgHfdxKvJNbRTHzo4vxv4q1QLVNdY7
         eh4Q==
X-Forwarded-Encrypted: i=1; AL+hErFcOKWdjud1DjtsxktVk7P8uhGU4+XMWr3iBWIe5bIztozqVLp4KeoomqFpyeEtflIA4Nk9xqp7/WQb@vger.kernel.org
X-Gm-Message-State: APuU4Z+/HYgVHRYHXa17ZSGpPMo4LPKIXj+ugRkMlsywQy+1BQ1Uj1AB
	EEXQQ72DnSMqtXc3yZt0+y9dhDUn+a/Vag0N+SSh0c4LDu5jkdQ2+80/
X-Gm-Gg: AYBFou2mxW6gMSUgpK4uotvkSDB2lYly8rQLkWlegMUs1T5M7ZgGqV3YJyPAyfPkUrv
	qR+3j0ZPkABf9CY5NA/Tyy3JvHnBlSQNXiVOP6wsTFGtAOm1iJXPMLILMNNN2MCVSB7185qBGHr
	UvpSHiOA6my9r6N5rPMb5KsDbIVAZfq8HPww7wt2zOLAHRZ6SgzxLxTgvJsBbV04h6UJ4QQFeVu
	kkbjxu0D68MKkv6jyKLC5U0eaUmgsKh4JnfO6Suq4xZS9UVkMHAIInVgHmsj3rohukPRg2Smm01
	896BzAXcb0pWa9uxYpHiiW93rZ1HG9UqabrMjiRLCYnaI600cwSZEG5j4ah8hEPxNupJ4gFh4bx
	dKwDuca12Rf2is2yWS6yaxH6bs/ewUQG+Hly6COK9KoKI98dre/nWctFL4/w5GF5u14DVg964Wh
	+puZb3hJFX4WKrGYovKT+HATNMQBM5jxln1wAlguA6h4kYkBUrRkvpnnpvxUWfrgbgl0+0vn5KR
	EgJ7898WCxjxt54XJo76qrKLaMBxpK3908hjCyrlWmgYW4xmeo3y8wwQ98k6i8Bv75sKWMC31GN
	AzGFO1L0H+PXtcjnyWz03oDSQjGN2+umAuzEUCIwmJ0i9ZrfPnvq1y8E+Tqj51SPRcXIMA7M7oN
	nIQ0gKNDSp3Wk6D3/ntrZfBecn/HqJiYCm0/dsVle6+jmHR/vuPpi
X-Received: by 2002:a05:600c:2319:b0:4bb:752e:991c with SMTP id 5b1f17b1804b1-4bb86160370mr100394445e9.15.1795217748477;
        Fri, 20 Nov 2026 15:35:48 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:47 -0800 (PST)
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
Subject: [PATCH v14 1/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Sat, 21 Nov 2026 00:35:29 +0100
Message-ID: <20261120233535.164885-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120233535.164885-1-ansuelsmth@gmail.com>
References: <20261120233535.164885-1-ansuelsmth@gmail.com>
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
 .../bindings/clock/airoha,en7523-scu.yaml     | 26 ++++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..0d5f89187525 100644
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
@@ -57,12 +58,37 @@ properties:
       available serdes port.
     const: 1
 
+  airoha,chip-scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Chip SCU providing the registers required
+      for configuring and read the base clock sources, dividers  and
+      clock gates.
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

