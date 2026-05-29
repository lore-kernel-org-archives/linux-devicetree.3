Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6D63AC0F8
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780082596; cv=none; b=b27qY9umywzKeH6B9h4AVEdF5uW25RHWS1lK55BNPh7fzzlvC8BkM2tEZYEO442hzmq/iIlkUKJmazoA7HJynXrnE/SGsAtLMDwzR4lrq8JdU6KTOrQtoW30D+PLlxN9WKT9r9fl5mkYDeabGm9C5T6NaDqmlojH8rWEVVVjp+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780082596; c=relaxed/simple;
	bh=1lKQMpd6PjiypUs8OsPV66H2sccTnVhP4zdDuQTSTj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5ZOySNa9wvGV52xFWo/pdA/mkpRx346OE4gCH8jxYlwEU2pkmTwYnKmn1B5IOT5z+M8d7Yt1dVVA6x0gnP5TPFreQK+2s0/ELo52pg0dpe0VApXvyk3SHfK2/cfsFNkbIvKgNhsJMpJcR5Ex5OS1iEK591F/TcI3SEmbfipmis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8mBNurh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8mBNurh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48d146705b4so150628295e9.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780082594; x=1780687394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY/pjFoVkR+l6EebkjB4dxdDrLLE9cCLnfyxSl7hmkg=;
        b=f8mBNurhZtCOdMOAUK20Ep8+l5bZaGig9m+PZX4B4+BSRxIfsJMB/gVAEZGcbge0zR
         MWLmpDBWzRRpGMas3vxqkaWoYaxRifKOMRqJqI1Ugqy5MUdcmzDR7AdrDCk8+LQN3ji4
         xclGGUWnfAdV0LBuqSPYlWuNx3rJOcIovZAOfgnuxL+KBrHBo4oLZSAClujUL4pN4UD3
         vJ6TTes+uBXZTN+TQYitRqQv+fTRDdAurYuleOSn2CDI22GS2Wh544NqhGlVASczOuDy
         VOUOlkML7Ly5RbvmI9gGHXSMC1uSa99hDb5YmNsfCgJrS2AurQ5cGR3ZJZpDWWt54veW
         42mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780082594; x=1780687394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SY/pjFoVkR+l6EebkjB4dxdDrLLE9cCLnfyxSl7hmkg=;
        b=lpGOGUpwWhGKf1lCYiMl/pXitV2JqSVydj0qfRpR7OWrnfCqt0fT9GQWRmql5oFFzj
         lTmq15vYwo0VeTimN0QQJO2eLXzCqo/BiIcau+ZwxsAzxX09dQ0kbtQGgDE/eHD4g0tF
         hfPU2o1SABM031Wgoy4SxqiTO+J/jm2zKZxxlcsj5D3B4vEM4Ip0o2ppva+NMqL3HXmv
         LE07RVDT3AbX2a7zZdijW7SkYaeZvtBjY/c3yL3m+gbBgy8OTsr5VU9sITRyzuOkvu8K
         o3OWTjs/2V+hoVTHxOauy/KPoPlMkZXuqC0wcKrJ9TwRfPPfChAGIwTX6VvzqG4vzz3W
         08og==
X-Forwarded-Encrypted: i=1; AFNElJ+6/GxYPeTeU+APl2/ihcB9gQvM/xOHsndRbeJaglcZuNBvCVhjAx4mOZsbl++Pj5g0ljB3jSoPO/O4@vger.kernel.org
X-Gm-Message-State: AOJu0YxMGZRRQR33wDbtmO/wkK3E6tZ+fivIW7aNYfU31vTtIa+01e17
	TNu9ZhHiBVPMzB0D8z77EYiFEx5IBjXkdCv52YN6XCAtYNYqqWUt/FrDAz92JkHcEfk=
