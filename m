Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F103E4C71
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779968187; cv=none; b=U9M15R/vAMt1ee+hxYUhVFBxf8zEow+zQsfHCNRGjD0Ut1xE0Bzcl4C0CNVUBez7HSrXzJiHtXUOve3esDUnBqzW7QUP7QbHD7btKxzY65vII+JxV6CXUIwUYWKqbaW9WNzx5LmE2a+T0vVDdxzu4z60fOucTj4kkXdgRxyn9v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779968187; c=relaxed/simple;
	bh=YiVpGFmnk6c+4tCGKYqMcU8qmH5daodRYRGzWhkV0LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1O2/x1BkYJEOXPH2FmnwYz7sWSEjZMoML0kGJV1d5D/vVMt3DoFVWtOCxPJ6s7t2d/7vFxHG5IvkvuUIs652OtJc2oqehuweIBOryoy9mqctXUF5dufr/w7SIEQlyuSJ/bTkx5lmQT5f5ZSIcJA1LegBQ4maulCcHSHcC8kaiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LQFvEqVk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LQFvEqVk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso65719315e9.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779968181; x=1780572981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8X0F5bMpj7Hkv7PmV60JbdJxUXi1oD+oGZuG7k+zKY=;
        b=LQFvEqVkiU4BxT3z+BIF1rAzW0RamAdjFg5QhS+H+r2TMRHc7+WyZdDQr1T/pcW0ib
         dNwYDvhm7pnQfmLF8Xp7fB2rvUe0VcfoEnS7UzKJfw8DgvZtU39OuGHk5QO4dc68RyFD
         NvmnDGuCMnDY7MUqB7FgHPIYeYQgho1hxucuY/8GBm6pmmyb1U23/v4u62SeCII7O24V
         rWvZsVcGNtK6OeMUqGLG2n4Xwwoxt+Xq0uJir+L15lm1SGyuA5gk8k+bx6nzX+DMiVh7
         YpqmHdDOnGb4JVFZuztiq8P3HHTUpC/9ccebZEvPK3VxI9GFkAR34mKdQNI0Qdfl1mbi
         mzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968181; x=1780572981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8X0F5bMpj7Hkv7PmV60JbdJxUXi1oD+oGZuG7k+zKY=;
        b=r96VxpruwjttQbFxZetkZ4p7qD3ykndTKG7bUJpgb7vEXRhpIOGVqj39G1lcYVpMso
         MCqrw0Oybmva7P80QrSY8ylwIuygOb+5AvGTDXVHN5pOhaEZE6IdKopo61opspEuIR85
         g/kaIrmB/ci14xLe32A24F6xpvVVf/wooE97BVRDnEiDOLO0bT/bwbk/Bx+loM+VrPIM
         M1o8kDO+UEgVz+B14dqXUYnyH0QozguPTJ5qZsjCNIuU+wvKBZcr8cq9GSdGyGwo1zdZ
         81pXo4vu/tJqMNb7wj35H6IVvWSLJSl4mDxGF617M+Zx9KQqoz8IZrGB2HyKO38d+cG0
         EVFA==
X-Forwarded-Encrypted: i=1; AFNElJ+La58Xz8jBWUZyhbg45FQIXwapFO3y/C4LhEAng5H8zqSZcAuMsD8Xn+3lpldwvWotsn79U9LJn4rQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywemun98E+ah5iJf7UU9Wul0tVppQJBWELetWC3aEK5I/aAyCdt
	VBTjUsSc/yRxo+n1MTpf9HCETQ2nuo5lxpDmzh2zhvbuxBAdxENWrgBD8kSOVCSJ/TY=
