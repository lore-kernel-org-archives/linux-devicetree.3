Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C823E0C47
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032711; cv=none; b=ooCGDvKd2/j+yD8vKHFe0b/KQahSi58KX7LkWy44AwKtTNeaGwbDK7Imlz36blX0Pl6QYrSZBXIP1JX0qQvRPck9YJGQw4TmG8an67jziP3DiOrBhkhkU5KrFuWUnWdlTOdbP9UB6kuBwJXKxP+OiP4js6FT73c2e0N9GVC86pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032711; c=relaxed/simple;
	bh=27AUzsKR9CssdEaQkSlsPLqzbRGUpmaiIW0xyEpwgkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJaU/xqPvdRB9NVaR9I18ACD6/6k6xtdfR9danUh4d2cqBHAAaBB89uVkIttBqoWnKMIpoD+2Ueu5ukTO/5oqKFUCJX2GjFVT6SmxSc9eGr+w/Yl9LlfMcRbSIQgOq/jnXePGG0LPKxek+80ZhKHD7CoZz4iFjjotR/eluOWAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gVBzWivr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gVBzWivr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so9404855e9.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 02:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789032704; x=1789637504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SzfhZfkD1FSheSAa+udFpbhKZgNVoMqgCB2AIjzHwc=;
        b=gVBzWivrFVqeho13k1tdUGlCxp1SjodY4Gt6FkLv0CS+9BYqRUHdTwUn1Biyn1oU1s
         CRqZVExen0k3lbeKk2odhR+sfYiGAgL/h8LRItGty/vVOUj5DgzCcHNe0smF4uYzTISg
         hVezGGPrTV9mfHEW91nWhcwDYucq8xQymAwcBHpS7F7ehyqOtGBb2vhrOs87uVGETt/k
         Bvfuj7ORaM6JSG3klSMi01llIxbBhzwRV5Pc2XH2JV7VF2Kh7zdvk2H8k/1XM52xYbFa
         5l46fsb6DOTCXmKUWMNlRPKrb3SmhWfkf1OKNOIaQ9zeihFs2qykabmBWGUZf7qJSh6p
         OLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032704; x=1789637504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SzfhZfkD1FSheSAa+udFpbhKZgNVoMqgCB2AIjzHwc=;
        b=MxOff16eyJchCI5xYv+z+KiEDRsq61UUGTYs98K0B3YraG8XPRewLI1BAuuIS878Nd
         6Gm0PdU+PCm5tUR1VsvYvmoQY7Gixf/bwUqTaYPaNbVvbvsDNNse9+cFScM4+3kAo1vg
         Y+/pzetCPKorRuyP95u3K5IhObcZsoK76JJRV6vaE13d00XeAvmCuwUatqn3dbEe8j9u
         o8xlCoDjMMg6OfdriOvNTvnpnvMkuFwGafFDsyXJrKwM1BrigUIeFQ1ZM/K+RtsQulSM
         XKt+nUpJNxSN6YF+jt1SiLKtxKdDpbeveU8pLc2a1dgu6JWSEdKU9PHo2Z5Dpu4xLLPH
         4Psg==
X-Gm-Message-State: AFuF++l0OP/JetqYXuIRxJIBAc1JyCP4XS7tcoMc+aFc0Kmrfa/Httw5
	xG9YMWsRZSiDo6sHmkZRKGE2JaC4jJjuAtLjLBnVAGpRRL7OPfMpoDwghE/Tnh3zuYM=
X-Gm-Gg: AYBFou0WKLtNs0qpNwEcPJ9gW9XWkuNIzvBTSLllLDCfeB64I6Sb4e7z9TVlIT3gaTs
	Ksz6P2qHEXGKku7TZ5o+uFCYFY+OCG52/Ucfd0S2mTteHtQoVY+N6zbSgm1A2Ic6WQFVSS9n54z
	/oV5VolC9zfFz8i6BvIRZnW8ab8zWxBGxw3uIm8fuZ3YzvfVVvtg0VrMCPqcHqW3i56ohQTrTcc
	fekIVAJXsz7bt19q/0qF5VvcMZS+KSIrv4rP7XM5vVOnWviS1dF3jAmblodjTJNoK/f3ZRlFJUf
	pVz3Z12Nqi6e09C1aWaZuvpGp7dehDhf+tzFqNJHKvBfqbdTJf/tcz1Wo5382fVf2Ya5yZRa5O8
	AJzm+X5/FqaoxD9ndKK2Sfm/PYn17jtr7JpSukaOVw3KsDLT7mJBcYq0B7YAqjVayZHf8bms6uh
	A7ri1OoZ8Hl3cJLUvr3aFmiN1JAxKF8yerdYVGNt6leDFL/JPO2KTncLUlS5RKU7ZYZWFlpMhyS
	AHQQtVGk8/uAFDbtA==
X-Received: by 2002:a05:600c:c48f:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-49d258cda4emr58183465e9.6.1789032704515;
        Thu, 10 Sep 2026 02:31:44 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf332esm54965505e9.8.2026.09.10.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:31:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 11:31:10 +0200
Subject: [PATCH v7 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v7-3-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6eSLEgss9n7JCsvVnaFzT4hYnTeTkd6TBh6eqWPLl0E=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqonjwMfjSAPRNpZoCxaIrK3onAQOeCgr2fiRTu
 ejAQpLKhbCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqJ48AAKCRDm/A8cN/La
 he5CD/0ZJJKGnyLNZ+C4njPLmH4FrE2JTONJCh6Q2ouaK6jRE1+pKnhUOJ5/b9ZA8VUJX1ehb9Q
 VJEGB4+eQNZG9vKc4z0EsBnQgj2s9HIG5v5GyvSskGy1yqQ6PTyoOdWGKvN+6ZlCT2LRmJkqYxf
 qvV3vH2H79OvEBGTGWZgjFmJEYOyjpAITKCcfNsD4gVAkohoVLbOMa90BVA1LH8MeRUyxFMDNC1
 PXfKfC1rvi2Mh1x2wC6qp7Kc/iGMzLweL8MmkOSzEOvDUHSNeoNqrqQS4u9N+jJRssKjXxGlU2S
 4Zdc/aHaFkKBTJoOXpc6B6bhBp0du2h+opFJURQTpHXo6sx2J0MpnVQ3ZX9yHCDDdLkIHdqWMq6
 MRySKTofNx592rOO2KYXplXC2bTsKcvXhfM7KQ/EKu9LrgAa+bqTlGx4S+k1cVjz3+kSCMQRjX1
 ZwQGK8t/oUOB68lyiJNEYCYGpiyVqLxEKqHbsNzP02paU9t5bN35DjhIcuqTNlCGSEuIDKnC+9Z
 DuVZSwRcUftsAF2WKl8q62wJ85l4RdFXUhWPN9GWR9LC+DJO0B4/5n4iVwTTNJog715QSMjws/A
 ErzwlN7r1+IKfRJbZGUpGOoSyu6FbWGyh2YZ/bSa153RVVr9np3Yo7/paNDGW7c4854M7dtgDg/
 qslxEgM3551cxww==
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
2.53.0

