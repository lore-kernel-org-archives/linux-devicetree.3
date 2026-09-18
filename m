Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A310649F10A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742415; cv=none; b=pS9ieSt8K3/EmnCMIst///BFjGOEjUHz6fVhoNKZlXc97T5aLL8ZxNVazhO96zJr62BYKLGVTa83TYMLV8+ejBCm9N/mVL3USxiHPxWGX0HTHNEE0YTa25EH3sdM5WslTl1kTT96CmFpbMmgye55yzXz1uOYjwsiM8pYXM1mPkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742415; c=relaxed/simple;
	bh=XhMyap36SF3JF1+9wLSfeQ7OCyB4xUGjcggtykCnHpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5bGVCwSRVd0M7V3vE+/j50XEyTFPz1VFjwlH2a+uV1ol+ocvCJmUWAx10oaqk5UCz4GNiwMqI8FAXEKMxwOXW9ormsEi0Z6M75uXcdEKcAPGqkh/xS0+DngeURIqKw0EUwQhRtYQitrviy4uWS8nuU2q2i6Si09RVy2uhl5F8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Lr4+E6QG; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Lr4+E6QG"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so1399103a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742409; x=1790347209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/IatM9vHTABSDwa1SOgukfIbmpJsWxfSXbs/7yaZiE=;
        b=Lr4+E6QGWWu2UyI5DQXyE3lTeH3MBcczStDEM26fyP2TNbqObSpXt4udDpGDW2uQfM
         tMp9TD558mYQqWR4GmcKJIYoiMMXccPDNi6Oo7iD+ox0Z4Jt2b5pwsY3uAlwedIcp9VK
         yuhb6qj+1xs+YmylcDPvU2z7VFE3shW5jqiTXQ7INB23zEgEOTD2z5gkaIAP5LpzpjZk
         H2nyEq+yGHrJlw/yIwG5Et9oPosnDrgKJCoRUb5lSco+DJDqwwjz/1X+XcMuu6k+PRbK
         5CSVqrt4EIgQskIKKrOeH3fE/mIujC50dtuFqP/PChAnOsNEc+OqWFw5HXwPMzJiIMs1
         Dtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742409; x=1790347209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/IatM9vHTABSDwa1SOgukfIbmpJsWxfSXbs/7yaZiE=;
        b=BXrP6TRS0lZUnNDq8pMdC1XE9V55AaOEwxq7RrPYVzhR3vno5Hls30llCnXjCB68qb
         OpdhJt2OZ3tf64s0ZwZo7qXwwDIlYVPBGlwgC0LFyScror3NGCGQvGO9Yvh5nMSKV+Ic
         maojLOpjK1ngxYdrQ3LRuTLu8IBhOwMH3OdsWWLuvx0a1ITg4Sa7PCWPvClMVA0D9mCo
         Y6ZNaCL9hAeLNmmA4w5nMxNcjmf2nL2VE+hBwgyGoXGpgQHPuiLnn7G4TwjcLrHvuZlc
         U1BGzf6aF3VJUqmC5jS5JC9JZjVqGKNOo5JWureySWXkEb7r2FCyTqmWmEP0cadNhuNQ
         LFJA==
X-Forwarded-Encrypted: i=1; AKwUvBw89RW7eDj/Jc8/8hW8Nh19/fPRSbMPbDE/St3B0EDZI75pex+nwpioSHWZKmxZU6LGVNLqot1WP5vN@vger.kernel.org
X-Gm-Message-State: AFuF++keJueUN2sg0b+BA1gr1fWiNoaEKkdjbYjsv/D6A6zMEso9/ZPw
	A2+PBabp/r6ZIUKA8kXRjE28eAe6VH/5olh6WgdqDZP2g6Y+WINezrI2f47DC999hZg=
X-Gm-Gg: AYBFou3aOYLlRJyIJId1Y6Sp2CUd7VFsASfnr1lavlgh37XLFn8mgsRo565y8yrz55k
	lyWsypAZo3oLm2gCfiFOtuuA5LhblkZAcM+zgP1UucHz9zrV6BS8qtk3DTtFpG65PPuZufxSKP4
	uSPlG1XsRqbXBg6NKvOzONdUp5JU19h36ApwEUjY6dc3EV9qtMEOkZVirWSDzXsOgFsu+YhQ5xj
	htxboGjpYUamUzpvRaZifeEC3lhbC83AC0SytCO/zSO/7O43/Yg9EAx5KqS36KuuCO4dz3DfWro
	+/+keMTAKi9sNm0BH3fmqYRj6IH074hXYrQMriUBdhxBXVSzceOtr5ZXv5GyU+kguD9pTzSzAYz
	xRE7oz2uAbESwlJ6UbDCBuFTq05DswjC+eUPxgLr9rqwcim5vmbi9zPsyxR10WnMjqxhEwlb5XV
	uQLHvFlrExdzUxtfFCM4MHaKNcbO6zRHWPFGMfqrrN3EiOCVAh1X/llVKUOs9SIkfbsDlyupX7O
	rk/qlwkG8FQxGC2ZYkK0u2C+mqo54ewu+cCDuMGfOzMWwCTi4oW
X-Received: by 2002:a17:907:3f24:b0:c29:439b:d5c1 with SMTP id a640c23a62f3a-c2a1585a618mr282179166b.16.1789742409410;
        Fri, 18 Sep 2026 07:40:09 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a369esm64244966b.9.2026.09.18.07.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:40:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 16:40:04 +0200
Subject: [PATCH v2 1/4] dt-bindings: display: panel: Add Novatek NT37705
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-fp6-panel-v2-1-6695c4008920@fairphone.com>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
In-Reply-To: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789742407; l=2372;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=XhMyap36SF3JF1+9wLSfeQ7OCyB4xUGjcggtykCnHpw=;
 b=zDpWdXo+ogYNi4ESfbfwF3oJmTY6LAq8995rP1tN3uxmV+O2gFbbKUT8WcCAAYO84wGfj3gmo
 ZGbpua155biBy68yvD0D4ykBtKSEAE2seq6/VmZvCjM/RGc0JEsb4OB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.

Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
from BOE) using it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/81a3c207-4d8f-490f-8e2a-6f3f4c2acd35@kernel.org/
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/panel/novatek,nt37705.yaml    | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
new file mode 100644
index 000000000000..1c796599f6fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37705-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: boe,bj631jhm-t71-d900
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  dvdd-supply:
+    description: Digital voltage rail
+
+  vci-supply:
+    description: Analog voltage rail
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - dvdd-supply
+  - vci-supply
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
+            compatible = "boe,bj631jhm-t71-d900";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+            vci-supply = <&vreg_l19b>;
+            vddio-supply = <&vreg_l9b>;
+            dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.55.0

