Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA57B369991
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128287; cv=none; b=ox1h0ZnK+roUnNfApvgullVg+PJiGGkvG+15Xe/TPeszfXE4RwZAOsi1SfwiYeB1p+MY0/y8V9vThBMQP0/2cpRh6MHFgENMoyHvBX4QN9ZTLUBm0yAA3XTVoLktL9iccWneTItZHUgBPL//efBcYZGcoZ9xgNPcQ+1ztyFp7X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128287; c=relaxed/simple;
	bh=K3MvCrFWzEsIrhBWqxeXc3gdx6o84wogtYscdysHXgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FseqwALLtRVuWs1HS9nsWfwJKKxbCPhPdA4oRq3RVceDvbdp0CCFfhfcAl7m8SEvXyuQ9DYgrxhoiz+GXDt5s20G+0zZILM5h3muVKHJL+ZccnzoYVtgj3rFIL18iYwPero/53fQ1Lo+vqUwa+btoAVsp3OWpEIz4F2+UaeM/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYy+jVNO; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYy+jVNO"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso280893a91.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128285; x=1790733085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcDcKCilMboIAKoprvjC5MEiUMCPSH4NgyIgQJv6TvI=;
        b=IYy+jVNO8gGai7oroWThR4rrgPBs6JPxtafEtpevXzFIrf7NqyAwomdY7knJX6eeHd
         ZL3BTDmzishepDYD1iUhSUj60WZulSePYMpGiqYSITxxKZzKZ9LovpcWgj4vpvKd0Jl9
         4b8H3FFnyhNw4sJXNqYI7AROYNkJ4qDCpv/lAwkfCVFsaugzoRUR7iVjgFRtIkv2OaJf
         TmbXdU6o1jr88bv+NQbgWnbrt5XsF64vNlqfUZVYrAZf5v8Fd3TlraTHPhbRaJ+QmAsN
         YvJsTS2f4e2axs2fUtbl2ypyQp5B5QCK7p+GtR+KuY+VeKzPoqkQ39bpFmAHvbUSVwOk
         HA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128285; x=1790733085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcDcKCilMboIAKoprvjC5MEiUMCPSH4NgyIgQJv6TvI=;
        b=0FGHV4+72ZaJjq9NpInXict2SLIgV7+yEJBHhYHs92gaosIjcuQyCCyRqYBiz87h7u
         zZ6QAUhmvm78wjp307kJgDUCyNqGdPCmvwxKd1NQz8XIVYGYe3FVFqQw6vNKtj2uNbbc
         cIeund8vdocbMMHcO2jftmXJxLDmrCYg9gPxtykDLP6zdBmJzV6+Sy3txE251NDjzZdI
         kE7Pi6Es7OeL4pTkTBB0GMMowquUEWdN1GEjhwcK6SGo5tjP0mAaCkrA7Y5aUIcNzAkj
         gLe+if/Gy/JkHKwILnSR7UzEWAGgfN4fVlEK4Tz+BNs80lVxN/NDUbaPnYd+S7rQnQy2
         AV6w==
X-Forwarded-Encrypted: i=1; AKwUvByhIaZB2Iwb8BVxdd2lNTLaPqsDzP4Cf/C72EdjTQYdoZZYrZy/908Hv0736zW4MzObEQVjmwjLgNHw@vger.kernel.org
X-Gm-Message-State: AFuF++mLFaHGNu40L/G5g6TncHmJcyxjo88gIzDroXEzbldj+K9B9s/+
	NmgqX6X4jIJTR3iJof/WAhU+Z/G5uwM1lktyIdMmq7+eh6Ng8/tAjDjb
X-Gm-Gg: AYBFou3ZRd1PrY2dB53HVYwN+QB9eskrCkIY50IJnqnp+Cxk9EewY0w9RCZ8AJk1TZj
	OhXe0CUtwGLaOcnGoXLnR/r2/Ez99avYIlGC/rrIicWs2PFHyQR8VMNeSYzeJKD8ApDe6zrx55C
	ZwrJmA6hui6q0D2xq2uP1E5vmE6hqOEqsgZyEnVodd2Ufw41RW7r+goXbuvJH9J+YUELGtpNz5C
	0YO0aqJeEbtZ1F33eQXj/qigUhVrvh0CaA3ImGiPvW2Eh2nYMIfokS09h0pjCiiTjNgw8ntH/QO
	cKwcJTUuHCH4xotCj50XJGGr1Zb7gLjcLZbv0400I0ejmOzNIQvpcd9cMf/iqQVVq3NAPXXi71u
	OTscvDvX8CWrR0hnAfxzQIzg0dy9DIAUYYFoZJRf5txwo8i/bEw0N+yWiNIuWNkbZ6ZBbEATBJi
	V2Znj3KCvO5rh6GsyHVdJe1jrWDkGYPJsPKNWuO7kxPnP3CbXcUdKZDi2CRw==
X-Received: by 2002:a17:90b:5646:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-3a07e54a847mr1105625a91.11.1790128285046;
        Tue, 22 Sep 2026 18:51:25 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc01df8sm1881084a91.10.2026.09.22.18.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Wed, 23 Sep 2026 09:50:14 +0800
Message-ID: <20260923015016.64069-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 55 ++++++++++++++++---
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..af32e427c0c5 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SpacemiT K1 PCI Express Host Controller
+title: SpacemiT K1/K3 PCI Express Host Controller
 
 maintainers:
   - Alex Elder <elder@riscstar.com>
@@ -12,28 +12,32 @@ maintainers:
 description: >
   The SpacemiT K1 SoC PCIe host controller is based on the Synopsys DesignWare
   PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
-  controller, and supports 256 MSIs.
-
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  controller, and supports 256 MSIs. The K3 controller uses an
+  external MSI interrupt controller and may use multiple PHYs.
 
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
@@ -66,6 +70,8 @@ properties:
   interrupt-names:
     const: msi
 
+  msi-parent: true
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -84,7 +90,8 @@ patternProperties:
 
     properties:
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 6
 
       vpcie3v3-supply:
         description:
@@ -96,13 +103,43 @@ patternProperties:
 
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
+
+      required:
+        - interrupts
+        - interrupt-names
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

