Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A88837E5C5
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389146; cv=none; b=FJl5jhKmUlfTiUYfIiQgN3bNJHumvvIeJWOGSaXAW92OboYBphCH+wf5m4R22OTnDajh36GVBNHZmQUJ63s1B3ctlpmf0y9d306O5o7w3NIHkIxjN/s6nhT1OyrZl445cKMIVfKIURT22/a0qhUa7z4+Vl4L1OtCa8oR32KxK10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389146; c=relaxed/simple;
	bh=9gxlDRHqhuwt8FJ/CwukjTyzdPv7n6MCBFsd7dAHKR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVcqDNSvmNsOq2TR23jTMqzCLTCmRBnEhaF+cj5b0Y+rF6UWHRkkIScDdqpAsilq9kGIbjG5sT/LWXXkcaBBAq2JubOLuCVU5sSpB8Yqxyd0jPYDdfoWSmyms8H/Ou4eKPrJmYcL8jjVFkUun39WKZQzyHDdE5sf1a1imJdBZ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtURsgPa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtURsgPa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49954b88fffso14776215e9.0
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787389143; x=1787993943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ht5SF4+wx6Jf8JH+OLs35dYBN3IVS35rx1u5RktbmkM=;
        b=WtURsgPaY7dhFpQaoptaa5Gesp/20CvJpu5EiY2YfqTjvY6RxSy6el1MtxFSZws2Jo
         ODXcnLClj5KTue1lU4jRD19KEBDeY7U7X5fGn42fihQXeYsupxEuCxEDXDLX2hw4/5Uw
         ypnUKFweZyvSj8NDHS2j7cJzyWaG5mDOlzGhDqaXpX4zDh4tHFSRdEOvhFdElL8WkgsH
         LBR7rlkywUBlSWEsUNrsJ4SycwatjxqQFkenrw47tVlrmOv2HYeXet43WPYx69a6qRWI
         Lc2oguj8OWu9s7fONVt2ezLR0rOu4ZM2h3MMGC9ZbL9X2xm5GH6CCyOa92V2oCU7Rjn9
         5UZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787389143; x=1787993943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ht5SF4+wx6Jf8JH+OLs35dYBN3IVS35rx1u5RktbmkM=;
        b=Cd+Vh+Va8L43ScpgolKyJvQ29I/CDCoFUdLcRyN63qdcFdmBRJli7n4eEV+IMenjia
         /uv7M1kYBsfg+Hfa2EdQS4cb0L0OSw4/N8Tpg9dcfwEGzH163K6pWJcC9NoqLUa9eHbN
         1XEJWhuVLdkCdH3wfwtLb9f59bl3icRTLWMBoZnA8y3Ach5LhCMCWWF/02W8n7cxAi/T
         SvHNDchbEF8RUX3xCE5GGLM18ToOEOyiH7MKPCEZc6WOXyyfmYM8W3MHRtNqalYdL00H
         5QWyDsqM0sxBoBKTajAUAFObZ7tLktsL+LAnSwE/IsuavMQ76SMDyiHsPPrgQO1hSvcF
         oDpw==
X-Forwarded-Encrypted: i=1; AHgh+RqF/IqvZcFV1mwEBb9m1HnsHHXoVeKI5g2WZGwbZnsJufcXGN+pPQYJ8xlvu2KzVHa6rDqUFPBuxyPT@vger.kernel.org
X-Gm-Message-State: AFuF++nQhQnNs3WXTawzvtH8sEPVyw8iISpaKzMneI59XBYATlfwX6y7
	/Br5HG9O9pt+QqngV1THosbocQrmHeErSE/4pCHfQRlREmNeaB2ddD2F
