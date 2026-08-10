Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEFC4418E6
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390808; cv=none; b=X7+SPmutQB61r+P+C565EwqzxTD3XIbMExLc8JxiNEHm09YYLZc/rQSTfVKVrCiuwyPpMGblwyEpjqAo3A2ecg1wVdF6JvWOuNtZl5dajqDykppbGbZr2KGigB7DYWSuq9P9UUR0xEembyVOuyiffpPgyjdT9QwgFzrXhrByWIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390808; c=relaxed/simple;
	bh=JzPmVao8FK9SYW6EqLoAZ+WBysafs2v13tUyYWLjmGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jh2TsnePmSdjaawRqo1PTeQNUUZfgVGorEx9wgoG8k1xVyDwjOgCiuZ45mwccjtXp3PHcKcRzsGd66kL1B8uZpOD48OchCAuWF1mllpiu4ZwEB3ocAK8k9B+B277FCOkfLkJPnc5IhTkn1napXam/HBS7AqmGnN6fM7bB5qm4dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRiqn32k; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRiqn32k"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1228189f8f.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390803; x=1786995603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=oRiqn32k6oLtpfvasTlQQ94vOJYKgcPdhfEYrxUlQUEQXwDOUW1CD7dSjEppgzm6AE
         sMrMbymsS7WkWZwNer0MMKpdvW0mOfuoMUXNHL59uBDw8jYB5Aqk7vcuMoVUB01p880f
         GGAJNKu5SkEAxr0QpNOWyWnImU8sWbA8viLdRlGvN5zlPB/hE7wJBNO3qOADh6N0SF54
         ZrHkTnacQ3RgOCABQfthwuDD5qDeNNTupGbxouP537tTYNoiu6p1nSBTs1eyZSCnSmUg
         iMRZ55UJBAjqyofDRVz6/hdiEFWxf6UUNgmcLdjb7Xc9VRB6AD8htbrynT2amj/+SYdL
         yvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390803; x=1786995603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=A/iotTM4jyMCto/LESTQvSRyX+3G4O/FCg+vg8vOgT00OyL687Ttht0z0EuhOjlgHO
         Wm0Wignws/VkWsbzGoFwUgolRmEzReMIVGL8cyKX9Ddl7OyCaSotSz5qpGJmasU33RIk
         G+l2xQE4GHO1/v6tTJ+Pjc/myEh6yfJG1zSe+gbfZdwUUGn1GbBbl+T8ZEs4e8fAKlpc
         Fi18A7YeqaNlJM1oFaTN7ipOf+rbnYG0QOvjtUCB38bh/B4MbWdEplBhGlYLYuRCYvQM
         o2F16FyR59v8mudVmaTT1H2oJcbgjFhAzWtJ4C5ITfJlhCHcY0hfSSjhMjHikb3u+TUC
         lH3w==
X-Forwarded-Encrypted: i=1; AHgh+RonFgmdJOinEKedBCcDwCJxQD+s55ZA/zsfD5vrp04aExu0Rm1IRrfJYPQD0AAwBFSXRAsZMFqUI4vF@vger.kernel.org
X-Gm-Message-State: AOJu0YzJy1ZKKEuEW3ux2x+EG1D17jRJEwbgFE3S7HL2UsboYbSrWZ7M
	+wwvL+iu/u/k23Geqkc4Y5yqJrEjTuDoGzYqrWqul6CmAS7KdyaDNvrk
X-Gm-Gg: AR+sD11SMh6IQFUV0YYKTcAQMlW+HfDsN9WCelZRorYSr3nWB52JE1FGztczLOzexcm
	XX7C8xBVLtVJlKipWVzlyFHs8gwE2MCdGRjl2Fi6/+vwKoS7StNI/JqaH7S22VG/RYbvHmZMtXS
	GRIvjgNSUhjaUJirjceyUnmuglOyrvw+R1ya5HAWrAhG1/xkIQRBR6UQVOejEGEMm9HzoSJERu2
	z5KDEyo9toZCuglSsrYCCcHBKlvLzk75GM2A9nyusfdHDEX98ENwBquSr9eo6KIuUBVOnvMkVW7
	BIR4am3jtXGY8S/lrnBTAJcFMHEhJrCWokuYhyv7lk7ALA65E4bHcfFDrJTMbWkwQaqyuJfZLIC
	D9EOIgxvb0TwCcfTX/E2rECLlbanS2Huw7O65gCydMxE0YfRv+sVoPT8VJkkD5vJmEEh8txmji6
	8dzHUe+6yiyCzhlnQvLObzen6anW5zJrj8423zTDLxr/FGaxISfw0T6kKelFOvRoU=
X-Received: by 2002:a5d:5985:0:b0:47f:b452:49f1 with SMTP id ffacd0b85a97d-48130e7e7dbmr33227089f8f.2.1786390803210;
        Mon, 10 Aug 2026 12:40:03 -0700 (PDT)
Received: from antoniarch ([78.213.94.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506cbsm39291689f8f.14.2026.08.10.12.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:02 -0700 (PDT)
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
Subject: [PATCH v4 1/9] dt-bindings: rtc: abx80x: document ABX81X RTCs
Date: Mon, 10 Aug 2026 21:38:18 +0200
Message-ID: <20260810193826.210683-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810193826.210683-1-apokusinski01@gmail.com>
References: <20260810193826.210683-1-apokusinski01@gmail.com>
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

