Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559471;
	b=Eo8ehyyejMN3Goe26Zd3nGK7HP5uM/TaMpbRv++1SxwwfMQP/Il0t2miwmhSv5SamhiV
	 Uc3BnZg8kcg1BAhQz85xUWQwGQM8MC+Afn+eVduGh8atCIP7yF8GJaai8kzJ8w/VOtACN
	 tGqnVOqP+giGFvNoUnLC5chmwb6+ujZXdL/Z1NqSHBUgJH/gTrZJC1uLWQEZnJ+t71aC2
	 w+6bcdDgt9UAupwKQSdEt/8AtdKJ+oK9u90p3PJVFBD1NgrkkRNrHHvwzN2185CVEk+Nu
	 6otYZ/bWQ4fJHs5YYcuHl3lhUt3YiBQxjilBXE1Th65PIndJilft+53Ottsf0/nivNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
	b=UCOcshSNaWdqJrv9+KdMsu++2VzwPelOwfHlqJ7KxrIF+NChxe1EuGW2ldOZ6ECR8sku
	 NniNnauhWoj/6zlggEnJ625u2jYuhFdWSZtgvK2nXWKBoxCzt/uyq4BGBCxIJeZi78uqP
	 KW4b8elyHyJPZ7DgbWKCnZMIDFHsaKTLFIVRbdsKXHmR/D66BHX7h4jfSZFRWk1C7c0un
	 u7PD9Z+qG+YHCA5bKHKKSwfQ0v1XQesdFkBWp5Qf6Woh47EDNbIGbtj2gdr2/CM1ORHRz
	 nhxW4L5fqlfn0OkImwSa2xadO4U/vaeL8/7KgY8vgEOWhCnpEhuHG61N65d9G0QPdrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cx1AxKqJ;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC32606A333
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 18:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCC32606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cx1AxKqJ
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0a921ee46so18804687b3.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 10:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559470; x=1794164270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
        b=cx1AxKqJ3cO8+MrbxhYBhwO3vryfS6TnRAiWbiTqopVW+Ze8tWFnp26wPERRK+DpuG
         yoMdC7jHPG+orucKzYf9/2QHyBloDK3LNbIp6aomvArA1dYfG5po9M/Sw3T3MZaZI0uY
         rS8rwdSOtKlGMcXNwR+euwmkFX4N1klDkZSu7wD7tJzOVrKd7EkGbWQB1IExcDYxqZce
         5W4kRsxO9xwhU1dv9X7J1J4TniK6Fw7zDNTo1Wx+m0MyqHHk3f51JDRxWS+A+ZFRnagj
         XyGplyjMPdg+Y6LR+vRd+Q685JNuuRKUHcs5L3OGKqlU/OZ9IEYbJSHmTtBCmFJEFEp6
         zY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559470; x=1794164270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
        b=oq8tKo6tO/nLbpDcGn9+ys85fwFDuRAystepH6D6O59xA6eycSpuU3G4P1pV8Hgudb
         BRw2scQPEUED2fnega03EksvB4w6gFiu8J0pjsDy4WUg+5/bQXblxZEcBYc+Ixy6sADi
         McEMWv7Slxurg9vygjP17kLpadq9yTrcOucRE0SdTxrV9125/ZUA/7UPBt9rwrkoGcr0
         6fC6egTcAYaQz6SUFE3ABkwMdD0GR++TRpCUknJXakuf8tThc4h8vLYieIZLAD6mNMuU
         pYWK4Sm6wg7MlQanCbwKAR0oW/fwKPn7zlzOVakSYkEy/z3wQlF6Rlgrd7eu/3dzoHKw
         ZZxw==
