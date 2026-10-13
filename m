Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC693C3F40
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900440; cv=none; b=DybXhwK0zPGiz0WRk5tIp10GQ1SxyZos5mCwMm7gzw+XFnr7tdHUfzViCGnw3AgxycPAXFIoPSr0tFakCsP63GyMC93uvp8thBOCAM6NPnly6pI4Dx/t3JdP4bu57KyXrt116neg3qGDoH9yqgSTkvuFchbdSuK94LHU4roFf7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900440; c=relaxed/simple;
	bh=ixkLfsi5z6rhg+8XtIM+rmsLjd0FiwPrlwpSt0GJlHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJ90O/2AAQOCodnFixDisgZoKrmZTxqRTvv9Hwl+uDLvTtW60wkHQVqyKxbOplu5ykrtUDgiLZdAx7BuDNnD9/NUQzntjm4JJoqF1kc1gso8UeG3JLZkJP9F4jPdpvWRFayqnHrEJlNfcQ2BIfHB05l1pAQbyNuu0QzpNzUth08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iCo3fHVt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iCo3fHVt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso21472175e9.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791900437; x=1792505237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLtv64omo0yQg2P3gbqoTCMdccerTB6y1krEjLFdXsE=;
        b=iCo3fHVt+4J9OljvCtW68ljTNXvmbSz5O/RYTqWiL4ZO7F6WYpHlnkS5pwtrh/jZ6/
         rILmg5y5sc7kFxICBrH3OUdqjCoLMsx2ysTJiN9k4L/a4sysfjY7xxx36ZR+XexkPuOK
         nVYlypY6ocAM0sqQPQnM7T+AEr8qs6S432nyItBBEgl4oBPMfaVqgK3gSeAe2dq0Razn
         WUpAlap4/3btnqyR9iqVE87ENBT54jWgKWgefiWLkL28C6CwpOK0eVtDc2TZQ+Psek0p
         aqXaDDerlsp/RaWAEVPWSuLm6DXk1J2EwtGnaTPUxrNYpEzE6e4vmo558CqNCvz2ntBf
         wRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900437; x=1792505237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLtv64omo0yQg2P3gbqoTCMdccerTB6y1krEjLFdXsE=;
        b=VdU89jda5Ia7b6jTdV85sZCi7Hz/cWe6RR094fGwpUSW+bdTAM/A8S/sLWAOHKAkR5
         uLyazOHZfeXSssdZIRvb/4anUCziZVcwYEioWx1cmGPY8Y+9RKroYS+tk+VTjRONb6sh
         IW3MnJr0weE/n0jTDua0JBMCWUcVPDanRdyYsD3/j5g7AmTKntc9QcLgT+LgtUh/i1oD
         yGt2eNmzWp28qy25MJV1nQSYvkt51R6ak3v2swwnpW6kNlK36vbbwD9wjU0m0PLWxk05
         aWfZNrsOGNaZzQLDlzsM7UCRdEXsvLP5Bno1ZISRwysm3JNu2ytQXn6JMKz+Wd/F8fkw
         YO1w==
X-Forwarded-Encrypted: i=1; AKwUvBw4WTVXpTkAsar6284SAHNzus9K9dzOabT2ETgNMZonpjSz3u798qCs4hkA7OTyWKfAUtTffjV9xwB0@vger.kernel.org
X-Gm-Message-State: AFq9FYIwHAPEKXbhu+4vbqTCY43HmUydPRDQMZtSiMBbenOZG+6oyq6U
	Ve4TpS485uBcNDfKWVi2Ree6IqrIa8MNUQ9QUHNUgBpn/6gZNXKzbU6ohM9RcLomJRA/ktymPpF
	rmM+A
X-Gm-Gg: AYBFou1nhFXmKw2XUyTD/33n4eXIaUr0GSGVwduBpT7puU3AGtUdoKoxycKwbSKrN4J
	6B+El6KPtl1ywY/XBx9xtjEPAsfHYH11KERiGpJ9Q/DghdWs148xumGO0MSPtbOKixi6DdKHBCJ
	NFBgYF8owThjIUtIp9ku2vJEf0YRf66iZSzIQpsrLD1YgC7FxG1AGpai3df5UB/J1OS/dFa1Ccc
	qitBlYUpE1QHbGLR1wkvggTFkTl2oKZ3J7E1ZSKFx4okc+WRf1IhUc/8N7ftbqMuxppQ+34WwW3
	2+4119touLbBa3twX75mvhdRVAtz/ge7+g579w9GEWhAJPC0VYRKu4YwfBAHDx+QlxjNP+2LZ87
	KHtsK2uHX87NhNQbEOpR8dGxEXhkCbKm3DxoFjABdxQMnMdukS17hsRWnX9hruC6b67zmCY7Asv
	AuM73U6yuxENBYSyK7AW9sqrsCBybzZa4vdZyHqayCSGfcc8V9rGZAr5jiL1I6s/ttLFBazue7H
	HSH7nFljOw3hxtHJ52p
