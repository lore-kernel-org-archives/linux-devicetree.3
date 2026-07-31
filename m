Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C747D449
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523808; cv=none; b=dbOpNgb2wx+sX+Vq3ZWGYj3Fy5E8aM0nleEhqdvpa7AmknUz/BWxyazvZS+xjbPLYBQs1jrx85szvaXM458b6zkiw6/1VuT9erl6yskcRrUVuxZfeoKImeCJ+7VwbIu8C4Ao4Iu/x8bNAIXBXwkwo4LNJn52g0Q+rHyr+kMTraw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523808; c=relaxed/simple;
	bh=JzPmVao8FK9SYW6EqLoAZ+WBysafs2v13tUyYWLjmGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JR7YFnnK+/p20w7uIl+0g7MkUI9NRT9RJ6n+avpE5uhdUZmaEaLamDefp+iwmOV7hyD9IiqeRBg/BV9s1sQ5KDA/p1Sqt2Yfj5B9G5A46soQ1QGGXO1aVkqkftWWy+eoyWo2evKnoHPtbJAi5KZNyJ2Vu/Futqxp+mjPFJwrR2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AorKK8rH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AorKK8rH"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47db714766aso1497978f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785523805; x=1786128605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=AorKK8rH3c+Zg48TQvdMbQfFfKTraixGJIYU4RSlIqMIkyyiShQ5kniysW/kJE8x87
         wpiFxk53gKXFa1VUV/at2Mg5w82Pbq7v/o43c/JjwbFHPryeafVhaMMIh+dPMz2j4+3f
         YqsMR8UCBNGaStg2MqfC7GN7autWlum9B+mnt88RWlD0bzGDGdvsCBEMoXZmTYAsnCu7
         l9Vfm1r+MYaKIvb/UHvitUvJtPmDdeMZDHQkyCyOlXP5WDApenNTot33COMWXCH0NwiI
         hjGRTzv8ik/2AYZbRvBmXnarTIJwqXeZ15iwdCRqLfTg1bLRoLF2NIIeANhlvPIL8Tbm
         8ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785523805; x=1786128605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=QJ0xZ3QYxX6xpXNTGIgrFnVgVKdjQCu7lTAcKkI6OiviRgzNYNI3QWlUYKgQKEEsIK
         z1yXowoLwS60/0XhGF8eL1UbW+HiMZUQdOOi307Slmfcs95MMQxLuwrePJl49pFiER8q
         z5/V8JIbDqwfUJ/w6tc6NjOOKWzApqJ6LGtkCi6YQKY+ct/WniINr2ttLGP7MRgiZ2+V
         ZBS8mlp5Tuk4D0GPjjokRaDJ+cWtDBq1QOzh6+8LWW2Hq0KJ6zPV+rSHP9HOsWNULXqj
         9dZZmkc1woKt4KfItxzx3o30TEtI8nIy6H923o+v1PUEp4v7sh+Snqra9UoYH8OHiUK8
         xylQ==
X-Forwarded-Encrypted: i=1; AHgh+RrisQYMg+OrOjNcYyNQ2pfjBFuMc0wR7fv8ySQ5+D6JMFG0YqlAZRPnY4QJlRJ2hU4CxAspI1h3U23T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy5Oip5jMlaUtHRo+ipltLE4FqGF+xmBYQNSRQDqM1a5WoHVnr
	PDgZIVWx11//G6szXrNRerrU72QwD+AjLWiMyb7Iv46TGz2zmi94kymmyTWWjQ==
X-Gm-Gg: AR+sD11M10nEAYMSS/9kR8BoOzafAipNZLvmp4Fo13tZmSG5i3PPSJHyWDJ4hyL1IGs
	z75WYvKOGUVvq58WZ1OtN3J7HlvMQpGHkR+cwdQgeOjVrHviRpgzdeaeuNx56VQsgdaMErjsQhb
	yFIfbgkVzXBsMnQXgPwBPxtTy6A+A3IpvwC+Aq4FCjlBVNO9W5xeW6HtD8TDr4fPcqkLqPKADlJ
	0VO10VCO0rCcN94qDxuN6+NH4BNVrV2i3rJUbDcbyKg+GmciR7MBNUU2AmtjQ6Fx+1utOU+Vh4m
	G3IFH4YYWQD+3IK/6QTd02eibjWvjIWMdq7MLDiW4tOdAkPGEKmQ4kEUxb6TdAwR10lix5dQCRT
	0pxR0+sToe8H+BUV2ZF5vvFmj16UDqjUtLZhUZ+7QL8d+FQhJ4MAD0r/FASbPgHu48l6EcU2NOl
	TMS8iPnqFCQ1A8ysp6liHeZIY0JS+5eayLbcL41fCVfD1+RbTWNkkMZ5xWKUerGWU9
X-Received: by 2002:a05:6000:22c5:b0:47f:8b0f:7172 with SMTP id ffacd0b85a97d-47fd32b09d3mr6387036f8f.6.1785523804939;
        Fri, 31 Jul 2026 11:50:04 -0700 (PDT)
Received: from antoniarch ([78.211.133.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm8741488f8f.14.2026.07.31.11.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:50:04 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/8] dt-bindings: rtc: abx80x: document ABX81X RTCs
Date: Fri, 31 Jul 2026 20:48:24 +0200
Message-ID: <20260731184831.44037-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731184831.44037-1-apokusinski01@gmail.com>
References: <20260731184831.44037-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Abracon AB0815 and AB1815 are RTC modules with SPI interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../bindings/rtc/abracon,abx80x.yaml           | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
index 355b0598411a..d105570bcd5a 100644
--- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
+++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/rtc/abracon,abx80x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Abracon ABX80X I2C ultra low power RTC/Alarm chip
+title: Abracon ABX80X (I2C) and ABX81X (SPI) ultra low power RTC/Alarm chips
 
 maintainers:
   - linux-rtc@vger.kernel.org
@@ -21,10 +21,12 @@ properties:
       - abracon,ab0803
       - abracon,ab0804
       - abracon,ab0805
+      - abracon,ab0815
       - abracon,ab1801
       - abracon,ab1803
       - abracon,ab1804
       - abracon,ab1805
+      - abracon,ab1815
       - microcrystal,rv1805
 
   reg:
@@ -61,6 +63,7 @@ required:
   - reg
 
 allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
   - $ref: rtc.yaml#
   - if:
       properties:
@@ -73,6 +76,8 @@ allOf:
                 - abracon,ab1804
                 - abracon,ab0805
                 - abracon,ab1805
+                - abracon,ab0815
+                - abracon,ab1815
     then:
       properties:
         abracon,tc-diode: false
@@ -96,3 +101,14 @@ examples:
             interrupts = <44 IRQ_TYPE_EDGE_FALLING>;
         };
     };
+
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@0 {
+            compatible = "abracon,ab1815";
+            reg = <0>;
+        };
+    };
-- 
2.55.0

