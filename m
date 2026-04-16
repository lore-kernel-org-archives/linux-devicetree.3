Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634A311583
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776321959; cv=none; b=iknORXvjgGJdlKSd4Dgka78aIsa5SxgyAe2OEbd0RQDxeuKpqk52Fhl/lyhK/G4QOAMFCeGWPjCgICAHRHr3Y4Esnc69JCP63W7z2NEBBhRssN6tHi2D1BRA437V01FeYcVR8+5WhQhdG0gCV+XqPRuznc9fYjTdplZiE66ac5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776321959; c=relaxed/simple;
	bh=1rCkpkHyHE3IPuAx81k2bwmc4nwhuww71wQ9MS0fnZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QtMs5ja5DtJhSKvDOW3W6NFTYJmKfqPYTM7Xl29nwzajuR9Odo3+fk0cqn34H1xOQoa4DvFuu9qgt0lrqFXKBBokJWWMqoih3zO2fk7Oow8WA/5bKHfHQJmpmHqHD5S895pIRAuT2leZinWxwjERgODuhh/IeXw3Egx67ptB66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=DyoDhw6O; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="DyoDhw6O"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82f1f6103afso2490037b3a.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 23:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1776321958; x=1776926758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WO3LsK3AW3by8XZxWRGcuY2BsjgbgR+h9RmVDdaQIY=;
        b=DyoDhw6OVq2Wxd2PoBMKerj5Fk5u8ppOXcTH56OFfZL+L8+UCeX877JWsu8feITiV9
         WXn3b4iEF7T70H0w+rREuTD0K1QFjLjC9E46874hoLD70AwHcUwM8wr7WvnrX8lITfsF
         cJe/YFKGQYI1L5HsZrvXXrQ0Kgnuxuz6QHdsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776321958; x=1776926758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3WO3LsK3AW3by8XZxWRGcuY2BsjgbgR+h9RmVDdaQIY=;
        b=HCDwB19/xQQrMHTTt0EDRsdRAeaJIab27Dcab/+lyv0aNRJ6eY5J/ArBndw3AsUQBS
         a1CyEsR1vMw17HwVlV5sjqYldbRyA7WtfIPuotAjEPxmcgEoy2v3TcI5tOnWUwPb/lXM
         A0irthNXb1o/7M0GyAH097Dr4j2ixRnHG40oz4AHHoogRZnIu+KGo34b5klZY9RSiLIA
         GZWSzMbT4lJ4UZ9ZD5s3UmP6nebKEb6pBAoQrogfIyI8iornJ4DB+X4ok5vF/IaZsbIe
         nmdwEUVo2CrHhypN/losSHbW0uMYIt5Dvs0zmXg80tPFayaDhkroEAV63qgH/Gi7XPr9
         TXPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1VXypFoeEobAzxwiV42LZTBWzxg0RamUzHvik9Ljpk/FAMHLVa/R61co22qjVr327AYu3bUIUgYub@vger.kernel.org
X-Gm-Message-State: AOJu0YximSQhrU1d4lBKIPIoln/mvgDf9FLj/az/B1Vh/L3gWAyvvAmb
	l1tNqiaNnG8ocnc7D7yvunEeqAxGGjbdr5dSDI6zSUoDF3/ftGpNRRqL7XxP/opQXBY=
X-Gm-Gg: AeBDieuH1nqlZkbBPI8rzWoA2HVJWJF10UgfhNA0O2+Kzsip1q9THus+wpDjmlMEWpf
	c8xL3cP2rH0Bx7g1Ha78B5UbLmuPNG5ocmfRUR1HlAbqQvK4EFLuhzmSbAd0KxzON35b8L0HZzg
	RebWc69Frk5tEKdiK16UxtdY/vFmD57QiM6Tt0DdVBgeishbAikvfCPnXLvVNsK7B26zAoUL8K+
	UfavKmCCYcjkisNKNAMucwu+Efji3vDz8VJvutkqNzGPZPDeFUBy+7Bpsm1+ylvELQHlL1ZQdF4
	AYZV5K4gXqAd5OiofTP1mExVoVOT91jT55+rHkYgaLcHks803RN2KpmNgUUDDgZWL+800ovFWWW
	N+XcHeZUsbb6Wlx277CcM2gEtGK1eO1vESfMoT8XjK1KENmC5lS6sRHhd/i/bUB0qZkVEGXVoyI
	C+UTJk0k/YvU6x61X53KgmRqCGDfsXzVbbGfzkGH/NHxbrtfjMt4wqLrb4e3uxeKgFWlfgWnXBf
	Zd1LWMU+Khihq6e/4yQP5JSLrg221XxcYPAvWfg+jTrruTh0ixniusX0/On5tYhj5A=
X-Received: by 2002:a05:6a00:3987:b0:82c:249d:d84f with SMTP id d2e1a72fcca58-82f0c38a1demr25856946b3a.37.1776321957983;
        Wed, 15 Apr 2026 23:45:57 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f67418a47sm4107066b3a.48.2026.04.15.23.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:45:57 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: conor+dt@kernel.org,
	Ruud.Derwig@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v12 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Thu, 16 Apr 2026 12:14:48 +0530
Message-Id: <20260416064451.99886-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260416064451.99886-1-pavitrakumarm@vayavyalabs.com>
References: <20260416064451.99886-1-pavitrakumarm@vayavyalabs.com>
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
Acked-by: Ruud Derwig <Ruud.Derwig@synopsys.com>
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

