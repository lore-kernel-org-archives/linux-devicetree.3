Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC8F41D21C
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557075; cv=none; b=uK637X2qwMpgGK6vLReHzMOXFwKgWoM2W0m4E82SO9AEDrqOCXleK6OFh091ItqRReqyhmNta1ljH99d2+KwIuTbKUq036YuWNU2o9OEBoWIe7n8Lo2EMK9PXAZJAWrsQ19tTp+buBv6fbxVaW//oEDCAFO+5f3oULpPIq3VlCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557075; c=relaxed/simple;
	bh=HugAla5NxeGvUAW6ybPWIq/99Qvbl3GRpGgOPmECK8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ax3yqDFDiBumQ6AZF4N81vIheTw6FtMz7X9L2AChrK1tpvY3NW2cT9Y1QoYx3jA331OFihefjITb8GLt9IGHoLcuCJi9su/QnhX+sflTFTdugpdcXpaiOCOoBErK2tZ9waEjmoJcgAko28lleeXAMe5xrccXLu7ig/3CsuYrjf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=TNtCKHYW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="TNtCKHYW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caed617615so17051855ad.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1786557074; x=1787161874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=TNtCKHYWkRW6NUzNGEQJ6BGzeMFtcbZnLYgwL8iMB0zG+0s20BGiUoZLdn4ZtqEHAS
         +WAXxCS+wAZNfDIqF50hez6FpfuLnZ1g/HbhEa+Y5YbRPIXqlyPIREICpuSWrZoaEz05
         3t/N1PwVzmeQ7HB882dPCp72mr4zs9qFM5FfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786557074; x=1787161874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=SsuF+P2Djg/gdJxApuR/94bwRQxF0X4g3pQaDSfHqWhhYNVM4/MND5t9D7IIbkSnJF
         6/HbKQSwrO7Q2Q36zMhOfgoRjlWg3yHKy/afU7hSIe0q0dzXcFG3ns3q/3kWt+QWqTO7
         nAiWFmvkXMKY67/3oMKOEwoeKnQtn29Tr5Ne+oC4QrSpRxA2SYoPSSk1tNrwQ0up+ql+
         TQLGU+J9OG1RcjG0i8ByAqbK7MoyHE77ekn93O/8CGyagJ/qn2naFz1Huh0tRvaYPzRm
         FApPG5bno+yu1MjHln0I+2wOSh2cCFwSXj0ohIbjWL5COdz/D00uDY+hVVf4fvhFLodX
         bMaw==
X-Forwarded-Encrypted: i=1; AHgh+RpmPk0wW8OSyqXcVx+s4hlvjzNJoYOnd4+CgnfxsepMHKhn1+59O87uH7Pj1C+1HiZlidvQMri8+q19@vger.kernel.org
X-Gm-Message-State: AOJu0YxLiQecMOhwXPZ/HiPPsz9bf3Xx72r4GZ3pR1lTicMTEbVq3OYD
	AGqiFQIgy7fyb6relXNx2dw/llCUbYbN6YlqF5y56DBNXFFnHinKRS2PCMnc8D2sePM=
X-Gm-Gg: AR+sD13WhNBI3GOSfM+2pax2LBakeTkgmucIg2ZpaZ+4ATxsNSd7jbjxXw3gbKR3VZD
	TF1mUlwaqTN3uF9dB6sC/P13HnCJVcrE/Ur8GRtPV+uXeX2kJRYtb9bHPweKBNUq7wnGqri4ulf
	Vt1pmu9SFpAFP655xs7Oz9uEG+RVHLJeAzaks1jLwYRuWiUw/L3hP6mWnDG9Bq5vRG0oM/KdupN
	2/TjKpZ6Jn96s83GU9xIHyD2c8dRZfpp3Gz8nzJE/b6t8KgUYZZhTaJYPjPT1IsZWjtYocVXd7o
	HzdAk6YURRoplYVaOqCxCKME86D7W9dJobJLiijRBskQqWD2BXZumxhQp0pVPviyQsuotymoXr8
	k09O51Lcqs04mj/V8YMxQsK5zOA0+xvMHT1eW3twiD4brmdkH7i8WxytaNQUymFdtrumAoLFq2e
	RMkGhUuarkvNqUVmp9jNm2lQ5fj0gBCjL64CkV7FGT4ixHD4YKosLdB0/riKMie+qL0Erp7POvY
	5L/ZrejoHfiChIOBGXByyKi095Rm6/tX9eatbycoJaw3RAOw36k456wW3nOlBciyhTSZ/jf/twF
	GrVbdLaZ/Y9N1SiqNkCe0IACEPDg
X-Received: by 2002:a05:6a20:1605:b0:3c3:a9e1:a819 with SMTP id adf61e73a8af0-3cc552bf23dmr198878637.24.1786557073610;
        Wed, 12 Aug 2026 10:51:13 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141245540fesm18482258c88.9.2026.08.12.10.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:51:12 -0700 (PDT)
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
Subject: [PATCH v22 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Wed, 12 Aug 2026 23:20:17 +0530
Message-Id: <20260812175020.666558-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260812175020.666558-1-pavitrakumarm@vayavyalabs.com>
References: <20260812175020.666558-1-pavitrakumarm@vayavyalabs.com>
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

