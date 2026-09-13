Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769F439CCED
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789296492; cv=none; b=ZCGPXVTpj27SgCZZM8pAnyxL8vSzJivab/sFcE+W0xCFvxOu0x92vZuYCSHnsxEyhdiiM2rN6d3MoLbpdKbx7qOO9UM93CdFBX6EibFm5Ugz+XBXbvQFHMrYIImotF5ZmkR0PoRj8wDghK8b2RJ4zLqgdJYVSQuOQtwQkluQDVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789296492; c=relaxed/simple;
	bh=F12YGNngU8++lSPfjWLoCmx2bsw4chooVhiqlq6aSkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Si2WcLBYJPFW4IG4epB3lil9PBL/hbPU7/h2KbVcvUos7XPV04E4vD3NkDkSB0lGg6+dWTSU/xy216FKnmXONh0m4BNzv2kej761WYq+iuQLOFNaxVK2hdNDzj+ttV2Il5zcY0gZMfgTo5j1z+ZK6SsbPGd9nSgr2HILKJxIV0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0P6u/Ej; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0P6u/Ej"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso2170527e87.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789296488; x=1789901288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdPThSAhbTSR0ZmBcNyrmtWAhkiVdoKg+0FqMkNRyls=;
        b=e0P6u/Ejge7erZ1VMh8TQhBxYVCGQECLbSgSdtderJ5O220QcWkJ3TVOxWeq33IbBX
         1DyGohuafSxWDXO88S80XrQXT5k1tEbKgIGQlp9dYzTMmZ3HROyPrIIajDiHy05EDK1O
         OAmRHZZph82DpbC5NA4Go1DhKg2gBnPq4lA8HxcdfSbzF/LJWz3WLpeGMYKySyCTaMUH
         m4Czd5sDAKL8w/1XOizcHZXfflGpwXRNvZNSW8fNfX1YHqBm4pQNP3L9jJvTopcb+DLL
         qToLBfhgqrXugDXidiILz5qtFWw5ydY32GLOfONbDos8qALSIwaO0ip2+xmOtMxPCOdh
         5Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789296488; x=1789901288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdPThSAhbTSR0ZmBcNyrmtWAhkiVdoKg+0FqMkNRyls=;
        b=DnLLqeov4q+WS63bBAwEpkAMHA1zJlsl6S+k1VLTE0OI6IQSM/Bt2iLNaBNhNF0Vzc
         n5SGZXTfM/qSa02ozWvplGUQ4H2Q5QTiJ2/DePeOR02t1C1pWJpU3vETzm8kXgOl6w/d
         5aTFkcTTw4VX7nB7+eYxTlbJ+AZWUwOnNf3o9DxW2dd9v/0rZg8VLsNP15Ma1FLIMu/d
         9oyRw4xGP9szc4gXFs9VdI76uqkT/tUR7VftCkCiNYKAEmynfZTBPN+u0B2Mxfl3Sb/z
         iMS7w2AgJMpJQp2DwDSECpm2rJ1Q40NNH5IqmoRag7E+MpYaoxKWtHZVBPmhlt7wZOmX
         G19A==
X-Forwarded-Encrypted: i=1; AKwUvBwEeCCerKbieCnJjDe3ud+O7qvYl2IY/z9+YpNxSjEQJtczMcEvwGrfVR2rSvnGoAPTVvpl32BSkUpf@vger.kernel.org
X-Gm-Message-State: AFuF++kz9e3xZivr74LCBFZQ5KVmr5QyV/HMxz+OOIzurfPsA9gaUU6e
	l52AcBpck4ZZvkIpkL3BxU2ktj6QNBTey1ijVB7NkrVcoEKzciHR8u/w
