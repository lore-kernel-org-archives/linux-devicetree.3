Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A44A6883
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716364; cv=none; b=lRWlG+NEzhTOz7HkVniHahtMInmbMbylw0R5rzvYaxOmBVFrs0911qixal3ZAWz2/dDT06qLnAGKQHyWqnyOaq/SYDqm0h5QoEQxhTj01rHj/fBNZ8j+Vr4iCx2+fDDm0evqghIB2An/9jqTPibKB1meq9gKY71gkqhMQklwafc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716364; c=relaxed/simple;
	bh=pMEqLc1obysora8AASomwaJMtj9BYULDdVJjThrcejI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVK248ughMnXlOYOpe5Zqvv8mzKlc3vRIooQwMJggCOrmF2+aIuYj+lbI6hCMyJfdBMAwVyDBJCggqLzI0feLAVs2udEslmOb9xDLv4zh8j1vg30k2J8oYbfF4pOL+yk4Utt+9tj6H2xyyT41YhiIIqzopMfq2m8RbB6OaQHlF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1ueQ0Uu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1ueQ0Uu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48437356d60so162087f8f.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789716345; x=1790321145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HW6CJ0U+YwbSTnOwpDeyXwbN/vCM6cebJerAL6vdxnA=;
        b=i1ueQ0Uue1vl5inLYOX0Zt+AXEU9GSHYtQKshLmNKURRoSXyaYhxJKoZm4sgIof4LC
         gMX/LOXfNW27YudwOf2Heb4OPPfb2Pt4yCCza6BNSlQmqe42hrLo4oEFAoaHqWrx69YM
         PAShKxF1Kwj6AvlxgdSB8QrjwV+MwYj1Vc9PURP05weJM8ZY3sGdwJn9T2kbvCVvPODK
         IMivqG8xBUy4FNvscWGnigX0WiHYJNYplEO9zS7mF9zT7S/LKv3j+NOvgCbNaocqfHLO
         D+EKCHN6XJBzAA9UTRNs2LhgCuEDsZwcRNCKNugj6195o8+nMWwAN5raJRON75YyV3Zp
         afgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716345; x=1790321145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HW6CJ0U+YwbSTnOwpDeyXwbN/vCM6cebJerAL6vdxnA=;
        b=fjLvmFINGcGySqfDJNrQG/gjlEZ4pjMRG/KqDjUFVfWFf6hG2kTMgFc5YFTNvhHCSD
         8KgxT7ONW3dwxP1AnMYhJAq8k/iQ68qZoEWzTzJz/Tsxc5jk9eqykVL4Zsgi1V9GaO/r
         4d1/XefUVomoEeePIfOHmqoYPbP+iurwyNghoEMkaU8J4AzHqBh7F/lpf60X6I5/VRZI
         l9Nib/phic7OGjVSnVnWY9499hZRAQa3pNd3NDUh8jZlAsVMbgpgfOZmZ/UoUHFXEJGE
         WQRD8+nKisv/LBEvDgb30cQZIaX8npM+nyBe+fkXeuB6+hV3ayOhIC4m0/DuUBCfNnWm
         iTtw==
X-Gm-Message-State: AFuF++kwBD1dIjwL35YAyPuUZooBRkvDjZixOKtqCacANgjm0mYksIiD
	a1w0htN2VuLxhzyZBTOfAVPGLJLRHDZIYkgdYu3kz6lbyP7s/TMcVtAHXb8o1YdDjpw=
X-Gm-Gg: AYBFou0u0EVg5AHEqQXkLdo8BZ8WVDwBLR2vW7dp1bV4vM8yAtIjJo3M4eYMcPtw1IN
	IZ8Q/zEkW30+gtCtk04ZZO1J2UORjsGKTQj6caDv6EZk2LXNXoOSEQXJ+ij1kPxHKaKNWzQ1Euy
	GQLoPeKmbu+s7cwj0qLr9mhUuotlQT+NJBWcqSh/pAmUwUipYkj6ocU94PeUxMDji2CKTiTthFg
	4EmloJq80EGG7n4oVwaGbt6fgwkSUAfcinGsAeqEdejvXN6yoyEaJ+7bnr6Y6XIZdCRVUXGXWEf
	OJThpSpSmv5ECKaHU8XN7Ae8YKIA0UtCqchHK2cdw9IoaWtdOiL8oAfvdOUNjsf4EyqcEZwKVur
	bfHt0di+bO0he4qyRveqxn3EfFSB2P5iuN70Pfz6pqlhwYYmM7mk6x3jJ6BKy1gYVu338mb7Vfu
	xvFkNNkOk9jb0d//TcT5EsXkPmbAnCKwTVBpbIzNPJICIZFCnDpWQE5DwPNxIUmAiXhkPweryMB
	oV9Fhf1a4FKOA==
