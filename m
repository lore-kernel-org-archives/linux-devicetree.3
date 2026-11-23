Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437377;
	b=yrAgs+T33H82V2rOzN5iYOvFYwpE+E93g8pCxX78H1gAIiuGDU9E7i7C933MxOfy1o/S
	 KwzMgIGMbH0CT6KaAXmODCvs872jMm+gIH6cdVXt6TohgQvSjHgWttaJRv3y65Nejan/z
	 9KVgrWRsL1Q7wLWLigP+coFKyJewofDC41gBxY8SXRPXy+6ikZtNGta3YdJcNa6Z9VeqS
	 xIiulKmv2P7TuRFr5fW2N3Q3SE4F4uZhUBP5K1vwL2Nr1RTgISZ1402q1KjCAwLy/6jcf
	 C60SykeWcSPB99h4h1sBrgtyB0SYy8NPg86vrKU3/G83hdorGBemwAPU08ZEcLo4f1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
	b=r16ZeMRBFM4AZ9Dr4HJnN3U/dcxJRxluvHPo+HPJ4Aj1AqJ8OtTgiLLM4IDd7PzTGb1U
	 6mm1hLSpwZ8wKDOwLAqJgtb4j4gHJKUXd2UL3AYpEqxO0go3+IEIgDcdUHr+ugg9KdflT
	 csb+yzLSODwFIWKhs/sYKN6dMjo3T1NazV/ZGJhmAV2KYeMfl6iczlRHCiY0T91czag0Q
	 QLnBVaEp2Gw3Enqe0RPna5wUO7S+Q2dJO9wAifuyKpTkYgD5qGMpunowaAZo7LgAmDeWQ
	 lHOqsCfjRTnQ6sV1do9pz9pUOAdI0OMdWfjbvUfzCOa/98W+LkuzdB3xRuGtiVDztDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6i2UD+8;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC82606A68C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC82606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6i2UD+8
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso1913220c88.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437377; x=1796042177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=R6i2UD+8+1SWXf6raMYqaGU6H0ZivEnYsZ600TnGXzjRiBt2okNAeVKSlYBYOoW5Nq
         sTjhq6t3svnLQy8/KKx48rxekAp41/oU8wMvLXcUJHSlB5ws6nby/8WiCuiIEWqZLPUr
         6OGGhhdkAW1bGGOeS9cZHZv2TtjQaATT+kczHXZnkMDVUZZZvTfIXWopXsEX6nkGPNCE
         +7IuT+u4Ag53FHsuExyb3aJTlEaKFfKiNEBtMP6fFKFDY5fqs9/0WjfiJDyXqyqAxzcp
         2ShqeKYlzL0+vd4juk0LrKZE8XEezjB3tuvKz1g483yqW+hjXYLFccv2syX2DSBi9/YX
         lD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437377; x=1796042177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=GEjWTcri25eSnpbEHmpKkGPH2ijIWXQ3osKcE14RBCzU34M/CsXk99ZVzAAHgDzHj2
         zUJFCbIJRJnVwl+Ug0U8IOW3fcGZ//RPuiJa3HL96oVoLSkCzH8cjnSuOfau33Mwc7cf
         p9VE5c+t6OIs6uXmRwaoYndUN8msn9trxp2hQvlf5bmXq4LN5WDjyN1ZHvyv2bb+/CqC
         Y34jM4evKo8YsA+m/oi563GYPx27I8IVURTrxScYe1FTvR6HHSfoa6Pe7xJTyYHW/6Cl
         DErDNfBG+EOQogm5ARnXM9Fo4B8aN4LWPyjh9LGEZKkCga+F8DPoidALmzRdo3dTuvex
         jB6g==
X-Forwarded-Encrypted: i=1; AL+hErGlOD11Tl1bpH/MWxJ5XdJHuhT6hHrxX+8zSUbi594r8xxC8b3Nw3IvdKNyXwKkgsFCFzDGMYk/EDwe@vger.kernel.org
X-Gm-Message-State: APuU4Z+TK8U+jwIETi/BLJ+EtiG7QZ/sujpoFDcB16vSQSUTXhlmSLBU
	E8si3Z+AC/5NccCDQmcwEWkdWPQHe0VDsWwrLtRubovhMBfOKLJUcGjo
X-Gm-Gg: AZFdTZcHdfcTASbXbGw2QHTFHAwb5a0RAM7jsLjK8WO57e9rPIBVlrsyQGhBAlROLmJ
	E4iCXx+QZe41P9PXjyDfmVxoIBZ1UBwHU/QYjEQyYE2GwFWICuY893ZbcoRJy1ZNmEXXABdDO0T
	JWpyjMPWR5dpOd8Vq9SGPpDhnyzD8JANpf2iBEg5B0JSgsWHUWAPm6+NwxcV2S0wfPh1zWBWebg
	PAJvxVq5FIDE32fvfoZB42tEVoeYLq8sblejJUda58J8B2x0Kx3S5x8tgTB81jzQkaJEoMjfzy3
	dgrZ5I++PIxZVu9gHeXpk9l2VHN7dTXhb8RpPsQv2X/OATNnbZo7HB9/5CAbG1neq6uPVeU/+cR
	drwkB0fyAOoPgAMB2uuPRJQZ854oEtl1yLp5IB9eJjeZ8yHFesd4OeZnRb/Qr5sT3heH+LXZkiK
	7PO8spSRe3tiE4+0NkeCv74NgWeOFDQ+v8GNEFmCuMcBfAztr6BJNxLtNjdUBHrUhxHfTrVyatA
	ibHpeo5L0h0ccb+oevqIkEj/TLl0xyidBjHipp4rPTnZki2oMgjbYFoKav7cKniqEA1gNYH2gJq
	pfgMIJ/BkcXS2XRXNMgPFWcy1cQKKrm95qUrwK2/qeWR+u8USmHrrPHcxTscpURiRgo=
X-Received: by 2002:a05:693c:88cc:10b0:386:b306:4ff6 with SMTP id 5a478bee46e88-386b3065916mr2485851eec.21.1795437376602;
        Mon, 23 Nov 2026 04:36:16 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:16 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 19:35:41 +0700
Message-ID: <20261123123546.152162-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI
CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..0e440209c3fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
+
+title: Samsung S5K5E8 1/5-inch 5Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  Samsung S5K5E8 is a 1/5-inch 5-megapixel CMOS active-pixel digital image
+  sensor with a 2-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8V).
+
+  dvdd-supply:
+    description: Digital core power supply (1.2V).
+
+  dovdd-supply:
+    description: Digital I/O power supply (1.8V).
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
+        properties:
+          data-lanes:
+            items:
+              - const: 0
+              - const: 1
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
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
+        camera-sensor@2d {
+            compatible = "samsung,s5k5e8";
+            reg = <0x2d>;
+            clocks = <&camss_mclk1>;
+            reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l23>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <0 1>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

