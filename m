Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919195;
	b=h+aX4M6cOtNs9k43RbNWnhCH3AXphUCUtNuG/bU0oiFJRucX/vH0Xc2szuUgOrfY9hxJ
	 O+5H3CJCtYsnBVe7HQHs7Y0L3HNRF/M5EJTI8t+9fvlL3JI9sqrt3PwJUgGZHNhDCmMLa
	 3TN4lFEhZXYedYayXaNcGIY+3PbE8WEr2CY3ZilSb10O5IVOhXWEZqHg+EWnB5EX8gOed
	 H69edtel98mi6Zt/C1CjPzvpelRnjczyksui9YN+ahwNDv3qnlMBnSAbi8EgvLCYETN62
	 gCORhZyZh0sAGRTSJzxy5X5EbyckxSMfHuMx8iu4y79OPUwZbfzwmEiT7Wl7yWmliUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T5qIDqJW1HylN9V1krTTvvmwCzdpLearj6f6TGS/cFE=;
	b=X7N5oBSt66KSgR0o6ker0WOsDcxe0DWwu8AUTiyaMAN5Zq3K+VNbco0yRuzmH+AtHUIK
	 Cv9E12Rw8w1fSeW431BWTBgaykH2uQ61rtrXB91Z+zltpz0xBAYadgLD9rZm8HFj35n6J
	 bbhaR7DqCuJCusXlvj/8mxVu1+BGeO3FjWOkrQ5e4HQoLB5kLGLyI3gJqIWnrrD9rSW1f
	 7V63wDlm9PZBrHRAS1puyqX/xAFOLK9GFZRvYtHNxc1HwfFfhVXuONX+sPSL9cRk2XDof
	 N1UBs4C/IuaVbrbjaKFjDe59ITzH4n6NHM3uUUuTeDP5PhvMjTuRCe0VVL7/DRLXf6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKqmelpS;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD22606A88A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD22606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKqmelpS
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so20453365e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919193; x=1795523993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5qIDqJW1HylN9V1krTTvvmwCzdpLearj6f6TGS/cFE=;
        b=gKqmelpSihWWG/SBPNWiup0TtC/pZsi60X7mAIi+TAQYFt7+0MgqlU2IIuIunAogkw
         a6LBtOHF+5Axo0gsL0Q8UtGMP3PE5yvnyE4naACIO3TQgR1mJZkAjQ9H9fCdYHWMF7at
         OIV6MH3ix5xMyDw26/RHwNQt8F1lYEXEpM5gZfn+6R3opTm/PuzNERQufwkd0RpEEB6Y
         pHp7Jv7hrkK4qCoouK2+6aXkteZIpikR36SiwLUg6ev4S44x98ON4EPlPfpYhEQHszhE
         Xj2sA7CeWqo8bciqV7gr/OSJXSlDgHrg7zblmIwxvct8C3ooV7y+OPknTctlMMHlT3qs
         mNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919193; x=1795523993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5qIDqJW1HylN9V1krTTvvmwCzdpLearj6f6TGS/cFE=;
        b=ZrkVKVjL5x55T5BjxYvYmwqwX4mmDhqf4SpeSXTgLAzz1QiGAWXbLp/addMmm/6Qpi
         2M7mCz1n1kRespk0Nok3DGsIYjaI/TBlQhkBbmw/N8EsHbcFHRxWVDCVqWz1BSaZh7lP
         0koImwu9X2fITazAjhh9hHOAUZAYaYXv37cXSAtRxudrROn47WB6ojCSXViSjwZ0b596
         YbHKZUu3Bt3qzNAYp9JVfG3cDYVRRtZRVJWeZ53TGADAfnDzCgRaI3oo3qRwSp42Y6RY
         N9mM30MQOLe4XkjJud6QlduMu37w05xHMk+xef/MmE2R8saSI4y7aXWhNTP+/35J/z1N
         8uhA==
X-Gm-Message-State: APuU4Z+WjFBKRJuk60yDpAVs2cxJNYeogQ66Gc95zc4ut7zyoLAb3Q+c
	AJcMEP06hfV8EjtjpT8hYdv+bha1T+X7w4eG4hDSwuZjQI2HPkm++RJY
X-Gm-Gg: AYBFou2ZYBe0oALirj2SWVe83XOhU4IGkGe8odTY02CYdDd/iSYpKzJOSdJTFHaVhwh
	gzpvdy021KU7+Cm/zQv9clyn2ziU6py62QjEBFPMqJJZeXU8hxdU5xsVDjcE1gwwPLLiDIKWaSY
	ouYquj2dNWxRpSBUEFglEKSXJxc8bHDFaAgURYkysLrKgrY1jMWXKKqaCM1BxR57l+hRbNYWFNY
	nKzMVr9OzgUhFhGuso7+VENT52PNccWGMTHLEJEQ07Q/Nws3EZYRchFgLErp80d9+48m78U9OAj
	goWJDT2HfXDJmTBzYCv98/nVv+4H+mVTpoFRdQWaydaLvINIOCiuTpSDT0Yc4vVpedEdXsSBdcu
	VYTdiDRLSB++81/oHrk7tnIVhOf/2Wj8Lg773Z28fCU9EeL3dHyGjad5u8ObfsD9RFygXpgGuio
	WlA8BJZ48hoFLS6c4A2x3KoK+4z0mhm98EqKqXRatcVLgU2xZfIuz4H1GYjo0iIawEFS1h2t1pH
	5V+dPvB+MNFjW99slaeERUujux7bqi7nc1rF3yktIKW6UgDXv5j4ITwVXzbGOiqwv3Vgs7oR2Ip
	ra2w1iDeYR/Z6s0GlBZdbcGtyVn+0VbdjMfpAnFF/LzS+8+Ke42emalJunIB1arbSHwrRw==
X-Received: by 2002:a05:600c:3152:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4bb55aac0bfmr303633355e9.34.1794919192859;
        Tue, 17 Nov 2026 04:39:52 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:52 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 04/11] dt-bindings: display: panel: add LG SW43103
Date: Tue, 17 Nov 2026 13:39:39 +0100
Message-Id: <20261117123946.668557-5-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Document the SW43103 FHD+ AMOLED panel used by the LG V60. The panel
uses DSI command mode with DSC and DCS backlight control.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 70 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..edd007e2c0d76
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG / BOE SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - rofikkerneldev <rofikcoga@gmail.com>
+
+description:
+  This panel is used on the LG V60 ThinQ 5G (timelm). It is a 60 Hz FHD+ AMOLED
+  panel driven by a Silicon Works SW43103 DDIC, operating in DSI Command Mode
+  with DSC (Display Stream Compression).
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - lg,sw43103
+      - boe,sw43103
+
+  reg:
+    maxItems: 1
+
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+  enable-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
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
+            compatible = "lg,sw43103";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p8>;
+            vpnl-supply = <&vreg_l11c_3p0>;
+
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 315a4a000b405..bca5065166c25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15231,6 +15231,11 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/dvb-frontends/lgdt3305.*
 
+LG SW43103 PANEL DRIVER
+M:	rofikkerneldev <rofikcoga@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
+
 LG V60 THINQ 5G (TIMELM) SUPPORT
 M:	rofikkerneldev <rofikcoga@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.39.5

