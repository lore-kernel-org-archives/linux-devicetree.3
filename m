Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EB43CC7CD
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022310; cv=none; b=rVeC6a2xnscga95rFKmurEyFXGcUWbu0B6TAtzZJLdzexUUVcixjhvFE3kk70hPmh5GCgDy3EpM8B4s6MsvNvSqDG6Mk8tiMp+r71LNnJxH45oJYW1zBlfDY64hU6Oqzurf2OTL78s7z93/ND30MnnAPYLR+Db0j6O3PaXAcGhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022310; c=relaxed/simple;
	bh=i5nr9zlL7n42aeFEwV94X9Ky6UzQbINjUj5sTjC4cII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHuEylDEKeXltG9OFQPitScWgHjj1t5P7+LYPutEn0vPox+JgVV1MKBn3Rmag6FqAn1GBxjVcIA9hYSRDK/KanjJ4yU/Uj8rPsjtQHcwa+cRAZjz+G97958n6nsunImzlvrTLHf4ChK78wsMKL3NWAdmTyPfPWHTvU/1jx5+1JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hec/4zfi; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hec/4zfi"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8588583a7c3so71516797b3.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022307; x=1789627107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa7WS57WkiG8wdPJazdCMEUZZmALuhoGF9iK21huDkw=;
        b=Hec/4zfi6cl9bABDzFxv8hVQUZvTXKzc3rnVt23NBUG8TVs8O4Guy0gxzTBerBYqkO
         L1WLKe3zO6kGfsOU5KzpgTUVmc7dSE9nAR/Wpj0YKTxtK3nq102iBrpQ69Cke6D1PozK
         R3Evu3J0uRMor/XDR23JBabt6rNSmNB9Ciy2FE8tE5NIKJpz5I2FZ6fLDPhmm7JGbmqD
         7kcKbEHL6IwQ9wTMqidpIfDoiV4Rx0LFDZPA3zM4wAkgrZCElmdVl2q8wRLwUm6DWmwy
         oJ9yGdDDrj2fhaCU4VRih7E/QC+yRwrTidqF/BcST4SRGldnFMhoWnV3EKVWbltjxzJb
         ud9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022307; x=1789627107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa7WS57WkiG8wdPJazdCMEUZZmALuhoGF9iK21huDkw=;
        b=LpwdEaCPDt/iJOKD4QpSTo+z+/JlBye+Pa0hDATFuPgAWAn8jsbQegyPqhsemiZ4bm
         URdKRIm5E33aMgHb05SxIHEi5xNXoq9BXTaoFi3KOiVXchSQ+b87UQhRnSwpRVxwok0V
         TWBLwtUrR0NpWTTG/J3HS2msMXqxY96nn/Pt4h7AozGZU/EWJJe71LwE2TtbZcbmbItP
         Tg3aFucktuak348TDuuGtvSgm6l6IOIAtDVCKoElErM53JT5H0My4y518ET7dKNXXRCl
         dTYZwk6Pf13rlcKWAJN2Zgrl1CkTnQ0b/ZkLWdvezMWQ4qlMRISdhgxmdLEWtECjOA+Y
         BBfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxznx6uWjgw/buJfxYelYklRr2HT/qAxC2W+82A/OdCLRzukY7HctLFCB6/TH/y4fftQFKrw0VxDpT/@vger.kernel.org
X-Gm-Message-State: AFuF++nIAFbrGNzcKO6XVLZNodQdQPbVCNzjgJ98lZvtzjRpsgqOypC+
	sG7argu1TqY5tW07a6dgYK0kYJ74rxc5gxCdZZ5+T4zZrzic8fgaiTdH
X-Gm-Gg: AYBFou11ej/1E5wOvaCs3a6kQc0E4S5N72Zi92bJXYBBVxmv0JU5cNWxXcfO150luUH
	IdMtT9g14NlHiof7ADbvt7lH5U7ao+wy5Q7zJqsw0R6jhoi8/RzcbM3poBb5pD/RBncFcf8hsW4
	0QttVnBNCGJ5xT8Iy3vuDhSEuB0YUOHQQDXytwl+F3U0vQb82ZqOKvip3EM/yZh1gqD/PDK2cP4
	1byLk7FbjK8M9fFY+VY928pRDQq6vDkAMSV14u5iEWa+UzBGZxHBngq7ArT6wOQOWCpg5qYFrem
	/dNow90p6LNFltaDZGDkYkaUmKCn6Kj3aM9AOG32BWmjXSf9YLQQTVHzws9cRknoQpGvBd9evYb
	+Pqeb7iKYxjxGqb5MVhErP3sHnCZ41NNx4gvX6bZVQAgz9gX7YWKcffyR4qexYVRQfE2XNyWevP
	OtH/gnJNCS3qo1is4mzkUrZTUjvs2nJRbaxY46tj07xWjapfIAgqccHT1BD094bV+9
X-Received: by 2002:a05:690c:7685:b0:873:5bb2:6c09 with SMTP id 00721157ae682-8735bb26f9cmr92220467b3.51.1789022306735;
        Wed, 09 Sep 2026 23:38:26 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::1e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714af5581bsm119455507b3.36.2026.09.09.23.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:38:24 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: light: add as7343
Date: Wed,  9 Sep 2026 23:38:12 -0700
Message-ID: <20260910063813.56419-2-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910063813.56419-1-marcus.yu.56@gmail.com>
References: <20260910063813.56419-1-marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for AMS AS7343 which is a 14-channel multi-spectral sensor
with i2c address of 0x39.

Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
Changes in v3:
 - Add missing include for gpio.
 - Expand GPIO descrption to include hardware synchronization.
 - Use led-max-microamp instead of led-current-microamp for the LDR pin.

Changes in v2:
 - Add the LDR, the interrupt pin, and the GPIO pin to the bindings.
 - Fix node name and unit address mismatch.
 - Include MAINTAINERS changes.

 .../bindings/iio/light/ams,as7343.yaml        | 72 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
new file mode 100644
index 000000000000..6b8a05be0043
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/ams,as7343.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMS AS7343 14-Channel Multi-Spectral Sensor
+
+maintainers:
+  - Chang Yu <marcus.yu.56@gmail.com>
+
+description: |
+  The AMS AS7343 is a 14-channel multi-spectral sensor with i2c address of 0x39.
+  https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
+
+properties:
+  compatible:
+    enum:
+      - ams,as7343
+
+  reg:
+    description:
+      I2C address of the device (0x39).
+    maxItems: 1
+
+  interrupts:
+    description:
+      Open drain output active low interrupt pin.
+    maxItems: 1
+
+  vdd-supply: true
+
+  ams,led-max-microamp:
+    description:
+      The driver current for the external LED connected to the LDR pin.
+    minimum: 4000
+    maximum: 258000
+    multipleOf: 2000
+    default: 12000
+
+  sync-gpios:
+    description: |
+      Optional GPIO pin that can be used either as a synchronization input to
+      start/stop measurement or as an external start/stop signal for
+      synchronizing with the connected LED.
+    maxItems: 1
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        multispectral-sensor@39 {
+            compatible = "ams,as7343";
+            reg = <0x39>;
+            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&vdd_regulator>;
+            ams,led-max-microamp = <14000>;
+            sync-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 04fa5322d9f7..8cf4e1635053 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1430,6 +1430,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
 F:	drivers/iio/light/as73211.c
 
+AMS AS7343 DRIVER
+M:	Chang Yu <marcus.yu.56@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
+
 AMT (Automatic Multicast Tunneling)
 M:	Taehee Yoo <ap420073@gmail.com>
 L:	netdev@vger.kernel.org
-- 
2.55.0

