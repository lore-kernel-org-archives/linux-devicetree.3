Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C43F3DA7E3
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139787; cv=none; b=aO9HUqt7BW94jRwygguEugAT5Bm7muwbCaK22nzSe2Y9ZHToEwiVnzzgAO70Ra2UEqKT7nejw6bkcEODLT+JBoVUnEIxxBJcmpHA6GBQZDCDXIi1lV6AFi7F4UkBYiOKQc8gmtR9X5KIU0PuXGvNjJ/zY1XClNDrrAiVuQG9t6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139787; c=relaxed/simple;
	bh=KecbpZ9jhqW0PqpT8ret5wpzs/ELT+axOn8WnjIaPp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1oSG68Il8SRONCSbXUsLuN7qUbgSivQwJTzhP64tIlwuYnfbxkBH/FpmNOx66dI/zPTJ70Xlpa5lCXcoUsgdbpjRZ0LdPVVUFa/HIvzTxPj0I/F8SUGDoAV2d9E+tUyfNJuh93YQgrn7T5fDPCQvTQY1s3naEfP9U8fgNGYI24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l0sTI5NB; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l0sTI5NB"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2373370b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785139785; x=1785744585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxedjhstpCr2+RRiK56diEei3PRjxk7sr6zgyadAKZ4=;
        b=l0sTI5NB1X6Eb8aMnoPh7EftXZPJVsEqSGgtQwpZ2QJ4h5bRRwivsBnGoT/zKT7HSu
         R+L1A4Rz55bq4lnJhIhMd4l2cas8sMB0ky4oH0mzfy26iXCzmoZm9x4bvLsoUM7bvYgd
         fDGlRaz2OcfoYX2J3UWWNIIlVVJGFtaj40KFYnx8cnSRxGoQ/16kEbXqyzukjABYjRsj
         5XDn3plXTl2RLi64x0VxIVkg4EUUNbqGHbX3xeB+VA1Xu9r0uCQj+i34d8GVt+y9lbP5
         ATkxxGejltqBImj9X4Fd4zQJPKsGu3el1EgRbxwfPOqo40oJK53mHPeePLiXGY42v7QN
         2Lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139785; x=1785744585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxedjhstpCr2+RRiK56diEei3PRjxk7sr6zgyadAKZ4=;
        b=QANzXM7sv5G1PxopBbaq10w6Jtap9/ac0UTQpse1Q4MX2LGqJexPNMKorwVe69cLmw
         tSRRyg448VK5KKLo09rCKGWEdipsLWJ1xKv/6Mo2dLNPuRzyz4gVlSh1Sa+ghp94Alts
         DqvRiMJaYBy2e7dd3GE6dH02Q8nyTSbWfgkEDnGB1zgtkZlX/L3deeiQKgpUieu/CNe0
         A0rBKga4x9GNAuIgOs4GeW8o5BTL7zE0kuIBLWbZrxdGGp1CT7/9BQdVQd00lZ20WEOk
         /U4ZWVK/HvKap3A3s3bxewVaRiyqU5sVYw0OSorcaeD4Ywb2ofI8FSfFnxsQcNrVzuVC
         GR+g==
X-Forwarded-Encrypted: i=1; AHgh+RrEoiwkWzRlf4B/omJxobsFJAmz6l71WkDp11PKVLfSNEhkp8bdjwS72f2DFEAxAhXTKAjrNRt4wWVe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy99s0O66mP059ApucTmkSrU7pbr2HcQe4toI7sF0olmueKfDQ8
	45Lq8JR1eURdC6lz8SFpK0pddE9XaWcoXeqc6N6tbPuSUS5tOp8XDazMRVHE2slKPBM=
