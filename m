Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795188;
	b=PdnuRqq/D2OKNfCwTcmmvDP9xgLuJHU//2SYSw05WStcBEmhUF0p0bPtbVIl3iOnuXJW
	 lymYSxxFM8AAtZ9I+tautsN31IaQHJaGTcyXPMMpvtImWru2ksVOCCMZ9dy9wOPxP/Gs5
	 7uGdBDpypsvWMgfsI6rusJEkk3HpMSR9XpZHt+Jnu9hKK66K527EDGDzxwyggOT+aMGT2
	 a8Dxv4apl1ptISlTMJdyN5jf3UxMMg3m7iyB/Asiqmnu8xSyyOTxZSZ28KBNudjAQDVSW
	 rgS6nSztPaVktyPBQxfT6OH5WK7Yw8L0Chmzh2LzDn1HuJGaKtK5ATs31fRkzk7xFZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
	b=CbYiD7aJHthBfJ4uPXzdLZMohdcdO00XRxNIxA8t3lsaViXv7iMcfwGvc+q05LMw99f4
	 kdlcfBqy6uRH8vdja+RmXXrUDEu4x7ulGn6fEscz1CpAGxiMTOIsgEoOQl3dUvfI2eAR6
	 sUYbvNRVsn4HLJ7pcs8X1A8BBBP7D+83Bs4eUwWbePGFjQTDPbKEiQWGzTGnwWEBTPdfo
	 c0qF967DH0IH1/J4CciocpN+GiGSci0fj6NKEX9gi9G1soNyESUUpz45TafHb0Hcuvzg8
	 V3ZFyecbocKNvLVibUTX69Hj4c+gRU9VU+1oeWK6QbY8neAxlYs4FXndKSyLiJKJ9tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqxTgXZC;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCAD606D80B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BCAD606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqxTgXZC
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so5072355e9.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795186; x=1794399986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=zqxTgXZCedl88xAPuNpOKy5fkDuI/WY5HEZHcMrLocsOyvu65KxpiKziAlKb5ah9B1
         yCl288vMVkvMdiPl5/3Vui4txDSN1utH1vfyc20VNcH/IWtCoFQIjxg/mozXyD4ZhAUs
         Ac8bgLWYI9wAwDxNzSLAtJjWYxxRByaEWfNF/23IFcyXQ2pCnNy/N6B2dE0A4Q8Fa89C
         hBSxJY/4RN5a22kyLdZf4HkmUM9EfC9uu4b9PdkPZ7o0EIvsezP3JiDCy3ccXu6pqYG7
         qCXsNU5nf2+jLQP4XxE8fNz4dp3tGW8L+d+0qRj4W/3AT/+tHGAZOz72gv0JUCErPrqA
         Ehkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795186; x=1794399986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=wE4eNk0LIUVuPlybsDoM2JTWPmWIfJRmztm2dRszoEjSTtYKN8MLxjX0V30V23sSnu
         Jznf/F80KcHEuhlTmlVt85vrcMc0F9+f8ZiaFyldGE2vljHZwwIMjVtYBSGsmuyF3V3/
         vP+yru/CDy0F9duIh/dS6D7ZRLgGobrGwguUudKyEBW+K7/gaRSOFNTRc/cgJcGbtfFw
         KbIX87T1q13oG5+9xIue8opwc3MpAGlhK12nyw3ZbAjryljpKX/EAKCmdjcc+ANHiD2I
         +joSMtFyZPvcH364LNQ71Bt222Qier2dzXHBUVilygBu7s2JlFJ9CEjY/m2DXX8faJKx
         M8cg==
X-Gm-Message-State: APuU4Z9iR2VF8vYoWnglgZ+7Oo+WtMyHVNXk/YgcTNDHO6bG2nO0C456
	Wvh+bFKLE8Ew4empLC4RhQIxGNqkk4EYAV+4kaNybytJ8l4JkCMkGRUh
X-Gm-Gg: AYBFou16shSI2EI3avJgkQKXLXWfb8Nxykyq8QT9jbu9Lwb/XxUi2BIDxCqRG7jl2zq
	4SPb89uCqGUqOOI6hVB+4Zc60XGFRfnBiFMUOsoEvC1pUkXCg7VWCykrs9Nwhr0f1CMVZx1bvMo
	gfAlK5+tMLME/j85K+4nr4V6YHVE3RnKFY76PeTnzlM72M1uyzD4SRB75UD/aht8OJnu4Rjtb2A
	HPSeW0PPOL7r2/lGes1SQjNQ6VPoXpswgMEVapr71Qb4D/wJHc2zugfVr+EKzobV5YZBSAzo233
	4gXBmR/TMBmFBLY6jY2DQf76km7vPEPZP+AIvdG+hOQG1g0mdhakgm8pSyXltgyl5Uy2FPMNV/P
	yzQOeaMSqfQu5vtTyY8mw5rG6VtwvtQKxgD9rB7Xc6RqaMnBo2dvhBYewt/TfZIohsV4JT/1kln
	FzNBvM68+gtFX7GLArlZ9MBsdB0gSp8Np7TPlkSz9dAYWjkq4Q+6hIHH5/sZ0UoZtuRVrJf5tLR
	qKDy1DfPSX6vTjLyAWe7c+7i2q5vP98FO4CmqcMVjkNSGNj4KCsl1LevjeFteY5OZ+5vjSZ/kU8
	S6OuDBGtjcy6sOtJ6SSKIAV+IDih7Hc0RZisMw0x2uviNljlPQ==
X-Received: by 2002:a05:600c:698d:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4ac185bd1e2mr362326075e9.16.1793795186366;
        Wed, 04 Nov 2026 04:26:26 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43da9825bsm50492415e9.15.2026.11.04.04.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:26:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v13 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Wed,  4 Nov 2026 14:26:00 +0200
Message-ID: <20261104122606.215629-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104122606.215629-1-clamor95@gmail.com>
References: <20261104122606.215629-1-clamor95@gmail.com>
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

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 0000000000000..60b6375864aaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,tf201-ec-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controllers attached to an I2C bus,
+  running a custom ASUS firmware, specific to the ASUS Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    description:
+      The 'pad' suffix is used for the controller within the tablet, while
+      the 'dock' suffix refers to the controller in the mobile dock keyboard.
+    oneOf:
+      - enum:
+          - asus,sl101-ec-dock
+          - asus,tf101-ec-dock
+          - asus,tf201-ec-pad
+          - asus,tf600t-ec-dock
+          - asus,tf600t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,tf101-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,tf201-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf701t-ec-dock
+          - const: asus,tf600t-ec-dock
+
+      - items:
+          - enum:
+              - asus,p1801-t-ec-pad
+              - asus,tf701t-ec-pad
+          - const: asus,tf600t-ec-pad
+
+  reg:
+    description:
+      The ASUS Transformer EC has a main I2C address and an associated
+      DockRAM device, which provides power-related functions for the
+      embedded controller. Both addresses are required for operation.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: ec
+      - const: dockram
+
+  interrupts:
+    maxItems: 1
+
+  request-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: asus,tf600t-ec-dock
+    then:
+      required:
+        - interrupts
+        - request-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@19 {
+        compatible = "asus,tf201-ec-dock", "asus,tf101-ec-dock";
+        reg = <0x19>, <0x1b>;
+        reg-names = "ec", "dockram";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpios = <&gpio 134 GPIO_ACTIVE_LOW>;
+
+        monitored-battery = <&dock_battery>;
+      };
+    };
+...
-- 
2.53.0