X-Gm-Gg: AR+sD11NRBb33plNt0pRVlwhFQymu1aTceE0nRjr09ItO7neZTvo0QvBwxCGaQ/4mWM
	sIbzDSgU/46GypPZAYTXVOyWw511+hMppW7QX9YRADWHeIEdSibSJ4XCQjXNJyJazJKh4zfGFDI
	wXY8Syc3SCJrYnGKY/9zx97e38vf46c/0P6It0YHLDnepjUfUT7+40n65mg0dhTPpLUDIlKL4E8
	BIoC2LmkxER+slsM0ef9K5KhD5Fdcm43aznrJ6bsAtwI+RdZfqM/m5ZkCMc9zzV9+eB6Eh9so4I
	E6Af33kLwwlYzLGu4AAko7L9FCV9LEu43PgG9cWxsA1mRabM7/tfQVg4/UXJ18N0KLdCwDZ1LOe
	20YRBknHPI8Y4C6Zd/77BBk3koZrJ54Mk7kfwUZp5H4Us2je00y5yT31TVrIlHZVvZKWLfGkCA2
	HoZOSIGbZyS7GBuoy9hAug5n4lmBCGoudDshmBUScsr7eC0gHQZnhWJ0YQXp8nVIFMsQ4k80cuy
	xggGrkPwgE=
X-Received: by 2002:a05:600c:3111:b0:495:7888:281c with SMTP id 5b1f17b1804b1-499c1772dd5mr39257375e9.0.1787389142531;
        Sat, 22 Aug 2026 01:59:02 -0700 (PDT)
Received: from fedora ([105.74.72.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c359b9fcsm13596635e9.9.2026.08.22.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:59:02 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de
Cc: Michael.Hennerich@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/6] dt-bindings: iio: dac: ad5504: add output-range and missing gpios
Date: Sat, 22 Aug 2026 04:56:48 -0400
Message-ID: <20260822085850.17527-2-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822085850.17527-1-0rayn.dev@gmail.com>
References: <20260822085850.17527-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD5504 output range (0-30V or 0-60V) is determined by the R_SEL pin.

Use standard output-range-microvolt and range-sel-gpios properties to
describe the hardware configuration of the R_SEL pin. Ensure mutual
exclusivity using the not/required logic. Additionally, add missing
vlogic-supply, clr-gpios, ldac-gpios and datasheet links, and provide
a complete usage example.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iio/dac/adi,ad5504.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
index 9c2c038683b4..e0123dceaa33 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
@@ -10,8 +10,10 @@ maintainers:
   - Lars-Peter Clausen <lars@metafoo.de>
   - Jonathan Cameron <jic23@kernel.org>
 
-description:
+description: |
   High voltage (up to 60V) DACs with temperature sensor alarm function
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ad5504.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ad5501.pdf
 
 properties:
   compatible:
@@ -27,6 +29,29 @@ properties:
     maxItems: 1
 
   vcc-supply: true
+  vlogic-supply: true
+
+  output-range-microvolt:
+    description: |
+      Specify the channel output full scale range. The R_SEL pin
+      determines if the range is 0-30V or 0-60V.
+    items:
+      - const: 0
+      - enum: [30000000, 60000000]
+    default: [0, 60000000]
+
+  range-sel-gpios:
+    description:
+      GPIO connected to the R_SEL pin to select the output voltage range.
+    maxItems: 1
+
+  clr-gpios:
+    description: GPIO that controls the /CLR pin (active low).
+    maxItems: 1
+
+  ldac-gpios:
+    description: GPIO that controls the /LDAC pin (active low).
+    maxItems: 1
 
 additionalProperties: false
 
@@ -34,9 +59,17 @@ required:
   - compatible
   - reg
 
+allOf:
+  - not:
+      required:
+        - range-sel-gpios
+        - output-range-microvolt
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -45,6 +78,10 @@ examples:
             compatible = "adi,ad5504";
             vcc-supply = <&dac_vcc>;
             interrupts = <55 IRQ_TYPE_EDGE_FALLING>;
+
+            output-range-microvolt = <0 60000000>;
+            clr-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+            ldac-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
         };
     };
 ...
-- 
2.55.0

