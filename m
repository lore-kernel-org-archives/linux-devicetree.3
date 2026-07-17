Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B5429CE0
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298718; cv=none; b=BwSt3065q7iyEoRZRQ3v0N1PA6mZlSYiXpNwrkz7EbE06rShd4g8dl2xjGbzUQJnhRXb0Zc/9yT8fx/meVsYXsrwNBekKCO5kWSwsdGsXSwF5kC8BosswFb0hKZyJsHas58dwQh45m9P2xNrYinN1FGtmfKwfWKgGf8nA6VupTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298718; c=relaxed/simple;
	bh=LxL3P7ZDDGnSBlu/ddOmtGsoPccExZSdj2/X5iSlPsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQvu99KZ5IsIQcHVUk7J1V/86aOpXzhF0M//kVpfmuK7GvdVMggA8HmvQqWbv17kn6OkdBsyi2fvsKriMPG3vI1dawWQDQkyFjgyQlLZmszNhKG0/Om4kNBa8hTMOMkz3c5JEL3eARclNPmgh6ue0/Lg2sVOBpzBF21Biq0AniU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PUdtB1QH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PUdtB1QH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b966dd74so32290775e9.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784298714; x=1784903514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQrvCLaskKYjL8vcT0t1hmEL3tKSyDUY1GNsxXEl0Is=;
        b=PUdtB1QHLeXsdmk7dz7uaepHhss342rm28H9EJEMb+PRntvc7dkcf2x3Y9VHgHI9t4
         MZ45uYg1hSUVRTsZnLWEixYF+vGMV/JZSwMHZeNOTgiEoAgBUsFH9kB4Xv4A+z9yQh3N
         2jqgYnzz91nPiZogqNdFb9nDuhHnLQJh+VBwkJ1TABcJopnsy4KAJxC3kk60ZC8i11Rk
         XuH73DQ8pF8Zth12DXRgLF60A44s/8U2RxUo4flQklJmkppJxT43jUgFx2gYJg2/CTzB
         uoi4T7pp6WsAZgYLajRbvHpu6dK/jfEjvRNLxvXbA1c9sQau+9sXIX8DxivbG89y6DJY
         1tAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298714; x=1784903514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQrvCLaskKYjL8vcT0t1hmEL3tKSyDUY1GNsxXEl0Is=;
        b=hxnfWLt+XCigKCEBX+T6VwhlkuHvUPXlQVNqdAfW+vkjEEa3xX7Mjlkwsa6FqldcR6
         zyC8G+/XJZPEZ6SBjrYZvnEZivXFcjc1rlNFL0vj47Bk2V4X+mSGjOtJ0jzj/4ptSLif
         EhvNlmnmVu10dqebYYEp8JQTl8kWM3Ikn/9lybkan0V2eTTfHaJk16A7qYLsYrezZxSX
         fpknUudCBOfxNzn6xv7TRxJmBi+AJ6T4wo0zWWqlAaSQLlzOC/fLbqEaPFakZgamDH9H
         vU1rj1h37ziMW5s8C3UQaTI3M9pyyY/yUKKZd326JaZQJ6YONP+3VjERmj3AE4jj447o
         7kQA==
X-Gm-Message-State: AOJu0YwMwi1lShtdWVcqUj75wd65b8174B5xSXdDo6aj6Xq9ik0w6x1r
	5Bu5PFi1YTbOKMKVW02hHQ2SUccORj9Ios6gnc+ttOXaq4/hz4mftA58X1yUz4nC+Dk=
X-Gm-Gg: AfdE7cmQmWCB4Rrv4dgYa35vPpjUk03ReKG6Latozey+tCR87SWcURc7KTVS7Hc6ptK
	DEhO8ekJd4ygMuvzLrgw6M3rxFt5ZD4VDUxSKhNTV6dyCS55zowsI+FFpPYzK65AdfAthGFoUQi
	khiOwDwjjdy9aIYiaTnnPuV9/NjTt0tj/BnWp4T9QrLIAYtm8s22v67M4JgIjtrE7jGtr/eTXzb
	zAaB9L12NH1pUCCLYvzfSHb2lXupVDVIY2IOwYk7kfWhGR4EWiumiylItxKWD/zMrnL/9ca9nNj
	BLHK82vBj/mIqPT2qN0NlAPhRPkb4GRwVXu58FQEFuELcd8mRbAXqDB3od9VIZtM/N+XGhhl3n5
	vfcv8CR/BJKS8AO6IDYhzpDsgm5bc85+F0Z32fEZFs6/NVhtuNdZf60ctO6Sh50eL2srvT/dT9h
	oI
X-Received: by 2002:a05:600c:4fc9:b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4954a3f3b28mr34473155e9.16.1784298714581;
        Fri, 17 Jul 2026 07:31:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2f210csm56767835e9.15.2026.07.17.07.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:31:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 16:31:23 +0200
