Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425A41325C
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971832; cv=none; b=G1a3fND8HFxLoYy4qa3gcbMRW0nFEHll5Vv9YDoMjJt1GJuEZ3DpzA5KKRa0m1rmWzGMdxNkmDXR4ExkiBarzJGfRf8EWUJH/kDJ/xnpdq9fMfLmbTiop/ZeJUE4YBLU7BkmVjhhDGeu5jd0j5EuSTM7X7YqCLsyWl6FoCKKljQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971832; c=relaxed/simple;
	bh=Kch86XWLNpsoWXsiUYScxG9+qZq2PDWJ+mVUNiuprdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjqD/QJuL2t+QYIKxrVPZLC3Vmjsh29yJ94JOcGcG/vrvhonvbM+uskNeKp223na2tLzuM3d/eIAkJUCci7Jnc8ALxp2g1PIslPI4WZHgK6gny2oetlVMGXiaF6uE59zsK9NlM2O4KxRwNNbZXPHBfa9iLagSRKid4UdAZ76ySY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=SBJvd74k; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="SBJvd74k"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cf5d14d6eso2436077f8f.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774971830; x=1775576630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3tePfAp0V+6zfOlKlirFvJa8IZ0hYoxL5FVcQEbR28=;
        b=SBJvd74kiLcY8RlHk0XC95rT+rG1H/QJ9eHW7mLJTA0jTELVftETWRwBap6qGGLXoo
         4PBwA3vp4pWlSncXJKmaUVe/2a73AGKBjzvfwp68blpMdtPDCSbIQp+CWzvL1mbKBYQN
         11zx1de7/JalUwkugmfoxZAI7NiImHnfKPlXns2m2Sh6s5aMccqedPC6MJYThPrQycCW
         JxTebjlsBDgQ+bhlZUsJkfc18li30ASnQv14+dqifBt0m8taAVX6UFoseXXb7R1hE3dx
         YZonYaFKgmAnlZG/N6P9flleVgxIfTAr3whJp05NzV9H2eHM13oDFhzMb5aJ+HO7KzhI
         4YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971830; x=1775576630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a3tePfAp0V+6zfOlKlirFvJa8IZ0hYoxL5FVcQEbR28=;
        b=o4gXMg6mTB73MMMrqHxA3LSbacjRA/5lisFPwuaHxefRyPnjOMlHlQbQtoCBpYBacE
         1BQD1vg/fH6K1I2WuE8e7vmhzrnyLUGDwB+Q6nxx+czri2WfEtnPy/0ZCxeuexefSMCl
         s8/03OozajtDKQ1f428Xr8+NqddkO6HbeWRwe9v/eeSb/IyuhbzZywo8QcFk8mph1YPv
         wCZGznHzYxyJsf5FrTlqK36e3aZ+7kYWT/QxQ60XXD3jP19rz/mv+QrhHnlH91BDzGyw
         WVzfGFXV3tBiBnWtnP9d3wtrSyU269fxk+DJiqmkuQ3NDZmZRfv/rAex/gmkf2ObwCew
         Hthg==
X-Gm-Message-State: AOJu0YyP+HoTeC5Rte6cbs6azKwCtRZC5W9SHfM8B2IqUTAVMf04guRM
	/oP+UgBsUqY3FWyeHPM3lX9lcwklhNCL62d9ocuFhSlvVacQn/jaG+2tdAnkM3bqd7o=
X-Gm-Gg: ATEYQzwqzejeIRDuXk/UOqBhgzL+7UUUTayOnTP28xX/hi9RLvnJMFM7LU8RJ+dmxZZ
	nAgGjF8Z6aN2Niocyov4Sn0ntDG7jV9WFHUpQIO9sI+7I3one31ua1JAnFgkDTxOERIY5qfUgea
	iPiDJwa4BCPws6fTZg4YVGMsoJUjB/XN0v8Hv/JI0rX2onex285rmi09Sd9b4KE69tVzCrewDqV
	diBp10+q2u7L2/3EOj0Yyvszdh+wn4ajqu0kt7/7n2tz6GT0qY4SOZZYrKLmLbjSgGEDHP5n1I4
	zyjb+JKTtX3/M4WORJKSftufRNeYXbvmOlyBHlQknHUXSR3I7B4kyYBfcm1o8U2KUtj/SBNUiGb
	Q7MNXu36dmU8Hx3Zn4SU7uKkeKYjGAnqb3r56dRXfLPujJyYccOQjFnhcihfNGllKHN8xyXFV2r
	aEM4d+iQO8piOrpwGzjxrW5jzyOMk6hGO5TwmIV+LJK6ZdS1JHmoItH9SnoIdZmAb6mZGCMZj9M
	4egu0UEMylBVWV/
X-Received: by 2002:a05:600c:3b27:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-48727d5a252mr294923335e9.7.1774971829849;
        Tue, 31 Mar 2026 08:43:49 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8852a5sm48412605e9.9.2026.03.31.08.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:43:49 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 31 Mar 2026 19:43:38 +0400
Subject: [PATCH v6 01/11] dt-bindings: mfd: ti,bq25703a: Expand to include
 BQ25792
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-bq25792-v6-1-0278fba33eb9@flipper.net>
References: <20260331-bq25792-v6-0-0278fba33eb9@flipper.net>
In-Reply-To: <20260331-bq25792-v6-0-0278fba33eb9@flipper.net>
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
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSefr3edDpbxWsjpTPhaqe2KMzNvBRvXLWtwtxa5cMFo
 w/7GL3/d0xkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDVeSqMDOftfsW83SDvWNwUMOnUhAVe0n5LRE/7ntH2exdflL8q7ATD/5BZqY3
 BoRJKf6xn7ky5/DvF7s36NQXSt55t6VPN/dLMxgwA
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

