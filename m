Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7767D33D6E3
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546452; cv=none; b=Nh19sOt8Xo85Eq0vcgRG7P5XFJfSPClWGdafqXewkx39OQLFk1aw0ddgbIQHb7RyaubnDXuXQMAm/fOz9vpixrDsW0dv6/VWiKeBaFAgxepGAlR5Lcfuz6xAJ+J44OddpSzYqeE6IfBy7e8fZ2SeX10mqhoAFJ9oibO9KKx4A1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546452; c=relaxed/simple;
	bh=HNKPooQDA/uxDpi0iVReus05wyumo6SSu/JRjgFGHnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSXkPr2kLyF1hli0WVSd/LIP+zFGLRAaIhOrPHg4juEVNj4OqOoB/JgGDQLCtg0PjhTnK9S9SSqKMMmGN+AI51hlRM5v5dTRbSBCZVEetMbz7Wf+xCz25mNMdWjjKpBZKdzqzK99E7HKAHGa2oklVSbDcZjgJVeKZgsVBJgA1MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EM8H1SiZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EM8H1SiZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso11574695e9.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784546449; x=1785151249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMG++y6EWSQXnyGqXgGD2YHD3WKXzWPkbseer/BOl7g=;
        b=EM8H1SiZD3rEm5/GFucs4yhmtj+4JRCF1GuxJvC9CrvhF4C/qeP8Unt5GCQkEgCNCu
         D+qx244m73iRbiS5aLxrnBXC3vok9w04VtHLYEvBt2utQx4nS63kHgR9G/BBzR0mYdoO
         S3aZyetiiTlcs/hP177fM9lJof9FaAONyC6vgMNJo7GSJJKsrEewqiBviHqvRXY2pZi9
         d8/XeFIBOLSY8GExJ4IWwtqhCaTr/obW8jWEtoXVyGGqS8D5LqggwBL/SJeCoY1MGPBM
         wfd/0+bo0qwAIDryF7JC8XsUbO9XsApAdnEXgVabIwcfzr7NOUeNcqrHhF5823/FHjzO
         uAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546449; x=1785151249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMG++y6EWSQXnyGqXgGD2YHD3WKXzWPkbseer/BOl7g=;
        b=kCkdmTCrx79LzWUc6Ozx0MV1NM6E6BW+jHW+Cm73M6sT80ukfo7AcSfPpVk4xeQo8t
         vak6HD6/VboQjN2pMh8RBuCS6KkuNuKtSl2B0utcu8NtwELUFqp71zlN0mVNLoeWAWO2
         rbL/bwmjm5FRXGrTtVEZCdrcgCer3v8RStpsfUtWXD7q29ObXFDacZvQ62Z/OmkEGiKS
         6gudUAPeVDNk5N5tqmr+igld1Gi7ykZ7mV6kLmE4eoWdjKw44DmkI5mxf+tc4aJTPwYg
         /YgtLrH0DmJEMDMXDmxTVaMOs7V2QggPjSxf7VnkacAvEFJfw9wWqPzAwMeCrngmf5tR
         oE7g==
X-Gm-Message-State: AOJu0YzpriUbZ1r0WyPX8EernvZ7kTw890jWSD++2kSzS+OF1MCBpocp
	ypONGInhy2uN69UbnFixWIFAiq5uqsRuvi3bL0FMFnXR2xHh7DvHl/hvuwYt/4iVU8I=
X-Gm-Gg: AfdE7cltlmVhP90j+BwS4TiYinwbyK4ZGcu0rp0JKNN4dPgbx2WMRfwJN3v0rcYP0kI
	znB2HC+AVEw6UnaG7y46Fk6BL61s6SSaRJ4jyUTn7DYFThE6PtkxUJo72BKO3jXO8wcOyKPBDnc
	qXt+Dn6nckcaku8VeK+xDo6x/h82hU0FS+MWy9JB22/4FsbCKs+m8wkRHOWFX0n7m4GkayGOBvW
	A3l8VjQ6ksdw6ga8HNfcG1Q01BKk80aP8oUurpv/4GMHY8quyyJvv8Y6TgWoBMH6ibduspSSzGf
	RVVewPBMTgdjITx84BitamkMwbUlqJ2jSlwnyAtCLMnTXeqktbREQe60ppE89pSWscYawJ84o1/
	KRR4QMvFy6Qcl8qwvTP1RfC/NqrIgrUTAioihGAIkqpD7hCiMej2LE25kups+kMsSPpfyBTWUIl
	RD
X-Received: by 2002:a05:600c:4f82:b0:495:51b6:174f with SMTP id 5b1f17b1804b1-49551b61801mr96136675e9.20.1784546448902;
        Mon, 20 Jul 2026 04:20:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f341:e28f:dde9:3687])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2b893dsm242517495e9.8.2026.07.20.04.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:20:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 20 Jul 2026 13:20:30 +0200
Subject: [PATCH v5 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-axp318-regulator-v5-3-a1afa7ee24f9@baylibre.com>
References: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
In-Reply-To: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hsuv5cpXOmqMVqVOdS3Ga8YcCzGfBUQhLGlSYAfReNA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqXgSFcUwnygGmdULOR+FGKv4O8P6bnHyKp8rUo
 wL3XbfMHd2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCal4EhQAKCRDm/A8cN/La
 hX0WD/4wVrNDgbQZjl9PSIc+tTNxGDoNJeRjSmZSoemzL7P+jxWdw47VuAIvFGRhs5fX2bdIaB2
 zus0xGEeRSsjod91C/+5fNlAO8JMfZGIUNK1nOU1voTHrFBwG5aaCIbVItMIkpxVb16C7gqq1Md
 dEF3geqdvvS7vmaAaIK52FICtv0yn7iyy2ChyN94ZN+CJToPjbPq7aCj7GhG/3Ys2y5WGg9n1u8
 lPE8FQdxwTk/kYoglzb4g4PJQeEsuq17+f+wkBgaW2BZc3YCrgOi8xUixqemTV/CyFTR/3I2Lpq
 vcPATBZd0VaMDUBcZ+l9SNdOVZlxnE8zKLygdBbOAZvMsKomlpJem8I7MdIfc0szZh9bKcsyzWo
 VB+RyaI2WnNraZQoBzcsL3TjjNOny8G360dhlbOrkrY5bwRbjMPAy9ovRk66yXreB48+isxMCaJ
 nPIO6hE6xOpks0anglk2htnl7GyPP6k8FAG6J0vdsEdrteW/Pq0mmCnaQrOlUPbQMvYy9wOKs1Q
 iXA7KhP3Z/OUtzEcyPA4M4vkIRiBVRSXAQfKRFEfoQLlzr78mHyG6nMRhkIv1uVwrrmdvGB5Na6
 BDUOfgmqgSJwDH+h0xZ2h8XV40/P/NRxhIl12x0r2nN14tOqU4TTmEwXIGY6FihYJPO2Qwqr0d3
 Vd92Aqw+A3JPIaw==
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
index 45f015d63df1..38556c32417b 100644
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
+      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-2]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
         $ref: /schemas/regulator/regulator.yaml#
         type: object
         unevaluatedProperties: false

-- 
2.47.3

