Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447693;
	b=ZiMJ3l+XHTWV6GhzLiAzXef6YBDi2EXjeCG1Q8A30CeKlgI3iD/1OjnT6YUvJzsKLK1q
	 hRkEd3/VmjYc/2rHqAN6evT7vOL4mmrq4aHpLKf/ark2PX0ltMnGLmOC7YOVtSJWj0oyL
	 l0bhZLsaHnPoGHKFGDwq3kK8bQO2HDmWLPXItnAU20wXBC84HF7TM3Hxez0BqjeUdTGg0
	 9ZgQEgtzme7rc9OyYmoaV+XwRnPFNRc/COE5gfwASMJIEUW9qzLtaafbb53+Bk6ABn2pl
	 YOXPPHTQeC9wsGDOhhjqOXwY3+ypicCehC82gY4i6m68GoZADEjwLpu22RZfPTEGoDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
	b=l+KUP61EgqvKwdOtNIk6ayCUn8U0oSt2m//4qYpWU0lhZj+z8vk82yqMPeU9TN/iWv4x
	 Yse6+Wi6wgOl4jt9TrEhpyPr/SCuFhV9wXsuGPTag1qucU17x5vVO9DjdQXjUbuulSSgU
	 hnUnuYWqqcWjn+YJ/uY+n+NXc4YmDSQ6ysMuvkZXlLAhkGlzjWndvOIM00LNQ36+tFZBH
	 gXMYrQA0rvjUC+vSkQUocrcvLtQpd9yTj/YVevagc1lEJ2q9MFHYYLB9q/dK8rwlkCJwg
	 5rwPFgSsfzsTiladx77c1m4HeOr/KkMPk/9Su6qNPaYnmyNX7syW3NjLRj2wUwioIjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuKkteo1;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7A606A336
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFD7A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuKkteo1
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a315ed211so4367726eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447692; x=1796052492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
        b=fuKkteo1U3dppxRP2dfHZJlaJGXVfzk7FUDnXt8LXhm8fvRhvljLUCN7f18PvukRPU
         WWDpbqYrzmrS5+PO9OZTwcY/Y+zcoZbDol2fisOndc8AkOhk4n63tiyyp8khhsZbSFYz
         Uk20qp+Ms6uRkWeEuv1pAZOzSg8x3zA0PNd6YMcfxGvwxLCQar58MFTeiqu5hvr94TaH
         P0p1/W7tMLT7DLuBxYK6tVAoIIeP2XxRCOXdyHU6uJwrTVyiDpqMLFS7Y+hAnrJO2pKR
         LOU3lWmb0cQJnm9tz32aC3NKKysBMksBDm66doIzP+z2/Ai9KT/lYg6QBoD3jW11k27I
         uE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447692; x=1796052492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
        b=pXrfOUwpx8z+2i9pcAGEeat3WyxeJX1Ku03EI30H2vT2pBqsjOy05+6IVvHuvf8rD0
         W9KdalZ62wY0m9K8dytzBF9YTiKnCYTJzYQQS3pHv4EGcTlxoA6VG2FMyglzMA4KXpcF
         ai67nfx2K2y4YtE7cM5Tqqx9+BQS+IDnqJkAbKNwAu+onrDdFfZKFr5eXdk3lm8TZAGc
         q9dv0dP1nU60nO8lHlE9Z1ruwDb4Mr/sMwwjttwCyrbakkEBpygd9A7gupW1m2K80BPP
         PklDQBuUZ0x12f6IzEDv0npGTIWwROZhxouAs4EOm05ZaoAC/pMs3bM9eqZGYrz2miHB
         XN+A==
X-Forwarded-Encrypted: i=1; AL+hErGaCpsjrDqodz/FB0qodyhxzN/80jAwbzvW8FU8tJ/BJ4IKDWtI+rKD+iGyMyBahtDxINFg31bT7FDR@vger.kernel.org
X-Gm-Message-State: APuU4Z+MGyW+dj+DHpxjlfghqynLHFi+ULma/AxN7a/Kpo8cEZC7pSwk
	6B4rJowFKxiemj00c5a8uKbec7eb8ItWAuPBuvVy0cig55qn1wqBGf31
X-Gm-Gg: AZFdTZdp8VRrKRoBoC/8RZajVs0gQ4R/enF2atCeTseARNMZk1RStwLaiNtFiaLZnHl
	yNPauwlZuzJHmvMtWCvtcasFC9q8ohIqYjyHUTKhjBI+ZbKH4icRJwmjsWPXcjhoMU4ueBMLzGN
	LLxJVSTrphqE6SVm1IEUMkq0SYb59uRJH0s9noTT2Q1nQa4NxyYeVTbGA5JI5HwGCXm+3ZIFmc7
	euk+kd0d8c5sAMtBySKZXCOmLBed88xQNZPsLtA7JlXQJbxZL6v1oOcakewksunJxknqyy9IY6B
	S0Cq3ksNIG35O+7/WGw7WE26UbGEgvqTtMJJfIz3c96IJVDS4LkJWL3U5k//eqz7GtSt1VB2tzv
	VB9E0dWHY+wOynlmoQ/7n9SQGAE7ZaO93mErJvx0acXPZSouZ8HX5H7PXyPWb4cRIxXYeuOR77u
	g7domMznngWodG0G8jmbhaPS1/7nMIFgj6fYQN4s8HmIdMfyRHQ3mJZCQnE76ZnZrMacaoUQpT8
	lbMVEZYzefABLDCt0SV9IyCllMFMULpoyXOQztlXH3L0+5VpyfESSgXCjcF4fko/oClCIrWsTSY
	DE98npE6DybNxeVuunTL4HlLDwVGg576yQH6MAbwaq5vxQ==
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10401298eec.18.1795447691706;
        Mon, 23 Nov 2026 07:28:11 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:11 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 22:27:17 +0700
Message-ID: <20261123152722.168879-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..7c538e48ca25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+              - const: 1
+              - const: 2
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
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

