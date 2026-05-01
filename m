Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618883A75B0
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643577; cv=none; b=t5m6qVpKSCyia8Vmt1buUlWC83EUFVLZgl3GsmL9AiM4OfNjlNFSkovxq+m62WDV+ZBE1VOWDoJgVK1j9AB5GX0hoQsQGLnNbLbEq99bh4Ycs4ugjXWSp7Sc2hOspEQeLiA5ssPVck9GWVd4yYVGQp9S/9tqS6bum1IOFKuoTZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643577; c=relaxed/simple;
	bh=RTl7Y1O8e+RJXuxSn/M/jl/nMzqeTvQ7RKDRGde9pMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLKwZjjG5VGUVck/Cq9rkf1rSNt8mePcBx3B1p3VJ1FdUBzxwNvn36wfyW8aXmPKamy6PipziAU+VqmhBVeRAiQGDjTs/dF1yRYNtCHvR8GDPzThcFgeeovRAX25qMyCbfOFZLAP1kwZumVLngGBiYhucTwTgbQaleSl51qUy18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IDKmatDa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IDKmatDa"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so1176162f8f.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777643574; x=1778248374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4a0NufHsK0XpXOY+2VZGRubm4xGOIO41KwE6sxp9fdQ=;
        b=IDKmatDa3BKv4dy9mgpNXGwdbFSzHZUVGHAqQX3DFrhMTJ9BSFtLN8SwcDC4ntaDU5
         MKpn0kX7E5nngg/gg6sSqcQw0nNHqZAsCU0Pf2+2pS3PU68GKDauuriraanrIroFAKl+
         mhlK5YqAGW9WxtqsnIgozoGe27r8FsCSXRFIO/0lCsCSqfWGLnWho5UsxViwf0EJEbVl
         RmaSzH1EFd7rl6RLq7Yna62JU/Zb1dxwIkuVmHc18KAA3TJ7iF1RLw2zl0dnaTYPNzCL
         5XXoZWMmFWggHLmq6laEKp21+tw9JD0DH3Ra2sNuNFOlHmbtoRa4YJ+EmCaSLrS64rCp
         StKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643574; x=1778248374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4a0NufHsK0XpXOY+2VZGRubm4xGOIO41KwE6sxp9fdQ=;
        b=LxRti4FuHSxGoIvV+eW19z/B1tfvEclU5p8TZZTx/EnwWBVSLJKQUrFtNu26CAHQdT
         bF5IltMx7QqPSk80rbDyDr6YY75t6pC3egcQAyNf5oHfv1oWyrsiLTqgdiacblljYmeR
         sUB5et7GHUcwCotkPyIqLNkbrcOC0TUAsmA2HuA99YRpTxlsZzCRhZHaUh+pVvvjpf1f
         oUhBY/sX+J7Bo9YLwubCP7zCbz8rUlEDp0sqNvyQiEG0mYBQ4i7Jt8zrM0VxjMokL0RR
         ZCkYqntRSAher3yzQk559XjjATxSZ7WuJXGO3LDJT69+XtywHdwriMFLA0hKuywgAuJL
         rTvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TYCEL2zh247qGmT46nbWe7zsGJ1yEAdSQ1uaEo337y5d7GNibl7y341qY1TUv1+BNghmSH2yMgx1G@vger.kernel.org
X-Gm-Message-State: AOJu0YwxV/O7iy/7WMQjlF10S3butS1rc1OHRfmGnl//5tfZBY+myr4q
	mxTD+Z9Y4YVaptKHUkyYNyJ7MpX/aI1cWA2sQHxbQEdfqzKrhOfXrUnwR5iG9sU1PPE=
X-Gm-Gg: AeBDietUUQqwP2jtmFhYaAEg7rxtc4RBqXwIqlUGShN0uvVxdIvo0iHm/IovRjP/btt
	4J1zto/59Pd6020Aevwa/dxE+HZrxeD0FBD2X7JL9OVjCTuOaSZ1Wv859oYu8bHz9NXxg03UrAc
	iLswrvRa/hyE+6QG0CaF7mY4NkRRl6bChTnMEPgI+1X4Y7AFU5VMyqk/VfGq50ZiMLSh9uwDNzN
	idRQVUItj4LgIBB0K6HCEtXME+e1lPcYzoS1gqKVw4yuOtw4Xbl9kxulVH0HKrOycZv3SX95DQz
	WKWn+nIAvFh+3iP3S+TEYIN6NAf3xjHd72rn0KYiC/1jaOYGIyzfyMrL5d7xeVBR3WEr3XLmbml
	Ax5NqYRFpfAziSnoqjMQw69x58IJQ0lj6HJYzKVfPBtW5YHwxBvPpuZTe2lbQWkcxkcSiA+ltyZ
	0OUiln1/VfWap4ctE4LtoWGHwJGThxGdK6pV3CTeBEI/D0W3utar6aHa/2ZdG2O09/TO7nLyDjk
	5iL/JZM
X-Received: by 2002:a05:600c:698c:b0:48a:599a:3716 with SMTP id 5b1f17b1804b1-48a8447b63amr127933675e9.23.1777643573958;
        Fri, 01 May 2026 06:52:53 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm143934275e9.7.2026.05.01.06.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:52:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 15:52:45 +0200
Subject: [PATCH 1/4] dt-bindings: display: panel: Add Novatek NT37705
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
In-Reply-To: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777643570; l=2217;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=RTl7Y1O8e+RJXuxSn/M/jl/nMzqeTvQ7RKDRGde9pMk=;
 b=YFQI6GCHBOcdRW0vNjaOfwbl27MEuOcdgabIHkYmiIZtih2yy1DW7qHpPr0Pq0sQlyUKJURh5
 g7DyT2wAbuIClh+j4KMIB37E2sRxHmf+79I3mIe8y3lMfOkFVEP0dlw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.

Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
from BOE) using it.

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
2.54.0

