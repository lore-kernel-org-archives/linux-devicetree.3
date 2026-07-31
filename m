Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0A443802D
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509030; cv=none; b=KWLCRZ/fKwKcFb4BLE/EMSrspsr3qfnlHj33kcnW3mhiBS7ZmBKZC7X72X22Fqs9hJ5wr7ymbiUl8d4azsToZbfUOlUk/nJqQtXC+Tf7q1on905Bz7GR2GrzA39DdXeyeFqFw1XfSkPY44XbV+4t3UWzMF7Fc63TsW18XPBlpx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509030; c=relaxed/simple;
	bh=HNKPooQDA/uxDpi0iVReus05wyumo6SSu/JRjgFGHnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJHSo1AoysDvh4aQ+Lla1rBdAriBWKiU4p1YMYu65E1BXybeaVye3/qXOzV5AsBvSnAeGquOMgm8neSooAQFR7fJY9IhYoKVLNDjnsigDmFLS270eAkFg1VpVSm1NBg+iMqQhBQDhwV/VM+5tpNCbwqz2kna74QnL5HiQwmWkBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ONeXnRCG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ONeXnRCG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47640541585so815139f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785509026; x=1786113826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMG++y6EWSQXnyGqXgGD2YHD3WKXzWPkbseer/BOl7g=;
        b=ONeXnRCGWA41hN0tAXQ5CByKbJ+ib1iAHAfI07wQetE57rBO6fF/KkXXHPQo/C4Xg0
         2HGDRYyQ/Vz9M/PW6C68feOipQJ9Hg/d/IZo47J9Jxjfw3z4x77JtA6urHSK07SnjTsa
         Ugh9Mz5ce/38tTWldlce2ggHZBVmRghnI5Nun3nkQrrC0E3G9TgPrkb7wSOlaOwlduvW
         /0dxL1SeGZDKuNzcVKAPfla2KRJ9aqaKqsqw2lH0Cu4J4ZyNEKYjBOArVn3v+JjfdIaS
         hRtDQZMBQh/vNIeX+a26RF4Ip2/OX9+JotPPdJM/r5QIavMYVF1VvXYPbKsII1idY+iE
         2dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509026; x=1786113826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMG++y6EWSQXnyGqXgGD2YHD3WKXzWPkbseer/BOl7g=;
        b=VXPNqp54MKdxBdA/At2XZ3dxdVoVoyB8RhRYsck8rtK+yU7epE7fE+qu3DzIiecNr7
         y3BWuWF8bHFvEVlnIumszoX2WwE/B/c8dz4VtopDSpWEYt8p4uN0rfC4a1Q/8EN0OCKV
         gWRZ3neF93fROERa6wZFoc1penlhW89fVBmRzxlldysH8pXNmn+xz2QjcoXjytNaWkth
         Yl2C28sFDJ0fsNynrR3PnxUtyv/3h/vkOPb2Fwd8mSOiZyt4oBSO0VhjrE4P/LSyoNTh
         zXkcQa4Yarcs32O6bQwSYTvKk1cL+aC3AUq0YN6YTuz1bJ4lSali22UThqhZHG6w6yFi
         4URQ==
X-Gm-Message-State: AOJu0YwCpvtCEQ6RBc9gZytlGeBwM01WHSmI5C+ZUWmnoEXriJT+dAb6
	ZjR4GfxH39aTTPtiMbvZeajU9mbC4BeV6swBXLQQg8ILo2XX077Gb9paouK0wtbI3HU=
X-Gm-Gg: AR+sD13u2Og6qhfZmcXhoNzQAKgaifnWmwx/ZmpQmYkmL4+grRbk+FbB4z/2nB7ot0p
	PBrrhtrQy3YFhWWTpynVVHcv1vBBOkn7vlMuMdaOlOLybcJZ2Cssd8Ycx9//Dhm+1dlpy4sTp6R
	H2dOm5z8RLCPv3jDvCPpBGuVe/flbbj71zOUEYuMFzDyJv5kXAvMuG7XXRXxr0Pnc6mcEB08/Il
	uFr1Fgs4m47/9wg8eculLwaGsmIvCmtlTHVQ1peCKdB4zeAjkkcRsa3SHsmzsj2PUE918QOTlqg
	/4d19bFVApdkHc7NOpgDsBnghHi44NBxoKtg/ku7nkfNhvVl+GLXSSXgfWOlnXUrjR6OAbGwpu4
	obAs7Pxkd6Mdi4jU/Ik2wi1fLp/7otQiBJDl1cXbLRIVpnQwIi77Y4oeakLzshsELynfRUGwKrz
	9izSM0DgOLP6MlUXTy8WLHQD1AM6jeFceZpSduJItW6tQjp8DGEAo2EW0egw==
X-Received: by 2002:adf:e013:0:20b0:47f:93b4:2df3 with SMTP id ffacd0b85a97d-47fd2b5dda0mr3874450f8f.60.1785509026173;
        Fri, 31 Jul 2026 07:43:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd41d1956sm6314900f8f.6.2026.07.31.07.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:43:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 16:43:28 +0200
Subject: [PATCH v6 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-axp318-regulator-v6-3-b4e745552a35@baylibre.com>
References: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
In-Reply-To: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbLSWStjgF/7RSm9jVDdLC685HlmH/jrkW5guT
 xkddw6jF+aJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamy0lgAKCRDm/A8cN/La
 hVEAD/9Wui/UMbW2Zd+hoV+NnO2NMTe8WAboCzZqy30tbGBAZBrbNwAD8BK3evZUMY7hhugs9Ji
 afoFVIVlQ7bZ6bka6P2Tv6kdFmWx6Y/l44hjXkT5RFnB8P6b3HySzN/PPw7PLO/neRIPslDAMUV
 MvvmPZfWYznr4esy5V83naOStGjgz32Z6Z6DMmEG9uXF+uLO23ncQ3W770sXm3y6o1Lnn+cYvEb
 1Y/hxC4XpsC2khf3LLqxC31ux52cFYmTIJtsOtrXQQ/qG/2mv6RjN/iqScq7B6w24B1s3kGPtXG
 xt6dxmsiPqxLVVoeYwjy8Qn2UJzQE5z+RMvktGGH8NEkBAXEgiN0Tv0I5H999WJXgdSZfOGcqEz
 cdTgeMAyHyzm9aw/TV4n9yXzNE/9/efQCfIB3ZPmpas0qLghRn/b3K1xCeqvuzpM5qqCk8MU67Y
 vU6Q9ojA3GgKIOOnQE4FBH3aJPld+pHGMw4WxCn4iDxYSOvUfpc27kxaZ6mYUxPrP/4enNNxONJ
 EO6oD+9wjYISYv2bfLkERmmoawk2CWa5NdVmd6PQfn81Vcq+A1FDB99ieL5CAFZMKuEKkHw8AgM
 o4Mks1kbyxmxN1gxw4Vou02qbpxZxm8Hae/ATSsNybyasGcMfgE4//3Nw8w72FldntNPI+r58PY
 NG/yh6EKFCvYrdg==
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

