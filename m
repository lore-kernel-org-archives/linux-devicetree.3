Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F9B3EB7E1
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352308; cv=none; b=RLvnzqNoj+tv2IyCHxRZ4pAIS1CMbHWVqohfahPjWAXc6NcA5FcPh1OwRbpp3aAfUvTptDIiwp8/dwti2e3jXvlt4+M1RwER3otz39S2WmD3xxrdHx10gpaG8ERWtZkz98kzHNWLqHwwqr1mgB91bVb5HK4CgAYKO93ow4dwMNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352308; c=relaxed/simple;
	bh=Kch86XWLNpsoWXsiUYScxG9+qZq2PDWJ+mVUNiuprdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TeXcwBjCF6wmtS398+hv11ob2giejHiPyT4cgLwbscUtrNj2aB8SQ09o5ONinHk0Qd8Yh3rUB8l8pD+nhRXUzOcIAHE8k8IYI8IdRCRiA1U/E2jvuTrqWg1ekDgSJ6YaWzpqhdZcuRXOeTK7rgVjXOK73Ks/1X0We/5+jF2puYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ubRAuAF8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ubRAuAF8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-487035181a7so20955025e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774352305; x=1774957105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3tePfAp0V+6zfOlKlirFvJa8IZ0hYoxL5FVcQEbR28=;
        b=ubRAuAF88g4+lGWoPq64KrLUncS0g4eFfK1GJ4EduzgXwzIMBMpksvLqtcKEpnkqYr
         RjJixLr6YTCJErncVwJ/iz1ObtxBs4QjKFx7oAsPnVRuTlej7zfHXIBeCu1tSZecOhDP
         J5r9bg8tYNJqsveGsmqym3qp58bXbvdi3aM/spXa8SmHg8Dn7vJ8dfTC4+ZwSsQtQXko
         +siLqm4ngQT5QRGih05PnlMinhG/ddNVu0S3NzlR+k923E3ruKg2OQ1X/5ij1/NzNM6m
         /VxMy5C53NzbdxF6JUBOZPvL5n2yEgrupK/gAgp8hW7nsZ5a8Mur+c2Mw489bOU7vsJN
         tDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352305; x=1774957105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a3tePfAp0V+6zfOlKlirFvJa8IZ0hYoxL5FVcQEbR28=;
        b=XXmilrHda0+2W7RcwXOJO6SB8a+HtevXi+CuBFk18iSy1C5Db/aqgd4SRoMBAnK8Dv
         mjJqOuoBUlqONS2Nx/sg1BcJL/aIhphKfzl8IMdJ1xsAjwhmP9ZCgB9gKI521Ba8RKWC
         ubu+OzfJu/uOpjZPuxv48QPEd2QtA6xyzDV+on4ZCc08TPNCvMdf9XagvgAE+BpxMuyZ
         ntuolgpiy1d6XAC4FmokpPjeDvJKRs7de7VyYRV8OhM92ZwpHDuWX2JpJH/SE0cYBPQY
         B21HLDvDueG5FtUSrAEDTtqlh14oC3U9Cyd6ewdxAY7viWVrU08q/Ezhz2RYFt59qlbL
         USvw==
X-Gm-Message-State: AOJu0YzljKbNZNH7oprrp1kklAEQsAxgInnEKY1vaGNYKRSuygOu6rR1
	deW2vlr7t3L5EhKqQWrs3KLC205f/hzgjl5mBS/mICcL6ELObSEAQyViSnvBGU4StBI=
X-Gm-Gg: ATEYQzzPZUB6r2XW4UVTvcwyuKXaxrM6+WVpOPyVf9xP6C8CkwH72ugmLXlEM/xsmfD
	ENmDFY+YUTUUgoqeafbdIV7sBnBhiDt1HSaejXywbUMksWPgQ9lmXcW5UFW+gnC+AMqNQ8P9/Ga
	ivt0kB1HRe7mFkwZZ8qVAkcsVDBIJ6YTQ9LtdmiHJtVJBYpSyWP3kU0yCSvYkDwEl0SxRFGjeFB
	Kt6zNPo1t80bUUvpCQM/l5NZ7bX5JZU8sUNOiI2oFgznb40E03uhOc7ae+4wn/mF4yA8TMd5JlJ
	e6vBoi9fyFDKAxFUSmKjlv1vY8C7V+8SL8b5GvgDQJQB+8u2LrQMVUbaIaWFDakX6itPW8Vfh+e
	Mru3PJi3H5gFSgx3uxz/61afFZa3I9n9YuQxVgnshlhCIx5RgFnI7ti470qDbv3NU+Qpqm0Qqfd
	kpdHz7SsVBL2kcNTLKp05sThV8rovhoWLlkPipyob0WRHT84WWYv1BSDiqeIr9/1yo6SLsDUQFY
	oyu4A==
