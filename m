Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1E342BE8B
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948526; cv=none; b=g07oHpJj7vdpQqfKmG+VciJ7iYarvWc6sX7Vmggmf7bpOVC5R61qXBR3LtkwR89IkzFK+BRS0eav54+T9QJTqDdPc7TD0uL/naIG5ak9nOTFCgjOfLzXAXRVlpetFrAIM/lgUXZV3wRhC8+VRnz4dxL1ZQT3PNLvVgjxN6GPLpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948526; c=relaxed/simple;
	bh=HugAla5NxeGvUAW6ybPWIq/99Qvbl3GRpGgOPmECK8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hfy9N4UlvRe/BiAOcF9QFdTvIywCCaUBR6wbEv7k4SHz84h7LxAX1p0NnOFDqIe0fI0MZn9aZuwmZs798hXE26RZ1DgD+Yytqlr2UF0k2S90gRp726a3HcpkzzMK1Uqg9L/TK2Wjymgw7ZuHbvWAue0B/Y1PrSCEFXpQt2a0Go8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=fvJ9zay7; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="fvJ9zay7"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1263400a91.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 09:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1785948525; x=1786553325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=fvJ9zay7aa9DWsa03m0nxdiOS+uCg2XCnfpaJorxDI4yUk9ox1DZ8qZVp4+1w3CUak
         P/ja9QGwFnGw3ISXw0VC7nF+dnzvnZqkHn1BsjI9QUGB0bH5MMF9b8K3boVMV4ymCVWI
         xNTmyIvbHhptP+ftL0GVMo10WqMfepU21ej1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948525; x=1786553325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=QBeqZU/g0qXA1HyI2yQiKKugJbBpNniiCqr4LR8rDacd8fUKSsLvSx+57wbtIhP/V7
         ww6w0Pji+182RCjcExIBAhIGu/BJ1hQwFr02gelvNrvbM0eksV54VJvDIOZCZ4jSWA+6
         pNZiZqxc2OqZ7Zlzms+zoBEo68tSF1n5YUv39umSslWiJLzMdmXoI0WWLRGXcggpR01v
         UOQ4BDmEWq++Jxc2smURyW5MOFiVqKdWBydRirwCvDYBPRpIGEGeEywXqJewLVX0Qpj/
         rSmVzy7KKuJiDb7gS02+HEPSzQwt2qvNQZrone5ScY/2wBRqarY43uT3SMw2S02d+mES
         d6Rg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2tIU+3xYxo5XIMy+F7oQ2uOzy5nz7oWuNU9BdEVLYq5zrffg3VxfzXa1LZXTORPSBmr1Pnr+w24//@vger.kernel.org
X-Gm-Message-State: AOJu0YzHgaOCcOO7mKsP/WyurIC13HXBkq856+LbwO6ZZwfercn5FX3E
	5jDTR+zlqLvlR83Bh5+y7aMWh7GKk8lSTnAl2n7wwEmbg061eIVS4EafYXWGUcR5R+M=
X-Gm-Gg: AR+sD10Lh+iZzXPBVb4l8xnO/MrHNmre9HVpct6dBJzz1l0noR0v0nsnEm8Bwt9cVpO
	5s6mFrYYP46gBNwzGofyMzxJ3EvDS31xmGxBY3aD42+wp/oUU7aM1Mr05Zam7BHzHUuYeyYrCDo
	9OtO4g9fLBjEYM+eASNsTgGNk6GhvEWr/xh8orPmG8OVbUrlxJhtBtr7bjJlwSHul/5CxoCaies
	VJGfCz6Xy197+7IkfQCRdRVc7l4U96240SS/md7jHIO0ARTFg+CZVFbbuE1SKRqT7BjvNXdvrPU
	czJfU+ROmrI0Vne6ZVxnKeUt4OkfcAwB1mGKza1FnsJOHS0B3E5920bQobTJFiQJBd4aNTv86Tb
	9hbE8/qndVSopjqvOQBLiYvLHnKoC+2CM56KLrUtcQTftOeSYqQhEj7Qt24WJqlGHgE0+oF8vQ0
	0xz/egmeIg1RnQWo9minKHt5oFrKaExUREwrfYBlQpSTns6jHRnrLgL8jNgLtkxFdtWn7PRaqYk
	I+1otHfWw+fKICqNNfp00/jG8jNdzd9xa0ca4uUmqFZy+WYYs+1OG/O/bm0K+OK5sHnPNjFFvvF
	EDufKcfNft3Bne7OHyXi+Y8QfVjr
X-Received: by 2002:a17:90b:28d0:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3903c57a0bbmr8190897a91.10.1785948524816;
        Wed, 05 Aug 2026 09:48:44 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d7e4csm18358677eec.31.2026.08.05.09.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:48:44 -0700 (PDT)
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
Subject: [PATCH v20 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Wed,  5 Aug 2026 22:18:12 +0530
Message-Id: <20260805164815.249328-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260805164815.249328-1-pavitrakumarm@vayavyalabs.com>
References: <20260805164815.249328-1-pavitrakumarm@vayavyalabs.com>
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

