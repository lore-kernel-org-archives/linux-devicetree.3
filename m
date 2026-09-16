Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C05449992
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592021; cv=none; b=VFMWisfUbvEQ13b3EU4qOMk1dtJD5NLWaEBwrBakMeifdThKEqhvnFk3r8eDymnSnHo4f2iDASCGYtymqWCPW5gxP6jGOO9cVrY/3iXe+fAj3kIVkOwBMCDqpOj5VIuSspcygQTjtP6+0Xg9gzBA05b/QFbrta2jz3ZabwYKcJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592021; c=relaxed/simple;
	bh=JzPmVao8FK9SYW6EqLoAZ+WBysafs2v13tUyYWLjmGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha81848nrMeMo0+Ssvfx3emBNI+XfQhf3egVTljvPrLeuHgngAzbq6scb5JnBzpmQ+L3CV4o8NYxYGfu9i61UfYXVcVAcGzW/J1bSoYu5xJOL8nvNcexnlYlvhIZETVwN6ae2/CAoJlSYxSsR7qk5103eLCBHbbh+8XzuJhQNKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McOHYnrV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McOHYnrV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48442ea8f59so30894f8f.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592009; x=1790196809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=McOHYnrVZSHoRbI7jUEh4KuKYRzELH6uFkRR1CmiXqeV22lEWGnqxopJNtidgjNW54
         iku27ARGI+xcXGJqXjzz/T0s/0+7wi/p5z73zHuwU2d+Vu1aNSagm/oKYmLiby2dRaMW
         aHDTKIDwk8Htt2G6bfq4VHElO5SRHcdDqz2ADTHjSzfNdoAEyi3iQ1GNG32EwSF9YxcU
         25W9Ecv2CnEPqK36upzazTX5hn0xi95EDKpWfYuEZGoBkY9A/PpnjoRrp1jJDAJ2WhP7
         eM1qXd8seIbjrBw5Kee/cp4EO2Fc0B9feju3L1bqiAEqvnEiwvN/oehQL6gGyr/NqZzS
         9yTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592009; x=1790196809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWcBC68WNKLZwVwv+eWu33G6o/TkwBMc1Uo2TtiwMQM=;
        b=0MmjkzZzv9VPCKYo7i+XQyQifrWF33RB3PUAarFABPOmCs8y8yPdi8mOogwkbN7/sb
         By+1IDSGeL9CLXv4NLdBq0Lu/SqkjFm1MBG5xN+38Ru6L9pUtWcgeV0DsTbYzfwxv9uh
         8ZAdlwPX7pg/gKOMc2rMAHzcucOMb70pn8WYw4BOCkyT2zeYfI81gk6wqmbfYsKtOAkD
         3unTUObRdQtTSNoC9mYtJXykLNbHgp/VjM9i8rTfa+7CXZRBhWzBO3KsAgFTQdZ+RP43
         Watw8/eLU6QfQueKBGpShz1Ex16qtirgdq8u1+oI/zq/nNLh0ujTEuvaf68+Xhz1qTAY
         kE4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7yXxl7wHkBVoIEmk4kNzIBj18ts3fxDNo0i0mXNbQ/sRLEGVxgDN8H4CjmY7N1FpnDF5JKncrKQQb@vger.kernel.org
X-Gm-Message-State: AFuF++lk6oQ5TCjBECswUVeV+r7RCNI+xd6dnIUu5UJEF7QIxdIGaOVD
	zOhmf7XH3QG2GaTgp568jc30G9BPg4DktfCohYLgPCuwGi1tnV6UROsz
X-Gm-Gg: AYBFou1v+iTikllmyBq1STufyMmddWQV3ABtLeSQAazZMC9ytLX2rAgOYjT3lnjp1Ni
	it9xI2p1rZsJb8kurS19T69w2CHqsvOtpWYsrRzPMi81dp5QX/OM9VO7z673viEReGX2wMZ0Yv4
	CnyxH1/5VPP6AKzmCUaVOFdEd6ECmeh7k+exgdg2DDSzw5o4aW3tXWk0H1gsruaWDkTvJRRCV2S
	lDpM41OvHdI1PwwSsnxZwkyzSDpqCSr2eyOSI6ZsVIDCMC3FfBEOzxJDhrlD8326/E8fKpDRYVm
	Iz7F8wGBtW+/h77DMBXzZ0qHyXIdQEy/QLDbUvhE9uReN8ZJEuC+0b20+BoUK7c7HzIJlDnyNZi
	8oaBptAU+LBZb4QlBXK1SzST505ZzITGRy/zTtcbssA5m2R86ltMmRmr+3IFczeN4c+aWqh1+wf
	fdOoumGhTBg2OM1oqmtcToqqNzEWovnBSWS9tqhgV3Jab+pl1AXFwTjJiZ1p32wiyo5+fiwA==
X-Received: by 2002:a05:6000:2612:b0:485:8226:c696 with SMTP id ffacd0b85a97d-48713c59e2bmr1379935f8f.21.1789592008945;
        Wed, 16 Sep 2026 13:53:28 -0700 (PDT)
Received: from antoniarch ([78.210.41.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm11086166f8f.2.2026.09.16.13.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:53:28 -0700 (PDT)
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
Subject: [PATCH v7 1/9] dt-bindings: rtc: abx80x: document ABX81X RTCs
Date: Wed, 16 Sep 2026 22:51:30 +0200
Message-ID: <20260916205138.16771-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916205138.16771-1-apokusinski01@gmail.com>
References: <20260916205138.16771-1-apokusinski01@gmail.com>
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

