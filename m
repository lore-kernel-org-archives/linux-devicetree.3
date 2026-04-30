Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5A23FE650
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538933; cv=none; b=B+fZr5cKWZ9i8WNcZPs4Z/xsJaQ+3pW2zRtuj4bNVCzxm7Lux/ZtA7g/3ofdYDSld5+/pQ/h5ffyg3N3kHLEDEM/3SVoBEIVaNNelan/Q/d75aG6TG6yvyMC/C6aSReE2yLQ7ppNFW0LCpTEVvFlyaLP23zlLrHprO+nK6bd7iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538933; c=relaxed/simple;
	bh=KprnOnjsttWQiEb9apl8DCvxQ43ss1PmqfDfKIM+Iac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKo9XrglDqSJBZssdbIRwrKgBsVJhTHgng6o+CV71CavrgllFEu+t0VXpjc/nCo1dTqCJWetSZ5ie7/2CRYNWoXpS7r866fXo1NqWEyzWpKxfF1C6enkrDBrJ8OaS38ZBdyEVUEvYPYlKebKDqwFyByFYPMdW3PsbjuX0QH+Pc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UPRO+k+0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UPRO+k+0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so5773425e9.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777538930; x=1778143730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6V0mcknKMb0dSYnK05FcavK9ZSRQpZJ3ISebg/MFpc=;
        b=UPRO+k+05qDtg9rlYb1Qcd+H9qaG2R1t6xjnx0+kYspmkaTFIv7tCVYaZDhUP6GLo0
         XtkiEZPrFSquwPZIU+Rbx50R8/sip8OA558GHQH0vby43gC0KvAERXYsohBsX+t2oT2Q
         BNPdk8y7QWv4Ss/wrbEHVw+2MZc03FiqiGY90dhWyG9hTWgfNYeF5qweFiparpXYwPut
         DBUo8ezOuTe4LEjTV43Ym1UyPaAoazCDy8/QDp3Q91q4l9Fbz5k+XA91PeWeaN6Y/l5K
         ubwXNKT1ck4uL6UyD/t++p8z25pVgf44ArwfuJHqOW2ePIN4jbeyXxPF4ismZPcIgL7B
         oRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538930; x=1778143730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q6V0mcknKMb0dSYnK05FcavK9ZSRQpZJ3ISebg/MFpc=;
        b=YwZBdQLEtz0raJhDQZgI9D5kBW3RUu6+9CiTHKhtKE9avMZV9lyfK1EmjG6kaDedCj
         yxZba98fuU2iyxiqVmDypi+OLg6g9RkQR6mX67K+f5zaRbQUX2Xls9vfwgxBddMqGXEA
         r11j4PSM+OCpIwts2zCd9x1dXegok4rHz6BuI1sQw8aOmjpPUaXXAsoKwyP/9majDuWI
         BdAFPZivbPA94Ah4+oroiTUMUvFXBF1bDkKcfZOQEgcicyv4LnEUUUyK77/zBpJ8CX+W
         PwNCGziAMoKANdQdgVVtV6w0lj7swl/myl3vbzUsndRvva/aP0LCHDpeRzCliTLlgPXV
         2QRw==
X-Forwarded-Encrypted: i=1; AFNElJ9gv54EuOStBIp04JxIvqEzUgG6AWk9503jlUumOTPZumreeQ5HifdnGUvSDJH0D1lk8cOc87I6nA/s@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5H747q2xcF9wN5jQqrMRNUTC78Oh1d/Hvui5UftobYudm/M+n
	eKBJYrNURi2krg7DhtZT13JGdmFuZ6Ps071X/NRqqhGEtmU8+nxOzdaQnpY7APqdQSc=
X-Gm-Gg: AeBDiesxzRsVqVi/LaCLmOHXe+97wj911TRe/eLY+3ARiltGasDrwSEOxG++ZXVk+Mu
	+qfkvUa5+AJ3R2PE0vta8n6sYIo4MiCLB6xtt1PW46DfJm+ttjETgYQrAv4SpiReNn1NkCsjHt9
	3jhqvBfv5EYv+EL8LGKulGKg8I+H0lOCbwl7i9knSwAVsVWdTE+N5NvjZfDE4J9nuU+tSmrO72n
	xr5X6Bvrp/Z7vRAoQBYFIGcRFi7DeV5O+LXH7FNLqQMouXQwDUdyyvxibd8nKkzVtoW/qDw9BA1
	Bpw34pSmaLzyr9qAXabboElKnzgPbYa5xqGTDTDugBS2SZ7QaL1OyFj64HlVv3Ize+L7gnryq9I
	LxzhqZ4u+2+ndZV9fC6s49XEVBmOu6Omks/880FD+yzFUw/tLvll8UIwv3QlEHo4BnRMgkSC8RF
	22/CWsaltqTP1uVakfjWPDWfawTHn/P0S6LTx7R9B61IbcQtWQYG5vQZw=
