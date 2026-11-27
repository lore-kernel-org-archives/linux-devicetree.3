Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787141;
	b=1OC+fdctXKGxFtVTBLw4iHPJe/7nFSk8AyU/y75FCv7B1F2ipHGkNuvScNV26gJK0d48
	 SliAEtz/PI/Wx84v+8z531D8BZWmmOPhhZOhlgBL2ueB4An3wWiOIl0sWXzTG7byjpEFb
	 LkedydvPUJfXtKDLL4isanq3s+f/B7GWzZDf/T5qvxNLDngkUFzC9x4XiYvptUEWigGvE
	 R5TRoNo81xQ5ZGsHVL1V21RTmbo2hYIgaU+sbHXljdUgnG5lDbknEU2+ldep5teYm02c0
	 B4XOVepRw0N+55ZOJYW35qYH8SChxF4JVXlQYoO9zO30ZLBwOsD2d8hTABNrROweTUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
	b=gT5Ep5f5wtWyX43V5GBbzD5zxrHW70sg1wQrOFjBrBexV7qBNU4A3ak83EijKJmyWeV0
	 5mvJA8ybM+9KdxmO23H2YhgfUDb8O0H8RL0DmDRvk7sI2d22xEvZzzPx4D9s9xBBMkqoA
	 jqynxAJsGYL2nyvGiprla9vkVwzlsMCxpuCVWFEocD6Rsg0YwJp+eTmIO64Cn1hTMCTO3
	 6j8Lt2uo27+b1RcPHoEZ3OUtC2Uco2WCn9hdmFC+HFprc0gEAoP6KqC8OTKH1mFEMekCU
	 Thf9r2K3+zxg/Ir8X35luI4Tc6srS5FGO5kcY1HRFyaScpyS7Yf3GDNqQ4dpZp/BXhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqWC59HF;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5500606A32A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5500606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqWC59HF
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f05bc71e01so34194065ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787140; x=1796391940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=zqWC59HFBxeqnkwiJcA/vmF7PXqaSn4cPlghUfmvZNV5G3RaxpsuHbuhncRjcKUvVL
         RgVWQMgdXN58QHoMug3raBl6dLYdDukfKBAcgyeL28e2BM5cL5Hxg45qmG4jBDawc7S7
         lAEjzMp0sak/BpEjHW6drFOVkxWkD/DpzpIzeKtu6KfB+8s94kiR9T6TxqTYjNvoZOVW
         uloDbZg5rFJzZY5VgoLAdc+uiTL38cnKFgWeKaB+TMTTtan+bHjkFDVKszaB2FV/MKDt
         qUJrHVLE83u4ZrxeAcFD4bNulHhzew7Ez/XbUGlvtHVKZZZmkem3K3rPoh5EatDDP2EL
         X1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787140; x=1796391940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=ZSDhIndB9cMkJyVqOHuGlVLCWsn2J4X1o8RLPouRSWSE9Pgh58Ge0JpUQT2j+u2Frx
         6QwDNPuyEmAOcNWzgOI0Zczp4J+cAG9oaqNYE8bkRp/qEoCAAsesdg43L4/3uB4i4ki5
         X9jOAF1Yoqvp9udsAkZdjCc4u+ueHD3T043TNK7zIILhA/F2StDCX279lFH7yEJHonyV
         ydbLWBuJIpZsA7Hm+QeBvgkRZ7bQJP3fNm/tVHY4QtKnpI16FQT7uZtd9HfeMC+iX5P5
         Tir/Iiq8PbK9VvwHtC7tOsbQIRlynAGM/ox92i2lxHIuH3U1Fe8cym5fYCF1MbupRUdU
         xnyQ==
X-Forwarded-Encrypted: i=1; AL+hErH10ttuM0xoEbQwy2lY12nrYK4ewlfJvzlEM84PwpYN8HR8TtOOD7DvaP7v6z/TnpYtaNn/fedBpMIo@vger.kernel.org
X-Gm-Message-State: APuU4Z/JFATz0O6cglSAwdLGqXmOSBMymnG2aCIIaFXXs+i5kJ/srwKt
	Uuumq5DajlnmG8isr0E2ntbACqmPeW6yYFlWt9KT4npJ14fKo10tr28v
X-Gm-Gg: AZFdTZeufF3od5q1/qjPIquUGgktuF2EoqO5S//qTFk42qSZfUsmlCsL+2DpFg+zqDO
	5bdRt1C33giNhOW2VgbUrhWnW18DDFzqOeSXQGC5QKYhB7jMWQhsMpIdlFQN9zrS+AQYMoYCtdd
	ARuC9kgz8yzgrtzFmOky82CKP4esA70tfjKCz0p80vq+hD1+HuGXTPD3kfO8L/u9cJT/Wyc+qPD
	eVRbgSmVJ9uQZDzwuD+NjXErLyKNbsLBHEqpjXaZM73YKMiTjitnC/GiL+YE3yTEIT87Nu5FS7G
	FWsaXGx4pjKgRRdR8uFfDqt2tvXOh+QGjE3Dbgh381jpZUCOV3hgoyKSz8uKg/2SfybG61X6ECR
	CYm/tS7eaH+65o9AqhrV3+Zk5yiM2rzn0SO28g/FnfLEnbFgDsxEVIURQdfx9qwZct5sq1QAFuF
	us5/bpqgY7W5Phc//UNa1YU7ZY/+IFv4kMV4cLZhedGKbBeIEujZvis6fkO8fGmiEBOAfKRu4F7
	iW6xByHMPO0BVjMKIYxctcWfvvuVgrXwVn/0yr6erJN3SmAjA5+jAs2z30PgDHB1OwVOxoRJRuC
	0vGz/78n2j3m5YECuu+U69G0VMKOcJCRlliwilDlNSlCrw==
X-Received: by 2002:a17:902:d2cf:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2f03ef3d3b0mr270576165ad.2.1795787140051;
        Fri, 27 Nov 2026 05:45:40 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:39 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Fri, 27 Nov 2026 20:45:02 +0700
Message-ID: <20261127134507.125513-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel

MIPI CSI-2 CMOS image sensor.

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

