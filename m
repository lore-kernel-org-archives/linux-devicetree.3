Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638108;
	b=XTyPtETbgAUOXcUiUi2C15eDLOCYvCewp129IxoDk9mTiz2flst4WOvl1iOeC5OcrPve
	 fK7a8IChelycEkgHg9RakJ0qDlEHNJvwBOJFedWSRqil/K8WM2OuXtdPaceFwH2Y5I5Tc
	 RnxpgEtyOIaPEO9uL02PbCgfkYCwRCpsOX9HXjYgeZcwPxidXLXm7VeYu/uK2mCNo9eeN
	 qIL94IcKi/UM4zaGTXr2HpUQKFajmTHa8T50cTcnfGgOTMfIkCHe4yTmC9iqWLP6LSlS5
	 0T7XgVD2TR9WSrH4u803dRY/TMAf78z6vjAMhG43tB8PTxJq+Lg0OF6QyDXQ2HO8HnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PpjsSnxg1AIeDz8NR7jpTi9G0n5lA83qCQvVaWbPR8g=;
	b=kMO2bMRFP9DnHgf+2EGLNeNOjVxuQJ4fs/7dO3KhSCBOjKIl910MQmu+CkzaqWaifMBY
	 1Vf8L9tXYTXkf3Hf2VHBuD8C+2YH77Wxy+w2HjrjD7dBe42sURm6Hn7R8gE+CGhMST9b2
	 2FrLNyhmrB2ePrSimOAMjKvtAnFP4cXjGTdB+LmNyMq7dG5XNdCILDxD18O15XCd7dEj9
	 BnxUqHzUwPSix+a3GfmxV/2hSWiowST6QrO4i296nRY2ufGJD5b2DyDaZ5UPevbswWIZm
	 v4JQojMfCOlDItIdmCO8SB5MMc37zWvt0aarXXT74AImk4101itlqmtv6L1NTcL95vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=A65WD2F+;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884A0606A335
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 884A0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=A65WD2F+
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4ad587ba293so3421312fac.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638107; x=1796242907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpjsSnxg1AIeDz8NR7jpTi9G0n5lA83qCQvVaWbPR8g=;
        b=A65WD2F+9AkDkxOhI+lzJ8+i2f6yeI4zUqbQ1QVI8DvGRaHTzJZ2ncnQNnk1vK5mb6
         +HINrbTk1y0ru8Sjx/Qh1vWU5VICdDFRURZC7U8lefYeLyrzgkWTDwCX59UwUWldt2ak
         gpoSY2llnJKuHQSv5b0QXx9AwMbQAApCKyvgQ3Z2QhXu4dXppwGP/KojS9xTvO62PMCi
         bqZAmXkzkPEmBf5q7gXE5NEoHEoc/OBudlIRj1ZiB3KjLz2OSIIw7WBUb3ils6TPp1gx
         IF0MyDrVI2kyYuLIUExUq0b0RwEq+DkcmDnALR/F5fga8GV2mKz7hskbTvLGlwlKzVlX
         k0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638107; x=1796242907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpjsSnxg1AIeDz8NR7jpTi9G0n5lA83qCQvVaWbPR8g=;
        b=lAzQenQqPvG5V/Ws8VRdZBwuv9qz1IyWpzp1fXLrKgI+fEtGRczSKCIHjnBeOUqv/C
         xR5zkndHxeqq2dsSr7aMso8LHlZ6jdHLGiIrL4tNNfPgByMlk0mkOb1iMRb2flrzbWO6
         H5EWIiHIOYGePOqhk13ClikmcS4FQkb3IICEVKcNt4Z+dhvIBxjvQrcZEhPNrjurN659
         Ic4GbDfFzgA96lnBkP46mockfbKWxjm/gQbDzbNZ5VdWB5YaTW2Oh3c29i3tQRkVlHiB
         TbMSND9KyrTXWeYjwOyUh3NSW9jJXW2pQDrU+SjRaKw3q0ztJYB0tMwXOc+2zHlhoyjn
         2ZUA==
X-Forwarded-Encrypted: i=1; AL+hErFLeVsjyXQ1/04K39VPZ2oTxXBBRn3ljd00OLg6M538KxHcPKrkSAeJuCQi6NgWKkn6NDm9f76z7fqP@vger.kernel.org
X-Gm-Message-State: APuU4Z/lWXm0nf47NtvfeEnXgDuUvm/TftOJSCuDaK6sUeC+Ql2MCfMX
	IR/OSGJBiAh3hE97IXxuBBgKs3TXhUi+HG453sZB7bOc4tbQqsWegVyaAXh65kzLi64=