X-Gm-Gg: Acq92OGj9r9lGoBsT7KC+pvAYbNufp6J1bx6LeZhEuDDr9D9Kk3TIQ5swWiJyuhIITR
	lIw5KRfcidueT3CYqVzhPSm8cJ4chb+DnENsiWIvaBLK0kjn0z4YNgI88RSv+DSEnbDpckfmLwc
	T8pcu6WGqdo0jY5CiWAXkbxuHeBilqVACk96jYvfAOrOS57JhUobfOGtA0FIvp3XZXC32Sll5Xx
	MJsUtYMbiNO2qW3KjArBQJzWIe/FpHSBQZ8+LPiYk4EDiBwkhRuzlz9yfDTOJfWAVu6cj0cGsNJ
	vcT+xp9+4860zA3W0hcPFsHNLPDwF8/xLgEQ+w6YqcVN+id69BHWUbjoASQXRI/RWy7D0K4RJ2T
	ETKptkFnsk1Sgi72OnjgRVO8Cd/C2wz2lur8TTVukyh+jpf4dfQjwJvr0gTztLFr1uumGwCvIsO
	9Pn1Cnr0DaMWQgpHCClmPLfjHUoN7DmE8WrMiDCM388kwphcYr4H7ivZpcXVRBAL6CsQMY52e6A
	6xuimB2jDJBUd4tQQ==
X-Received: by 2002:a05:600c:45c9:b0:490:5cb3:e94a with SMTP id 5b1f17b1804b1-4905cb3eb81mr310813075e9.2.1779968181393;
        Thu, 28 May 2026 04:36:21 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm60385715e9.12.2026.05.28.04.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:36:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 28 May 2026 11:36:14 +0000
Subject: [PATCH v6 1/5] dt-bindings: thermal: Add Google GS101 TMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-acpm-tmu-v6-1-b4d7ce57594b@linaro.org>
References: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
In-Reply-To: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779968180; l=3394;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=YiVpGFmnk6c+4tCGKYqMcU8qmH5daodRYRGzWhkV0LI=;
 b=KtZZyG3wFMX+r73Y0exw3WifuUFyiDSfnquCr3zbzt8yf/d1DHw1KK3E58IWx64pXNkgFEDQX
 NMbQp4qP6EUCyGu1lg/K1lswYaAFwiDzq2ttHrLzeJ2KBMkuaBie3CW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.

The GS101 TMU utilizes a hybrid control model shared between the
Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
firmware. This hybrid ACPM TMU architecture is also present on other
Samsung Exynos SoCs (e.g., AutoV920, Exynos850).

While the TMU is a standard memory-mapped IP block, on this platform
the AP's direct register access is restricted to the interrupt pending
(INTPEND) registers for event identification. High-level functional
tasks, such as sensor initialization, threshold programming, and
temperature reads, are delegated to the ACPM firmware.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
new file mode 100644
index 000000000000..75560ebca48d
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos ACPM Thermal Management Unit (TMU)
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description:
+  The Samsung Exynos ACPM TMU is a thermal sensor block found on Exynos
+  based platforms (such as Google GS101 and Exynos850). It supports
+  both direct register-level access and firmware-mediated management
+  via the ACPM (Alive Clock and Power Manager) firmware.
+
+  On these platforms, the hardware is managed in a hybrid fashion. The
+  Application Processor (AP) maintains direct memory-mapped access
+  exclusively to the interrupt pending registers to identify thermal
+  events. All other functional aspects - including sensor
+  initialization, threshold configuration, and temperature acquisition
+  - are handled by the ACPM firmware. The AP coordinates these
+  operations through the ACPM IPC protocol.
+
+properties:
+  compatible:
+    const: google,gs101-tmu-top
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB peripheral clock (PCLK) for TMU register access.
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  samsung,acpm-ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the ACPM IPC node.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#thermal-sensor-cells"
+  - samsung,acpm-ipc
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/google,gs101.h>
+
+    thermal-sensor@100a0000 {
+        compatible = "google,gs101-tmu-top";
+        reg = <0x100a0000 0x800>;
+        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+        #thermal-sensor-cells = <1>;
+        samsung,acpm-ipc = <&acpm_ipc>;
+    };

-- 
2.54.0.794.g4f17f83d09-goog

