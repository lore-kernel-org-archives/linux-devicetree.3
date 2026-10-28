Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193553;
	b=XG7nr4IiIxHI2+8F51NJGt+UhdWXmW9QWnyI+WziH46ufAcBpavSBEY5JylLgwEilhh1
	 szJpELm8mFPQ2GQA+JGonCtcNQM5Qgv/DdkTvbOhtN1dCzgj9B1Ts3KS3FnppUNEZraH1
	 /bmMF0ISxXWsRJ1sJ1oe6FeAn5BzfKRI0wH0ULI0d+jGGwC8qluIIY+bHbbxDJa6i3EUg
	 DFEqdjncctMgvXlfamL/gtpFfIbrhJ1ZAdPN1OOMu6Ip0mMYROw95N0GK7ntkbrmkA7R+
	 p54SGMMaMPtasiU9pvoZLJviZqQBP9FKxPY0sSlNDF96Lub+dPaVOn/62sfq4aTHLJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=d0Sz3wE6QuJRsVQAlMgQ2PeGgkq4aSJ2LFCV4qd304c=;
	b=DFwfEp8VMOR9I7hFLl8b9EjxPg+p/eOiIZMAMtnqGQ1DvW/VbOl9G6ysEyzrISihTJ0+
	 bTQsII+F7eprgxqw0m5/8RRexw0+k3mk9MVDQhABb/Y3InWADqfLbI0sQs1yz1eysbQGx
	 cI2WW1HgezyXqBrvolNiiALlES2UUcxH94SBl++GJAtdbqP2aX/d7hEXqTQaPBgkLwb3Q
	 M6Ig67cHnomt5iQZmTYkT1tW/wwCUKAvXCGg0czSAN80R+HEYywmIy8dWGAgvgdqeW/NJ
	 rBHnZyJaZ1PHqhWL29ylMUuM67YlrVe9epCm6HYJ/P6pO05eiUXAN8d4V4Gqi8AgwQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HJc0yrtO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67A6606A326
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D67A6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HJc0yrtO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8329025e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793193551; x=1793798351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0Sz3wE6QuJRsVQAlMgQ2PeGgkq4aSJ2LFCV4qd304c=;
        b=HJc0yrtOqjbAhVJPBUbe68xiHKHMVyPjwJWvrg+NEZOLFpaJeUngo/PBOA1K7ON2HG
         oFPSx4moojlAeVt1txdMMJV6jLvVl505T46EqDmNVJsHNvxSjc+XOJwrIkjCe0lH6PjN
         NU1CFiKsHXVeBgkhvGafZf4I9Bg0KJvUnHl9drGWppuWe/aQsRX0QOhSs0Lqm8umemQ9
         l1qDgN24sBTzU/iji5UPLufHdNi/kX8RxXJMoxZlgjG/Y71WGMEuN+Tc5ldsVTV7hhqz
         V0yEXHS+//ciVFEMAxArCIwvkxVxY/Rak1Z/WKBFXCORbY2Ige0jJ46gglet1WUX1Esn
         xRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193551; x=1793798351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0Sz3wE6QuJRsVQAlMgQ2PeGgkq4aSJ2LFCV4qd304c=;
        b=ji/XefE08Z8lQzZQP1Y/sDlBleZk7r/qNmX/onn4QW561QWGuLzWy/SWYwPHNvNT8k
         AdKiw5XNaJ4l/yYZIqqOSdgBmMvtfDx9wVLKi4bCVHRm915FRwCXiQ7bQlKB/QAB2ZNm
         MbGKa5mjk0i10eRbXDQS7hw3QnRaH57iX+WWiF471eKvJxW51eWlcRttDK5BLUxR51g2
         X1oksDMlTQJ9uZpeu1k4SeAMazMwXL9TIGCiyEen3AU6ENKCk3LZbQ+m/CR70IvxnyA4
         UDZuKgAjkUXfTG7T+qra8fckb4lhKyMPBlDeUpEyfSFraLuCLNjs41Q1ELVFpPwH3W8P
         YABQ==
X-Forwarded-Encrypted: i=1; AKwUvByXO6BsRnV9F4YPckGiFQ7rlP6TswF5Go6LkMOzV+L46XI2Xjik3KZbLOjD1r87CSWDRLde6JGclI3O@vger.kernel.org
X-Gm-Message-State: AFq9FYITWKH8AbHYp2Q8cv6ysPDv8qovlaECHOFssEQaxWvGVDjVvs/5
	BbGwHGrXBskTf04gsZIwIN34Qz9JhiVZM52ZxwfprpJHUsP3UQ2v5ukCw1ngjt+OU7k=
