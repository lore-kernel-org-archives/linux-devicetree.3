Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C952F547F
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178154; cv=none; b=MttVizi8eZFSLKmu9dK204ob1YscIi7DzEVewsBzni2MoDCCY4ZZ08hMffFcWR5XwUhVfnOdWwoQtyEhFUzrOktm6H15ov7p7h9d+QZRg6uXithidoZuT+fUTSPbCUUAilx0yvmLd5k7sjh6BtBXfA5JxCZBtTY/bpLRRxxkEJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178154; c=relaxed/simple;
	bh=74ON2gxJ2EbMlsMpx0629ZNhdQsnwZKCfK4Lcaq26K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBKD/2wB4vR3mLJUcQihK+0VGAmghx3zpYR25hgBJRfd73C4pJzIFIPSZd8AQE6p8/T3LVrUqKBSJcCthVc6E5q9Qi3QNT3fPhVTQnCPMtMm1YEWgFxcHQdA/Xmfm/LvO1ISS33ALXQOpgpb+J8+XvC+ISsbKzOhYlSd3igB0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gt5T5Uva; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gt5T5Uva"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so31826445e9.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779178151; x=1779782951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty3MbPaO2vFwqPZjz6jT7S+J98csHl+q0+lwLd9Yl/k=;
        b=Gt5T5UvaYKR59oQw6VIVSGo6dvg0w6Cy7arO0EOIod4kVaDb00A7IhuOpZc2uIq2dJ
         1PPZHRkVB4HiSp/EcEmRzwbZ1Y2VXuOQATD/QZHLBC0EESpkv3CGHZfPaRm/NNzue6hP
         MRG29rsa5ex9LkSVC61z3JZlt36S3Ixplc2JpL2/qzq42b8WSYGDdFvY2KJQfjPWH0IS
         5+UWCOsBpdAD8WTWN7iuanFzLFJ8JS+w1fdUtEutEPleD4aLhZr0b8Z5wwfsQ77/tA56
         AjK2YUx55L88lZoGlgceToDj6G3AHFXOTSuU0OCp6Oq8V9tw8FPMSargZiMzzrOIoBuA
         VDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178151; x=1779782951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ty3MbPaO2vFwqPZjz6jT7S+J98csHl+q0+lwLd9Yl/k=;
        b=Bd/9X1W41C0ig7HSgDqAlnTC/8saNfHUGyZSa3DjbI4cmXev68fjOnQeQ6OPpleZof
         7fe30D8rLz1FjCZKduYvnypmMYBUv3LJKQ7bPzKAOFgyo5HYdsQRfTONQV8s+/YDBVuy
         kGQtmT+SDCSEtaTaj2wFDNK4amIo+sDesTeOl1btaf6nnVgtKzvJnOJSMzZoxVnVgwPi
         fQJatEvspXdzwyA7uZgtkUcwvoABAcyKqs5CgXfaPg9idji+kpnb8bmni1aBldjSKW4h
         nu/7w6cg9mx9ujBBt838TCygH81cknbYRPpTHsxPQgbdp9tl+mJMUjeXd58nqCGnaFTA
         v8+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/8tjHsYm07p/+p2yA/SbMACWYI3ROVPJSBsvy/nXDRAtCcpeC5Fbyxdnj6J63Kkd/Au6sWRl7Hoa8R@vger.kernel.org
X-Gm-Message-State: AOJu0YxfsHJ899wdMUEMzUkLo7HMZXIr8SKCEm+8P6CVoyLo3BgQJ+GM
	jN4977FcKwFSyx1PKiSxAOPLmE8xBujk+RnFR8TALbZEX9ZhiRTmiqradzAi25r0dB0=
X-Gm-Gg: Acq92OHxDAKJhdqfyyHubG0FwizNncBA40MAvr8xrJ/Qj31VtoobGOp7g7ErmTCnLtb
	N/5Cp2cxUObMPXAOVrtMUu/0azpJt/2bF16hzVY1/uqPHF+aphjKSwGiRmTA5gM7IvHWIgwrp2q
	qTZ6EQkinwlBJO0eLLAA2cSu/sfWGPSoZS217SoIznnNIFfkpRtV9SoVtVgNT1e6BohNVvoK3CA
	7Gn7/hCIoXd13CbHZ6G0QF0jZrPNraKElDmwb9roBcFUjBCuG47ma0Ydxi46N/JH1s21zKR81Cj
	TsLimlA5wXd/xmAIa0YzThFluiuFsRotD6McaAbNvybfJKWJTBf5pSmzHZld53E982drSPMzXwM
	iPS2C5+5k/QrO5i/VT07ilUlIXs5WXm3xA8uZpwL5ZNBgasvzMXVLhJc+V6WIkCHx2Ut0jMNbPp
	gJmgIn5StGKly6pVedCdwgxRtA6+7KCGuMg3VEyFO5e176
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:2a24 with SMTP id 5b1f17b1804b1-48fe66204e8mr265626475e9.31.1779178150834;
        Tue, 19 May 2026 01:09:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1a22csm42856373f8f.19.2026.05.19.01.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:09:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 May 2026 10:09:03 +0200
Subject: [PATCH v4 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-1-b8929af5e951@linaro.org>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-0-b8929af5e951@linaro.org>
In-Reply-To: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-0-b8929af5e951@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2860;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=74ON2gxJ2EbMlsMpx0629ZNhdQsnwZKCfK4Lcaq26K4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDBqk73LPPYI327526USPaCyHJw20Vj/4ghKvO5P/
 Jr/lFtaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagwapAAKCRB33NvayMhJ0RKFD/
 9Jfwj40U0BJVK1K6/jNsfgqHv2oeaPgZ4Gq91/o8rZDwuIKknD5e+MVYdb25pkr8xm92c66LqRSBcB
 NDMLfrfbOfQkdtUZi2ZQq9ktebe/N05dlEF6DBwCRxpTv9CGCWmtcyVrCfWWjcGrMA8rJtnU6GoTWa
 K935miaPSGwpx64Ag1Zg4vqMRN4lYrLQKW9d/Jkoo06532/kAqGcXpfmDAMqab20zWJNDq2ALEGZf1
 dbxypjJFbZgBsGfJXfva42ExqdR3OCmxbkl1PwFOYeuMrI5yeBUk2vQHfVcFgVXLIPSEn2/7wXCryb
 MzmBNvCrsP0BPcLGYLoHFkp5URrQjQAh8M4XsFjkfVMVwiAl7lfm1DG3nex501ZE1PRKFynTHv6OQy
 +Ta227jlmeWNeC1Qbwot1qyVKiHb6I8JURqDABOq9+NfQ4+sy9jaPvxfNsrZi8w/bJWDGkIS+1yNuj
 zsCeSLkv4pvGel6wBZPDYyc7DFWtV9Kwr3U+583dLSESPSXIZsXVgmZo6uDm9E4nMZjs8TavTpjAHA
 eB1Tusgbg9GIpQIGbyAZ0Nb05vU+RVR9bh2F7xFxdgvGuUnCHUHqFUgYfFcbAZdvtWyxAJBClza+GN
 rmeZV9oKdetkGPsGcj8GjTCqmJ8FR7UooXQLxTYzU0PD6fFzsz2Rocjs2OAg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Renesas R63419 based dual-DSI video mode Display Panels found
in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/renesas,r63419.yaml     | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
new file mode 100644
index 000000000000..e4db01f88302
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
@@ -0,0 +1,97 @@
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
+  - $ref: panel-common.yaml#
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
+            vsn-supply = <&vdd_5v0_pos>;
+            vsp-supply = <&vdd_5v0_neg>;
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