X-Gm-Gg: AZFdTZeJaH/GISdGRHIF5n1uFpBm0LFcsSiZI/Hm7uOo30Nvp2s3RT0ULwGrT+mkcty
	bWt16dARrMKgcM+Frhgt3SleFcq8v/cwlTvNl+hBPCvyWMfLQL+x6Fb+dtrHhQ/LK5W/YBotcfJ
	CSdXJLZKr3a5ifQ5X36W9WSFxfaA0Zwa7fOKbHgoLYa6gbH8EniQcK1y3BkPzlFRWsDigNF1Tsn
	nmtrJx3hcpyGlsMH8fnj7/HaKlzeII9raT+R5zIUhjP5dkPFSXX/1lOB/L+SlRB2vDNR7zevBrr
	djlBWWu7Y8vg7c/XTF+kYvW0x7f7sLYSS74dMmRvXHv6sAZVMOXM2MMG437MichYwVklzDTF0Ec
	fAV3j47pxqDPvOu5rR0M5nuslpNZRcxJ0tSotYdRKq0XuK5R7xk3bNWNsAjL8yRRQJVflRLzydC
	J3lLvcs/lGNWjUFzWq3wokp///gDk+gSaXAgPgYjGOjQxlz9X9+2FzECZDpHrwCXFq4TgeKBEC4
	es7pk/g0e1v87Xn6GogUW1gxYK6Q+Q+u/C1os6cE9jL5zv/kg9Nh251n51vMffWxn3C4lpDLnNo
	UhvugYiQFh0K8x4yvLUGd90WKTQLM4GbP/ug
X-Received: by 2002:a05:6871:7bc7:b0:4a7:2bbe:4601 with SMTP id 586e51a60fabf-4bc85af4396mr16373413fac.57.1795638107333;
        Wed, 25 Nov 2026 12:21:47 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:47 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
Date: Wed, 25 Nov 2026 14:21:39 -0600
Message-ID: <20261125202141.1288493-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125202141.1288493-1-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
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

Define the binding for the clock and reset controller that present in
the Toshiba TC9564 SoC.

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added Lorenzo's Reviewed-by
    - Changed to @kernel.org e-mails for Daniel and me
    - Only the gated clock IDs are now published in "toshiba,tc9564.h";
      the PLL and internal fixed clocks are implemented and accessed
      only within "clk-tc9564.c"

 .../bindings/clock/toshiba,tc9564-clock.yaml  | 73 +++++++++++++++++++
 MAINTAINERS                                   |  8 ++
 include/dt-bindings/clock/toshiba,tc9564.h    | 40 ++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
new file mode 100644
index 0000000000000..026ed949f0f02
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 Clock and Reset Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+  - Alex Elder <elder@kernel.org>
+  - Daniel Thompson <danielt@kernel.org>
+
+description:
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The chip includes
+  an embedded PCIe endpoint that provides access to various peripherals
+  within the SoC via its BARs.  These peripherals include a simple
+  controller to gate internal clocks, and a reset controller.
+
+  The TC9564 chip has a single input clock.  Internally that clock is
+  multiplied by a PLL, and the PLL signal is divided internally into
+  a set of fixed rate, always-on clocks.
+
+  The clock controller exposes a set of simple gated clocks, which are
+  controlled by two registers.  Each is derived from one of the internal
+  fixed-rate clocks.  A total of 21 gated clocks are implemented within
+  the chip, but support for enabling and disabling only a subset of them
+  is provided at this time.  Two clocks (I2C and PCIE) are marked critical
+  to make it clear that they should never be disabled.
+
+  The reset controller uses two other registers to control a set of 13
+  resets that can be asserted or deasserted.  Here too, only a subset
+  of the resets can currently be managed, and the I2C and PCIE resets
+  are treated as critical.
+
+  Clock and reset IDs are defined <dt-bindings/clock/toshiba,tc9564.h>.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,tc9564-clock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1004 {
+        compatible = "toshiba,tc9564-clock";
+        reg = <0x1004 0x10>;
+        clocks = <&tc9564_xo_board>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 64f8b6153b870..36107e0790780 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28716,6 +28716,14 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 CLOCK/RESET CONTROLLER DRIVER
+M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
+F:	include/dt-bindings/clock/toshiba,tc9564.h
+
 TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
new file mode 100644
index 0000000000000..7de8c8165199a
--- /dev/null
+++ b/include/dt-bindings/clock/toshiba,tc9564.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __CLOCK_TOSHIBA_TC9564_H__
+#define __CLOCK_TOSHIBA_TC9564_H__
+
+/* Clock IDs */
+
+#define CLOCK_I2C		0	/* critical */
+#define CLOCK_PCIE		1	/* critical */
+#define CLOCK_MSIGEN		2
+
+#define CLOCK_MAC0_TX		3
+#define CLOCK_MAC0_RX		4
+#define CLOCK_MAC0_125M		5
+#define CLOCK_MAC0_ALL		6
+
+#define CLOCK_MAC1_TX		7
+#define CLOCK_MAC1_RX		8
+#define CLOCK_MAC1_125M		9
+#define CLOCK_MAC1_ALL		10
+
+/* Reset IDs */
+
+#define RESET_I2C		0	/* critical */
+#define RESET_PCIE		1	/* critical */
+#define RESET_MSIGEN		2
+
+#define RESET_MAC0_MAC		3
+#define RESET_MAC0_PMA		4
+#define RESET_MAC0_XPCS		5
+
+#define RESET_MAC1_MAC		6
+#define RESET_MAC1_PMA		7
+#define RESET_MAC1_XPCS		8
+
+#endif /* __CLOCK_TOSHIBA_TC9564_H__*/
-- 
2.53.0

