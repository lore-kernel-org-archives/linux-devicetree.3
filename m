Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F5A403146
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184428; cv=none; b=E3dIRcc4PsMkZFHJgbfVgaMnVVowVaKz8QZiZsPy8cQQ4EZY795tdD3XMS2JH1yuRthFb+4IF5ijBfEkJQy8L54yfjsKp+EjpvG4lesEtcfY5ott/5KRSRRSnaxCSbtV/MPkVPmdgAK7npxHEpChhpN4F/Ejyx3XlNr8cbXAftM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184428; c=relaxed/simple;
	bh=R8VBiD+QXC251qgkXFGljnCBmfK+Jfx8IbBGreOEHZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKmr6cjytpp2q7uICjYOGhshkztsP7ijxkxiwFckKz+IbUYbjwRw8zdDZ2h0bJz92wxAIE4W6QLKzXvNDYrJ+56BBMoM/IwQ+HtUKjqMxTzUuXFUl/UPnj04Y8HlsQjboJz9P7XexhE7ce4ieAElWSXMbqSjktUqlOE+/gr2Z/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvzCOYsJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvzCOYsJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bef47b1ac01so1207366066b.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781184425; x=1781789225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6oEo+zVW0utqGa0HgsB8AO2WeB1C1W2F+2/mB2GeSE=;
        b=dvzCOYsJ5BcQnQ2ITm0wkP8sf1v6slWMwjxwCrYImZMKZq3N2VzXJVtWdwXkP0L27D
         kAUiu1xej6nFuorgG4cUrJi1rZ+MpmuaAZ4aHZknMnOkKyPFzTGS7uRnaeetMNhY0P4/
         nYI0HCtd6GBWpq9Ra347TINVPFgtW9a7tp5uPYD23T3B8MiQzjEoJlw+LmkSf0PJImNI
         s2CuSHydufl8thlfgFOVP6TVe6vpGZQMwXHQzXq9ABKn3pyxkMkjyjxZJTbXtqYxMgsn
         /5IPylPAvKlwgq7WLNVmjdM77095aBX1pcDdFAi2SY1z3iFnsh6BukjQ5liH1gYfcjPy
         2RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781184425; x=1781789225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T6oEo+zVW0utqGa0HgsB8AO2WeB1C1W2F+2/mB2GeSE=;
        b=FEhpNv2zKk3tgoNfzgDCmeRaj40vwhAw22+5oWDzjK068XrMMrn6+tppF9dYzUlspU
         eQTHtAfd63dY3LzGtzTmBImj9kyi7OvXc+PLKyNlhqBxRbQNhTJjNRo1+APSsAjmY+2C
         DiEhAeNB3+ND9sn3uNopvbDCY7maw0Sx/i8AGb28pwkOXWvqvmLJhZHswQZGoGRNj5m1
         jy0PiNGrOlyLiA71W7pndbeKN2ULpcy5bd3MY0sU7zKO+vVtuVuFh2BbwE/gX4Ko01E2
         wzv6oOv8oaNiojaox/4J9xxMXOM+HKeMfQmHKJyuMI0XSVg2b9p9hwTemX/+JNpL7V8Y
         9oYw==
X-Forwarded-Encrypted: i=1; AFNElJ97N8QoSeh5XLu3UG/TNulVssLr94Lij9a737nvM9wFLtEFJLNQqfW1MLSfY1vTqKHwgseDq2gqvk9I@vger.kernel.org
X-Gm-Message-State: AOJu0YzxupOOhix4iVqi0zNpsm3U+mDmfIpvRa5YtwsuaGjuXDQZLYBw
	fG8uAOUkt7mNQMX/sbmFeLUa3DTk8vuuNt+3bKu1VxVlUqVYK1+KyaAb
