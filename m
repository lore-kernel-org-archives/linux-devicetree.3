Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E06F3B42D6
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 15:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780758392; cv=none; b=IxXi4MzupFJ9F8/Butgrp3fFgIl1LyK/TOz/xmE56Hh7y/HFrXQSUjD0iXj+y9XBzeoh+l1EGX8MUEDAcZxZjFcZbGlJ0gbfrIlg1DUyls2rz3V5FyAVxQu53BaSBu3wD9aeh2BfgYIFWQiHAPsCBqmsdYZQRo2rFZb7NefTdoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780758392; c=relaxed/simple;
	bh=5Xp05dceoyvZXVaCrNt037RzvSQB45EweEegXMfhvkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izCZ9AJFM1AZMPweOmcbuG4bJhRVLpGr1j5oHuGqV8/7i/QFgjuKWEPGZXvGP6U0w7TTGUFUbf2ByV2gP0GCP8U3wbK5kQg8gW53KaszG3Mx2yF0FdSpSiMUrG5+KzTQZn5Ng6km5Z2sjVdmpEmNxF51VwXQQlHKqxwVfos6dMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqFiGB2U; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqFiGB2U"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-138129a622dso2561068c88.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780758389; x=1781363189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPLxJdwUnTEPL//5sBV5FbB7FSjHqZ/L9m5KUj5m6AI=;
        b=GqFiGB2UgF0PjejK7EdZmlEEclY4j5rWEFZEJzAgdZDOUjukANU2aynCZkz6VP7/XM
         gHreHLdhDrndxxINAn+nGeu3fq2q6qsryaw1jvZeaFcBwqUGQIsNIWYdwBK8Do6BrNDy
         GrT736E6hCa962wpBNh4ABUrY1AICgpwG/EfRZnfoqE8DPI7SM85u0GvqkXNqiTZhnRA
         vILZ19WzB61CHKcSrZTqgiQtfaz6BtDbvnldisFKk6fNCwcLXZ1N6MU1H6sSuv6phNOI
         OLRaPXqtqsG/Oe8uhutgSMwsiWXBlDn0PlNxragRxu2C0sTHZbSR1uXgidXwUzraK8pj
         LCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758389; x=1781363189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPLxJdwUnTEPL//5sBV5FbB7FSjHqZ/L9m5KUj5m6AI=;
        b=KtvTJdlFrf6DURzfffx/ZaxgfkjcH3OVr4y+1XUkB5hZQFwNiwneO2HLZ5jwax2VvU
         JhuMeZxW5ob+xnrv1raaeNSsLdUlj/E8w3j/pSnqwjSQvgSN8iA7uwTQZXqBJr2DKrkj
         k3A4boBFEDMA40D7KbbL9xJm59bfnlhTAlYVcg79E4rQPgJNVyp222QhbeotAqv51A/Q
         fHsbzi00fDy+3G+NG56/+HTMoSePCNPWDLk9AuRtzPvjFGg+/66tcopXlprevwmEfUUH
         Uzp3tXxW2M4DrDcvNKhtt8+It4oyv8qeRyuwTQ0Os7NZlDORyN4REnWnzzPNvnMcQ0Fz
         aa/w==
X-Forwarded-Encrypted: i=1; AFNElJ/yInfa5IHftVivdVpJsu//THfx+DrF8qGmtsmpyooItOP8TKvXr86PRqN0vt3UdLjT6F0OdejAA7r2@vger.kernel.org
X-Gm-Message-State: AOJu0YySznHkvtZJYoevH9Nt/f9caWxXkZgIIlaXgvMlN0okJHvAWrRo
	uR7pZQ2R++xCYE6+UHzvYwuH8sbPijYhS+puLFQmYW4Uiu+jR5S/MSn8yUTTWA==