X-Received: by 2002:a05:600c:190b:b0:4a1:82cc:1e9a with SMTP id 5b1f17b1804b1-4a18e4b2b25mr250431415e9.17.1791900436244;
        Tue, 13 Oct 2026 07:07:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm364625305e9.13.2026.10.13.07.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:07:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 13 Oct 2026 16:07:11 +0200
Subject: [PATCH v3 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-topic-sm8x50-iio-max34417-adc-v3-1-d3604ae4a229@linaro.org>
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
In-Reply-To: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3123;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ixkLfsi5z6rhg+8XtIM+rmsLjd0FiwPrlwpSt0GJlHk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqzjsRBrbn6UXcvWoMXQ7jkhABq1GaFKGsVFGHcxwE
 C6fHvxyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCas47EQAKCRB33NvayMhJ0cgVEA
 CacZCaGIo5rsONTqqPcpd4Mk4Mz3qcdBYHfXe+4r84k3eunzhQT8geL/qFilWITwo4B7ehBAuI4uJU
 dt3bQmmqT0/XgNKRebn5AHPLPuaVCaSOYPw2yz8hihuY4zgpaC6Hxk5C9w9miXgY7mSYModXOqwHCU
 v1ZPvQpZjXEhuMbdHiEvaAOcNmpz3XQqPBc5NtPuRDOoNklQ4EY1SGJeoEpYzSkNuwYSrRNJgtayzy
 rW0ZioSI4wwZTR1Eb0VVeHHJ4bxzYVOF+yqt3is6fqto7bK+0OXDNY9wHb2IyJtzewFv4IbOzNDk1h
 jq7PoQ70SdHPGH1E6ydkHvBFxguUTYUi2OZ62iaim7wLPx7h+gIGFJdncUtONWUnXMrHvxBBk/3wkh
 HhReOQH+prG5sktSa51hvYc9PneUsug6kdsXqnuCWkOeKT0tSjwj7MnR5Qy9pmfce50PzoVcRTbcXm
 GhZVjDrqz7QlD+qKShUFR6h1BQSBBWVH8rEx4hPDNcFuVSYfB443fscc/IxZ4SV6nDB8IxIqWYa7CA
 QlOHo6LUC1tqaUtb7s5WXkZ+md7+J8eCF6+Usm/JdufLOk4nhYQChp3PXqGdtJLygVwPXlp76zvRtL
 ATuROGH9Q5GbeNfLvtrnp0sezrkeKkt78YBBSX0ONVqufX/Daa9zAl2xD0RA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Maxim MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/iio/adc/maxim,max34417.yaml           | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
new file mode 100644
index 000000000000..058af61cc04e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/maxim,max34417.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX34417 Four-Channel High Dynamic Range Power Accumulator
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  The MAX34417 is a specialized current and voltage monitor used to determine
+  power consumption of portable systems. The device has a very wide dynamic
+  range (20,000:1) that allows for the accurate measurement of power in such
+  systems. The device is configured and monitored with a standard I2C/SMBus
+  serial interface. The unidirectional current sensor offers precision
+  high-side operation with a low full-scale sense voltage.
+
+  Specifications about the device can be found at:
+  https://www.analog.com/media/en/technical-documentation/data-sheets/max34417.pdf
+
+properties:
+  compatible:
+    const: maxim,max34417
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vio-supply: true
+
+patternProperties:
+  "^channel@[0-3]$":
+    $ref: adc.yaml
+    type: object
+    description:
+      Represents the internal channels of the sensor.
+
+    properties:
+      reg:
+        items:
+          - minimum: 0
+            maximum: 3
+
+      label: true
+
+      shunt-resistor-micro-ohms:
+        description:
+          Value in micro Ohms of the shunt resistor connected between the RS+ and RS- inputs.
+        minimum: 1000
+        maximum: 100000
+        default: 1000
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@10 {
+              compatible = "maxim,max34417";
+              reg = <0x10>;
+
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              channel@0 {
+                  reg = <0>;
+                  label = "ch0";
+                  shunt-resistor-micro-ohms = <5000>;
+              };
+
+              channel@1 {
+                  reg = <1>;
+                  label = "ch1";
+             };
+
+              channel@2 {
+                  reg = <2>;
+             };
+        };
+    };

-- 
2.34.1

