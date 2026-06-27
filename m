Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93AC9460
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554137; cv=none; b=to1aXv2WDR//CsJlOt/1u8lDQ0oRdzMZm4Yg+/g/Y3447WJJhWRnHRfQzVVmDBKSrAGgIWC5+ZuaknaMECQhjYo3r27Ub8wh4LXLg/mfxxj5ZEil28tbLsBD2YFHYWV27MBGrDAyCp41cEnJP+2pgHRN1jFCba3rvTJthfJJnwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554137; c=relaxed/simple;
	bh=jlgT/MtCdgpOB9fnTVDheobw7Szom3eMO6EOHqMHlYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hFiSjf6mDmVgZcxRGwl2vuOLT/3d6xI+/8DMA1wFtrY4GoKfc+RRNxpBsTvFaxzg+A4TKr9JuOAa/dYBBGgoWF+G4tP4KP6rl1vPJ0F484+tXgTlphpYC1mAnUs5Gvmln2vGsxV72+LB/EzI89tW0WhJQ4y1djexygFunXrl99s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgqsmZZz; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgqsmZZz"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-13986d61b4eso4499479c88.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782554135; x=1783158935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iqu3QtC3YcpovTQzC1UYwE9fiAF/VlH+zBm0B1Wqv6o=;
        b=dgqsmZZzdxkLcrOiYgGp2nIHRGBsZByMzce2vvIUaRNciFtJuomrfYMRjnemYmN/J7
         CCy+xonv4yUkftAezMAuNI3c9kT5c9Tf92fHX4H3NQWnGXdzRmf7Ew03huWLZ8AoFVUr
         +x2CpAmM1UTEPRQO1VQZzDqiqim0HOlDEC1UOuuOsmK1NvnbttSBAQ/pcy++9BJcwvye
         3jxdZgV2kTmXa2qiOCpRlTPy3grvHzvyhxY2ojJqhwTZFvhFzs2wa8ky9d5p+b+Yd5Hh
         5VbGl8M8V79IMcfrBS+mp2PO8WSdrE7MyOK99nQ7dcPDeHJCy5wbMGhAcZrdY+2lJo8+
         mORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554135; x=1783158935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iqu3QtC3YcpovTQzC1UYwE9fiAF/VlH+zBm0B1Wqv6o=;
        b=YuZBzuiKFXtbNu8MHUszxzqVwZlQhOgByRERcXQElnH4Qi4t4aSdCiOzqQ7bU4pQc/
         3XZMLejgdT0Q53j8LMWHfKyYISEgwiH2y8wyfUQZt2gHZpiIS3HLFPLaqM5ltI2Istuw
         rZolmXyo7uA3vuhnxVGElAIBC7Ww5OsImmHT2V2WJhrF+jeRXBd36XYV7l5xtP2qK/o/
         7Ied4bRBhh6mgH5L5MkLDFuPRaEF/zn2hZ3JyDNaTUy9OOpLgPVFg5OpRY5EIRTTw23U
         4i5aJ2gE+Tn/SPPSuxKj/Pn+B6LRTxfN58b3R/3adpgfHtziDORv2VlhiLGXGO3SeJr5
         dFbw==
X-Forwarded-Encrypted: i=1; AFNElJ9PbVdAYGJ40fXSZJr6YuXwKDnp4+Oz+lJEUcRYo+EUXVG8tH8mOHeNMw9139CfiLmXo7nc7aLVBPOM@vger.kernel.org
X-Gm-Message-State: AOJu0YwZqB5T6uruAy7/zK54jEiAd/xc/TpAT7OZdnNW62/9itAlJ6Jp
	yLR8GsgW8tAepMOPSg8VwvFILAPhwzaCWYXj5i9+eM+nr3XRxX+1OAs=
X-Gm-Gg: AfdE7ck43YLXy5P3Y5q6EJL8tm1vxERORBkbA5stJ1DnjhnrivqzLyUN+QZCuH39lr4
	Ndv6vhFiMWrODP1VGKL7AkI3lhS5c9C7ud64e+fwKgE2We/M/0K12fedch8Co/uHqfowayKbP0z
	t+YWCC8t52+pgNA3gsD0UUWnGyKYkOOhKIbmtiRXzdgT1O+739Khjsli03RD4zpECMxpA/fAkmk
	V1H02sLC6BhlI0OjSLq/q6GBAlwpYIVU3BpBICjzGi92H0C8QPvLu7vFWELGyuZp+dv4KIT5X0R
	BRbsSPoUigmepwS8oK1/KgD67Po/NOOK1z95vU7ftucRItNqlxXBnB56Yb0UMO3TUSPfpxKEuCd
	1k9lezZvq0YRFNkl7kTJcf9IGKRR0DfAWJ2iP3jxYEyJHODBuFv/aJnrP45PE3KZ54vMNGmLuAX
	kHrTTQHDHawKAE8p3fGk0DKn58j1Hc63g52WjcTxOIU/S2XekrS/2+
X-Received: by 2002:a05:7022:41a6:b0:128:d4be:7438 with SMTP id a92af1059eb24-139eb3f6ec2mr2858883c88.30.1782554134995;
        Sat, 27 Jun 2026 02:55:34 -0700 (PDT)
Received: from localhost.localdomain ([101.0.62.116])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139e4c33af7sm12886141c88.5.2026.06.27.02.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 02:55:33 -0700 (PDT)
From: Nikhil Gautam <nikhilgtr@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	u.kleine-koenig@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil Gautam <nikhilgtr@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: iio: magnetometer: add Melexis MLX90393
Date: Sat, 27 Jun 2026 15:25:18 +0530
Message-Id: <20260627095519.8377-2-nikhilgtr@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260627095519.8377-1-nikhilgtr@gmail.com>
References: <20260627095519.8377-1-nikhilgtr@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for the Melexis MLX90393
3-axis magnetometer and temperature sensor.

The device supports magnetic field and temperature
measurements over I2C and SPI interfaces.

This initial binding documents the I2C interface.

Signed-off-by: Nikhil Gautam <nikhilgtr@gmail.com>
---
 .../iio/magnetometer/melexis,mlx90393.yaml    | 63 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml b/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
new file mode 100644
index 000000000000..91e984827786
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/melexis,mlx90393.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Melexis MLX90393 magnetometer sensor
+
+maintainers:
+  - Nikhil Gautam <nikhilgtr@gmail.com>
+
+description:
+  Melexis MLX90393 3-axis magnetometer and temperature sensor.
+
+properties:
+  compatible:
+    const: melexis,mlx90393
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides power to the sensor
+
+  vddio-supply:
+    description: Regulator that provides power to the bus
+
+  interrupts:
+    maxItems: 1
+
+  trigger-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@c {
+            compatible = "melexis,mlx90393";
+            reg = <0x0c>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <17 IRQ_TYPE_EDGE_RISING>;
+
+            trigger-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
+
+            vdd-supply = <&vdd>;
+            vddio-supply = <&vddio>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa16..469ae3f9aa0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15501,6 +15501,12 @@ F:	Documentation/scsi/megaraid.rst
 F:	drivers/scsi/megaraid.*
 F:	drivers/scsi/megaraid/
 
+MELEXIS MLX90393 MAGNETOMETER DRIVER
+M:	Nikhil Gautam <nikhilgtr@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
+
 MELEXIS MLX90614 DRIVER
 M:	Crt Mori <cmo@melexis.com>
 L:	linux-iio@vger.kernel.org
-- 
2.39.5

