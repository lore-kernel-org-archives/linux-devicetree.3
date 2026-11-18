Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003644;
	b=Yan/VWy74nRcDS5B8IBBXPxoa1e5qlWdU/kefMZVt1GkM5KVWzpRzZpbQUyRrS+Bf+hL
	 OxDfqPkMR/c/KF6q3gCWsqo+tK8g2D39F3nywvIqkXRNxXv27z+pwLc3BRIBclWg2QfRe
	 vgtH8gFPssoW+msAbY0uGeUFsnDEcFhYNoe6ySYrNUim2E0/HBieROH3zp8cRv1FLEt5W
	 VCplumLcYNkDyzEgZejoJ+ZCr4QiohU6o/9ejCDMJqYgyJ8n6cZJ3DdBvDFqWBpcXCX8K
	 r46pVSy48SEX/VsKF0cWZLAyteqLoIunRdNsq16wTTwV8ezJ9RqpR90U7CL06k6TeOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=FZAP2EUxNsnWSayUKYobeTCLIv0HZOUilPfzmV/OIOLVMozXvxNlZHmar2ShyeAgo31s
	 HZc57YZ1FXfMXLT+SO/yDxxnq/9+tFWTP2cy6tcIgg2wZatV4Y/5ltFM5nXFheQhkj5bn
	 Pkvl3gcCcsDCRl6xu/+mRhIrtitlRuGfF1Tc+3a80Lz5Z/PLAWo2jyKK0KZrEv1aTxoV7
	 0o8oYbAeNQ1ewYOxb7CiKrtebr6sWHYH2oklEuatwpVJsjj4EhLu4EiZ+hqTQAwoyZI20
	 QjZ/5FR30YzlNUBoVpWrTvR+1GTR4fuCQ+7o/GIpu3fvP7pS+F856b7nFJJrEGw1TpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3BerShj;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7DD60A3809
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7DD60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3BerShj
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f0a1b685so589199f8f.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003642; x=1795608442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=V3BerShjEcnO6pe46yCvBfsF74qmcI5GXv6i5t2GXlYnum36x79Gj44I4wU+QwRo98
         G31Ub/yYW3mQOO7WABbSJOLZszoXUT+NI7FoVgT0Qdt3ukQWC9WbBYmhcmNjnLnHkTyG
         3kV3336CjyZZdZ+S/1EUWo7anKHT4hqcaxtwJTnrYToIb/suWExTnoaPjWOQ1tQqzILm
         o0NLa767nkp1DqgMu102X4ZZ+YyfcLEZ4QAAvT0TndB3jh02IY4IOtFhPGcHtf/Xj2+q
         dsQXY+OeOTuT+Mz9xF0Hbnko+PpTAr/UeetYn4Vt3fjLBSZ132sCBsWIRST0vkJioAW2
         R7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003642; x=1795608442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=uU8JcPww0EOEaAZ68uaCpEO43Un3piUIXraDKaBGdPI7kdWGpEea6xts2sDnw62J3C
         StnEIE7zFe5A9Q2Ex8sV9IRUcWk1BeW/x0rJ+bXng99n5soQA6qVd6X4zqDpw7TMdJxZ
         ytohORH+bUOkEuxnfps0erdQzgPQdBYJUrblLg0uwD24VLN0xD8FPugcV71KT4CK0rgb
         Lb0/R/mxyD0+YJw2Ta8U6enebvImCaJvhIYppelcUYfHBXvhRbFO4ZsXjwRnyy7TaPlV
         sVyD3Rv//zwzRIeFDzr1cIO2V1Ud9R3ES+ELQLxH40ZRwfifR5cQfLt4ycOpy2v+l7I/
         fVRg==
X-Gm-Message-State: APuU4Z/fO6f3pR7ZrY6E7JmoKoR2Eg+izW8UHOzaUr1Cg2fDtU5ezkPB
	R9PigoLMnOy4I/1+FwOkvaAj21Pgv7lGfy1oNWdPn5JiWwUb/N/EcZUU
X-Gm-Gg: AZFdTZepxG9oHyXuar05HkjxjR/Zc4DLfC9nXiCFLHAkgzDTrePLr/wLuRojQR7qT5g
	4TjOWbhlyYZmorU45MaXy2xslii0ia7Fsr55pSblSR8GIyH+Mu2lihGyHjDmpgcYa1bbkuvc9ky
	57tyvYhhuhkKSWQ3/BDfStQQB7mp9xIBYTWtZVVVh7WaYHzRK271bwO/u4kAoh3PVny0j6b32Fn
	+vGgArkKI09g0k5Bs7w2f470TPO6jqzhgLA9T+O0LmfR7tuDcgExZZwNX07RdmAK9yw1tVyfJ+R
	hXoMzRUoYjeUhWysCnfKKojwWN4mwjh9RanMnK8Q30FOd56cB5bU0WO3q/7efdIw0oYwr189KfM
	QFHhVqjV5YV8Ug862t9Cnm3YJoGEsmqSroyV9Sa5CYiKC/CBjFCbUpofEUKXImECYOhrnAHsEdb
	f+d7V5Eqvrj+xT94iadC90WAB9xnkuQQyOalykw8MXA15PpwORh/RT5hco63xGGlapRz4c6I3m9
	hOzvklXaGBoDzdpKwSrrW11e/bBAYjV7Peabv1If8pirzPTNGU7aE/yF2YgSapqhsqHzwkaAjJ3
	RzpD+IxFbZQ1g1fHnZSrEXU4vpaCqSPEK/C9aAwLdNo83bm5Y0/nHNC9g1z9DopOoQ67zBj1jN4
	=
X-Received: by 2002:a05:6000:46c7:b0:49c:192f:cf1e with SMTP id ffacd0b85a97d-4a63b13855amr3763095f8f.32.1795003641960;
        Wed, 18 Nov 2026 04:07:21 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:21 -0800 (PST)
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
Subject: [PATCH v2 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Wed, 18 Nov 2026 13:07:09 +0100
Message-Id: <20261118120714.31505-6-rofikcoga@gmail.com>
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

Document the Silicon Works SW42902 I2C touchscreen controller, including
its interrupt, reset GPIO, power supplies, and panel touch properties.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 73 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..c5ec3bf4e545b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Works SW42902 Touchscreen Controller
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW42902 is an I2C capacitive touchscreen controller used on the
+  LG V60 (timelm).
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: lg,sw42902
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low hardware reset
+
+  vcl-supply:
+    description: 3.3 V power supply
+
+  vdd-supply:
+    description: 1.8 V power supply
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vcl-supply
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@48 {
+            compatible = "lg,sw42902";
+            reg = <0x48>;
+
+            interrupt-parent = <&tlmm>;
+            interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+
+            reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+            vcl-supply = <&reg_ts_vcl>;
+            vdd-supply = <&reg_ts_vdd>;
+
+            touchscreen-size-x = <1080>;
+            touchscreen-size-y = <2460>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 28e4aac18d44a..a29019d984393 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25835,6 +25835,12 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SILICON WORKS SW42902 TOUCHSCREEN DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Frank Li <Frank.Li@nxp.com>
-- 
2.39.5

