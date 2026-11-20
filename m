Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180290;
	b=FyZEnQQuVOfF/gt8Veh/p3pOX1PNSwIOvmsQMB2bGg3SlcYGr3eTSoPn+U0G34FW/8ap
	 rfolXYZY+M2XgSFwugeal0t/tmlvvcCCzJF34kI+YPmS6SvKdELTdnEb/PKhTYDZnbVw+
	 zVzUHghipGYjPnZPfKqcuJjBfcb61xkKf7EiSi6eAxDIai8sB9ilBlb8LzhUKXnOk1+Tj
	 FEFsgZC7rpfslPJ59sL5uATnl6fKDDA4kgRCnUyn5zy7Pkw4vGO/SvLhvou45k0kdBJjR
	 cJJ0Oex4AodLQMPCrTU9zCZU0JjaFrAamfs2Xt08VhOLL/JAezXsWmqxqFd2MwB6Jgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
	b=UamIl0ZdPevZSEgi69aWkeqJKSH+UEALeDiKK9/OMkdPxIUizFngsNMRgLArJClciQC3
	 3qG4atgM1ddhPylst1Sw62ABKn6+87kB4tEiba/ymeOmkPDWKGG+TAnw6bkVRqUYP8p0b
	 3sJfPUbKyHMXFZpMrIl9mZv2hfTK2+bnkJIVoRmYFApNZrEG1ILkVvXVBh5qqyK+3FJKk
	 EJ9UGSUoTkVPQ27KZWxte9GpZVYvWKmgrJsuI6oUEOTYvgGaNw09eA+u85TVlpJ85B2PE
	 oT8SDdQP/eU/Wb1e5tOo9eNfuyhly+4t8ipRLUhyac5XGHJllw7VrG2SU+xL+SrGBWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mY+f9A3T;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19DE60A382F
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C19DE60A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mY+f9A3T
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so15754525e9.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180288; x=1795785088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
        b=mY+f9A3TKxj/WzAusDlIW/+s6W4JA3ZIHLo12KNu/QQm40xJvwPIM0NvYEJgGNCbDA
         XD6/9zB/rXsqskJWHtj8lN2SzsQcwd6MULfajknKrLNIIJRgFYobLtbrsAibCKAz300s
         htPwLA89dXOF97Cd8fc77k3lhJenl6CsnF8KJ71cJUl7+861SYH6U+DcmEu55SSLWOWJ
         akFhMt1yx82EwKOSTpNMKgQ0zVWg1Bi00pHI3l15kbHKUNBwEvs+UOdRJJQfQ/v/xqC8
         xPb756XZr9S5FeS9782nvGlHAeR4ygHNf7MBw49d+ytpIf8ejOLkrEwyEazZn+6c4NhF
         uUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180288; x=1795785088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIvCDJpa40Tl9Vn/MvN+Cru9DXKUNkGj3pSvXbgmumE=;
        b=FsuCYh6eRrwFrqTm55OXbu/Afr3IEQFtbbIkUfmAVND+FT1F4aDHAJyEmiOI0sZfhj
         JhdzI7rkyrS7DftyMEMh0ALT4NIIA/aEgUiAUH49Y5VuUfp02xwVoeT0xW/xSUCd76VU
         Y7pWKlL/hfuUVDDBJpnM8B8DuyAuZm5VYf15UM8wzMbPWz2dEWR0UtgPq/a2jahKETFw
         N45sB5MsBthVCPBRoLbaJlPgBlKtf9nsLkapl+jW3OUUlBifXiXP2WnPwfSgp+m+Nix/
         f1FRIcGXMxHme12vEVyrvDUaX4Z7GFJRIkb3nWTowiNcifJ6K4MEa57UEfN+DrqwzcqC
         KqiA==
X-Forwarded-Encrypted: i=1; AL+hErEb1B3pvyUvUeNkASxLLbmqqxBMV5TnA4jdTXlM0BnYKMySTLGfFU8aNnHnbAH1Z5BUxwp5w1gKw0Dw@vger.kernel.org
X-Gm-Message-State: APuU4Z+XeMi4SthHV2+2gUZH1w0T2Vf5GlLAFe+2gT0jrgTYtEXRbAzw
	yfyjJWrrJ1Cg1kqmts3HLz5nZfc747rLh/+tb6WspV3PAbyc+1Nerh7RdSbv10USMyE=
