Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260157;
	b=eYR+Yu+9dZfcUOzcMFF9ofE0C32FRrGlji/4EtSUgXb2dyr7F+exJNRNvnEqH2ce7jyE
	 piLAAMzo2j52R8C+WQ8QWXdpQuWqjXW7Aozm/tOfn5LYnmlz8LfvyQQblihbTbQgqJrdw
	 hiH+X19pyrZK4oRETeD9w56s2tEnPM58rqiNSDce14qvXhNpM0CquyR21LN2ZVTwFbwLh
	 DUaYFfXOnmUGqq0/q3/zfKD5S5oJRs3B3DotC86RlYqRPZ+sGmVQHSUXGxDkIWp9KbrAZ
	 6mxt3v1N3TKk/Qg8iafPUmw7LY+lE5ciA7olASGE6HDCjHduCfE4rnMNqX0SpiUj8tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7IN2ZZeCgcwCvS2txh5dZSlnQHrz7HH/k4+ry9PPBlM=;
	b=vYARIHUA4IKQ4a0l5eBuoCq4YfHbGdEd2stAj879lzW45WykqhHMeuxlfIRFx2kCYRA/
	 JvlK8PCQk/1WuphZ0/iiXj9GIYDXH8PtMF+Hfu6IciYdHt/jcgTpvmg59o/jd1ZWNorXI
	 sWgLrWQzosIVYKdeTBYOIa+7M8QKPD6eYlw5z9OAGDHmIeDrwtHqtUN3PiPt1Nuq3lMVP
	 Yd5yzFinrjXKOQ+ZoJB5rvaXqls2imS17FkzCV8ajpWIP21NzeAuWurAfe/7JGcuHrnP+
	 8uOLzIZzkuKrsusYvLX0hElWgwPCe0cmnn4cL0l7lAHjrPdz5CzN7y+wTL6z0kYmUXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ND9YmuvI;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E2606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D6E2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ND9YmuvI
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3367695eec.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 00:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260156; x=1793864956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7IN2ZZeCgcwCvS2txh5dZSlnQHrz7HH/k4+ry9PPBlM=;
        b=ND9YmuvI+s5qL4svijWrxXoigMp9/Sd2qGNSXgfwZEIpwpmtXfX1YGpVAsH8C7qLP7
         bgKRrcEkB9aexHpHgPGV/DJXu25Eb7nBymol76uogfwk+S8afgkbJVA6q//pzQtgSVAZ
         HSN31GHY87lEMX4m6ChJBy8qyCRoMd5rxe5o+juHiRktTDW++2HHKZPYmCnuCx9GY7gY
         yrYYjDrD8k7hzk9YOsAdKKgRGmQxa4n/xrc/Uq15TW4Iozgs25i18Ox/uM9pOxEZdEcz
         ILmPMoL+enigdLboeW4VEm33vzE/yFvuEgM0i1VsgMZTxrcPt6x+Wq83tloASR5mfP+t
         R47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260156; x=1793864956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7IN2ZZeCgcwCvS2txh5dZSlnQHrz7HH/k4+ry9PPBlM=;
        b=pFbHg8SLAo6NXraC5TlnTB7qdd0JFLtjWxJaRlVihOS7h3AutwsCp1zpiiYCMsQgsP
         suAP2cXvn6k1Bas7J1o7PY8ALRxRbyq1NWE5775n7T4uBC3096d+4mmEEpI1QdWdseen
         ciKAqJHPNN8lQPVKCGVcd4oC1si/TrT/Bro+IAAhMPzP72f0QBinwNC6jyUWVPNUvrVQ
         DVmloCwurRsgYaXXZ+WQMhRTpD3w8a5tNQCJSIdsnEe744BRPagPS4dZgBTAMeoJEutZ
         7dcDJ517QsoC1xwHnp0K+1k9SbSCcZ1QfVK4YZaO+ghtobt550yeCt+k7Pl7RWHAANYm
         Io7A==
X-Forwarded-Encrypted: i=1; AKwUvBw9ZwPSQ2/PgrtbQx3c1K9A1V9D9JpXmEOIWq/ns5awHdUh3QoB5HGr7FPpaVhaYDeBS2tSG+ps3NaE@vger.kernel.org
X-Gm-Message-State: AFq9FYKkGtocTn1Vser122uMRnybXfXmipd1NFZE66EMZ2AgmY2BEtwJ
	jeuQpE6sTGZYYo0IYXgNAMEQhcy+Qv2JsnljFb6JpjFONldxqJVKrwFB
