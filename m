Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630957;
	b=iV6FYQccCb1ZIXWwLN/Qdq4/TZdG7OOPsTW/NY9AAslmfGq2otnYeBdi12mRPYwutsJ+
	 eX4RSkfk0oFqo58X/z8yvQ4XJZ9RmbenliA2Fuh+npeWW/Y/ur+HwpDrbyLz2LE4Ip4X4
	 cLOMgclnxLQ4y4Nkw5VSlQmg4P4ix2xbPjNLwt6w6nOm9AdMczoOL3J8PDFTaGPQn7rfT
	 MGmt49CmqxkT0HJHQeD9J8cBzqBbSZyVxsBzo1SiCotHPcklxNn+HPJYbq4PeUu6VwPrT
	 rpORbrFLNxP1B2tc6TkwVqzDRSNt3lfFTLHnVgM6O4OQx2OC3jpP7xhQV1rJKt85Xdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Kr/0/zrG6UtXc5ZgGRqIaFx8aSpMlyDXE+9uU4A5XaM=;
	b=UjE0sHaQRID7M57CN8ocGQkwA5ZFm/kPnadNsiTx/wdatt5NCL2hlPfL1DDrrFFx2ld1
	 xUl7rA6wPpnoq28A8+9cVF5oozOWdYZOFMVWkwOr7eJDMkNpkBT1Ud4s+oGbBd2ig83BG
	 j/o72B0tde21Wx7zGv2aA25pp0+wBws7lUz6X42PQUElkMab/OiC1DgyeYBF/AWBqtmpe
	 XAQLy/FtmDd1jTo0YahU7czfrYHitTIckCtwmA0/H3qdvkpMPKp/EUCgmL3NrmOrpAfTg
	 g3HPU3+da/4Msc6V1oLOBYO5Ft/EkNolto3x6IS+eixs2HskdpXC11thnRN6gHdbmxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oREFOxJO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591A2606ABAF
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591A2606ABAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oREFOxJO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so40797655e9.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793630955; x=1794235755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kr/0/zrG6UtXc5ZgGRqIaFx8aSpMlyDXE+9uU4A5XaM=;
        b=oREFOxJOqklkzH+3vsxfw87Oag2aN3ZulJY6EFhiAI1e2G4CH7fVZ2CT5w0EuEcyPO
         VJq//JRpfAfO6Ye4G4TLPYY4mwh3C+KxBeUgxloH8gbdF4h4gId44mape603XCa+XNxq
         Sg2RsFRYH34nTy5gifsU6sUiFyzpT3vircieAJvF7jIAF1HJfRHBDIYUCkCd5IIjB2de
         wAmtpmpo+3vIrfarfdIfW9m4N/u8KYjlmFTRbp7EcTPmIy3HLqMneUnuYYc/lT4GxM9V
         MUW+6EyHSVts8zmHSipHCTFz4zLNplrZ0vfyMSce3WbXkqovVcY2PDHjfF7teCgkOzrP
         eErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630955; x=1794235755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kr/0/zrG6UtXc5ZgGRqIaFx8aSpMlyDXE+9uU4A5XaM=;
        b=VOuYaSg11RLUurBI6x91yIBYaVbGjBiof8RPNkJTjt80pJRpx5liIzm0B4zbRVuxrw
         vEXHrLY+tc0mZjT45ClbU7dK2ZXylFrsh9pW9IZAGBJEcqZWYA2Jl0lsRfj3IPTJalAf
         Avz0u1WFYfw5Z4bYNpunsiaD4c5DqmJgqciZaGGyn4JclGm45un2EASvREHkd83TjHXM
         ndugV87SC/JhzjaORbVDIpDcPCgZFxW3F4K2Hp1SmCoXHItfo4Z+t//PVRJ35QV1kGwk
         A4m4pf2FZN6RLf39Jgapu4aPF1LFzlnfyussOWtS9x4lSHUc8VhUhMNZeUqVCJLirTVl
         Uumw==
X-Forwarded-Encrypted: i=1; AKwUvBxYOkCIFZlYA6GnAgxq7v6oof5Hii2rTLi3akssKMoFAgvW9QL1KbrJPMMm8cwZp01ckpSk52dg9OvB@vger.kernel.org
X-Gm-Message-State: AFq9FYLtLN5/qMjjx+xXtDj0mE1ELBerolSlVClwHfzLVa9j0zMHZ3oF
	9CUVlnULUehUoNj6jqSv2kZ8okxw72we+k4jt2fnclWT03SgyqGuIOU1Onl4HNB5gOE=
