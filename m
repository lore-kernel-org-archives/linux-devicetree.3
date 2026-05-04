Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21B3D5251
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898654; cv=none; b=TQekcMyf8ovejfU/dwpq6uzyj/XdkCkJVHNbModQx5UVp+uFET0J7Yl1nA4Y8/MqP81bsZvudnjZq7DbpqVaZP3lerrQLo95TJqW9nBtIsTGRav/yJQWwMx024ZeFIc5+685IKtnMX4us/o3KVRDk3dBEOIFi9FdUYvMT9vNWgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898654; c=relaxed/simple;
	bh=Yf+ezV/ex2fXE7v1XIOFqfVG6Ppky/elVOrZycOL2AM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVuoEJ1dC8UCEnKaXN8V3+msTisKCYQQWmsqCOEUv/O7aSCcKgNX539nWjeY+j3JtRjds79yYehkXZX5DsZPIYNh9uMP2HYkywQt7eWvfCeN22YYI1sJHkU2Dq+5oclTQGh9UoklRhz6uX+x+Su9UNpVi+rX74F4BAte5wH0UKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bFLMn8aa; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bFLMn8aa"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so540428f8f.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777898649; x=1778503449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+jx+pjMnzl4Jh5BQnRePl+s4iGeKiFeE2oPGdddko4=;
        b=bFLMn8aajitLXG+4Qj9y4zRmO8bmdscsLMG+QfdaG8hctdEPE5AsAjI/jvwNvsypHe
         TiLFne+3LhCtJ3CAYcwYq/fPAYkcAhNXj6cwYRw1dEbZXPOLnENIjCejGxXzGKGAsUvh
         pAD6n8Mo//l6ueNZXt2yxyyt1Iq4I1VdBtWPInt4MUag5DDISz2I1vl7hz8YbkyxCuAA
         CsHQXyxWIQmCH03k5My+9hpJe2zQXp9S+Ogvc6cqLz3NrHIAhbKbP144zlRW5v7QPu0M
         V2BonvPJ9FFWB7sOtEkWeXObUxC5AeH7g126bbpsN75Q5UuuHo35hs2CPyOrY8yihvop
         uXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898649; x=1778503449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F+jx+pjMnzl4Jh5BQnRePl+s4iGeKiFeE2oPGdddko4=;
        b=rg5bFCr38bVjYlwoScD0SkKyibg8GaPd5CRXjwIMP0GepY0sXb7UAs5RmDxVQBqM0X
         WJ/ASpicctalKzHquSxH3xOn7iJx8175K97GZR5n34oYFItMQONTWAsonmkGMlg2tvK6
         IL1j2Tz5UQwJpDp/AoPjxsnxZL5wH1/H9bHY8SdYp8TCxEVNSqfdqpIwyHxbgCZZG7DU
         +PR6w6qr1jqA5Q1Gh8CxriIvjdaW5NM1L4ngKrIjFXicr9Ubma0FYwHrt4N7h0VgQ+D3
         jn3Q54PKYB7RivR2muxWzcrBJLklFKhiG4jSY83fn4HDyla3O1fKFFGPHUJA6OHgxbES
         UXxw==
X-Forwarded-Encrypted: i=1; AFNElJ/EwY/+V0ZnZ/LBGv6R9VRw5NdoikAIlkZON4aOiLyOWasxgB+FZ5H6HGWnrJAcZIPT96atOK0xiH3R@vger.kernel.org
X-Gm-Message-State: AOJu0YzZG4rYZOkdOPHCCXD0O3G9z4DPG8JriAY9WhEsn6CbeoTOZyyR
	FECx1pwOy+P/mx7lsGxn/UmLAyWDUYHL+A5aTru2Gg1nlehmv4OFryN7OXD00qquBow=
