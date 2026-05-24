Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1C52F7EE6
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628456; cv=none; b=TYWwbXAMgZl1AoaJUVaDNmR5KSHuCcVrV8Fzm08z2Rec7IqMG+8GnhBP8UX+tf9fXIFor+/wz7LzWhN0Taq1QTPh8enRHwrXXmqGQ4iwfAHje8lQMAgnsd1W/A5wmXtRaXgW+kkoAzqgkqaLDKRW0inyah/5T1tGD2nzLGC8jhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628456; c=relaxed/simple;
	bh=5jZkQrWzMPJkfIzX3S7BWaNjPUf8WyPLKrjNr6dDhoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpzCSMD6L45Px4jQFwZZb1tWPhbL2VutA6tb2wkNCECgZLWC2Di2E5/C5UYa/7qzA1b45N2rM7QP2TGvmnX2LPSg6YWgI+AhOpjT+07quODLkllwZS0veABeMWF5c8p5/mvD77pyvCzq/w9b3VjwvBX/U85ROhZG/+V0pcERYfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoZO9iYi; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoZO9iYi"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8532ba6c95so135920a12.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779628454; x=1780233254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE8wJ3jlNRIEeJNM4GCaChXdFFOYYazZzeu2MkBYm4Q=;
        b=QoZO9iYi7O3arR3YafQ5D4r1iH/dVnURt/IW1C43rsBsStdxkC+LlB698SuJ9aw3Go
         T80ZJelaTQ4iyUsufyg3AVfQzaDByBYip9gFlHgJfIFntLf0qqjQd0wSDbXwZsMftZWv
         hsEpfa8VWvrOs3HN2R4OXHn1Pf8uyJMncXgBjKsUARruVO4jAC6c8meBf7Y4mWfAlC/g
         w59iZPJZ2Ueacs5Jf98su7/wf6/oa8SOc3q8i8QqR2EfqEaSQbvmuuAAi2FCL1y6lLZW
         Z+EPbtpmTt969ZOoqnQR5ob56kjV3Nabkv3IPzp3wT2IGvw2WJqee79r9c5zLMAzLXeM
         wViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779628454; x=1780233254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TE8wJ3jlNRIEeJNM4GCaChXdFFOYYazZzeu2MkBYm4Q=;
        b=RAKLT3fzmBAC+nI5CmlrIqwYxZqgI4Q3BCQv+QmAiUTzu3Fb5bSEurgLkK7B9Uqo4E
         JeH5VfhlRYvz+L/bYcq/K4TrVyTTLgk2dk7jN8/5y04kzq+875sjzk7twKAduFBoJYeB
         26VaGj1b55LKTRmw00YMIwoDU2qrB02GwSWpIOA9WKk8zQkzE+EN9ep1Q9DbGsWlL0O3
         fvqBsjvNeh1BGThZSA9VFByRmWHSDcf+rvHCeUJHDr9Rjj7et5nlRhlGe/6kcJ0JGx0S
         w8aRVSNhvzhhP93YE4qluahhrH09M6DSLqP5Le5iLdg+LUDBK5TaF5xKQOKVMFqaQlMQ
         E0sw==
X-Forwarded-Encrypted: i=1; AFNElJ/xGqj56W9E2ZUhhpimotejVr0H0mek+nGEbienHebzWUHgl+IjoFkZgJnAeiGpIs/v/KGxdLJGMims@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDM8dVj8X7uOzH3/gAPaWRMohgD9URMrI3zwhKlPiv7LEM6/w
	7AUZOGSIZUKMx91lOeK3VkMZ+wz0zkobzTb4AxIeqoW532F1hH8kOY69
X-Gm-Gg: Acq92OGoRoUqKPxLihtAba4c26SRMuhlNBwfwz1f9NYr/Dp1ayO9xhWqsomxrRub2TI
	VQJ4BQvIbAkHmiEtHwZra1Sf+GZuR2EKrEEsSckBayS228SceF/WhASZKybZ4CQ2mDbOyUMInmN
	OVxRS0ZIg8oznQ5NiKvhLNamHy/+SxS8bhGzENeQzyJcI6JNsB5/DvZ3bV028/V8HznG9QRDFky
	y8kqfVDu6Ui1TpkeOolDQZ/XdCtD2ikPVjC0fVRjxpFnBUFZn5KqnlIiHPkCG53XsmJiqJ7OwEb
	vVYlzYsIWV0MYDHNEsO09p7lRm1+S5BnGQ4rSxhLz3Ciwhjxg8+/18zWHWWAl3+GKkK8b7rdhgU
	CkaWMbfkjTUYNhI8w2xaq39xLe/DSWXgHCVf4wayHrRPBSXURgbsUF+eVxZBH55wScawcQLfszN
	asEhLoDanogAQ+VLNRpXFVWUO4S2w=
X-Received: by 2002:a05:6a00:10c9:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-8415f3640d3mr9954766b3a.35.1779628453867;
        Sun, 24 May 2026 06:14:13 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.159.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm7163128b3a.41.2026.05.24.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 06:14:13 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 24 May 2026 21:13:07 +0800
Subject: [PATCH v2 2/3] dt-bindings: clock: add header/doc for Siflower
 sf21-topcrm
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-sf21-topcrm-v2-2-4527aae05c3d@gmail.com>
References: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
In-Reply-To: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Yao Zi <me@ziyao.cc>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Add the device tree binding header and binding doc for
Siflower SF21A6826/SF21H8898 toplevel clock and reset module.

