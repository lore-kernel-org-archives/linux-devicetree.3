Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBEC48EBFE
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912935; cv=none; b=RNzeTP9Ypuv7tjRI0RY1fpfEExg2PguJkxRoXVhKWlSYE0nLaA5Q251OE/eSpi1A682fOW1cHZSnsueiQMsLV35bmAkz/WeTu7p/r8h6mz/8UJgFeQw0nVM7X7B4QBG01S6sRzYCINuJbvFuKikqEL5unNM865/N+0cyUAAzVUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912935; c=relaxed/simple;
	bh=0ir6EEm9FNQCLp9OUbkjQzJH24SRp6mnaINdn/CT2yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqCUcMLvz4GQzou3f0/6V4rBwPoMaFIyeoiqFeUqVwXBWWibcdGJg2P8xnyGgwUjL6bpf5c3YgoDRNQYlUz9a5ljVJFA9Jd+OdWH6jk6vbzaeEqRKFpjMmKGf/l4T3/EYzcRLKHbDcpHDBFyX9CoWbj7xSV6HadPYHATqnoLNjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVt2NfHt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVt2NfHt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso23449215e9.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912931; x=1792517731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=aVt2NfHtP6jHB+WKrB7b+cZ/rrzgNrGpYjHqoGs1BQdg+0mXKgJRpf2ACXyyN7JJwh
         kvYeG6XV+LGF7LcVFJOKLcGzhyHLPd2kSt5CDFD0g/s2IFv6kwuffltnZxln9wHPo+jf
         x75omabmofoH9f/bkENX4SnegJE76RWNkbZiksRtMWV8OJQy8Q2gzkMkyja7MbQvKu3/
         HHrjRbFQKhRcm7ilBZz9vptGa5+6Bd7VWDx6PzIJe1/aLZQpyIUWAcHm2/ib8VEpElI0
         ozbZXnZ2rzWjDJSiCWttNmyGw8R1+SC+0hDj/wNe1EklyBjZsQkrucWR84Z4RS3kmQBj
         roiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912931; x=1792517731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=fIGrw2z7gvt8+ayayyJAnAbH4OP6x7HEkjZstQ6YCEkHTgBKsCeKvK4vxKKv6Avnuo
         mcJXj92Xq3kdyWuRLnrEoVjBWgbeloRlGSTsAVA08hwchsq9AALRFGtbxTvFSAEX4GA1
         n0eYpeCNUL85rMqf+UvwqoaQXvPJs/L83diBtbC+kb2wS9he6TCn+1idxqeq7JLgVg6l
         E3FAqAESxZD8b2veTxub1y3B+Kdebw9ILXRlBjOvDoIyk66+VUnxGeJp1SzOellrLK6P
         eyERMi/MeJvTYuo/jg15G5FDjEDB4linz9vgAXGkIP0uRnLRy2emMvFAHvTxVe5JUZVd
         SBzg==
X-Gm-Message-State: AFq9FYJ7+lro+DSKXLF03FHbdTuRouYlMZj+eR2Z611HUWM1kQySMLEK
	s0zPN2772e3oBT1+3foloma51QB8tt0WcY+wGT+cvsRDP+XqVPcMUyDf
X-Gm-Gg: AYBFou3XHj3CZeNyJ0pe05fTVaBsbMuBSPpeKBwf3GqK/LJfJzwLlLB4zscHE5/fCue
	YE420677nV5V07Rn0v19VMGgHWU6N1L80WTDe2iha5YWZixpHnsoYbNVaVPgonqG//jctpvNn45
	qgyHd3JettZCOS0s06+JXi/voDcZYQ0JQotqYx+nsvu5aL7TUu+y0zqYRLu9IcnY4hyI3RlA/bV
	5n403dnNKXiGsTMDBPITcJKTWpjFH+fRIF7Hc5dsjmF4mR7L+pJi+xoCnk/OI4tOM+w41ZP4lA7
	lY6KDrtFY2TMYdMVfcP/JlZAXHeCXQrQPBDBXeDt1wxXUiYNwQmUjcH0FyEncTVryhj7L/LAG3m
	MXrwMmvx5nC/OrwDrFhDmI4MC0pTs/59+vf95jiwbU5KcQoo+vVO6Acs7is25WNZzV79rMqsqfm
	n9nfSoC1XZISz7lm11EhCWkWv2fgNwYfoonNkbe5kAtGEQifrS7ntIQlO7Dv5EnsFd9PMdMmmD7
	RlNU+2A4+oSnHffnM0kJOldlnvKfw==
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr240687655e9.21.1791912930626;
        Tue, 13 Oct 2026 10:35:30 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ca51465sm284127195e9.4.2026.10.13.10.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:35:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
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
Subject: [PATCH v11 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Tue, 13 Oct 2026 20:34:57 +0300
Message-ID: <20261013173504.451391-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013173504.451391-1-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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

