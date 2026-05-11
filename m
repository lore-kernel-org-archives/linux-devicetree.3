Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623124C9561
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 19:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526712; cv=none; b=SXlPvrIeFOWZnYQYPRT7ik6BzcbuoW+IVo2JqpRr1ojZJg/FAytOJ9Gn6d1Xu44GDUs5y31+h8BP+Fc31SKpqkJBaEJtUwVW9xOM5qnadvUuF+WSzbUIYidvrqbLHoOsFuIQbSn1tV7ffzLyd7woabCPy3KTNJFLdW/1qruf71Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526712; c=relaxed/simple;
	bh=0gia/RMbzCkzlAa4V6/Iz/DeCuBc+phgrBlK70Ot/+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8rtmk1tmEi3FLzb/bEsKnmPb5gQtBj66GIAwGh/nutzC0ivZLcAVoQdHPy6VZajjBq7hPLJKO2W2y5cMK19dX1X3/JSYBESTH9MzsRv/6+CqI6Zt8NKfVUYjkUVl8qeJp4tvmsvMiB5GuTOWZ+NZ6WIZBfYGrQpNKB4F29K9tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ua2YFeMT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ua2YFeMT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so33120025e9.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778526709; x=1779131509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sGdjD/CZ83xlAQBQK80MN5eYGa/z/UivuVQPrkpVWk=;
        b=Ua2YFeMTNc7Jw4p7bM/jGoPx2ab7dvThx11DXea80hPyjWxOhwk3iLBYEFPS47WsPK
         N/YY/rl7syE5xYmGQtLSRITy6jXBZeNdbPft6do9SLvOj6JjDqpLkrqywwYTMdTKVVHx
         OPwAkZkwZUeRAWSkoWNIjge1+HIZOB4vzTDh5STj+xTWXgoL8cPVgZ9CnXr9uJKEVWyE
         UA/ZLIxcMS9fVyStEWa4uk1EUMUlZBUnK6CCYKtCRiiNz6Dv+yJ6iceni1eQauLd7Vmo
         FLAg+w8o/OmAyq9voVz54PrQJopZfXkaymS/sw9lDJgL0LITdXHETboflWeQHv5rlUV0
         akjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778526709; x=1779131509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2sGdjD/CZ83xlAQBQK80MN5eYGa/z/UivuVQPrkpVWk=;
        b=hgToVj4lBrlgQodaLHKY0RIKJ1qGOMyB3Ckb5eoTnKt2OumhQQ8Z7upDZKU+NhG/y9
         VqKZSd3cXxUwir5QTaK1dspuvfdXhxvGcvzuq9qT/2tqnnwowDKeZ7Rh1dZDqRJQHAj6
         hZR6CV3RIAtNBZTGTEXGh0qCTDKOnsliKg7fIgo47gyIsdkKDWmDLeE04hEF8zxurIJl
         xsipDNAJ0Jr53C4dnv3hAyXItzqHzHdpuhZ4d355XdWW+pyc1QP4yoSQuqhg7HBj1ZAK
         i0MHZt2Hr6JDEI/QABaBOK/NKWPcA4xLqd9YXnp/+XTCVOXriRkX5kKpMr4UXyw3nJpV
         Io4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/RxhkjefzIy9ajNiP+iz7MWiXfTW6cjy7gygKaClwdStdJ0K4WGaPJjmBa2s5qPhwpEUKGhNQw3bLu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5CKCp70PZ9FJX+yeef+DuShWkycItAlcKySRiYCqlcZLksW+D
	/tsrYYZWtwYCZmO1cP/WdPPFM5+O121dhrhuPDJ4yMzbHHwhaUNVALZS
X-Gm-Gg: Acq92OGc0Rex3CKfv6PTTK4+J2kNUaT/DnLhjZTlJprEoB5V+06MPcaUfRV7NhX/Zkc
	ucOwYs9oygn8D4mtzT3j3gn7yBo/30Oema4Nr+ifSHIXeaFX+TTL/rMD4Hc/tozFIYiT9dCQ4C/
	kCUbXdx73c0Qpa4XPlOF5vogCQPmn24xmBMz3lBV33ZPyEmP8G0ByNG4bE2lBnzr3dNFiTqH2Ac
	fzgBPHffmnL6cLOyf6arzY0iJlI+RpTbfT3uVBu8hpO/RISvqb9ERmtrXg9J3hqbi6sfOa/0+MU
	p1waiT/nXD5bSLV0iKXiAWPYpGV4HIKdvH3qNfdhSEy7gfSLTyywoff6Yhgc2ttHszqP3EyIo1d
	lAYaIrFkh+x+HxCmKIcGzsHBjfxiND42pQ1LaJHhkbfqdQhGOSM5tO/ff8/DDrMez2DFDa3ctVl
	FlXaw3xcJ1fACbkn3Ssq6Vi0liACpv4JotyFqHwd71hLvuqydxGrU9qazhQzodG6xgimhIFNdjD
	oh2/pUK
X-Received: by 2002:a05:600c:5813:b0:48e:6be6:168d with SMTP id 5b1f17b1804b1-48e8e1f63a7mr9087595e9.8.1778526708702;
        Mon, 11 May 2026 12:11:48 -0700 (PDT)
Received: from ai-node.taila4f726.ts.net (89-139-15-25.bb.netvision.net.il. [89.139.15.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a5b65sm28541785f8f.8.2026.05.11.12.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:11:48 -0700 (PDT)
From: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
To: jic23@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Kulikov <vlad.kulikov.c@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: magnetometer: add MEMSIC MMC5983MA
Date: Mon, 11 May 2026 19:11:34 +0000
Message-ID: <20260511191135.36691-2-vlad.kulikov.c@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511191135.36691-1-vlad.kulikov.c@gmail.com>
References: <20260511191135.36691-1-vlad.kulikov.c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Devicetree binding for the MEMSIC MMC5983MA 3-axis
magnetometer.

MMC5983MA is not register-compatible with the existing MEMSIC
magnetometer drivers. It has a different register map, 18-bit output
data format, and I2C/SPI transport support.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
---
 .../iio/magnetometer/memsic,mmc5983.yaml      | 63 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml
new file mode 100644
index 000000000000..4a4df6bb70fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/memsic,mmc5983.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MEMSIC MMC5983MA 3-axis magnetic sensor
+
+maintainers:
+  - Vladislav Kulikov <vlad.kulikov.c@gmail.com>
+
+properties:
+  compatible:
+    const: memsic,mmc5983
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides power to the sensor
+
+  vddio-supply:
+    description: Regulator that provides power to the digital interface and INT pin
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@30 {
+            compatible = "memsic,mmc5983";
+            reg = <0x30>;
+            vdd-supply = <&vdd_3v3_reg>;
+            vddio-supply = <&vdd_3v3_reg>;
+        };
+    };
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@0 {
+            compatible = "memsic,mmc5983";
+            reg = <0>;
+            spi-max-frequency = <10000000>;
+            vdd-supply = <&vdd_3v3_reg>;
+            vddio-supply = <&vdd_3v3_reg>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 882214b0e7db..952fbf3020a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17170,6 +17170,12 @@ F:	drivers/mtd/
 F:	include/linux/mtd/
 F:	include/uapi/mtd/
 
+MEMSIC MMC5983 MAGNETOMETER DRIVER
+M:	Vladislav Kulikov <vlad.kulikov.c@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml
+
 MEN A21 WATCHDOG DRIVER
 M:	Johannes Thumshirn <morbidrsa@gmail.com>
 L:	linux-watchdog@vger.kernel.org
-- 
2.43.0

