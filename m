Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1FB40B11E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750448; cv=none; b=me4izBmzpFTNRgbOTUj2phWnrk+8m1DG+wylDVQs+Ky5nz/fBF1t9zOs61+JgDPeb1VyOgTDFG9G8TY+eMG4yZmXKe2p9fwfZoiZzkfSFZLIZR8F1+wRMcbuBw3PEnD8kq4/Fn5vb6nYfZEmz0I8WtkgFh6Ont5/Up5pCLfdnEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750448; c=relaxed/simple;
	bh=2duyGJfYn/GaJJaQhdZ+Iv5JO7zcXIu5UtXyuenKfAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZWmTzcSeXASCpSuWVd4JdChDdsIRlJtOGAa9Ro64klrchijGK2M2Ywj7ZmNFGDwk805bBAdkvyAuSLhLArJwoKRnE9mnPFMkfLrcBwA/hv8XmhdDBIE84mAjSXGasoc0kV4ZfhZhGF0qU3GcdElGo4DoS1GxisgMU6UWpiqXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaN57uyV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaN57uyV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f752b3423so3073810f8f.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784750443; x=1785355243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DshTRZZ/m+S2rWQf/vGQq88KvnVaF2XUCiONGMXKAu8=;
        b=kaN57uyVRDIPuS1Zw9xAj7lU9v8cSu6MbmzKkiqYGV6cwPq/RZnM3BO69djElQQJtI
         g3iKic7wuLOg/rCw+YUWWy8yZncEeczaXtmY+f7lxF2YsCqF0C33s4QpHMKyYmVWsYP8
         vBQurNv32Sh4GyYWx+WkWw55gIBVgRCt85gMV8TJVn6xy+6wtRWhTsj5P1gZO669mINm
         ET/VuYYxX9KBKRvks2o5+OU67iNuQZ4zU/8mwlH/Tk5l2VXqmVP3UggdCKAtgAIGJkWD
         k205eXDQWrLkuFRL2awPt3SEO7BNa0dZvahnRAOSfcnj5Lg3zVLMZab0FDZlBPcAojDi
         wi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750443; x=1785355243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DshTRZZ/m+S2rWQf/vGQq88KvnVaF2XUCiONGMXKAu8=;
        b=gn/XrdzsyPO3GKCqgX8mZL+c9qU5WwpMDj2CQSC0qGlt2/hE2m9MqV/by6FJqSWvQo
         MHxT/X/khzpgxdWRy1m4vyDp99LhsS6a097FYvJFyUAuphh8YuGsuLC4lBzlHoFhcQba
         izrnnGVh9Tc/yI33JQPyGOooUNGMP6Nt3KGZZItx3sbhVkWivpCtjk/NWe7ptNhNnQ2Y
         luLPTDIm8hhlNSZpjsdiAVfKTWtooOUtD3DI8aeC8v9lP3hAZDzM8njPE8Hlb3eRx9uw
         lHb8Jm+aS3OGcAKdxgjLCe5Mf/PJ9LwlNWqzUPxIcq9IZ1QEZzSDIn6nDmpZJebRQw8p
         e9ew==
X-Forwarded-Encrypted: i=1; AHgh+RqGALZ134a+DdKZDLafPcClRhxpPu0w5JDETDDBmAeycrz+7a209TwRbRSRyEsrmzgLrxgGowa/QlkZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxhoFwNpiLOp+/+G+vepIxYG/fbdaVmJyCTMGYtT76WCvX7td8g
	49CJHg2o1TYqGTpmt2ydJSA6KYJUQZED5N4mu2uxfOWaDaxi4ivzz3kq
X-Gm-Gg: AR+sD13IxiEUu4AMOK/mEm4HRa3Aq49MpkL+92a8Ku2sVS75oXBXRXgmteqWXIx6LKy
	SQRmu5klChxWj5xhuNNpevV9zgx9q+msWcCI1kt6S97JEzux1+/TNNHSwK0XzYxPWt4VJ2oEwai
	SkCL2I96ic/OT6Gk6WsSZGg6Ob8o5qUE9+HyYAn64onAtTN7LC5ymI7qkCsKd9jxcSKFkMo/13f
	rxWbh7QsAcK7EKkk++5q/HVkI6xR3nxb9IpAynsgW9uFkBsXgMJTPDyJqjWWc1PxjkzDb15dSz/
	fUPkuXj4oZuCTIx3x1t6z4c0Tkh5o8xKfCWgUfQ66ex5z/6FyyGIIQPY+wtIslN441o0S8980ea
	buMlkW6tE9H75Jp2bh7abue+Rob4Z8fpqt0PeOqRKsi+21nVOiC2cUi2NPde2z9Kwh+IfWvGWYX
	ycvfqY+w==
X-Received: by 2002:a5d:5d0f:0:b0:47f:85d6:9e7f with SMTP id ffacd0b85a97d-47f8da5c8f5mr314708f8f.3.1784750442895;
        Wed, 22 Jul 2026 13:00:42 -0700 (PDT)
Received: from antoniarch ([78.210.252.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm9532851f8f.20.2026.07.22.13.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:00:42 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 1/6] dt-bindings: rtc: abx80x: document ABX81X RTCs
Date: Wed, 22 Jul 2026 21:58:09 +0200
Message-ID: <20260722195814.298552-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722195814.298552-1-apokusinski01@gmail.com>
References: <20260722195814.298552-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Abracon AB0815 and AB1815 are RTC modules with SPI interface.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../devicetree/bindings/rtc/abracon,abx80x.yaml   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
index 355b0598411a..234a103724b5 100644
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
@@ -96,3 +98,14 @@ examples:
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

