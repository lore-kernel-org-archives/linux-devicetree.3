Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787157;
	b=AGqlYKNuXcO3rFFNXiEdHz6hUE5IPHksKSzU7zB1qYPN6gKPawq4JARo/eM8z6e7fLUg
	 iOAEvYQsSER8osK6z1oVvScayBnXHjMYC38Rk0YQn0w4dtfK19s18MZyX/599ay7ipmoB
	 gfZ+CssO267HigdAStQgV1oVcimoR1AJxbUNpDzqIVCH76688ExLMEU4al+D2SOl2Ej3/
	 iiRa863mA4AFyzA8jlmPLNI+6zQ3tOKapuYtV/aAsFuSLepPHEDe/Pm2MfV26elR6Jnc+
	 SOS1Mir9FbioIy/+ioyoCtWQVbJpCm4Tgct0zDUswXvIbfLH5a4dZ5iq93DQoRBg6Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
	b=bV5nJ6oI9zBmsNUvCfTg3PgRnuiE8TP9qZS0b77PhrdnB5wqCMUHL+PiiYLL+m4gbHe0
	 fpZKWNxw6ugflHokcjUujLDum09H1xIexfkwWXzlMpTWPTuYYVyewp9LhuCMWchk0iPa/
	 11c8AjdbMdp2LgO44y31UdwgOcjSqQdDXMnXB9jSQ4PNBo5ZJtpyTnk24SSKO9Cg8kpSn
	 1M1jx+aH91Pla7pEqvLuI+Hzs88bVAVOynWFeoqE2CHBkAzNI7J1PL5vhGTJCN/HoB+JQ
	 Y2F21eM1lLqR8+V2qQs1Mm3c3mDBlI5bI2DSewXPUzEEkLV0WJZfZTebddM2s3ZEpkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7bbcdEA;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FD3606A327
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FD3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7bbcdEA
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f045b921caso46801355ad.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787155; x=1796391955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=D7bbcdEAeE+MD1H9f/KFWjA1H0YHRcfugdEdaeaMX53BmxslbpOMfjMmcwOCT/CP4D
         t+lnzPTOsvEXQ2Q7ISIaj+E5yfcHPKhPGQiry2RCrntqhZbmL/6Vle/D+EH2+yH6s5am
         wGPpbc9db1bpOsHn6av5rYEiLdkf13qUxzTcycRzoD7zQezgjozlhhVDHeYMLoR/9HhO
         5h7L68EZbURFnZy/JazppYXdbp6uuIxO94o3KD0Ro0TxOaPrIPO9MfZh0rI0m8/9nASS
         Zr5OH1OxEOKb8sJcJ3ln5EwXap/ryFpk/erP/s9fU3MQBUxfelY0/7KAnBiV0C3dCqff
         Oz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787155; x=1796391955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=dXNQxro81io0ZtRIq8ulM10m3RtaQ7G9Y4oSWQFglmimcJN6mqYKZwjv4UHtkv9G9b
         rrS11dX1d6skxpKqLjDTJ9YkIM4O6kXZDTvF6uEWhTxrzbjX3G65wAS+tIy7OaRWTwt2
         0T5aBiZ0yc0q4ON361glyOdqo7VkZdJQnX7x/HGDUw1DlsFWO9SZcFLx0xWqA8dyZdNc
         QL1qlkRJYGyGTO4vN3fW83t9pAkVQAjdmZblbxvshWzNJ5KhiRLNyraYvn2Qg7unBzLf
         Wx4FfZ0cvJ5XejlZZR9py4IFEYbdsWffpmRWz/z7HHE8vIq6trPXo507Wg2UTDI4uurN
         OclQ==
X-Forwarded-Encrypted: i=1; AL+hErETVy9Kq0pVmRyXgFCejyPho1iBAz/gG2P+9l1oayuywnbXY4yliTmERLnFfwiAaqO1Oa9rW6XDBeCo@vger.kernel.org
X-Gm-Message-State: APuU4Z9bC8DKZkM2kUCv2zJ5xBTtLLbIqmPPTYXDiEmXFtYsA3ZBXzPY
	a74Iubgxnm8bzakHzG/p+/L2rND84jlqbgGoLfwaLM2SH0XxoOBDXo1Z
X-Gm-Gg: AZFdTZfymr1wNKUieeZq7FTGnyEWKTrum6zXG7BZ1ioMc/QXVyxyPjp+4Va9BB3nrVK
	PTIonhZhZS+i8JuvGsbbfpsbhU5sjagmveom/1MaujqmjrOD86740Aft8Hpt95z4YU3eFcVvef4
	onAVG3ijfzhnA+hBN87IagfqF2VxydMAfZo0g6on8DXmOD755/4Opxb0iVt9FIUDh5irGZEhVQv
	f+X1VUQTDpYQXTMg8XcnuRJhWpPPeBsI+bouD2GMice3QjeASC08hux6J5g+eHii4Td/TrhqAQw
	Om62kSFnCNiImsg/H0dbD3Ph4kHuWNLFY6TaED251pnqJqyZObyvSFQ9pKtxsKy4gRl/AY7sshH
	sOiN8cdFGpH/iHHnXh9X51wvbfXoHjkk/+lFvUQDBDx+24Ihq2YY7qqFvowdzGSTRmmO6sWkeHU
	ftWLN+13O2E9iRwYodE6ov7E66nR1QcYMxCSYLMq33z6+fNIwdSh5diECXotfSe9YGHeKmGRA39
	gW2c4fFOX05UbrI/61MX9Rb1ohnBQWmmfXnjvDIOjFEag3vCSfaYgXSdII46T8vYNlOMwMG1+vR
	myHCOFkEQLPirc9wU2NOiSEWug8qxGtlWQfiXdUCdbQMDw==
X-Received: by 2002:a17:902:db08:b0:2ef:dff3:47e7 with SMTP id d9443c01a7336-2f03f170f5amr261112775ad.33.1795787155319;
        Fri, 27 Nov 2026 05:45:55 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:54 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Fri, 27 Nov 2026 20:45:04 +0700
Message-ID: <20261127134507.125513-5-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel

MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..f27c304843ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov12a10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV12A10 1/2.8-inch 12Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  OmniVision OV12A10 is a 1/2.8-inch 12-megapixel CMOS active-pixel digital
+  image sensor with a 4-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov12a10
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
+  powerdown-gpios:
+    description: Active-low power-down GPIO.
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
+              - const: 3
+              - const: 4
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
+        camera-sensor@10 {
+            compatible = "ovti,ov12a10";
+            reg = <0x10>;
+            clocks = <&camss_mclk0>;
+            reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+            powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vreg_cam_avdd>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

