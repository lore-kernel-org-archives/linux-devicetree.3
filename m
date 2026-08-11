Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41545476699
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477341; cv=none; b=XgodhxuMzmS4ZsFMiP9kQgNFw+TzIMaCwzwuKbamUMiMG2fh9rMC5nMh8ULyT2ZwExxTYUJVnqOpzPk1KZcWRCEIDO0INWXWcoN4sUv3fSFQYHWlfhqfax4YNJoj5UVTxOoVzpjdammRd4kPRlpJDJKg46MX6HvqE4y9bzHdJOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477341; c=relaxed/simple;
	bh=JzPmVao8FK9SYW6EqLoAZ+WBysafs2v13tUyYWLjmGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJWo2UyYbr1PvYVzUO3hfnzwiFGJ8G7fl2nfWdOXonMLFQv0tzj4WzXck1YoO9bPa8VkEsjZpS5Ob7hzXcksP3ZZRKjCGAbOtn1DRv/aJTLVE42c6e8R+j62jtMQa9hM0DDbwm9E0PO0MWWDEhvPYgTPNpIFnY/fI4NfWisWvqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Is0cCD3K; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Is0cCD3K"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49553515a8bso2422515e9.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477338; x=1787082138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=Is0cCD3KN0Qf03/1UsrUSGHVjG5JaCHjTcrDdsuL/hfnD9C1GogzlROc67xGmq1Oea
         RIZzEl9/BJZ/Tr7TpQK9gyynRTMleZdqk6ri/TUQRx25i6TpRzY8otboyg+eA4Cw4zIx
         EQom2dlne9PjL/lAbDffEW0SpIggbRrDv+MJvCwaJOvlFP/N4spsPXk9TvTuRHHVh0Z/
         irvWuwQjZsHEyRXaY9rpcIpNcRrmQaWvswfj7Y7c8TNCvN2U5FzvNkkqbXK822PpZJeZ
         HJielUP8/YvprnAoHCxMVm+BbfzxRwsdI1P9+wScTFJo6YKY9KHygd/Mkp6457OQdnRZ
         8KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477338; x=1787082138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=fFRoJIfxOc/GPupQ+Bg7XZokGnu3rcWl1fuBZXdgnmQVY92l9W2TMehGKnVv49pOvZ
         DXHKWCvZOCauX0Hk3omU9GnAJtO+s+h5305DtCdJEDv1bgtVoeeUblRNmsuCkWkeIs1C
         CXnaNW73AjGHXkADSdyHq0MhuHsvuJ6y6KVWI1MSf0hltTraQ6e//NfsNtKzeqrjF0mZ
         nvw7Kjz3NtVUhdu7CpACceVzxo96pXLW1QxXModaR6dRenXqfRKcDqxg7IdNcfd9ZWbS
         ygsC6HykmWwO+fLc9Sc9/88UBqWvWpU+hwbZKajGCpC4SokAQD+rFhTVK4tkVfZP21wl
         z8EQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaJDleHFFK+Rxz6oJqiIYNGBYg4zxVeGDQSRVaS4TRBh7vW7ggC5H24RpVdcqDNH1AMHPrrBqCQ9TN@vger.kernel.org
X-Gm-Message-State: AOJu0YyGQHlyD7DvXnHdiX+9gfhCv/gJx+V+wvqZtJcjpGcZp2ny3LtM
	6Fw3hf+77mAKxt3/SFQ2J/yWxBtb/wceAgj9bM9KSCk7PS8ybo8WQLFV
X-Gm-Gg: AR+sD10o7PzPD0NXmcyWaAy/hbEwE1byrdMC33y1ezwD41shyCAhX25Sf0EHn0oX4uQ
	1I0v/Ngs/QXV+SKC0z7e8uA0KglRqHrvKVHM8aM9P3TSi4uJbkwGl9y73nXqeCPx6Z+TPsa42lT
	2MZaqIXqZkcYr+Z/Gk1/qNs+L0yJnYep8sFGIFo68Vh21zewIUQL+rg8EiS6cpsr0kz8xo1Ia1M
	j9MWyxNXVtOdIg43Ta9iREwN9p4O89cWmaJaIP5E/EeOaHGEsaYjrfhreF9VN5pjtTIdrh+0UgW
	ERUDL2Phdek9Sg1d/EPI7ziB6QgtLzkVaVh4GSqalAwANWzROl7499nSbHA8ar4cHWpRwpMrcMb
	Odk9wp1R989jaKlSGsXdK3iHW+FXSC7i7zTvZ/CNxqYCP+IjZIXK4rTzF+d9gQhWKstoasD8AmC
	hv+7M5p4v6QiBtUWF2xk5hpn184kLJRqjjxSvcMjY3MM4PGXm1ElbGF/raFN2pdyRc9bwkGCv/F
	0t6
X-Received: by 2002:a05:600c:a45:b0:499:79c3:4b55 with SMTP id 5b1f17b1804b1-49979c34b61mr63546905e9.18.1786477338437;
        Tue, 11 Aug 2026 12:42:18 -0700 (PDT)
Received: from antoniarch ([78.213.143.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b22784fsm2606535e9.2.2026.08.11.12.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:42:17 -0700 (PDT)
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
Subject: [PATCH v5 1/9] dt-bindings: rtc: abx80x: document ABX81X RTCs
Date: Tue, 11 Aug 2026 21:40:26 +0200
Message-ID: <20260811194034.28937-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811194034.28937-1-apokusinski01@gmail.com>
References: <20260811194034.28937-1-apokusinski01@gmail.com>
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