X-Gm-Gg: AYBFou0p16PtDOwXf/78qiw81VxymljJdUukrEXbjsz7eNSa+F+ERD0MUQpZ8niUnnF
	FEC1ZycOu+EIbXunxRQCVKDAOU7Ou46EZIgccI8tYKcebv4dIyu3QxW0ZOdUYmgnh1omjW/TI4M
	ENfOPLNYs8rY4es/BreEGd5rOggYoC0TcliazTETLmexTrAApV2IKMt3xyHgFZ/epfUvbYkltet
	JFiytN0se63WJ+ewRPPQHjA7M6dBX2FCcQPQFvHEZD6gw080BdoV94N41J6WC4Kpa/V9U1fRCLA
	VAg23sPkrAWdZrP1pGsk/TlGJsWifJNXfzWFkzO47qH41cGi3agB6XUbls/orJaOsQ8EDYL5Rld
	tzfdxEcDxz4tvjGl3o+x2B0551Hw6rSgFhKOBNUEbbOPOBqhJwnAr8n6OXdUNpFclhe98FmndJI
	nSWRYSrJL3KIQ46L714aqyfk9Zbj9vkSrGy6AUTtfZ5fivv87iO7RJHGM62JzVxPZWabmGepJ5k
	4z67db1j9JYWIeNP5blviyz38aJEEs2W1/OKK2WJtD03+1KHd5Zsk7UzcOfWKmte3Wm6UFPvF8K
	bBXl2s5JvcTpV8y316w=
X-Received: by 2002:a05:6512:130b:b0:5b4:c00d:23f3 with SMTP id 2adb3069b0e04-5b8a02de3aamr2372765e87.14.1789296488236;
        Sun, 13 Sep 2026 03:48:08 -0700 (PDT)
Received: from Shofiq.home (87-92-212-6.rev.dnainternet.fi. [87.92.212.6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04600a2sm1689154e87.36.2026.09.13.03.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 03:48:07 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: jic23@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@intel.com,
	u.kleine-koenig@baylibre.com,
	joshua.crofts1@gmail.com,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v11 1/2] dt-bindings: iio: health: add adi,max86150
Date: Sun, 13 Sep 2026 13:46:55 +0300
Message-ID: <20260913104658.230422-2-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913104658.230422-1-shofiqtest@gmail.com>
References: <20260913104658.230422-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Device Tree binding schema for the Analog Devices MAX86150
integrated biosensor, which combines two photoplethysmography (PPG)
channels (Red LED and IR LED) and one electrocardiogram (ECG) channel
in a single I2C device.

The device requires four independent supply rails per the datasheet
power tree: digital core (vdd), analog core (avdd), ECG reference
(vref), and LED anode (leds).

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 .../bindings/iio/health/adi,max86150.yaml     | 77 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/health/adi,max86150.yaml

diff --git a/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
new file mode 100644
index 000000000000..8392d08edd1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/health/adi,max86150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX86150 ECG and PPG Biosensor
+
+maintainers:
+  - Md Shofiqul Islam <shofiqtest@gmail.com>
+
+description: |
+  The MAX86150 is an integrated biosensor SoC that combines:
+    - Two PPG (photoplethysmography) channels: Red LED and IR LED,
+      for heart rate and blood-oxygen saturation (SpO2) measurement.
+    - One ECG (electrocardiogram) channel for biopotential recording.
+
+  The device communicates over I2C at up to 400 kHz.
+
+  Datasheet:
+    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX86150.pdf
+
+properties:
+  compatible:
+    const: adi,max86150
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Active-low interrupt line, asserted when the 32-entry hardware
+      FIFO reaches its configurable almost-full threshold, or when a
+      new PPG sample is ready.
+
+  vdd-supply:
+    description: Digital core power supply (1.8 V).
+
+  avdd-supply:
+    description: Analog core power supply (1.8 V).
+
+  vref-supply:
+    description: ECG reference voltage supply.
+
+  leds-supply:
+    description: LED anode supply, typically 3.3 V.
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - avdd-supply
+  - vref-supply
+  - leds-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        heart-rate@5e {
+            compatible = "adi,max86150";
+            reg = <0x5e>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&vdd_1v8>;
+            avdd-supply = <&vdd_1v8>;
+            vref-supply = <&vdd_1v8>;
+            leds-supply = <&vdd_3v3>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3115538ce829..189385966de8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15705,6 +15705,12 @@ S:	Orphan
 F:	Documentation/hwmon/max6650.rst
 F:	drivers/hwmon/max6650.c
 
+MAX86150 ECG AND PPG BIOSENSOR DRIVER
+M:	Md Shofiqul Islam <shofiqtest@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
+
 MAX9286 QUAD GMSL DESERIALIZER DRIVER
 M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
 M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
-- 
2.55.0