CLK_ETH_REF_P is a clock name that exists in the vendor datasheet.
This clock connects directly to CLK_PCIEPLL_FOUT2 and there's no
clock gate/mux in between. An alias is created for this clock
to make available clock names align with the datasheet.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 .../bindings/clock/siflower,sf21-topcrm.yaml       | 60 ++++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf21-topcrm.h   | 42 +++++++++++++++
 include/dt-bindings/reset/siflower,sf21-topcrm.h   | 25 +++++++++
 3 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
new file mode 100644
index 000000000000..3782d9c32370
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/siflower,sf21-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF21 toplevel clock and reset module
+
+maintainers:
+  - Chuanhong Guo <gch981213@gmail.com>
+
+description: |
+  The toplevel clock and reset module on Siflower SF21 SoCs manages
+  the main PLLs, high-level clock muxes/dividers/gates, and some
+  reset lines.
+  Available clocks are defined in:
+  include/dt-bindings/clock/siflower,sf21-topcrm.h
+  Available resets are defined in:
+  include/dt-bindings/reset/siflower,sf21-topcrm.h
+
+properties:
+  compatible:
+    const: siflower,sf21-topcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/siflower,sf21-topcrm.h>
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        clock-controller@ce00400 {
+            compatible = "siflower,sf21-topcrm";
+            reg = <0x0ce00400 0x400>;
+            clocks = <&refclk>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+    };
diff --git a/include/dt-bindings/clock/siflower,sf21-topcrm.h b/include/dt-bindings/clock/siflower,sf21-topcrm.h
new file mode 100644
index 000000000000..1b2e3cde931a
--- /dev/null
+++ b/include/dt-bindings/clock/siflower,sf21-topcrm.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+
+#ifndef _DT_BINDINGS_CLK_SIFLOWER_SF21_TOPCRM_H
+#define _DT_BINDINGS_CLK_SIFLOWER_SF21_TOPCRM_H
+
+#define SF21_CLK_CMNPLL_VCO		0
+#define SF21_CLK_CMNPLL_POSTDIV		1
+
+#define SF21_CLK_DDRPLL_POSTDIV		2
+
+#define SF21_CLK_PCIEPLL_VCO		3
+#define SF21_CLK_PCIEPLL_FOUT0		4
+#define SF21_CLK_PCIEPLL_FOUT1		5
+#define SF21_CLK_PCIEPLL_FOUT2		6
+#define SF21_CLK_ETH_REF_P		SF21_CLK_PCIEPLL_FOUT2
+#define SF21_CLK_PCIEPLL_FOUT3		7
+
+#define SF21_CLK_CPU			8
+#define SF21_CLK_PIC			9
+#define SF21_CLK_AXI			10
+#define SF21_CLK_AHB			11
+#define SF21_CLK_APB			12
+#define SF21_CLK_UART			13
+#define SF21_CLK_IRAM			14
+#define SF21_CLK_NPU			15
+#define SF21_CLK_DDRPHY_REF		16
+#define SF21_CLK_DDR_BYPASS		17
+#define SF21_CLK_ETHTSU			18
+#define SF21_CLK_GMAC_BYP_REF		19
+#define SF21_CLK_USB			20
+#define SF21_CLK_USBPHY			21
+#define SF21_CLK_SERDES_CSR		22
+#define SF21_CLK_CRYPT_CSR		23
+#define SF21_CLK_CRYPT_APP		24
+#define SF21_CLK_IROM			25
+#define SF21_CLK_BOOT			26
+#define SF21_CLK_PVT			27
+#define SF21_CLK_PLL_TEST		28
+#define SF21_CLK_PCIE_REFN		29
+#define SF21_CLK_PCIE_REFP		30
+
+#endif
diff --git a/include/dt-bindings/reset/siflower,sf21-topcrm.h b/include/dt-bindings/reset/siflower,sf21-topcrm.h
new file mode 100644
index 000000000000..fa700accff54
--- /dev/null
+++ b/include/dt-bindings/reset/siflower,sf21-topcrm.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+
+#ifndef _DT_BINDINGS_RESET_SIFLOWER_SF21_TOPCRM_H
+#define _DT_BINDINGS_RESET_SIFLOWER_SF21_TOPCRM_H
+
+#define SF21_RESET_GIC			0
+#define SF21_RESET_AXI			1
+#define SF21_RESET_AHB			2
+#define SF21_RESET_APB			3
+#define SF21_RESET_IRAM			4
+#define SF21_RESET_NPU			5
+#define SF21_RESET_DDR_CTL		6
+#define SF21_RESET_DDR_PHY		7
+#define SF21_RESET_DDR_PWR_OK_IN	8
+#define SF21_RESET_DDR_CTL_APB		9
+#define SF21_RESET_DDR_PHY_APB		10
+#define SF21_RESET_USB			11
+#define SF21_RESET_PVT			12
+#define SF21_RESET_SERDES_CSR		13
+#define SF21_RESET_CRYPT_CSR		14
+#define SF21_RESET_CRYPT_APP		15
+#define SF21_RESET_NPU2DDR_ASYNCBRIDGE	16
+#define SF21_RESET_IROM			17
+
+#endif

-- 
2.54.0

