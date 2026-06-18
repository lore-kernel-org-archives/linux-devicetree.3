Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8F33403EE
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798521; cv=none; b=OXJTZOPj3KiKwBL6OOi4IDUO1P/KP+NcJUj6n152R4IGyhF5EBkNadVnWg3nABibU3/kehOS2hV296z0Fz/Yk1zXg2tSyCm9PLIBDG4Wc4vAMYpw8f2WG/VPLq2fX+CZgSAFKmYc3saH79Y9vZOAXRGSC+crwiJcQgGVglBjChE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798521; c=relaxed/simple;
	bh=hh25ZcMawAMaZgtcoqBh/Oh0rfApbALMpsiRJY/c4+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cKzlCXquivJPh1GqEsRmIJULxcTEehlP12xxqvrTVq8p9D4vUICpxDsrXFiXsNSEyzZWqSv2YG6AXEMPJSzg0gPQ0wm4qdaqNB/l4vRZVTlmEMXe18eJDQfmgfasqeV/lin5RfI/JYgNx00lXq+JLIvDyJ5Jw355bWYBhFLoPOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYUa2gS5; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYUa2gS5"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so513213a91.2
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781798520; x=1782403320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjlV8ezwd9YEOGNjCjdtiP5gyg2Bzh5OdyGQbImHytM=;
        b=MYUa2gS567cG53I6u5bKvfqLKgyLJHDfgAru/utOF485Alo8rAGIBdOeSQMOk/NxLS
         n1I5rLDJBAi2Hyxqk6jofBw+iGh6MzA/ZVYgHben/xAQR1oi657GS9taeLznUbA9ZB43
         NxzKddyRLs3cH5NoJNz6wurAVToNZfH6aKeGmcpxGWR/Z6Jo6W4DxyEJK6OuCXew2TD3
         67ItkMlzePuvfSFOYj0ZY7EadmSyUjmztvJhWyX10A96xEXL7WrU2iC7odG4smk+h5/4
         pwwG8XH/HR99/+6bf4pz9GTj3iEGanN+TWOVOteEWW1FbWu5zxW+F7W65j4GceEu+ZZH
         awUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798520; x=1782403320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vjlV8ezwd9YEOGNjCjdtiP5gyg2Bzh5OdyGQbImHytM=;
        b=HKdu+/kVtOaHvjE3eKA/oV292ivl55mSX6AYLqvocjzDpMpfNo2kKbchl65wcHBjGo
         U3Av39joTaDU80LtFyz4Tg5BAJxuuqeQk/LKxe9ndnn5NautHkmRT3y6vubXY0SwgXsb
         Nk2VywmNqo7J9T8/bqwVK4GswK79ec7t+a/9LPAc283FCaylPZUucVt2ynaTwkrYUzKe
         H0SXj0j6/Zz2Y4fvYpaeQre72qTT7PGQgMvw1ru5j/Y+pMBOKRUMCjq1JmRS9cD6ef1l
         FOJbEXdb0CQ+DwvOGA2Z+mXSeIA34i0UQvdvX/zDi8atlYuPvPUatqnt7/mcvzhzdZzh
         mkHg==
X-Forwarded-Encrypted: i=1; AFNElJ/avyaZ5o30XeSbcNa6mdMMwW4jySjCFG+dDJLUypaAi+qj3HZqjEI74VQyM9HnAPTP2qbd4LwuWVy/@vger.kernel.org
X-Gm-Message-State: AOJu0YyoNm1kd0GiaRGK9c/5bzPvqjKbngOX/xEspLf93ZKOYBCIX8k+
	c0wk4uvreh4xpsbqUgqN4KH2jOL7JnmmZYV0Njlh9kgpdbtMYZ1vGKE=
X-Gm-Gg: AfdE7cl8xKdnEb0543SCrM8mOgObAlEUbzbkCxjtkl/fsglrLsz72WXTMEvno8HgixU
	AZotiHnFVKRfSutZIcgCLuyiOjBOfcxRoXWjhqvZK7NfCub0J24+K5IEvJIh5EQFExyz6shPegY
	78EeYrkqoQ1vmBEuh5pQYanMGwVE1gWK2eReG9CDPm4Ar/tZ2AUqf0S4/tfZEeQrnEzYVodtvYK
	TbYJOqQDkWLb3Zt33ZNuIWfEbVAarfBg31iNZHN8EaoghlEKVEFz6pC9WFwxs7++lYNmyZrxgPa
	tyXNq/VdLAPH6O97sxuK1N7RM1JYZykG0GWr/a/5VkpiF8/D3ABtTZpW3ilcnFju/3pTlU46pw+
	upSHtEq5gfPbWvEL/BKRsi+cuYyfPKzGp9nNKULhKPcWQeisWjDvjdmAZSy4zaxYh0ivFDN8HEf
	jdHvDUzSnC3ci2ZYZXazKoSeV6qJ9r5dRxUXtyJqt3oZxXke8UeTt9
X-Received: by 2002:a17:90b:274d:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-37d15e8b6bcmr6649a91.19.1781798519763;
        Thu, 18 Jun 2026 09:01:59 -0700 (PDT)
Received: from localhost.localdomain ([101.0.62.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15361af5sm53807a91.4.2026.06.18.09.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:01:58 -0700 (PDT)
From: Nikhil Gautam <nikhilgtr@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil Gautam <nikhilgtr@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: iio: magnetometer: add Melexis MLX90393
Date: Thu, 18 Jun 2026 21:31:40 +0530
Message-Id: <20260618160141.11409-2-nikhilgtr@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260618160141.11409-1-nikhilgtr@gmail.com>
References: <20260618160141.11409-1-nikhilgtr@gmail.com>
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
 .../iio/magnetometer/melexis,mlx90393.yaml    | 55 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml b/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
new file mode 100644
index 000000000000..79e7e4a124b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
@@ -0,0 +1,55 @@
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
+  vdd-supply: true
+  vddio-supply: true
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
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa16..e9ddcd12feb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24926,6 +24926,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/magnetometer/ti,tmag5273.yaml
 F:	drivers/iio/magnetometer/tmag5273.c
 
+MELEXIS MLX90393 MAGNETOMETER DRIVER
+M:	Nikhil Gautam <nikhilgtr@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
+
 TI TRF7970A NFC DRIVER
 M:	Mark Greer <mgreer@animalcreek.com>
 L:	linux-wireless@vger.kernel.org
-- 
2.39.5

