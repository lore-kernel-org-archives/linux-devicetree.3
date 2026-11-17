Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936680;
	b=kANRdAA5uyM5NaqhSOgSSX6rpTVVdW7w6QbAEM/Ex1nQVh6mhgBvlpEofnUkeQWbo6uQ
	 VyytYk3OuAiK/5o4CowuEXKlDTST1kpd3k4+UUpPJbV+u7SzXyoASICXeVkqoVyXWwZY2
	 GAg8V63oVMbkfs3qNxlaNhBLlGDdkXGJcCHvzcJQUFjwUoXEkgVLqIAZC4XbLVgGyI7gv
	 4eQC9v9JAnhl8nk6XBtWCi5VvCG+tXSeUPo3LPxs5Wzo7zm8nhCTjmnAL7dogFC7PxSJi
	 9qcce7BhQDx5LGfvUWzcCKgw306WMT6cqdRzFD/ST6FYMPgK2oHgtvpYrWFqfhv/CDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=;
	b=kmlEMTyJaG8PMmpxZIgHFm2AiLeFzUlf71dKn5HUN6XmEZZ+s4w8PJvHHuntSdZqbxPP
	 eNbil11983ds51v53+ZPPCgEs3RtrxpGuPzily7gJ2OH7pCvqK75IncHmBa4VY7mfhOEO
	 2AtO5NPTCcuM+zLa0Z6vtuEdstWR4O6BShnjdmJQpW54++/43apWvSPRzVoEClvF07HvU
	 xNxbeNndJZrKHHMMdkA7U0HrbR1pkozGuC1Lg6xjaBujmffbwCqRSi+EKIo60E+dEL4p9
	 64pHMTQG4vHJKSmzhuvPv51/SGu4jPDCi7kVCJjFkKX4Da0wVkXu1AN8yR9UpkmPXdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e6ei50fN;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27094606A330
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27094606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e6ei50fN
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so1084335e9.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794936679; x=1795541479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=;
        b=e6ei50fNgiwaj3Roi4rb3gGbEqZtS1SvoZVotqNQr6DGjS/FJL/kSWq2LkmPPk8+/b
         4N3Nnf/1clgVjhxFZ33uG4feiNDB5Kp1y/63cOEVQoFud3nRRr+B+pT3boauzhPKbbOK
         Ku+YPEh9oppI4L/MjD+Rqe7xRFpMTU+ZKEvczeyByOLPooVSd+kObZCiuWmBMoYsofSf
         TtZRJmnonzG6IDoKP82vSaYQmSXiJLgN4mHEbPCeI6UmFhlXydcvI2VrvkzM7aF5ZQnq
         XX1yqEuiWNLszLgw9abNaPB3KEfLRBvJ1FfNMefRkLDG+zWA7pxzPOqm76BtM0d8HYUv
         e8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936679; x=1795541479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=;
        b=a1KuLVylB0cKgRPfcN1SMdtgiQk+UYwE9fai61rsyFFd/LYoBGU38krHlg+f2qku8I
         KmHVZaNpLOvD8hGup/iGRfFM6ua3wg4NUoZvnQlOmdfw9xCD6SR0ETvP4r0drbSauqO9
         YQG7KChjqqmBjLN4DbMV0+zMmoJ6LTj1edepHiy7lsA30/K056bkMsf4P44zTjpPwvl7
         8jV/u7OP35QHJBS05vAItEqbpIFZfzGKSGU00vjnfVekq37IDq1Ics5fG/47fCVEahfl
         LA/knatlkLDAOxWEkZfW5aNLUPktObUo6GbsoIOfQ5G+XGsPK+6Gi2IIjvdaNFyv5EOS
         l8DQ==
X-Forwarded-Encrypted: i=1; AL+hErGJtt+6nToDoq4udCLTKjZ0SNnRzyoT62LjxRvboUn+exA/k9KD3d+I12sHvim1uMfbIZIuRrnGrqRR@vger.kernel.org
X-Gm-Message-State: APuU4Z+nE2fGLPXtxXOTWjKGOv/IGKXlqaHB61o4F1i72ZwZMG989/iU
	UQ1K+HPwhV9SUSHNVCQYnTTsnmmTeDeTp9GxcomDVx/Otp2OuPFeD7PVoMjAW8hbO4o=
