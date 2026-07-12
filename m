Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB5B3672A1
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783822382; cv=none; b=GKJ0+7GNWTI2Gdm/mxDkvs2jl1WgqXzm8n1U7sILY03PerrURTAuPBAC5PZJMKhQsgC/fJQ9voRozsJdjZUdnbZ7PFBqNGnbzB1VBQwUUpO9DnqrNJeGZr5xc4VuSrNL9NQiDe+zAWsG3CQoY5i9wT+qktROLsKwktrqWvl7350=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783822382; c=relaxed/simple;
	bh=inHrGenU9l5rc/MsDfy36HBy3TFchQ5sRRxPsmZvATI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sYa+gbCSTHCDfbT0xeFDGoqg/SIAIDtuC2sb/Js+EFDCZIzYoTl4W/EYBVcQzxsMjOA3CTA5l6uurQ7MumujwHkLpZ4z66X+1potlL48mjpxt0IO/4OtTkROXoFzY6/H7BOQRHK+Dq8py6Vb0dlvNsxpIDiiHnqP+or2XSeKNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VepO+Y3F; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VepO+Y3F"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38deea72eebso4895a91.1
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 19:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822380; x=1784427180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPnxdbYjtS3rIw4TZCTR8RjPhBMqf8pgHE5GaqnnX44=;
        b=VepO+Y3Fe8JWUxzFuZPAdI/3Kw+5kgRcrc3ZliQuUTCjrXq7ESI0JDPc05uROO4Run
         ykUFBvNE37uhSqkCd6VIbu3BrqVdnlw18dUv3+pWRTrPOGdrwCf9l28Mx9tIlVgtEw3w
         dThDLF3fC1MQYeETky+f1RiEzCo7mKLXOqehz3PGeWLiLeiZdMLw6idI/jW9sfa3X1xf
         orq/kMygT330gQ5LmFrHtIbHDysqqbkJji3DpMr1FBEwS0+VtkNoJt2fwkxSTztFTicr
         9WXxDhYfyPGtCQXKmp9oS8bolzd4a5tCyHOtW1lS0K23HAkyBDXn+z7Qii2NAXI0VUnz
         Pbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822380; x=1784427180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPnxdbYjtS3rIw4TZCTR8RjPhBMqf8pgHE5GaqnnX44=;
        b=NGm9jxdcQmULqzrQ77PydVeuZaUk5T6uME7CYzkCtcSXwkc1vVsm8XVnEhMXoa3ktf
         nlJzatYiJZEujFnzOdO2sc0PKoPzk6PZpWUKzBmc9Vcc5H7aaw3mzCkFTIIDeHHGyMZ7
         hmn4G3F3QLquB/PlI8SKlbAqqLvPRApLallqu38ht/0W3+FhDQwfvAk8/+D/uucVajIK
         WPHyo2nOiojrdpVtPlc92gzP2GCz84hP2RDC1A+WKYdi+aMxeNi0siXEFYHvTXiJ7xGa
         epWLp40p6em4No1VuVhUVsSpXUWs6xfkDYmVSNs0D7JDXwYLjClCVWhAs9uN2iPkWi1C
         9MUw==
X-Forwarded-Encrypted: i=1; AHgh+RpFfD0I8FBoUKRDRyd6X63WOHCXyaKj4johvBiMYniCs69CYxIpzyu65tKPbNo2s+OK4hPnnem0/8XI@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTuxakB5OcVpkcbj0xDzpPpQn/aJeCG5PiPbzNSuZt+8IsITM
	5VlIWe1NZsKpkF4n3Qr2RocJYR1U3pbUbLE62I00JFVa2uNsl+uk/zCq