X-Received: by 2002:a05:600c:a14:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-48a844525c5mr30979545e9.17.1777538930298;
        Thu, 30 Apr 2026 01:48:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c1d0228sm137328025e9.2.2026.04.30.01.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:48:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 30 Apr 2026 10:48:46 +0200
Subject: [PATCH v2 1/2] regulator: dt-bindings: document the SGM3804 Dual
 Output regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-1-76108c65a560@linaro.org>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-0-76108c65a560@linaro.org>
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-0-76108c65a560@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KprnOnjsttWQiEb9apl8DCvxQ43ss1PmqfDfKIM+Iac=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8xdw160JlujIr+2XFrEhGYVYMSCwAbqSSEBkHLdh
 17qCB0CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafMXcAAKCRB33NvayMhJ0d47D/
 wL6EaNfWY2Z+pf3kaF7qwLQSnj4DA2Fbqa41+6V8y0bWKA3ds6kT6PdxbjrAvA0gIlMCdOrRFQCV5t
 Uq0gAegZqUgIKcIj/7r96kINyP17dqdkAIM6LGDc6i8cW/CZnGhoIvDIedxu6tdMWJXBE+h4Jc4GKP
 6v9J+3mEtKSabNCzvT8YlSphQ7aUY9miP8O9zotd0+y2qBMhidvZisB9QU9OLeFnT0jDgxpuuDY4GX
 Vuk8qEmoXFElV3HlkkMEb/n36oLtX3BSUOP/sz1kw0hfK3TfS66xX6l6EwjuYLOuvrhmAKhsKRO/az
 FMgJFWZpF8SruTibxmCr/yEYCf1r1jhfmoiMZl4/rnnQ8WGiT/QQ6vW6r/QXR2KhvlEb8AVsNcKjBY
 fDqDWWJ+VDwyVnKkG99XTAVxlyO0u+prMZcdykkhngrJuDTPuOX25QFoDWqFJaiNtxjT/UbOGuW2IR
 q2FNVNuuZQp6jgzjjwpsBE5DrLYjlVtC5m9Gg4NiOEW4o1hub3a2fAM9/oTlUPvSvrEjB1ysuves/K
 RrNLX0ryTsRsVE7L23A9O6qCvmzdnpvaYMRiBXrqyNeEq/a7TOVPw6NOstX/iEVZiLfNZztRoRg/PR
 bHMfiMp8EDbm8Z98vVwK4v9EHmv6id5JCJQeWp93RjALzeV5bjR3Fy6Rzqcw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the SG Micro SGM3804 Single Inductor Dual Output Buck/Boost
Converter used to power LCD panels a provide positive and negative
power rails with configurable voltage and active discharge function
for each output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/regulator/sgmicro,sgm3804.yaml        | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml b/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml
new file mode 100644
index 000000000000..fbed911434e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/sgmicro,sgm3804.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SG Micro SGM3804 Single Inductor Dual Output Buck/Boost Converter
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The SGM3804 is a dual voltage regulator, designed to support positive/negative
+  supply for driving LCD panels. It support software-configurable output
+  switching. The output voltages can be programmed via an I2C compatible interface.
+
+properties:
+  compatible:
+    const: sgmicro,sgm3804
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    minItems: 2
+    description:
+      GPIO specifiers to enable the positive and negative outputs.
+
+  vin-supply: true
+
+patternProperties:
+  "^(pos|neg)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pos
+  - neg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@3e {
+            compatible = "sgmicro,sgm3804";
+            reg = <0x3e>;
+
+            vin-supply = <&vin_reg>;
+
+            enable-gpios = <&gpio 17 GPIO_ACTIVE_LOW>,
+                           <&gpio 18 GPIO_ACTIVE_LOW>;
+
+            pos {
+                regulator-name = "outpos";
+                regulator-min-microvolt = <5000000>;
+                regulator-max-microvolt = <5000000>;
+            };
+
+            neg {
+                regulator-name = "outneg";
+                regulator-min-microvolt = <5000000>;
+                regulator-max-microvolt = <5000000>;
+            };
+        };
+    };
+...
+

-- 
2.34.1

