Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E1E3644C6
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630088; cv=none; b=SjWoe/mAV4yj2c7a/nbrg2S6hHbnkfbrSSfS1/ncGMUhbg0oM3LNE1ugwthSbYz/Mw5K9FuJUg+QPWi7SZDkx6mGiEyebouAP868lEwRPb3jPLG2aTCC/wzpysDp/+05po5zXE7AttOr0Px3YyLrQuaAYlfJXLWvuIFKBiWymfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630088; c=relaxed/simple;
	bh=fXXG1Cyzjh18AbX4b2uGKLKZm6cZcX80hBT/uwuFitM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UE89NE2u+IXllG5DzsFiAsik5q0rSpb2OT9lXdjX2GfYM2DANSlR2IrunLAR44zGmwLRk0/lNyArEo4aqiApLKH8qmwVmrz0S+354sByGXLGCw8fzqjfjk+7jaSA9N4HzqtFwz+QPx3eWVapiYwRqGIC1JLTnLfMacr0hpnyTaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoM7aZyU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoM7aZyU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aaed195901so10469985ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630086; x=1775234886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcW5pwvFh1W3aCrl8ykkfzRz1WOtzWb7PvDwxuJWqOk=;
        b=PoM7aZyUVq4XiZRXsnQ/n65GYYTf1jf5YoRnMBisi+2SJ14WUtFex+cgCEiJG3F0Vt
         nXkCBRUpJYEznP8UpeMDiE1dfq/TwT342wPMSEKLyKFYcUJASf+IadHoGSzCla0Cg90v
         9AY/DYmuF5YrkcjWkcSYa+P4RmXL1uIL1djT+/lOegT4B4pOegQdQmf9oztq6YDqgehN
         yzRZKfduYX1jMpF9Zl75zxflIQuuhcM9ZifGIxMwWzexmXeKXN9AIAAGbpxEfXMWm3sl
         vXFtVy1ocb2Q/Vyfdik8hsAfMEvJF3lLECywfpwWlj89XgMkHvRPV/7LQGZWL9MBhETW
         19Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630086; x=1775234886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CcW5pwvFh1W3aCrl8ykkfzRz1WOtzWb7PvDwxuJWqOk=;
        b=U1PxvODvKxWbsSOnfgHWhAXHwG7kGXmRjIX9/e/N9pMl0ppJdspgPmJ9Qw5q6t4Zfn
         l5dEbhiO7Qxv22I9wylsIDzm+1lMHz5FezoUJEjcnam5B18LnJ5Yrso1MCSU5h6R4Gas
         1z2GBpnLLn5eZwg9WYuOisKAS86e5k8cdzfZwjr+1YGaiQInPOYDbjxdXcZgf2pi7ibR
         1qV8xxi5PxMT5LhsQRIWrUGLR9mRiHYPcrigUp8ts7cS9nb0bzlblqqmAYyu/syoYTEK
         6hqwhfocA/9jqo6bG8xseBARYu1vJh+3Uut/Jsvxex15W97s/uqtwoM5LMAaBpY/2qdB
         BNLw==
X-Forwarded-Encrypted: i=1; AJvYcCWan3diWBaJJr8eazGFDytZOfSbvJ1Pg/HrDaGLLMcp7N4/Mh2dyxDVKaSt2bMybNfHXxoGCzkeff40@vger.kernel.org
X-Gm-Message-State: AOJu0YyCd+Fbl59viivRCztvKEyXcKfhduRKpvaA5Sw9Eff1OoElVccp
	u/GnS1Ty/yQtXs1RW7naz8UZzl93iO48OglNM924EzkTob85nPmq+rDt
X-Gm-Gg: ATEYQzznDoULj7gH2TkqhVz6k4PwpjhXSxF5+u0iKm4QEIlfGyomGUOfqR2TrD+QL+U
	9VU2Si0uQm7VYiOS6t0EfSVA8fHKeaUpV1S9qQJn0JUpusvzXREJ9RDB6MgIX18uY1J2f3wOtdq
	sKbIxDzziXwwrkDuoKycJYg+rmr5yHmKR/hSsAAMPoKKAD3ezUAoZSvwrggQhyU/cuq6O10RuYb
	RXpG88sp7TepExwMxVWEr0dkpfshb+yxZ3/7duqBaOo8tWHeRa7hMQh22r1v6mCmCaU29Et73YA
	wGN0Ph7kvrQLXySIdpxW5t5Y+rlkilNfrtNhFdnAaOgtAPjiZ+dLwdrfCQ9ztIQGpDFmhZXB6nT
	5ix7A5mIqdr5XuweBAj3IttaH8bV0Olv4riILL2c3+zI3oz5enHAQmPpzIxZtrbw98x0DX5wRh9
	8XX7T31DHUzbmLmquYeyDME1qFElXx5mmdhQXVOadfPhHQcpay9QCTVUc=
X-Received: by 2002:a17:903:a86:b0:2b0:603e:e13c with SMTP id d9443c01a7336-2b0cdc9eacfmr33580145ad.33.1774630086351;
        Fri, 27 Mar 2026 09:48:06 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:06 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:44 +0000
Subject: [PATCH v4 3/5] dt-bindings: usb: generic-ehci: fix schema
 structure and add at91sam9g45 constraints
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-3-eb8b6e49b29d@gmail.com>
References: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
In-Reply-To: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3

Add clock and phy constraints for atmel,at91sam9g45-ehci and reorganize
the allOf section to fix dtbs_check warnings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/atmel-usb.txt          | 24 -----------
 .../devicetree/bindings/usb/generic-ehci.yaml      | 46 ++++++++++++++++------
 2 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index c09685283109..bf2149e5f0b3 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -1,29 +1,5 @@
 Atmel SOC USB controllers
 
-EHCI
-
-Required properties:
- - compatible: Should be "atmel,at91sam9g45-ehci" for USB controllers
-   used in host mode.
- - reg: Address and length of the register set for the device
- - interrupts: Should contain ehci interrupt
- - clocks: Should reference the peripheral and the UTMI clocks
- - clock-names: Should contain two strings
-		"ehci_clk" for the peripheral clock
-		"usb_clk" for the UTMI clock
-
-Optional properties:
- - phy_type : For multi port host USB controllers, should be one of
-   "utmi", or "hsic".
-
-usb1: ehci@800000 {
-	compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
-	reg = <0x00800000 0x100000>;
-	interrupts = <22 4>;
-	clocks = <&utmi>, <&uhphs_clk>;
-	clock-names = "usb_clk", "ehci_clk";
-};
-
 AT91 USB device controller
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 601f097c09a6..55a5aa7d7a54 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -9,19 +9,6 @@ title: USB EHCI Controller
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
-allOf:
-  - $ref: usb-hcd.yaml
-  - if:
-      properties:
-        compatible:
-          not:
-            contains:
-              const: ibm,usb-ehci-440epx
-    then:
-      properties:
-        reg:
-          maxItems: 1
-
 properties:
   compatible:
     oneOf:
@@ -167,6 +154,39 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: ibm,usb-ehci-440epx
+    then:
+      properties:
+        reg:
+          maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91sam9g45-ehci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: usb_clk
+            - const: ehci_clk
+
+        phy_type:
+          enum:
+            - utmi
+            - hsic
+
+      required:
+        - clocks
+        - clock-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.53.0