X-Gm-Gg: Acq92OGAy3M7WdlTn3ThkS2wOfuFqe3JToZzNj5gjb+uIl2BjmnNOTFqJGyTjv7bS7W
	z5MKfaVLgzIYOqJAmb/bis89uJgocZP0Cyl6gMiB0mnAStcHPs0w8Am9IXjDlTgyfnpYDAeJGMr
	IsKyak96kMinFA9NDDBPCBPrmLvMmx8ZeNJo9mHv7i+NLqhiuIgaLtd2PzMdDZqoeIZQz+53I+0
	dl81tjgmqXhRHtPfTA7TBDg7DOexZ5De1B+zB4xMuTVk0X6klNtu5h1YuR6hnmTrwbp5rdVrjwt
	CI06O+pZtl0FdYATjCGXvFMvX34xpFfZiy6oMKiNYeauWyXm14T+JPbdUyty0tx9bkBCPah3WK1
	skO3wVMX4Nq24AHFziWJj9+Plf4w7X1+8/s+ACzXM2YHFcf71m+qSJQjXH4OYXjqLnK89+2CA0U
	LjcSUJdDQNNWxYdilXAT/QessvsWxDb7AmQSN1VLgWAZiHorWLZ/aQoEk=
X-Received: by 2002:a05:600c:1d11:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-490a291fa6fmr16006735e9.12.1780082593552;
        Fri, 29 May 2026 12:23:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm28692545e9.9.2026.05.29.12.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 12:23:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 29 May 2026 21:23:08 +0200
Subject: [PATCH v5 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-1-03aacd49747c@linaro.org>
References: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
In-Reply-To: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1lKQMpd6PjiypUs8OsPV66H2sccTnVhP4zdDuQTSTj8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqGeed1GduH+zhZEZfWhRDG5HUSICoERZsYkY7py4I
 4iauz6uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahnnnQAKCRB33NvayMhJ0Ux2EA
 C2/rldx7AzNQpSI6oGa6TVKXBueQo7tV06QD4RVu5M7Wh9MF24Se+5JfvyF7UoQJTxxgQK+NtrjfcH
 1FCcYQ2fse8Y/gwVjrPhqu2zJt8Svau12tMdhq5moU2Wd6A3q7O9/NsQYyTNeupEHACebcsaF+YVUY
 gRbQOQUChV30r625YZQwO0pmJ6cBuF78+RkhMtCl7faQTPyKCysz7aZ0DuJBL5fAnfCy+uZDMIGBDV
 HLFFfwK/Y1WSzyYKpJcIgHRmRORYu9LFnFfxaL0hX671eaYbdwBuliSY1yupcFsHV5YEfbc8QZlnU7
 3XI5T6PCmGepKbP0dnsYHoEepvwO/6yOCRHGJWvHYsJTIhIvrtLdF62NVhla/THvFfe5aPu76SYRF/
 ghUz8m3kj/x6AAYEX6jJiwtYBqo91LvdW6YUq9Nze32GU1NIn87YEU/+ZXTqV4QBqGsrmtpAXOm2Rx
 lbsmgfBsQk2tort4Mb/VIfcxfp7/P6ZMeNhfOs5qHhvDAOdvco2UyhzBw90OyHEB/sFkphVKFeQIsh
 XPYf+aLToFFnJyYxDNSmSlxFP/1JYf/YJuXmGkN8Hm3oCEh+7lpe5ywqNl9vGqSRu44ufXoGQwaba0
 ZfYx3+mr/DiaIMm7DGAM2nXygeDCW3eI1c7gbrn7ulkckq9f2RptCQwwCkng==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/leds/backlight/silergy,sy7758.yaml    | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
new file mode 100644
index 000000000000..64af6b34641a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/silergy,sy7758.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silergy SY7758 6-channel High Efficiency LED Driver
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  Silergy SY7758 is a high efficiency 6-channels LED backlight
+  driver with I2C brightness control.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: silergy,sy7758
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  enable-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@11 {
+            compatible = "silergy,sy7758";
+            reg = <0x11>;
+            vdd-supply = <&bl_vdd>;
+            enable-gpios = <&gpio 16 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1

