Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912238;
	b=4/20Q2Bxl0EVFx4XPPupgraNQxoViTib387LVjeZTW6YvpPsGxYvDbXk3EOb47dQz7j2
	 hc2w3zwIIHMBr0EJOKG1XMMIWhQ9j5I35wAM4nBOIJ13UiM3XjmGfEIbjxSjR8xEwOoaF
	 NHeOZSHjoni2GcLR9saRcmjZPzyElJe3a7Xpj2D+XFyAF8TKhwMwOf3N9FVDkh5gwetip
	 zWJE3ZFHVizl2QJt+iEXbeyQuRsZXp4FR2KQS/o9uVipBX965NE3kNFI8ahhn4TD8JcG1
	 1gsignb+H3OrRzCB4y+TEqj3Qa0k+3pI5ulP/AjexDAilrdMcqeEvvlnNC6O/d97bdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8L7gbXkN1dILpBc2x0pUa9G4ccOQmCQZ8EESDwGPDFw=;
	b=CLAJNPhf6Ng2AVwxWBIfMIFFXHx/JrzYwnb/HlXvxVstbxLXBCwGfiUAw+xzAbj6ZweM
	 fY/7d+bM9DjiKZCdg5+Qhks7dxkDGqq4jH/FHGSIsyaZ57fi7m5AxYBwXrpRjFRG2A37H
	 +e8GsTziraZSH9oKHZbZzC6g1Paq3c7jbOaTYZMt1FWmNqBw6BbOSkaQfzs7YtbAfjAIm
	 GZ201om6fManHCuaLavnKd52kY9kFFo7s5jugfh8c2h8sbu1JQx9SqeRXK0Q9qNSyLjXb
	 mYgEQirXdoKoU506ExnrDc6wgwx4bk0fa+ZVwR9C/YF4FKO2HUBvCcr7oTv6XTAwogg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sg8hLpSZ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5670606A336
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5670606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sg8hLpSZ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so26642245e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912236; x=1795517036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8L7gbXkN1dILpBc2x0pUa9G4ccOQmCQZ8EESDwGPDFw=;
        b=Sg8hLpSZ0HmK+D2CsupmDYPK/3Sp28mNDyfjO9apUx79yFn7ynP1zi6k7lQiXHeDpp
         6hY1ujjm67K5SSq3HkJJtAx5iw0Uf5h4RvXCdnI8RavSlZEDV5fJab7j33xoB03KR7tD
         cqsU/H/p89TZTQQBv6TaUbk/THTj8r8rdtJZn0m8Ghb/ElZjAnKdly7vp0OEwzB/IrPE
         63tB3HOMqYVJTIEh9gxslmCD4+qIniLdwfekpK7vVHPnytTuZiWcK6IvIkZyh07V8Kf9
         3VcdMj8CAFWq4f824NHf5tmcnTrFbN29QphfwlZolfi/c9Vy7KGqFnRKRDRPpvzKPZG3
         NsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912236; x=1795517036;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8L7gbXkN1dILpBc2x0pUa9G4ccOQmCQZ8EESDwGPDFw=;
        b=oMz31/X+AkSC7ubDEPn3OVyrpoEfN+Ut4CKc4KQzt6IMqomZBvsYlrhvhDr6CKo/Zr
         NCEfYUgnxhHT6m2zQMeR+k4Sd5NJQJO0p7hGYbNp9mH4wzhvn9bJ2MVD8oJucqmcuuyq
         Tnv6wsMs3rygzJxvK8RTpGqFn33q3tEcQlhTm4vx/pDPHLWOmgWOmaZq+lKNJXm4oIXB
         KCXqWnf4x2TFveYB877lTgViJy2IaV/Lk8MCx1H0m2FcxMUf8BmuWA3pybg+hZAsvW32
         zJdBfZ46MfyxC5MPU1JROGTpf1+UWCOpPda8Rzh2WDlLx0k+fuCEUSd9V26hUqcKOZcK
         DZPA==
X-Forwarded-Encrypted: i=1; AL+hErE3GwkfGUA8/SnCI7iBEXtnfCoH8edHvr6k2WWl20b8jlVt3nF1bB2ZJADQqSWFbcJ+sgqJAnig+nnB@vger.kernel.org
X-Gm-Message-State: APuU4Z8nx3OvET/5QF2Ug03GeZB5lkQbLO/6J5U40vAIqEn8vsPjr8sx
	x9NO38rvVpC3TtoXGK54iBzaONNuVjJW97rqc5KJ+aEyb70v4m6dBw2G
