Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ECF3CF67D
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671056; cv=none; b=Wjtn8iqJMvayfk6yqBaApK61IUY1v3Yhv+34CruwvUP3/ql7pOL1KEEXY5i7MIUiJKzelRYEMsPHmUDDQtOM3b9F+8ve1OsNg7Q7r79aWh6DCZEHKMMdVxrAb+7XrtRsfcJMh5uzFhgm62MU15teLNtvgv1KZQjycTmDUBwWxEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671056; c=relaxed/simple;
	bh=Zq5948yoVNWLdfl4Pn1AIZbbP3FPXFuxs6toZA6iUAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=snkPfHiB6+dPJmNhWBpSTFNu6wxF9i8Ay4RhnurP3W/YUaYCF90ck9Qo8U/z4OWonfLgdsLCO1GzbH5l097BO+AsJMXNjguFmfaipHuAbSfsM0QS69XL8LN7lUgmFhqk0DpnGV0ZYXLH6NJZrJItoVlgYytwl+lOLDgBrV5JwsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIJXfSlp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIJXfSlp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so22218385e9.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780671053; x=1781275853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvOvrszp2Uvv8rX7bLK7ODaTkPYIPo5Pf15awE1QSpg=;
        b=EIJXfSlpZdz8LYH2qLJlcJ3CfS7DjvuUy1b6iYau4FCEFBf24LTp//p+N8nP+stdrI
         Rhv4jt/nf53I22HCTYQOK17sWKEPLiRndn/AFnJCNGXRZ9LaDRsnPVFZR5P3F/OvVySB
         cEys9YDk2lWOjE6yARwEbRaCvd+SaS4PgIYlTYNR/6GwQkJM/WJR3sCBniws7RWp561Z
         2vuzHRngVrCTtshxuXHX8+9ogSQ5FBWBfYGvvStweS+NG4XVvhkWm59iu28HRWRImaBi
         hrJDZJ1MujWDI9CJBnGukL7Q+hy4hRdnvaYAfZ41hywVkgJ8FT0hJdoicf0gHAuwLLyY
         y56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780671053; x=1781275853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hvOvrszp2Uvv8rX7bLK7ODaTkPYIPo5Pf15awE1QSpg=;
        b=aEYcLK5PsN4xnb6prTZTqCz0YTCmXoBgi/qaq6nkmidE/voxPn5HMxXWIHSDI5S229
         aHaZCwqiUNvJKX0kTSFqy3TtBfjLmsVKnjZpw0qVJPEfM6YseOopVNSuvlofIQGPtGeb
         PVL4EWwFUWxXBr+MMu7oMgaRg3EJCEITEJ6+84vbpqGuCpM23g0fCyPIyXOTZs9tOPnB
         FUrZvYC2IdPdzDAHzgpoLFxeronrpey/oKcycZH4E5fX9bIDsLHWzdpoiC/JtdetqvC4
         xqiPQrFRn0p047OuA5K9f59nkxKe0n7B/syNWvBWREtMxfuZ7KEuTy1e2UGUugDqnL1H
         vMTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+scyGxoXsy5k8weKL9q3vrE/QUleldMkVkYM/L1H57/BsNACEZAY+5yuW1VuqpOdUYwvbgOknJriv0@vger.kernel.org
X-Gm-Message-State: AOJu0YwPEHbLWVn8qoRTnEuC0i0lYWbPQKElAirporCKAIE/4Y/VO+rA
	RBnU+EVynXr+TjVZv+lqP/8isK0p8pCh9CkiGeIdNQoldvvQ26DRQOYxD1JkTJI16wQ=
X-Gm-Gg: Acq92OHBBAqD1EdvPDBLNR5I6DLwDZFQFVJ3EpYCKZcNOwLE52r5zP9dSP95zvA9Yyo
	Ro8HZFtKPXHb6+MfRFJUwQO4bZy90TaShEYCrgqk2EbG+S25rqvZi+id1dyjSSBNKAir7Fm1ydN
	2C16aAfhxLOOasslyWgWF8TIZsAOziR6UnhdQS/sP28VBbWg+uweS/ikPvZx63/rCHi7P+36d/P
	XqHMtH9Me96nFtTxnAnCgxfPvyFx9EWdWlZsQZp4j8GXUdUWjjvj1+xxVbk2GhyV7TxCd4RU5V0
	HA1rn2+RsoB5Th4qZLCHznlwjfpv8N7acZdECC+47Iv8B/8hiq0zhWYG+ooloM5TWCw8jcJZ9VM
	Aika5K1LnXpsMEwuEzU71vET9APCcDM0fU9A6ZJUq3xUKMjtOUq3x3LMff+IDkEYbBDMOuaFCNs
	dLZr0sipjHG+QgUz+5zjDMW1fCJNn4FQH/1FyxxvUeB9bfJTiBLqcQ4VU=
