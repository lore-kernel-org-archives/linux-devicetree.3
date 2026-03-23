Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515593B2FDF
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283004; cv=none; b=cWr4EKdO9JGV89llcsqjEe3paeTyEkETf58SjyJAF7ht60C7lwsy8kPhp+F8AUXzV8E5x81DYqMcCkjtjVx1zSzYOLwQF/W9kcAQNZROSpdfvPu2Ex1Km+r64Ouctv0vsd3RGubt1TahLtQgndrfCMfJVTdipk2ij1PVwJFm+70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283004; c=relaxed/simple;
	bh=MU1UHlCT8FzYV5iBozHmfjiLmGEZw1XWty2n8Ga4oV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TeS4dDxwjdBEY3eyXY/uWgwPMD5hK5tB495UDZre7479LvlS108ej1P0Cm+iLPO7z4XdKPyoaEN/OsqL7nIn9jfKiqZbdE4gC9q8o76BO1CnulNATdD4GIkBhbd5EYdKkp/waPN5hcXoGPrGmOmJUT0pEbFg/XAK83IqdHR7U0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpC46tZ1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpC46tZ1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b06c43e6a7so15773705ad.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283003; x=1774887803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMgGJYslsjygUkgl7Hme70FS0OUcIYfWd+dtwioe89s=;
        b=JpC46tZ1sO3V/E7u+alV/2lzQFnVKps/Wx0H+7OPd5nsYqEKfl4MJnJOAmC3O/BJDE
         XcR8IJJIvcL9jO7hdUFOM8XwjIKpZNOZpHzJcV0G+JO4RTSNcFaD3DOHrqI4N8Hqbr9q
         1U6GoJIbMfk5ARmST4oXxEBPQc7neBe9jxgRFt485cN6m7BqqV5c4acyIELND7GfRKCc
         kPVq9lIJBUJ2ECJYU6ogeVJ4eAzg5CgLcH78fz1W09ZookAWOmo7YMXjsylg1pzvXAcL
         Yd8UXSLXDFEf5GqcJ0G59N1kDQc+0Hs8EgpRig1oAa7FSphD95lSUJRQSUDuQ/c4Zych
         AwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283003; x=1774887803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMgGJYslsjygUkgl7Hme70FS0OUcIYfWd+dtwioe89s=;
        b=SudsHHTL4mw13C70ZKdrP64sBXTHw9LCP1Bzlb6y7Wt7IIOf8Px/re6jZ9Zu/b7lJT
         v5padjSeIJUXTfqkaxaZvJE/XauZA0AK8hy/zq9I8VWpSZUCU/DBUAnLzg0LYu1zYseC
         UXAJm25Br7rmK8+i5rmHKRLD+BpFwqcTNLFyIvYO3K75byvfgKbJiC4n4WRA9fCsTfhL
         i6W3hur1uMBmwdwbxB/TS4izjsH+lFuv7FVcb8jyV3UV/5V7GC6lUhH5BArL+QxOhZaj
         7PYBEShetgzH55TAHnw4HYrr3npIjt2X3qoMFYOZitXLEvTngA5KdpYfoK+/8iJx3ZOS
         lq6w==
X-Forwarded-Encrypted: i=1; AJvYcCUa6AkuaK7v4//Wz0PWeTrIVBuW9kSsZleIcbpp0qFnz6EeiQ2HS0yTzCU9phwMQaEdrtjvWO7fwvry@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2uPtSZBqqgwdAgJabLXAxWMUoOtvvl09PkR9ExZVElaWhGAGF
	EbdBfsPnkfaBkflcwA+bMWPSMFomV1AgJnz2zH7amr+ixPf4CMeq86BE
X-Gm-Gg: ATEYQzxtxwQHtVNI2AVdNXtZZ2p+O1zw0xKJTY8XrCtYzXSjJ8MHNnHC9XjIb/T67k0
	bhmIoWWH4TrtjrRH2yUubFnyOqXwBaY9/F1D3lEOGyZZ+ciW8NzJqXsj0blZ9j/PERcpjAnicAH
	ZfoPUlryLtN0jUnRtQFM9YbEHyqmsNFi2MO4CL5PRMS0anf/rhtRVzycnCONr5oAYlqoZEsKG5j
	dNJJUJxWIgzrBnb0r4dRGqzcDsExTqE+cD+yBgj4b+9M4F5UhyXg1ZYKTPnZZ0YibxiA1WC4ITW
	eXnd8r006Fafag1wmXdnW6hG7jdnn1m5xu8+f6inoPfiZoii8ef6riLdwYuUGTnCovkuNgU0cGL
	UQgoeX5xgp23pxXMa0ZO8ROodgMrvIywei1jWYctMXcyKs2eeGR8c6CRvwmsU3FHWEJX8zvZxzl
	YW1yRpGqWwp65ryFE27ibxZUeO1GM37IvGbODHydAp9hr6SwjJUZgdYu/oOropNjXRYwkOl1beD
	/4wQfQg6bTCJQtE9B4JBgknKeML8a6AeN1liM18tg==
X-Received: by 2002:a17:903:1d0:b0:2aa:e3c7:6048 with SMTP id d9443c01a7336-2b0827484ebmr126158735ad.23.1774283002534;
        Mon, 23 Mar 2026 09:23:22 -0700 (PDT)
Received: from lakshay-piplani-HP-Pavilion-Laptop-14-dv0xxx.. ([2401:4900:81e1:cdf2:5b00:592f:5488:918f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm118477755ad.2.2026.03.23.09.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:23:22 -0700 (PDT)
From: Anshika Gupta <guptaanshika.ag@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: lakshaypiplani77@gmail.com,
	Anshika Gupta <guptaanshika.ag@gmail.com>
Subject: [PATCH 1/3] dt-bindings: hwmon: Add support for NXP P3T1084UK temperature sensor
Date: Mon, 23 Mar 2026 21:52:50 +0530
Message-ID: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The P3T1084UK is an NXP digital temperature sensor compatible with the
Texas Instruments TMP108 register and protocol specification. This patch
extends the existing DT binding for "ti,tmp108" to document the
compatible string for P3T1084UK so that the hwmon TMP108 driver can
bind to this device.

Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>
Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
index 9f6c9f6fa561..47714df5aaff 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
@@ -4,20 +4,21 @@
 $id: http://devicetree.org/schemas/hwmon/ti,tmp108.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TMP108/P3T1035/P3T1085/P3T2030 temperature sensor
+title: TMP108/P3T1035/P3T1084/P3T1085/P3T2030 temperature sensor
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description: |
-  The TMP108 or NXP P3T Family (P3T1035, P3T1085 and P3T2030) is a digital-
+  The TMP108 or NXP P3T Family (P3T1035, P3T1084, P3T1085 and P3T2030) is a digital-
   output temperature sensor with a dynamically-programmable limit window,
   and under- and over-temperature alert functions.
 
-  NXP P3T Family (P3T1035, P3T1085 and P3T2030) supports I3C.
+  NXP P3T Family (P3T1035, P3T1084, P3T1085 and P3T2030) supports I3C.
 
   Datasheets:
     https://www.ti.com/product/TMP108
+    https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf
     https://www.nxp.com/docs/en/data-sheet/P3T1085UK.pdf
     https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
 
@@ -28,6 +29,7 @@ properties:
           - const: nxp,p3t2030
           - const: nxp,p3t1035
       - const: nxp,p3t1035
+      - const: nxp,p3t1084
       - const: nxp,p3t1085
       - const: ti,tmp108
 
-- 
2.34.1

