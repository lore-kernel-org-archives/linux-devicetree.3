Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0169C46D56B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984299; cv=none; b=qr8D+Mt2Pd+yUgDpgnyiQFxTzmg3nKFn1ggapxbQy4Yn/GbV+ae+YZgei1NV+LEoCEBk8dL9aMIF0kx7wh4E0ffIPnDbUAVTDCHpSOkQwNzjv6+NHlHQRldRCK1MebSSLPaWGdrQs1R8LIjx6npZGq7PdcwHAVmlEwCBsxROriY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984299; c=relaxed/simple;
	bh=bVtbLtmPcOJx8v2657uFaJlPotPP83zKA8hM2nZ/J9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alSRwn+YbGFpOP4v0VlMcK2DiJ4ohTwTuWwEC68oUd6zH8jEgd8+WdcAItex1JM2ruxT+dzQQQDaPSnmEcv/oKFOcwvgEInwuzeqiQAqu4ZteeKSvm7QCe1oc3gFetaneaKTJDSh42i0PlosNJX9bto6Nu+4hqDg2jjBmuEHsaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBE6FOXj; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBE6FOXj"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so898013f8f.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789984296; x=1790589096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NLBLoLmGyexJB8ebyHo1jEpwbF+ARzbn+plV3A8j38=;
        b=gBE6FOXjuSdqEtGPohLcSBG60Q1XaRw49g32Rc8u6HoP/+vZ+1N/yKUrGx9rdXsyCE
         2jEjyGh7FJwBhwjB6/O/gywtj2ETIMv9Yp8x8UwQZTFvdgBRFtlAlHRkSVHtH2N/PklT
         sxxFHo8TKUOrdU9eAPPJeTT/kVTZvBAQ5yNtHSmsuogAg9FiQSfkGqPujxv8mbTsCoUu
         PJ9unjo1iR/PnIJ/kyvstadRXmX6E6iLpIuRgo5+r+SfAGpm2ISn2QWf6/3BKAHjT0VD
         DxH4VMaWVRf+lk/O+PyVj0/WvaDcJcMizVbwLNWyK7JF/PNwwry+PkpqK+OUiReE73FM
         WW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984296; x=1790589096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NLBLoLmGyexJB8ebyHo1jEpwbF+ARzbn+plV3A8j38=;
        b=EnosvCxn0oEq6nRC18cGQ9PiPp5HToDwbRCqV8ACjSLNWpPEeTG/Oce9spleiK+VW9
         CUBWLGfTnyxs3uGZP3TOIBi090LpNZmAqME3wRXzBQrMl9o7Xp84ZSZh04u/q9dbzLNk
         zyuRywj8eVJC3jYtWWGOrxRK1tyvp1irAHFE2XrC7e3mW+48GCf9iNxF1PCJfUsP+YXq
         T8XlPE+ZfInRcn/kK7hD1NZ4PULV+WOLJPmew1qUle+uxfwFZG1yNOeRnVpQKg+t99sE
         NbctWyuJO52X4tF6kmzV7Ne3hLZqYPGnf24CEKIcEqMiPPBBvm5FXeJxiXbW+NOQEr5V
         Y93Q==
X-Gm-Message-State: AFuF++mL2m6RMHjl2agGoVEiFosXSEQ+9FH6KCeKdQr2y6CZbM8ELpq5
	Q+SV9kzg5m1W4s8yqDjNNZt+9OjM4uCnCfUDj/LaFchEZVEDrtNI6pFn0s8NFJCyHK4=
