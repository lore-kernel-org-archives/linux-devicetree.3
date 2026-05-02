Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6BA32BF51
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777716836; cv=none; b=nJHwAGsPhG/Sx/jxzMx2E3bJys9mNHORypHaHm7fzSNdG22VmkpHfMlqmMAz8VQ0rqCTeFYo2dEigIoqR2oxEwy5HYtU3aq1uR/X/XpWsumCHbanbMjnO+kV+b08AJd4IhtvRScJ0kg0kwpWrTnCwVS7rqZLoEwNTEkC29h9WvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777716836; c=relaxed/simple;
	bh=nSlzbIx7Nmk0KHaWQK/SZMleU7sulO2Kk1O2J1oM+3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDGdIfDAU0ZdJEw0/HVOPk11tED+IpsFa9pcXta14JxoEymKzDActTsT1ObTw3QyOtYeQ7PIycYaCYCQcVzah/Cgk5t/kJMtax8s9yOMiHN9hMQCUtpje81WyRsY9avZrLy0S+xeJrHee+TA8jpf+s+wnP7bB5IVgpDD84yr5Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZKTfUwB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZKTfUwB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso2367475ad.0
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716832; x=1778321632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMpwp33NUvTYaPHi9wjn2SqCZPfqp0TeYPs16K2j4ho=;
        b=AZKTfUwB/DqxeKDS60BVcxePyis1GEVsYXNgC5M+wVgbN4PbehGvp8p2xZ50dOrmWS
         7VWxmNv9KyHFs2bEZoFUfEdRjKsIUHzHQymCxtmd5OdTpNDvF687WbGPLcwp7q4jOFER
         9+3jw3nSP9f1cIwqvDDWZCdQTNEm3m/opOLBEfyZ4epjNVWNuSN+0gsWuD4EDx/cWyiM
         TTDEaX0EeflRKkOgJ/Vdq6iIxLoAteApj4IBvrqnRsUEU/589eQyNIP6txGboUAIg8gO
         Mv0VLHWrjg2pa50V1JqyqVbTdlVgEOmcUBN/kWa0smSCxezf5Y6zl8bYRwVLrveHseN4
         vhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716832; x=1778321632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tMpwp33NUvTYaPHi9wjn2SqCZPfqp0TeYPs16K2j4ho=;
        b=scl4Z3VUbNPHqFFS20rylCkVkzFXLsQlJAuNj85AQsjCR5bEYb22wfQSKoC3Jjlbv9
         MAm2KcHPtiNHxxbIFgfEBGOC+iZ812ULIqTADvkBE0GPzetCBEgwjTc03fN33G7VfsGb
         3tp7WWRHzSgHJtc7v6n6kHKuGOn66MApYee4GNONua0vPN6272cqMv2VVjMtcCOONrDR
         UmdqB7rbDsIki+QIP7N7kbj/vTaijX3awZjXD/2IV5BabOF4K+C0vXAz1poeqqdni2jN
         pC30YraujKeEWYJUv8S3zToVYFCrAx98MmLEdKdxTgEdu2mDHoEiUCImdyc3siUBXHog
         5wDg==
X-Forwarded-Encrypted: i=1; AFNElJ+ekpHSqznyVz8o0oXMRnOPHDWMCiQFep9Oufk5QRaejTHYhZQ83Ud6EV3e2gFVMIu9P8veRYizzs2l@vger.kernel.org
X-Gm-Message-State: AOJu0Yyia+QXABf7EwBvx47fOfHJmKimJXZUL0t4LkUaMvBQaeYwK+pN
	RThS346A9HMzE/r6yzQF9xsDt2pKsi7AdGtIvnu5yzYDnJ4ImXePWZPS
X-Gm-Gg: AeBDieuf4MeFsjlWNCrSYdJT8lk5DDjbA3mV2WCD3uF/bcmSqJNR8zFFavBRXspg7M+
	YLOR5WexKfJUZ9mU3QZG3W9y1kxOX/AOq3nZsno6vOnNxvftpqqnnmC851xBVjqEOSEbzEmKkIl
	YQapj/SqtmFqPr7MPFYPmpsel4HfaTP1VS5Hh7/dekoyhwpkAUaqOIOjAunb6zPaMXlfWM2cc7F
	YduIsAELLkFABa/5nwZgfLdxcyjI3q4pplzHc546nXtQbdCB53IIzynTKJk51UariOP3lLARBJX
	uuE72bP+4qCVx3lmN7hHe5r0QwPb5MFgDxfZt01yCp0C6hhfPbeIPZaRTEtxEujBAN0H+T3T0PA
	Adl87Zm4dmVap7rTYFfN84bqp42ZfvuWddU4KYqwGIwBzVqNK8NndgoAIZTqtcetcCaU0uMhPVs
	A5zcipMuNj8oA+fWpRsB77u/lfQvTCwb1hhA==
