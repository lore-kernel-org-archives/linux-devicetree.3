Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927EB3B7754
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778052853; cv=none; b=glMUTV4rZHwJjEQ2D7bnovzELyoDM9qQZn4Kj/sgd+I4mqLZCk+fp6TwpKpOJmn2eDokafdCEwiDyXy5vttgG7At+TiC7r4Oe+DriB0R46t+RFCeOyF9REWRqCJmU+MeHIn6uaZ5GQqGvRYfNJfpME1pMaBhPVyXAhfns61FT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778052853; c=relaxed/simple;
	bh=t6LydqUMaiA9RITqtRjvNO/7mSQu8qm0BY+eJh0PIms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ldrhhEeoC8katkmiX0P8vnouXF/YYxiog191LFO5VrMQ8Saz267aymybM8k5TAlJWejfOWky8ES80blBg6U4kg6e0BVNv6e86AGpH6zApqWokBXswWfV5jxhri03of8YNaTUZjD9kLrWgZ9AzWindFDDutVcq7aQnqAmoH+UwBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O5PPC3aG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O5PPC3aG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d102471a4so27816575e9.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 00:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778052850; x=1778657650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcCuUaooYGwAZf4AbNW8h46t9NowClOwuaIZzuKTGIw=;
        b=O5PPC3aG2cz38prdpD5wkd1qHJ8mEE5pYMo0WGdtJ4uJkSdBZzhaEb6dWMLifeNZ7u
         m/mfiE1qkL9wJ+Jtz3nE4sxgY2aKQExMpdwOinR9xqWE4BBZp4l49uPFO7TG47OrnK4I
         MFPJXmXw4Z+vGO5OyARdsHJhZHTJpjNA/JMk/ISo7CiJob2jLKGDgXf1uJ8IgiFveSQ5
         LIb099xhT7/1NMbPf0R6E/Pd5pFA+xmU4M1nvSEM3G/LIFnOvkjW7QZP7TSx2Q6GZb5a
         kdFWMwUvEwskjl2ocI1L/lYfO9SC+HPnQ1EJZ8TqEK/8gtTyUHbknjDcaarS6+mgKQS4
         MIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778052850; x=1778657650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kcCuUaooYGwAZf4AbNW8h46t9NowClOwuaIZzuKTGIw=;
        b=Z7A7wAfcEk6j8FA1gVCznx4NWSuo/3Za2Fc57mf9hSOMtZ/cZDqfqM7l6XDMelJWi7
         EdKqjWXvjNn4LBqW6KQNPWzg/Bq+CwkTK4f7xjR6uCkzPHAsD9jHNxolJqhmCf+0xikz
         XwCgNlM9YynCKvNHPba+zoXwNkFbfVoYg3rUYL9yEX4L1B/HN9t+BekijnwkhWoogfE9
         eIpzciBkzxwDCnMifgxHEBl3t5LJZ1nqQH288k1ZocMDzD6ToBDnFh8c2bPZA/jncUns
         QPXxZ0tOeJQb+4rjWyXyiULmvb4faPmbyG1j0twDBxzIrrRHuCv8ydYT6o3ebUdgqf8F
         52yA==
X-Forwarded-Encrypted: i=1; AFNElJ/HRS05/zgqC/YDz16T6ZAoS23JexaJqGH8yiszKbtmu6OrbTySzksT+jzkUOj5Tg6RUYo8OQFDHeeq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5EoyRPDXs5IRmlYXKa2TGLlCkY4WAACElyOr8CoAxfwZK4IKd
	GGuU7yCd/kJgTy/0zVkd6LzVjNRz58XqzE1BCNUHVomKDpg1VSEEl3q9/qIQTlZE3ls=
