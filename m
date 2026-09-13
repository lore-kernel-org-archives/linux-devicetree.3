Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D7B48CFC
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332617; cv=none; b=FUuQ0k1IoJ1XjW9wNVsSnFfmjldzKcgkdVqkZ3AIILBooxGgqc/W+W7IeCUxzV/AfDpeyTDFt2jkNZ5CyT5cmKaQO4Jhj8iNWpqvmFagaEMHn3dpjlimJYSaxYV7ZdLNUZnusP0xR6rM7CLRC5ndkT6kGm3pgDjYNZnE/oooapU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332617; c=relaxed/simple;
	bh=9jVkSD1JQdGntTXsCswiwWjiDS0mDytIqZyRXh7TmnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tNF8l419hknv0L35EKOONv4eagMM8suWwjOEzvKBGFaBbdlcSqfRbx4KUf09WmAlOcA1e+IfuMLKwhOmHOFkfX6EdRSjypTGKINxk+ds7LpGk88fTvsB+Eo9fCvMEd59mAFWzfVnHWOUiWgVVsJ3UaGPiS6+9QJVZIo+5hI/R40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0Pc/Mcu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0Pc/Mcu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso155755e9.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 13:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789332614; x=1789937414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufiy72rg5aTwvEqEphUP2HlQ3RzqokHOttH88+KP0Uk=;
        b=Y0Pc/McuFBmGLb/72tfzeTjHbaRW7qtjuZJat4TeAefHJo7L52vS09M+xy8QpGKrYT
         ZytKrcXvUlIUWtuK6DtSg+O8Z1M90+pzNIuBnQvsdU605C3Z+W8/QLJXN4Ka9ww62oBF
         j32+MbA9cbBZiwODd3UjBgZJxCWtEb13L8a07EelYl55/G3GcwNGT+onRDX0TdcQZB/L
         YiZTyQVnMzRqdHQ8jJhZwyxZIWkZF6ne9ZsoXbqRzC8ZTZYfuobcTAlttMuomYREzxh+
         ZHYDqoL3mSAcMk9n/zVvd4HMSWRFzhlxIaz0m10QI4YSXkp8aUfKxJKwIt7cBvnqIm43
         9x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789332614; x=1789937414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufiy72rg5aTwvEqEphUP2HlQ3RzqokHOttH88+KP0Uk=;
        b=HDmf7XUOWxcs/1O2CfAUxZGWD8CHiry0ORKlFL5MWDk4DdkU6cHMmTXQsBjvJqbI3u
         EPtMFC+FbSqgGI04158GBxImdXDjqCmzHOlX7HEnjAcm2JTPshst1yGRFTkwsgqYFtjC
         tkFftoO223VjAwZyscbZUJFxXq4I15Kwq7598/Hb+Noho/6u3iIFrsT1Nj6VidUSf/Pk
         YNSSsIvF+85pP4uLdj0BUbPpwr8AiKvWnCApRLIVcUrEOqAvEEl3U59iYFha4BlaVzuI
         kmmdrkj0Drlim9kz5hI+bdooP91kdOfbdy6zZE1eFouD7ZOCrRQnv5vh2jNa0wIm+N9G
         XrwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2y2WJNzB7tlUwENVUWjdJY9fySad0TSDE3rtcLYNmahEdH2nWjmk6OKll0Nf+WNcxsMV5dRg58shy@vger.kernel.org
X-Gm-Message-State: AFuF++mc/3P6M9nf6GRxSnXPfmKxC0wYCbwuPnYmauYDnEIOeZpB5CQ5
	lVRjqCnHgtFt8RXMTcQjnU/2YScznf/UJ+TLK67DTsZBrWhWIj1nzrKr
