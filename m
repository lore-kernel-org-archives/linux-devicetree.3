Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559472;
	b=wBHmW0xNFnm79BywXRN26n1bVdhseSFVgbav3Hqa1LrkkdrbNckBUPC+XllfUmbijM/s
	 np5oOsATYlWFLacCJICM92vruS7e6Qd9x2M5D7KUEFy80RBGHtOVJZAZNHDSqGmV7Q37I
	 uCyrWVUW8N91cNLT3k6QJd0JaaBFtg/XzJRupcK/E7g3zbpJU0tGma4khFhB+nxM5LytQ
	 xsrilUB/85+f2angbukXlcMyRCKsQkiVoSpDcl4Tsmkjomf6OGD3m+flImg51Hbc9hFex
	 7dJCUUDjjJn9QrQyOf8/Alri/Ovd3wliu3yNciSwy4x/rsqYsRxSwPpAHiLZaLvuyqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
	b=Srs1WlPW5N4+fx9k4TipvmyTlc5kywcWvhXuRNYmsbaQI06Ho3Pn7X/pdSu6Gl+e1JuI
	 2PiCS9thbqf5OFZhTB+bnqVW5y3AtBtd+5PuUIdWRqL6UFvGvUF0jZkngw4hwJ5KE3Aox
	 Bw/bjav5QbiZnWq0lN72Jbz9XocBibQmJiGgOWQ76Id0QMSpEn2JljOh/7+W6yqGB8Tuc
	 kjCOzw4XGTnfiI87WghWSdiSjthEj553Hm5cd8R90yl4nISlojddfFYsBzQky/49+t5/q
	 lEM4g2501j65KuuAVPs6hMtY2bY+G+NNo7UIixDJ+PtnPklqLCSBlpJV8lOJ7h6uSiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBBHWtrn;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658C560A2603
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 18:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 658C560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBBHWtrn
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0cf2c0785so17703227b3.3
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 10:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559471; x=1794164271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
        b=zBBHWtrnLvN+KzhRTGzloQZBjdPjbJoacnzhb5LFieDQJiTervtn53JtQI8N2HM2c0
         bSsh0A3WMG3AGCQVa+/y+kvnXV3+eU7FwijPSoKqkxbzeWait4hunT9qokSXJuKLYbTe
         zrPivAEM6sNwnQbG80r0F+YN1fJBEDNbBRVxdOIHelXx5TkkdnP/NudLKy2YIpXnkBob
         AduZhRTZV89taoSgJxgYz8Z4IR0Xma3RtlbZcxaw370X/3VyoIG4o9sFlAHDVZcfyZvX
         RMQEBm9aWaLKx1bsPtSCPhKVEwS2jDBLDYBbILoEWWSys1V3YEM08qIxyYS4ILnTVtSv
         BDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559471; x=1794164271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
        b=IfIXH24MDMt1iAlsHC34jZ3xsceTMU4Q52Dxd0fBSBmTYC/EjbK+XTQ4nW6DoNwbdF
         f1Evfks2WCC6IVcYKEaTUpizhxmys4/tbMMvzBDebO22QTobM7Et9hIAHPxdPhG/Vd1u
         C5f6kAFyssrkCFdOYFbUB0QorZixzBtbhu+jPosPz7Iz3/eKUMtIpznWLmEXCNtlqr5I
         hSDpUbJdq4pD4gOh3v34Oe258LtFxjyOtZhMCUVT4jFVhffKrWEnFmv7S6M4cChFITiZ
         /nyTtlFXWN9zVtDugRkrLMCon5KxHxwZ0/fkJZCZs9zYhqtjIMnkKYUDI57sz9C56l2F
         ZiPw==
X-Forwarded-Encrypted: i=1; AKwUvBxHWAPn1Mq5y6llWqduvl5LGCgChn6CeHX5qrZa/zCqXMh3MwUic1ezBwM8akxTIUV8IvEAYJc8rD0y@vger.kernel.org
X-Gm-Message-State: APuU4Z/PiE07TtJm6H4MA/6PfUFCcRx2r5nMngLLNPhhYsHHpReatrPI
	fMUrXSs78egc1YVG6/N2bmBpiiNEevL2AAi8FvxJfdMzSUhmOhI/tIZV
X-Gm-Gg: AYBFou3Duea+C6wRbGQG+D+NLoMNRv8uYRPW5dWSjQSAibpPPjAXnhBfGxT24t5swnD
	sSJsCwgXh+R+6vh0l3CsAsmgAlkhvajlR28pajiQ7vsBa+YrU1I4fRYErFLIa0Vb7ZdqVp682Ot
	ESysjPUl5lr+qgYDp2vSgcDaw2KBIqmv58W4mtw/PaqCov8I1Ee7u3SX4Wi4iMhFFNXHkRup724
	2vw0a0xk1Lncfe6yFuamDNobuFl00h15AeVqgj2EiN7rArFFXtgYbIFDUNmhLNUtsXK9CZebIrJ
	LAk0btuFp/4Ik8oPgqyOl9bNJwiEoIFOH8JVA35D9VSHFKfl3DK/0aT6x4/LvcCqDxZZSmcfbqJ
	P+Rfb3WF83NgxFDzoa2UQ7GIBlsdQp2z1+R8FMht2ok8425iZpiBCioIeCpCcDfXZMtl5X1iPwy
	m6aUwBINmDj9dgixNRlLHZp9vpxebE8XwIEwK5DI/+R896ieCjJvqZm8/C4tyJSiYmXHv1FePYB
	m84E5YkcACPH9+RRNkDe3J0JvSlZ9wo54J5GP871iPJxuueJPBbeq+dTU9bR3x8rA6we1ewoRbA
	yo934EeFj7mHwH5jgh+jj2mAkfDw5rw7brIP0JK8Tabs69tpZXhvOt246XrQKPu/tps=
