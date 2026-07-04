Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8182DEA64
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783152590; cv=none; b=fKeZErMvKF2vw2p2z5NNjjEDWUo3tj23kTViPJb4vQHqoXQ8SjZbdIT164XQfJbiaGbSmcrK4XjrLmbU5HojNV4PLQmtig+0HKDHE5Y3eJvU/ZiqNzDAYlqHeTSAYm9+Hq4Joh/AdgCllcKQVIquB548C6nHE7eAcMsI/bPRNC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783152590; c=relaxed/simple;
	bh=5LuFjwdYAhdjR/uvTXbLXSAIcRKKKjHfDvp6/cxGefo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EiCOk8/PeNHynKHbXLS0rtKCUNu0qtoqukFg8/xxs2EbDBZt5DOtmvlxtHToUDeUJqFAInLgQYSfr4xoU9VSJvtTuV9RQy2SFMQRtTLaMF5DolMNhuJNWDSFAQWpSmGvz8BSqZTSj03GzB6eO8uYOCVyjV0kcu0qaf/1LYTP0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vx230uhn; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vx230uhn"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4728c12ba97so745615f8f.0
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 01:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783152585; x=1783757385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nV/B8hZtMepwD+PMiYNg4MREiS1D+m5zq5m6OKaCARw=;
        b=Vx230uhnYSGMsD+s3QEhoTgPYE+ZkC1mzKnbZ3igZooqbg6kqpcZjPDs8rt1np9lVI
         SD1716pW9RDtuyLIoRByeUQdV02/28gITl3Invl3UMJTJu/ylsNRE8muLtuoGAqsgn4n
         zWxZjM4DW1acDUFHlJRYVcrqE2JyVfvBQ8I6n1bpIMTkNY9wAMPWu5XIxb4xdKOSpSpq
         Sfwk5woaTyoEHFZY6nyzsNzcNvZob1FkmvGXn9+qWp1soOGwen7Dogr8GJwwlAlK+99t
         RLlOZ2eOXkDRolTWLBwvk0gtE8P3bi26cYK/5fxlE4x2OaoqsB06XsWRoS9HUHTK1VrC
         VzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783152585; x=1783757385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nV/B8hZtMepwD+PMiYNg4MREiS1D+m5zq5m6OKaCARw=;
        b=bPi6GY79SK0y714TmA8HzEhylR+jxGoeIB3UdtrfzUPN88uR1dDRNONver6pi4r3l0
         3Jaq3wchDjENtf8Kfgi1JzhzZyGwDeSTrKLSRoSpFfpkt5hZ4aP5LZUul2LRn0zmebx0
         IwBx+E7KWcxMsmEtOP3hW+0fPmkGnZtIISR0BI73x8EcNl2QmvmQVYNBDloY0dBg4WGx
         kxO0YgPcWmumpsFpAwe8E88wjgglyVezgwSdO9pANafVDsnGMN44x6TzoTwrMJgm1EKE
         6OP8cIfj9mcNXusKOxbAZmgn+6ZXPGpW4wbgGPN1Hrhb7CjkqqsN40mPOzmzPt783Glu
         TjVw==
X-Forwarded-Encrypted: i=1; AHgh+RrFCxDyGzRZAHeQU5yKVHn5lbE16J8x8TnKqDPOM5VMTfLLzjXupU62rRizM+W24FYT/1gAH5SgrWC8@vger.kernel.org
X-Gm-Message-State: AOJu0YzeK8g86Psu0G6EPYbeuWVoS/v7jUdyP5kIU3ZafUwcav/BNiyH
	/atZVDME7K/WwmCzuv3hU1NDHbU0ovICyTvIELG2onTmbvGf43NU0UkM
X-Gm-Gg: AfdE7clfFrNf+4AKmYd6Rzg7G4fVXx9JAdzGBVcDl10zHZq0RbJh/sg9NQ8By+x5FVL
	zaztxUovrJn5KJl/b6cILDgKixSCh4Crwxed0gNIwkM+XOlyqTGy900+JBgewnSEUkaCOA1TxsI
	OnK7/jOQwjnplwhz+zPlGLfhBbvVUyh+xBKA65Zinr0vZmNVicaiMEC1eAEmvTdovoZnxjIQwLB
	XzmVIM63n6JGZ+FHD2xR2PDYoO8pSXMnwB23V5Xib/iebZPN0Ek0lwDEhjd9dHmEmSjLYSiRlqx
	0GWTm1Olhuuo8v07kKf9+gP1qwdC3vGANEB9tjYJpFOZ769hP1L16WiNfnuPfhWtxdpHD43a3Cn
	AYO/Yj3IeZXx7Ii8UcJnkidfId2Y6ck4kxUieR/VV7eIrzlClnvPNyH55tg2wWEYScqSAFxjrKh
	I7r7BbyFLbAS2Nq970LCIRaqpKB3Q=
X-Received: by 2002:a05:6000:2283:b0:46a:168c:3795 with SMTP id ffacd0b85a97d-47aa9b77caamr3073043f8f.16.1783152585397;
        Sat, 04 Jul 2026 01:09:45 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm6143055f8f.26.2026.07.04.01.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:09:44 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Barzilai <amit.barzilai22@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: display: Add Solomon SSD1351 OLED controller
Date: Sat,  4 Jul 2026 11:09:23 +0300
Message-ID: <20260704080925.75113-2-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260704080925.75113-1-amit.barzilai22@gmail.com>
References: <20260704080925.75113-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
RGB OLED display controller driven over a 4-wire SPI bus. The binding
builds on the shared solomon,ssd-common.yaml properties already used by
the other Solomon display controllers.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/solomon,ssd1351.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
new file mode 100644
index 000000000000..80850c2ab5b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd1351.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD1351 OLED Display Controller
+
+maintainers:
+  - Amit Barzilai <amit.barzilai22@gmail.com>
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1351
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        oled@0 {
+            compatible = "solomon,ssd1351";
+            reg = <0x0>;
+            reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+            dc-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+            spi-max-frequency = <10000000>;
+        };
+    };
-- 
2.54.0