X-Gm-Gg: AYBFou1MC8nC1yhP0809jna9MTWWqy+H3VIe7sfqz1lqzOm0U2tZzVxn2JLwy2BmBGS
	yYM0FaU1guEM76bNIjhaRKVKwSZI9GCi4rA1/j18G1CqOlwIeteGgLN60RwXLPb0NVANxRQY/XL
	w6AlH/fH/I9cIozW6/Cuuq9WPP1yWc/W2vFUgAB/TKsud3Et7E2iZd+necNlAZq83fmResaAgmd
	nRsi3tFXIwz0LTsi9Hm29jk24DhPPVQkRFkozZqLJP1kjMxCrQF58d21X6OHh1BUDabenKQXM5E
	GwUfPGa5uV2qMvQZCHbLeydcARd9MVaGviR1usOtknXe1u4g+fkeJnGTvktghbwV3eeVuF9NCJM
	wWsCSnoFPT6t9XBRyAS+gXGGLmJHCMB9OFg7WghbDF6Z4PmBcEybKNOvEmeSothqYb63Nf/FSwx
	ETd6q+FeNy7Q9Ynw54xIaddILD62xzF0w2oXL8rPNClGrpbKTwRLKI+IHr7KNk4bxe07/ZR6xWc
	rUrJ52+qGy+VpV1kNlo3MOM2KbMYKv6G4enno1SRD+Ws2WfNBuIP9g5sE+Nr2qYxEVW+F+EF/Yt
	gpDckI15DPw=
X-Received: by 2002:a05:600c:630f:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4bb55aa5795mr277386855e9.33.1794912236093;
        Tue, 17 Nov 2026 02:43:56 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm104578445e9.3.2026.11.17.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:43:55 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: novatek,nt36525: fix v1 review issues
Date: Tue, 17 Nov 2026 13:43:52 +0300
Message-ID: <20261117104353.1180634-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116070212.314228-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Addresses the issues Sashiko AI flagged on v1
(https://sashiko.dev/#/patchset/20261116070212.314228-1-tadilhusrev@gmail.com?part=1):

- reset-gpios is the physical RESX pin, which is active-low (asserted
  low, released high); describe it as such (GPIO_ACTIVE_LOW in the
  example) instead of GPIO_ACTIVE_HIGH. The matching driver fix is in
  "drm/panel: add Novatek NT36525 panel driver".
- Add vpos-supply and vneg-supply: the driver requests three separate
  regulators ("vdd", "vpos", "vneg"), but the binding only declared
  "vdd-supply".
- Add backlight: true so dtbs_check accepts the backlight property the
  driver already parses via drm_panel_of_backlight(), instead of
  switching additionalProperties to unevaluatedProperties (which would
  also pull in every other panel-common.yaml property, not just this
  one).

Also fold the compatible string into a single, driver-matching value
(novatek,nt36525-xcover5) instead of samsung,xcover5-nt36525, which
never matched the driver's of_match_table at all.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../display/panel/novatek,nt36525.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
new file mode 100644
index 000000000..9158125c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36525.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36525 MIPI-DSI panel
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  A MIPI-DSI video-mode panel driven by a Novatek NT36525 controller,
+  720x1480. The first compatible string names the specific panel as fitted
+  in a device; the second is the NT36525 controller it is based on. The
+  panel reset (RESX) is active low.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - novatek,nt36525-xcover5
+      - const: novatek,nt36525
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: panel logic power supply (vdd_ldo28, 1.8V)
+
+  vpos-supply:
+    description: LCD positive bias supply
+
+  vneg-supply:
+    description: LCD negative bias supply
+
+  backlight: true
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - vpos-supply
+  - vneg-supply
+  - port
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
+            compatible = "novatek,nt36525-xcover5", "novatek,nt36525";
+            reg = <0>;
+            reset-gpios = <&gpa0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&panel_vdd>;
+            vpos-supply = <&panel_vpos>;
+            vneg-supply = <&panel_vneg>;
+            backlight = <&panel_backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

