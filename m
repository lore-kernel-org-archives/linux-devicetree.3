Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894ED4B7A55
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680496; cv=none; b=CLeeaml+GghURUjZCDb2dywB8ttK9VfMKp746sR1iTsgWFl9v14CN8e3NBaxNhZvtj1Tj4XEHEWr53n0sRutpI4WCw1KVJBRJlRCxe2Tkb0edPtxzXpY5/GhLsbUA2Gp3TEbBfwxe1BIQvgG/kU5SEi+QIxH939hrUiUJyuFEe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680496; c=relaxed/simple;
	bh=18SRVwnsAR28xSVXqGmgLVILEzIjVLYd+f+ZrUfMrEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLzJWv5mxgpGaEhC4OujUGqQ0xrbN2w0AZ5T1u9mAkC37Z/q1GfgrpvwH/U5Eva99/4LmZonv49890UJsysdzsPAJf5M/3J4J4TMhqVsH+B3xQhgYsLeqj88X/FHDnwqFeYRLdE6J8o2wHgHCUwKi9zSiSa7RHONXh/Tgw14a70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grZ9Jx7Q; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grZ9Jx7Q"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so585815e9.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789680492; x=1790285292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdNOXmL6pOGJYRNkQffneuXoPJ9jf1AzKM8aZVFlRK8=;
        b=grZ9Jx7Q2kYf/LkFmHvifUFMh+EjKYdvuXaLdmFyPPh2PXCtZcbgJXT3NFXTSrTWg+
         BECA5+6ssn/XJ+0FxnLpo05cSKsnVxT+atsyE+PtZiYMDjjl8QN2q02ZYNWFofrgxvDq
         m5Bx85hnQDID76ZQ0lKaSRpdsoiaz3FOaba42eVin6rYeRGeWlfHee8g8iBe5JlnAd5g
         aOrLKMLUSEJjDFinLfjqnDWVCw8C5Ojx3HlOEC8gQWndsPq6LVMsncuWTUGflRDeqKdp
         RySLVYioK/Ws3/O0ZRpJcY8Wm+C1hGw+bYqNP8lugKVz6Z/BkUOVHS0Qcw01vfuT85ON
         E6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789680492; x=1790285292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdNOXmL6pOGJYRNkQffneuXoPJ9jf1AzKM8aZVFlRK8=;
        b=LjVr/rzCi2mBAvNCzXBulLtvExODaaaWjstwy3oxl7Wp/kCvTKod+uvxV00jGd0Q5H
         Dr82+/ltskG2kqomp3kX65+fVVp5nC9V6ZEdnXtONxTiZX6uJKGcCuQuWp38etyB++Q7
         6NASAiGog7b+Byna3+c32yDtCrwDWoETJDLern0LbIi6sjh+69oAC8XYRdRaFhLouwow
         I8+RlxoJbzstbdqAHIoyWQv5jX1MskTnlRb6A5OYLs0GalfGlDTX9mWB964tYb4jj84W
         VX2ad4WWVm//ijIWIcSqxeJqKlV+CInWUkGth2ErAFAQjtzxUbSRGY1gf74v7KLoKHr/
         vNMQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4O44/sCBJ8S22gxjt4j0n7h/cS9WWBMRKrEKmgk12YIkNbdbHS13AT4AMdIg2MVg3zqHsXXrTPbNx@vger.kernel.org
X-Gm-Message-State: AFuF++lgkJjNCkt1Vi501huG6Hv0N9dmE8cWcRINP+vxePUAdrOvb8qO
	sI3YuN5Z0CgXItE666ZUKXuaS/SqRYTWFIj0vxoa4tEdTt3R0MKI7W7S
X-Gm-Gg: AYBFou0m1Y3crO2np1fuc4fxwc1Fx7Co7UBWOmAXm4nPu0jnZesruD2Ii6Y54kC594w
	+KGD7Ipha8CEGgo8oBEx8Tr2faNGqqVEWz1T9uOYINxNdi4zVp1TDHypOW+P4UyfLHrjC5805Xt
	Aa/UkOvwWst8ZlTbPquW6rYvl6meiazhRhaPixFgxQURYlz2ZSSx5qepP0LKbLg4M4WbalcpKBp
	DCaYL66//qIYPwk6tI/Ki9rmp5B20aMYe4ftKESD/2y+eNwSIL+Ur+Hu1WW9Bodehm28siz4t1t
	Cdvz0Xkq6IPwqUD+F99UWqaQmqu2mtgubg79pETjE/skIi+BI3/GLQMV8lk9Ppvb2ERYgbK0v/5
	Qli1pXFxCEK72tVzC2Dn5QuxHnRWhsR38p6vhcnbdTIgOH8vjsgCJBouwZqFyNGC2j/fMaCjlKF
	KG9aWVZvEf5GsgnugVvvv2evTHJFt4yIGZFl+eb7OYQjCYa4RecaojA1EmQMRIwzIOnTYBCqwp8
	++FZRIcFQcntc4=
X-Received: by 2002:a05:600c:19c6:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fc5741239mr2248305e9.16.1789680491683;
        Thu, 17 Sep 2026 14:28:11 -0700 (PDT)
Received: from localhost.localdomain ([176.220.99.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm18148838f8f.29.2026.09.17.14.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:28:11 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: iio: adc: Add AD7816 binding
Date: Fri, 18 Sep 2026 00:27:51 +0300
Message-ID: <20260917212751.16729-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DeviceTree binding schema for the Analog Devices AD7816
digital temperature sensor. The same schema also covers the
compatible AD7817 and AD7818 variants.

The driver currently lives under drivers/staging/iio/adc/ad7816.c.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 .../bindings/iio/adc/adi,ad7816.yaml          | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
new file mode 100644
index 000000000..1ffaa4a68
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,ad7816.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADC AD7816
+
+maintainers:
+  - Omer PALA <palaomer100@gmail.com>
+
+description: |
+  This schema defines devicetree rules for
+  Analog Devices ADC AD7816
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7816
+      - adi,ad7817
+      - adi,ad7818
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  interrupts:
+    maxItems: 1
+    description: Base interrupt pin for AD7816
+
+  rdwr-gpios:
+    maxItems: 1
+    description: I/O control pin
+
+  convert-gpios:
+    maxItems: 1
+    description: Conversion start pin
+
+  busy-gpios:
+    maxItems: 1
+    description: Busy pin
+
+required:
+  - compatible
+  - reg
+  - rdwr-gpios
+  - convert-gpios
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,ad7816
+              - adi,ad7817
+
+    then:
+      required:
+        - busy-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      adc@0 {
+        compatible = "adi,ad7816";
+        reg = <0>;
+        spi-max-frequency = <1000000>;
+
+        rdwr-gpios = <&gpio0 1 0>;
+        convert-gpios = <&gpio0 2 0>;
+        busy-gpios = <&gpio0 3 0>;
+      };
+    };
-- 
2.55.0