X-Received: by 2002:a05:690c:6d84:b0:8b0:e385:ed99 with SMTP id 00721157ae682-8b2b66c78a5mr43226817b3.30.1793559471312;
        Sun, 01 Nov 2026 10:57:51 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:51 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 3/7] dt-bindings: remoteproc: Add Allwinner A523 RISC-V remote processor
Date: Sun,  1 Nov 2026 12:57:31 -0600
Message-ID: <20261101185735.762559-4-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
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

The Allwinner A523, A527 and T527 (sun55i) contain a T-Head XuanTie E906
RISC-V core. It runs from a dedicated 256 KiB SRAM and can use a second
256 KiB SRAM and DRAM; a bit in a PRCM remap register shares a further
512 KiB SRAM (SRAM A3_2) with its subsystem. Its reset vector is set in
its configuration block.

Describe the configuration block, both SRAMs and the remap register,
the bus, core and SRAM clocks, the configuration, core, SRAM and debug
resets, the RISC-V and SRAM power domains, one message box channel, the
reserved memory regions (a pool for virtio, DRAM for firmware, a trace
buffer) and an optional crash interrupt.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- File renamed to allwinner,sun55i-a523-rproc.yaml to match the
  compatible
- reg and reg-names are a fixed list of four (cfg, sram-a3-0,
  sram-a3-1, remap), all required (Krzysztof); the SRAMs are named as
  in the T527 manual (SRAMA3_0, SRAMA3_1); the description says the
  remap bit shares SRAM A3_2, not SRAM space 1
- clocks and resets are fixed lists, no minItems (Krzysztof); add the
  debug reset. The msgbox and parent clocks and the msgbox reset are
  dropped: they belong to the message box node
- Add the RISC-V and SRAM power domains
- One message box channel; mbox-names dropped. mboxes is optional: a
  user can drive the message box from userspace (UIO) instead
- The crash interrupt description says the A523 has no dedicated line
  for it; it is the only interrupt, so no interrupt-names
- memory-region[0] is a shared-dma-pool; the example has the memory
  regions
- "schema" dropped from the subject (Krzysztof)
- Jernej Skrabec and Samuel Holland dropped from the maintainers; the
  MAINTAINERS entry moves to the driver patch
---
 .../allwinner,sun55i-a523-rproc.yaml          | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
new file mode 100644
index 000000000000..b119acaa2df6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/allwinner,sun55i-a523-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A523 XuanTie E906 RISC-V Remote Processor
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+
+description:
+  The Allwinner A523, A527 and T527 (sun55i) SoCs contain a T-Head XuanTie
+  E906 RISC-V core next to the Cortex-A55 cluster. The core runs from a
+  dedicated 256 KiB SRAM, can also use a second 256 KiB SRAM and DRAM,
+  and a remap register shared with the HiFi4 DSP shares a further 512 KiB
+  SRAM (SRAM A3_2) with the core's subsystem. Its reset vector is set in a
+  register of its configuration block, and it exchanges notifications with
+  the Cortex-A55 host through the message box.
+
+properties:
+  compatible:
+    const: allwinner,sun55i-a523-rproc
+
+  reg:
+    items:
+      - description: Configuration block, including the boot address register
+      - description: SRAM A3_0, the core's dedicated SRAM space 0
+      - description: SRAM A3_1, the core's SRAM space 1
+      - description: SRAM remap control register
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: sram-a3-0
+      - const: sram-a3-1
+      - const: remap
+
+  clocks:
+    items:
+      - description: Configuration block bus clock
+      - description: RISC-V core clock
+      - description: MCU public SRAM bus clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: core
+      - const: sram
+
+  resets:
+    items:
+      - description: Configuration block reset
+      - description: RISC-V core reset
+      - description: MCU public SRAM reset
+      - description: RISC-V debug module reset
+
+  reset-names:
+    items:
+      - const: cfg
+      - const: core
+      - const: sram
+      - const: debug
+
+  mboxes:
+    description:
+      Message box channel to the RISC-V core. Each channel has a FIFO in
+      each direction, so it carries notifications both ways.
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: Virtio vring and buffer pool, a shared-dma-pool
+      - description: Firmware code and data in DRAM
+      - description: Trace buffer
+
+  memory-region-names:
+    minItems: 1
+    items:
+      - const: vram
+      - const: dram
+      - const: trace
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt the RISC-V core raises on a fatal error. The A523 has no
+      dedicated line for this, so it is present only where the system
+      integration provides one.
+
+  power-domains:
+    items:
+      - description: RISC-V core power domain
+      - description: SRAM power domain
+
+  power-domain-names:
+    items:
+      - const: riscv
+      - const: sram
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
+    #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
+
+    remoteproc@7130000 {
+        compatible = "allwinner,sun55i-a523-rproc";
+        reg = <0x07130000 0x1000>,
+              <0x07280000 0x40000>,
+              <0x072c0000 0x40000>,
+              <0x07010364 0x4>;
+        reg-names = "cfg", "sram-a3-0", "sram-a3-1", "remap";
+        clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu CLK_MCU_RISCV>,
+                 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>;
+        clock-names = "bus", "core", "sram";
+        resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+                 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_DEBUG>;
+        reset-names = "cfg", "core", "sram", "debug";
+        power-domains = <&ppu PD_RISCV>, <&ppu PD_SRAM>;
+        power-domain-names = "riscv", "sram";
+        mboxes = <&msgbox 9>;
+        memory-region = <&riscv_vram>, <&riscv_dram>;
+        memory-region-names = "vram", "dram";
+        firmware-name = "riscv-firmware.elf";
+    };
-- 
2.53.0

