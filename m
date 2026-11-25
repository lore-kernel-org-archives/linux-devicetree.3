Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638158;
	b=yKMHC9YW64FlYMrlxcl+zKbzr7TiPo7BZhzX7937qwJDPTJH9NARy41mqJNP6myzJzH3
	 KeYdZ8o4sOZ+sFZBQiTcxBX2GUx5ojf0HhNHSH2hc/R9F9q82QzSc3QMBEn48LiiHJf5W
	 gOcbZHZTXSuqiZDBt5PgYFElWLujSj7GXOPwOpDcjfst5czZPNYfjzMNkWpVe3x66PC84
	 /jYjTfK2oN/jtIgOGUp/7QRuQ2lLBF3gSpT7PIq16Nlhhplrk+jd04fe97dtq+LQ6mhiZ
	 JEI1wfIQHCB7RT747VzZ7TMTtgxCuMyez01IyVqLNSxXvY1nzLxuEIo5pC6HJPH1+Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638158;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=0KrHNk+oD9Hb9TFBnf9d2wavExw3z/x/bPGkwY/46cQ=;
	b=PHTHACpFbhPgtDTBzQQTF5xTFYhQLc2W2hp5eI3mSMZCvKhSWy3S05DLBpHO9KlIYlTW
	 LDn5wXevq41VbaLqeEGuZyjOkb9gGGFfH2lQ5txYnRWjbpox9HPEgd92yagFxv3jBYNWf
	 K9+eGNMtAmsXDcNtHZXD2R2n2JGg0Thiy4CSvwrq8rWBUC7f6mq/8AxBMbvvaPoAfnogZ
	 +RwpGV1cyyT2BNZ1K5aHMBufwNxVVWenzYLx9wTZiGiJ5HIxozb+srZh+tVyue0osm9D4
	 i/vksVGawcz/CY5mZCyTjYxhEuamA+6WhsLtSm7sASN/FM/x+3JBaQvOiObpkseKKfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131BD606A335
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 131BD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4efdc8c20so38328577b3.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638157; x=1796242957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KrHNk+oD9Hb9TFBnf9d2wavExw3z/x/bPGkwY/46cQ=;
        b=0UohxmF2rQozL+rsTnbiPyFT68babW4PJpJ/nekt57Gg1VsoyMgrgHQcxsoJNKZF8s
         qVmrfArPCg2lAlYx2PDoZmYBzCbGVExc+12YyhWG2WAhHxg92NvkuzasNgzTf1y0YoBW
         VfRntBUD6yXEl/qoWTCsaZaUSSkdKIHRhjWyXiN2wxVcSmFL4d7n31wX4RJqXUJPmtUf
         daLWr4BOgPqS/1RCYb8bOv5TCt0TxJKl6SfkXYSJwBOXSrnv/aQUTKvFkbLFlUDrJ3O7
         4bNjgmJVhIPQ36D/xSTlYkE4eM76ksf6ELpqby1uqQiJx0fKn9zWdPFOpLQLmmrs46fL
         vI+A==
X-Forwarded-Encrypted: i=1; AL+hErHjIOLV1yBXXx2d+cLUn9wgnMl87caI9lUUP3TcVB4VPueT33uS4SP0L1mj3NUieaN/40sGn0vpnmhT@vger.kernel.org
X-Gm-Message-State: APuU4Z+e1B5DkG2s2oHjHQvecME6BBBW+/OnkUKro+u7sXhN7WSeDlU2
	aca/hom1Ft2jmWtXSnVfvQtsBrh1aE/fg+MIKTrWd4Efrt32MoM8VYXH
