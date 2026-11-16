Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870012;
	b=pPhtDVqyKDY2h//Pln0JIuJXzEKr4oFiJezx/bBcQHuqSzLzfFc4FyRBfNnWOI8KWc7b
	 fML3jQccL/k1dcRmvT0p06xNhcvpfojSe/VTJrf8HlCBRuIpfOH/9mDr42q61Ckj/MKKv
	 8rT1n9mHMA+IlZXtjgQrmlJ6W3f9wAUOslHi0WyzF0C61opqd9eLq/+Zw6/xwwbwkjms8
	 v5fnkxebohpcqWPdJQcmF9yMUoYpsljXbFJkMT4kAl4jxYVQCwcc9AA5E7bjK1PjUflmq
	 M1BPk+iiK4licB0W+ZhG1+T4PqXGgPfjyxVjcx/geIIMihM9EeW7fN4fdUq4AYSO+uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=PH0YrpSlGVv9qt33Z4Z9rb018oWWfWEr7PktdA631oM=;
	b=CdI6GGD/kyuCC7mZNvLDUFassJUketrNQHyZbUA7mErGBNT/Jxpeg1+Jpv9cw4Vb7w4D
	 YC5AKQ+iMENqOTak5AJ6A4S9+oup1sVHbmEHocFIhHs2hnc+Mw51zm3upjnT2IyUjj6/d
	 6PFR+46KDu9Opx6KgCK+SGlHrwXphxdA7q0crJPuH3aSI+NqAyUpjD0p39QwoEnC+CSjW
	 cQmtxeCnVpFxIRTNZRVKlu/vANxnm8FqRlYPAPT7+YsKy1HWfiL4pkMHCyCRi0GgA4g2G
	 zFpUTmtwqHcMGRHtjKSWNfsqEI5H96V/1i2kM3QYfiY9JZgf1idIQdHKTCkSgLuXkuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB88606A8AF
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB88606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0dba37a7fso37854257b3.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870011; x=1795474811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PH0YrpSlGVv9qt33Z4Z9rb018oWWfWEr7PktdA631oM=;
        b=yUTi3QGY5sj/QAau1kzM444jnqPMS93V/ZUY49Dva2G+VgYJDc9zSjycJY9VLz5fN1
         n3/AygFDfAC0aOKOaFTuRzJCxiB4WhJNwlIwQ9WuBKUyvJy93A26/SrOW4l823qlPWuP
         GRH5/+dIAfd7O28ck3vxUk/oMdEopMX0UmtrKisSu0PXO3jGOQXA1DYqhYNXw4Czbemx
         3dn1w2i7irgX7Z6By14ggoyTnt0ZfOoSjmsCU67JoSw1HaA+tJRPx4sSn/19lZRJbkzQ
         Ei0WDCz/H/oOWNDs3IvMPkCuAOGRBseryF1j7kS1PM1+B6AdhA0oHnJ3WsmbjnJtSjYn
         pSSg==
X-Forwarded-Encrypted: i=1; AL+hErFUHvjyG8TuavnLHHwGJwI8s37Ue4fln7+GK+UedmpJtUSKWmVWr7VkJShfFzb07V9SQ+lxFlatVtot@vger.kernel.org
X-Gm-Message-State: APuU4Z/IYVlRYuM6cvwliYyo9Bb9Tw8XAhqf7E/TGDwUlOny+zTTMzjI
	WRxSjNuSoeYdBYzpIkzX7U7d33qFQsI4mUH+8U1GJNVfqIzRPC4do876UrGoKHVLFqQ=