X-Gm-Gg: AeBDiesos5scFHKLZ2Yy2BJXJc6axcro44dLYk9bCDi6obcPf5U1WVZq9TmQ/o2yzcU
	kn3lyiP5m8cHijfUHDyRlN7upGBIA+l823pXv9vv/0SMB2G6n9e1lRremEq6yOss9nCAVqtHu9j
	2ybVBFE3+OSAj8sNuP7V2jzolQ82xWmdEin5alciomNOvuo5FAhSoL+Q/6vznreYgfgL14WK9nL
	VFcEj0QrdK9hHpaD9+2iRMc2VZDc8CzIPquBe+epvi/uMrtHq8dD4JAaRD4EoDeQYzhdzrOFJNG
	vNJoR7XqoPjE2rWoihtYIvkDXdhmYRsSl3Swbw4f1uUv6nRFLK2B4gfQPy3sg0ZfNVg3Vf73Uqr
	yNQypCwDugmdRHOoe/tRQrI4jOo6tZR17vnfSuOf8Vo6OoXbgHZY9vGpKERAXggek6vhj3pXSSS
	izBikjoFZK0rCROJskRfLulZv+4XxxUA3VKjfl2wYORw8gmyEi9hhSR64=
X-Received: by 2002:a05:600c:8b04:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48e51f183demr35575375e9.5.1778052849595;
        Wed, 06 May 2026 00:34:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e52f5e668sm13644835e9.0.2026.05.06.00.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:34:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 06 May 2026 09:34:06 +0200
Subject: [PATCH v4 1/2] regulator: dt-bindings: document the SGM3804 Dual
 Output regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-1-7495e7905693@linaro.org>
References: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org>
In-Reply-To: <20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=t6LydqUMaiA9RITqtRjvNO/7mSQu8qm0BY+eJh0PIms=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+u7vHokT5jEw9Cvz6fHrwCOa/dElfLxUifom6Kan
 Hz6nVYqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafru7wAKCRB33NvayMhJ0U5iEA
 CetLiHXm7q8t9SHgOu/d5QM0zVN7LJ6BPtIdqbc0IFNARWkAo2BwiTnsPgH1Q4H9bNd3j4mHsARq81
 yMYDURI6LD2x1MaOqFQTq32dzMNN6JWkWxbSQaTdFXO0omVvN4h4x5jBYyC/SjlxgqvWLscti4gxRn
 HD0m6A+HM3gTZMKs1uY59zbES+kyvjiy+MuGfhOMyB0UJMLjDQZspc7HPH5jYGGovsxGleQPNn1ZVD
 FGaA2UK6SYzGgjidFUhbEpSPXFPkGNiqyEa7yI+re7pkYYcr7ewvIBOBZX7e2GSOzDavtBVoXcvef+
 f8xzz3MnctDzek4LPfH9QPGTmk8UXkVR0KtubrHXZlEnOfkVnUFd3w74CH8OdIiOF06dcFX98GwTEG
 k07Df4rM+2qT7ZtS49YKjI1ZfNnjzdAFQe8iOyoaNeCy50Y4+5PJ1qaAWNltpYOQz6ah6ZWr8urzQ6
 sQ63NKGEsX1Q1cS/o+mIewwoQVdrTQf0ZG3pGhsRSDmUTYtAiIHT76bwgNhR7rK9PqDPaLO3iEmAzA
 BfGF2wXHT488KDtVWyJ/XhQ1wINRiy5N7nBPH9QrKu9NbVKcmNmnrEj2GayJHUOUp0cftVqnFCn/Fe
 MTk12eQrz3xMb8q4VziZFQc5KJDERRO0HrlcwanXoNjiiRH/mQsFvOh2m6zg==
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
index 000000000000..3716eaf81aa9
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
+  vin-supply: true
+
+patternProperties:
+  "^(pos|neg)$":
+    type: object
+    $ref: regulator.yaml#
+
+    properties:
+      enable-gpios: true
+
+    unevaluatedProperties: false
+
+    required:
+      - enable-gpios
+
+required:
+  - compatible
+  - reg
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
+            pos {
+                regulator-name = "outpos";
+                regulator-min-microvolt = <5000000>;
+                regulator-max-microvolt = <5000000>;
+                enable-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+            };
+
+            neg {
+                regulator-name = "outneg";
+                regulator-min-microvolt = <5000000>;
+                regulator-max-microvolt = <5000000>;
+                enable-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
+            };
+        };
+    };
+...
+

-- 
2.34.1

