Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501830;
	b=o4SkeCmiLI9A/ek3OjleWlt5uTJbDFnh58Gl2lJuHnwKN0zlrv5HvdbbLuODvq+a7GGd
	 vAQS3YplYaV2NhHovbW1I/V88DwlIiLjHCRw6drJb6DtM8YxanjNTHu64SV6YknboZ69L
	 6Zvem3bQhhFEZYJ9ecNqqCbJQ+uYrJC79Vk8/6OKENzpMMvDHwW6Uqa0PKUT2Xt36IH6A
	 sUfx013ZYw7bRD0+fOzONzp5a5w3NRPhOSBAfxByYVpIqrsdEwkhP5bj7t0N9pFUO4YGR
	 qk9yJs7PW6GJdfGphXrE19BJb0iRQRJGL9rNq3bInf1uyYTTkPS079Jx0yrvI1zeu1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UMXtQLb7sV43jXsaXOJM86dQ9CSAx4ee+JilsAAN6V8=;
	b=ohD71iLD40eBwwpB0ASihBtnEQHm4IJBeDf3CKbxlyg3TKQM3UKwfTs+L2CaXhBzCuub
	 V7ZEoYuqflEMI9jafh/WXDZvgrdUqLTEj20CcwvvhLhk72+g+ArtuoEKY+EsbTlfLJdoh
	 YxbkUntwt/b5MDQsEe9v1qFv+LSTQ8D4ElliG2G1wxc75MHzvf3ph/tJjeOUz8bJ59TeI
	 7PZfMn4137ut+ia+PIviiHN8fhOCUp8lKDaoZjyQIN22S0jvGLEe1UhKD6VyivvHQ52R9
	 F9Rk8wRgIMjPVaywfsrBJELzsIS26nyQj7gZu1I+T9pijFLKuRNs4oz6cVYH3ZyzIUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jCZeVSVW;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE02060A2625
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE02060A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jCZeVSVW
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso998068a91.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501828; x=1793106628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMXtQLb7sV43jXsaXOJM86dQ9CSAx4ee+JilsAAN6V8=;
        b=jCZeVSVWy6Yo/7XVtt/sUEblyWqkHqmvfXfy7ooW/vphOjTrtORGd8o9KjDduRAyhg
         VJCqqEp5ojGhVuqBFMF4McBe/VfyLPusySjqayYAuIHsnRqEBYu8tDYpGLWH4Sh3JiO2
         ckYF6AZTGjkkt1W2k9cL5p5GDAQYsZkSumEpcgBKRBZDKG+kq3mIk2/hEE5VGA3aY1VR
         OJE8ejk9AgNeYCosOChmElUf8i3iMbvTCJys8NL7nW6Lx2BOmk+g3vDZO0srunlZVCeF
         T1HERafpenE5QlliPwxhx5RhDt9Kb0M8rVPBkNQj56UGjMXmlmJbrLgIzHBrjxVel9Ma
         W5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501828; x=1793106628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMXtQLb7sV43jXsaXOJM86dQ9CSAx4ee+JilsAAN6V8=;
        b=TyzftZQCsKTOX2dLaaDalrPULHdStvHgRzmWvINuYuK7+MoiHc3MbScsfJ68guUI+E
         8YmzSUy/DPT1R3Pk6DKsegOeLg3ZKJok2Uj6pUF1lOE8WFEIPrD6h4CyuHBMrXb2fJLq
         w+3phSmqPZOBvydcl/rHUoblDSJPZZVeayl2ztv1prVlX5AEr+X3VEep4rvRhGQ89qGh
         SI2r1/JvFoN+nJCbd6I5h/K1gjHXKYkBCpv15izcgRwHexL4rxsmn6jS4YstVZsOvZgM
         ukXVywcUMOY+dQYy/fubAYJiRo7uJq+ZT+uxT1DjEEFruFfVWjdqY7AcuhMpztOeH2BV
         YN7w==
X-Forwarded-Encrypted: i=1; AKwUvBwDremD97J+aZz4F8axzCQGNlyONMnHyzKU/FMZWxziPG44xy90fX0CRHuXyJQ8GNhbvLo47N5Cd3dw@vger.kernel.org
X-Gm-Message-State: AFq9FYIPNqzFI7CuX8rcBuOj/JehXGmdVyoKz5swXFCzD9OIsDqrnB+k
	1yE+LCfGwTG/5+D1sGztRgneGV3S0I6Xk+hbk7ToCKglBNfbFHYpqqpJPfXkl75Wzqi2aw==
X-Gm-Gg: AYBFou0mQbgzWiv21TGMgMavTzKewQvhEabBPTw8YVA+aGgZs7rA0OZ1jQANyG2HdIK
	+CkmyIZxO1GgST3yv3C7AzTVnOjk0WO9B99AJ8nqMCV8EaOIL4BMff0VXN7wD0s4LkI1m7I/9uI
	swxLkfYVZLDwKk+L8Wp7YDbpG9DgnqfsMt3XbNHdziE8lQgR4L5eABHQHANqQruZ+ekawOgaYi/
	Ob+PXxkqoCQrt2vJb0El/NMX4nvlA9yCkADm0xbxQ+vAztAvXqb983rtF28dvRn7p7aD61W6wvm
	HYZJbUpWVThuT+70X48JE7WkIPkh2OVkaXzCH2O6FUW+j4Fvz1OB8ulzPN1KHjByKC3kWFvg/5T
	b5adbdFXNK/IWct7RaAcGRk14G/+MTR852WqMTizggfBeqvgNRFIDJDKwwindXXUDS5LivbolRG
	+IqNnNi2GVX+qrQ7adOfEzNEEJwgG4A0UQ07fWQccs6a2dT1qCMSmbY18=
X-Received: by 2002:a17:90a:d00b:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3acef29e6ccmr8123502a91.39.1792501827888;
        Tue, 20 Oct 2026 06:10:27 -0700 (PDT)
Received: from Linux-PC ([2a09:bac1:1980:20::1d3:a8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm10131496a91.4.2026.10.20.06.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:10:27 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/3] dt-bindings: display: panel: add Smartisan TD4362
Date: Tue, 20 Oct 2026 21:09:33 +0800
Message-ID: <20261020130934.2289011-3-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020130934.2289011-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261020130934.2289011-1-tianshi12127@gmail.com>
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

From: Lu Chen <tianshi12127@gmail.com>

Document the Smartisan TD4362, a 1080x2242 command mode panel
found in the Smartisan R1 (trident) smartphone.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 .../display/panel/smartisan,td4362.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
new file mode 100644
index 000000000000..d9a18cbe635a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/smartisan,td4362.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Smartisan TD4362 MIPI-DSI panel
+
+maintainers:
+  - Lu Chen <tianshi12127@gmail.com>
+
+description:
+  The Smartisan TD4362 is a 1080x2242 command mode panel found in the
+  Smartisan R1 (trident) smartphone.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: smartisan,td4362
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vsp-supply
+  - vsn-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "smartisan,td4362";
+            reg = <0>;
+            vddio-supply = <&vreg_l14a_1p88>;
+            vsp-supply = <&lab>;
+            vsn-supply = <&ibb>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.56.0

