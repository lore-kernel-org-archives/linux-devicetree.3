Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D0D3EFD09
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781706773; cv=none; b=YzRfcCYToHjSOIfXlhqXgKrpp2mqP9ehJBJAOQaA1soC20mm4505yGgw5bUR1T4b3B9J9/OLKzYvsMYvEm0kuFdrBG20ETK/cW1peg/rD+S8qZSkmryBhNtQKh8mdkTX94s30AxgzGm5f1pfJLHaZvfqQxUZwLrzsy0AhmsqO50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781706773; c=relaxed/simple;
	bh=q6vDS+FV7Oh6YJss4rUUg7wT6YwnAp3c6ttUxGbIBJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+cbHjyRGKcTJwGYYyeSO+TWseX5LQqwWq/uUEB8weaPESaga5+zPRMJB6UGSgZWpAcBnA+OHzj//tXQm+VeQFV8c+ev3wmMXYu1JCPw36ew11zx9oc6AeQBJnNDslnh/NcMqtnZejdm8aGkKNQB2UcnQhEFjKD0L93pQ0zBCgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=VK2DWt5G; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="VK2DWt5G"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c40397e3caso56773105ad.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1781706772; x=1782311572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPleGNVzng5kdj5FBjzjCj+oEBfrDjQ6l1brBNCmGhw=;
        b=VK2DWt5G8uJisyYPOsKNRdMovHPbNwS9Jwf+6GlqMK2QZIPDI/EY94s8UyexFpdPBi
         AblyhekFMpfOGMLR/F4HN/xGM5SjzFTvypSY6N7pSfSViKPi1hxjvhOW3tf8IU8pilt8
         1WTMe5wAzmKsTm/QQsg8VKQvl/aLS+7oT8xrOquc2gqaUPpMT/35Mb27dNR7QdjXY61p
         vTUdYodw8eiGt52y45X47jFGaXlYCFVx8ORqQ6hVxJrIF381OsylpSiLnUxRhp6gdYI1
         +EkWV6kWYUUTz7hhSYrQa0rhlMrNMgA+FzDVISRX3bl6fyswo2y1OH09J/N/dt7vHnHp
         Rj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781706772; x=1782311572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IPleGNVzng5kdj5FBjzjCj+oEBfrDjQ6l1brBNCmGhw=;
        b=PFt1WCWsE/OqhcjG0CaZuJLO9o08mVQhRTFaS/XuQdvZd4U2NgIRhGZGSCw+zupLRb
         YnOjOAE2bjRxI+cK9hFFnzycca866tLN91BtL2fES4i4IRM4/6YD1VKP7EUuiXDy+QKs
         HYCMWwkPscmNmuUfmPilU+jyB2yf4KJ5b0CghuWiPBZ1Cfha6fICZAl1pWUUJrtpPCDy
         xsZsjOdNPd5iXWVXwnX4CJhLpqrVxH09tX+9d8/9RKP/KIzfk6l6vS9F4XKHzTwZl3mU
         vjP2U2gDlxv2R486gCHx57Fafd8xzWs11HBngJYMYebpYDda2Hs8dUP0ZGgcXPC0k1Tf
         jzkg==
X-Forwarded-Encrypted: i=1; AFNElJ+BnAXc7DXApYBGe85pLmAFPOIJRdvHHrISo0KVyW6NmT7ZBt5XAocicGW2ld9apOVvSVykZmESeFlX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5EzMuPa+309KuBMg6L4FB4hcXuavVh2IVu4KDhvvy0GgeP/Dn
	AfVT5RqZhfQGWyZ0kGObJX96wl8eV2VRGP/OPNWmirYXwHlkecOKVOdulw/OoYb5hNU=
X-Gm-Gg: AfdE7cnY814ID3kbelaUUMO8yW1kAneSs4t5Ha1Vae1ohFy23layaHjdFNFE01mYvL3
	O/bdm4bfWbF4f1zcUlkp/NF3wvj8Ap0Eaj3VyaPQMQp+q5TTINZk3jc2vdph3dnETbXvsIQ4Cqe
	AsazVnbLAyNWV5VeS5/lRWdaPuO662vMAoeMBp01YB/ezq4SO05nRpOU5JNCj9+fvstE7WKSHIa
	PY5oYvyEJGIJohmhTEViO3/q6H90SSxlmuAN5gfzr8hqfo+Rhm+7pjH9BRWPIubiu/GN6cvZAhW
	lRyRWtukYmGYwlueljTL0YTVkvcH97qidmyagMyvjQlXNGcEAwlIbUeMFSP+Dziha5uVjH+sz4R
	CDeKdf10fcZZE7WeGpEtW5LGllojzKsEh3HNpWNJTBSXaFgv7bHNAwrcx8Re3QC+r62R3jGLKAC
	b0wrPH
X-Received: by 2002:a17:902:d4c6:b0:2c0:a555:80e6 with SMTP id d9443c01a7336-2c6bbf8c979mr38353525ad.6.1781706771789;
        Wed, 17 Jun 2026 07:32:51 -0700 (PDT)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327aca78sm176065565ad.54.2026.06.17.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 07:32:51 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Kever Yang <kever.yang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: display: panel: Add Ilitek ILI9488 panel controller
Date: Wed, 17 Jun 2026 07:32:44 -0700
Message-ID: <20260617143245.372182-2-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617143245.372182-1-igor@reznichenko.net>
References: <20260617143245.372182-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Ilitek ILI9488 panel controller which is found on
the FocusLCDs E35GH-I-MW800-CB MIPI DSI panel. Add "focuslcds" to
vendor-prefixes.yaml as it's a brandname and a website
(https://focuslcds.com/) for Focus Display Solutions, Inc.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 .../display/panel/ilitek,ili9488.yaml         | 63 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
new file mode 100644
index 000000000000..ea7449273022
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9488.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9488 based MIPI-DSI panels
+
+maintainers:
+  - Igor Reznichenko <igor@reznichenko.net>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - focuslcds,e35gh-i-mw800cb
+      - const: ilitek,ili9488
+
+  reg:
+    maxItems: 1
+
+  vci-supply: true
+  iovcc-supply: true
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - iovcc-supply
+  - reset-gpios
+  - backlight
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
+            compatible = "focuslcds,e35gh-i-mw800cb", "ilitek,ili9488";
+            reg = <0>;
+            vci-supply = <&reg_vci_panel>;
+            iovcc-supply = <&reg_iovcc_panel>;
+            reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+            backlight = <&pwm_bl>;
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
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6d742a317642..db0dc4b44ed5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -602,6 +602,8 @@ patternProperties:
     description: Flipkart Inc.
   "^focaltech,.*":
     description: FocalTech Systems Co.,Ltd
+  "^focuslcds,.*":
+    description: Focus Display Solutions, Inc.
   "^forlinx,.*":
     description: Baoding Forlinx Embedded Technology Co., Ltd.
   "^foursemi,.*":
-- 
2.43.0

