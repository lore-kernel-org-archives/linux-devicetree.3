Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437390;
	b=FU+AAuYoJQDWtB+D7nXRsmiCWOaFc0QQh7OGiIPNuWJSOpgehtPBj9YmW4wvtDlsgF6u
	 +0L4ZlpHj9Qde22mqUQAL1ORTltf3ERfkJn0xJmTIouCE/G1oFvljaKwh36BjcMnA2ldr
	 WEpf8XbS/ZDkcV4XTc2mXinXer6y2yIht/bUUKwmownJvGIgmEvdT+dpuVjG2DMSHajpA
	 gsgzXdj9AZcdwiSxi2xa8K1IX/b7JA0PYSlMywCB/okcg5GS6TkKMCr8SytD5bwkE13P9
	 OrI/wYqYhO0xLQbBsaQmGtqUrRAmjjWfvPM3U49py2mLtsW8NFsTL8vExMWpQUynRfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
	b=s1yZkhTPT8oXdP6+ktCUD68SkvGblGNmYvS1poxqGEFD4sJ6fCxgder8Eza5VhbvgKM0
	 ISESTOHNa6snU9TK+kjftERRTjblzBw4z5l7BdwtliLbn/ycxX2as7H7TvmXxTjTaUpNx
	 N6J14oqGPG8nOEY8mipIGgQIQfjyECMWejkhoJEvprS23yCTurR4egI+tErhp6vAqbUy4
	 7CW582+C44HOcw3tj+4iwx/cRtBtBlR7ZdDYfjph/G81Sv5RTOGPgpsyDpDsxkax9GUIa
	 C7IdN2ewGceCUX8TkkVcYASpHM46tcLftB5HgLcSGn8Yapkf7tjAWzfLRINQ455Gk0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFIfOuub;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63612606A68F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63612606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFIfOuub
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38431138772so4119959eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437388; x=1796042188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=yFIfOuubNJlRUiOAFhmidvQBzSz0FkCm4XkWaYqNdoz2/f5GMQWhYHJfM0Q6x0yvWL
         10OOYhlU5VYd8kjDUCdqP0SszuzKHRMOmDaNdbJRS+tpeMrTNxlRshs3ILiv09Bw8FX3
         zSuUaj1Cvtsnbw3TPGbvqdsQ5uXBYmeA7QKxLUpzV/vNzcF0Z2Vs7QgCT9obfFX9ICL7
         H6MdVnytyOhs4j6GOIn8GmBqkQ8IrvCedOG4Wvlc9Fm7q03+RJKuTJ3uiBHwnSShlkIt
         y2X149Dzoo7Stf8oNmCLrGwA1WE/7Arap7WVpgxWRr3PbK2SNtjVM0K7JwAkJ6IZCAss
         Ev4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437388; x=1796042188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=Cr8y1vkIQBeRN3ZfqRtGR4TZP+rWBepftfVAZCWtqkfPRCMt0T24dawO+z4/Ob+2dH
         w5W9cEllIj3WsWZ9rUUzH2ESLfyBOH99LGTVfNjpJXEOzPeAiqFn7Bzg+4gHTNA4XOOg
         8pCf0HMvLG7lT8q1ZFuctxXDILu9bAIq/wIdjtxLLJLW3+Xw5wzWXhV/nuSHJLoR8NZv
         x6dsQoKqC/iMaGy7LLWNwmgU6iwPYdz9P9jQidKFmzEooUnsGD0ZQIiVyaIb4y/LCyfI
         Yyy4RkN4cF/4upJ/Mk/umAkTvvDTzwVDLjLHnPqiWOzF+NefwOAJj8Jl6yrlOBkRclDv
         a4HA==
X-Forwarded-Encrypted: i=1; AL+hErHNNbr3ZXfnMAudMtgpIjibU5T9svDYkVw7LnkJmgyHxVEWNUoyfgoDt6fnEZKh2So8QRNt2M5QTf+S@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vaj4CyRyY8u8eKyct3nWSYWsKjqDjrCuLKhK8q+dIoZjQUmB5
	zrX9DTO8+paK2L1OW0sx87TiKYoYhAsuk1lMkFyGuvRL44gbeuqyhXIWBinN65ztOpY=
X-Gm-Gg: AZFdTZd7FqBhoRKJzSTWOPyFxSF1sngc/7StV0KR19QYnj7oPAqDm4Ucle1Xg3O8mjk
	xsWoDfnSorl+gwRjx6WkXaGdjATIffOx6GTfTycFm88HxC2Yff1BTf2w30f6C1s6NWTLNWayDem
	EkFhN3oSiAKGinW1W+A6789ngUmD8iZ3fbg2Tz82KiMT1qYjhB3urFKBjswAXbl3ElpQj6P+65j
	SDajH8ZUrcO1PWYr7qwlUT9u9n1V/EQ/OE3VJ2XbJkjS+nMKsYGTRpLsrHCfMoDiA06bnUepBYl
	FyJCw99KSK1BLMDw9iAob5QuodCKThjh9muHrR9hgI1COwsqrElJRFGePGCwdBbSpToAodI/2dw
	+xww4q9ST0tOa6LT64cbJPzyeNFHcimKgROkkg/eRVFpSl14qItTyt+ugFKL7uDTRnv4OIDavCx
	dZnSTmCJh5kC8Bsw8g983Gyg5/9E3XKcGGwvKd6t0y8Cmi10tegwPRBJU4niEJHfAbyopuYIdT/
	61OGRAKKiewe2Hj8NToHcM9AFjMca422aTzqmnOoGgNITHqEqR5slKenoq5k/kC1ew2pROs2GUS
	LhBPldtPbLb6KE6wnrqK8yr7/Xu+wDtfR7UHD0prwftnPQ==
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr8057978eec.17.1795437388482;
        Mon, 23 Nov 2026 04:36:28 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:28 -0800 (PST)
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
Subject: [PATCH v2 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Mon, 23 Nov 2026 19:35:43 +0700
Message-ID: <20261123123546.152162-5-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel
MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..6919277c2b3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
+
+title: OmniVision OV12A10 1/2.8-inch 12Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  OmniVision OV12A10 is a 1/2.8-inch 12-megapixel CMOS active-pixel digital
+  image sensor with a 4-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov12a10
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
+  pwdn-gpios:
+    description: Active-low power-down GPIO.
+    maxItems: 1
+
+  vana-gpios:
+    description: Active-high analog power enable GPIO.
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
+              - const: 2
+              - const: 3
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
+        camera-sensor@10 {
+            compatible = "ovti,ov12a10";
+            reg = <0x10>;
+            clocks = <&camss_mclk0>;
+            reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+            pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <0 1 2 3>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

