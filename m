Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734DF400E18
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179503; cv=none; b=UiK4Xsoz3Cqhj4X2nn+9Mvml3Fx3jDs4y2UuzBbAXFKH8mCzDvTQNPS1oyKIUt19Q8r72OQZGqFuPjxxxGr16dgqnXX53KIVebaeoy+KE4J+mk4LwNCKLxTqL0wSQZL81BUUloFznoNj1FWSX10ATXXe97J183m4pfxWuprqoAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179503; c=relaxed/simple;
	bh=HugAla5NxeGvUAW6ybPWIq/99Qvbl3GRpGgOPmECK8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HpFJRiM+pfoUmuz7SKnvQSbCuzSea6fkLu39WndkjSwFTvI5O8AJh+w4jtiHV3mCPGdYciQkBEiZrYkw4I6Na1xFQ4K8cOCiLXNUKiinm9BR3DRjdp7Hhix5VQusjJySBxPBYgXrBXO430Llbqnor8kAJBQMOwRTfeBDIHHFw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=Dscyzzj2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="Dscyzzj2"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3405879a91.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1788179502; x=1788784302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=Dscyzzj2sDEXM+uM48O518jGnYVBmpf5uiq/P1gNpoimaHk8rD+Cbk+5t7B9WuYBHD
         yyWOm5dTZWdK7YJJVe6lrBu98BGjh7M8fSS4lFK4mzXN5lm5tSqi0YTQV/7VtbZAQNXR
         cypr8w4NkvmH+Tugb0qCdyux1uib5ZrYlYdAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179502; x=1788784302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=VYWHbNBoeewJ9LdGde1mV3T2JsEhHocR53NEE5LNVPKsvn2ukyb2HC/C721UuLq4Fk
         UnklAjbbmj/bJwZiuHGWkYHB6ES0ezFMK7uS8ZZR+Dqo5qjROAvuIGCWRUsgUUy02VRK
         b/iPXcOauB8UQS73clT9OYDdNlbej1vlm8NF6kSUWLJ1U29gS/UTe//EY/Y9VjML7gI2
         Gd0RCX7Ylslzmlel6Nif8Ye6DBXo0UGCqWMUedUtrHlPbmbyfCEyLt0dqFK/2bv8ak8O
         NhgBjxx5pVbcI2FtIsb1bwbwVhtP7bbMijmJbJ5hvHIAlwg4P2zqtEiwjNqKAb4N+3Q2
         Lw7g==
X-Forwarded-Encrypted: i=1; AKwUvBzjfmXbqfyOnoOTmkRwTOYjU/dK/jpdY+7fmEAhw0YOeFhZUGpiTURlwh76HvHapu0LZE2FbwOBXLAy@vger.kernel.org
X-Gm-Message-State: AFuF++krgjhSN3lKGmD/cVZCrYV0XY/esJK9SqyytnqpeuCIhnD6SPKD
	i/4Bao39hoeKPOZHBgt7MBv+3y6S3cidDcS0GHiATYrvNP6xS2Cxoz/mJIaFiiX6c5w=
X-Gm-Gg: AYBFou2FAjHJLE3V8qPcIRQrLZfK6Jxg5D+P/L2nUyr/UPrDV3DMPYEmu9y84ta37hr
	8qUIg8+vEZk7H//Jzo4ctxXZ8AXjX8Hq1jC8kAQjRbti+06omjkZpuVd0KgC5nJN5jkNxEXMvUG
	vJPUJuoihwI67wdSA90L6VS63qP1I59aZZYWZ25mG/N8Tl5TWG53zqSyxHBZtf4LrzD7ewnhVXU
	xPgd6U/VNtsf+dNkvFppkdNSDm+rLBpQ1K0QmwUsYcdguUo5GWIkJgFWhLAw0gZ4wyjTTkDZkgw
	3vyePYenSI1Cc7y62lPnnD42yqsI3LK2R2wxaRHltAfAT5L2bWd+hYTf2mm/KPVwgImM4PsNjhw
	mph07HQcJ13kCTn2M86LnRc2g8r1qjC/YkPq1kUiMUAIm/t+H7WxTI0Lr4Kff53lIuostpdjC13
	kM+5L89T5NPMmRp1lUXQPNQV0RElEvFLj8IFO02IczZx7JR2t9nO3L5Iz5EqXO+7c6L4GxzGSlb
	b0L7j8czelPsgPtCbxbomw62SRfLn5wg2xRoD2YHezQdzIGCcOu0zmbDtgQrKuk8KIqbcQoDPY0
	L5nEEjZ0o7XVu4AEdazr/SMUFZMq
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-396d0ed8eb2mr38352172a91.9.1788179501530;
        Mon, 31 Aug 2026 05:31:41 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm27470376c88.5.2026.08.31.05.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:31:41 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	ruud.derwig@gf.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	nazim.khan@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v24 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Mon, 31 Aug 2026 18:01:10 +0530
Message-Id: <20260831123113.870832-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831123113.870832-1-pavitrakumarm@vayavyalabs.com>
References: <20260831123113.870832-1-pavitrakumarm@vayavyalabs.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings related to the SPAcc driver for Documentation.
DWC Synopsys Security Protocol Accelerator(SPAcc) Hardware Crypto
Engine is a crypto IP designed by Synopsys.

Co-developed-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Signed-off-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Acked-by: Ross Bannerman <rbannerm@synopsys.com>
Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/snps,dwc-spacc.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml

diff --git a/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
new file mode 100644
index 0000000000000..a337f7b473cc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/snps,dwc-spacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Security Protocol Accelerator (SPAcc) Crypto Engine
+
+maintainers:
+  - Ross Bannerman <rbannerm@synopsys.com>
+
+description: |
+  The Synopsys DWC Security Protocol Accelerator (SPAcc) is a
+  semiconductor IP designed to accelerate cryptographic operations,
+  such as encryption, decryption, and hashing.
+
+  In this configuration, the SPAcc IP is instantiated within the Synopsys
+  NSIMOSCI virtual SoC platform, a SystemC simulation environment used for
+  software development and testing. The device is accessed as a memory-mapped
+  peripheral and generates interrupts to the ARC interrupt controller.
+
+properties:
+  compatible:
+    items:
+      - const: snps,nsimosci-hs-spacc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    crypto@40000000 {
+        compatible = "snps,nsimosci-hs-spacc";
+        reg = <0x40000000 0x40000>;
+        interrupts = <28>;
+        clocks = <&clock>;
+    };
--
2.25.1

