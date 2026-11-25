Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609966;
	b=lacToNz5AtVB/kglVipnwAAaQ5ENfn3+bMMAAWAq/ApmNgx+6fWJGO1q7RKEOznaEaD0
	 YVl0gEXvSaC7iBf7qlJlDfu3B+Dp7hB9G0zBEOiefbtd7o69kvyi5oauuj+ol4YbfaPsZ
	 GmrMKdas6pi/RPWS0+waC7+lP5lPD/OFPV+dAEcjXMKQNb0wHOSi2z9r1ddda153o/qgX
	 b0UcaZ8EVNuO80RpS2FDeQj873U2vFXM9pawVthPpqKC3TzkIyFtMLx5P8NVKR1xTVyHx
	 /JKFxwAxxxDl/Ajs8RW85cguKt6glFBwaURBqXJlxY0NNG65u9iolMjuXEv6hQKb34Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
	b=mQpUY7/QYxJqQifwkfcPWQvOc5i/e2VgxyBRNIa5PYJ7Vp8aGzsT4ATPW9Q8uLUKXRxc
	 uxfJVvaT/2qUdP6uXZ5Vq+zv3J16Bs6N8npC/v/zMZ7/bUPjE2R12/VLbtM5rWm6cYcoN
	 OSK44nlbqaJZf2oQ+Ii8NWu5hEd7T8qI2OODg+SYfgjd5/gFaiH+rXNYxq0OHbWty/hSS
	 g+lsKzKK9mYeFwVIYseKZ9/k+xvd7sxpaq1Me9vjs/j0Q4oxB7JUXD7wsXGa06GE8VHXr
	 cduSk0YfrM2MWYnVma+nwW7QP7kzzUcUPxTfszHIP7j4HOESENYferDqkxPbs+FzR3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NANt/KWh";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037C606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6037C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NANt/KWh
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc751eddf25so3700185a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609965; x=1796214765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=NANt/KWhIDdvCOeY4utjDOeqLYM4twhmFG1ItWWr3HFT9jCk4yOM+BgBGWNOd5ahZu
         etyEMApCd3o8OOE7+A7McFA3J75fbpLKjLtKw4hs8S5XrQQ3oi6X0ow3zlWFZzwAzFtI
         wLCY/cPCP0Bb74osRlvhcYTbXoe7C86voPzvRciY/wVa5IvEHzGTJpVQwj9Os04aI/v+
         FDcmPfmq+U1YC6K73kI0mm49vPu2QV4pucYa2aEF4YvQWHV23zNY1kpx+bFRH1NOOu3K
         zYibLiQlcmSvn3TzewhtK1BOYPKuemoEFLkGTqdUtQcJKNSFWRXHvmddFInF3mz273cp
         cFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609965; x=1796214765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=WTNZzHRGOMhyQludgQGwF8fXKQ92rdi5F62H8Du6m4dVkYxP7lZ6KA3EnxfsxRl56I
         xd5Td8mxsCna2LwVTHpEGIqZQp4Y9jJNRfi0erOK/XqpNK6yhYim1GAMz0+2Wyft1I23
         0NFwq4VwE4K7/WWbwUCdL0dgfTvbgH15HVo8UDGoJ4tQSjWK0ewsP3sptI3/1yFbXn1q
         dp4cDndVqbA0t8/lWzyTY9DqtURtZ2PzaMDPmnXGxpk/AtUz53MaLS+F46Xr39q52Upm
         QxWRWAGyPC9DKJVKDbBSWTytr84Aa0QbNdZizmcRiA7BrKhGgKCUUTucLItLBklmIkFr
         069w==
X-Forwarded-Encrypted: i=1; AL+hErGZ5Rzo/d3Dstqe49B5Ep8mfIwU3iENsP5UpoBw32FUuMMRvR4ZAfEPITSHyk7x/WYHdIz+89HY+ykR@vger.kernel.org
X-Gm-Message-State: APuU4Z9bc26Ep42YOPxUQurwnAq4H06wot14mV/C16tsQsQO/K/2rR/M
	we2Uf5DJ4pSQFXHRNfYYCX4xHdvETAHgk7DIlPZnk7pB6g+0PrxUZftb
X-Gm-Gg: AZFdTZfOaJlvXr4Nlmn9uoToD782YlQXVjjQBWDOljs7M9XAy02qn+7yYSbBt9o+S79
	XVH9yXFGkelwo0x1Ss5LStthafdinm2nlUddlRvnx/DQJjXlmEH+R+TwjASKwJlr37bxDNG8oNY
	4n7iA8yYvl4WmdwVR9nF2/dtHMOpxSk5LB/I8JtP8BESMC88Lh5Vgmi3PLN7mEcTICWARNEdX9t
	+fXMBjhTNEUQjrEAI9GfbyAg1MYblTstxQ9jsN4twQKgjQO3XHQhAP2+C7DBrlKGVDuBEywfQ8e
	FoyQFzplaZPh2ugRUuf3crHnoMP6UfxwGHMMBbRAMjEXD18FTgCzrUSzKS3jgVRBOx0AxQA9YOL
	7agn+NlItj+LSNc7/e51h23X2lX2rhL+1XQOVuNt9bVhoW7agdbgRUCooTzNRmcd2nQl48REnUa
	1WAkWc622orhQnHKGpD1rJnRmLFP++IpwoPioAeEEdMtr4IIwdaEqh8x+BJIEBsahN1B/mKBlGb
	Px6z+u6LxeXDlDLJ4jPr50WYYx/H/AUkwgDd+Hrtj/cN/3R5tuReQOa3zdNJarnSJFMnxSK4N7T
	3Ms9hP7Tjwcps5+dYCHx4IQDCwst9/phliiOtH5oJwLDzrs=
X-Received: by 2002:a17:90b:380e:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3b41c9493ccmr17317487a91.50.1795609964791;
        Wed, 25 Nov 2026 04:32:44 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:44 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Wed, 25 Nov 2026 19:31:41 +0700
Message-ID: <20261125123146.379057-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel

MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..7c538e48ca25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K5E8 1/5-inch 5Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  Samsung S5K5E8 is a 1/5-inch 5-megapixel CMOS active-pixel digital image
+  sensor with a 2-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8V).
+
+  dvdd-supply:
+    description: Digital core power supply (1.2V).
+
+  dovdd-supply:
+    description: Digital I/O power supply (1.8V).
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
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
+        camera-sensor@2d {
+            compatible = "samsung,s5k5e8";
+            reg = <0x2d>;
+            clocks = <&camss_mclk1>;
+            reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l23>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