X-Received: by 2002:a05:600c:1d2a:b0:490:bbc1:d508 with SMTP id 5b1f17b1804b1-490c258f3femr63175265e9.1.1780671053233;
        Fri, 05 Jun 2026 07:50:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm176178315e9.11.2026.06.05.07.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:50:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 05 Jun 2026 16:50:48 +0200
Subject: [PATCH v7 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-1-b84b6da84293@linaro.org>
References: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-0-b84b6da84293@linaro.org>
In-Reply-To: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-0-b84b6da84293@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2928;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Zq5948yoVNWLdfl4Pn1AIZbbP3FPXFuxs6toZA6iUAM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqIuJKaC6NnAOgXUpHx2SGqu6VbQSUlcXpB3nOZamO
 e5huDv2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaiLiSgAKCRB33NvayMhJ0Up7D/
 9r4ovOAYIVK3WcNFHk9qeDgV9eLJu/wIf37wDry0xRxkzvRmC6Cxgs6TF1QcrcsteEf/pSWwYG6Cti
 8UHPLE/vEo5petdxaZHa5MQzI+uWKlSiC7ibXpIGSvWvw7M+HtvU90jPY2ugT3fEz+DY4sLrpjTEe4
 5KpYHE5rwWJfXpywOinAwxBHpejy+HLECbyaimr3GO89A/GB2IKgVGJpv6jp3ufIEIUySd98ID0abj
 +nbkRM9rtzswEUx8bmB9n4e5MjHjbKQP1CjPcksdpJQdGVYYXYuL3d0kBmQJV/FueW3s+s6iQffCsh
 3zLqyWDB17EKdTorb4laMx16T66xKLtJOcItLy3WS8IMdQvF5x3fcQn4CneKS0U4NjTeFOAntywHi/
 32YsArVDPT3Wlk6oC9lpySjkmBKSVR0VQuwlhdYPChz8JjkSwPENMUC/11mWWrJnBg1x7b7OZ095Ps
 sU5nWEv1wd81lveWNhTz3/NjWPouhIv+05Y/ZjQjju6iPbfY9ft1oWuSV3HSddtfn4sqQW1ZtYMlSM
 k1S1xamAvJCZtV9tCS6E/EZWue2xUiXkcLUoRP9ARtC1qq71dcMU7VqSkNUeUokcm9tcOZKkIz6/Ol
 RzYfRPa8WJxgQsGlP8w2ZO8ZQKnycKEReAnEjlLsdFisFmUUH6GWBTMi4LYw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Renesas R63419 based dual-DSI video mode Display Panels found
in the Ayaneo gaming handled devices.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/renesas,r63419.yaml     | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
new file mode 100644
index 000000000000..adfdd2c300a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/renesas,r63419.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R63419 based dual-DSI video mode Display Panel
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The Renesas R63419 is a generic DDIC used to control dual-DSI LCD panels.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ayaneo,wt0600-2k
+          - ayaneo,wt0630-2k
+      - const: renesas,r63419
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vddio-supply: true
+  vsp-supply: true
+  vsn-supply: true
+  vci-supply: true
+
+  backlight: true
+  reset-gpios: true
+  rotation: true
+  ports: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vddio-supply
+  - vsp-supply
+  - vsn-supply
+  - vci-supply
+  - backlight
+  - reset-gpios
+  - ports
+
+additionalProperties: false
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
+            compatible = "ayaneo,wt0600-2k", "renesas,r63419";
+            reg = <0>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_3v0_lcd>;
+            vddio-supply = <&vdd_1v8_io>;
+            vsn-supply = <&vdd_5v0_neg>;
+            vsp-supply = <&vdd_5v0_pos>;
+            vci-supply = <&vdd_3v0_vci>;
+
+            backlight = <&backlight>;
+
+            rotation = <90>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.34.1

