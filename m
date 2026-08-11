Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70942A144
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786448083; cv=none; b=d5GzKttLEjvU1CetTVc589IqVfPhyQruJOCAF4JRl+lpaQaIahCXsGNglhZdd2cLW841hOvamYwZ8KhD6UVOlUiv54RdPQH9Q6DgPoXqW/Ulw5Yj1uj9xuDW46NvOTPyJOPOdcnSThAYC3G1f5ad7wylg4pU+1c5wBVKZtZ8PPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786448083; c=relaxed/simple;
	bh=HugAla5NxeGvUAW6ybPWIq/99Qvbl3GRpGgOPmECK8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NR4dBiYi1jiiCCKEuZp6yL4X79Ow1PpicJUjv88/wVo0dw7O5ygC6yejzy0CirFdbzTpNY8ttwsM9/CUfuPQirUCXADWGI/7nBU+Ln+kiUd9iLRkEb9JVU2jCSjjKfpI7F3CNpmESviEQi0EDICvsl6JnPrkmBFRRY2O4HCz8aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=VErvF6rh; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="VErvF6rh"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbb7926836eso2089011a12.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 04:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1786448081; x=1787052881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=VErvF6rhBQV52HlRwiyNV6MTZbdTOJwQbw6aPjS6ME5Vweg5M3HbbK/1mv2lDo+JqQ
         18UUNQXQchZdRty/jS/xktsClNFtoyt37yrknYUR4lGdQFMEKev3qX08wELEJMeXxj8Z
         uknysr/nCcNi+qe9f9MgoeQg1Sx3yYE5CfGK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786448081; x=1787052881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=RjWCOC7/mfz/rKB8i9lAQn44Ogekyxn34y70mR9zt0UpWsPou8XZRYq03S3bjum0Si
         k9UtXp1Qz9CYPakVlMjjrlGeJFP1yhdpQN65xZJZizDIsgKeusWJtkyEz7FREaGqVLUG
         AWEsrGkai71CKkW6RWjoeprcIz5HSEECAexXzZ2qNeE98KfMDd2YGA876j9LO1qhZpLM
         j2JPVgqD3z2BX0bA7yXTbZ0UocWdH+o9uXX4dk+77pm/Z9IY+jjdKC66BiXo2tDk5zNx
         AB4f04bgu1G30fAoY9zF0Kz66yb6MIt+CAQVgXN8TBzj/MOc6YVHB6rDHuTd5NkFpycj
         EFmw==
X-Forwarded-Encrypted: i=1; AHgh+RpREhbLLPcP4kO4JkpyUx0a9OFWRdX8zADYTMEuO5waY9aV7U35vyKE/JqLD2DwnvCjn9Cb/+lpuqJ3@vger.kernel.org
X-Gm-Message-State: AOJu0YwbWmyQhrsuhmZkel09RvOBZml2tJ//oPmTdVPhRnrLliZ8UO7u
	oqfDj53Zd+PiiX00pwkErrkQoYuVIkUrCvb0v0LLdDNems3bNnihy6WPpAhg9nG7cLE=
X-Gm-Gg: AR+sD13aWH30R85jDfGWonGcSrkRyyFR4yqcibxbdfvL5OolzzDa1WIjaxB2mZ/koMt
	0jRsiIwsHEL6iDL9YEBy6JEIv4kMOKWHfnFedvzsvKJmdkN0fOcZU7imhFUkSNchU8lTU7VqZKT
	g0xv9/XWhBUZPt2VNLeKIarIkUNu5zN+US4ApW4sfXoFhD7QXR1nRKexP3GjHJ2WLxFcVJ0YyQv
	9Oak2Q5mFI+W21FUTvmrBZCqFDMbQ+0mp516d4GpUZzhgp5DuYvUTiCGiPu9ZGcVTjbgZmGxgCD
	Ozo8M+Fn/yfojsTcPidRBRwAjKSNScgqaDKLT9jj21BK2Rig1+DoUW6TSAPf7mFVZsMwg5DYlS2
	EMET162tGMoILXC+FFF6NTcrdl9YaKCHEjzFqNnIOjNM0m5tAZQEZMMq2sry8y5pBxeQylKaJbz
	O1SPq6e978KzBWSm/y1ONzbCyGlsf41FI1CGNL1MQVYRDc+UEuR56/8oi/FlOri6Pf85YL+b+qY
	+XPTiUf6WWl0nWmeh0hPNeYzByy823OamKkMfS7MnlWP6wTnW00EfEDdbhjVJlwMpKr9hdrqJ02
	JtmGHZDzQldobkThbBGk2RmiWHHj
X-Received: by 2002:a05:6a21:6005:b0:3b3:1b38:d9c3 with SMTP id adf61e73a8af0-3cc2b8dd9b6mr3789115637.4.1786448081272;
        Tue, 11 Aug 2026 04:34:41 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412035e08dsm4983584c88.1.2026.08.11.04.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 04:34:40 -0700 (PDT)
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
Subject: [PATCH v21 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Tue, 11 Aug 2026 17:03:47 +0530
Message-Id: <20260811113350.632737-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260811113350.632737-1-pavitrakumarm@vayavyalabs.com>
References: <20260811113350.632737-1-pavitrakumarm@vayavyalabs.com>
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

