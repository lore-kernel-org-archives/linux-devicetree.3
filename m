Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350163;
	b=yjVxi9N2rYQzPlPGxXmUF8VLt4SWrUc+Jn9wh6QX6fH597PSSMd4MvP+ZlAyGLA6M2wh
	 w19CnhqUIs+bu9NdNzq/7EsT7TrF0uWTssnu6yfXJMQaTtC6T6qvf0VZ2VGcDWT4XyE1I
	 JoK9n+aSYr/IsIJJ2+qnrxfFO3Ctd5yGlBJhw0V9dfd2UkuynN4Z31AV4W5zsRzkkcejx
	 v+HPYYXpMI3CQFy6oIXRzl3AIQXx2J+q+ll2ixnql96l7C518yWuSA4yMvXCUlAjasWEm
	 aviKPxSejti3NAu8EY9trjZCst99pI/FdX/sdDfQhO3cUNYvUGghYq/Tm/b3/05wvOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HW7rHhE169McYx8Jxy2QMfjdkASLa9iCRSpVlpE36RA=;
	b=U898r55RKA167YssWFLe0GZpmkpaHBnDuKFxVKoV5AswWdgaNyEL3x+JSR94KICDfLdp
	 aVKT1IMl7Rgwhgb8SmgcC4XzOsmwrwbeul2Lq2ZBbYN1QIGww+pGoqwhomrXegsforTWd
	 0IGYWtbTYk3WzL/2qOEMdOsphrU7rCgouHDUK7mnEmZUiPLSUK5QEOH50CQF1iCbhus84
	 HyLkSsia4teEGQFNVa+/5sPNyxjFCgEiMTUqd41Fk4FG2ZYYGMb6TfLvuCf+iDZHPS+BA
	 0cNd7ASpZTGLC+gjV8ed61KyNy8k1WNbRkZ7QofhqxZ3GyWNyXKdeogl0lIEGYiLZVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yqr/MHOZ";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D155D606A325
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D155D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqr/MHOZ
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae1a9e187aso73971a91.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793350162; x=1793954962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HW7rHhE169McYx8Jxy2QMfjdkASLa9iCRSpVlpE36RA=;
        b=yqr/MHOZU635Qm43tBKG3XBAy4SyvoymZaW0doJ8A16nYDbyUsLqXv9E49rtF4XfWe
         Ex0Av0Xyo7G5aNd/3m40mrP3mgQjFJKYbQOND4IO2juEQqLlzNqaRekJsqtYzwa61CWb
         rtWIY4wdYRqVv8hgfdlTkxFIIawT/tkSyvlkNMsJoCbCEUDA+YT+NqcZBv1mGFFCQQh6
         VN9R5JO3AbHkH712GiIoTRcgZQtS0uFCVPdBOPaJOpsgZJoPyIB7peL3k4GCuK7zwXC3
         Qk2IdL0jFfBNWwILUV8sp/PcI9kSwz/gpW1Lbq58yJgm/Qv51qdsidZGyRAu4f2Tdjwl
         O0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350162; x=1793954962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HW7rHhE169McYx8Jxy2QMfjdkASLa9iCRSpVlpE36RA=;
        b=KacEhCjXMlCKnVvsHhpZlHu4iCZ7gkhRgWyJDnQOSHdTiOzFa8ajFR2Svg1DMbDGIK
         w7mxtpMx9yecY+H75EcxTNv1zU3rAao046AjNQbdWT52TGlaTgvYYHJvsZ29LIw8haF0
         zy/clbfx0wYWBbyPyQAmpgxRI5iqS1oJkOXdY9a0azkv/9hrUhuIhUP8XOOUzKP4mIjf
         37xGBukG1yTsnIpxnoDgZxjY0mG82Txleltqp3eEhISHJsX6hRQkLhAgn55pyovyOYtc
         yY8gyT2qCEwG3YBEcbMSL63AuhT0KRIcB1iGtPgNqBV1Xap9+unug0Sn5wXWICouKmgE
         CM8w==
X-Forwarded-Encrypted: i=1; AKwUvBzj4s/vybNyRR9YaY1NCXoUS/oAkeUpZoe1VVR5OSSC5BI9e6Ha0Ik74+VlKfrkQi1aYoR9/hL86Dqo@vger.kernel.org
X-Gm-Message-State: AFq9FYJNQZtgc1CYMJiemiom3HCO+1JvYCp1R1BSr9Xuq7V9BRuvZ3ga
	VzRfVFg+6GHqKsPv7Q3nWfFWaH9ISDLhDJgM/gNtTxllNpXjnsfwo1ma
