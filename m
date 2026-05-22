Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA0A2F531B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454294; cv=none; b=nJn7N6ilOoAxdhcKRNKjSBMBnRV7O5EbOh943SnFYo7oulvpyyo9IP/78dQwBhSV4KhEZTx4nfd4GgV05SqVRy4YuCJ5CvXUcONE8ZJs+TD7nC/UROuHZZo2wiLKSVf9zitrEjl5nVfxUQlatTjsy/ZBx5+lxjQ25+nGbUCBGxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454294; c=relaxed/simple;
	bh=Zq5948yoVNWLdfl4Pn1AIZbbP3FPXFuxs6toZA6iUAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASbDFj/sLJJqUwO72BdEw/YWVXE6Dof3LXrIlnLDUIrWHVBTqPSK1FQKvvZYC5GUnHMme5iBtikN11gXIWPmS9CTmbzs1xfGLfHpyzuM/W2nWe6Ot1sc/FSOpHdqi1ZAmy1f7WiHB/AixjRZJmo+5XQDCmh30XjfKeg4Rd/kefE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0PKa75o; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0PKa75o"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso55051595e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779454291; x=1780059091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvOvrszp2Uvv8rX7bLK7ODaTkPYIPo5Pf15awE1QSpg=;
        b=Z0PKa75oKDAE4F5j89ZtDkR2OKTLyLqPKMhfWtvFpCX8/2HUdNV5E7ZiZz1WF+e0Du
         x0m2aQEEYlpWAtq37/Hyr/Tu/gbjCb7KKKQDoIIfTG+JHjdHuc6RPyW+ZxBGSiXXBqPk
         HGp7x6hrO7KH99XPGjUYBtib7lxdkwPozaUW/q4CNTvOYbvPTbj1UWzkG9ffu6zgjFmP
         r4JogTAg9RWB9aRGX615Jr3iPt30fBIU/Llxh3a5sbO1wyCWqiSHaFqwLBJ7Zdm3/tDU
         RQW8pdynZa7znElgvh/Cd5AHAOzGStukKAEMwyWynVi20vclTX9sky3e4WW9R9RAGbM9
         bDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454291; x=1780059091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hvOvrszp2Uvv8rX7bLK7ODaTkPYIPo5Pf15awE1QSpg=;
        b=IeaZRcEdDivMsDNmOXBNo7kGhPmQFrksHefaO5vXyHfzghvKZkHNfi3HaQr7vNyxYV
         WqeS+p5aEeQcOki5l74mRFv515fJ36RsNdqqHqJelOWWlQcRhbc2jarcoUl8kHA/TXxR
         1aft3bu6SvgwTECcY7tlanThv3D1i1pBQSFCnXsUY74DTYXh5Py9SApIKdpTlkChalhK
         0iKldDodMv5rEGhsX7O55k/w0F/PqqewsOlSiWCIgU7Z18uncG6VEouJ/zzXstDrTIl8
         SuLUdBe5db4Cv7AmoV+ZTaYLzxlBPHolHs8+XEo2uvLGe4nFmyrzj+XD/oyCEQC9pCNT
         zAaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3a7fCrKfjkS7Udufww1IPgIcQoZcx3mN7iHC7W4f2ssaEWfFowbmldQ95u0LDXQM8NLmkjxmhvsKW@vger.kernel.org
X-Gm-Message-State: AOJu0YwuKQaQ6RFO9reokFi/BBB0UbmCddKOmthpQ5YQ1pstXC7rJmTE
	YFwsa5J70oql9YXbRo7AruJ4TPQZJ2PfcmnTvgUcCjYnsSgYUPnmOp9eNhSza5Zp/e8=
X-Gm-Gg: Acq92OHtraPwLVPS3zZ2Oope8glGg+FxGiZ3rD/Dedc+KQiRDqopJAuBYqdrSijJ6LX
	HjK+v6oCts9FUdGNciEb8A5M1qiY1ITeBwachOKkLYIyPnP/Fq6hU4HLUcNxTy0Oa3yzONECeld
	Khd5bxww14Jt2MjkzU1EyGJWf9v5NDv0Tgjk2HMfI0V5WzrnfSEh5viURCSuL3yw9+ns4PRVcLB
	dvH5X8WQTgDwATSIXgi+f94LNVQV4palxKsfbamXr1gv6sLi4IOo70IqsAgudCgKSIOTVmp+i4J
	xZhEnoXV1X1tit+RD2Lz0v6rhL2U9Hz315yCeem+Bx4KFCaEE5ZA4JmzFTW7euPOfOqjcrkJrdK
	R/kedSq+lrFtdQn7/av33E1RSN/svNpAurjmZvY03P5LdjU/rvyjL9rYjMeqnxXI0Q8lSVMoCa2
	K6PKjdOd6XsEUKug6YNChRTftwfl4GpKgSWp5ipgGO9Py5
X-Received: by 2002:a05:600c:4706:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-49042487e09mr43922615e9.4.1779454290883;
        Fri, 22 May 2026 05:51:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm15046735e9.31.2026.05.22.05.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:51:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 May 2026 14:51:24 +0200
Subject: [PATCH v6 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-1-16edddda9951@linaro.org>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqEFFOfq3UCxutsZFfJbNgQzCr9Pe9JF3OWtJqZU44
 xvvV1MKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahBRTgAKCRB33NvayMhJ0e6pEA
 DHEMP2sMN6Kwla6g4alCmQmwvGarksv0qU0DyHFEQi2R+b2n9eyrQwhBHywtzG74qB3VjYU6ge1BNa
 8mZDfyBFrQzFNN2ozaxfNxeUZ4fBjUCT2ajqiVAWsF3ac9VlG+uvxI4qyaWgKq1pREaMNHBhF/utx1
 18dv+/t5fwwWhqYjb5BBEobcQrns3GcsAaSkf17EMIOk510mWnKvqgOlbCiQqqrx4YdOt8JsN1Dtna
 ZAZp9kJ++c0g3kePMS5FNYQxbipdwwCu8j4MYry4s1LRwLkVqd+QVM4IztkKWp9JF02OewZqnwBhmS
 4bjw+TA7ZpheQ1LUiP3P3Areg5QexTgEYwLP6jshKrA38OR00HBWS4ZMA2jqgjdqXli2e/JrXuOc74
 lvg2XaisFqqSs7E7XhcPQhD70c3gAt8TR1qzuV1jLKEo7zxqDOZi5DSS4Aj7OZxx4zCt01j3/OMa1+
 oinZfnWRGXHmF4jse2IHOHc5RZC/cb3fCo1SKPydbUqWNg5VkYk2pI6+HofhyH7xXjtjNPDvP30KUb
 XymewUHMWuS8s4cg1tLUcgsrHAzCd3ilaD605RDiVVZT4tl+Nlri8vIc1FZr8omtBhaxfBNFmWwjyY
 Ph0KN7c4lLuLnvmIQj3/QO+YooeeLbAZp15e8HHHX3R3rd+jn2E/7ZxZz19g==
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

