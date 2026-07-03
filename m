Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B7624DD15
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 02:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044056; cv=none; b=K2WikzyegL0bpBwL+rqfO9Pi909pHYEEKXmqrE36cY4zREPdTW0aiheOB3OJ9ji2XVDT79I4B+hgyaN18MYXYJcNOkmZmXF0GwHNRrpw72FL8eArTw33dAtOJkipu9+HCtvUK3SjJhTXbw8v5C6Cf5/NKO/LH4ybksF2eqlFsNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044056; c=relaxed/simple;
	bh=jxRLXze+30Bd3HWJshR/WJ/vpy4kHy3z4wUO/puyrSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPXEFWJtrw3MzcVot6kG6Ryro02evTV9oaX/GDG93d2FszPm6OrqZb5vGu35Ehx+NqVDuhQHUdTOIKp34AoB/r8uJBvtur9h4wP2tqA4tRH8DTNMV+8OZFgrI+9DHFi4BUWFhW73ZfdPzS95q9yaApWPCefBLVP0hXHJl/Ce64s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHEiQf4Z; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHEiQf4Z"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381216921aaso64451a91.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 19:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044053; x=1783648853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSnOb5hOxX9yUplIfdpmrusjS/RN2Btqas6tLO5wHZk=;
        b=FHEiQf4ZFxMay8wPTlXRe35gUHz3Nsz2HVHHhkWlrt6aX/0Yig2twPUyOMFqqL8rqc
         fwPc0CRznz2Cok1b/Lci5PNwdcJg5DF21G1agHJTvYaBYjq6Hx5yWbRWUeH5XK/Ah2SZ
         CBJFAH0GG+hiWN1gtBP376bGPjYz4DunqD9dlThPrWav1ybSuJyonYtwOOfctHbPhV1a
         j0na8HqiU732duR/qPDyABU6LQkb9MKlT8iqREJe3a/OEYnFe8wMH/DCEUgvnMhGq+oH
         9WlPfHLXEulwECXAEL1SMNEbYPQytuvrThKGB5tLlA0hsafuemSLU9N4IWnMiP9LOnr7
         aJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044053; x=1783648853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sSnOb5hOxX9yUplIfdpmrusjS/RN2Btqas6tLO5wHZk=;
        b=mr/JWgD0/PSokYlyVPXtUCM9cP2EIbL2p51i4vcrp+mJf58h8K6RHVt1Itp+X1Yl+7
         HAGxJQR3O2TFbr94lZrDPtSN0lzsNwUERys/Ic9sNoWQEAPSaKnJAnM8au51F8sfa9j3
         Vq75QnRzGu2xMXCdeB6cGC05qhiIj4nOlCJSrUbohqQw+rMQJnySBmYvqu0CeDrg321V
         yaMepQlr7ybh38hZL9k2RNCyRlUonIKXxiDenLiOxymcVu4SpCb65aC84TzjYxj9XA2c
         lEP6qiuQIJFe64bvmpos28X7oFN0oUvf9UxsyUcImRQxSfYyKV1DEt97xRqBH72VRJmg
         l26g==
X-Forwarded-Encrypted: i=1; AHgh+RqfTvSDPJxS6tsSPIRoyqtTykTh/kr+NuJZGSX4QPdwjk7O/UkquJ+5K/yNH4cg2PRSdQF1uJcacQ7B@vger.kernel.org
X-Gm-Message-State: AOJu0YwL4zLHIlDPsQsQri2lSTr6fDMRQLHXXhxcxHJqOATaCP0LlVTp
	61FUB/sZLV2DMjjCwsFcMO/nPfk1KEh6/XX9Zfkq5xTclMYJ3qoQk/zQ
X-Gm-Gg: AfdE7cllEX8XgV+muYjF+Gt0DOw56bn43vP/vlolN9HDEnZbrqjSxYYaqKtyC5v2Vt3
	U8W4FsnkZo7BoppDwANUwUd2Gbj/6Uf84pK742l3N0tIR9li+w0Qr8ydNChIOJrhxWJteV2Wl6q
	zQ5JuIAQ+s0SfkiRJ3w6eTAfGPazMkcF3fjJ6ZATd6AG3Z7G3RuFJ/M/jN744Bxot3nUFJSxnHq
	e8qxye3UcnK0jzHzEYwK0ylyTPa2r05d7eoXuH/wmPHILT1hZMzkXQsj9U5s+Aq+gIhtTLse7fG
	ecaU1qjRUwBZiv0ND6tMwVFzm3cRIGIirBjSvgLjPUw6eqL5c2qR8q2HiHu8drCP/d+pEM81ifN
	J8316J7AywZIwzSuKPVSIVju6dAk/ZjFCBo2Skx4ymmj1Y6kifT01J+lg23m94hIWGFGoplVGAM
	HPOoEOpIB33mc=
X-Received: by 2002:a17:90b:4f4b:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-380aa184432mr8707455a91.18.1783044052854;
        Thu, 02 Jul 2026 19:00:52 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127adeb21sm189517a91.1.2026.07.02.19.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:52 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Fri,  3 Jul 2026 10:00:01 +0800
Message-ID: <20260703020003.485436-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the PCIe controller on the SpacemiT K3 SoC.
This controller is almost a standard Synopsys DesignWare PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 46 ++++++++++++++++---
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..720951b4ba77 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -14,26 +14,29 @@ description: >
   PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
   controller, and supports 256 MSIs.
 
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
-
 properties:
   compatible:
-    const: spacemit,k1-pcie
+    enum:
+      - spacemit,k1-pcie
+      - spacemit,k3-pcie
 
   reg:
+    minItems: 4
     items:
       - description: DesignWare PCIe registers
       - description: ATU address space
       - description: PCIe configuration space
       - description: Link control registers
+      - description: Data Bus Interface (DBI) shadow registers.
 
   reg-names:
+    minItems: 4
     items:
       - const: dbi
       - const: atu
       - const: config
       - const: link
+      - const: dbi2
 
   clocks:
     items:
@@ -66,6 +69,8 @@ properties:
   interrupt-names:
     const: msi
 
+  msi-parent: true
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -84,7 +89,8 @@ patternProperties:
 
     properties:
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 6
 
       vpcie3v3-supply:
         description:
@@ -96,13 +102,39 @@ patternProperties:
 
     unevaluatedProperties: false
 
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 4
+
+        reg-names:
+          maxItems: 4
+
+      patternProperties:
+        '^pcie@':
+          properties:
+            phys:
+              maxItems: 1
+    else:
+      properties:
+        reg:
+          minItems: 5
+
+        reg-names:
+          minItems: 5
+
 required:
   - clocks
   - clock-names
   - resets
   - reset-names
-  - interrupts
-  - interrupt-names
   - spacemit,apmu
 
 unevaluatedProperties: false
-- 
2.55.0

