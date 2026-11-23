Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447709;
	b=aOij9l5h/am0FkyFbpbZ2lISQv/JfMLS/nH6b6kBHavI0F3s3hocMPjQdSiMbrpLxL3L
	 O9rXMk53LROA4kfqtayIrlhan/OKTNx7YNDa+RAqZ85+LOsDcgO1/Yfg27pIeDooh2c5d
	 CC+dZB8H4dLsbdsfL19WVoG4bpQLtg2bTnbOmMAMWWTis3Q+jAf6aNiC7ybzu5XmPFgMN
	 T7N7g53i5+TTBaPpMa90mmAWDRUZBmLi87QFXZJmGoSBJxBvhqnXV+YBj9/LS2iPK4+62
	 8Uy6N2TLXsmY3sXTcbLPyCLqeR/MCkfZrzTBaFqTjYvvXYn2lris9y0CZ2Y+48zoV2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qdgqu3QCXJCp7CIEEJ8Efs+J1m9HLn7osT77U3P/bgg=;
	b=OZqZgxva3GPLH1LvDz8fgvO9TSUyVgLSH94T+1IdbchpRyscfznfqzM3UnesFb9rpMAx
	 CkMoPjvkNtPhmdMMbgegSud6Omwgy5LqUl7airCiKDeNCcVlPitjma99LzQLiEIAFlt6n
	 rfvIhY/Wn1GeBUF+0oOPfJ7GfIJZ9QFz3dqGZslITA3ywk0QhC+hKeru4GPqQqiQVYzOA
	 Vz4QN8VqbpOHtuHunRWjmbbUAQSGjOQ93MNDbtXlOnNwASG37l/DSd7u6HQvUlf/9FgFK
	 WeIJIBJBLYJv4WyFizJYpOGdIj60xtQH/DwIetMYJlPMvMj/s/IH7GmIEmPfMMYK/aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZnRq9zd;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A5E606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A5E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZnRq9zd
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so10248369eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447707; x=1796052507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdgqu3QCXJCp7CIEEJ8Efs+J1m9HLn7osT77U3P/bgg=;
        b=oZnRq9zdypvS2DwG1Ss0TUrzwJ9aSvyFrAgZKobCk09IPnQ3+hbgssNi1b+88s6HQA
         gY4Db2K6ktxzb9MAmtjTkyYyl0T/RlXH2j+447Yoto8My11eO2L3dYutkdZyglh4lqrS
         eYoMzqXw8RXTLxmVBlFrWLynCxPgbvddL0jhkkPYuLsGmpr4QFhKcHPkTlOLEDJijtKz
         YwT8bHlo0d+Dz7pZXD49rP+dCkUE8WPMXhjo8/qFjdX6OIgTgcin7yJi7s5I0/LXUUu5
         sLT+vjPyhTTqkf5sJIueIN2yL11f1kajYwmftMAFy12vDLalFr+BeofwB9Cfr+291A5X
         DnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447707; x=1796052507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qdgqu3QCXJCp7CIEEJ8Efs+J1m9HLn7osT77U3P/bgg=;
        b=yfDpvk14+dEqTThv7Wlpy6wTEZkO+XERDUiI8vnRwhAAiRTsr+OVsmyJVPj/HsyQnI
         t6MpMxvPshUcNlHMqLL3hfUebtdcOJq6ZnFfs4z0X7E3DkWYeERQN90RYJ7YfQKX4Wg3
         LBtMfk0iC4HtYrzrrQcPUFmumYTtgzKT4MyxoUu4LlnyTBTOPpUhGiLqsUOY+J1bvcbg
         kbR6V6jjYW7g2tAPdyNB/rmi5cmJOZZIXLqfnuRCOXBgIaOImrYUT3dtS/EJIKiHxStR
         /LZDQ3gjhGCRzww1FkwqQjk4eQm6mAk9y1kugQ5cp0yrUU6FsrUe7yWlPClY5dHeaiDd
         pFRw==
X-Forwarded-Encrypted: i=1; AL+hErF+2cMCTvaACzb8n/MjLyqNJzr7Os0URz7e1rIv4+WOPyiX5GEMtU2IJEeLAwODGvjyvSHchUZwmVcp@vger.kernel.org
X-Gm-Message-State: APuU4Z9TxdbMaKm9IrVBdvvx2A/XR1Ax59iF7i4oxxtxZL1rGlbCNM5u
	gZWhAanIyn8ujskicPhKsYTE9VtGK4m+jJaguey7xme9ZBWc533Uff0I
X-Gm-Gg: AZFdTZc+d9s9fMVnKSFiQqe+1YuXNY+5zUjtLdz1kQuW5rTnFddjziXreOsYC3MU39g
	ZMBj/ukB6kA9ZS4R3QqBj5GyNDP3Z/sOhn+uwDWvbztN9sT0oW1VKmDmL0AlMHd/cbaALfwNFCm
	nDwH4wyD0L0jWGAOGgfGmwwK+YPKZyGqzI3NRyq8R0gOsTzkcpvP1Xk/0BsuotCZ7ojH9eKTB7u
	s+hhqD3fP2qCLw3TfbFAXV1XNnle4n9K6QlGI/nsISZZch9PwdF9n0TyR/2kbfaLbtpOr7cxZAF
	0XDEeNqTGfYLdS2Gbc7choXHHEtU+EkItwNAp96S7TJqg9VskXWH5IVtDwH2J3iGN1uRk4gk2Q2
	zuZ8/cvtbsCc2XWo6+9hHjl3X/y/u8qpLBrdx+uZP8EHH9HJeKGWg9JSI33XOFa0mgZ2hzRaCma
	rDMElOCBAR2SUEMAoOoi59BrIukKr2D+ntR2UtrMAPg0yUwiST5xIFEIJl9jvW80eZIIVhNTD4S
	wHwNxv5+8Yui9oiBxTw4JVj02hBnQFa/VOPG0dv2GAt0QfHgRkQ4IUIRGN2MyiRcIVZAK0FHLvU
	tB74SBlOC7y/3TSYwnNBh8WYAS5w0elTKa2FA7sEPx5qcMs=
X-Received: by 2002:a05:693c:8859:b0:386:b826:3f9 with SMTP id 5a478bee46e88-386b82605b9mr1528240eec.7.1795447707306;
        Mon, 23 Nov 2026 07:28:27 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:26 -0800 (PST)
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
Subject: [PATCH v3 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Mon, 23 Nov 2026 22:27:19 +0700
Message-ID: <20261123152722.168879-5-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel MIPI CSI-2 CMOS image sensor.

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

