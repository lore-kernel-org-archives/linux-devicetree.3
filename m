Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72317385D8E
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808154; cv=none; b=d8BWUhi0r+PZ/6wbfs6qRTlNexVJ7t+ECsXSYtXY5AVTioOLRrS7Rbb0Mcp1TQhpJdWUm+R21kjNT9mtMrLB0BK6234FqMf5d17hII+q9N6fpivy8JtJFBMy5ofQQXqFL/CvhMwcVlqaeyOWlaygXLhx78QFmwhoQaF5GeiBWtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808154; c=relaxed/simple;
	bh=HugAla5NxeGvUAW6ybPWIq/99Qvbl3GRpGgOPmECK8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mLfB7a9VVEe+bb2I++oNTd774NDQLp06wvMaZHGs8qHurfVe96IfwnKwXoVgTeX5/YrETUBZBEBG5yTLFoFy3HI9ejlZnXL+uRChYuJ0aOEJF+t/D62PmvaGM+vpKfXrvIdDl+n+tYmXHTvO+zbZm+a5EmBEhxXxQdsNHBBfmso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=bUhJW4dE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="bUhJW4dE"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cace91f112so6634555ad.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1784808144; x=1785412944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=bUhJW4dEoMf1MPBDa/ByXDHOXKSUk7M1zG0Dufppl9LJwHkrbHQatX97s2SApt5XRS
         QRG/fffRujj4rIgsiJZZpk3lAr1SGObC3nN2wpH4lzf/wrGcGGc8rtyz14DSwF00wB7q
         S9sYzON+WMa2RyFo43Dzqj9er/AtcbB2XSupQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808144; x=1785412944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=pfy+uPWEoGTOAOaNmjTGscSgHeOIwcCBY9q6AF3GeP0Bww/2D/TwsATfJEtR5R+v/8
         IoMUuZP02g3OT0LuXIOhhO21h7R1vJ4QGw4Kn/bMLD5rcszvdPqThsTtm5EgIzAk2Po0
         8tViwIx4KLgIqYn5lB0NIle8BmAo8og/iHYoMUUZmVF9FsDONgcITBvkPbz37or777Wu
         HZ8AUUb7cAyLJwIQag3FZs/1mIFUZCZ9v8z/csMeuG/NB5KIMjp5pZEog+80ZRwkLSK4
         h9a1Wz1da62RkaHE71t+qcAVgyzIa9KRDj7O9iGzMF6MXZcGVCynx6TjABx0jsWiJ0vb
         08Bg==
X-Forwarded-Encrypted: i=1; AHgh+RrvmFxuXsSUu+fkRPzyI4B6q4LgR8si5DlXjxPNagvg6f0REPm+CukiJaQqSPNm+iNMR/wMXhwhuvmi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvp6IHmfg89T1FnR/+sz6KC5JhMm/H8XFRf+krHD65Fgp0AOoC
	7SH0Kn0ZJBSUqT2RJ8gTc+x478QWJkqRsCt/ZyXsmHJx2nBAeP6Z+ybFBly0YYaMOEg=
X-Gm-Gg: AR+sD124xYemd6f9AElFopU6fpwGNNaHkSu01zV7iSobBCsXBz3IcQLegxdQMDQDCa8
	VLyNVHucTJd+6OOXKuYZvCYDiqEe6YP4XTRSTVWq/keg5g6aQddU8d48uHrSC2ScU1Zz0Q7Yu4C
	MwqfJ2+M9XRnA4ugVB5K4jqXvQWR4eYSCxFSf9IzMUuunn6RETxTYCu2fei8GkePs8Bi8KRlBGK
	vYciu9ldfRO+oNzRAevmHL59O3Zv3GGweJuwsvTznZpHR+Qz3lMMfyiHIgQlf1qMmRwRrL77wnq
	tOSRw+TzFMS6LsLcsDH+ApkFowEBIbXarGheWkaHRBnpKR1FHvGIjN8Pe3CR3VvmEFxmVspPNzl
	TpOlrxOBWqD3/KTuLa9Oi9yuU1bEGW/sDHZX4jg1QIVupf4yPAAXeXbVq3VvPBFtQ8ue9yD2mnJ
	5aBJGmTKPZx3Bn9gvsaPZPEnNsx01uRjWKVHOklYxv5GOPcpKL0a2FhX1LoSUspQji9+JTdgsrZ
	2zSTEUz5D5KdwhmWq6vF5/zZTQ7O3T6BYq4xkzKHarCIQ==
X-Received: by 2002:a05:6a20:c784:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3c44afcd253mr2853658637.10.1784808144217;
        Thu, 23 Jul 2026 05:02:24 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df06864sm19359125eec.15.2026.07.23.05.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:02:23 -0700 (PDT)
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
Subject: [PATCH v18 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Thu, 23 Jul 2026 17:31:53 +0530
Message-Id: <20260723120156.285270-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260723120156.285270-1-pavitrakumarm@vayavyalabs.com>
References: <20260723120156.285270-1-pavitrakumarm@vayavyalabs.com>
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