X-Forwarded-Encrypted: i=1; AKwUvBwyUWnyIvlx5+L81V0Tna2WeVEKC/uITw1+56BXL5plcrQdcIL0yXoGxJ78779ZC+2zG+uReSS0vVC5@vger.kernel.org
X-Gm-Message-State: APuU4Z+ER8xTWUZVbbA3qSekvyDXvnMkmQKLkW9I2hyIVcp/oJGGPr/N
	F8Exa4Aljf39AWFpaByCiZlniWPAC2bw3Zbb007OHb2PyT11SumJ5UoG
X-Gm-Gg: AYBFou19GkmlvTlko36i9AaUctTZKKMzM5erDaXScVZzEr7kHW2J4jAectaIgqE9/px
	iNKbJxxERHWQ6XvF68d+mQO2rvveSiwK9a1ygQA7+Zr7HHMcdNrjSUzllYXkDcQEodne62xFcOB
	Ib9+daI3o9DnDacpFtWUWJKHEjNxrl4/Z5OE4Yn7BQWz0rbcrra6mClpHF3CITPhJgM5M8WbcGX
	T2LdQz4NptnSCmJoUs1T2wGqZfe138OQreWU6m4s2U3kYGsNX6jKAz7UHZGhgvVTluSY/FBv7aU
	H84sNSNwwYko4iiuug7D/PepBaA/+h7A6ckNBhg/Q0+KesAxEVr+Nnp9OUUFDXBzuQudKHfEG+e
	Nyz7z/SvvUavmk0vhcU5Dnbc/yAkxdGxVRuG9CGw1gJLY01VyltdhJGt92eRTB8R//X/UsQPXLh
	nxnDvGb6gkrY0oI8Btw46QDqjX1NfIUfOA0C65C2duvcXcnzcwI7vkxSwrzoWkVCerRnHsP7hwN
	ydFg/Wl9EibjdCv9JbePJAvP4W+aMhPWFa5JsYB019JZ5u3OrCMSqfcFLddclnZPkBwp4Bmutfc
	Y/8rwTWrXrmXcnvruS2q/uO1GX9kmm5S0VcVaoWv04yHqB4IdNK1gkLINbQUaIwWe1c=
X-Received: by 2002:a05:690c:dd3:b0:8b1:b916:69f7 with SMTP id 00721157ae682-8b2b671f289mr46540577b3.55.1793559468878;
        Sun, 01 Nov 2026 10:57:48 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:48 -0800 (PST)
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
Subject: [PATCH v3 1/7] dt-bindings: mailbox: Add Allwinner A523 message box
Date: Sun,  1 Nov 2026 12:57:29 -0600
Message-ID: <20261101185735.762559-2-tcmichals@gmail.com>
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

The Allwinner A523, A527 and T527 (sun55i) message box connects the
Cortex-A55 host with the HiFi4 DSP, the CPUS power management core and
the XuanTie E906 RISC-V core. Each processor has its own register bank.
A sender writes a message into the receiving processor's bank, and a
channel has an 8-entry FIFO in each direction.

The host bank has 12 channels, four for each remote processor. The
binding lists all four banks, since the host writes to and reads the
FIFO status of the remote banks, and lists the bank interrupts in the
same order: the host bank read interrupt and the write interrupts of
the three remote banks, which every A523 has. Each bank has its own bus
clock and reset, and an unclocked bank drops writes, so all four are
described. The optional allwinner,tx-done-irq property selects TX
completion by the receiver bank's write interrupt instead of polling.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- One compatible, allwinner,sun55i-a523-msgbox: the A523, A527 and T527
  are the same die; the A733 entry is dropped
- reg, clocks and resets list all four banks in a fixed order, with
  clock-names and reset-names: every bank has its own bus clock and reset
- interrupts and interrupt-names are a fixed list (arm, dsp, cpus, rv),
  all four required: every A523 has the four lines, and
  allwinner,tx-done-irq only selects how TX done is detected. This
  answers the v1 question of how an interrupt can be optional; no
  free-form text (Krzysztof)
- Remote bank interrupts in the example corrected to SPI 181/174/205
  (T527 manual, Table 2-15; checked on the board)
