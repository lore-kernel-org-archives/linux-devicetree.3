Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731483368B0
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278473; cv=none; b=f8M5WpkgbaWNmFHykLco4ptF9OIQQTXT2MeREC5AUzR3r0gZ+6QsBIcY5WN/Ofv8KVZGE9xuD2lfBKaSKOjZHRMOO+wmV/5SMvLT6MHhEppz6Cmx5GDUaD8ROffNcepYJ1DwCj7MXKhQzFFm+toAIeh57dzgXJnFMzTfbv2BZZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278473; c=relaxed/simple;
	bh=4CdqJb5/HIWgveoRMI3NaAYB6L+dedEtCpwu5Ims3hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHpsBzkV/VRM7chYM59aRMJaTbS8y59+SZplHIRGIT2LWLWW5lJOJOqmpYo0b7x2GttBjc8T0YnVtwmRwmxBZu0Xe09j5Z4NdtQSoUhyqt8XHEgOBskOAfSZoySZzw8+Qg2ktqzlaoPLEYqQsEsjS4ysUSKUpPKKeJQLd0204TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=T7JK/nVo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="T7JK/nVo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so9020075e9.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1781278471; x=1781883271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wbmalnm5VJpnaLDuaocsCfhfiTIsHFVDQa8Miy/j3e0=;
        b=T7JK/nVojqsdHTaHZCmO/E6QUQJxD/V+cDLnvq/GMT+IoR75WJFsGvYuKy/Or/FH/G
         gqxkwoLgFhKn+UjsvTM3YO9b7I+RwQS+aNEVASAhWbRCARqsPkhIsW2o1tijGvV8y21K
         HNUv+i0tAqrsHKpTHnky17aJK1v/ejDPsnrBDQFmGKHogw/KpCOswQKf/o9Ucft+Xx88
         3sGlymkDjSX8EDXaFzRoYlPcVSCjf8QOAjf5gMPaGDkyR9d0NTZxbClbtV0Wr65tnGJA
         otGOqwxry/3fJGHIBHQUEcckPr46WuNj8A46nPLkbe0nB+cd8tVnFDvi/Q8zU+tZdxP8
         mu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278471; x=1781883271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wbmalnm5VJpnaLDuaocsCfhfiTIsHFVDQa8Miy/j3e0=;
        b=UTNxc2cGAxr+ha6TPr54W2xS2gY185DLU8aBxGmJSw5N8uKhr7+/U3IhjI1LClbqnP
         EL8cngjvRC6kL2tNSvFj8L0CNwF+sjr87GE2P9ZFHZcXR0tDN6s45jU5KL7bR76ZTo01
         dlUJQI+8BE2ZLIoUozWus2MCbjMlS+BEUvDj5xx48L8P1HCcEEwjwKUbIODy1inqDwSk
         6WGCP2zqMrYiz0NueqwyeJYQynd0tnpGfB5oLG0Wq9ya/kMZKqNEpN5Rx2dsOAN/HbUJ
         xN++jEiXDvp0CS8vT3OU6GRUeTgb+NpMaDiGDf0sSuTmTznk1uvyODAyXjwWumLZKf/Z
         Ou9A==
X-Gm-Message-State: AOJu0YzyyhwfXkcf38TX2+XZc2RIsTMGhxT/GUYh17CAmKMDbzlNvK4c
	nbyc+nlKQEAeHeJCwJUwSkNX8sz6KhoCWmegWAHSPENNy4iwnx8254G9Au3LypDwFwU=
X-Gm-Gg: Acq92OGnV2B+FMmHryN3n0itNYbbCibHhPCoOUizsoBGvIBs0Ulm6Kd0tEVEGD2c7M1
	WscAYDjBQjIdFcVgKtmyUyU09HWpw2WmD3GLHTpNhQVereiwYhUQQUM9+eaPlys3xqy1zUjIByE
	pwV3I4+ugPs2/uGaC21/O8GAvCzxzegSqZDr0+bOQhvJWvaYQsc+q2VhKbajPu8+s4FcfK/yZjt
	gv2p3EkzAc7HpaA4G7QdecfacTUWpGIQoEsmF47zsl9ONDKVrAeRAEhf6sqRl6KXh7BEvoG5jmz
	7EOBx9dGQlN5FMijbHr2qk849Dgp2vqdnJLiJmkfRZHdwZK0d9YwZJIoQEYFWlN13NEdTMscRZT
	YWelbI1z3X9FUojsbetnWynQKzp6bffqsjfIbNHpZK65IJkl0sAmYLplNwy21S/hAIoJBtrIkw5
	cNmxWYofQLWp1xV7EwixsOmki8a8YHCIhpktcOdhy2
X-Received: by 2002:a05:600c:218e:b0:490:e913:6562 with SMTP id 5b1f17b1804b1-490ec4cd29fmr35235545e9.2.1781278470979;
        Fri, 12 Jun 2026 08:34:30 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm6916641f8f.20.2026.06.12.08.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:30 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 12 Jun 2026 19:34:15 +0400
Subject: [PATCH 2/4] dt-bindings: mfd: Add UGREEN NASync DH2300 MCU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-dh2300-mcu-v1-2-ab8db1617bc0@flipper.net>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
In-Reply-To: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3098; i=alchark@flipper.net;
 h=from:subject:message-id; bh=4CdqJb5/HIWgveoRMI3NaAYB6L+dedEtCpwu5Ims3hw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTpqP3Nj81sWn2taeoKuTcNcRfLlmYlhwcG+24/FBm4Z
 6HzivQjHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1rh8M/x13n5tk9cLl+katEyfOLJDZ/yjji9ehq7ueSXRELfs14+oGRoaLAjH
 bTj6vLX9z/nvSsQPLp+UEWIp8PS/XftCqz2VmrTsjAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Document the UGREEN NASync DH2300 embedded controller (HC32F005 MCU),
which is responsible for gating the SATA drive-bay power rail and
providing a hardware watchdog.

This is based on disassebly of a GPL binary from vendor firmware for which
no source code could be found, so parts of it can be inaccurate. Only
the power gating function is confirmed.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml b/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
new file mode 100644
index 000000000000..847970c609cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ugreen,dh2300-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UGREEN NASync DH2300 embedded controller
+
+maintainers:
+  - Alexey Charkov <alchark@flipper.net>
+
+description:
+  The UGREEN NASync DH2300 NAS carries a HC32F005 microcontroller on I2C that
+  acts as a board embedded controller. It gates power to the SATA drive bays
+  through an internal register and apparently also serves as a watchdog
+  (unconfirmed, as vendor kernel sources are unavailable, works without it)
+
+properties:
+  compatible:
+    const: ugreen,dh2300-mcu
+
+  reg:
+    maxItems: 1
+
+  regulator:
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      The SATA drive-bay power gate controlled by the MCU.
+
+  watchdog-gpios:
+    description:
+      Optional GPIO line used to ping the hardware watchdog function of the MCU
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@4c {
+            compatible = "ugreen,dh2300-mcu";
+            reg = <0x4c>;
+            watchdog-gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
+
+            sata_power: regulator {
+                regulator-name = "sata-power";
+                vin-supply = <&vcc12v_dcin>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f1caa6e5198b..ca27df7cd684 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27633,6 +27633,11 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-udraw-ps3.c
 
+UGREEN DH2300 MCU MFD DRIVER
+M:	Alexey Charkov <alchark@flipper.net>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
+
 UHID USERSPACE HID IO DRIVER
 M:	David Rheinsberg <david@readahead.eu>
 L:	linux-input@vger.kernel.org

-- 
2.53.0

