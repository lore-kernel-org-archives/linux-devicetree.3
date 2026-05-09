Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A9E1B4156
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 00:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286510; cv=none; b=qgr012SG2/itKnJUU9bbKSRTixF9ncfiITujBRFMwtlSswZBh+TN1UxydVm9+hfElUdZNR3kO4QGTmsLUfeV55fSMtKU+ml3K1jQiEJL6bS4/0b85vsURc8hZG5yUHW902UHWbt+Rt5FJU1Fh+QcltK7o+tawO7bWrGvt0p3/SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286510; c=relaxed/simple;
	bh=krKCyrAKFIC5EL9Q1YnrE+uzJ56qyD1S2ilkMbdCeMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eB5s8TWLh7I5oDYg9AC0UZhlHN5j+k4cHhyKEADBMt3aheGf7Vp2hXGiVkjY7du/Ry0teuBXGXG8M10EuUCqDOx1IJ8JguP8nqNIUSfrCXCZUYomk9abFkjQY5TjS6Y+K0UxSK9FezhhlIaW8KlLm+c5XbOe4Iyr0Vr2YTp7XlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMYsCbeK; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMYsCbeK"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1329fc4bf77so831662c88.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 17:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286508; x=1778891308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDwIE60W0mXeu2WpR+wEI1Y9fvjpyHov5WakopHMXbo=;
        b=ZMYsCbeKRhZg/k39oSZxqV1AKMtlb0/aY4Vspe2tDI1Y2smIGydCO0ulGHr1t29d5b
         p5kmsRLvIFsOPk3pqbkUNpFfJ+2CC0aWxx2lqufoboUrQGYaeYFvysj6L3+jwZC9mtg1
         56uaYeWgOOi7WYjrftoTeQxu/cAvF/sRIwjINpX1Hb7StzacKL7RZYSdGM5HDku5OGLu
         etPuhdtC91r/4J5zsbOb8hmhT192zgpPJdZNHFVGJuA/dv9gBNb8MtgEihTMfOymjW0u
         sQYAIB/XFe4eHhHuTj4BzoKsD7QpoBpEKT58q+yqdK7Zz9+UYVFH7oMWwAoScYViVwl9
         296w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286508; x=1778891308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDwIE60W0mXeu2WpR+wEI1Y9fvjpyHov5WakopHMXbo=;
        b=Lmkn0XBLI0QAZQksKRpBhB0D83Aw2hSpskKdP1GtUgFGlievIcFfw8iwSgVFdh7DwG
         kqnWpdhAefinptqQY0M4Do12eltpz4c0z+KCmcsf/cmPOSd0gsxQicnlvVts87K7bPI8
         BepJU+tiESi5Snp8VcqeIEZx4Y+dMnG55JX3S0mHMfWM2odHRcsuprgdAitfCg3URat6
         YcwiaqOxKSV5iFlEr+k/4kX9cLKPUSthRp+8R+AvwNJMGTcIbBHYeGHxw1AZtEdg7RJO
         Yz6b1m5dfxbc1RERcS7sVBqnFoXrapSTcy3N1ma3kEfcEuTwR1/7kKD93NZPstR/7m2F
         7FDA==
X-Forwarded-Encrypted: i=1; AFNElJ+znXLIpNW9QfCbfYfJP7VXVedF2gP9HiZSIhkqxEH9v+KJmi5O7u0AQWNHpcCvMfaeb2mV6bQVt2v1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0BPs0gc7+ULZZvq+yC0D+nQDDGwUlTsFbYOsIkZ62GT2NdbhN
	etKaPzLW1pIxrQ7+BTD19XqMdOfG4FSl8zAH7Oe9GNAbkC+mhPRLesHt
X-Gm-Gg: AeBDievjtKBqYP7ldZGxRbEW7E6at+FyTsb3NckKbf6ks6gbYOCUsoSKSutHXuWnLQp
	cyeYw4wVyQ3m6jisd4MVLAFLtAFeYJgxh4Xss6QLUCBz74UqLGK5o0SmNElc2yeknCPL/eVVo9c
	S+9WKnxUJb1WFpKZLJ0cJlqd53HInQj/CA+C2vd3Rko0Rf06K+AUTUscy9C94i/WoYjmskNFtRq
	T9TE3QpJPhFgizxM3ZudQRRuowAiGCw8aunqdY8rzF7UAHRON97q8FLMuEVMU+JRLK0we9xAze3
	sHk+xko1cPXirDC7JDtd1fzxSCeQl5iPPHt0F4DHgyKtSXj5c9Bl4mHHj8wB+DmbkWwIra5IY76
	WYbg5bWjCC3uRRcAhriafPK2VueE+icPPRxTF04jsD69X23EhS7lwf9gMu/N4+vLwt372qOdGA3
	GN5cEkvb33/ShT5XN8al51rJ7ssCExivuXGT+qsAi5P1NFP9fO+03Xvhs=
X-Received: by 2002:a05:7022:1b0e:b0:12c:44a5:fb54 with SMTP id a92af1059eb24-131852d2fbfmr7892176c88.7.1778286508407;
        Fri, 08 May 2026 17:28:28 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327810ffb9sm5979234c88.2.2026.05.08.17.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:28:27 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 1/1] dt-bindings: iio: dds: Add AD9832/AD9835 binding
Date: Sat,  9 May 2026 00:28:10 +0000
Message-Id: <20260509002810.78372-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509002810.78372-1-dennylin0707@gmail.com>
References: <20260509002810.78372-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding documentation for AD9832 and AD9835 DDS devices.

These devices are SPI-controlled direct digital synthesizers
requiring AVDD, DVDD supplies and an external master clock.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 .../bindings/iio/dds/adi,ad9832.yaml          | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml

diff --git a/Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml b/Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml
new file mode 100644
index 000000000000..95b20ed4f9c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/dds/adi,ad9832.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD9832 / AD9835 DDS
+
+maintainers:
+  - Hungyu Lin <dennylin0707@gmail.com>
+
+description: |
+  Binding for Analog Devices AD9832 and AD9835 SPI-controlled direct
+  digital synthesizers (DDS). The devices use an external master clock
+  and are controlled over a serial SPI-compatible interface.
+
+properties:
+  compatible:
+    enum:
+      - adi,ad9832
+      - adi,ad9835
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 20000000
+
+  clocks:
+    maxItems: 1
+    description:
+      External master clock input.
+
+  clock-names:
+    const: mclk
+
+  avdd-supply:
+    description:
+      Analog power supply.
+
+  dvdd-supply:
+    description:
+      Digital power supply.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - avdd-supply
+  - dvdd-supply
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mclk: clock {
+      compatible = "fixed-clock";
+      #clock-cells = <0>;
+      clock-frequency = <25000000>;
+    };
+
+    vdd_3v3: regulator {
+      compatible = "regulator-fixed";
+      regulator-name = "vdd_3v3";
+      regulator-min-microvolt = <3300000>;
+      regulator-max-microvolt = <3300000>;
+      regulator-always-on;
+    };
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      ad9832@0 {
+        compatible = "adi,ad9832";
+        reg = <0>;
+        spi-max-frequency = <20000000>;
+        clocks = <&mclk>;
+        clock-names = "mclk";
+        avdd-supply = <&vdd_3v3>;
+        dvdd-supply = <&vdd_3v3>;
+      };
+    };
-- 
2.34.1