X-Received: by 2002:a05:600c:4f10:b0:487:2e8:69c5 with SMTP id 5b1f17b1804b1-48702e86a88mr199543535e9.15.1774352305270;
        Tue, 24 Mar 2026 04:38:25 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6c0fa6sm20846715e9.1.2026.03.24.04.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:38:24 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Mar 2026 15:38:06 +0400
Subject: [PATCH v5 01/11] dt-bindings: mfd: ti,bq25703a: Expand to include
 BQ25792
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-bq25792-v5-1-0a2eb58cf11d@flipper.net>
References: <20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net>
In-Reply-To: <20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3922; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Kch86XWLNpsoWXsiUYScxG9+qZq2PDWJ+mVUNiuprdY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQeKl8b/UHHfAfH3BNlrTrCV1ZnLHZjV5NhvPzZ+aL28
 Q/X5x+X75jIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCqQ7MYGU4/Ulia0nej+siCabodsmeTlz/LZ/+6flfnzJU9Pi1r5ngz/A9vfH+
 wd9qU+HPN+iL3m15oxeRn3dXSKd2h76M/XYlbhgkA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

TI BQ25792 is similar in operation to BQ25703A, but has a different
register layout and different current/voltage capabilities.

Expand the existing BQ25703A binding to include BQ25792, and move the
voltage and current limits into per-variant conditional statements.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/mfd/ti,bq25703a.yaml       | 73 +++++++++++++++++++---
 1 file changed, 63 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
index ba14663c9266..cdce83f05804 100644
--- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
@@ -4,17 +4,16 @@
 $id: http://devicetree.org/schemas/mfd/ti,bq25703a.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: BQ25703A Charger Manager/Buck/Boost Converter
+title: BQ257xx Charger Manager/Buck/Boost Converter
 
 maintainers:
   - Chris Morgan <macromorgan@hotmail.com>
 
-allOf:
-  - $ref: /schemas/power/supply/power-supply.yaml#
-
 properties:
   compatible:
-    const: ti,bq25703a
+    enum:
+      - ti,bq25703a
+      - ti,bq25792
 
   reg:
     const: 0x6b
@@ -25,7 +24,6 @@ properties:
       powering the device.
     minimum: 50000
     maximum: 6400000
-    default: 3250000
 
   interrupts:
     maxItems: 1
@@ -57,11 +55,11 @@ properties:
             minimum: 0
             maximum: 6350000
           regulator-min-microvolt:
-            minimum: 4480000
-            maximum: 20800000
+            minimum: 2800000
+            maximum: 22000000
           regulator-max-microvolt:
-            minimum: 4480000
-            maximum: 20800000
+            minimum: 2800000
+            maximum: 22000000
           enable-gpios:
             description:
               The BQ25703 may require both a register write and a GPIO
@@ -74,6 +72,61 @@ properties:
           - regulator-min-microvolt
           - regulator-max-microvolt
 
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml#
+  - if:
+      properties:
+        compatible:
+          const: ti,bq25703a
+    then:
+      properties:
+        input-current-limit-microamp:
+          minimum: 50000
+          maximum: 6400000
+          default: 3250000
+        regulators:
+          properties:
+            vbus:
+              properties:
+                regulator-min-microamp:
+                  minimum: 0
+                  maximum: 6350000
+                regulator-max-microamp:
+                  minimum: 0
+                  maximum: 6350000
+                regulator-min-microvolt:
+                  minimum: 4480000
+                  maximum: 20800000
+                regulator-max-microvolt:
+                  minimum: 4480000
+                  maximum: 20800000
+  - if:
+      properties:
+        compatible:
+          const: ti,bq25792
+    then:
+      properties:
+        input-current-limit-microamp:
+          minimum: 100000
+          maximum: 3300000
+          default: 3000000
+        regulators:
+          properties:
+            vbus:
+              properties:
+                regulator-min-microamp:
+                  minimum: 0
+                  maximum: 3320000
+                regulator-max-microamp:
+                  minimum: 0
+                  maximum: 3320000
+                regulator-min-microvolt:
+                  minimum: 2800000
+                  maximum: 22000000
+                regulator-max-microvolt:
+                  minimum: 2800000
+                  maximum: 22000000
+
 unevaluatedProperties: false
 
 required:

-- 
2.52.0

