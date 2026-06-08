Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7B33BB120
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941458; cv=none; b=IVAPl2opNO73VCINhgeyGrjiBF9sgyWcLO3HTVYYpdSoHkfiGVs+xueRg+qSM9bcbvN/xK016yR0GQEHgFyyDV3re+VHAQiCF9SIHoUSEQuXTR7G3AI1gHUHdD9lAj7WdlDobmMsw0IuA8QlBo0nvSDk0YlL4PYaD2+D/IbTStE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941458; c=relaxed/simple;
	bh=2ZlDQ94rUR32hDecoAEjqx6oT9mO2vXNWEo5sYWXlbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUGuXoV5luo/MLpzq8uSFUUY6huJ1zxPNWeg3BupocWM99VMHnlwVxjMKYYq5kDMahOr2bcmAC7wmTOkRq+81Qx51zBYPmpqlQh/RYonEjd3W0ocfvLEcafDOrDsPGlkhjNjZUF6mlM30d01t94SgUGAURYr/tKUg57eHCqsodk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIBTegoq; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIBTegoq"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43f5927e70aso1865494fac.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780941455; x=1781546255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rohFaEvdb620vArkGLpQqclQhDOuQqS+sgoSDAQS17E=;
        b=WIBTegoq3kBIWAE94yqANvsnOrzwwTD6/qlGbtri3Qy2y0E+PobPzBZANZV4QiyBuD
         jikWT00rglLnrC1s/z5x2FMWQOIzeCIt3zWeeyjr3T/3nAGBmLq5Ep/hGnFcsgTyLdHb
         jIlL8Qh2QEOaA2txIrfanxk9KqqOOINsGNu4TnT8YJgayrLJuBzijypbjQUJx+JP3bYO
         r1GawbmcBn0yrbtwVjxTmRz6psvracZTU65Zjploj2rhvk+xRawu22sbV8mqlXGNgUg8
         geWNZtAH483apoFTaDe7XpHxMk9glY8CuXE/9c3cRI7vu+eALPXX0gxFkwjLI3T+RNnO
         XwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941455; x=1781546255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rohFaEvdb620vArkGLpQqclQhDOuQqS+sgoSDAQS17E=;
        b=suud46ZhhC4EtNYsBq7TwWXA+E/bjLZsgxO5uWaPGc63vJBdrtUNa7TOiKnxcRv+a2
         GGmekiNnIALKhtB6xlgC/PqOxZ9KIFkX2WvKeAgbMKBd/MRr6HyVo/p1sjLUeo72ocuS
         /xCLctNLPHxlvJ4TMvOSk7TzUws93A0m+eTSYIw8BFIFUtMFsok+fHI47Norf4VBdWJG
         k97UIQzGbLHTy36Bn5fqUw8Yx9IxrNBR3jbW70hGQ14ELF7ktasC3fhBZViV0wUINsol
         Jo/T9cwPiGWYXsQzo3QzyUWEfKW3kFL6yzqaQvcs5HcckpERQI7BM3En6dwhzTRQ8H+r
         rO/A==
X-Gm-Message-State: AOJu0YyYAD3Z4sSrmjUqT0s0Or9qTJo5X3TCajce4rka2O4DcMJ53P+c
	yQmSyGZjD8GPSXxCjWMOXsimbMPx0nYqC7+XWWCkTXFZ0TnuSyid9mSSlr9wR5Tr
X-Gm-Gg: Acq92OEwhqjZnImGmDzQ6JCPGp7AC8dD8SvpZTJlwgklT94S17khl6oJeK0MUEXZakp
	jc6S+ZEIy/9EESyM4rLeMocZ1aY1hy0HosqmR4FmZq4tT0vCYZ0BZ1vlSxoEiQSNpI8Jv5LmF1l
	mWND+Bz5OUcRoMCTf4YLjwNWOwlqXV0KtMcqzrbCob/ecrCsnxnm0l4JiMhd7ic9lsVD/q+JmGY
	An5IAhcPkFzmvCfjJB8oJWugqvJr15pW9Lu5Et6NTEjXfkQVPkgBOuJcJSro8ckUGQr5Hcmy+k7
	4zOG9tqW4/eQ+ADhBMM2BDJkBOf8/DLXi3qs+sGSG44R/zRaAc22Q/R4P9zobZgxmUycJ1Zsh9Z
	TnR3xQZwYXVwe2W8k+vzKWxivEIQfZX6/2NOhdwR340FLDz/bn4FLOjX+iaF0bgpn41m8K6Od0w
	d/ZWsFudsk5Fiqmu0PUEtbmVP222LKomY=
X-Received: by 2002:a05:6870:e3cf:b0:430:7c2:9a30 with SMTP id 586e51a60fabf-4413d942f37mr8199517fac.15.1780941454573;
        Mon, 08 Jun 2026 10:57:34 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d8297395sm15214316fac.11.2026.06.08.10.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:57:34 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V6 1/6] dt-bindings: power: supply: sgm41542: document sgm41542
Date: Mon,  8 Jun 2026 12:55:16 -0500
Message-ID: <20260608175521.67449-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608175521.67449-1-macroalpha82@gmail.com>
References: <20260608175521.67449-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Document the SG Micro sgm41542 battery charger/boost converter.
The parameters of input-current-limit-microamp and
input-voltage-limit-microvolt are defined as such since they are in
common use among multiple bindings currently.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../power/supply/sgmicro,sgm41542.yaml        | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
new file mode 100644
index 000000000000..af80fe528505
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/sgmicro,sgm41542.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SGM41542 Battery Charger
+
+description:
+  The SGMicro SGM41542 is a single cell battery charger/boost controller.
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+  - Xu Shengfei <xsf@rock-chips.com>
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    const: sgmicro,sgm41542
+
+  input-current-limit-microamp:
+    default: 2400000
+    minimum: 100000
+    maximum: 3800000
+
+  input-voltage-limit-microvolt:
+    default: 4500000
+    minimum: 3900000
+    maximum: 12000000
+
+  interrupts:
+    maxItems: 1
+
+  monitored-battery:
+    description: |
+        The charger uses the following battery properties
+        constant-charge-current-max-microamp (default 2040000)
+        constant-charge-voltage-max-microvolt (default 4208000)
+        charge-term-current-microamp (default 180000)
+        precharge-current-microamp (default 180000)
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    properties:
+      otg-vbus:
+        type: object
+        description: OTG boost regulator
+        $ref: /schemas/regulator/regulator.yaml
+        unevaluatedProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    battery: battery {
+      compatible = "simple-battery";
+      constant-charge-current-max-microamp = <10000000>;
+      constant-charge-voltage-max-microvolt = <4350000>;
+      precharge-current-microamp = <180000>;
+      charge-term-current-microamp = <300000>;
+    };
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      charger@3b {
+        compatible = "sgmicro,sgm41542";
+        reg = <0x3b>;
+        input-current-limit-microamp = <3000000>;
+        input-voltage-limit-microvolt = <4500000>;
+        interrupt-parent = <&gpio0>;
+        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+        monitored-battery = <&battery>;
+
+        regulators {
+          otg-vbus {
+            regulator-max-microvolt = <5000000>;
+            regulator-min-microvolt = <5000000>;
+          };
+        };
+      };
+    };
-- 
2.43.0

