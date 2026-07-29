Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD2418A35
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320823; cv=none; b=AzuhnwprQcbbbOO6K3c6WROi4NHuVqXqwLBRzlvuKgadoP4Pz2ln4VQsK46qLAjzb6tWo0iuYDV53ZkXm2n8hA8Zbd9qYV7u1IERgCVZbm92Ar2z8p++MV/KLI11M6mE+MPen+xXWin4SlZQbQ8IwFz33sBkc3niOLyde7/z25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320823; c=relaxed/simple;
	bh=HugAla5NxeGvUAW6ybPWIq/99Qvbl3GRpGgOPmECK8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dddSiLRWsjqaHT1gpcOj936WWrhF1BnxatoF/gxpDw8myrkc4dRAxRVeFn3uLjhXijinaYj9gQuqpcCJAqy++e4Tt5FZykecIS9QYLXe08rUr2LdKwrVlQgJLY9DHWSlCDpIbba7ja/CMvQvJstG0LfBHI1OoBwuSXCF7CJ3iT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=I32AuaBu; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="I32AuaBu"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c999f162c9aso475391a12.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1785320822; x=1785925622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=I32AuaButFyQjQn9JXqefUchPGOtlyEiLzdmIyhrzbSYnykIw7aZP8hjyS41Ni+5r2
         nZ8zm1hlKttZ9b1R3XaqlCrKgwr3Fu0nrhnN7CZtXhRBQrYCznxwIHeDigXMOaO+PXA0
         XYOw1AgE7YpdYk8PhF5PHWG2ebGILT/8USwFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320822; x=1785925622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=NiyUL3q/4WSKsxctRRmD+4L1h026rZzii80zQlUKRcNx52QA2PQOICEqhXYdj+VLWk
         UrZowmMqgYl1aBSst3POYLzenQmHrkq7hcKEEK4VmEUVV5b9MM/eLUw/mjkEVoR/Hs2G
         p0G1XlFjfYTWWhoUou1JVRTEcVjMC5nYUXOwkdx0PwOXuxhx63xgJ3nB61SAeJOd9p4s
         58V96aRVvJs2WNNr9ejXLUmx7PS0o3tWe/O1phgAE5gZ08RFsAnGGQxA5tNHciMi1sxr
         tHMxd/jgDjlgltoRyuiIxorOm2dl7AaHJo0P2V0F7C1d40Xhd+u5+XOdZPolfKzzy9OV
         Fdlg==
X-Forwarded-Encrypted: i=1; AHgh+RrFLhmjNQBqMfEx0FgILUCB0bCCRRa/hW0XHW3aKBnQdN6Py1HnMNYXtpdp3eqaWxotYMKFPrI5zwYs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6VUL3Bqu/zgFsYUDFDkxmkllKGmXYeZ/3al1MgMSdiHB5Gb8g
	enjv67DcVH0SiYN2olsRpNy6iA8wwfO5xzpkBDGepnDaPcbPflEq3O+OATARXd2+NPA=
X-Gm-Gg: AR+sD12XKpqQ2mdIxrmJpgTWbVvdpsZo6QzEsWk7d70hGSkZmsENcCouuitZL53QaMe
	zNlVfB+IlOnaxJT3F8InvmlsHzUSikGsrh1jnYusiHxXk2njtW+CdiGEcRcQYuuheA7YyS2OWsW
	YUyOV6hGxAJYbeH4EFGXfYBAS2NSs9o0cnYXS3iB5/dSK7w4GWbEk4txKjdCn8bs02sHI4DCpIh
	2B+FAqistQyhZkeVyrrh0okOJw3XQuOpNRkGtU8AX3PIB5QTCgfLkUc5cAwGPVHVIFuvRmhevlc
	0VW45BsTyAuTNHMNRb5p4irFZ+EpIpGF6TbOBBwz9PFvQrkZ95tj09C6KqXX3N6mOdnCEUsrVw5
	wrNfvqpa0ct9pJ2KD7gwGt+dyHYFSHuTJjqLs08pQiLpWUNrMn16sz3hCPOa3dEfZDLe8VCpp+P
	4M47auLRYR+SDQZ7t5FkA1hdg2DpqfvXGr5/LVAO6HOQepbQl5QJU6SHeYM4k5mW8GYu/Pmf4aK
	zKq4Ms7i/twTmxCfsScGrZqNGi5YC9HwwP2wgrLKenE1SQub8rUyiEkhvnvA8Vij9jszPH67vdH
	BaQ5p8wqNu0xDsH/XG/J7/b0DKfV+TvoxtgCwO0=
X-Received: by 2002:a05:6a21:6d9d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c8aaf7b161mr7891708637.13.1785320821722;
        Wed, 29 Jul 2026 03:27:01 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b15f77sm9238958eec.4.2026.07.29.03.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:27:01 -0700 (PDT)
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
Subject: [PATCH v19 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Wed, 29 Jul 2026 15:55:44 +0530
Message-Id: <20260729102547.159890-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260729102547.159890-1-pavitrakumarm@vayavyalabs.com>
References: <20260729102547.159890-1-pavitrakumarm@vayavyalabs.com>
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

