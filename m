Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADD13B19BC
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158071; cv=none; b=kfq+NEKOk0xI9UDfdIzpvVRXKPADNrhp1SyRIWjZrNZf1oGcqIq10c7lA2765F3IMCjvJ3aHiHmIOmkcV634l0TtrelxPp0x4CtrrQRnvwe+wpwCkFIs8cuPD+Z4nQ+7YCC6O3en0RFVp1DJT/YTCUTVnbWKVEYFQFAVdVqXUCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158071; c=relaxed/simple;
	bh=VUBGPXzFgs7rcLq3/V9cERhFMeh3TZOT2bm1Ss+ziR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxyTk0cEirDXSJJxFsQxWWTPad8RhyolNgAind6OqwmLDvn6M76PUXER870bQdpG92y2VoERVsF55G7bWArJ6jTqEHybOY711J4i+RSH1IF9Xwib9lnbB7SMaSAGA1oof/idpOZcLkAEHGYiO8QwJdmKbjZwF6blhX3ODocyA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lw4Q1/O2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lw4Q1/O2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ad135063so7533215e9.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778158064; x=1778762864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1xzKmrAnk4+uOrTkiEWK4P8n1MUdQACoonvGkky13Q=;
        b=Lw4Q1/O2DUPOr59UbGBohnpCVTKEv+pORCPeeibLjPgyzbmBewCXQs7m0MnegFHrtX
         BAGQjkLARe+6PGDskMEw8v2PSJvE487+8uquDjXxFgMVmzn3iXXZRXqkptE21WBmkJQ2
         khwwuFCQDMJM4iIvn3vIui9bJ931uxzCXRwKMy7jd3kZiVl/pU5JMgU4aVsLSUrF8X61
         0T8PD2STEYWz85Ja503mv4zNYXqDTfRho4CTZqfrVlObHt/f5K5ltccAU1psnHSEBpFI
         83VI0gkzkhSzBhoze89LRiJpFKFNhGVy5cqkGxaxNR+tUbOvPyn3aumKdspyUpdTA+pZ
         72wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158064; x=1778762864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n1xzKmrAnk4+uOrTkiEWK4P8n1MUdQACoonvGkky13Q=;
        b=OoI9+RJYPQT681P7fy0/aNSi2kp8El3XP+feRJl/6w1FpG9xSug9SmEkURXWjA/OF9
         CicCmt9jZVfo4u7rQPTuDnVWLSlLF3+plOten2PXvBOAIaG33fT7884l9pbDkshz6lJD
         Uvden4dSrqFtj2UNg8PEuscoocaRhPxd+wos6rWkXmq72N77GPpMQNGcdD2KEzj185IG
         MDuECm8xMyLUJ7EGUcUnjZF705hQgs1bSYvuD0PrRa/8++ufu4sMU9r6rZzweokh1Vuo
         5cAgSngEzMmUczDwV7TBy1PiXK/2dj7J0ma3voXu5zqoksMsaBI2MfBUTNq0RIvGNaWW
         ia8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+VSw9RSY+Huhz7/YEtYSNzLQa1ejvZsoPxBvK5JoTs4fzCTqTo8Vw670TnRme8vfPC99+ilDOnqHfu@vger.kernel.org
X-Gm-Message-State: AOJu0YwnpOz4GoVE6qkRFMP0OTXsoGAxsOBjmlb77P2LAaNm20pNrX3/
	+WLPmLwNKlUPdDNcgas0Hy8GbmjmDIKvaqfZGzcr+FgTiPtsCsu52ard
X-Gm-Gg: AeBDieuhqIDqbiA8sumA4Ho5J7I7E5Cg8+pUuEgd5kAq4kA/I9yRl25Otqaft5P/mmC
	m+IYEEDOrZ3SekcBIQJWw/Mi7vph8V77azvu/oXDF8eUlPDx31gNEJgPKZhWxFPK1snnbvfVS6u
	JBVBQ2PnV9JTsIaAwpH+rmYR7qTMG1x7/T2erqvq5lqaH+12NAFVjAn1OBCaP47wShi1576RZWt
	TqMvmbwxBU1iFP9BMF783Yt1trQgl99WFU5UxiA1jpkb25Dat7S7tRTzmli48sojFsNs/ARUSGq
	rOE3k5YpqmOPN90qJs1xm/KCEtJ7t1yBZt5jzymdZCkXV56VmHUUfPQjLSRelYsOhSNBY8FGOmb
	L9rrP7lHLOam7F1D9YI55Rtp9a+GuHTCz/JuUNiJIJcd8chyFdyzj6eEwc46BbMwqUPAVd2u/bF
	tJY9xlYjazIRHPEWxyCpxuMB0fwTAcMkiO9Qw3uLCrMns1IGBctLNs65cZE89zPcbkq64bVnc7y
	zwgbNSXBiv2jaN9O513fmH+xHeoFw==
X-Received: by 2002:a05:600c:5304:b0:48e:51f8:eb38 with SMTP id 5b1f17b1804b1-48e51f8eb70mr131729415e9.27.1778158064315;
        Thu, 07 May 2026 05:47:44 -0700 (PDT)
Received: from ai-node.taila4f726.ts.net (89-139-15-25.bb.netvision.net.il. [89.139.15.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538b6e9bsm209228145e9.10.2026.05.07.05.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 05:47:44 -0700 (PDT)
From: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Kulikov <vlad.kulikov.c@gmail.com>
Subject: [PATCH 1/3] dt-bindings: iio: magnetometer: add MEMSIC MMC5983MA
Date: Thu,  7 May 2026 12:47:22 +0000
Message-ID: <20260507124724.813043-2-vlad.kulikov.c@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507124724.813043-1-vlad.kulikov.c@gmail.com>
References: <20260507124724.813043-1-vlad.kulikov.c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the MEMSIC MMC5983MA
3-axis magnetometer connected via I2C.

Signed-off-by: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
---
 .../iio/magnetometer/memsic,mmc5983.yaml      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml
new file mode 100644
index 000000000000..bbe2aa597f75
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml
@@ -0,0 +1,38 @@
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
+  vdd-supply:
+    description: Regulator that provides power to the sensor
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        magnetometer@30 {
+            compatible = "memsic,mmc5983";
+            reg = <0x30>;
+            vdd-supply = <&vdd_3v3_reg>;
+        };
+    };
-- 
2.43.0

