Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432125;
	b=4SMd5dc42DmB971iYqhJ7E9KcVmIIDnGyKeui5rJvcZiW51efpsJGsi06N42IWXM/3qZ
	 /zATmalF6oLNeA3nDZxNkMJ1wYN8T2/xBziEZvIpf3jqZoeDO1HpNTGOg7LDJXPpvABH8
	 w++Az8ziZCwoDAKj0edinXnyiNEnYoS4SjLmy4B7PURHvArnJZbvPExAykgA46Z0v5Qb2
	 aGXauDqLMCwjTyXufJt6i45cSzFuy53GaUzqD0H6v315oJGmf9FlhD/gaPHH1SPUuai0+
	 z8WXar5beWkhu9I7yd8jZcyVEsjHf8sNSbUjwPUwfx2hPW6DBq7jSIpOO9ba5NJBuAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
	b=HN9rrKUX/2SaUYT1203+hU1J4CurWPzd0ia5iP4hVtt3WV5bxYF+fvX+cgVj4WIRuOQE
	 7OunrIiKPcmpG9ZDFob1XP6RptmsFcXH3J17TVp9ylGeu8hN4Vv1kALVTssYdGHGH6wDu
	 WRU1d5MZX2zLzYp0/Dt2u4cRTNYwVDolSFe2qH9rKAmooOhnyU68wv1QOTcgN15NPewKC
	 yJz7DUu3zSxLDFZxPkLNejb9lSya5ek+2PQRflXrHK4w5QedUlUi50i1z0e23EAJ2Lj0T
	 heBQClkgepBwrim/u5GGUeSMvshwN7pA/OAdkuhd/mX2pQkW14zlFOS0fGlfkkZewQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYhklWzV;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAD2606A32E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAD2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYhklWzV
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so4313095c88.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432123; x=1796036923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=NYhklWzVFa6EfONV/VswvwA7Rdk+KRRa+1Ppi9dOVfxxnO6ONCCtVvCV9Fa0jaIgez
         3qyQOKoxOp+nGGCsXHpCSDEMBrgAbdWEmHz781jWAGYqXS3Rad3DfH6UIOHRaam3xaKr
         ZIC6xeoan4KDakRyolQCM+S90cFzwyrVIH6vGUNY/CMlwpofanGGNQNcqPfEiZjM6Osg
         NSAE49kDjc25TZZFzKHxpDM8aemIN8o1tr2tI5Q788T9xeCgjyn5H54frG509qH4iqjX
         TSEGywEVdnSxcGKmIkaDGOBX4iHypo0z45vuHIPjdoF8igDIah2vqzmiyT4xlqdurLC1
         37lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432123; x=1796036923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=1McPAng3sMI7I98azkDzp/rP8G24F/HXq1xjikT1/l8ad22zWexgLcIOvPaCLaAeIV
         BWQye2Kb8hQFk/boPmrVtjkYZoTwpLwGIXXhkEuKesHKf/zNr/d8ck2Uy/PdXQ3BbB+C
         te2L9J95ByYXOt270vQXI8dhQAERy6n3nl9U5KVgj6vAN1sgcZaZhl/MxRIZVShy+WE6
         qM8DKQMTgGTxHPQcZWr0KLxUAurVzcmpX43/ir7w5pskOQl6drHJBa+lfr7mjLiLTrTG
         DY/4Ac4QJd44CbHp8i3tBR63N1O81d6Vx7dfjWv/pfgto5kzdcl4DfgRapR+De6l4uz5
         I+UA==
X-Forwarded-Encrypted: i=1; AL+hErEhOVzD49AyZ0mNWNVf5XYgnGkNa1TZ5gW9G+ZflleHyfTFtad1M7vkwYeYfHEJv6/56Js9gPIebPnY@vger.kernel.org
X-Gm-Message-State: APuU4Z+b+8hCI6xIPm+D362T+NLtTLeOA3Jf1GO/3nmRZMAnwrPZZDPM
	dIsHm8Tw6Eeyqd83uKRJqpT80cax2ypW16L0qU5Ggl5lxf+XcLcAwpHu
X-Gm-Gg: AZFdTZeRR9vaFBQKfMW3ZC02Y/LvZxF3bqtBxkDEzn/40zoPghQ5GVl++e7FFRB6tPQ
	CwiaunT/P8BE8hamgDJ/KVPaxY4PKgh3eUrH9lkB/ZWGXRbh78J37rdk2fJtfvUW/RP4xTuV8jU
	VX9NRPSiYwHsEotfOD2PfKxF/AiiEN8UWdVEriB+9iOe/C2ZY470753fiVPUymeZzGE7zubDtha
	4YYTFyf8/tqPJlqrkZC+J7WMeIy+RuKfg5SowKwYpJbtWf5mGpFic9ULqbNiT89b+Ktl0VrrMGK
	MzPcXQccELCoeOFqT25qj1EdVpzPcgzh7xlidJwBHL5wgGuqfB0B09vx7ia8kzZem3jLbRiQYMG
	RFRyK4hBhzBOyuvZFlwrRuG0qSTT5z4+Ce7r226B9BWrvV1edh9m2DM4oBpAx87vNC2hNL02LAO
	VFYKqw+dBg9YxCN5jPgPhexbCXC9wNh8gmcAXYP/64tNDERwg1UGI6rFgYEHicNwwZ+oIoLQd+b
	5edUjO+38QkLZzLa/5+evegOo2LgHSc1gkcsfmy0t7XRO/5TaY/NQS9ahoSFGH8SpiStcOcdn9a
	bLGkySuwSLVzhkcstY+y2lyjZVDz7trt1Ydl2mDkM7PvpA==
X-Received: by 2002:a05:7022:6985:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b55686d5c1mr14442888c88.10.1795432123328;
        Mon, 23 Nov 2026 03:08:43 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:43 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/6] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Mon, 23 Nov 2026 18:08:03 +0700
Message-ID: <20261123110805.119610-5-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

