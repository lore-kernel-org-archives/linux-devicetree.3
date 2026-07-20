Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56BF3890E5
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516798; cv=none; b=aLN1Fpkyidcvh5yHYUhrVRvlO83MRy1d2/BwKwunVYggviaRsYo2xXItdD8wErQOpaEKspcCP4V2Q2Qgyfh5D0l/b5gUREnmrcmQLASAuhDDHPpXjvHUH+CJx6M5itEoKP3azNHGchCnkEJs3WBAx6hF/DeO6GBnhIriZkLGVSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516798; c=relaxed/simple;
	bh=O8MDKZM6orbok+3kIkwxaUSh/e4nFOYJeY8hZUI/E60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dx4SWB06kUAe7Q73idr3RtmnZqO2wKDmL8mmq71R6zDWJQ4hJFLAdkEGmY8q+OLXuMOGPOoZJC4ayeOk/ZNQ67DWuch2Y6wxO1PYbasDGRdq8wCpT4St0iRRSwTPg87vBMqmyxcctVpH2DIGBx/gqqsUbuob+EfoiZSKfw0hlX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgMFSzMj; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgMFSzMj"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-845c92bc464so5502886b3a.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 20:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784516796; x=1785121596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=sgMFSzMjOjwiUHZHOtNaGB+y56kiarGVzKy74gONtrf5CXNUkAU4W2madwlw42knkE
         Ava2y8cr9B5GyoxefZQCwqY0y9lCLPl3AFaZ8EM6H0revWu43vOQ61onutQTHIB0WIH2
         17sinGLyVuC1nVVC4rXNu0oxCheH5emVDBrNVA3AZCW8rSSOF0AuKnJ0tXs8BmogcU0H
         gG1Cj8orJh6VNQ9pksAVba48TiDf880dQLgpLuXTYr7tQdo3LRUc/HGf3aK08yiAuQKG
         vB80flvUwmoOM1N47TNj54ndg/AqLZW2MxcJWE9Y6IMZHotT4nIDl7ax5hnB9DWmK6/9
         UHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784516796; x=1785121596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=Ka9/D4sIqAUXH68Np7g+Xcw9lnUyNh5//UiuJTCYSXhaBd2/wgt21TRf3hBs68ZZnm
         GPnL8EPZjXMsfKB/X6C8jI+r0SIdV7rOinqAwZAqIcNjHWKFie0AVpqmX6CzqRvCedMV
         HyBeZP77X/3P5XaLSvW9AvWty1sKt4bTQz3QU2+099aSJvWTZsx6/60c/CtFhNKO0LmL
         3pXfqaflz69nX7uRzwI4e3To8zMHtO9FzD2N5npOJBfQ8jopMJ96OSgkiq9Jl8SL7fX+
         QCAARcWgftvtjQvFISPLcnFOGblCISivFzpbv562BRprTK/b8eft8QIbxcB1NwQMkkWF
         XKWw==
X-Forwarded-Encrypted: i=1; AHgh+RpNYAeYdkGCna4GaGm6NnPLIAjZtn//LlCe3hsyc15uyUKajEQ3SIMrQfygr5MeLDVpVQCH6rY4f9tG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/9UQkDnvG22JBuYkb9qrFmAi9FbWhJEJI2tVnNbtn5y4sXtsj
	o+fgNBpDaBls2EbHGLtiWePe6z+nJw6jXHckyEJLNe41aqSdrHv7oWSp
X-Gm-Gg: AfdE7ckzEflYLcSmXZqzrIFtjEMQBgcKNB9xB2vlQDQ87WzoQYBsmHV1y8kDmiu9PNh
	rLNl/rvkYYpipkNDpm0YL7S6X7H+ASxjJwhybFVuuaJuCWdnrsoGmvTmuQLv6QMiwvbrNCa0mfV
	/nD3cPcq1kRGnprLRQW/ZlskV/hBBSrLS/6AKPETtUuetP5D72hAY6tz0uWtZUgO54JB+jF8PIf
	UZCV09dUhv8UUVUmW0P61tbY8cM56tQGtIhBB819ZH2XKA10YLLzjIiVxoyBQBJIPd/EEijAlzU
	bMvwJdrnkrlYbB1VRbO/xYbvPOufNfmF3E+1YaN8pp1EhtK12IRA1cLt6b2l5tJaGpnuVUKaAgX
	176pQpwiYtC6vQtAIdTWcmdLP6PtyuowHaUi4t2R+Y3iDwkSiiXtvPBBbxVyMQ9KH/kK4y3ezB0
	Rp1Ry+pPzmFsPi4wbO/cPjQVfl5Vh0sWGnbKRmiaCQKvS4TsC0O84/2nTTvjsQ
X-Received: by 2002:a05:6a00:8b86:b0:848:2eac:bfb2 with SMTP id d2e1a72fcca58-84c292634bemr7733935b3a.13.1784516795979;
        Sun, 19 Jul 2026 20:06:35 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adfdfe9sm4805267b3a.27.2026.07.19.20.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:06:35 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Mon, 20 Jul 2026 11:06:14 +0800
Message-Id: <20260720030616.1067660-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720030616.1067660-1-zychennvt@gmail.com>
References: <20260720030616.1067660-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the I2C controller
found in the Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
new file mode 100644
index 000000000000..0713e1c1ecb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 I2C Controller
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+description:
+  The Nuvoton MA35D1 I2C controller supports controller and optional target mode.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-i2c
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
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    i2c0: i2c@40800000 {
+      compatible = "nuvoton,ma35d1-i2c";
+      reg = <0x40800000 0x1000>;
+      interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1