X-Gm-Gg: AYBFou0gJB5myGLl6nxeCq12do8uIRcfHLdn7si6zBANYFw7WH/E9YuL9UltsE0jbIB
	ARbJjjLLu9X97gulQBMYsfaC/6qkUnW3fg73u1/9nsP3hMqdg5iC6p93VRlUCTiZGC0vnpJJepK
	sobbbXrHNacoMwCsU0aDFfuzVWzmEysQnKz/BQt+CESfh8NElV/tr66PrDV8sRzbIb+QjPw1661
	gi+qlWQTWfntBwzV1Qo9VoPVLub5MZe1CTOw2KvT8U6hMW0kv+HSysZYnVHnLI83XD+qtR2YKdr
	eUwdOgQwYoigvqovAvVgXByPT59lVe7X+ZeLvt9XQTEMnubPU48KJrT9E7hNWMDPYETxfyBfsub
	j17h32zgxcCVgl/BnlKttocSNQO1XStkK9CJDuiOBThloSPSNdrNpPpdL5DnPydjhH2/b8Dxzek
	LGkIXeS9Lwk5olpsPE4XA2loQxDm498xK3jcSbdaDhOSCm3EVq32pc3uejvvtqq7GlfFfLcIDRJ
	eSj5VGbjyM3LbegZ4vlA4kIqrQhhCBosPVB18Txmiid31Ob8zhLVROI5DSSiKUnIha6emNLUjaZ
	NKN7fvxsa3uAXSAsd+Gj7mbASWVid6/tkyn8mMJyBAr6EG0+//uF3w8vzYnrKnhWg4L9Vhmcwuq
	08E6SEOt2DLqEH0SOYDVMrKSvHHLK0Ie+XLuZ2LxHR4MiDw==
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr72814425e9.0.1795180288235;
        Fri, 20 Nov 2026 05:11:28 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:27 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:06 +0100
Subject: [PATCH v2 3/6] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-upstream-s7-clk-v2-3-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

The S7 PLL controller supplies clock sources for the peripheral clock
tree and receives its reference clocks through firmware-controlled
oscillator gates.

Add the binding and clock identifiers needed to describe this
controller and its connections.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        | 71 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    | 42 +++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
new file mode 100644
index 000000000000..1984cd42fda9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 BayLibre, SAS.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s7-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S7 Series PLL Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Carlo Caione <ccaione@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,s7-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: input fixed pll
+      - description: input gp0 pll
+      - description: input hifi0 pll
+      - description: input hifi1 pll
+      - description: input hdmi pll
+
+  clock-names:
+    items:
+      - const: fix
+      - const: gp0
+      - const: hifi0
+      - const: hifi1
+      - const: hdmi
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@fe008000 {
+            compatible = "amlogic,s7-pll-clkc";
+            reg = <0x0 0xfe008000 0x0 0x1e8>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 2>,
+                     <&scmi_clk 3>;
+            clock-names = "fix",
+                          "gp0",
+                          "hifi0",
+                          "hifi1",
+                          "hdmi";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,s7-pll-clkc.h b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
new file mode 100644
index 000000000000..6bea314deb31
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL_VCO			0
+#define CLKID_FIXED_PLL				1
+#define CLKID_FCLK_DIV2_DIV			2
+#define CLKID_FCLK_DIV2				3
+#define CLKID_FCLK_DIV3_DIV			4
+#define CLKID_FCLK_DIV3				5
+#define CLKID_FCLK_DIV4_DIV			6
+#define CLKID_FCLK_DIV4				7
+#define CLKID_FCLK_DIV5_DIV			8
+#define CLKID_FCLK_DIV5				9
+#define CLKID_FCLK_DIV7_DIV			10
+#define CLKID_FCLK_DIV7				11
+#define CLKID_FCLK_DIV2P5_DIV			12
+#define CLKID_FCLK_DIV2P5			13
+#define CLKID_GP0_PLL_VCO			14
+#define CLKID_GP0_PLL_DIV0P5			15
+#define CLKID_GP0_PLL				16
+#define CLKID_HIFI0_PLL_VCO			17
+#define CLKID_HIFI0_PLL_DIV0P5			18
+#define CLKID_HIFI0_PLL				19
+#define CLKID_HIFI1_PLL_VCO			20
+#define CLKID_HIFI1_PLL_DIV0P5			21
+#define CLKID_HIFI1_PLL				22
+#define CLKID_HDMI_PLL_VCO			23
+#define CLKID_HDMI_PLL_DIV0P5			24
+#define CLKID_HDMI_PLL_OD0			25
+#define CLKID_HDMI_PLL_OD1			26
+#define CLKID_HDMI_PLL				27
+#define CLKID_HDMI_PLL_PIX_DIV5			28
+#define CLKID_HDMI_PLL_PIX_DIV6P25		29
+#define CLKID_HDMI_PLL_PIX_DIV7P5		30
+#define CLKID_HDMI_PLL_PIX			31
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H */

-- 
2.56.1

