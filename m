Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A381F3D56
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653892; cv=none; b=hHTl58IW+23+gGZXT6z1HBOTqeoeOaztyfgKVVPk4OCS2grMoAZBPSaoXmyFfnddDCtGIl/Y9ZtfTS5UJN/VxI3kL638gcsnG7VbC/tkG1Q3m94sWq2WlCzDpwDFDZKiW+SGYzm1a6GNELdnPJXTXDRGAc+MfW4rTMapKUQsfns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653892; c=relaxed/simple;
	bh=DBMoBYoiDqYJ9z07AasAMhfYkt1PvgYd+LjSuKM1ePI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EaD0VP/zLtNHzdlzlpH4QwIjuDLZ3V3KLLRB11dZmchi1Cuz+XIB/p6KsPbz1QG77gZqNwtniOk366cxf8rxyYD6AGSXGto8Q7igAJzbToNBy3AEHRBLBhtWXahjE3t0ItSKTOAnzH+oxSwaRsLaFrDAD9OwYFXUhF+gMryQi5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfMaJEoq; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfMaJEoq"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4a451915d8aso5602163b6e.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784653889; x=1785258689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxlSATJdp1icBuAyE2MHftLf5IzsPs8NNyx38DkjeJg=;
        b=FfMaJEoq4P8XAglHtTkF/bsldy71uF7Uj8dfhEMhVgbNEMfhlN4ExxGh4BA9QsrmUP
         R0/vTar0Otyv1Sme7NZjlOQh5cMykaza8QI3VvmqadfpdKke0DQH6MQe5WCWXLc1Ng0k
         aNXlrJCNd8gUltpH7V3COPxE3gWfNrcJkw6RmY04sPciGW1+VHQK6fg6mDgMo5iVrD5i
         7YxTRIn0DxgjXxGK9E2zS3iIZDViFtTzDpk8mh0U7u8wLNLWd1+mM849KTjjJYW4NUZX
         /Oqf4FHGzbL7Sy4PKyoEaiJLFka5zGbXIUDvZ5TCX42wbnKJZgn0FWW3YAgM92yyO9vl
         PAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784653889; x=1785258689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxlSATJdp1icBuAyE2MHftLf5IzsPs8NNyx38DkjeJg=;
        b=Y78iIzvHSMtJO8zKobV95BplC/lFIZVwqxHicb07gPw2BqmOFWxh5bVljYp8xT5xMj
         cBq5SfeqXNkxZo7LEyQee2JCKnY7DpVyFpCo7bR+LU+o5q45kbM9vWpriOT7nlt/lGLg
         TsNYnXd+j22NFUvTLRF1BorutiUBrcTUzYyRlbkLTt+yQwmCWT5aKtMZLM1XIG0jyol2
         uK/mjeIAldlDyiE//X0G1J6DBbwzsZ86meQ5CwiK+OW8J2tYZ5Sd61xmiX1q2q3l5D1M
         WArCwFynSAzKRQzJO6jtjmhryv1OBG4j6ZB82NVkB/QQYyO1ZXmSVtwu4AthGteWemN3
         XdTg==
X-Gm-Message-State: AOJu0YyhrTd4WpAofDXYZDy/xnToDI3Jd9wtAAZ9G4K58hC2PLtRUTLs
	TSv6MipwfiIl2dcRqKjxLTLsbwvbXG4r1/nyJXVqjAPl/KT66l51iMUo
X-Gm-Gg: AfdE7cnDhu6j1CQViQAsn1PWA7KvqUrz/DPuBhSb16H0jYo7bVQgq1SMA3PJpeFsOl7
	7pl+BzrmYCnf4ePmWY+UkfHacuOJTaML2aSMgZoWYkpAXSAxyy+VIeYvoYx/wyK7VkOuv50XEB8
	9RXdXIvuiYPZ+rv9dDsNXeTw6EfKbyorn/Dvk5ojViRxY9ZYqwGoUbjKXRZX2QzmMlPcYMtnuSI
	DqmXTGcCnDmgnQRZFiVYkPad4jMvLnp+n5RpBXHUAmm45rE76IOVYSaKzzVMGmwWu3gaa2hqEq0
	KAnR4oimyLu/UDoss316EaD5acJxWxB1FAFXRimPV/8YX3Eag8bpwalHMFsKbs8Dq+84qgTiF6v
	OjN/xbwbm5GPdD/Dm6H/39+KqTg11Exlp5fARdIx7APMa5sPE0ugChHlQvAg5pqnNHUV5+tYROb
	jD
X-Received: by 2002:a05:6808:1906:b0:48c:4c00:596a with SMTP id 5614622812f47-4a4d0323870mr12485148b6e.5.1784653889440;
        Tue, 21 Jul 2026 10:11:29 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3cadb50sm10213953b6e.9.2026.07.21.10.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:11:28 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V8 1/4] dt-bindings: power: supply: sgm41542: document sgm41542
Date: Tue, 21 Jul 2026 12:09:04 -0500
Message-ID: <20260721170907.131731-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721170907.131731-1-macroalpha82@gmail.com>
References: <20260721170907.131731-1-macroalpha82@gmail.com>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