X-Gm-Gg: AYBFou3Nw8kKuVmWxP6tyP6PO99X+hO0r8xbznHXyTNDZn7eoHEFm57blpIqY3UG6IJ
	TarvDMUc+eHrXKXh3fI6fCpdVt1omkchnMvYCqkC6QzS4tNMvZn9bh7fGA55tU2jQeHfet51vnU
	H/vmdFoKMn7ZH+T09j3/yC9iZn/3cjX6cG8SQCW33kRx4EAG8BVeAf22VvVqO5pWZWOF3pvWfAP
	K3Ryv6kVXIK5k/S7H1o3eyERGZoSKCq1Wq3tIwvz9Z0Kuv0xnQ5jK6xFHoYdjtY+3o9NlfHkM6I
	qwfZjIsoQzgkL6qp/f8O8ZkX77MpiqdIEUv3LITlXkPqRWKG1tK8c8v6MGHVvKZY442p8F/h8nD
	9tvsqN7SJhABZ1WEu8XY9tZIMtbgZclKd1Dh1c2xzZWS5X9YlPex+8SV1ReD+EWwpiGAzMRj2FA
	Ku+NY1B1K2Ql8kErC1JPRegRH8f+Xh/Yh5vkONDZaBqx0hJ+J2b0oygxQ2Hma9/WEVmVAlnYeWN
	KML4EkveQWCB5i93Vzybt32RECp/2NQ
X-Received: by 2002:a05:600c:468a:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49fc4fae7acmr162113995e9.7.1789984295895;
        Mon, 21 Sep 2026 02:51:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd03fe55sm254330365e9.2.2026.09.21.02.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 21 Sep 2026 11:51:31 +0200
Subject: [PATCH v2 2/3] regulator: dt-bindings: document the Nexperia
 NEX10000UB dual output LCD bias power supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-topic-sm8x50-nex10000ub-v2-2-eeeaf9b0c913@linaro.org>
References: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
In-Reply-To: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bVtbLtmPcOJx8v2657uFaJlPotPP83zKA8hM2nZ/J9Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsP4kOweo/gUhpfRL55q1vZfFXA8Q4pH5DsE+7Sj7
 O+iBFTWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarD+JAAKCRB33NvayMhJ0aNaD/
 4niH8vAyLke9q+Nk5uUC2rgK0cxaDHQOYz1XbqCcV2dqQO2MlK3l8f1FeTIXtenV/4wkwKjHaA/+1R
 /p0nROmnURUxh/9edr/AJTy1gV8cvCoPKNvCwtjZU69lebwxE+ZRtDoz9h1BzIYh3IKeSpbxEXH3SB
 HVEDLYwBXFx0v2xRTa4/zugF59rF+HLo9/djLS7Av6sClNCLAYF9fQ4fk7X/ctYdHve1oFQ2ZQpoZc
 i34f6JUH8J+HRonxwwyuBD6L4gvep2bmOdNo8tPERMm+MZCgmwxG9NcbGe/X44JF6XYCvHO82/tTsk
 fgzAEXhrkmhuQp/ADHs0Bkxe6DFi+YOnzjsr1vGeXvXHVONVbYlwRtMRtF07bciXrt8YAb0U7ox4WA
 TVfPf/IHx2nA1e6Y4ZW4U8RR479cKxvjDyVa0a2QX01BZ4ydi1ya0OcRXWueTcMUX8IJE+IZrrEPQn
 r7CjnEAgDbLugRFSJnXlJYtCzlUt+S9B3Voj9GIcFT2+N/AcW65LfHDWJs6wr2nkSi0AOozZYh5M91
 7Eg3PN14BM2wDdGScGE28e7zu2ALJT+F8mQoJS/JxE7xXPcMjxGXksRyhafcZgAZdUVoq9l42DwlnE
 xUWIcXjrsfvvQNENhF7+77Sgq5M7kZBmfFDzSZCKHxCHaTvBAksLngKd5xeA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Nexperia NEX10000UB dual output LCD bias power supply
which provides programmable positive and negative output voltages
mainly for display panels applications.

Product datashet can be found online at [1].

[1] https://assets.nexperia.com/documents/data-sheet/NEX10000UB.pdf

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/regulator/nexperia,nex10000ub.yaml    | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml b/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml
new file mode 100644
index 000000000000..3c0db59b8c1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml
@@ -0,0 +1,69 @@
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
+    required:
+      - enable-gpios
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