X-Gm-Gg: Acq92OFsmh5lAmxCwFRRg4ZO6JSTSH1DuSKOouJNJYO/AwbHtKfVs8TdARMZSby3NRZ
	TpToxaLhvlPB3aAiF6RR9DSBNhvYlJbPP9Cnqk73+ofe5dgfSjRaQFAKTJN92WSi6ee/6gY7OQl
	hvfR/d9TmLO4lv0tMQw+WPlCllp8IOAhyQpbeSL4cn9olPY6Mqo2Y9PsHKBVcuDFsfpdOUQDaal
	3dn0imVzbwlhKrJU7nNvfmqHL8mocWypJn/fdeyEePHQNnDewzKE6LtxyFflHTthi9zBPR1Btz5
	3MoSYawa8hRsJ6D5MMx4KVNtgenZMSJsT1SRLxo4SjToFZm2Fy1jI2VkrqvNJdLIQabakOFnoal
	GOImTwwYsEt1xpELrIFRB1TiKnRWHUZ/L5eIZrBFuBv7U/e/ZYhcIB5oijVTpkqPTLp5Ie07PGQ
	uLRsSPT7AwMdsfA1X+pv8oMv8tFoBmhCTX7wg8X14xOMXcN64SvbxDrf2rl7KsGWsozSNUQLsg9
	k2i
X-Received: by 2002:a17:906:c10c:b0:bde:a3cf:d268 with SMTP id a640c23a62f3a-bfc85c7f9acmr150749166b.13.1781184424344;
        Thu, 11 Jun 2026 06:27:04 -0700 (PDT)
Received: from fedora.clients.cmblu.de (p5df027fc.dip0.t-ipconnect.de. [93.240.39.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb1cf077asm65719566b.26.2026.06.11.06.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:27:03 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH v4 2/4] dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor
Date: Thu, 11 Jun 2026 15:26:58 +0200
Message-ID: <20260611132700.671322-3-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260611132700.671322-1-wafgo01@gmail.com>
References: <20260611132700.671322-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the bindings for the Sensirion SLF3S family of digital
liquid-flow sensors on I2C.  The family currently covers the
SLF3S-0600F, SLF3S-1300F and SLF3S-4000B variants.

All variants share the same register map and are fully detectable
from the product-information register at probe time, so
sensirion,slf3s-1300f serves as the fallback compatible for the
other variants.

The active calibration medium (water / IPA) is runtime-switchable
via the in_volumeflow_medium sysfs attribute and therefore not a
DT property.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 .../bindings/iio/flow/sensirion,slf3s.yaml    | 58 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml

diff --git a/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
new file mode 100644
index 000000000..c054a505b
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/flow/sensirion,slf3s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SLF3S liquid flow sensor
+
+maintainers:
+  - Wadim Mueller <wafgo01@gmail.com>
+
+description:
+  Family of digital liquid-flow sensors from Sensirion with I2C interface. All
+  family members share the same register map; sub-types differ only in the flow
+  scale factor and the calibrated measurement range. The sub-type can be
+  identified from the product-information register.
+
+properties:
+  compatible:
+    oneOf:
+      - const: sensirion,slf3s-1300f
+      - items:
+          - enum:
+              - sensirion,slf3s-0600f
+              - sensirion,slf3s-4000b
+          - const: sensirion,slf3s-1300f
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  interrupts:
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flow-sensor@8 {
+            compatible = "sensirion,slf3s-0600f", "sensirion,slf3s-1300f";
+            reg = <0x08>;
+            vdd-supply = <&reg_3v3>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <0 IRQ_TYPE_EDGE_RISING>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 06a8c7457..cdc18a601 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24187,6 +24187,13 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-iio-chemical-sgp40
 F:	drivers/iio/chemical/sgp40.c
 
+SENSIRION SLF3S LIQUID FLOW SENSOR DRIVER
+M:	Wadim Mueller <wafgo01@gmail.com>
+R:	Maxwell Doose <m32285159@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
+
 SENSIRION SPS30 AIR POLLUTION SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
 S:	Maintained
-- 
2.52.0

