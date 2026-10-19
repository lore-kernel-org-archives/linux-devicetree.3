Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2914AA038
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404264; cv=none; b=QNMKd+tovKkirxTTnYAde8wfqPNmF87XqWejuEwmnJ1xrHP5LOd1VEen3mfbO3Y/OBT8fTPf4/rDZ/HjqgxeYx4YBIzDD1+oomy054WXkGxQFndjmuRur4RqutBu7AZzmFkeHfTGwiDveXcIGqAtS/85mJzzPqblcxokJqJLmvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404264; c=relaxed/simple;
	bh=0ir6EEm9FNQCLp9OUbkjQzJH24SRp6mnaINdn/CT2yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czH8GmUbgJoWnr6UWpqYqAIyiU1uAiMlxNlbnVaA1Mhecyp87P4+EPESGfFwHc5hkROVl2Vs0apkCq0wJC/ZDLYaK7L0xKygTR/cnjQt3cglopNitCEuNoy0BjlooiLJftrq7DYtlh7tLAdFvW2GgenpwwshkRUNoCZgFyXRtEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rABZifdL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rABZifdL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso10234095e9.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404260; x=1793009060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=rABZifdLa7+QGoQG+sPcmcgRrz5Gg5wUX8ktsRm6gpsNYz6j8d+pDrtoIn1AbCBPMj
         bbTDYf8T3zki1HlGBViNsZiOQ8aabJf6cPuQLhfCIy2sWD8e8acRVh/HB2tA1eOpBSOT
         46WYGlVqKyZ2Zhsdr44+RrUY0x3eua+s13bLdZzm3FLZaGBl+vKIBgd9sDfyLpqwt5lY
         sf864dVMyJu5/mByQyFTtclmtTwOW/tR9DJ53ioEvGAVO2nopYubZU87T6QrCSBVkkHu
         wwFLJss/tCxIqn4Teq4kFtAUTu9O+X+WlPuqG6Efungf9wIwPpJ63Okjyih09dojf9Gl
         SGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404260; x=1793009060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=TbP6tYXxF8J9/yV1/Dn+yKR206e1GtWl1auEe/fJco5XewtRq0TIuf7pyfw/6EAMvg
         zDAbQ0vHaQ3gDTTwlLvvhZHQKNyrqk19KXtHkCVSPRTm5yv1ZZvJ2uLQnUFRBJRgKrar
         8qb57WA0fVk9wACtsYXoo2YZujusWOFEgN9xyH5eaKtYoFnJw7IkpofnNOJNmWFpFwme
         Xbsx+MUFQxiIe+RwCc8SsEJgUlj+qMyPiBAdzvv2PxIkK7v9l1qmftpHuRBCDPxrcdCP
         JnmbIGWw6BTOrNIkGfeTWz9AIABwuJPhaqPaGC4csGEoubPk058eM0uj13+C8c4mqp9W
         +1Rg==
X-Gm-Message-State: AFq9FYIqlsJae+mGqtSsD8zPrHpW2gkVX8FRSjlnQ03iWkVm4GbH1o/O
	Da+GGtSkYP/2Sidk/1C2rbZ49VXdBu3HmwsmiF6DFkSp3aJYRiMsHxEL
X-Gm-Gg: AYBFou2VHte+X7RlR7NnQCxs1ZnLDn5Hhi9U2hOsU4Mwyo9K1YrtpbnpNjde3gFt4pL
	hcPdrlmhiGVp/jxOQ1VpEITwBW024MZBpNmkgWpLA1YdOqZPXabWwwFN9P+MrVa2lHtXUwMt2oP
	2vIycL3SO/4eX6UWD4eU4Rx81KS4LSUfD/GyMYx6pQZmbXmuZtw9pNLg8imxPZCGwomXA1pd4/u
	dEetUTJTzvvwO314vzgbF2nCztVmQc23VVBYaOS1kao0j7m3kIQphBuNKNMs9mczV3Iv/FHMLEu
	68kqq0gbLa7KDNbL4HgBj334tQ0qM//acHIvW5H+LrNyLe98whn9YKCSs/UEypNHTE1AlmvktgP
	l6ah5oiKBnPkYRx3fp+pHkU+4HyPSn/FVkQRwSn+n9hvdEExGvmAQJfSI8T5WJb0M3Nw2uv4kUP
	0232B0tNtFvpGXx0NuhOMBNcW3bPfMC1I4+x8ET2lhsvMxjj4lzGFgPWIz9t+ZQFkjChMXhDFzz
	YfEyItjtQKvYZHJ1JY=
X-Received: by 2002:a05:600c:8b28:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a1d7634d5dmr157311995e9.28.1792404259520;
        Mon, 19 Oct 2026 03:04:19 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm177811485e9.5.2026.10.19.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:04:18 -0700 (PDT)
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
Subject: [PATCH v12 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Mon, 19 Oct 2026 13:04:00 +0300
Message-ID: <20261019100406.103687-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100406.103687-1-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
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

