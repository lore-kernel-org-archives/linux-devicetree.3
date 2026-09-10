Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9F4AB1CB
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054694; cv=none; b=VQJNx90hWUjjxBJz23NqQ8Ju+dZ4huEF5/gzZY4h6IbuzqXJlVsa+0GYmYRXlKjXHjwD/DkaTnXD8T8gGsP5zpf8QqA9fBXukXD6S5JhvR7RsF9Eq8kr4/k6hK+/CzBtgVcCipKODRHQyXvV+gy+Q8ToPsom7lNzsatSw1sHhFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054694; c=relaxed/simple;
	bh=n+VvfaxRRJUSeWj0E6gWMuoSXmp4pUY5fpFqR2Pl2rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQDR8AilFhEFAl2+liBroM98gXu3KJefCKWFWBm8iOOB7QzZY6jAcXUasZHoBszvypjlTLLSaONIBFAqB+GIVi62NIZLOOpRb0u4AC4ne+RY+YJGaRgIjFo3HDtDDdai4XS2XwyYv7bcshhLbnjUsTmsRiS/jVqmaY7i43Xg7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MR1hLZCA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MR1hLZCA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so8306395e9.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054688; x=1789659488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq6kdCRd09J8/wwZWCzwogvcDt1j5IWHfbvfSux7KiE=;
        b=MR1hLZCAIuX3DAxAiOMorWlIf6qywMkQ0fTMQXmCcagftSbH6bx2Nu2KrSnrC51/tG
         J1gLZddu3SFfBKLZrl97cfxMLw7/VJtPxaJYq15U276E9sip5yAMFDuxqdP2FEk/l4WC
         Gy1IGUTNwN00X5zr1KrFu2r/+G0eSaTNdUsXKzmKKu0iIdSLATTMfYmIdSjl/EBewNPD
         oE2tfp5jDeWFzBif/DEindD7nsSfLsa83OyoOV34uUJ18rutqOu/q90psMHgkdqC+v4Z
         dDYLInwlhid0Ggaz54kWaUlbigonIEJ7VzrdgjtPpp3LjLgV2AZdCBg7aM0Z/GK2XVdL
         cmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054688; x=1789659488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sq6kdCRd09J8/wwZWCzwogvcDt1j5IWHfbvfSux7KiE=;
        b=EMaCB588H4unpkRtZcEipFnL+0BYQxDBVebyXnUv0FktShQ/HyCXDxVH7jWB5Sb9rQ
         9ZnxbyjUOz2HcqbDwWiAHPijehrI9c850+ErSMj0+mBnOv2tXKElQhTD3FribgXZwOae
         avPz75qb8gQNuMm0eDyvHJn1LVK/9aBxIOFK3ObylXuQkXnGzCgP+O64c8o4wXSCoGhO
         Nd256TLkbZetT/9P3Jh1QBwB1NL+PSthBU9EmmmapZWDUi9RUd/AATYQi4682urC3AQb
         dPBEfs2gfpWe9mrlbg3s4N8mITP5ZrkdqN95/TKWeNM6yqB8ZxG/bBNqwX4VgTcvaGSO
         Rc5g==
X-Forwarded-Encrypted: i=1; AKwUvBzbrBfXTimEx/VyX+tbxpR/Fmkmg+37Z2qE5N9bZjYGxU5/jybQ5RCyaU7trItOX1PHa8dyUzUQjkVM@vger.kernel.org
X-Gm-Message-State: AFuF++nuIQ10/AMUQVo/UW8Dk2vrxXCHLtKZUlfnS5rgOlFyjb5Fha7o
	Zll3oXGW96tMAdMrNZAoQ1LupynTPYWgVwAo/yrVoPIjceUmvvkWa2ZK
X-Gm-Gg: AYBFou2l7I74myRWk0eWL9FtiO3XZnrd7CVV+i/ykoGOk3rW5AAdZB4n++RdQB70212
	QdToLKAZubxih+JZku8jXa6HLCR6D1Hr+v8/AHMIZHv0awJrxUo4LOqE2M3pVRLtz2MCp9oFEIk
	4wCFVIsZjAQok/DBJhONyifpPe5y2XjcyDTL4+4G4uA/Vnigi63V6qhi0MItlxwtxOX4EvY3uTn
	XdhfeLfSM+cDK6+NnvyT7M/rg1AYpYFlxf54Sr8T667lbvs9TqnO+hN6/uEX42usNDHc2nUh1f1
	WD8RR0bJuvYELW73nQtC7HTtS8M1Q6NHr6muFsLRduZB4bK2UaHqtHf+TZmTGs+sfMc+MyjISLl
	gO0JUAbZMT2nVb9Y6OMB1gdQjJkPTsVZj+pLk+5WfX1YR3qNLM5MSnhe2jFQM5A60fZmrNKjTZP
	Aul2urTtYHyWZXgk9JXK3lqKTqEAcK3bMVJsBROrFtlXukQetoNmQJzCrp/dyb40GSJWPVG0ip5
	cc6kuPtmrvAofE3HEOJ+cTm2Ey+tCY0x/qTufg5gm2Oji/FK0I+RAoZf+O2EHde1aJ8lPMtpg==
X-Received: by 2002:a05:600c:8b43:b0:49d:1f32:c911 with SMTP id 5b1f17b1804b1-49d258cda6bmr82799305e9.3.1789054688174;
        Thu, 10 Sep 2026 08:38:08 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:07 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:59 +0200
Subject: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Toradex boards route the sideband signals of their 24-pin camera
connectors to different GPIO controllers. Camera overlays which name
those controllers directly must therefore be duplicated for each host
board.

Describe reset, power-down, detection and power-control as
connector-local GPIO functions. This lets an accessory overlay remain
independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
remain described separately because the GPIO nexus does not abstract
them.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
new file mode 100644
index 000000000000..06e6836e1aa6
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: Toradex camera connector GPIO nexus
+
+maintainers:
+  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
+  - Toradex Linux BSP Team <linux-bsp@toradex.com>
+
+description: |
+  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
+  clock, power, and sideband GPIO signals. This binding describes the sideband
+  signals as a GPIO nexus. The other connector resources remain described by
+  the surrounding board device tree.
+
+  The nexus exposes connector-local GPIO function numbers to camera overlays
+  and maps the functions wired by a carrier board to their GPIO controllers.
+  GPIO specifiers contain a function number followed by standard GPIO flags.
+  A board may omit functions which it does not wire.
+
+  The function numbers are:
+    - 0: Camera reset, connector pin 11
+    - 1: Camera power-down, connector pin 22
+    - 2: Camera identification, connector pin 23
+    - 3: Camera power control, connector pin 24
+
+properties:
+  compatible:
+    const: toradex,camera-connector
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-map:
+    minItems: 1
+    maxItems: 4
+
+  gpio-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0
+
+  gpio-map-pass-thru:
+    items:
+      - const: 0
+      - const: 0xffffffff
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-map
+  - gpio-map-mask
+  - gpio-map-pass-thru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    camera-connector {
+        compatible = "toradex,camera-connector";
+        #gpio-cells = <2>;
+        /*
+         * 0: Camera reset, connector pin 11
+         * 1: Camera power-down, connector pin 22
+         * 2: Camera identification, connector pin 23
+         * 3: Camera power control, connector pin 24
+         */
+        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
+                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
+                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
+        gpio-map-mask = <0xffffffff 0x0>;
+        gpio-map-pass-thru = <0x0 0xffffffff>;
+    };
+
+    gpio1: gpio-controller {
+        #gpio-cells = <2>;
+        gpio-controller;
+    };
+
+...

-- 
2.43.0

