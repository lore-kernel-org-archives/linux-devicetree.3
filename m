Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E096E37F014
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 16:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475649; cv=none; b=ebuJTF0F7ek1vTZyLXmR/SvVXtb19dVum6W8jTZAber09JE5Uds0Pq9MRPlCZ7SzTu94h+DwT8AZk9Wd59NyNqs8eczB1D316tW0g4//RkCxRwKOXc2vyHxGBiSJy2CFoXyKDO+aTRlWhefV0KqcduTZ/AiHL+dkirbp2fINV4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475649; c=relaxed/simple;
	bh=7E7DSvgn4qLmOdZ3lWP5QwpNs4x2bTOEpyknYM7UBfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cQkMXVVzYYuidyMVw6VlwcIsX/GlsqrY52Hyu4VaKAd7/jqWYkTDSrns1I7oUY/RSOmCUyvtgm6/raeJMkJXMqNbxF69/V7Bquxl5FQBkX7LHzjzf/JQAnTGgtP4EcJtgtJpXnVMRorCLO4Au6A2NE/1Z+OELGBOwT5RbZRKaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=1QkNScEv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="1QkNScEv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a80e169311so2287445a91.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1791475647; x=1792080447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmqwWJuyHZKqJh8/E5ury/uA0LoapioMeafuxzI7o0w=;
        b=1QkNScEv+YeBqi+uDefENIn5pK5FDrW1kozZv5F2eu6ALvrZV13iKc8ZoZvhBYoDx9
         uSd7eDlqTpvdk4zp80Hzz6RsfXxjZh5Bjy4sd5s2r350WT13yShGt4TGbJ47++5kWn/i
         oLa3bNJ2ZNHj3DFA84Rx3mV+4YW5pvssGWSelwT1yMDt5IBLWeAMCBLeLi/yAfG62c73
         6FMEZVJnKSZKL4b3NiN4EKdA6lgkVHUSKfq0t6YnRcrR7OjB/mrmJyUs+iVoVW30W1+b
         D3dMg1x7NGfQtzRwbjIbKVIzPyS+bKgZVV6QY4bmegCUN8eCmTyJNKMN5rGQhGVnv919
         oKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475647; x=1792080447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmqwWJuyHZKqJh8/E5ury/uA0LoapioMeafuxzI7o0w=;
        b=Q2N3MWM15gpFXfJpC1y7baalGjp57qMsjEwrz2WrYOzgaF7TTXeaQGkNaSF62jgiSN
         Mkba9bmAmeAOe8X0H5/kBiIIwnsjIgWWZYVPfkH8temoXrE34j2F+taL9vbEqwTHXoJ0
         mJ7XcUJN1Aat2WvfgFbwJTyCnnWcyvEXoL56QdmRw28U1asa+e3miUcq+g3PQanQRNJJ
         Z122nNG7OhZpbj3r8Bf9tkvmAMCwxrl09ys0AkhsHCV2p1d/ezacPRk0uf5KZE9nPHGS
         PQR9Hf+1nPpTkiyiT1ZJQtKzXdxzuJjrupXQIp/eTrvqHRqNnZVzfe0uJQiRdOeGlQJz
         r+Uw==
X-Forwarded-Encrypted: i=1; AKwUvBw8YaWy1e0jTkJ4H2LHGFfmFPCcPtAw6NXsL3z/QW9/GWRrwKrCawaOv5zJ8107Cus3Rh7W/3sqL2vM@vger.kernel.org
X-Gm-Message-State: AFq9FYLbxYtaawg/FWGrhgWGzrLoWb/Iq83cSXNCwJna+vaY+7kitzP3
	Aqx4Y6Dd86QBByGm7079aqPADa30q8ld2qQFiBglZoYHsBPHqNaqVt9Fchk6j/wQ+iBg
