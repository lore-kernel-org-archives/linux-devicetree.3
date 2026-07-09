Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB033E95A4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584759; cv=none; b=iwvYD0HqZNtxzbfgggIrQPlOASS9lYVG9W1ZhEGoRvyDZdp9+PLrQyloYNWQNtIMH8sdKZ8GU+e9guMOpdOBYcaksqWg4Le2fGAYMVyYbwpcE0/ltaVd5bkNvBGTWIF87iWxaU5LeOgYLRID2btR6bT5M2kQgRSZ9+AMndOpbcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584759; c=relaxed/simple;
	bh=Ca5oY9EVWdqeLM+1rPJ3LJsH2g0BEAQYPWpbNiHXhGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTn7slFqdAIAb+P7Pn/M/nBCsd768i1PBz/zCgb0M52lqt/PVB0ONm/h8bT+KqYwrFYbbgjHZ5PAFfdIbIWJFbsxGJRBJ4gzEgjFW0pMScRglDAd6/JMeW6i/pTADjPk+9GHzFnoSA88A6mK/O8VwD0XKeQY72O5t5iye9n+luQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iudFpAPg; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iudFpAPg"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-388b404ea89so694921a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783584757; x=1784189557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQNWYSwyJwFhm2jLpB/Imxcdp7qalA7fsluMuu4gak8=;
        b=iudFpAPg+Ak5sG2gVx7FUrHnjJXU2bEDW2xRXgE4YotCJ32HnjoyWANAZPtrcUvT4x
         29ASxnYxNs+SdXUPMOcBpkY2byv9uo1BG/n9xZVu6PE+Cg725MW959wfibOGrmZAhb36
         hIkC+e8J0glH6oePSY81xdSWinK5APZmUzvFsuvpuN0SgwH+PqdZhpVUGti9Pa3ygHk7
         VgoiDk9Kz//1HmhQaIGQ0YATzqAzWV/89wsb243HNh6mR9yl0uqHYUXB1SFX5WB4bpbU
         Hb6negov7QlZEXD/UKKv7Q0OJ1MXfUpwO/H9rlhGvb2uP2MzhWp9oSAufE0L7FP7sh0O
         gNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584757; x=1784189557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQNWYSwyJwFhm2jLpB/Imxcdp7qalA7fsluMuu4gak8=;
        b=d39h6FyqmuJHvTT0SNJwny4HuuXaNbaWMPj2BBx1Mh+CTXInnQaHFxvLdtxuvCHqoH
         aIaxxP8YyZCaKbTUm/PPSAjLwOQ6dpd3TeP9uywZQrKWNkyeN5Nv4BQ32iMF0Q04yNvT
         vZlk6dRDo4gpvfq3ifJ1uO4DpTWyz9VEYgFnr0TXew76t7Nt1kxivXY28Adc+Dzl2mfn
         kIdUt9Yqbs4IIoUgNBbMOZtyF2qmIQHpER4idJePiYcIB4HDuPknKmUCY1lZiJO3VqPt
         2CvAzKe5lzDsQxyKgqwh7lhHJV1qk9A/CTJcxL1AVSjccX77h1vJ3DmYR3DmZhrnffea
         bo3w==
X-Forwarded-Encrypted: i=1; AHgh+RpZHvt41P4bJRnKl02y8kXgfWWvImekVetY/Tsv1+kA8IE62gptxZg2xcWQkC28UuKgaBgwCPxWZUfs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nHLlQJ3CTdJtpBTbEzy7EIx15Tvt9JDqQ1jYEhICtlFOsQbe
	V1jZhaRB4v+e2B3lUwEWMJNJH8ag20nng8BMleDUAUHLBlu0W0O15OWQ
X-Gm-Gg: AfdE7clkCr2rC1Ju0TwWwFkADYIAHg/nhHyPnOhU9FJb9zfxRFekeobB8tTjPpU2Fgt
	rB0/sY59Zkjqm7ZlQQKnNcauvqAscGKQW9pLNkyWqiLhFWM4fE5cFYdYklB3ahRSX94NzQpY9FB
	NDtNqeOk6iXy5yTh+RRQFRsnLf6pXcOlC0pAunafd9AKnrXlkFHNt6gXcVIm7/70ocmptHkBbHD
	PtsU0Sfmh5KxMNmyfB0VRBecxHd2EyG1JEK9wi3KopEir7miULJOSIxq+vnTc5S/nxgQrh1NqlU
	XH0GoEXQ75rgXF3ltZB/gPWjxcHx4kXO7KpVakh7y5f/fRbHN8zc+SsLD20cZBXJkePABRBZmMv
	QEHz32i+pLHSMEZzji+YGoB/xXSWjC/3BCXypcGuSraG8RQ6Ve6/F4msLjEo8bhFEjfwwXHKHFL
	UxwYKvXpDUG79Da4meeg==
