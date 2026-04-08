Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F5A37AA96
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775677332; cv=none; b=qfKBAKoWIjMSH2cDcOzUbbwzZkFUEhCEWMU99rJ+gR5uvZsJ/UN9kff9TAqkwP/gJGHFtA5vHXhHZApGrE7peyo1UiTvHcPN1BYTXIyuLQF3nlIjl50+3Y/6nyF3x5QPwQUcAKthgwycwrx1i04SrL0HDaUP8ZgczYXukb2E1uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775677332; c=relaxed/simple;
	bh=JswzvqIUM/Y0snFlKb+yBLx2iydNCgWMkhaiYqyvcrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oEvknxcbVq20+kcyXVP4BNUHiCLVEIjdLC5kbODI7psKWwNCDvVnk3CnvFvhv/95cPGCTIFKJJsS1pbpjNphQQlJ1L0jOKCB+POhsmgsKxWt6cX2WLOqEt47/POl/ieD2qC9ShcLvjEM5WXvu+3UTpcgkD6B5HKJiuIODf1GiWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUhKwJ1W; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUhKwJ1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775677331; x=1807213331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JswzvqIUM/Y0snFlKb+yBLx2iydNCgWMkhaiYqyvcrU=;
  b=jUhKwJ1W7gov/JYBLSaNT0h3O10vyWoQ945eo7O8Z+W4ON5fM+o3lZM2
   3ZK5pterbLXBKbKTKt+HVNITokkdZ/eOc1x4momVDn9E/F6UBGRxGuStz
   61LcVdddLIuT2YkjmVrko9hPOrSthY8vcnpKiJEg5jJgFbQfexsGxvcC2
   cp2iu14/Zt0IA/hRVrkzgTftsV1tp41sEK279hfDAO67835xq4lf8jQ9p
   gXniqtD06AJYICxN7FGKlWgq0XdfgX6raFanfBY/Ir0XK4oCugSDfTDvE
   +TXESbYC6tm0ONDXvEaMQDdfZqHbsK8y8dYGFiYJr1ec+j2j0v6Hx3Jbu
   A==;
X-CSE-ConnectionGUID: C1ka4QUnRQiYoPXHNO5KPQ==
X-CSE-MsgGUID: VMtmKYR0TO656RfrSuti8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88056918"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="88056918"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:42:11 -0700
X-CSE-ConnectionGUID: fU2drvZHTDqcQFHupFc6zg==
X-CSE-MsgGUID: ecX8swQCSCSeREGdg7ZbOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="222053381"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:42:07 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Dawid Glazik <dawid.glazik@linux.intel.com>,
	Maciej Lawniczak <maciej.lawniczak@intel.com>
Subject: [PATCH v3 3/3] dt-bindings: i3c: Add AST2600 I3C global registers
Date: Wed,  8 Apr 2026 22:34:35 +0200
Message-ID: <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775679285.git.dawid.glazik@linux.intel.com>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Introduce the device-tree bindings for I3C global registers found on
AST2600 SoCs.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
I wasn't sure if I should add newline at the end of the
file or not so I took
https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings/i3c
as an example.
---
 .../i3c/aspeed,ast2600-i3c-global.yaml        | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
new file mode 100644
index 000000000000..edecc18796a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/aspeed,ast2600-i3c-global.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2600 I3C Global Registers
+
+description: |
+  The AST2600 SoC provides a shared I3C global register block used by all
+  I3C controller instances. This block contains per-instance global
+  configuration fields, including controller instance ID and SDA pull-up
+  configuration.
+  Each I3C controller references this syscon node through the
+  aspeed,global-regs property.
+
+maintainers:
+  - Dawid Glazik <dawid.glazik@linux.intel.com>
+
+allOf:
+  - $ref: /schemas/mfd/syscon-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: aspeed,ast2600-i3c-global
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus@1e7a0000 {
+        compatible = "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x1e7a0000 0x8000>;
+
+        i3c-global@0 {
+            compatible = "aspeed,ast2600-i3c-global", "syscon";
+            reg = <0x0 0x1000>;
+            resets = <&syscon ASPEED_RESET_I3C_DMA>;
+        };
+    };
+...
\ No newline at end of file
-- 
2.43.0