X-Gm-Gg: AYBFou29+7lkOxSdCeqPUDltHuxWb1WI6y6hGvaqkNlBQ8AKoW868rSIl/myP0BgcWG
	yVNpjSczyVKBPyqpFUmvJ215mwyqnIHYt+sGyaJ3fTSt/yCkzayu9I30nsWFnYP+Th/UsFkZBCB
	zVwIhWUZIMmoFL+0YL57fmb9SAlYpxMoV3hkvNeceZas50nnD9EHNIbwtA6hSCNL9bkUYG7Tc5y
	UHjBikhvkmauEgHKxBNDzpAvAK+vSAORnkti5NaLAzp2siK5W9iHWkOFt21Vk2hRQVguQCAa/kA
	sGJeWPy/YUrLLqPUcRb1zi6CO39XD/fr6PT0BQdFW58kX7JBKEqKxFwcqqTnJI1tQdc4FksaB//
	0/PuQpVWf0xWPOjXjoZF+gysBJCtaZsuyHS749edL28nsX3JBgoqenaeYLCd48/olkZmzbC9PrN
	q0VP8BCFzPh0Q77Z68NqMFXT8IY2dUj7eR5O9GyE0RMOjPAMln9L5cjAO5m6wFnHp8FFOXGOfBW
	5orQw0MFaW2o9yh7WnyozEd6k/FneXSsuvqpwHjwWeTur/wzNK9n/1zMl+8545lDfMniSkzEdbN
	bGpxjpFFnOGgS54UYlirRQ==
X-Received: by 2002:a17:90b:28c7:b0:3a7:fef3:8561 with SMTP id 98e67ed59e1d1-3ae89822b55mr2355088a91.5.1793350162228;
        Fri, 30 Oct 2026 01:49:22 -0700 (PDT)
Received: from marchy ([211.24.73.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ae5b9sm3229716a91.12.2026.10.30.01.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:49:21 -0700 (PDT)
From: Adam Azuddin <azuddinadam@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: jesszhan0024@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andersson@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	azuddinadam@gmail.com
Subject: [PATCH v5 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Fri, 30 Oct 2026 16:37:35 +0800
Message-ID: <20261030083737.47188-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030083737.47188-1-azuddinadam@gmail.com>
References: <20261030083737.47188-1-azuddinadam@gmail.com>
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

The RA8875 is an SPI-connected TFT display controller by RAiO
Technology Inc. It supports display resolutions of up to 800x480.

Assisted-by: LLM
Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 .../bindings/display/panel/raio,ra8875.yaml   | 87 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..661398bda0ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raio,ra8875.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RAiO RA8875 Display Controller
+
+maintainers:
+  - Adam Azuddin <azuddinadam@gmail.com>
+
+description:
+  The RA8875 is a TFT LCD controller for panels up to 800x480 pixels.
+  It can be connected to the host via 8080/6800 parallel interface,
+  SPI or I2C.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: raio,ra8875
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      3.3 V supply for the IO pins, the oscillator IO pins, the ADC pins
+      and the internal LDO. The 1.8 V core rail is generated internally.
+
+  reset-gpios:
+    description:
+      GPIO connected to the active-low RST# pin. Optional, since the board
+      may instead use an RC reset circuit.
+    maxItems: 1
+
+  interrupts:
+    description:
+      INT# pin, active low. Signals RA8875 interrupt events such as touch
+      panel, key scan, DMA, BTE and font access completion. Optional, since
+      the host can poll the interrupt status register instead.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - display-timings
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "raio,ra8875";
+            reg = <0>;
+            spi-max-frequency = <16000000>;
+            vdd-supply = <&vcc_3v3>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio>;
+            interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+
+            display-timings {
+                native-mode = <&timing0>;
+                timing0: timing0 {
+                    clock-frequency = <25000000>;
+                    hactive = <800>;
+                    vactive = <480>;
+                    hfront-porch = <40>;
+                    hsync-len = <40>;
+                    hback-porch = <40>;
+                    vfront-porch = <10>;
+                    vsync-len = <10>;
+                    vback-porch = <20>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..99d5113fb035 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1395,6 +1395,8 @@ patternProperties:
     description: Radxa
   "^raidsonic,.*":
     description: RaidSonic Technology GmbH
+  "^raio,.*":
+    description: RAiO Technology Inc.
   "^ralink,.*":
     description: Mediatek/Ralink Technology Corp.
   "^ramtron,.*":
-- 
2.55.0

