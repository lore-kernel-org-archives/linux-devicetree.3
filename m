Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89374E66A5
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647925; cv=none; b=JJJSWgsn+gW6JtyCvY7SpMaWYO/4+YWm8L3LbixoqgjkRG5REugNKMmWhA4kDs1yHRLovk9ukmkfjTqsEpLbgNO34p0Osmj+NlFWgdxVAvc0vFaPCGDU9tt6xypVGtK4rLrrNPupahwVgFlv0Zr69ldmqikzGCcw0nPk9BmknuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647925; c=relaxed/simple;
	bh=Uqd5qZEsRqOkUbFbqjWvB0w0LK0SzQ/ZsYEmjy+qwVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3pTf66ByxEI66RNSgv4eeQ7kgWPMH+08TQf9YWi1r09Nv598NJje1BwR5g0QLoG5laHhKivvXtOAuOamyU/5B431Kv1JA6keLTipJHX9WKIKxL52ZdLsdOmC+OypueeCQNrw1kyT8wsHq+SOne3JPPYrVn6ZmGBO5uzwZt7mTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVcwQMml; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVcwQMml"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so402602f8f.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647915; x=1790252715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zh8dnCzgurcfuVXhK01muyhzuo7mZiFtdSNhXSbz6gU=;
        b=qVcwQMml9qh+H7wiHg+MJtZwbUGHHVWZzc8lfYa3pHYaTsTSF+HpL+bg21lSu5QR6o
         iDpqnpoMZ7ANUvwuNTxj5pJuSeiBfalJTBN/56SDOy9sLPrVvFT0Hx5vMOXx6Ayo8iFw
         QFF7ubs3h7ExHfx6TIBab6Z1luyXj1HaYSMoJFj7vQjlAagcqAU6vp4LnNHs8/1/SLYU
         svZHm9BRvAUuF7Hi+ca9mTYkE3/GKY+LMSryvlU6+OVN2XBRbkWBihZIn+nE+yStVjlo
         zhRs5ebNXkNSHYkF89H2rCQdrcpFJfKc14itCuAx78T0gNaOT3w9ENy6fMytKZ/uoH3A
         s7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647915; x=1790252715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zh8dnCzgurcfuVXhK01muyhzuo7mZiFtdSNhXSbz6gU=;
        b=dIBSEGMAWUmroK0PdNjw4yaRQkuubfqgSSljONm9P1KM9GtsbRHi7j4rkDWUBIuLpI
         ETjOtGJkJPBGmOl9p/GYpb84fY4/xWAm3V1GHIYId/JUsv2tOK6IKD/bog+8L7N4xdqx
         cjxbjhbG+UZHbISRlBszFU+a7klOHWBgPEu3Ejn8qEns/2syAnGzrrfws4GjFiaMFh5z
         AF1N2oVkRAK7ev+HeEFXSHOT8WlvkWnUXfqCskImlPzRDkGfnaUOccP9rAcT9xrkhFiY
         avhoU0wostJOJUyO2sJXn1m++I+9aKMUIflfLF6Etp84lnqJRDIPdvpyBohIg6NHbzRd
         ehEw==
X-Forwarded-Encrypted: i=1; AKwUvBzq3PgRIWQ2VI6Q4ZyobjqrBHc14N2OnxCcotUIKy/gde4SogwYI1uGHPV7TEdXWa+xcILuUsyz6MnL@vger.kernel.org
X-Gm-Message-State: AFuF++kHMjLQ/x29QzcTW7pOxoD5qtHbuamHlVfNKwItKZL7n67pONsU
	Om43eCclyLtusDLe4kvzGvXs4t7gh7nyTlVTdmAgNr+D/IrAxG2K8BK0
X-Gm-Gg: AYBFou1Ah/w1bcHxuObsfx5fgC5XQWd8ewNP0l42UgeKlpWWkDGewfzLpA3vDYGx8HQ
	3MkJDrtCO9+80GzHHw3cIvQfxhJ9i47Dl9o9vKauYM/VwH1Fa+SKvfiaY1iH6zYmK3NelTJrvXu
	znzSdOn7cqJPSxsinTCcNERBYV0l2KxqMESF8RXZow9WUS/VH2KwhlwjJta208resjliQjIqYnE
	vapS4iBxBSQoVg2pTP4m+JUD9trlHs4Sq3S/gSpjQGUenspIOEB+SCS26cXky7i43GBHjigtmo3
	mOj0TT17ZfS7H6T2zntPHz3re3Bis2WCAFiUW26LY0K411K/UfQsK/61/+goy2cT0KYh0u8Kust
	k6oP740iHSXWbyf0XRKYvqi5zYK2CNh0c0qc2NzNEUevfV7pLnOuKmcjBsbsV1T1l6UOLRdWz5o
	LKvV3akYB4zEhBs0qnL0IUccQLEpC99g6rgvMhn3AQtV8qHT3QqssC3+PrbRRUghN6XtX1Zbqap
	y7dHA3uXq01RWRm0CKWa0i9DkBHBPE4Fj91TTrceNszAg==
X-Received: by 2002:a05:6000:40e1:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-4870cef0c80mr7996798f8f.15.1789647914967;
        Thu, 17 Sep 2026 05:25:14 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm15276567f8f.20.2026.09.17.05.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:14 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH v2 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Thu, 17 Sep 2026 14:21:43 +0200
Message-ID: <20260917122144.703221-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917122144.703221-1-sander.speetjens@gmail.com>
References: <20260917122144.703221-1-sander.speetjens@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add charging-voltage-millivolt property for the Raspberry Pi 5 RTC.

V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
the existing raspberrypi,bcm2835-firmware properties.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..1a0432510bee 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,11 @@ properties:
     required:
       - compatible
 
+  charging-voltage-millivolt:
+    $ref: /schemas/rtc/rtc.yaml#/properties/charging-voltage-millivolt
+    minimum: 1300
+    maximum: 5000
+
 required:
   - compatible
   - mboxes
@@ -171,5 +176,7 @@ examples:
             touchscreen-size-x = <800>;
             touchscreen-size-y = <480>;
         };
+
+        trickle-charge-millivolt = <3300>;
     };
 ...
-- 
2.55.0