X-Gm-Gg: AR+sD11+O2gFJH5D1JUtp245Yxd0QQD2JEv3PGUlNS2xngfrVn+n2r8BUJzVX0f9Xe6
	SDJugAui5/1D2we+4OPde0pWzNYPfRECp2SEZ3SAVs2cs5HOdjJcYkekkkWyP5+huyEkHsBER7X
	3gY3rqWwLH+g3VMPb3EYvHlJTM2m6+yHJ4z8n6X2J1wJvHZd5JLuJhOw/pRI5QKhNwWZdXNQbnu
	DO3IuLLaeSPjR1rwmsK2L8Uk7eAcxjCpm4gplz9dmvABS4+vD/EC+SaPgYEnAmzlXfzxAVh99ek
	7T8fYrDLA5zrxa6of9P9Fq/Htok/rNkhSZ+n3b81eftH8u2uamtPu2VfKqaKo15Zc270Gdtu01I
	6nkHoKFFMgcDyq/Zd0Q0FJ+ihb9RR8Lsdjp8Jlw0SYgo8Y2C5X71Uhcp0MoehgnUAAzVZzZeIGa
	THjQ==
X-Received: by 2002:a05:6a00:3409:b0:848:2f84:f433 with SMTP id d2e1a72fcca58-84e595ca5bamr5936517b3a.76.1785139785170;
        Mon, 27 Jul 2026 01:09:45 -0700 (PDT)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e577sm2630658b3a.58.2026.07.27.01.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:09:44 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 Jul 2026 16:08:44 +0800
Subject: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785139738; l=4379;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KecbpZ9jhqW0PqpT8ret5wpzs/ELT+axOn8WnjIaPp8=;
 b=tIw+J7j7txm0DxxqyHkWllN7IA4ndj2ys/kFYWuGcwGRr7BJTM0x7HiXod8SAVkCgk3DCrLb2
 I8NF3x3ojydAJDkBUTI4eYkDF5FmpOmoxXbAMb5o7W1Zocwp73bblbC
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add support for the dual-panel system found in the virtual reality device.
This system consists of two physical 2160x2160 panels, each connected via
a MIPI DSI interface. The backlight is managed through DSI link.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../bindings/display/panel/synaptics,r63455.yaml   | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
new file mode 100644
index 0000000000000..c3bc8df981df7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/synaptics,r63455.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics R63455 based dual 2160x2160 MIPI-DSI Panel
+
+maintainers:
+  - Jun Nie <jun.nie@linaro.org>
+
+description:
+  Synaptics R63455 is a Virtual Reality Display Driver and VR Bridge, used in
+  pair in Headset devices. The Virtual Reality Display complex is composed of
+  two strictly identical display panels, each driven by its own DSI interface
+  but forms a single virtual display for the human eye perception and thus
+  requires a strict synchronization of the two display panel content update.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - sharp,ls026b3sa06
+        - boe,vs026c4m-n52-6000
+      - const: synaptics,r63455
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios:
+    maxItems: 2
+    description: 2 reset pins for 2 physical panels
+
+  left-pos-supply:
+    description: Positive 5.7V supply for left panel
+
+  right-pos-supply:
+    description: Positive 5.7V supply for right panel
+
+  left-neg-supply:
+    description: Negative 5.7V supply for left panel
+
+  right-neg-supply:
+    description: Negative 5.7V supply for right panel
+
+  left-backlight-supply:
+    description: Backlight 21V supply for left panel
+
+  right-backlight-supply:
+    description: Backlight 21V supply for right panel
+
+  vdda-supply:
+    description: core 1.8V supply for panels
+
+  ports:
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DSI input port for primary DSI link
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DSI input port for secondary DSI link
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reset-gpios
+  - left-pos-supply
+  - left-neg-supply
+  - right-pos-supply
+  - right-neg-supply
+  - left-backlight-supply
+  - right-backlight-supply
+  - vdda-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi@ae94000 {
+        vdda-supply = <&vreg_l3i_1p2>;
+        status = "okay";
+
+        qcom,dual-dsi-mode;
+        qcom,master-dsi;
+
+        panel: panel@0 {
+            compatible = "sharp,ls026b3sa06", "synaptics,r63455";
+            reg = <0>;
+
+            reset-gpios = <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>,
+                          <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
+
+            left-pos-supply = <&vpos_left>;
+            left-neg-supply = <&vneg_left>;
+            right-pos-supply = <&vpos_right>;
+            right-neg-supply = <&vneg_right>;
+            left-backlight-supply = <&backlight_left>;
+            right-backlight-supply = <&backlight_right>;
+
+            vdda-supply = <&vreg_l12b_1p8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    panel0_in: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel1_in: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...

-- 
2.43.0

