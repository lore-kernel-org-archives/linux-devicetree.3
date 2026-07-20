Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF8C3F7A8A
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547517; cv=none; b=jP/DYjNixYguLQtnduqIIqQsFgKF1jktBgkF7Q9jbj/ZyTyz+EyfV6DI0y/lRIR3ZcyLFDgw7Wfhj0uiiJsOjd4zprVkb+SaR+wN6CRhpLyIbuhntzgYIw7c/9kyJn71/pMcjwp46bbWNIo2P/HXeN6tpjNyAhugEeKJNiZdHvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547517; c=relaxed/simple;
	bh=EjuF0ELSTrkiKLRleI4uqXD1+TO9XfuqJzol5iOj13I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZtUWCv3V0yZDo1UCdm8HU8cZRTxYOVdqNNHWlBnVRPViZDwB5ZrtWeskFS3vQvkp+eT1otsYYPGwTVYp2kd7NZnlU1JG7Z0gVNqEmz0NC6KLkQQmsEI00+9Zk+XkSwaMVTJZjSZAjwLegwXjtBVbpvybHNko/xUsSyPVvmXcPXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=TBTuTy3v; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="TBTuTy3v"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84867f07d63so11144100b3a.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1784547513; x=1785152313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kx3Zw6tOxJTm94LnN99zbJzvwBuruxhjYqu5k+0DmQ=;
        b=TBTuTy3vUjcgwv2Klamw3dekQ2PEC2emmq4f22Y4vmN5NnpkIosYMC05Is4rSusqh3
         u9uK+PZvTHXWrjEFDLMKb2dy53WOy6mfCdW4K7nba8eGLjW6f25XusMXxvc5/N2LqdwA
         4MzdejfQaT2WiF09eq6x6d3UwrLtkmW+sZpdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547513; x=1785152313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4kx3Zw6tOxJTm94LnN99zbJzvwBuruxhjYqu5k+0DmQ=;
        b=C4mwVxPUK2CPfN7d/37lW09DWWmitVsHC5aHB2+LSt9OXbImV2E2htBmKKYsdZo1A4
         WOGwZGYxsVyaZsgu5ehtBXLtg9o1tJmhGjTATKxAH8qH22lhRG5rCaAOTORYNPeNqMU0
         M+tDTByGWdeOwjKdaijtYWnXVmg5Cea2vmFxpyQBuhUqAC3DaagmSTWobr1YLF4njHKZ
         BF+Uck7hRAvEMf9l2LFgng2uATL/uz7EXvJEJl+risnDGDjMo7BA2MvG4q0w5woitmyg
         DCjixglCWpjsfwayopEOg8dskFaxb3WrLm24dtgyOO/KxhF++JTrf6lFcENhu3C4Hpzh
         gCHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBJGdXnazjBXk1Y0yPMpGtmgz+p3u711ZH5UWUQjk97nX45kYGQcL+fHhnoLlOxGkFVDl3OIyHXOSY@vger.kernel.org
X-Gm-Message-State: AOJu0YxXYVVYq/+Tr3QUWhv2uESTHZzxJsWmsBYlzOtq2f/d9Y5dLyLI
	pHV19B9Emi47eMbxaEpN+djBlbrskd/z8FGjbb2XMSJqjjpTg/MwpdRsHcNZmrHC470=
X-Gm-Gg: AfdE7cmo/j+h1dFoMTZPTDJkhwRTD9DFHdy9mMqIr9bnCahq7ABJKeyyvDJhNkPX3nF
	6Uqwnve6JYMbE/qj2MY1U9ge8oeLqhU0hsMJKFuLpL8/LBXd4cd4Z2QPCj38UXstbAkgXCLowah
	vcLRUBaoIDg9SWbkJpI/SNnVehaQZrlyHoczhRLGbxGjvNdNjoRc2ybiqDwPoA4LOdyED4RcTzL
	DvHiezDVn5zet5Hj2NiaRzaAp3KjUMfgb5gglkkMHNEs/7DO62D5/ZHfO7hY+TUU9EIMPKwGL7+
	HeWBl/5fAM9M77uF6y+BJRFVmJHErKjhLOCHyRl8fuEDH/AqhE7zbFP1DiDcJplAgxiWvP7O03z
	UBTWuYoJ+70/QhVC6jfxBuwUrXd2w+IiiqLsRrgtrUIMNlU7P2AeYZUkvf9/ehroMijktTnyDKh
	4emoil/LHDlIivJGXZ3Ox1QG6I1mqpxmJXJgIvLXhZMITjdyWFwSv1EWENwUB28LAwhNp0R8pGS
	W/zCga0guigI4zbDX+lvzNwsrV2XnMYdkhJYpnjMhognvOM2UyIRJIA
X-Received: by 2002:a05:6a21:6110:b0:3c3:98d3:c20a with SMTP id adf61e73a8af0-3c3ad947da2mr16348869637.47.1784547513241;
        Mon, 20 Jul 2026 04:38:33 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm61824393eec.21.2026.07.20.04.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:38:32 -0700 (PDT)
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
Subject: [PATCH v17 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Mon, 20 Jul 2026 17:07:37 +0530
Message-Id: <20260720113740.64960-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260720113740.64960-1-pavitrakumarm@vayavyalabs.com>
References: <20260720113740.64960-1-pavitrakumarm@vayavyalabs.com>
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
index 0000000000000..fe33ea361a8e1
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
+  - Ross Bannerman <rbannerm@synopsys.com>
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