X-Gm-Gg: AYBFou38tGRkTjOpiG6dg23kFZzN9swncSg5xM6a9yjUhWXhSl1fKIiqEw4CkJr3j/U
	ZxVFiuiawHeSJaf+h02ND3IqnuF/sOs8Wq41nUWeJiC4Eo3rfEb6loVT6579GXt2alJJXyqRwu1
	VWJ9hLMxTyymr7cQ0yI0m7mP/vMJxwxZL5bH5xD4QkdamAgeivrTmPB0Gb/eSvARnnThoX5dDTo
	sxLmBUDqc4TG4H3vin1ZUE4ixIDa4qQBl6Xb007Sp9WzUclUhNPQ7PLY2bufbpbe9to/y4clt6/
	gEARMJp2AO1ExEsB6CmrR5ZrK/n141ZULurvesPrLCyAVPId9GzyljtUKtCIO7INeA2Lo78HOvG
	GnmMsGNu9U1bEuqBgLnNoX1aNT5wn1u6dvepqDf9hFn95msq/aDia0OAUC8zczMQmZJagAKOd6/
	un7Biahceez2mSC+4O6nwVN2+9+o0DcTw9Ws6RDxkId7hDwhLU1yMhlFJJvu1TfN0upPah1MQxJ
	MdGhlYS
X-Received: by 2002:a17:90b:3b4a:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3a89f674ce1mr4498641a91.4.1791475647213;
        Thu, 08 Oct 2026 09:07:27 -0700 (PDT)
Received: from ltu.. ([116.101.18.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9d94ef876sm4724657a91.0.2026.10.08.09.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:07:26 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Hans Verkuil <hverkuil@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OV3660 image sensor
Date: Thu,  8 Oct 2026 23:06:49 +0700
Message-Id: <20261008160650.73927-2-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008160650.73927-1-tien.nguyenminh@embeddedlinux.blog>
References: <20261008160650.73927-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the OmniVision OV3660, a 1/5" 3 megapixel CMOS image
sensor with an image signal processor and a parallel (DVP) output.

Its 1.5 V core can come from an internal regulator, so the DVDD supply
is optional. The endpoint gives the bus width, the sync and pixel clock
polarities, and the pixel clock frequencies the board can take.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../bindings/media/i2c/ovti,ov3660.yaml       | 121 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov3660.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov3660.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov3660.yaml
new file mode 100644
index 0000000000..f19dda1f71
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov3660.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov3660.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV3660 Image Sensor
+
+maintainers:
+  - Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
+
+description:
+  The OmniVision OV3660 is a 1/5" 3 megapixel (2048x1536) CMOS image sensor
+  with an image signal processor and a parallel (DVP) output. It is
+  controlled over SCCB (I2C) and has an internal 1.5 V regulator for its
+  digital core.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov3660
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: XVCLK input clock (6 - 27 MHz)
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog voltage supply, 2.8 volts
+
+  dovdd-supply:
+    description: Digital I/O voltage supply, 1.8 or 2.8 volts
+
+  dvdd-supply:
+    description:
+      Digital core voltage supply, 1.5 volts. Not needed when the internal
+      regulator is used.
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the PWDN pin, if any.
+
+  reset-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the RESETB pin, if any.
+
+  port:
+    description: Parallel output port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            enum: [8, 10]
+
+          data-shift:
+            enum: [0, 2]
+
+          pclk-sample:
+            enum: [0, 1]
+
+        required:
+          - bus-width
+          - hsync-active
+          - vsync-active
+          - pclk-sample
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
+        camera@3c {
+            compatible = "ovti,ov3660";
+            reg = <0x3c>;
+            clocks = <&camera_clk>;
+            avdd-supply = <&reg_2v8>;
+            dovdd-supply = <&reg_2v8>;
+            powerdown-gpios = <&gpio 5 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 6 GPIO_ACTIVE_LOW>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&parallel_from_ov3660>;
+                    bus-width = <8>;
+                    data-shift = <2>; /* D[9:2] */
+                    hsync-active = <1>;
+                    vsync-active = <0>;
+                    pclk-sample = <1>;
+                    link-frequencies = /bits/ 64 <54000000 108000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6bdc32e7c8..da86107263 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20280,6 +20280,12 @@ S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov2740.c
 
+OMNIVISION OV3660 SENSOR DRIVER
+M:	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov3660.yaml
+
 OMNIVISION OV4689 SENSOR DRIVER
 M:	Mikhail Rudenko <mike.rudenko@gmail.com>
 L:	linux-media@vger.kernel.org
-- 
2.34.1

