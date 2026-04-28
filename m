Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95033FF8AE
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384335; cv=none; b=dUoh8mCKFGpiMx44Apa+Cw44c2f96tbcIRfpFjRwqSSLqeRAWANGR0gOg7cCCcDmMe8wN86BGssFAi3rK49NHFIieU2AweHnld5mqiZ3i6uIHa34xywbBevIz7I9g67QQ7tY+gfdJcZ95BqxitZiXZ+Gu4ktD7v4Ty6RTpn8TV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384335; c=relaxed/simple;
	bh=ugiJkWptIeimKlAU8w6wgZisMEUkwI1xsKmQ/d7RXmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tb3H7kvuqieQEnTANx1J2RVr4oim4vosoHgE2skUeI0Jz/106hDIMXlrA8SUe2too+pMZTC2BniCDs4VJ9UR8H71h0pzLpQ5oseoLd5yPTjeTC0+YPnsb5VoeNrEfZ5XN7I0kyUmaW/AJpwb9ivOqfh4asipu3FV8U1gJLTTGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfDpu3sx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfDpu3sx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d75312379so8172332f8f.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777384332; x=1777989132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRMqGE72Xv3+URdBdrUbDo5jbpuPsn6CvKxz6Jp6b0o=;
        b=dfDpu3sxIAHk205pwXj2n2PYzVt/Znw+ULpSEYwMzpnhxYOMh53r0vwKCEksQ/ZhUv
         Dt2X6nUNhq57Pfi8btsKUGI/myK9tZKAI9QXgBl882Mihyhh7P686vXf30vxQOnd7hrC
         BGGX71OjQhPCb65b+PqigBaHOodAz7N9sjaOSrMhfHHB63kjzwz+XThnTgaNXc68VES0
         cshWlPfpIeKLkqbykdJ9Khmpt5EpP3TP7DXpH/x27RU9R6VdZRKJnM5bneZph6Ab9mAP
         Clwck1jEw/4altWiovIsxmNAU53DmAY9jpMYshSyl36pQyfkL5yTInI82PysoCGayEVu
         XDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384332; x=1777989132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GRMqGE72Xv3+URdBdrUbDo5jbpuPsn6CvKxz6Jp6b0o=;
        b=Akubs9jA3Y8oOTZCfd6bLrQuM1weO3bViAN1pzrqmwIPdLKEgaC1YNZVkNwXjn+cSV
         ZsUdHlZDNa73tgC2Ak0GiVH2VMi2rLdRA8ZHBaaBs/DGMHoEQZknNehaMsfzlowyAX4O
         TuCGAgrX9kDtK6mGHzApOM3VfRUSHJpAo3wJ9OzSliYMsrw1UMDLyWpZe1dmZ8RIelU8
         e88pqdfcRx194g445z601QgNZ1SMUWXktxW4eLY1Pmw3k9h3jl0OALYUgNjxtuWJ7jgw
         2O9BoopcqCDIeSXsfQStTmYkoPZYKn9c1y1MVoiCMNJStwx4n1O2Y6V405WJU1Y9rk9e
         /Okw==
X-Forwarded-Encrypted: i=1; AFNElJ9KDJ6HahPhydoWaJGkD+WJ5vHBLRIiIxCa5Hvi+cbi0xwUAXLunIPUeZk1qTypKbELZEqMBJc0d/qq@vger.kernel.org
X-Gm-Message-State: AOJu0YwZtvjd2jhhq1NJVTfw+F2VlyK9jVkabm31DgTZEAWAp7IIw/5T
	vgCuo9W1eliVAmsfYw/DxAHdE50xSyUzei3i8QL65oeB4cHcRebczAF5FyJFhJrLekk=
X-Gm-Gg: AeBDieuJNdmRfpLjaYElb5+LpNoqJii/Rk1vMC0z4blu83/s2oIoB3N4hLuLnqV4xTv
	kJZMFyVDPpbP+t4LMtswRVhjvxq/lWF+rXUfrQ2FSQLCfAnzSteRqgp9lzaJyiFMH+yGjhMU7A0
	f7n6W1coDvca5JY5IaQtUZUSx8ePJewjvGDu+m33v8F4Ek6qmizkYjGB9RbLXSIW8SNVqVdnhg4
	jmQY4GJOAyt+iJM9oamRiFfTb3yqgIYu3/36cpZB08zgKr5r421bBcKkmivbDJGICM35A6VjUpq
	1K6DxJAdvcwprIA6yeJhy+/N2fZ8LkyUWD9jJ6f6iR1q2GKkm/FbBI4aKoJXpbUZdUDN5sXuCJ5
	qOEJXkJslraxyB2bcjDX+G9KHRTrVG9gmke7BDDwYL1DB2eqgamZvbtm+9tr1ZTX9UyISUqrFzp
	WmpzgC9rtnRtr5fUb3fhqPNp5V3+GfSUv/eZhz0n2kALILrLzHLTyw3qc=
X-Received: by 2002:a05:6000:2b01:b0:43d:7a5e:8162 with SMTP id ffacd0b85a97d-446516638d6mr3497650f8f.15.1777384332034;
        Tue, 28 Apr 2026 06:52:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c07a2sm6773044f8f.20.2026.04.28.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:52:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Apr 2026 15:52:05 +0200
Subject: [PATCH 1/2] dt-bindings: regulator: document the SGM3804 Dual
 Output regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-1-1d8dc7620256@linaro.org>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ugiJkWptIeimKlAU8w6wgZisMEUkwI1xsKmQ/d7RXmc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8LuJbRwBh0ek5dTDespIfXm6eJMJmPMESII8XR5n
 lteeGmCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafC7iQAKCRB33NvayMhJ0asdD/
 4kG/eALu93zuwu+NGc6QIj0pbGCTI9AYkppPMmMaGw4HmgbnSbLemh4MC4cadRWyqhbnuShNkUIQdq
 FN1JzH0tJya4rOyCkHlRRHM6AsoL1K7oafn/bQT+2vrMgo+q95+esd0Zhoa9JeGjXQFiNZCzOK3Cp2
 R7WTDf1Jd0UlhEvaygWmkd2CUh+QidI2BnKOL5C3Cn+0LZEJZR+itGGf9LyvwaOdU032y6fYz+ZBR8
 Y38jBpoC6DsKxQqbXTj3L2CMY54+O8kWdctYYSVC8Jnqv1Gx6xq7jB/9JBU4shIbkjGiACI47YSy0E
 miRkiVlNAadXFQocyEe4vBp1M6098E5n49O2LVASeuhT44Dow9OlrKueMm911saHXhG7cNQfGQrQgG
 +eFrgOfcJ2LrYeHYn+QoZlbYQJ6UjwVgcfhDSLOeIoXejc+WhjP0iaR0n3PvCSh4GfWml077AsmP5g
 lSB3v+GBeA4f1BXo2ZCvFBDnL/p65MbSq3wtWOoudkKvCiWJ49FxcjjmockF/atp/QvEhhk/P9aUNt
 +77TZaUOIz2IVb8fhX3uIp4kNZsR62M7EXvW6BoaQwgSO0ryT5c2rGIE1HkmN+V9xk2f9Z7+JgDFv1
 7K3KgbIGsb/1/sMAyqbl7calG9f2jTKcIyNc1igOCVhgr3mSXEuvtZ+7p8Ag==
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
index 000000000000..e75684e910ff
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
+    maxItems: 2
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

