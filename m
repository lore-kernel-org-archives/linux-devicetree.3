Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440962EEE60
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899377; cv=none; b=IfwXgtbg1/54GB5KafSkw/H3S4gbgvOZExUHaO+IElAek3+or0v/2jQ2oMFgUJizQTojWbt9PL6ManCuyMzBVr3Td/1acczK38Zk6dmicOSm1P2ck3SMqtMU4dp8oApq3nTCst9SKSxWNjziDs8MGK0Og7X3xWd0qwNc2/Wd3sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899377; c=relaxed/simple;
	bh=8jV3sPOUmzmiYZsew3DnulkuKI7cZR2rZqgemiByXB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HRwI6smxEhU7oME0Dwr+IifPr7VZ/zTWBYpb90JhiLevAVF6yeGq5NXesOhj7WspEE/gqQEfcYLzmiiY1q1DKfyC66PqiwOTmJr9+qt/Q4jnAuJ3t2TASUMZTZfU5gVa6G6tibXznVgdDi/lLpX06N8Fes8JwI5MCI9frbSi3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+OqIAvl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+OqIAvl"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso26036575ad.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780899376; x=1781504176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lxx0jQCY+1f4Z1G9lBzodgHZuU86nYtRFXdJqnpJ7WU=;
        b=S+OqIAvlkxqo3+wrUULiJUW/PvYSXqaR8rWW9bPm1bEZGbUUgEAYknyWPIx0SwjxuS
         Plovmje5ux9xDR2z6fG9uk2YC3eZEmM0OeJpA0y0ztPUcZFI8A4L0biHBzhVWBtxHXMt
         KiyForHLg2u9SPXyGbJEJe6gZVz7Z35eA6JC7SxByOF1P8sih4pTAFF38g+MyxXVVQPi
         NSvu5z3rNCPk8CCpDHC0Gzmqebs6k4ivrSWKLe2Ncw1hn//sM2tuERbttU8F0BuQHq6k
         ZSYqWwx1c9Kfu157aviehLwR9ew7TCdDOPyNMfCL7w1/DTiWOvsJhL3rKXsHXD2YlVP4
         NFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899376; x=1781504176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lxx0jQCY+1f4Z1G9lBzodgHZuU86nYtRFXdJqnpJ7WU=;
        b=f2R4y17t90IrVBs4FAqj5i1kTh5gt8k8lYyJ85Cl8cv94KXuxr+hg4k8dPiDsx2XIC
         HUsCd+VwTynfM9+MA9tBEKmSEfx9jsHu7fya+LIsLyaUArkfHENvjvz21VlCDvGgmlZZ
         sMV03N6MKSNSG0uF/6/76R3ItYDlAjXHrffihvJct6HOoAUnaNrspPDMPYN4KBqhHU9Q
         +zeEMD4cumfc2+SlMLFFaHxhrXp8u8kH86djsRyhzTHcGAZXsaADf1QjQJ/98pWbWmUL
         /PWP/okSnjBHNrXdg9DBMj1WQ6juO1EGJ/Efw6egy/oL1385hMURXHoRjoTwpSjX1Oop
         BHfw==
X-Forwarded-Encrypted: i=1; AFNElJ9XHk9RRMYJT203zHPg9mFcI1xnXiSd6v08tHMsHGvdVKI9QaPCC8xxPE1DBq8cET5dN969z2RdY/PZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwhThMpV1gZgrRYVVcJOg+rfWdCnnRhhoaw/iTnvPv5ptVsFQns
	pLUFlr5gybv19i3c4NMLMz50NUaZ+57JWeU9rpLpzMqcB/MSZt4o5jUi
X-Gm-Gg: Acq92OEw+M6chfhUKXTHb27i6FikrP54NN0T5LQhZZjc0/6wxsLb9KKmO3BLLU1Y1D8
	QkiuvyLhCAXNNEQwpYul8Vod/RfisXLDa+5AD2LV455b1b0H2hw9NSb1U+BouOLVrQe9g63KMyH
	dMsPBwffC2/uDWa/5kaRiuq9EfWbNVNj+INQvezkFKEvWVmh0acokAMugX3KKriLIUJiXlmTG/G
	sIDUNR3ey+NywfIOipjHZNTTCYgS26z6swpHPBqtQfytetDicEawiiQiNw/BQT8h9ApfBT4UwPr
	PWvkmOUqll8PenarD0Dz4JRwDxeftdYVQRWIcVoMMmiFXFG4hKqaamUd+lJOOnTg38Kwh9Vkog3
	d5OgJWQy/vFrfgbuWcFQjoKovRzyF7gc60s8SEBAEBk4NKFb0o1Lorqr/qxf2zCsdvAc1x149L6
	nrQwGnDN1irHTHyLCeBiQx0yWm9GT8lH8GFh2z3UsPiSnWYswK1eH6OeMYNFo7Hz/DJyg=
X-Received: by 2002:a17:902:e851:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c1e80edfeamr146689005ad.33.1780899375677;
        Sun, 07 Jun 2026 23:16:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:9004:8bfa:6dac:310c:dd97:e630])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm173856925ad.82.2026.06.07.23.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:16:15 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v4 1/2] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Date: Mon,  8 Jun 2026 11:45:43 +0530
Message-Id: <20260608061544.5613-2-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260608061544.5613-1-Ashish.Yadav@infineon.com>
References: <20260608061544.5613-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Add documentation for the device tree binding of the XDP730 eFuse.
Rename node to efuse to accurately reflect its hardware function.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 28 ++++++++++++-------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
index 72bc3a5e7139..4a949c53f7ae 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
@@ -5,23 +5,31 @@
 $id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Infineon XDP720 Digital eFuse Controller
+title: Infineon XDP720 / XDP730 Digital eFuse Controllers
 
 maintainers:
   - Ashish Yadav <ashish.yadav@infineon.com>
 
 description: |
-  The XDP720 is an eFuse with integrated current sensor and digital
-  controller. It provides accurate system telemetry (V, I, P, T) and
-  reports analog current at the IMON pin for post-processing.
+  The XDP720 and XDP730 are PMBus-compliant digital eFuse controllers
+  with an integrated current sensor.  They provide accurate system
+  telemetry (V, I, P, T) and report analog current at the IMON pin for
+  post-processing.
 
-  Datasheet:
-     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
+  Both parts share the same PMBus register map and direct-format
+  coefficients; they differ in the GIMON gain step exposed via the
+  TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
+  (XDP720: pin 9, XDP730: pin 20).
+
+  Datasheets:
+    - XDP720: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
+    - XDP730: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf
 
 properties:
   compatible:
     enum:
       - infineon,xdp720
+      - infineon,xdp730
 
   reg:
     maxItems: 1
@@ -33,9 +41,9 @@ properties:
 
   vdd-vin-supply:
     description:
-      Supply for the VDD_VIN pin (pin 9), the IC controller power supply.
-      Typically connected to the input bus (VIN) through a 100 ohm / 100 nF
-      RC filter.
+      Supply for the VDD_VIN pin (XDP720 pin 9, XDP730 pin 20), the IC
+      controller power supply.  Typically connected to the input bus
+      (VIN) through a 100 ohm / 100 nF RC filter.
 
 required:
   - compatible
@@ -50,7 +58,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        hwmon@11 {
+        efuse@11 {
             compatible = "infineon,xdp720";
             reg = <0x11>;
             vdd-vin-supply = <&vdd_vin>;
-- 
2.39.5

