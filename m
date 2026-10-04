Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B2322370A
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131499; cv=none; b=FjBE/wMQr6AZuq3n1PxdXNAPrLqrke7GLi28rIt+9831V5daTqZUcQBl6fKFvVvKES5FFH4BI/aQsZ80m+4h+EMoTPMdlnBQ/xEUVpq6P66lnyK9XLtFBzaLAwBoXoCt+7E4gWVKMPM/MQ0RvcDK0VjHSTIxmFf8b3rWBU8NqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131499; c=relaxed/simple;
	bh=Ms3kQzZFSAV0sF2Y4NJYiyIxnkk9I6e6pJVoEQlBmMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYpnYphb+OtOrXFe1yV0fYYNO++pINic6aFDjV12RZPP+VAUVuBl5BrQXFLRTUoT0Eu1ui+NvyMEokf6A7B4+kdBWCp5+YmCZ3d0XPxbynbaM8D/+qhRynTyWUY5R6aW3j7JG2JZ/TZjeCvpZu/cHR51nGL/GVRLVTCZSd8JPfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTTxlYyJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTTxlYyJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so7084095e9.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131496; x=1791736296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrA01rti7Ay/Y5eHy2dsofO3a17OwFZMN974VKrytcs=;
        b=ZTTxlYyJkZPuArJvKwkUvk7OhRg5LhfT8GujqvAB0OeRUcidYfIltltxXzDbU/I4tC
         vOXt3WyDGS31WcrryQ/waqDnhGQ7e93IWoOgDjgdiikniObChgYEy1r7SMpFkj/g3d1H
         bC4ZnfGGx7xHvIsGG9yUAHD+wrDL4gUkq6hLe0wrIJS2OrH5IcQl+77XUARujZj54IAx
         UkzzkA1plorzkiMKIIJgIeD84EZdfdScGnQZ0qB73fSUdPEvHhk7RZyVSYPGNG9vzYFW
         uUnjETo9jAAh91D2MlcvCLlwJxsU2WfRr9cEKA5f073gsKR0f8wTX09jti0C784yQ0HT
         gqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131496; x=1791736296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrA01rti7Ay/Y5eHy2dsofO3a17OwFZMN974VKrytcs=;
        b=nJvfjNuIDuyXSgER+v/sDSZ/HxPhH0bARcsoD4Mt5jAQxp1kaaaR7xce6ixc65eaNc
         0cbvx+sA9PQc8sj+OI7JxHZzt7zBCRQCcHP2D2g1cN2dYWQbBQ0fkjLBdrWNvft7yTxU
         25yY/oS5yBBmQcrWX5j3IVe+z213ovGrSGGN9/WzVKfo4UXEpZjQhaqGTQKiOFP2ThfQ
         khvIskLVc3bJSAzuwQ14zqDI8SbCkQ41G7ws5B+belVuChsAeOhK2pnXZrMlgb4FEFBl
         cwyafv2e2dopQPbGaZOg3nf0EhmSetcoN4cHq6QHw0JXbdlypKdG/FfOAy57zUqYDdJn
         pSxA==
X-Forwarded-Encrypted: i=1; AKwUvBx6EdRBDD9vfmpXHJhBRIQ0UqjZPSgjHoR+Y/ek80kUZvQUfe24Jjjn76RkmZY1kDZP6WNaoBxPJ2YK@vger.kernel.org
X-Gm-Message-State: AFuF++k27+GekPtMbwV+88x03IdwJ5OasN5oDFeDaPqLdlCi4zL+RdMg
	epHzIdQYHu9UpK0Xz9qhp78JvIWbJLf8GiliLNNol8vzl+1/MYI7h2vi
X-Gm-Gg: AYBFou0TRQDAXJ9pDN9aiHcKVU4fDblGfK2ZNOrkR23H28Qbcejqq7PjUO0uVfvGbHU
	LOj56uTc7EWeQK+4JijRXP8nAasLs5mLi9CtiQ2fESsDBZv1KGwW0UYKtW2jS+ZZf51YqZjjbjA
	Nrq5sNrCpr04935EvX3Yj/DjABS2Q2wWP00vi5xQWCgV66U9e7Bbe/k/U2x2z8PCai2Wh0GNjnQ
	GJ+/H8n5GIXECNbrx/dnXTOpTfMA3msF4aHTOc40dvYaeRKSUYLdZ/ZopxSULgnoGzcrKu9+UYc
	2531b0a+MYPkM3VlyccY62FIJ9elYsELzDK9Mz/VYUoWN+sjWrUV83rggrnsq0Rdq6S5Ga3Uk3V
	z4w+5x2oYY7lEkpRpfN2L48p0oGFZNMX9vMrHt7vofbcjXS0aih9s5ynU+gI6TRIE4b4RZH0CgM
	4JHvqzN9cy3DRN94xFrVtR689JlS//cFEklW5Poz1F1bRD0hDv7h1lzzkFXIrGIFVSTUMdRA6DX
	mUGq+ZvABQdpbupi8HGJY1Vsx7v7g==
X-Received: by 2002:a05:600c:1c04:b0:4a1:6be0:2926 with SMTP id 5b1f17b1804b1-4a16be02b8fmr80963555e9.18.1791131496375;
        Sun, 04 Oct 2026 09:31:36 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Sun,  4 Oct 2026 19:31:12 +0300
Message-ID: <20261004163114.181800-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004163114.181800-1-clamor95@gmail.com>
References: <20261004163114.181800-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI 4" WVGA panels
found in LG Optimus 2X P990.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/hit,tx10d07vm0baa.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
new file mode 100644
index 0000000000000..4642dc14c42eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hit,tx10d07vm0baa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hitachi/LG 4" WVGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hit,tx10d07vm0baa
+          - lg,lh400wv3-sd04
+
+  avci-supply:
+    description: Panel power supply
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+  reset-gpios: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel {
+        compatible = "lg,lh400wv3-sd04";
+
+        reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+        avci-supply = <&vcc_2v8_lcd>;
+        iovcc-supply = <&iovcc_1v8_lcd>;
+
+        backlight = <&backlight>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&dbi_out>;
+            };
+        };
+    };
+...
-- 
2.53.0