X-Received: by 2002:a17:902:ebc4:b0:2b4:5dad:2523 with SMTP id d9443c01a7336-2b9f2815bb5mr27612865ad.35.1777716831640;
        Sat, 02 May 2026 03:13:51 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae36885sm47201105ad.59.2026.05.02.03.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:51 -0700 (PDT)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 4/5] dt-bindings: pci: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Sat,  2 May 2026 18:13:17 +0800
Message-ID: <20260502101319.2364052-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502101319.2364052-1-inochiama@gmail.com>
References: <20260502101319.2364052-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the PCIe controller on the SpacemiT K3 SoC.
This controller is almost a standard Synopsys Designware PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/spacemit,k3-pcie-host.yaml   | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
new file mode 100644
index 000000000000..be2641526b19
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/spacemit,k3-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 PCI Express Host Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  The SpacemiT K3 SoC PCIe host controller is based on the Synopsys
+  DesignWare PCIe IP.  The controller uses the external MSI interrupt
+  controller.
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k3-pcie
+
+  reg:
+    items:
+      - description: DesignWare PCIe registers
+      - description: Data Bus Interface (DBI) shadow registers
+      - description: ATU address space
+      - description: PCIe configuration space
+      - description: Link control registers
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: config
+      - const: link
+
+  clocks:
+    items:
+      - description: DWC PCIe Data Bus Interface (DBI) clock
+      - description: DWC PCIe application AXI-bus master interface clock
+      - description: DWC PCIe application AXI-bus slave interface clock
+
+  clock-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  resets:
+    items:
+      - description: DWC PCIe Data Bus Interface (DBI) reset
+      - description: DWC PCIe application AXI-bus master interface reset
+      - description: DWC PCIe application AXI-bus slave interface reset
+
+  reset-names:
+    items:
+      - const: dbi
+      - const: mstr
+      - const: slv
+
+  interrupts:
+    items:
+      - description: Interrupt used for port state
+
+  interrupt-names:
+    const: app
+
+  msi-parent: true
+
+  phys:
+    minItems: 1
+    maxItems: 6
+
+  phy-names:
+    minItems: 1
+    maxItems: 6
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A phandle that refers to the APMU system controller, whose regmap is
+      used in managing resets and link state, along with and offset of its
+      reset control register.
+    items:
+      - items:
+          - description: phandle to APMU system controller
+          - description: register offset
+
+required:
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - msi-parent
+  - spacemit,apmu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pcie@80000000 {
+        compatible = "spacemit,k3-pcie";
+        reg = <0x0  0x80000000 0x0 0x00001000>,
+              <0x0  0x80100000 0x0 0x00001000>,
+              <0x0  0x80300000 0x0 0x00003f20>,
+              <0x11 0x00000000 0x0 0x00010000>,
+              <0x0  0x82900000 0x0 0x00001000>;
+        reg-names = "dbi", "dbi2", "atu", "config", "link";
+        device_type = "pci";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        clocks = <&syscon_apmu 89>,
+                 <&syscon_apmu 56>,
+                 <&syscon_apmu 57>;
+        clock-names = "dbi", "mstr", "slv";
+        interrupts = <141 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "app";
+        msi-parent = <&simsic>;
+        ranges = <0x01000000 0x00 0x00010000 0x11 0x00010000 0x0 0x00100000>,
+                 <0x02000000 0x0  0x00110000 0x11 0x00110000 0x0 0x7fef0000>,
+                 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x1 0x00000000>;
+        resets = <&syscon_apmu 76>,
+                 <&syscon_apmu 78>,
+                 <&syscon_apmu 77>;
+        reset-names = "dbi", "mstr", "slv";
+        linux,pci-domain = <0>;
+        spacemit,apmu = <&syscon_apmu 0x1f0>;
+      };
+    };
+
-- 
2.54.0

