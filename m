Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B123EC6A8
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143792; cv=none; b=Zbv6c0s1TOtbveT1jPM2fcrfU5WIybB1llH2s1FzJQxndEsXd6qbi1hV5jCe5ui/m9ohEba3JxTEc/i5DUMrRyCnos2A30eGf9ee6qHW6Z2N9I15OGHr9SiBOlmLYHwPwspuVoGC+o9nLOxz9G7fiSKH2RBumJsNzDX04CoH/M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143792; c=relaxed/simple;
	bh=Vln5pVRWGcKJ94GRT0+RUkj+Q2YrC+MhJ0jq5oTVKyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fu+Gjg5qy6hWyC3jhvNuQPZ9pcQDhsGFUWTs7yhrgZU5kpZ6khCs/eHawK0/pSPsRu2w474TGTiK46v0CsQGeVbSJ6thcaY/ppVx+J0+Dc3lUHqilO/PiY+eBMauc7pBUnKv/tXj1JbdJbM02WUO+uHDOFoeCPqVIu6TsaKc6xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gG2jUrr8; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gG2jUrr8"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so1691826a12.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143790; x=1785748590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiS2cO5E4x0Awi3aXHlbjiWygQvLxKx4fGNRAdhWDNQ=;
        b=gG2jUrr8K4/PnwBHTa5/aKr4n6nf7l6HKbbIDeflKQX5rbU4TXQbPHEXfpYzQP3pEl
         7ASY0A07+6cirrr9SM9A0kcG94K1ujfPGGfq1+6h46Vb+6ImhMvAp8ckqMAkI7cexxbe
         /oFrida8mpt+022+eJB8Ans+hVhp8Uon1rO58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143790; x=1785748590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eiS2cO5E4x0Awi3aXHlbjiWygQvLxKx4fGNRAdhWDNQ=;
        b=U9+WEc9xXYsOlrxRY3qnaGap3I1QbcUCjnSOkfwLhsm6KC7ou9zCgWU9esd3ZVyHyb
         7N2GJQctDcZ0yB8HnPusZxwMYw+HcAh/X/G3Lg4a6asyZpCYxD6EXTo7CHZp4PaQ+vvQ
         iGRrXPAPuvswAuhVw7FTYxPwrsuGXTRMtOgj2iBr/8g4Yicfw6QonRfi++IA1KYvtAEP
         D8XAIwwOWUT6W3vS/j2vB96kCrIRsmlPFz7iyS4rahw6Pn9k4xeuW8fEWhFI5YySm2om
         AI72fq9kHfC6HmnH95vosRdelp8bXk/HXuU9LIDD0MQpDidtozjHnDyLlRB7mtYSGU1Q
         bQeQ==
X-Forwarded-Encrypted: i=1; AHgh+RooahKhDrPPOUiBSXPJMwgbKRSEkKTbfopkC668CKRc4dk2uLlWIetI9rUn2aBibvKyd7a9LFj4nDXC@vger.kernel.org
X-Gm-Message-State: AOJu0YwwQci8gDXWZ/TN0zNGTyjQpezCKl3rn9eggFZze8gn9bf80SN6
	Ko+mEKxlHjmJV/2dZPUweW2kVIBGBqptdYTE8jXHBKAyYMTKK7+W/Hlw9oeplAD+mA==
X-Gm-Gg: AR+sD11gzIq1LDuF/Is8pOxdUtmPrqxFFcAhgIiLYqUPiu3m0xRSf2II5O9pv8wNdX6
	4OaF3L7rfYkZeqWCDh6XRPhtSAHfz8Lk/vdVZQ4DFB5ACvOamZPK6lIrJC2rjSflNRbOrrnd1zv
	ynhHeYHTJc4zD6mlLed1H46NO5u8ORmF+TVmO31kewkeLMDjUzJGYIwdgYOz+vRLq7i9I24SxIp
	QS4ApZNnG/Hp642lI+2JljzdxISJATgsEw12nW2XFNWdQJjbj5Luu1AVbrZM7yqN95mvC3n8hjn
	/irFGW7TlwvPzqOPyErl5u+vp0DVQfg/WW2qZ3oiyTE8uNx1rDsE3jPG4r3jbWgSL7k/w+WFzTz
	KjYyHKW5kTGIXIte6bbpojoPZqhojFaCFJKBXFeUpNkKggjaxuIQnZYJHKIMRCs89XsXmSKktN3
	Ik5pAIMITtgF9S9c9rCzZ+8DLqA4z7gPZvmbP9U2NGI+bU6/eyCeGxe9Uydg==
X-Received: by 2002:a05:6a21:1644:b0:3bf:8de9:c64e with SMTP id adf61e73a8af0-3c67eecb1fbmr6693314637.2.1785143790405;
        Mon, 27 Jul 2026 02:16:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Mon, 27 Jul 2026 17:15:50 +0800
Message-ID: <20260727091555.1023910-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

The clock gates are exposed as clocks provided by a clock controller,
while the power sequencing bits are exposed as one singular power domain.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../clock/mediatek,mt8173-mfgtop.yaml         | 70 +++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |  7 ++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
new file mode 100644
index 000000000000..03db1ee9e594
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/clock/mediatek,mt8173-mfgtop.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8173 MFG TOP controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MFG TOP glue layer controls various signals going to the MFG (GPU)
+  block on the MT8173.
+
+properties:
+  compatible:
+    const: mediatek,mt8173-mfgtop
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: sys
+      - const: mem
+      - const: core
+      - const: clk26m
+
+  power-domains:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - '#clock-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/mt8173-clk.h>
+        #include <dt-bindings/power/mt8173-power.h>
+
+        clock-controller@13fff000 {
+            compatible = "mediatek,mt8173-mfgtop";
+            reg = <0x13fff000 0x1000>;
+            clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MFG_SEL>,
+                     <&clk26m>;
+            clock-names = "sys", "mem", "core", "clk26m";
+            power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+            #clock-cells = <1>;
+            #power-domain-cells = <0>;
+        };
diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 3d00c98b9654..89e982f771db 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -243,6 +243,13 @@
 #define CLK_IMG_FD			7
 #define CLK_IMG_NR_CLK			8
 
+/* MFG_SYS */
+
+#define CLK_MFG_AXI			0
+#define CLK_MFG_MEM			1
+#define CLK_MFG_G3D			2
+#define CLK_MFG_26M			3
+
 /* MM_SYS */
 
 #define CLK_MM_SMI_COMMON		1
-- 
2.55.0.229.g6434b31f56-goog