X-Gm-Gg: Acq92OG08AORySfB7UTSJKMvAY5ydzsltby890H8RC8y98hpJj+Bx+SPie5xRLqLfui
	7Ouf4HcJS8HnpoGdOZvENBeQcA5Mjkg91zJ91X3aqstjscc3ZaaMkemR8v76WFXC3JAs1QMF6qV
	ZO74eN9ERXIOih+2ggzXG3bgQYSu51CxdRjsJbz6YhqOAZzMGTXmnrnWw00HeqomXZhMY9SbBNj
	9lncgZl02xta5UYrAgmMTJRyx5tilUcDFnJ7za6tzSKaEox0m0G1zweBvCVsOBHD8HSYwa1dTIo
	VsRZ5nzGTbU64XWm5mCLl0A5mov7hEr7+kwN+ubULIySoNR0+5CNyZZSA4uRKkqv+3lImqflfdn
	3xrt6Pm7HTO2VqCDoTqtuSRGZngwRrjg4Ajxh91xF3GtCgt+DvL/WGAgzQXZ5Uwp84uEB2ryfBn
	BquKrUTZv+4Famtnpulrb3Tx4m2Lf6Du1G0Q/L3hZFrNXT2u1aSg==
X-Received: by 2002:a05:7022:3d04:b0:137:eda3:e5a9 with SMTP id a92af1059eb24-13806720e38mr4698313c88.28.1780758389266;
        Sat, 06 Jun 2026 08:06:29 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm8415607c88.11.2026.06.06.08.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:06:28 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] dt-bindings: input: microchip,cap11xx: Add CAP1114 support
Date: Sat,  6 Jun 2026 23:04:00 +0800
Message-ID: <20260606150458.250606-8-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606150458.250606-1-jerrysteve1101@gmail.com>
References: <20260606150458.250606-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CAP1114 is a 14-channel capacitive touch sensor with 11 LED outputs
and hardware reset support.

Add the compatible string for CAP1114, include its datasheet URL,
and update the maximum count of LED channels and linux,keycodes entries.

Add description for microchip,input-threshold: CAP1114 only provides eight
threshold entries, which does not match its total channel count.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/input/microchip,cap11xx.yaml     | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index e307628350c2..08233386a433 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -12,6 +12,7 @@ description: |
 
   For more product information please see the links below:
     CAP1106: https://ww1.microchip.com/downloads/en/DeviceDoc/00001624B.pdf
+    CAP1114: https://ww1.microchip.com/downloads/en/DeviceDoc/00002444A.pdf
     CAP1126: https://ww1.microchip.com/downloads/en/DeviceDoc/00001623B.pdf
     CAP1188: https://ww1.microchip.com/downloads/en/DeviceDoc/00001620C.pdf
     CAP1203: https://ww1.microchip.com/downloads/en/DeviceDoc/00001572B.pdf
@@ -26,6 +27,7 @@ properties:
   compatible:
     enum:
       - microchip,cap1106
+      - microchip,cap1114
       - microchip,cap1126
       - microchip,cap1188
       - microchip,cap1203
@@ -62,7 +64,7 @@ properties:
 
   linux,keycodes:
     minItems: 3
-    maxItems: 8
+    maxItems: 14
     description: |
       Specifies an array of numeric keycode values to
       be used for the channels. If this property is
@@ -122,6 +124,8 @@ properties:
       is required for a touch to be registered, making the touch sensor less
       sensitive.
       The number of entries must correspond to the number of channels.
+      CAP1114 is an exception where channels 8~14 reuse the eighth entry's
+      threshold, so counts differ.
 
   microchip,calib-sensitivity:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -149,7 +153,7 @@ patternProperties:
       reg:
         description: LED channel number
         minimum: 0
-        maximum: 7
+        maximum: 10
 
     required:
       - reg
@@ -199,6 +203,19 @@ allOf:
             reg:
               maximum: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,cap1188
+    then:
+      patternProperties:
+        "^led@":
+          properties:
+            reg:
+              maximum: 7
+
   - if:
       properties:
         compatible:
-- 
2.54.0

