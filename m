Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649453;
	b=hV2iDIUUa0/UYSSvKkujMwiIYqw2TXq7ts1I6hHGowplnRgc079q/bKbjHGT0ymjDLcB
	 uo+OekHUyL/URr8riH/jYh/LaWeqxEUq1kZXojfJP8EozcL1hXz/8KgXM3US9iuh5fAAZ
	 aWwqLinPfxmkb1+9WDaCGYelOs+HIBgKfr28z72f2gTLks8ZO0rUcSIHzDTqEg8I1v2HJ
	 XBM2hI+nn4qVOI0lsmQWRN+BAvvfZSBuFnR47Ylk9C9jDpZgFM1myL+5N8yE3pb9p6LEM
	 SqHIbwc9rbOTkyp9gqhg0teGglbcz+pOFSLvArViDrg7EnW2iRLJnBwY0YXH0PfB1ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=V5JhfCZN21w53Q+VXqNEMxIRzxDLInZAIKyThM70aLU=;
	b=iiNNqybx3ZzNjIlxsOGY24e6KWEW/HllNCJzq6s0kE3FfsOyKZpZ7zxfacfdUVAk7cQi
	 NewQgjB7S+XUyNzHcMcpx4+E5a47i2Vm8IsTugE2p+0tXpbnoyWaXjd3RRF4FgMaURAMY
	 Flwirp2M/kjb3nK2F3SQTcyzCZzVO+3YnTkW3OAxGZ0YBs6tbAhAeLqK282ab/4+ebcQA
	 vzys2rcSRtQ/f2MPh9rLf/E02fttKy4SF5+iO0oA3jR5qUzxAOudtDNYw5cjsTxk3yiFF
	 d79UPq3hk6pDjRE3GaEd0mGuDc6enGIpq9tbdFNu7k+7YmoKbvgp3phGHyHT9WuPBHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gy7qfxfe;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72173606A334
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72173606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gy7qfxfe
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so55702875e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649452; x=1796254252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V5JhfCZN21w53Q+VXqNEMxIRzxDLInZAIKyThM70aLU=;
        b=Gy7qfxfeNjsYBuoW5vvOu6ERUxgbGo20MBPz8ckzDteAy3zz6XWRUnZs0M5lF5tZ1U
         TVod5Bv7bhPkTwF6lnpU5qrge0QV5RhsHAEJcUUXRpqnKBMAlZPFElrCtqsZoldfSSM9
         wn+MdYBT+GSf90P6Pb4w09NC0TZEL6Nm3tV79RlfqtJAMZVfi/DO85OyappPsYOHBh3Y
         kOPbO3K9lAA4MTTQQCCsUgp5dMhOph5RXqe2IV/X8TS58HlVI6wf6A0Q4Lk2yTMEU08N
         HdEQ6SU0d5jHynz58X4Qf3qHuI7AJqTirwrhGnSUw6xJYk1XI39KRHx1GWHl+m+LfCXe
         rhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649452; x=1796254252;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5JhfCZN21w53Q+VXqNEMxIRzxDLInZAIKyThM70aLU=;
        b=CtvAXkHFdZXI/JT+Eg/pOTAr3FmbzM/HMTDKwFoKcyak1GIli+CsRUGOOvfw43dF/X
         4nALwT+EPW3/OjJ9MRZ5pxBnVoVSs+PTH93VK8k9QREGB57q5v80Xh9Olw2dCRG8bNmZ
         P3dhIGmExpxGTH0lqVeLRlAP3wHz06BAIjfk0zK86wQ5HDvla+k3PM36sHAn1qFdmGR0
         8CccoPFzqZXdfkcrXtk4TZGCGYpScutVMswTOranZWvMNkTgYUU0BKFyo1osaYx0KBwD
         G4u/7bpMH/zVnlsEtLJHwxguNZBR7vjTdIDXgS4I80dhZICrMe0I0WvkIiRTobK0DJkz
         tG6w==
X-Gm-Message-State: APuU4Z/PnJpBFLn/T9j4y4kpfm/CvtDkhXHvFSYE/PtuC8+BYYSvciDt
	BvCEyE7Kp16yoYhUWdxR66P1F8JpvU5jGeXA2N0bZ+96hGYs1mYRAL8e
