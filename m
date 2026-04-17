Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB663B7B7D
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423881; cv=none; b=VActErovi/OTI9Xn5Ds5RRNNVpQpCyo0OZqwfk22X2W9Db937nILe/UwzfMqWmp3D+JAiWjCM9RZ8wFZ+RTlibyO/fYOhRl4RBptl6/EtbvdbBQu7IuDhIcf++o1FmSCReupF0bg5BiNkAqc1woCpM6r7tQ/Fvckx1m8oRf1DBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423881; c=relaxed/simple;
	bh=hRt6bnj6JmwIsk2Q7eHHKPQ3L38fkyslxwE5kAHtrQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IoV1OLbTvT1OuczsspkQFsDW/O0M6Yba3h4iySmriVk147RSp8OcuKJ9Kqd1E0Txb5/du8GiAHGpNj4CIc1mEcSg05PSUZo0Kmf4PTPADcuawtHWmI201kgb+X6Es7O9LKUIwcINbWl8Saw4GGnSCfp1cLkv2KgqLiD8oLqTL3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIcA/5Ef; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIcA/5Ef"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36143b0dbdbso201167a91.2
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 04:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776423876; x=1777028676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XM9OAm7LxW6dUYuM9tCumZEGq0uUmwkPB3O9AymjDmU=;
        b=FIcA/5EfjfMCuR1gI9Y1+Fin3GHV2osEX1muWKWlQh6q5Z+jVI/W243gWeKyUWvQn6
         pU+p+WF9TlrMcLoZ/PnvKsT1xbXKjhyeTlAy+QPjrQLslLna+3GQraLOMyyzSHkJq3KE
         N528MPduNyNHldu0cwV1HkaLQPlq7aii36PUkBJBu3zzQ7KfwlE3FJ5M70pW2IsYAJaA
         sxOBuOKOb3x2PnF5gy5nkikT3gpFFRZ8278leglE1jvK1WW0a0WV3ug5ygwkBa68Jqr4
         LqOO5v3RJ8WtsgmeTtOt755tgKgNTmxjD74zBBuPkZ1N+GV8V4sCNdcGFnSUyy8g+dxW
         IJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776423876; x=1777028676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM9OAm7LxW6dUYuM9tCumZEGq0uUmwkPB3O9AymjDmU=;
        b=kWV/BB+SH4SGEnJMzxLM7BIiSfBjjxsditLSPWfO3zexvlxE9nMMsC4JvwtWQlxowp
         Lgfmq8LHDLi/EdU674QRUZdTPLu2znacsbGbZxAu3dVFaCDG8lFgF7/Xk9WdYbZnpZrA
         hdXAdRkA1ugpII6feGO6+mPQwvPjyAzP4iNmfdI7SCRpyv5PZojYdLQxXqlzvC0Fnotd
         9OghAL9r8VjqSqNVN4geSiOwCv/EboQ1LKR4R/9RsuQ55TvF7oEhW7xVr/XzkCqNu8cX
         bWFtzFu9n21fW8UF30pCEGNlcytAheoCjkTGUkWV7vsQsAXGrziUfVHJowTwMQch9syz
         /Txw==
X-Forwarded-Encrypted: i=1; AFNElJ9QpgHHqRMxTyz1qUEQjncUV536s4u3ZBiMBaOtKyN4YSnLDi/Rq4TlcFsQlRd/TrZA1p6SBEEOHmGO@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFpUjdzJFWu2cF+g33ypUOZ0o4doihs6e6BenItxpF94gmWT+
	RDzlwH+QTq4itpGXJ/UNVWt2dlX2ybAcKuBifw5xj+nh9MwS7Qsx4wSF
X-Gm-Gg: AeBDiesXpBW7nTIRKTRU/9vua1MOtCa7qqw13DHH40LQ1lEmhe+trKH3K+Lj+9xvcRZ
	DuCa5Tbhj4nAzhEqB+XbusWex8Fdsp11Ts0rGdfE/vBwMKfFuuVc6x34b9LquUlZMN1deFAnjkn
	zV1REiGN1UE/Fa70KW4bVo0oRBhfLre08uUXAeLRPdhyuMuMuQRpOCQ+yaiQR4sRDdgMG7LMYJF
	vxMNArknipo0+MmGBZFDClSdufJlBc2pLunzNlUqri5FZbsdah20i5c/Rzyq1gUqzvu6y9GkTz7
	EY/+47YKnW0GRzj7oeSXko3lvV6EyCRDndvBlBbxTD6l+WfI2SvA7i2INgQfBDbaBy2FEGoDXUC
	AOJDojavuJsHq/calU5ihvFXWt3JNqfM5wLoN/J3wb6Ghog9r8N5sI7OHR/h8THpFhVB9Avw4un
	ouWRkeA5mHeS924LmpIAu1EaCKdcaDnsedQSuWSFhew+wL9OlW1emcII3mEwV1q7sjmAhL4jJLv
	kvbHuFrsnA=
X-Received: by 2002:a17:90b:5865:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-3614049447emr2541018a91.22.1776423875925;
        Fri, 17 Apr 2026 04:04:35 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410bafa9sm1758409a91.15.2026.04.17.04.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:04:35 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: cdns: Convert xtfpga I2S to dt-schema
Date: Fri, 17 Apr 2026 16:34:10 +0530
Message-ID: <20260417110410.4482-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the xtfpga I2S controller plain-text binding
documentation to standard dt-schema (YAML).

The hardware requires exactly one memory region, one interrupt line,
and one phandle to the master clock. Verified these constraints against
the driver source in sound/soc/xtensa/xtfpga-i2s.c.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
---
 .../bindings/sound/cdns,xtfpga-i2s.txt        | 18 -------
 .../bindings/sound/cdns,xtfpga-i2s.yaml       | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
deleted file mode 100644
index 860fc0da39c0..000000000000
--- a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Bindings for I2S controller built into xtfpga Xtensa bitstreams.
-
-Required properties:
-- compatible: shall be "cdns,xtfpga-i2s".
-- reg: memory region (address and length) with device registers.
-- interrupts: interrupt for the device.
-- clocks: phandle to the clk used as master clock. I2S bus clock
-  is derived from it.
-
-Examples:
-
-	i2s0: xtfpga-i2s@d080000 {
-		#sound-dai-cells = <0>;
-		compatible = "cdns,xtfpga-i2s";
-		reg = <0x0d080000 0x40>;
-		interrupts = <2 1>;
-		clocks = <&cdce706 4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
new file mode 100644
index 000000000000..9617acef3f0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2S controller built into xtfpga Xtensa bitstreams
+
+maintainers:
+  - Max Filippov <jcmvbkbc@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cdns,xtfpga-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: phandle to the clk used as master clock. I2S bus clock is derived from it.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2s@d080000 {
+        compatible = "cdns,xtfpga-i2s";
+        reg = <0x0d080000 0x40>;
+        interrupts = <2 1>;
+        clocks = <&cdce706 4>;
+        #sound-dai-cells = <0>;
+    };
-- 
2.43.0

