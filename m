Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763D638F636
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805870; cv=none; b=rll8PHpTUcY6MGkbh7NtG0GYIS2OS+FDVvNBMXgzSZB8R2Uy3EgYjUB9YYAUeRnzTHCfyOClhW0rWweqPjoWLHmhrk1dMv3Cwtt2xxUpMCuhg0KlIyjwEZ0dOwfAGamH5nO6Tw7rnmvFb/+2Q/4NWRCo+vNlsYcaiUeqryDTJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805870; c=relaxed/simple;
	bh=HugAla5NxeGvUAW6ybPWIq/99Qvbl3GRpGgOPmECK8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aGPlr5W9/qy5cfaOu4U8Zo6CT8oj9zuSuRfTTsdsrcuoM0hpWHym0Z5Ich2zF2jQI3PidVO8/TcP0NkNh/qjyYLl51/IgvpqqFrixX1+wDbEdhE0FbeCu2c6Iwq6ix/mLrvQ8jjx4AH66YOxmDzeJZqk5lbNzWfI4Q3FAHgJPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=KHmq8oSB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="KHmq8oSB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceaf8a1265so4863805ad.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 21:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1787805869; x=1788410669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=KHmq8oSBZu4Vouk4iWHX+Wm1bsXg/9zJQfKaz90DifWgnAGLVvHs+dsrA/Bfqj+wqi
         rk7eMXzTlPlj79RykWUWnquagVHzvLpdIepOOSLKMinctbFIadxsOwLfi5ILMLNiyN7/
         AkBsQQVVeMHcw4WcVLXn+It4d2BZIE2ZyJgJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805869; x=1788410669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=T3RtD/BGVyOvlGZBos/LR4oXZB/YK1aMnmYvYk32t/vhszJSTUqhXZZ1y/BXxY0mB/
         9eShnQbXO9c+UKeyM1kmJVevIUvyciILKqlJDxwvc2ASrHnQkgpFySXlf7YuIT5LirXm
         MDWPYJ7QyCEEK0ofB3q/fjf1yQdxkXYja0yfT9ZzE3Eyn4Fuc4Sp8Nvy8vHnQ9Z6s6j9
         3QDCsZI1sYGiQpJM5PPeLeh6OA04kDgapj5rGmXdkNfr5FEhIPUq2k85SLtE3yatMIlQ
         qPyNqWDlwNCU4yA4c/AJYW1VrUO/tG0usxVhsh4f45SgqDGnBv+pLzWAdjBDOus+uWy0
         7AZQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7X3SryZXP/ebQMcjmIHXI9JU7YOs8WKDK6ZAn3gN72IchQlSlqBwx058qOs5urrmjLA2W4Sk9Uq4G@vger.kernel.org
X-Gm-Message-State: AFuF++leQ8X/iTUJxNo4rR3PK33oSuf/+CDOikW0bVNnrB8qftqaeW6B
	485vrxpufUjCivfMt0m3Z0vAXcovn0s8uqY3pO+9j1ZoBPkpP+OGcNYL57basTtXng4=
X-Gm-Gg: AR+sD11OmqdgC4g5ab1pVMRPRry52YRytv+bxTPES5SMDgXK9MQee1nCBJ8tShFxsyu
	vk6WQGN5BBkJPsxn9lrnZCQN4es7i6MURyqozRE72Ef9B2Av3oynTxAct7VH5gVklUZolw/6YBJ
	aH96RO5LgvrnOlFBf0RfwOyi0UnbY/gtQaVaCEQS6LJ0DqaqJz9iTMrSkSssmIU9O4HuioqxTMG
	vki/2IHU7wBq+KaXYSy+PLyY8OW9odgTvD8dci0dz/9h/55+1s7UnbdxldZD1Hbx1Daic6gSYm+
	xnOlbgzW3XKNFH1BBiYgUI4VTlWTZtM3FlT3FCfZ0rsf1NrYh6aToSSx3JBORg0RJs5K0edzZDb
	xMxoXPRsOLDxGBq0nmDiyjw1iwULBdI/I4uCKVHmwfrwDpgJN6OL4AYmQgZy8yCxUc4eywuZ5EZ
	IxsmTOS3E0JdM/FpBDbrHQ2uq7+AjKZpxKAzMO+HT7TSgJHJkxXnYJjCuPkZkB+/tyOnnvFyZNq
	41Ulp+mzMNrWLOGhHkAnJf5qhYV7pDlQiUlsZ9BkotvdojRhRzUDTuOs4yTz+v4rQes02/Hi55r
	Gihm8cVZPp0sSEHC/DWqGXEG9qzA
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr242482965ad.2.1787805867775;
        Wed, 26 Aug 2026 21:44:27 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d63bb23sm14554224eec.7.2026.08.26.21.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:44:27 -0700 (PDT)
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
Subject: [PATCH v23 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Thu, 27 Aug 2026 10:13:46 +0530
Message-Id: <20260827044349.826534-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827044349.826534-1-pavitrakumarm@vayavyalabs.com>
References: <20260827044349.826534-1-pavitrakumarm@vayavyalabs.com>
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