X-Gm-Gg: AeBDietuHiOat8y5xdpJhkdxnek7i52cftXIjVRclIVcoPvhSciNkRGIsJKhOpC/80g
	FGry03D6ooaP3eN56rOr7aTsGVWqjzW1bFz3BxbtBv9RZ1mUwe1mvjOb71JF7z6OVy5GBkqK0U/
	kspISJV2Lo6iukwN8b2Dwsix8TzHx699wNbTJ2y0ZQ18JbJBEmQkIjwBKdG3crUv2D5aJE3uBQu
	kBH/eQLWRoyHlYvVMgetl/3717ZkbeB8psaQlJcn7hdy4b5CqvR1P7xSALYSNZD1LHvfs9QjKyu
	3V6T43DsHniKwJZfQW3P3sYDbXokLZZeTNauVcvIJQY2JdK/g2thxX+SC/eI3Llnn7vbtyoT1JZ
	7RLJzWdumCH9OySxSPKzRnxjZMtoxrC18t7dk8cap93WWdjD3zkFuuYRdjgUdOzZA1uhVRIMfTB
	/z2TpDQlgjhsXdmglG8lBKynJGa8F58J6xa/ou0JJrpSvLoZCE2AOi+2Y=
X-Received: by 2002:a05:6000:4408:b0:43d:799c:b2cb with SMTP id ffacd0b85a97d-44950b3f14amr15719982f8f.24.1777898649356;
        Mon, 04 May 2026 05:44:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aab44sm26919443f8f.29.2026.05.04.05.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:44:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 14:44:05 +0200
Subject: [PATCH v3 1/2] regulator: dt-bindings: document the SGM3804 Dual
 Output regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-1-c4783443890b@linaro.org>
References: <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-0-c4783443890b@linaro.org>
In-Reply-To: <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-0-c4783443890b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2643;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Yf+ezV/ex2fXE7v1XIOFqfVG6Ppky/elVOrZycOL2AM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+JSWlUCBqPMdYxIMWe3KG4NJH2Rfiz7vgrqAEyzr
 0oRt3AmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafiUlgAKCRB33NvayMhJ0TsKEA
 C+VDM6dhdsxU8v+TVMqO/UnFrBr+6V/2Lx6qFiw7VTqEjvcBTWrFckH0LDHm0zFj+lXebXbjN/k43o
 L9StJe6DwWHqfFTy5xQL8/o3/AaAXId02iDNaH1MplreCId//q3/n7yX3sPOfZ6lpmPi+ORXC528hZ
 Dwk0iPSEYiG8Ev/KF1nkt/XusHJ9v0XK0DB+DyASasXXnhls8LBgNSjA68vJeLwQyYa19Ud56R8Pn6
 tlm96dP1DUFwe2igOt997Bumy+Wqt6ZSSbi440xRTwEHNOJCnAqP/STxFDnIIXFFlq9Aiy0Oj4o6hX
 hO0IcjW5vpA1PVbZ63vhSS25JPGMrbpBG7+JyDy8+vgpFNO885hJp9YMAJ/uD99qyRN050TOtc0HiP
 6tHxd8/FBO2E/X5Rh9SGKqd2CZhJTy7PRpyGrfunQBc1IbuIzL0la/EB1DgTTBXnMlqHdHUk3askZz
 JKQoMzoFSDhshGgAvOp4vb7aeR2L/pOd1KtbTQnfN3jHXbIYUA9YnBe3RhL45J6ZVteE6SsEqt+drp
 j+J2x/VGI93yt3Y5BtI4jhTYFj+MXFRZ3HK0YVMuEHJ4k5O2JZQNCvI0Ip0007Xab4O7bKm3GIQepk
 M0z7b0CrePm08LYETxlO6cOAyOxBYmydXcGS44ddq4WmyffnZXOQSXbCqHXQ==
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
index 000000000000..5ea475f8f8b6
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
+            enable-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>,
+                           <&gpio 18 GPIO_ACTIVE_HIGH>;
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