X-Received: by 2002:a17:90b:3848:b0:387:d9cc:7dc1 with SMTP id 98e67ed59e1d1-38b75bf6895mr1962443a91.19.1783584756903;
        Thu, 09 Jul 2026 01:12:36 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8902:7295:9616:9031:8f8a:a80a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm10274601eec.26.2026.07.09.01.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:12:36 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 09 Jul 2026 13:41:54 +0530
Subject: [PATCH v5 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-hm1092-driver-v5-1-a1f5baa6fe08@gmail.com>
References: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com>
In-Reply-To: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=Ca5oY9EVWdqeLM+1rPJ3LJsH2g0BEAQYPWpbNiHXhGk=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqT1fptBzX3HMk88MBwL/4qY7OUNl2NV0oExy1U
 MJsUH9A6zqJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCak9X6QAKCRAVlYpeERwF
 3px3D/9UX4e4ruLLAobJ+4lCK80mmZET0l9Uok/utlX5Lr3wlGepjPJpSn/tvVMhnlldZuUUVuU
 vrpDZazpv0s1g1vaYyreVfhd4L+KWYj7r94e2BSdIDePNXrfZKCf+2grKLoOiLT4hanYH7z0CvA
 k+UfxKVDYVBa4I9xLrz+leYL0sjcDbBzNS3CXr2oieULVM1noRCyo6MBa9/k+CZYPxN12+Bk3DV
 BMBj+4AqkHLRNNK7AmRaKH6i53Igd3TaZSCekpjYFnawigGnGNgLeslY8gDAUBr9TVBWgVCOHYi
 LH0z6fYZn2d83X4XrDy/txz6Aty2ddqtqNzNtGpEUf9hgpUy0k9bnXNKDnvc6q5tcvBZ/A8CRgG
 zpq2UXSw2DUUxVVrWVmasWDNTSzYnu5LCWVzMOrHu2gB2dNHVnWV2+Nqe73iRca2aQh5VKL6/lG
 FxEhNw94klyb2kXZYL9jl4ADEeu3uRV1zMZic1Aq3x5oeTGLacIXjaLrFD2RukkUcGkDGrYuv/l
 N4rIAWU+7lN059lfDx0cPvA8dI3QouyNaXTrtrrJ5TubQRon+th7sGOJXzewcQlfgBfF/SIfM8b
 chvAgTeFBQJM/38Iz7iPR25zeFQnJvgkCTOzSHv9riXYbOfwrxvPD2Bxwyfplqn0cwkc/dnvLGY
 KJXVYSnlWgzPgKQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..87c43ef883c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/himax,hm1092.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HM1092 Monochrome NIR Sensor
+
+maintainers:
+  - Ramshouriesh R <rshouriesh@gmail.com>
+
+description:
+  The Himax HM1092 is a 1 megapixel monochrome near-infrared CMOS image
+  sensor with a MIPI CSI-2 interface, commonly used as the IR camera for
+  face authentication on laptops. It outputs 10-bit RAW over a single
+  MIPI CSI-2 data lane.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: himax,hm1092
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@24 {
+            compatible = "himax,hm1092";
+            reg = <0x24>;
+
+            reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_ir_default>;
+
+            clocks = <&camcc 1>;
+            assigned-clocks = <&camcc 1>;
+            assigned-clock-rates = <24000000>;
+
+            orientation = <0>;
+
+            avdd-supply = <&vreg_l7m_2p9>;
+            dvdd-supply = <&vreg_l7m_2p9>;
+            dovdd-supply = <&vreg_l4m_1p8>;
+
+            port {
+                hm1092_ep: endpoint {
+                    link-frequencies = /bits/ 64 <400000000>;
+                    remote-endpoint = <&camss_csiphy0_inep>;
+                };
+            };
+        };
+    };
+...

-- 
2.53.0

