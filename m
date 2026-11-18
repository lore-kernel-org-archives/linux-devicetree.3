Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003641;
	b=bhLOEGcIPki1MYlU6+1rwnMrdfm+iGq0y4i6eYVLEPTqY1JR9oR2H39/WmpN3irmwDJ1
	 V/rABQj+BQqt/czEldt9bE6erNrU1wrxtqi2ugyo214yRl8q/1H9rEFphto3zCnfDo3YD
	 mtUNAdg3e1dnRjnm8g2GPJNpFA46hLzAoTgQ3QQm8iq9mNUffFa54IqjcDhOo002eTwU6
	 ZYWogpV09DhcdYsT5dKXt/frMLChGOJPUAvHf63uvDT4cv6MLGtcwbcBAFZKiIhcoBKHo
	 Xykw5+BLFvU5t9DhvY3i/72zIQ6tzdFYQNSFSkyZ7cR0Pjj9Q8SdZY5sq6iVN72mmqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=yII7nqM3tFm8JtKFstHPllGBRlGDxbJ5dxRkrnlg3ktFPdVHUs6whNFnGIbNgiSJkRfn
	 8ZHXdlFjyeNX29KYHScpF+51J6vJ/jx+o0a/luS9lsrR/LtXpJD8OLwMnBB0PR8d/2kQp
	 /ugs/wX4/ZFa5Bf3c2oPaoPrCQbJE28DVn6QB71crxT7Ej4M6Y17g5z+ilxhHFj7/R1Pv
	 6pOnfR0FWcGyn1Jk0SuM1JkCVVxAwR2VJ4H2GUwMnP9cZSaHxXxBQomeVHk/WAQsTM+lm
	 rE/c7XxgsP0JTVx8iNSHgYh0mYoQz7wV5iKFu936teEaYmLn873m39dTkGNBO2MMSwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtmHmyg1;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F9C60A262B
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34F9C60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtmHmyg1
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso8650895e9.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003640; x=1795608440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=JtmHmyg14Boyp9v535ErgQNT94x0DC7zP8DBwjHhodcFpFL40uBudkYtO7GookjHB5
         fgnu6n4vz9ahUXfO+yd6vWaZOCGSUscbc3nUv9FdtZUwyuYxWdKLRCQdnu4ckUGOFqVt
         lXY+L5N/SBAixdwwbzCxXUKFZ29ZTul7rCZmAsSNkvLD4jnvZFigWaGrObwsqmFQ6BgS
         RgJg62kfIcR4INg4bpKLb91vrF2OWFVyxwS4MkSRBtd/Lgp7XOZGGdTXEAvvONXmfRED
         AZgL6Jf4oBFJVq/DbYWVHrZ0uwqZ4UQqgO59l7J+925SACoeOnJNZUn7oSxlIstPoG+O
         jiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003640; x=1795608440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=WL4n3KY6zaTQeqo4LfxnIgtPEeamWJZc1Mu1QSiWv8MeBdGQw3S3Vwp78imWFJMjrD
         ma2abXWZR0vGMeWzLbhKP9oPBcn+V3hK8IyBWaeT41hXBCf0wo4xANuxsf88WxifWDpe
         U69zYm5iCr17Dnq7Z57Nx2x/uujb4eonNUz9D1jSb06YeWNsx8ulJCI6RPJT3WpvHvHb
         Fb5Gyp3J5dvuHLSmPZzw3pG5r6M5rQz9j+tvnrX30NNe2l8H5sqRik5dZzKfRio//eBb
         fsMPPLf1M5yBbyiBMd0NoRSM5VEzPCJqxJJlbhyeR2mMCKKGOJXuU2/5bECYfHwPyQzE
         G90A==
X-Gm-Message-State: APuU4Z+R6KE6ZYy9QNVBju/AuwnMzn7yxTs5Z32pu75XirnXE5indqV/
	1whrfwAl1oTMUXPbNUPqakimASgRrmgYmzemLCQBCIruOA3pJYKfyyTa
X-Gm-Gg: AYBFou3Xak9N8KaB9Y63ndBa9/mn6G+uJNf1Y3wAxLjkyIVfqbSjeZEv+udMES7iK1r
	bYL8bzw5VIqglSQbAe1GSAkDh/R7w7OOECT7KBWY5Snz/tQSVY5jFt+ZhBZPeD5BHjKmSlcLKdG
	vNufRKONwtcxl7fVoa2f+xV6UXK+Q1xqNk+oibQckHAG03QND+tnyGawhz60Nk4jhHpejoxrOsG
	E8RgjQ9zsS0j9h5BbE0V2kBxA9auC02ZQH5L+TJpNiSeMrjiOOGdeqeJkZuQFY+DB3YVyZIsdzn
	POZGSne1GELMUTvyqZ7K/9G9wNhC6x0VRNbN34//yjuhR/h+poZJtKTB4BadhE7HTOvXO8A3Awk
	xSKjN1OyF6OaGclvp4HetRBTxeUWAJHE9RHC1+Kf1XfFuzlPeWNZoIaQgBx60pEsQVjuMhO5boI
	4kCqv9KjlcYESm8wr05HcdoFXcuMGwpx6TARAGspEPo7kXHr3a7qTJPzCi++JLB8Gp3T2htRoe+
	RShOEyQNBBcK7xvgDKyNm8pBMSQh0s0UcM/zfKQ65U0/He6uIGLGA6bdP9gVn4+R/6qQn2EXVo2
	yRdLGCmNE5d4PW3W7bFC0paLDyhuCkCQMcZPjrxhGvVb35yyBYVTBBA1d5iWi+rU2yO2IG5egSr
	oKpJ2WzlZPbvyouq9llCejA==
X-Received: by 2002:a05:600c:354b:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb7da4805fmr42799545e9.31.1795003639681;
        Wed, 18 Nov 2026 04:07:19 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:19 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 03/10] dt-bindings: display: panel: add LG SW43103
Date: Wed, 18 Nov 2026 13:07:07 +0100
Message-Id: <20261118120714.31505-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 69 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..7f44ac6672bda
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG / BOE SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW43103 is a 1080x2460 command-mode AMOLED panel used by LG V60 (timelm).
+  It uses Display Stream Compression (DSC) over a 4-lane MIPI DSI interface.
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
index 80c1bfb66f8cc..594863936fb5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,11 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW43103 PANEL DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
+
 LG V60 THINQ 5G (TIMELM) SUPPORT
 M:	Abdur Rofik <rofikcoga@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.39.5