X-Gm-Gg: AZFdTZc2QGF3eq0qhurpcsGNyaoOkgFdmghntAy54Lyj8Wx73jke3HiTCEYB+CIU2RB
	e9pZinnNuGBKD5B4cG0539YCJT4qZUzXC4KQspYphEx0jo7/063CqzYeYAFgH+27DdSFnkLvgu3
	N1m4ESOrTdFV67Vu2F+SrQpgKjy+c5A8vi+Xhq3Qm+q9TNu7LBOJA65W6t3jZnA22aXC3Zl0HRJ
	krkpYILtOTHa0blECV39K4KnIw7ikSecm58RS/XasdAYSJkA69IA5hq9u9h/o64sUGWrrkYoi5y
	zCqfFbldOuQ5bpb1seNZ+IQbLwalpWJUUt8YXQkr72RxAo5DFiRp7zd+t3GBolC+1JcPUILgyL7
	GO8j2O/W/QIkwkND6PnPW4u6meOAHOsUDRiEjtzzdUvv0Ii5CRED0Py/QDSHGsnlOfwZyl3U+hi
	DswRjMe0Ado0RMZ2SZ3cLfmWU0ujzpo63ChPvyA4tuJdqzBylAbmjX/SCSQUxACa1wNiYJ6z1O/
	nvSaUde4iECKul+6OsIOTLKOjSOEBajxF8Xs+b/mErL/KeEKupR3fgQ5hZans3T7cIg+VQ/Xa9U
	aq2izu0AnNbrrZTfzfaeU/dZFWpdTvYY+Yr4S5u4mQuYYUVncZoOTcyQ4aijTioeUFyPMgRokE+
	FQGXdbuLzsONrQUoFPv6OprFkQZyW8nUWA/wQNPELc6ufo+u8uLVYAA==
X-Received: by 2002:a05:690c:7003:b0:8b4:e2be:7a67 with SMTP id 00721157ae682-8b4e2be8127mr15335447b3.34.1794870011265;
        Mon, 16 Nov 2026 15:00:11 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:11 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:59:52 -0500
Subject: [PATCH 3/5] dt-bindings: iio: potentiometer: Add Analog Devices
 AD5246
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-iio-ad5246-v1-3-ef6b7c06d4b0@telaak.dev>
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
In-Reply-To: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The AD5246 is a 128-position digital rheostat on I2C, in 5, 10, 50 and
100 kOhm versions. The compatible names the resistance in kOhm, as for
the AD5272. It uses the same protocol as the MCP4017/18/19, and the
mcp4018 driver supports it, so list the binding with that driver in
MAINTAINERS.

It gets its own binding rather than a trivial-devices entry so that it
can describe its supply and be an IIO channel provider
(#io-channel-cells) for a consumer such as dpot-dac. There is no
fallback to the MCP4017 compatibles: its resistance step is 1/128 of
the end-to-end value, not 1/127.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/iio/potentiometer/adi,ad5246.yaml     | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246.yaml b/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246.yaml
new file mode 100644
index 000000000000..a6642746f002
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/potentiometer/adi,ad5246.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD5246 digital rheostat
+
+maintainers:
+  - Joseph Telaak <joseph@telaak.dev>
+
+description: |
+  128-position digital rheostat with an I2C interface. The compatible
+  names the end-to-end resistance in kOhm.
+
+  Datasheet: https://www.analog.com/en/products/ad5246.html
+
+properties:
+  compatible:
+    enum:
+      - adi,ad5246-005
+      - adi,ad5246-010
+      - adi,ad5246-050
+      - adi,ad5246-100
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  "#io-channel-cells":
+    const: 0
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        potentiometer@2e {
+            compatible = "adi,ad5246-010";
+            reg = <0x2e>;
+            vdd-supply = <&reg_3v3>;
+            #io-channel-cells = <0>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9cb91ee8a56d..81069fdbd778 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16680,6 +16680,7 @@ MCP4018 AND MCP4531 MICROCHIP DIGITAL POTENTIOMETER DRIVERS
 M:	Peter Rosin <peda@lysator.liu.se>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/iio/potentiometer/adi,ad5246.yaml
 F:	drivers/iio/potentiometer/mcp4018.c
 F:	drivers/iio/potentiometer/mcp4531.c
 

-- 
Git-155)