X-Received: by 2002:a05:600c:1f95:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-49fc57238b8mr15703745e9.14.1789716344617;
        Fri, 18 Sep 2026 00:25:44 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm139523555e9.6.2026.09.18.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:25:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Sep 2026 09:25:38 +0200
Subject: [PATCH 2/3] regulator: dt-bindings: document the Nexperia
 NEX10000UB dual output LCD bias power supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-sm8x50-nex10000ub-v1-2-5afe06bace03@linaro.org>
References: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
In-Reply-To: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pMEqLc1obysora8AASomwaJMtj9BYULDdVJjThrcejI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqrOd17fSJWNLgV/orJJfsuqjIjfSbqR0Lihq2Wpn6
 ZfZwPtmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqzndQAKCRB33NvayMhJ0bGaEA
 CWo2sAlS4wbmvJ0AmaGz9fU4tnOVU9iUdJ/wt35bvhoG9gFDw5uHBsYwYlrowKgXS49EiCil2MUmV8
 P9M299zsGiuzGkmhPcZmHgVr30VVVXy3M9gRFJm173wpOv+m16JQiqzqpgsEa1I2lbrTj+1ONGLn8Y
 0EO/dAv+sN3evoNSR0rta1rvpO5kK87vf7YDO7Ji8/m+M5gOpamZ1aEcDgodPDS64h7G3JeCRqlYXl
 m8urirfJUGWfI+cqR+ZdYW3rrZeU3TFJM3exlHYHX4YN+ONp8/cuKhYZa3qej76qBvA0cz1WRSEsfl
 ZA30I7RPOxFrrFezJEiCVOcrrP9JlcDiCVMmnF4KayQZTDUxBIXO+h5LAp69pmEvLwBauLtCVkus+4
 0lukFRxa4yavgkJU5jopUcS5rWxfI+LEnis+jPY1veRV+7/pAZ9U1SEi+kQsgQOegRHn7NSzRiEVVA
 tjyzSKfBstCf2LtSNOSB2HItJkO86dB9IxagY0hzmZNB8ugmhqmPt12Ls9Et8djlKY1muL7VLeHdrJ
 a6D9/y6LkA/LV4M2Wcen+w0bAre45Hu66wY5Fp3K705dr+p0jgBE9+Ji0RHuGiT6mmD/Xl7QYwRVVB
 IC1hAI2NRSyoMso/NNX2AxnetxzxOGIle1Qwd2j3vhSyYivuCzd+ew0HGeQg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Nexperia NEX10000UB dual output LCD bias power supply
which provides programmable positive and negative output voltages
mainly for display panels applications.

Product datashet can be found online at [1].

[1] https://assets.nexperia.com/documents/data-sheet/NEX10000UB.pdf

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/regulator/nexperia,nex10000ub.yaml    | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml b/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml
new file mode 100644
index 000000000000..57a3d633b1bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/nexperia,nex10000ub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nexperia NEX10000UB dual output LCD bias power supply
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The NEX10000UB is designed to supply positive/negative supplies for display Panels.
+
+properties:
+  compatible:
+    enum:
+      - nexperia,nex10000ub
+
+  reg:
+    maxItems: 1
+
+  vin-supply: true
+
+patternProperties:
+  "^(vpos|vneg)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      enable-gpios:
+        maxItems: 1
+
+required:
+  - compatible
+  - reg
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
+            compatible = "nexperia,nex10000ub";
+            reg = <0x3e>;
+            vin-supply = <&supply>;
+
+            vpos {
+                regulator-name = "outp";
+                regulator-boot-on;
+                enable-gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
+            };
+
+            vneg {
+                regulator-name = "outn";
+                regulator-boot-on;
+                enable-gpios = <&gpio 40 GPIO_ACTIVE_HIGH>;
+            };
+        };
+    };

-- 
2.34.1

