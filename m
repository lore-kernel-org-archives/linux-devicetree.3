Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609978;
	b=S9/pByNVWUXBYtbSQt3SzV7XwFgA3xEZnY0sVAocwEkhE9uHpaHyzGC9YM+2iiYXrOhV
	 B1NzpNvqvy8Wk7r1xzpoww0S7tbwnjwHN8PhACLjT+t14kPluJGYyVTf4aXOnKBZ4gdLe
	 OPD3rQiTVlEUmNywHe42qZm4u6VHyWys8447xaP8rceqZoG2nUU/jV5im8pJEYRazWqvc
	 oCS8Fq4C4RNkUEplIko8gdh+d40debOePAljfxSiwEHewOriJ+PXnq6nccPBqsioX0OD3
	 SQAEJrGPq7mKeKbU/HpmjtAjoOpi8CSxT0mRn6BztFpiBu4pcUbOeQrhyyAsxWEflLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
	b=AYMZH+DPgLqUh1SeMuTiZnEPy5GFjVrq7R7Y1WbIqo8FHulzx6+vCUJkqcm5FWJ8qTRf
	 jb5RWiAASW0IJGQuey3mog8UCwHxvEDFwuaret2XryGGtS7b7Q4MlEc4USqPvyVEBBgzi
	 4mVM61CY1fG6JXxP44Cmoy40r5cxCms1tTIO6wqdEfvsrCUhj9AA7WBrBaDphPshcmtnf
	 Fn+zT+NK+0wAsbC2dB3LRiFDKVhl6PkYe4ppw6IbojFHJcAJRk82h2F46Zs5TStWjQXYS
	 Yv2EHq1cj9onKi8K2vJTT9TAWJb6UaB7h2FnXhWcHUAs7dY3rcXuan5jkm1qoZOregQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFw0of7v;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF33606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EF33606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFw0of7v
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b413997581so4469671a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609976; x=1796214776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=wFw0of7vrl/UYupGvwc1d1CRi+/6e/EN7A7sYCP3nbhQDhcX/Y1skD7RavLyQeOkZw
         IRMp5I+hBjc3wKEyhhcFeN6Il1U2Q1C/yjWHMD2alXL1jLUOQFf/DRRnRX3NlbUrx06J
         OUa3C56ISoskjoQ0/6QwwM+nRHd6DOyx6RAJvdsq9zb8gcLroTfWl8PzYO3y0H88uml/
         i9bQVE2mVvsSALntek32xUwl/3q9uOxlPkxXWdzcM3Z1z4fNM6QAYC4qMxk5zu8oE9TH
         uQ6dNPA2xPxvyQCgdrt8xKa4xf3MiLGBV4z4pvCiblpHGsNDb1gBcXeUGm5a9ehwO4jl
         mi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609976; x=1796214776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=NyX1Uvwj0p7y694zKetrceJPiR3wBRV4BXJ9cxH5ayxn3sZ9gcwQ2WCDCgL7HsfRL7
         rr459uIID4QQTWmLuFxuqGYuaPU1lARhRxKlA2AIgs3ErOYwV0ZUDj1zpmyxBDCv12cJ
         MN2pLZ6GGaGYIyi2LP/ePXd8z1h+lj+0XGMHRk5bfAE+eIOldT3CAWcdf2SjURMrQ5i+
         O6MHWUndEZ3BS+bstfe/bfQ+5gCKb8bid/u+iwmWyK9ct9IaLVFejZRV9SlBMIqRbkEp
         vg6jspAXojtsyVueip1om0hENL9mUedz+JRk5A1oMTAligEA4gnG8CG0t23nzbyymiqD
         1RKA==
X-Forwarded-Encrypted: i=1; AL+hErFuvFcFWf0ggpCEE13Wv2PgdCMYd81slNcZ/tO9E0JIJY/Wn3WdnnaY/TKBUyboetkBDLo5kCIWLdBO@vger.kernel.org
X-Gm-Message-State: APuU4Z8GUDcdFfszMXVKyxBQCPoCwDS+yTMJmnxva0zVbVbCyEw3MzDT
	GbfpeFBlBcr/xCK213A8rqch3nX0HeTzJNCRfZ+v6hGGh4ku1xQEyynh
X-Gm-Gg: AZFdTZdf4/7rhc4VYu/+9EIgbvA3RRVdL+UPQxDK8ncZBs5RPzeo8McVDjSV4NEFHxv
	ruLctmsHLfpnUqzINDorzXUMm624hD16/kTtseEimrMzz2QPem2v/pamVsfEU5E990i0xVCrD5+
	Bx6SAzxotOysHf10gX1816qydh0q+Ja4b3toAhmoe6a5KAxLoeilVR4En+SjcQajVHp+xy63fmR
	NU/KAnvZVWYBRU+trG2SFtqRWnmdazR/pbV5GE0/nnUeTrU2S+Wt05hqX+WMV2SuSGLW6ordMp/
	TbL29LJrzg/sQir7yXN9t9ZaF5QWgEo0Zi5nlb50XEreGfGUwu4mf1yNKWcgYELtkyBaVTSybut
	WDP1xXidkMnPJxUHXzoWQPqKr9z8ESe8E+1+hjWyDpuEjhcicwtYUmapxJ/Ht7HquM7/nLrYueu
	5Sm/0Dmr6l+osAod/T2HinRl7fnemhxLb7TGiGBkmsrf26BePWOfqH5T7P3hg5bw2l4Waksob9H
	FEVSR2jnk5aH9Zw9LDmBqX4NTy0k2R/1jnJZKZcHC8/V2lAYo6VR2cVoAX1ZLSHtYnKPhtSwpRE
	BAQmOcWZHdNHZJSoP0oos2T6Voo2xDz0oj4ZEBsFv8rhuZ5V
X-Received: by 2002:a17:90a:ec88:b0:3b1:3e7a:6d8e with SMTP id 98e67ed59e1d1-3b41c8e0c73mr14764645a91.10.1795609976464;
        Wed, 25 Nov 2026 04:32:56 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:56 -0800 (PST)
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
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Wed, 25 Nov 2026 19:31:43 +0700
Message-ID: <20261125123146.379057-5-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..f27c304843ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov12a10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+  powerdown-gpios:
+    description: Active-low power-down GPIO.
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
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
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
+            powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vreg_cam_avdd>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

