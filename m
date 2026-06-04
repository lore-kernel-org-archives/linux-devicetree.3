Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B25F492514
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780592006; cv=none; b=AUB0QDanBUpFJ/5ay7numUUOUHRn1FIukIL+jj4gXdHR5gam9Xuq/6KMQm4Rrwz8ymBwF/uHLJ57xu4QsrzlXQOc9mIWliCODv4RWqmMSq3NF+66Nom1uy/CcnUHZuQTWk3KBlSMYcnZN7MAm8I5y2saVSiwn4HcDFW/WPoo4E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780592006; c=relaxed/simple;
	bh=Pi3ty6ZmRfghCtXSjpKIOPSmrHPKajEkJKBaTvA3JEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tbpoXDMgrpWdUAcQA/yJboUTauqCyVuEcdeCxhXIFRUMouwSzQ/UC6eI7lrHgAm+lIFLWTFbFMGGCagj759aWSDm2B9mF/unH0QyI93N3M8Ql+N6UNraT5NCalLVgXhu8vMygLxMOEphHXKXzggKHfQTl34JTGgA7HY3pIacWPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=ALMPXl0A; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="ALMPXl0A"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso715495a91.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1780592003; x=1781196803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kztFs1HIc9U5D80MFSQD18XpUxKc9TZBddnvGjYw0h4=;
        b=ALMPXl0AH9JwrU2LXOf1dd9lK97CR5eGjR9dEHvEPdI7QziHCe5pVN64lhArSclXCE
         bKRF8zuz/7BcjEPq1ncQaopWm6BT3hCB44QmAbaAbRiDWHHG6s7gx9S9Ox/8udpLnBge
         vJmCsnCxk7U9O0C40xUzzR6MdY4OEXDWVjvMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780592003; x=1781196803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kztFs1HIc9U5D80MFSQD18XpUxKc9TZBddnvGjYw0h4=;
        b=gvdY/itpCPRnkuoSlLzbLOetn3gidnSoOwkuiWjBdOeNqZ9hx65i6VvppFNSOy4owj
         wAsmRDBlcSj82oRsB3vd5nercWXeB6eu+I7t82LQhHzsVLFYpDtqlY+MzTc0kEo8xOQA
         U1ZHyjn8rQG9YBtmYdRoc2CpTEpQGthVg8jqSxoCGRbO2sJi5q/7P1bhaSasKruA9LE8
         kyhpF2zuLckaHxCwPCYUSuh6o5icavtqBpj7bC05nVQtW+MOqHz/nMuxD+n7XhE/KqB4
         eOKd9BVjAfC6GF5WQIN/mMY4bt7gwT1QO+N4+L5HL3ipRYPvy3vZym3TY6Y1p5IeVwhl
         dh6A==
X-Forwarded-Encrypted: i=1; AFNElJ+xNvLQwQgUW6xOpBTK4KqKxa8Pqz9WUS1fMDRL5zOAJyEjhBblrZnNB9qloMA7LQA6sit88qu/Hgqo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/oNrGj/im5JowFX+0zUqpMo087I/zy3hGV+fvgPQ89elggmu1
	kDxzA3X3QBVRbgXV1rK5YKEGp+P38+65/3KSoOB+NEJQYAuAxi9jCOsy7T7Ly5VrdYs=
X-Gm-Gg: Acq92OFz02LKgtOAX9sxq6pHxnG2yq+BhBTV4f31R128YAfMlybdjpY8uwTTHJIS9EQ
	MwtSh2dT/8ixQX15FvYsT4/2E9bfaqc2nTAawWuSoxHxEmcawtzdWx8kL4RFUdlJ6yAxqZ2mqAI
	Cx8fwBeFTn1qO6vMPA+1Ea7gruuxJWlzvRy/jr19LAxgv5dzD3miO1ZhUB7EPdErIiuf07iT+tK
	5vm1jxtMCuFN/fYrvACBB8dstS5zibM/L67mBkb6T3zGGNvPII2XI9LZf2PXnhTd8Q4+7549/Pc
	1+mHkAZQFRyQfea0XwBfL2WFLfdA4x5FQZZR8o6RFC2ybw3xrIrgl2DQZGCalGfw7lGLWtqcH11
	dTeU5geJTFAPLDMF59AJHUGUs6L9KLuL8Slw7OnMw4NKBJUyiwzjIH+JmEd7EctL+UwRBl2BlKK
	aMrWy3YULMqwt3N6CVWWh7t6LdbJqOienHukQJ4iXZcyFS0OdGxM0KYe9jOw6MjvVYRvCGWmxwf
	OsFVuP4KrNaJj+cBHjKM7rJ74E9lHlrZ71HeuL4bECRHlIWtkjfIZmSTO5hI8FnelVc/j7PWQb8
	JA==
X-Received: by 2002:a17:90b:1642:b0:366:1bab:c3d6 with SMTP id 98e67ed59e1d1-36e30e13143mr8349487a91.10.1780592003243;
        Thu, 04 Jun 2026 09:53:23 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e7b53sm3689229a91.14.2026.06.04.09.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:53:22 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: conor+dt@kernel.org,
	Ruud.Derwig@synopsys.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v13 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Thu,  4 Jun 2026 22:22:07 +0530
Message-Id: <20260604165210.1141842-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260604165210.1141842-1-pavitrakumarm@vayavyalabs.com>
References: <20260604165210.1141842-1-pavitrakumarm@vayavyalabs.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/snps,dwc-spacc.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml

diff --git a/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
new file mode 100644
index 0000000000000..857e5c6d97fc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/snps,dwc-spacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Security Protocol Accelerator(SPAcc) Crypto Engine
+
+maintainers:
+  - Ruud Derwig <Ruud.Derwig@synopsys.com>
+
+description: |
+  The Synopsys DWC Security Protocol Accelerator (SPAcc), which is a
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
+        reg = <0x40000000 0x3ffff>;
+        interrupts = <28>;
+        clocks = <&clock>;
+    };
--
2.25.1