X-Gm-Gg: AYBFou3bW8xn9yq1O4+064ke3MiEuqTuIesFnphs4zB2W+9YqIM8B9mWgATnlvXN1k3
	dakbNEraG7uXs4pVu0JgVnl0QQpo7LLbVbRbuMGSBu8Mw9pW1bxOc1IYO/AASHunyF2puT4XJ2L
	LQPbkaxvTCydtx/sAZBXfrx+1JuJ86H0egdyJmrKicBCGnHkixbw/d0PHloM9F+H8Pb8stkw9Vy
	hk1eH1FgP51gDJkwr+0BinKNHwpXAZp6wknPwah1yI92wPFxgKUlfyoBcJpynaUKKRdx4B/7ZSn
	BfDXZLG9YqSb6JSf0CmAYw4f3um9GIq2hLUD1We8hmvuKRMrPsWaIwaUZs8JO4yqW6IJDdNsHTN
	hLkPKuEh/0mBKsg7dzBiXk42qyyFhrTLMCYEV4NU9eeUWExTmIOQ+1m1ho++Gv/d1oimOJnq6Nk
	NOv5DstPGJVIemef09BlJrFrzWgwSXrQC6TC55vcLwffU7ySSDX5fzjKbdMB+fLD6LnM0rQLYeu
	XwOneTE4rzUFQxFMopTHpWtLHsB8Z/FKH+FemevfRqF+bsMQ9ABG6YYdOa4zAiitc5AlkMTrPi3
	fNrd9hkzxi6WFaZHqljhbji3AAgpUw9XZauNexkZKxytX8ISuGHIY+iU
X-Received: by 2002:a05:600c:3547:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb55a8a402mr298153595e9.28.1794936678575;
        Tue, 17 Nov 2026 09:31:18 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm46870735e9.4.2026.11.17.09.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:18 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 17:31:04 +0000
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: Add MT8196 SMMU
 wrapper
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-smmu-wrapper-v1-1-229f04d9f693@baylibre.com>
References: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
In-Reply-To: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

On MT8196, a MediaTek wrapper holds the integration settings of the
multimedia SMMUv3 and merges its interrupts into one GIC line.

Describe it as an interrupt controller, in its own node next to
the SMMU.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../mediatek,mt8196-smmu-wp.yaml                   | 70 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
new file mode 100644
index 000000000000..b841d9d0e3fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt8196-smmu-wp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 SMMU Wrapper Interrupt Controller
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description:
+  The multimedia SMMUv3 of MT8196 is integrated with a wrapper block that
+  collects the interrupt outputs of the SMMU into a single interrupt line.
+  The wrapper latches each SMMU interrupt and keeps that line asserted
+  until the latched interrupts are acknowledged in the wrapper. The
+  wrapper also holds integration settings of the SMMU, such as clock
+  gating and system level cache attributes.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-mm-smmu-wp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description: |
+      The SMMU interrupt source:
+        0 - Global error
+        1 - CMD_SYNC complete
+        2 - Event queue not empty
+        3 - PRI queue not empty
+        4 - Performance monitor
+        5 - RAS critical error
+        6 - RAS error recovery
+        7 - RAS fault handling
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mediatek,mt8196-power.h>
+
+    interrupt-controller@309e0000 {
+        compatible = "mediatek,mt8196-mm-smmu-wp";
+        reg = <0x309e0000 0x1000>;
+        interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        power-domains = <&hfrpsys_hwv MT8196_POWER_DOMAIN_MM_INFRA1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fe23913b1e43..5cc65a753ad2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17223,6 +17223,12 @@ F:	Documentation/devicetree/bindings/memory-controllers/mediatek,smi*
 F:	drivers/memory/mtk-smi.c
 F:	include/soc/mediatek/smi.h
 
+MEDIATEK SMMU WRAPPER INTERRUPT CONTROLLER DRIVER
+M:	Alexandre Mergnat <amergnat@baylibre.com>
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
+
 MEDIATEK SWITCH DRIVER
 M:	Chester A. Unal <chester.a.unal@arinc9.com>
 M:	Daniel Golle <daniel@makrotopia.org>

-- 
2.43.0