X-Gm-Gg: AfdE7cnZ0o9reKkc2lITOpwgtwI8CoNN3S/5/JRoR0mpG3J0vIjmLQMCkRc+DcY0R1a
	UrMVrz8TqtOOVQgV8sBqWKc3QOiJE7w02MingFOV8LHvp08X4yO3hzNmN9FI0CUOFRUnS/L3ovi
	A+YaIWbklH5sR7RvbUIrHpB5cV6G8DcqgEvnfmZ+vnQXd6ICuKxIGkwkNMyDMueV/0BORIL5M3O
	7XSPgJnXS62HhYTZA206P40SoapU2ZQcstlng+Rb4FvBPO/in72gb9VoZ9xlzHNGg0XdwytheEm
	l9ZfXORrVnlzT4hbk/uwKBFl8tqyaCm/Wsx6aW/ekx2xT7aYF2OSRAI3S5jYKVbWxfYIgFz8DYS
	+81zt1qkTpumtlQYVY5BsLKuHV01QtkvW7Uw8YlZoZ5Y74lqdNJduaJvC7cVvLYwKO4DWcQT2Nv
	Si8Sh4R4P1+T95igUEOFt/Mfc7XcrLXP67QD65HbuQdt7fieAwLL2tCoG8lVgRnHG7MdXDEJoRM
	9I=
X-Received: by 2002:a17:90b:28d0:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-38dc75d1e58mr4349557a91.14.1783822380321;
        Sat, 11 Jul 2026 19:13:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:12:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:42 -0700
Subject: [PATCH v3 01/10] dt-bindings: input: samsung,s3c6410-keypad:
 introduce compact binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-1-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com, Conor Dooley <conor.dooley@microchip.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-b242f

The binding with a sub-node per each key is very verbose and is hard to
use with static device properties. Allow standard matrix keymap binding
in addition to the verbose one.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../bindings/input/samsung,s3c6410-keypad.yaml     | 53 ++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
index a53569aa0ee7..2498c62444a1 100644
--- a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
@@ -37,6 +37,10 @@ properties:
 
   wakeup-source: true
 
+  keypad,num-columns: true
+  keypad,num-rows: true
+  linux,keymap: true
+
   linux,input-no-autorepeat:
     type: boolean
     description:
@@ -81,12 +85,33 @@ patternProperties:
       - keypad,row
       - linux,code
 
+dependencies:
+  linux,keymap: [ "keypad,num-columns", "keypad,num-rows" ]
+
 required:
   - compatible
   - reg
   - interrupts
-  - samsung,keypad-num-columns
-  - samsung,keypad-num-rows
+
+allOf:
+  - $ref: input.yaml#
+  - $ref: matrix-keymap.yaml#
+  - if:
+      required:
+        - linux,keymap
+    then:
+      properties:
+        samsung,keypad-num-columns: false
+        samsung,keypad-num-rows: false
+      patternProperties:
+        '^key-[0-9a-z]+$': false
+    else:
+      properties:
+        keypad,num-columns: false
+        keypad,num-rows: false
+      required:
+        - samsung,keypad-num-columns
+        - samsung,keypad-num-rows
 
 additionalProperties: false
 
@@ -94,8 +119,9 @@ examples:
   - |
     #include <dt-bindings/clock/exynos4.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/input/input.h>
 
-    keypad@100a0000 {
+    keypad1@100a0000 {
         compatible = "samsung,s5pv210-keypad";
         reg = <0x100a0000 0x100>;
         interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
@@ -119,3 +145,24 @@ examples:
             linux,code = <3>;
         };
     };
+  - |
+    #include <dt-bindings/clock/exynos4.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/input/input.h>
+
+    keypad2@100a0000 {
+        compatible = "samsung,s5pv210-keypad";
+        reg = <0x100a0000 0x100>;
+        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock CLK_KEYIF>;
+        clock-names = "keypad";
+
+        keypad,num-rows = <2>;
+        keypad,num-columns = <8>;
+        linux,keymap = <
+          MATRIX_KEY(0, 3, 2)
+          MATRIX_KEY(0, 4, 3)
+        >;
+        linux,input-no-autorepeat;
+        wakeup-source;
+    };

-- 
2.55.0.795.g602f6c329a-goog

