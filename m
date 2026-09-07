Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF293F44FB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 20:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813247; cv=none; b=Em5J/vRfW9yCJwaHjUOYY4j1su+jjCz6euepwf/U9gmpFEDJgVcFBQFjtDk428s0oux1nx3nUoAF0RpgOabRZufH2S39fsWSbtl4dQfbRLlUjU1BFK25kLC6sILqih4kBFj1BJ+VL/WIE4tgdEiAAg6sjHolNAc1eSBzUxMu3TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813247; c=relaxed/simple;
	bh=JzPmVao8FK9SYW6EqLoAZ+WBysafs2v13tUyYWLjmGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmKTbkPbep7u3P9q8bPxizSVWQnT6oH7mEo4QH21b88tZxXf8qwVKza2Nxp0q/ht5+5C8EWZ552yKEaf4iHAY2ulArI5mIxxpg4najWK4nZuL3LpR75aUrK1asLWBOprrcqfvFue3h0G20BD0KY2QH1JjATQLk2j4D9FPtFmzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oH1tnbS0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oH1tnbS0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e067e908so3209054f8f.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788813243; x=1789418043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=oH1tnbS0pmS7TygoqeIXnZgTb7nDPjYUTq7b0zBF7vKcgwlJVh/Sgq2SuFp3hBMleb
         wqEm5jAiwqr0vwoCNBy7bgDZYt+GhCMakf+2BCwY37Y2XBxrA28339RYnFqkO8rU70+j
         odYakp8JvFE8/azT5VYvlghlXF5n5++1ZBKvnI0bN3axtzYf8XuXWfvHyDgAaYwGVeH/
         38sR24sdrkCIdji3VZkvCpSK4f1gFyD4SVoGZuf/HEUJOYN9wDWc6HbjeGy7R2Ma3aJi
         hUfFU6at1r+eUWoROa6LwPqsqb99BD/QWYQqrK6JRbi2JHM/NNo9gCXUIT6EKI9me2tq
         pc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813243; x=1789418043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=se0m0U8sOui3y0qPRPlmi+6IRo72m7JJGHpX6qHBKgAeULt9ty11pWo82rwSawipRW
         IIPqViqqwvnkYGtpYtlA/MouBcdfeCjghCihTDBFZsr576NpczYBv5jmHcJVhcNpewZu
         OgqpQMUj+V0BiRAod6JWciuvyL3srg5E1BRQ1TEBtUSZtsfWcNdFv7CdPRB9LiBTb92L
         eXpFb1HYVDh6e8iuRn9sIMhVbCRVDlo31wlz5GdUFjhYcPyxKP9axyqXsz8u3XkwZyw6
         qREicK+Nu00waptrY24v6ka0RmMVEIlZHxZJrVFX+eUSM8czYUN2P222E9mU1YQoMM88
         9alg==
X-Forwarded-Encrypted: i=1; AKwUvBw+WyP5XYlvDA2OrXlGWh6EdolZwZItCnaQ/vX3mZD1zorfhNsryL691EI3se0ywhOhGdC+/y9SX5Bc@vger.kernel.org
X-Gm-Message-State: AFuF++nOUzmsv6OPx6A9abtw9v35ed8ujKvA2kuqU5rKsUZ6JhMMDOxw
	UY9rHrEuax4yXbWpFiYKDwIKRk+5d+y0HWZeIGeylDRuCcfJAzuxQoKesRZagw==
X-Gm-Gg: AYBFou17VEVr7mcuZuGkN4zqJHot17qkAA6A4c9hcZFglnwPFChlodz9B84zOaemXNP
	2jisd1VLTwQPt6XA+iLEoIyTnSJOavKfmlNeWH5mtLC4GvG8i+VsOuooxiQEdr9Ao2Pr4coFkCS
	HI4Ia9DzXETHenfqGBq+mCy0jlsMu0H85Q4FnypH7KK/c1p05EjWMJPqEhnLdGT7/y049rpbgyi
	xvDzaYpKqkihhaYotfORwJqlNqcf1FWSmUEqfRO8Y+ph1WRXsdJ9VSlrGYtqtGwtbiMPgrA/5re
	bfAZFMDTJ6L7atiQNHcZpI3ooC/qERi54M9yvvt0N84Lc4p99ZpSL+qi8+JSCzhhs4Adi9dBBAw
	cbTb0vfWMaKRAIXpyprO6a+1l3+IXTK+LPqo0ZK0wL+d5meF1spUm2RDhqAR9YV0hIE2Fcrxx4b
	23PypyB+vLS4BwMLlTzDvkdoommBPttL1Eg1mjff3Ka6xHaQx7u/ijTEXv67MNgA==
X-Received: by 2002:a05:6000:18a9:b0:485:9249:6a10 with SMTP id ffacd0b85a97d-48592496b7cmr18450345f8f.7.1788813243394;
        Mon, 07 Sep 2026 13:34:03 -0700 (PDT)
Received: from antoniarch ([78.212.37.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm25959116f8f.9.2026.09.07.13.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:34:02 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/9] dt-bindings: rtc: abx80x: document ABX81X RTCs
Date: Mon,  7 Sep 2026 22:32:08 +0200
Message-ID: <20260907203216.53192-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907203216.53192-1-apokusinski01@gmail.com>
References: <20260907203216.53192-1-apokusinski01@gmail.com>
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