- reg: the DSP and CPUS bank addresses were swapped in v2
  (0x07120000 is the DSP bank, 0x07094000 the CPUS bank)
- Add allwinner,tx-done-irq
- Description rewritten to describe the hardware; "schema" dropped from
  the subject (Krzysztof)
- Samuel Holland dropped from the maintainers
---
 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
new file mode 100644
index 000000000000..47b6fe304dbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/allwinner,sun55i-a523-msgbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A523 Message Box
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+
+description:
+  The message box on the Allwinner A523, A527 and T527 (sun55i) SoCs links
+  four processors - the Cortex-A55 cluster, the HiFi4 DSP, the CPUS power
+  management core and the XuanTie E906 RISC-V core. Each processor has its
+  own register bank holding 8-entry receive FIFOs for messages from the
+  other three, and a sender writes into the receiver's bank. The host side
+  therefore uses all four banks and exposes 12 channels, 4 per remote
+  processor. Each bank has its own bus clock and reset, and an unclocked
+  bank drops writes, so the host needs all four. A bank's read interrupt
+  goes to the processor that owns it; its write interrupt, raised while the
+  FIFO has room, goes to the sender on a separate line.
+
+properties:
+  compatible:
+    const: allwinner,sun55i-a523-msgbox
+
+  reg:
+    items:
+      - description: Cortex-A55 host bank
+      - description: HiFi4 DSP bank
+      - description: CPUS bank
+      - description: XuanTie RISC-V bank
+
+  reg-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  clocks:
+    items:
+      - description: Cortex-A55 host bank bus clock
+      - description: HiFi4 DSP bank bus clock
+      - description: CPUS bank bus clock
+      - description: XuanTie RISC-V bank bus clock
+
+  clock-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  resets:
+    items:
+      - description: Cortex-A55 host bank reset
+      - description: HiFi4 DSP bank reset
+      - description: CPUS bank reset
+      - description: XuanTie RISC-V bank reset
+
+  reset-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  interrupts:
+    items:
+      - description: Cortex-A55 bank read interrupt, messages for the host
+      - description: HiFi4 DSP bank write interrupt for the host
+      - description: CPUS bank write interrupt for the host
+      - description: XuanTie RISC-V bank write interrupt for the host
+
+  interrupt-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  allwinner,tx-done-irq:
+    type: boolean
+    description:
+      Signal TX done with the write interrupt of the receiver's bank instead
+      of polling. A message is done once the receiver's FIFO has room for the
+      next one either way; the write interrupt is raised while the FIFO has
+      room. Without this property a full FIFO is polled. Received messages
+      use the host bank read interrupt either way.
+
+  '#mbox-cells':
+    const: 1
+    description:
+      Host channel number. Channels 0-3 reach the CPUS, 4-7 the DSP and
+      8-11 the RISC-V core.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-ccu.h>
+    #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/sun55i-a523-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
+
+    mailbox@3003000 {
+        compatible = "allwinner,sun55i-a523-msgbox";
+        reg = <0x03003000 0x1000>,
+              <0x07120000 0x1000>,
+              <0x07094000 0x1000>,
+              <0x07136000 0x1000>;
+        reg-names = "arm", "dsp", "cpus", "rv";
+        clocks = <&ccu CLK_BUS_MSGBOX>,
+                 <&mcu_ccu CLK_BUS_MCU_DSP_MSGBOX>,
+                 <&r_ccu CLK_BUS_R_MSGBOX>,
+                 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+        clock-names = "arm", "dsp", "cpus", "rv";
+        resets = <&ccu RST_BUS_MSGBOX>,
+                 <&mcu_ccu RST_BUS_MCU_DSP_MSGBOX>,
+                 <&r_ccu RST_BUS_R_MSGBOX>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+        reset-names = "arm", "dsp", "cpus", "rv";
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "arm", "dsp", "cpus", "rv";
+        #mbox-cells = <1>;
+    };
-- 
2.53.0

