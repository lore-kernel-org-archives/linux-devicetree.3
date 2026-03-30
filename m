Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA64284896
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900868; cv=none; b=Rm9o5h5TRtVuCqPSKq9E8PZoRk3QP+nlPSKr3qh77qj+rePFbxDnQ3oIfUeHZyzjgQL+H1RYefeXzUjJbnjy3TpEm7GzWTRyJJt19G98lyOUCoWdZ44BPV1zC+Jon4e1Ufb6cMsSLCE+anOoG2uuUUgOaXYqLvpf3TFCt0BDbak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900868; c=relaxed/simple;
	bh=mDLoFnMQGHrV8oAIHwyEtD5zBQKYR5P0vpUAevxmWYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRFYtm9kgpWqjUlhtW1Fg3gyBUDXO8hFmi1AiG2Xlgx6ENqwSufqBOsQwXqeFiikpb2Bksm4UoBJXf6OoJTIwDN4lmIIL7lXsXtUk03lKX7JcWHnZjuuGKFcEUI75fW1T6MYIQ4eXysfQJlC5ajV4z/rBC5Jw+T3EGxJzNKNaSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rz8vI7S9; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rz8vI7S9"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d91f82d819so4852801a34.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774900866; x=1775505666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYmk7Juh371mJLYlWmXpOsfmVRoJgbYF90ddSYIGfYY=;
        b=Rz8vI7S9/KCtPPvs2zzdQnMPnTScpcBdsYkCeOCFdZ3uVXm28D9ZjqLBJtJBWdBGa/
         g7KlNfXTOUMb5Uj0k6uJB71s0K96XdE8x5lSOJ+IE/efZCe9rXfzsJNH3KnyZyc89orD
         7/P1BCL1O2eKJMFZ5Yrj4J4AxcuPyTnC+DHEJpc3gVXj1n2dr2RiPsGaD0gTLFtFxoqx
         6fq0KCM8dLqATjOB8bdTLmxyn0R7o6Vy4jS+yk6nEbsTKpf57G/B6tFZUqliO0mVPRYX
         eh/UyBgNzxa//HawF9aRL/RYT0u1eS1DP8A5xfd/aCfrzgSSq3mzEjXHGMm9qdKvTGeE
         /OCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900866; x=1775505666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SYmk7Juh371mJLYlWmXpOsfmVRoJgbYF90ddSYIGfYY=;
        b=O5ZGVvl+59a2eepkxN9e41H0tvvfCW51O8Cb/uNikGxmE3vMnFOSQElhsOMP8Z2xZN
         aeugAy+GYGiFDC6BBUFz/IhkOSL9Ibt2vEZ2P8fRe7FKJnpudapwDllqjmRW3lnjZG0Z
         9PQahPG6H1wRUzUQWeLZ/AcB3fj5QET6DqPnJAt4mrbm9/MRqbBzpKWJ8L14OB0vUY/v
         vA4ral1DKXCNsefCStv8LXtjRxbnqVsHeGtOdD1Po6IemHCepGVTtiD/ZMMWdK8Qbcyn
         z1n3Sbhl+qX/9bHX+k8KGxcaLY/SrMOiSUhd5xsQXlFkYzllFfni4n2urnqxdf4nh3Vl
         9bdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYiIyGUn885hHzHl4n/gegB27dGBnqWtn7njLT8rIHmWBLNvyGytZG0KG+zJbbWkjJWTAjAtyCg3g9@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfSYIco1CL+oDA3GUCeLuG1A2bPHZ+4eBZkuuL3yp74Kifxzi
	8/pdJ2kmXfxTmCMriSBGJ2dH8Sw5ungnuxw+NYgalzUCPkTcsXZoTfBp
X-Gm-Gg: ATEYQzxilIWFes9WS/dbCVqA3eUfT3C1ROULquvjm2nZk1gC6ysPPGPYqRf2DD6Oe3g
	aDGiuMavYN4kcf+7sF3vrWGUYxI4qlEqjXHDB7uP+mKdtwbUd/eyzwWk5TxR8JfdNvJ1IldI762
	WAFJPRDljV4sHeYz3kURvtRqWrywh3w2tAYJD6b4H3k0VxCgKww3K20A1F9BMku4cgx1TXoXCYD
	L4gSBYTLz0nBBE5b7ZKVhP8eAFyi+0XY6QI9k3HtIiI7AdVw0/jUSrdBoHPwoUzDnEdidhEAM64
	BeyXwNsU8Y1A37evdvW9bqpSmVvjL9ZktrXsEs8oHOUoU+z1AyWBPNTD6D5UTFRoIGONwoGx0Lh
	nyy1BWaADrDEuTfUg5jslxfoxJHalp5btqkrhnsu7YFcuUmpHUUMZRdDq7z77HtmpBJx/RMzdby
	/m27X6gf5tK6ltrkmjsgrZ
X-Received: by 2002:a05:6830:6ad3:b0:7d7:ecf8:6b with SMTP id 46e09a7af769-7d9fad90512mr8299965a34.2.1774900866434;
        Mon, 30 Mar 2026 13:01:06 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336353sm6601068a34.2.2026.03.30.13.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:01:05 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 1/9] dt-bindings: iio: imu: icm42607: Add devicetree binding
Date: Mon, 30 Mar 2026 14:58:45 -0500
Message-ID: <20260330195853.392877-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330195853.392877-1-macroalpha82@gmail.com>
References: <20260330195853.392877-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add devicetree binding for the Invensense ICM42607 and Invensense
ICM42607P inertial measurement unit. This unit is a combined
accelerometer, gyroscope, and thermometer available via I2C or SPI.

This device is functionally very similar to the icm42600 series with a
very different register layout.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/iio/imu/invensense,icm42607.yaml | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/invensense,icm42607.yaml

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42607.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42607.yaml
new file mode 100644
index 000000000000..bbacdee5b906
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42607.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/imu/invensense,icm42607.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: InvenSense ICM-42607 Inertial Measurement Unit
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+description: |
+  6-axis MotionTracking device that combines a 3-axis gyroscope and a 3-axis
+  accelerometer.
+
+properties:
+  compatible:
+    enum:
+      - invensense,icm42607
+      - invensense,icm42607p
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - INT1
+        - INT2
+
+  drive-open-drain:
+    type: boolean
+
+  mount-matrix: true
+
+  spi-cpha: true
+  spi-cpol: true
+
+  vdd-supply:
+    description: Regulator that provides power to the sensor
+
+  vddio-supply:
+    description: Regulator that provides power to the bus
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        icm42607p@68 {
+            compatible = "invensense,icm42607p";
+            reg = <0x68>;
+            interrupt-parent = <&gpio2>;
+            interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-names = "INT1";
+            vdd-supply = <&vdd>;
+            vddio-supply = <&vddio>;
+        };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        icm42607p@0 {
+            compatible = "invensense,icm42607p";
+            reg = <0>;
+            spi-max-frequency = <24000000>;
+            spi-cpha;
+            spi-cpol;
+            interrupt-parent = <&gpio1>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-names = "INT1";
+            vdd-supply = <&vdd>;
+            vddio-supply = <&vddio>;
+        };
+    };
-- 
2.43.0