X-Gm-Gg: AYBFou26aGeV2Vgg2dr6wW+ye5kEkuRNEVhgSTFSkUbJFHqx1sUBmgXOWL6K2ptGhdv
	7xOAAG3l+qiLG0/4Naz/QJOd1pEzYjAogrn03hPZ/zeqS5xpNsHu4GhAF1TXAB6Yfxv68joLqIj
	hetTS8FIgEV51jC5Lz5i/ldhU0Nr742smjhjPD+jHfVyMPp0C4ADfBHYaHvIfzWN9BxbyvcXwwM
	C1VCkRUalyNpKX05KmEtK0tBIvXxtii+rdOP8pnIi8T843FPhOWq09SgEV6h3DSfVLhIXKFqJxv
	M7cp5MgSeF2ic6Nr+qsvfYLBy7t4YwvB/vTRtS7e983+35pFSGl0JoZWpnuvtFqrB27M22R1Z+k
	uyUPiEBt0IISJB5X6IUeJRBkmYPI1WsscuQSzLNhTenh+yb8KGQ3IsclCXRuINajsqjwSv14w25
	nWEl6ISCHqgSkewEz+fZUI/7CffZpRWkmsy5E190GN9FBsJ6afQnrMBvGz6sieOXYxITPALIkvn
	pQPWMRO+lAFAaXH3QuwnkIX50KVxdyAhy7PYnqw7e8drz4d4gH+iiJXPWWazBQh674wNLeLTEw9
	g6l1ywr9MOApAQfG163jGOmb7dkG
X-Received: by 2002:a05:693c:62d2:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-36a1ffc5574mr7347926eec.2.1793260155911;
        Thu, 29 Oct 2026 00:49:15 -0700 (PDT)
Received: from localhost ([149.28.89.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm15539704eec.11.2026.10.29.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:49:15 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Shi Hao <i.shihao.999@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: iio: light: add as7343
Date: Thu, 29 Oct 2026 15:48:50 +0800
Message-ID: <20261029074851.216029-2-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029074851.216029-1-marcus.yu.56@gmail.com>
References: <20261029074851.216029-1-marcus.yu.56@gmail.com>
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

Add binding for AMS AS7343 which is a 14-channel multi-spectral sensor
with i2c address of 0x39.

The GPIO pin is not described because the datasheet does not document
how to use it for hardware synchronization at all. The GPIO register
also has no mode-select bit to isolate the pin from the chip's
internal control logic. Exposing it as a generic GPIO could result
in kernel writes being overwritten by internal logic.

Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
Changes in v7:
 - Specify reg as a const.
 - Move additionalProperties after allOf block.

Changes in v6:
 - Add a ref to leds/common.yaml for the LDR pin.

Changes in v5:
 - Remove the GPIO pin.

Changes in v4:
 - Fix led-max-microamp property name.

Changes in v3:
 - Add missing include for gpio.
 - Expand GPIO descrption to include hardware synchronization.
 - Use led-max-microamp instead of led-current-microamp for the LDR pin.

Changes in v2:
 - Add the LDR, the interrupt pin, and the GPIO pin to the bindings.
 - Fix node name and unit address mismatch.
 - Include MAINTAINERS changes.

 .../bindings/iio/light/ams,as7343.yaml        | 64 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
new file mode 100644
index 000000000000..8379f913138c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
@@ -0,0 +1,64 @@
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
+    const: 0x39
+
+  interrupts:
+    description:
+      Open drain output active low interrupt pin.
+    maxItems: 1
+
+  vdd-supply: true
+
+  led-max-microamp:
+    description:
+      The maximum current for the external LED connected to the LDR pin.
+    minimum: 4000
+    maximum: 258000
+    multipleOf: 2000
+    default: 12000
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
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
+        multispectral-sensor@39 {
+            compatible = "ams,as7343";
+            reg = <0x39>;
+            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&vdd_regulator>;
+            led-max-microamp = <14000>;
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
2.56.0