X-Gm-Gg: AYBFou1i9jcQNimoDXF6OSOzwy1KT1Hw01Wl0DeMQ0FjbGI8AavYvWknRpZ5V9TLP5w
	todKkYp06u6fsQvH0vOKObTIvIOaxkIvaPMPAtXbxqJtwJq1fwVSFNx5OQ1/6WWdJetuj/iW+hx
	WO/MyS9kVBwcx1rOuMD5ClaKfSOwuszOCoedtXvRx1CekgcwUOjHk5VwgAyV8JbJ84BXgjwpSH7
	p4628QtOrA7GP3VvF2JISIQKEwvfTocoHGHqRJrexIQO85DzcDeUzCQ5qZQgHs4PQeNTFGVmUW4
	xkqmQvV2cYdD3WZYFI4kK+30BXjq3fy1M/ajj8ZBes7VLTHwRRQQf7L0/986lwi5nMMUs/S59AF
	kFM9NS5pAj9ijpHN6rsmpHSylEOm72275oiN1QO0PCxK6KkyjgD3rIFQEKZ9RRywf7fzA0ePlSX
	oOVq2PRtg0xU2ZdnBnwTlPjtNIl/XkjOIK8q4wG8xnFMrcY/xX8fT8ngc3aTSai3KwPmSUbJ40X
	nNgwCdeKjqOl0QZTzCHVDbl5HAJQMmtpNtVFLwCMCnv2DmgZfilxWt2xwPXLc6wqiDDVHbMzt73
	2p2HVW9Jq964ns8+FpYF4p8UD0nffMDfXV2aNoWUH+t1Ko8njngVLui9iLzTOFNARw==
X-Received: by 2002:a05:600c:870f:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4a967f84822mr55295305e9.30.1793193551156;
        Wed, 28 Oct 2026 06:19:11 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a996aa0ff3sm19869395e9.1.2026.10.28.06.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:19:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Oct 2026 14:19:04 +0100
Subject: [PATCH v4 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-topic-sm8x50-iio-max34417-adc-v4-1-d4baaf3ee903@linaro.org>
References: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
In-Reply-To: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HnCShVki22tZbqn46h/iPHVXxPadylCsM2+tjvBCgiQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq4fZKRr6JwY/iebIoucSTFldZ3DdxsAChjXroki8b
 gzEYQHWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauH2SgAKCRB33NvayMhJ0TI6D/
 91xB3UKBAZq/XHax44a6GmhnSkgTvPW2KdvhExSgE3/JMSRo8U5cpfscUo4l7cZuc5gfJRnGy1Z2P6
 z53UJtXg7+yU4JRHSabvXrrqAniLrdpq0izvrGal37xWtMfJcY4eVWVKGeCnK/XzJo3ovwOZhwTUtY
 DGcA1NpxGls0xBEvUeC1uZ8Qd5dYHl/nNXmWWuIEqM02wZwyYa3F9dKcjFOy+83gG5fwU8Jj+qtaKp
 ZgkyDIZhWhsAi3EB4bpGu3PA7BFXlqMlJ4Hm9doyCTpWhWSBZj3R2SsbiK2p40x317cEymQl3tsx92
 OvumhoIMMPRcAQRqa7+udpdtvR9UuS6cKq80uKHcFVIvD4JjL/Xgk5NbmpN0XkLFc6sC7pJe10oShn
 hhDJAa+z3zJcRDj7zwf3Hu4LBoaCAqLDr/xueeWLx2SraAl6R8YL+J9I2HhrjiUS1cde7G8G1cjsxz
 PzaLr4rYcMThg2zcDVN3ICIG1j1NX7Y2gmh6A1wdRVCCKBUM+z9cgj6df9D2Lwu/BEOSwQKSidP7xg
 cLGvVRbJ8EF8gUPPQ3mBOal76wccdkeBLCppyMpQzvnAQK1WdYzRst0bPwLmKLhgw1/CyzHcFwebXp
 oq4xfz6w5POzO32DNiH2DBI8TSCVLAp3j58xeZmqgWBNwlh/krYrYnk7tBRw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Analog Devices MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/iio/adc/adi,max34417.yaml  | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
new file mode 100644
index 000000000000..700bc3ca7d7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,max34417.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX34417 Four-Channel High Dynamic Range Power Accumulator
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
+    const: adi,max34417
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
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
+  - vdd-supply
+  - vio-supply
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
+              compatible = "adi,max34417";
+              reg = <0x10>;
+
+              vdd-supply = <&max34417_vdd>;
+              vio-supply = <&max34417_vio>;
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

