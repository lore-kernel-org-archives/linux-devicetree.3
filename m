Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315928;
	b=So/b7mO5Of4evvkDL/UecTS1eRgS25eLvV6w3A+OsHuHlG4yziOe6Ijgve1+Cpm7lfbt
	 gbi2NROdBwQMHSxo/0yR7tuP6J4wvVWl73ZhJSOCg/CqH9IIgRGxA9hNmmVpBqHXQUaZP
	 gamwRes3LndWfua3PGpUN7eOPJ6wJwbcowbupxx0g6VkhyhiSAf6aL7xW0KokjDM2MLc+
	 B3aCucmikJ5+DOZthKLbOOMXB/GEy+Q8bJsqrq3katIiBqqhv02cXfYGdd+QCSfP5fZko
	 fwKbnmVgCaldMc0rxW9RSHYwZxd3/vop+d5etE1SbSa/dQ8n6v1Llyu8pjIunVHlwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PxKXA0tpiiR3QW65ttMlpI5LiL6zJ2kSzmT6W+PdFjA=;
	b=2+w3Pq/0QQAqFmRdosyNIAjNULvrBke2gs3BBbC8FDFNWbdFIqp2pgyOoaaDWyvMjDO5
	 ++OlUwV/fBxQgAXuF4cwwc4LRpJZxQ6C1iscsnM9rrEGrHrz59n88Jc2lg+Yk6YRJ6Zo/
	 OLTsVbVTUO5cHKXpPMKUKgL70rDm3EfrxAtW1SdJB5QRNYXTD+r1pnUXGGEm1w+GqT33R
	 1IzthqXt5XnZRjzeNWsRUnzOsRdbyMJDTib//OzO/1aLb0/WLxKNLOz8ymSNumOTA8JkJ
	 aa1z5W3CgaQVwTvTOJjOt+rUGn416/epIRE/Px2VoZaiwnofTwmQ8K4dCvyRVnm0XKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wISASz4C;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9EA606A335
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 13:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E9EA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wISASz4C
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed58279115so959195ad.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 05:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315927; x=1794920727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxKXA0tpiiR3QW65ttMlpI5LiL6zJ2kSzmT6W+PdFjA=;
        b=wISASz4COTVofCUkhM3yL1mCWB8hBzMqYjnp4oqIghOzMIO2G6x77vhKeA59vHa89s
         zGvpF/YcwEtddBmzHgR/f3MyVsdpxtLsgHGHHvOpE8YKs3HECSkws/kNodAsmGLtyncp
         i5rL+wYPs9VD017urS4gH06FUhelfaHJh0xJ2ldZ7vJvywQyc2FysUc2us+s7hW1hbPo
         sNQelvxoQiFR+HfacAK7V/zTiCAlE4DZaDTKDMJ+FMSOF+jecuTkR4y+3bxfKzT+onyP
         7JPs9QxLdoUsORSayYNK3PAoZEL3jMzjhp2eJDkTAwYkYfzpvw3hwvIFpNTzfpXsUoGN
         PxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315927; x=1794920727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxKXA0tpiiR3QW65ttMlpI5LiL6zJ2kSzmT6W+PdFjA=;
        b=V6DftQbAWYo/7HPNBlcxgIbkM7rzMXQGlnIdHK9uDpHhtP8I7/Xem5bD1aIeK/rhog
         emOm1l1zsMBpzjhI0fZFZzW21G82LB9u2+W1ttqulf0UhbMAXdBdGE5v6ZbvvEKHFEcr
         QDY0rbGtNpSpnXdOMRqS/iea2kCC75nfI5TRw4Zz/p9NfCcr77J9uW2JZ7fjFj/sejz2
         Twrd64Vg9o57pSyX4Nez+MmaBJ3wDrec5tcL6zDnQOKCbSnCaWmiKOC+CPs1QXF0xXG1
         +R3XBsTHuXFCNQsa8dquFSD8OAgJPOa5ZWJawlfspIodP/lcNIKolG9ipsMY0+5R9uol
         7Viw==
X-Forwarded-Encrypted: i=1; AL+hErF/3Yc+MjyMVeW/bpywoM6XpuIHhxKGBYiO1CejgZ5xKaLH9i8dzZXjQk1YQz71V10/GrJqEWTnqbnx@vger.kernel.org
X-Gm-Message-State: APuU4Z8wX8TyHrfQmtB7c8wl+mqMun4w9nI4EpAyP8b0UfeMEohj89nr
	MUn5fwOB9m+hlvWlGeMG0UKExsrLDy69BVu27QFEhtYajpnc5Y7eMGL8
X-Gm-Gg: AYBFou3U/QDHYLL1eHxp1xR1KC45HGstR4qc3Y/MDwWYyt7bpBRqN5ZvQfIbC94qvry
	fRpS5O+jfXcHcp+dvqzthRUjyy4nF5ajpCUN/ZZGwo36xtjdZqpPLtEvWLGxYy1pfUnzszU0fl0
	Gzk9iCGyDzFdIZs8hC1sF3m9ypWwDlWYrrGQ+BoIbdzAHJUy2XWqbvds2cSK/J9fPm9KxWsGlCE
	DpQCPRruD2E+GQOZL0xi/q+RtHNtfSzVQvhYae4+H1gMHqoZsEPgXcqD5SmvIhKhtEt4sLQLoLg
	EudgWhb1XgLnab8Eqx1V2HepLH5Iextv2VCNGeIjRN//2YuBhzf21OEZA1dIxRzEE7o45yLLulZ
	lmSCXNl+I/z6snypR1QdfVmmL3psSaqPJvGxB2du1iVVknJfP61crWA5GjB/Lw4lG3xVcHgUkSD
	/D0c2pZ0qwCcjar0rkwG2UX57hTHTEv0+RfJlopvBblcKoSyB/FvQeSE2EyWuD1+KJ/I3ckx0iu
	b+5oZsWTq1SqOa3KHmz9FPyk80K879DsvVA9vWS8cindi+u0One+A9zRVR9U5ISZSWObLGilgpj
	7mQUEC5nh7Nrr3ipYwoIyiFvu0GU
X-Received: by 2002:a17:902:d502:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2edb91382eemr40097465ad.3.1794315926694;
        Tue, 10 Nov 2026 05:05:26 -0800 (PST)
Received: from marchy ([2405:3800:918:486f:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edbc1b81f3sm6274425ad.26.2026.11.10.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:05:26 -0800 (PST)
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
Subject: [PATCH v6 1/2] dt-bindings: display: panel: Add RAiO RA8875 display controller
Date: Tue, 10 Nov 2026 21:05:13 +0800
Message-ID: <20261110130515.45819-2-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110130515.45819-1-azuddinadam@gmail.com>
References: <20261110130515.45819-1-azuddinadam@gmail.com>
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

Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 .../bindings/display/panel/raio,ra8875.yaml   | 86 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
new file mode 100644
index 000000000000..4c72130f0dbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
@@ -0,0 +1,86 @@
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
+      panel, key scan, DMA, BTE and font access completion.
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
index 7602034374d7..c834ad2eb582 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1411,6 +1411,8 @@ patternProperties:
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