X-Gm-Gg: AYBFou3cIkCQasNT8hhDnECW53YNmVodhkJLcnpqpFKr2JD3wE6O5d6nKMpDWIHUk1g
	10ZTetxXzloDZfOu3zoe+dSZPK+fDZ5jc5RUgjl/a53l3L/2J0UIJ3qDM1YUvZmudccOgaKJVSt
	sdIq6bWQ/lH4N17Sj3h+zN7Me13IwKaPfACrPrFK3dKLdjSfbrE0CWY241heKoPL8xfzLeQwLFH
	iseeIbqs2b+xtUHdRp00bbOwDasXt/PQmxl8oWSEb/bvlFK3XIUdaPt1TDok8L0XH2Fl1lVcO7P
	VGZEVsd8KXuqEaveANRr+J16SjhJccQmWot/YT+ZdG17rS2CecOVAua5paRER3Mgvea+Tcx5Uwh
	e/vqa6OzuSQd4T/GecuEFkvAciJ+0mvpz+81bA3Zy/vowbMw6VYy9NDvs589AwwGA0HmJrNahwM
	9SzmbGFl8jsU+Dj8O/9kLcp4onXyw/BQ9+BRVyW5ypy4XQ5x/COWqE7+Ic5TmMCsL0xkCC4OHmj
	gcG3tcfO5cXFAE8OHOCUfsjhfQZJi0Ra1eVskzDGPFMFTLxIVcVE6gfh3XeituQflvzxAHx9PqB
	OJHZ/ty8xy9PBTsCliMRyS0quRpOKtFgKwlF6g==
X-Received: by 2002:a05:600c:c490:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49e619c0423mr160644645e9.16.1789332613554;
        Sun, 13 Sep 2026 13:50:13 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7723d458sm54986345e9.0.2026.09.13.13.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:50:13 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	u.kleine-koenig@baylibre.com,
	Leander Kieweg <kieweg.leander@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: display: Add GlandaGPU binding
Date: Sun, 13 Sep 2026 22:50:06 +0200
Message-ID: <20260913205007.118552-2-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913205007.118552-1-kieweg.leander@gmail.com>
References: <20260913205007.118552-1-kieweg.leander@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding documentation for GlandaGPU, a custom
FPGA-based 2D display controller.

For hardware designs and RTL sources, see:
https://github.com/stiangglanda/GlandaGPU

Signed-off-by: Leander Kieweg <kieweg.leander@gmail.com>
---
 .../bindings/display/kieweg,gpu.yaml          | 55 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml

diff --git a/Documentation/devicetree/bindings/display/kieweg,gpu.yaml b/Documentation/devicetree/bindings/display/kieweg,gpu.yaml
new file mode 100644
index 000000000..c0fda8438
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/kieweg,gpu.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/kieweg,gpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GlandaGPU 2D Hardware Accelerated Display Controller
+
+maintainers:
+  - Leander Kieweg <kieweg.leander@gmail.com>
+
+description: |
+  GlandaGPU is a custom FPGA soft-IP core providing a simple
+  2D hardware-accelerated drawing engine with a VGA-compatible
+  display output. The register window covers a combined VRAM + MMIO
+  region, with MMIO registers at a fixed offset within it.
+
+  For hardware designs and RTL sources, see:
+  https://github.com/stiangglanda/GlandaGPU
+
+properties:
+  compatible:
+    const: kieweg,gpu-1.0
+
+  reg:
+    maxItems: 1
+    description:
+      Combined VRAM + MMIO register window (VRAM at offset 0,
+      MMIO registers at offset 0x00200000 within this range).
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Bus and pixel clock provided to the FPGA IP.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@c0000000 {
+        compatible = "kieweg,gpu-1.0";
+        reg = <0xc0000000 0x1000000>;
+        interrupt-parent = <&intc>;
+        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&osc1>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b1af9deac..3a9d15dd7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -893,6 +893,8 @@ patternProperties:
     description: Khadas
   "^kiebackpeter,.*":
     description: Kieback & Peter GmbH
+  "^kieweg,.*":
+    description: Leander Kieweg
   "^kinetic,.*":
     description: Kinetic Technologies
   "^kingdisplay,.*":
-- 
2.43.0