X-Gm-Gg: AYBFou2KfjFGA1sdz7b+qw5X2SrXUgwc5NJpPu6aJAXO+0h783vSHXxckTGB5LPIEHB
	+oviEt83YtaAiiLKmLvG7x23ZNKIei3dzkKZ/aACNDbGvC9TvCYmOsmSDcdluwmSKD2KBN9AXMc
	D5Ijps69gzLu9a14lsWhiSRFePwVzpbuGFNEPfVUNFMxguAtcXcxHhmyEWiJ2aUad61RuFcbo0H
	Qxsm/ypxdluHtweipLjiVjcBO0srZogFCTOY8V30ZC2cQY52jgbLn2glOgxtBy/TkRofKInHIJL
	Ri0hJwINIrbv88s3lSxMlYkMjoO40o+fnEsowaohksUCEiQ9aooPJR8B65+HyCUw2CL35LGvbAw
	RetqmKeKfbbpHCfHdT32/9Jj/nyDhXBxduXfG1S8KMYlfjrLu7lZkWGD116Dqxh61Fqq74A0U+4
	ySiLKsiHpU1jko/g5u8dVNUf2Xl9863F98Wyxkpc2eA9Zi3QfqYOpLEt1f2FopyqnZxVnNyfAP3
	6Q+nLPw7uAG9UUxZAfRZVBQAgJ519t4iM6D6AjxltWg+5hpc9TyKsBwio65qzIX5l2rg1InFNuf
	4VwcqI19q5G3JG21nhXo9tEpzLkdF3nUozhAAqC1py8y1prYybY=
X-Received: by 2002:a05:600d:6508:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4b0b9ff2129mr72260095e9.15.1793630954642;
        Mon, 02 Nov 2026 06:49:14 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm447287005e9.3.2026.11.02.06.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:49:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 02 Nov 2026 15:49:04 +0100
Subject: [PATCH v5 1/3] dt-bindings: iio: add: document the MAX34417
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
Message-Id: <20261102-topic-sm8x50-iio-max34417-adc-v5-1-0ffa5e5f2d5c@linaro.org>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
In-Reply-To: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9BXhA5fFfLSYVL59KMpAhM28HVLuZn6XWhT8shL3zk8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq6KLntnaZAlA6G0Uo0gZRQkgCqCbNiJaIkMAFRN3L
 v+1aqDeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauii5wAKCRB33NvayMhJ0cVgD/
 0aZEOzuqhWfVbr/90Pax+VotAkaurQFIqA7IF1pCj7woeV6T9AxCU3sTqQGQ0uP43sHltKBK6rr/3C
 J5ZYBCxfXMphwOqh6eHhG7qk9kkzOoGiCUS9fbxTFRhu4ovUA6rfXttUsVIBYsQhNDVC56GHXUBhAf
 hynTs4R/iyfQKj/P45IvVkS9kODZ8DRn/QwMRqz4GVit1k2X6H847V3vLXZZe4NvWvNQSN9D3u/VwC
 R3pdnkHl44hp4m39DhHCEUKXaBby2WxU6GwCa1CRkiaJceDZsuVC85pAoWyG5NIz6+upyIW6lb2usl
 u2TQ9YYd4a/z3pRuFxvHp7NhOZooSSEJDzXbG42ExT8/u9b8CeNmtjq0IeJ9vRuqjD0GoW7R/8GzUB
 Rpo2LNG10tqy8+zwQpIc3XalsKFGc4JWZvajQB2fPvwZVlON6BH7Ol3IRmaFbN1qTOHYSFc66LBWYY
 CLdC5rg+D+MCOMagxsmZLtfvRZq27Rnc/APTBfLeOO9mG4jUXbmX5R0PCSAaArUD5Z9R1f8v6dplfK
 koajRRTy4h2+S2A9Y3WzT/qmHe64lXF4wYpBJtiI1zhxRta/1AFJDQ+TqMe/fBxgJ6eLdF9jxYAuk2
 iKQXvFblkJ7+SM2uqP7cVlmL8E34i3ObCKnSKYWLGUw6Zfd+mTe0cprjxJWQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Analog Devices MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