X-Gm-Gg: AZFdTZdhWAz7IlJmxo1eVpodePeepdqaqdl2AZLDEbOJr3jRPHCjyoSjILSO/ShFn8j
	MWQCxev4+JtQJsCKVI7cXgIDgu7VVl5l8t4CKdegGZ4VS9p56XV3ornmNzfZl9d1wGMXx0LNYys
	/7b0WnT//gq5vIBsgLsWjxCc5SKqaoQVL9OuC7pA2g5vOWWlUA9HdlfoeT5UE8UjY3606bdSOYt
	g4qJm49hVMRh0YaciffORpm8W8Db9Zqit5yOYoay1OrIV/q7GvZ3t+1zuf6wGf3/7DSJdyIG5y6
	A2flNASE9Ktfllzgcc4lbeZmm9oz+dut4ugcV1VvosBjUkus83MXTZJmAG1Ijkk/yPtMA5kOqxE
	tQmAwaR5/xRMIlJvcE/vcbU7hcMBTafr7CVkfUxiU4cPpOcSrVgXXg3dPRqRiBFgKQpVJ1M4tr3
	/6UZpTPA7cVKUlaugcGX1BqddQU8w2dAGUeUcxSOib5MbfDvzOmMxdewGPfanAPRSo7YPLvAz4Z
	0H+BnM0qEybTcrZOA8L+M43lzLHgT5Ww+08vwewqgyQuOQrEqjE8HC8st0Ho7rQ71o0Bduy6gx1
	Hqp40lT1zLAeTsGqWoDeELbG2EcsiVt7Z+HL2GdMHOkYQ15HJRWK303jhY3stI5rjskYEjvpRZd
	0QsZIe8iJuCHI1c5uBalNxx088x/afB8s/WLOEfHbBMA74BRN6VGtnPbcMh3qPrR3eAoXq6EMIV
	N4x4DkAPFwt75rXUFwLSFqGRduHBK0JTnFMiTWjG8xq/S2IQ==
X-Received: by 2002:a05:690c:905:b0:8b4:dfc2:bea3 with SMTP id 00721157ae682-8b5204e9094mr93671177b3.50.1795638157142;
        Wed, 25 Nov 2026 12:22:37 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:36 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:30 -0500
Subject: [PATCH v2 3/6] dt-bindings: iio: potentiometer: Add Analog Devices
 AD5246
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
Message-Id: <20261125-iio-ad5246-v2-3-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

The AD5246 is a 128-position digital rheostat on I2C, in 5, 10, 50 and
100 kOhm versions. The end-to-end resistance sets the scale the driver
reports and cannot be read from the device, so each version gets its own
compatible, named in kOhm as for the AD5272, with no fallback between
them. There is no fallback to the MCP4017 compatibles either: the
AD5246's step is 1/128 of the end-to-end value, not 1/127. It uses the
same protocol as the MCP4017/18/19 and the mcp4018 driver supports it,
so list the binding with that driver in MAINTAINERS.

It gets its own binding rather than a trivial-devices entry so that it
can describe its supply and be an IIO channel provider
(#io-channel-cells) for a consumer such as dpot-dac.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/iio/potentiometer/adi,ad5246-005.yaml | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246-005.yaml b/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246-005.yaml
new file mode 100644
index 000000000000..9215de612a08
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246-005.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/potentiometer/adi,ad5246-005.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD5246 digital rheostat
+
+maintainers:
+  - Joseph Telaak <joseph@telaak.dev>
+
+description: |
+  128-position digital rheostat with an I2C interface. The compatible
+  names the end-to-end resistance in kOhm.
+
+  Datasheet: https://www.analog.com/en/products/ad5246.html
+
+properties:
+  compatible:
+    enum:
+      - adi,ad5246-005
+      - adi,ad5246-010
+      - adi,ad5246-050
+      - adi,ad5246-100
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  "#io-channel-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        potentiometer@2e {
+            compatible = "adi,ad5246-010";
+            reg = <0x2e>;
+            vdd-supply = <&reg_3v3>;
+            #io-channel-cells = <0>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ef6033c5edf3..b680f922d9bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16691,6 +16691,7 @@ MCP4018 AND MCP4531 MICROCHIP DIGITAL POTENTIOMETER DRIVERS
 M:	Peter Rosin <peda@lysator.liu.se>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246-005.yaml
 F:	drivers/iio/potentiometer/mcp4018.c
 F:	drivers/iio/potentiometer/mcp4531.c
 

-- 
Git-155)

