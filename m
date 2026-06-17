Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D28B33A9FF;
	Wed, 17 Jun 2026 18:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722322; cv=none; b=ahOlaIkBDiW8EC+8NOSxon/P+yF4rTYVBp6iXGbmCuLT2iqxJzo4h3gHCxHnHR5KZi4weRNutyB7fpIKKyJeCMutCGO2iHMXijIW3reiDCRwabeBP8eClWypgjlxli4UtX7hWApbLHUJ1AfXV40lVbnxnrPTVPp9AlKFYV2i1W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722322; c=relaxed/simple;
	bh=EihMJ+MjwJWw3LKzGCW8dkUoe6Mk2y9hm9cHf1RY+70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llDzqZy1JntG0grfgfWzNwKtAUa1n6yGyyG1YundGQ38tUDB+V1FO4qlY7BL3fTn7MHD67oRVnslK+yjtB9atboDAK88Ya7G+za/myasvpu3Qxh/JG2dvJUTINZMIE/kx4xy+K5NMBCy0RFc6+GaFBt7vgCLuM9+tngX6rORtrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p4yoIqz1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p4yoIqz1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781722319;
	bh=EihMJ+MjwJWw3LKzGCW8dkUoe6Mk2y9hm9cHf1RY+70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p4yoIqz1k+roX3xgVG83uX9jBwG51o/SWD4kDzbrnjsPEGVC8GBbHP5T5UjwZE/q4
	 BVJ/tIOf46dn2SyDILCkVL/MzTYZSrMOdvCcCPLYJV/ECYJqw44bHGAJNNfIp+0tEN
	 I5TT17jAGc0OCxThJqqDAEBpmLJ/1y4dhXZXCABrZzPaxH7o2sHuU3ee0pmfwH/Xc9
	 0+F2yPKF64X/Lt5Q8GtLSVbvgJjsd+lnkz10FPTJ9330qa5gIecP8djEWtnqHEyOxj
	 j/Y8GbNADtDTWmko3xj/yLicNipgnGpA6FcOK5uEjQJ8gHvGqNcLal3TMDHjSNDvLq
	 SoEtqTlhxB4wg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89AA817E05DE;
	Wed, 17 Jun 2026 20:51:59 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 17 Jun 2026 21:51:54 +0300
Subject: [PATCH 1/9] dt-bindings: display: vop2: Add missing reset
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-dw-hdmi-qp-yuv-v1-1-a665cfd06d7d@collabora.com>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Document the VOP2 resets corresponding to the AXI, AHB and DCLK_VP0..2
clocks, which are common to all supported SoCs, plus DCLK_VP3 which is
provided only on RK3588.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../bindings/display/rockchip/rockchip-vop2.yaml   | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 93da1fb9adc4..d3bc5380f910 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -82,6 +82,20 @@ properties:
       - {}
       - {}
 
+  resets:
+    minItems: 5
+    maxItems: 6
+
+  reset-names:
+    minItems: 5
+    items:
+      - const: axi
+      - const: ahb
+      - const: dclk_vp0
+      - const: dclk_vp1
+      - const: dclk_vp2
+      - const: dclk_vp3
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -148,6 +162,12 @@ allOf:
         clock-names:
           maxItems: 5
 
+        resets:
+          maxItems: 5
+
+        reset-names:
+          maxItems: 5
+
         interrupts:
           maxItems: 1
 
@@ -194,6 +214,12 @@ allOf:
             - {}
             - const: pll_hdmiphy0
 
+        resets:
+          maxItems: 5
+
+        reset-names:
+          maxItems: 5
+
         interrupts:
           minItems: 4
 
@@ -246,6 +272,12 @@ allOf:
             - const: pll_hdmiphy0
             - const: pll_hdmiphy1
 
+        resets:
+          minItems: 6
+
+        reset-names:
+          minItems: 6
+
         interrupts:
           maxItems: 1
 
@@ -289,6 +321,16 @@ examples:
                               "dclk_vp0",
                               "dclk_vp1",
                               "dclk_vp2";
+                resets = <&cru SRST_A_VOP>,
+                         <&cru SRST_H_VOP>,
+                         <&cru SRST_VOP0>,
+                         <&cru SRST_VOP1>,
+                         <&cru SRST_VOP2>;
+                reset-names = "axi",
+                              "ahb",
+                              "dclk_vp0",
+                              "dclk_vp1",
+                              "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
                 rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;

-- 
2.54.0