Subject: [PATCH v4 1/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-axp318-regulator-v4-1-50aff97084dd@baylibre.com>
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
In-Reply-To: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=SCsGgJ9Tp6R0f+PpY/7kge/G93NkJs0Y9x0DlFSpF7Y=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWjzO5pQzJSJfnAyElhla3aRSQmtl3yFgL0YDg
 r3eZdRP0BuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalo8zgAKCRDm/A8cN/La
 hURwD/9yHwBLUFDDtLObo9ab7SQ83ljbDMPKW38CKsAOP79NHyslfJyXqOzH7TGaiGVyQnTYHMK
 wNENTXgMY5H7dGfYKg6XpGwAcSTQe7oi0hO+ZrHAfnCDU1OPcgFfLMWOq09rC7xzA1kaWZ9kVkR
 BC2HAeunffTJrGaRVa+N1MEx8eRdmAg19Ow9ECZCk7JV4alk8bRtl4epnuz7/R+UKtwHNM3NkyW
 bwJuSP5ONqXV3zZK/HzByaS0Fm136Q8wZ5XIfJm07L4/ccDkIl/p8KUqw1V5uggw9PLmwgpIBUk
 S+AEV9WxFVUzBp1LKFFHQOm0pg6QFTs9n2156eR9g10axbAbM6hNt/2wzBdqWCo5GEapfwtO2J8
 R/2w5kXm8VhHpmuLfvd8A1xvumN8kGGXAm1Dwt67mqGMpgVZyiu22ayvq3z3krFR42dj1S0JgCL
 W/Sz6R6A8haUQYJVK5C1wua5pkv47QEMKLmblB892IZ8CtfzO4lHEYtmV5LF9vg8RuUdfRHKLQD
 RjLDZ1RioC0+goiK6ciQanRNFIFjdLSqe4kWPbWG5za4chLuaVk8bOGnCpXTmnRUchpFoadEz2+
 jWLM2Nz4UZKrUzkqQ1HoMoyiIPT+JzSCCrlDhYUDntYVYZXoh8UIqUL6U0L0/7fI4V6q/F4z7m2
 dMjW+SWym9FBzuA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Andre Przywara <andre.przywara@arm.com>

The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
Among a large number of both DCDC and LDO regulators it features the usual
ADC/IRQ/power key parts.
Like other recent PMICs, it lacks the DC/DC converter PWM frequency control
register, that rate is fixed here (1.5MHz on DCDC1, 3 MHz on the others).

Add the new compatible string, and add that to the list of PMICs without
the PWM frequency property.
Also add more input supply properties, for the split DCDC and ALDO
supplies.
The PMIC features *two* switched outputs, hanging of DCDC1, and the
manual calls them swout1 and swout2, so follow suit here and add those
names to the pattern for matching the node names.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..95b3984fe0f9 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -83,6 +83,7 @@ allOf:
           contains:
             enum:
               - x-powers,axp313a
+              - x-powers,axp318w
               - x-powers,axp323
               - x-powers,axp15060
               - x-powers,axp717
@@ -102,6 +103,7 @@ properties:
           - x-powers,axp221
           - x-powers,axp223
           - x-powers,axp313a
+          - x-powers,axp318w
           - x-powers,axp323
           - x-powers,axp717
           - x-powers,axp803
@@ -156,10 +158,18 @@ properties:
     description: >
       DCDC1 power supply node, if present.
 
+  vin19-supply:
+    description: >
+      Combined DCDC1/DCDC9 power supply node, if present.
+
   vin2-supply:
     description: >
       DCDC2 power supply node, if present.
 
+  vin23-supply:
+    description: >
+      Combined DCDC2/DCDC3 power supply node, if present.
+
   vin3-supply:
     description: >
       DCDC3 power supply node, if present.
@@ -168,6 +178,10 @@ properties:
     description: >
       DCDC4 power supply node, if present.
 
+  vin45-supply:
+    description: >
+      Combined DCDC4/DCDC5 power supply node, if present.
+
   vin5-supply:
     description: >
       DCDC5 power supply node, if present.
@@ -176,6 +190,10 @@ properties:
     description: >
       DCDC6 power supply node, if present.
 
+  vin678-supply:
+    description: >
+      Combined DCDC6/DCDC7/DCDC8 power supply node, if present.
+
   vin7-supply:
     description: >
       DCDC7 power supply node, if present.
@@ -220,6 +238,14 @@ properties:
     description: >
       ALDO* power supply node, if present.
 
+  aldo156in-supply:
+    description: >
+      ALDO* power supply node, if present.
+
+  aldo234in-supply:
+    description: >
+      ALDO* power supply node, if present.
+
   bldoin-supply:
     description: >
       BLDO* power supply node, if present.
@@ -277,7 +303,7 @@ properties:
           Defines the work frequency of DC-DC in kHz.
 
     patternProperties:
-      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
+      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-9]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
         $ref: /schemas/regulator/regulator.yaml#
         type: object
         unevaluatedProperties: false

-- 
2.47.3