X-Gm-Gg: AZFdTZdAyYIEdhDLQ7fF+I322/8jXJT6p4eb504METq6mlwI2OpquYzIuvTgctvB+BH
	LpMcpxfjunPzOxpBwGr4NiD+Qund+Xej1RHBnjVWdrZsD80DcokN90657iAV5vqwt5sXwCqmozh
	Gz4Jx7hSuvCAQ9npjQl05LC99Jmjr9memhml/Febfv278d2AZ/ucKN41p5xR6w/Mmf8vUio1kNH
	JJmJ1i8wxdd0NNwh0m7zNBgSFOBUamGgRK8e4HH1o1uxnu2T7S840y5Wuz5JTwlSYD1gmfiQhe/
	fZKd/M2ARIiip3Sqb8xZPLz9idij6NSrZCPVSZMAwSPo3tSIyS2jXdG1oUyvSfkAH9nHnwMq0KL
	gktEGQ5eU+beoughXpnRD24/3ubXWuClC3/LXn9h0xUlzoh2lTNZq10d57LWwAxsa8PRMvCiXW+
	0YIicmvyk5azmS+Bdnwb1H5jakDFRT8WDux65K4JdZzXcUd+ckFhkWPPUA835csQMUVDEAFHYYm
	bWnINrtvQ9CrOG73G5UkVlkHMDDDD7pdBR+uVq8OsThiyPgMt59lL4tMmk+wU73+K3VtzF6SWfg
	AuUlHxl66WT4Lga98tJMmLFn+JGHN9J9zWvyp+EKPIh48gn6LDQrYrdiRIvw05iESy+hpNrNOsp
	lIV6K+Dr9cg==
X-Received: by 2002:a05:600c:3b88:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb888078a8mr440446035e9.11.1795649451797;
        Wed, 25 Nov 2026 15:30:51 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm525188055e9.8.2026.11.25.15.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:51 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH RFC 05/19] dt-bindings: interrupt-controller: Add Espressif ESP32-P4 interrupt matrix
Date: Wed, 25 Nov 2026 23:30:06 +0000
Message-ID: <20261125233020.1380594-6-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe the interrupt matrix that routes peripheral interrupt sources
to the CLIC. Define the interrupt parent and the two-cell specifier
for the peripheral source number and trigger type.

Tested on a Waveshare ESP32-P4-Module-DEV-KIT.

AI assisted with drafting and validating the binding.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 .../esp,esp32p4-intmtx.yaml                   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-intmtx.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-intmtx.yaml b/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-intmtx.yaml
new file mode 100644
index 000000000000..20f36c4f45da
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/esp,esp32p4-intmtx.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/esp,esp32p4-intmtx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Espressif ESP32-P4 High-Performance Interrupt Matrix
+
+maintainers:
+  - Vítor Hugo Silva <vitorhg20080@gmail.com>
+
+description:
+  The high-performance interrupt matrix routes peripheral interrupt sources
+  to the external inputs of a high-performance core's CLIC. The matrix can
+  independently select the destination input for each peripheral source.
+  ESP32-P4 revision 3.x adds three interrupt routing registers.
+
+properties:
+  compatible:
+    enum:
+      - esp,esp32p4-intmtx
+      - esp,esp32p4-v3-intmtx
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      The first cell is the peripheral interrupt source number in the matrix.
+      The second cell is the trigger type as defined in
+      dt-bindings/interrupt-controller/irq.h.
+
+  '#address-cells':
+    const: 0
+
+  interrupt-parent:
+    description: Phandle to the CLIC that receives interrupts from this matrix.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupt-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    clic: interrupt-controller@20800000 {
+        compatible = "esp,esp32p4-clic";
+        reg = <0x20800000 0x10000>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+
+    interrupt-controller@500d6000 {
+        compatible = "esp,esp32p4-intmtx";
+        reg = <0x500d6000 0x400>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        #address-cells = <0>;
+        interrupt-parent = <&clic>;
+    };
-- 
2.56.1

