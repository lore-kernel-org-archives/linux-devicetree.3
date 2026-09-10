Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD406412269
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037103; cv=none; b=bhFcxsvAY/ejcvl9aBiH7U7/3FQxgzHazGQSVB2ybW1FoonewOQQGwo8zLWBwGofMidyiL2/mRr2l/7YvPUfxb83XuWWwu9jrEQyD7dJ3L4u1dLzNuqGceIyRFvIoTanlGtloE6+QyG6Y8OgE9R5+iKSL6KR54czzG7/kf0lfms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037103; c=relaxed/simple;
	bh=3nicj74Hxx6yjlTiwkNZyN2t5b9AT5SF1NRF97CcdWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JvBHMyM/hL1mBYP0l8zX0fHVmtzwBGiF5v6UvjWa6yKbONJUiT3p2E1T0KMG8dID6t8u3+iCxhfOG8nkLeaGyVXPGcd0q4JwBjVmsJDwNelMD4x0fMr++s4x6rqZJB7mCFMYNrPFyQHfHQb0wpYGmhIzfJoOm6dQ/Cbor28XHfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AHjn1q0l; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AHjn1q0l"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so1224925f8f.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 03:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789037096; x=1789641896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNdJC8F+FI98g8O8yjU0PBhO99fdyGD2hFZaDczCwSw=;
        b=AHjn1q0lGyUL6/3JOinojmggugkfIriG2l0sQe7YmLRRaf0xgxUB0YKmNjdUUU7OJc
         9goqFckTKvm57q+wh0smma7+B4Dzd8h2VUJw5UCeX1m5iOSpf5XkvRyNLgP7H2wtoop8
         GfBSXnqaF/Pv7gPCRnDiPpTmLGyslTPntTkheYVVsLNxzP0HW1ooaBpvcqDu1o/ERW/c
         UKT0fZ6zIVyySC+Mn2ftR2948nQj6GUKIgOndDBpx/nvf9N3kGR8pDn2a5HJvY7KzQlO
         MiisvcFPSTW8WsLgantNfbz+vsTirrOaNhFXrHHL4Xo9BzEjebmHCcA9PMhOov4npj/X
         Z4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037096; x=1789641896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNdJC8F+FI98g8O8yjU0PBhO99fdyGD2hFZaDczCwSw=;
        b=eR2lk8wXbG3ffkn9oxEDarktcb34uPXgTKQ/polOlW1ETy+aghq/am+fi+GFXgnOPQ
         kjlid5P8NSUd3Ql1DiBy5dQ+enjIBQY9MyHek4DKGrTHgvo07FQnPjrkXrM4v/kJkdeB
         shV2H2U3u7dhOJ0F8L3mO1pwjNXiA7Ufu2vamK9QmhxAakUX6Zr/NKrlzKVdYjo6/Fqb
         QnThGIVIZv+gocLE1d8KIMflCHC8dtwz4rojMTCI9QHoOWALCu0JoUU367obSBOZ8fEu
         WSu1ItrfJHRyAktVg8FFCZBxtC/Hys8h5F0OQR6Y0URXOxJsYPxLGLIFvQNZ6vDNkSM1
         ovSw==
X-Gm-Message-State: AFuF++noDb6Rvz8ObSz7URIV7labc+YNH9F6StNPiNXOO28Rn/D+zTFU
	VIHqdn41DUN8pgK3igtTrDHgoBcLY+4+lHT6fSRa8m/NEXQpMSSaJY2PzLn7zMJFLcY=
X-Gm-Gg: AYBFou2xQZXotJ8vzUMou9S3lOYuwd1CDcv4YouOXy4tP2q+7Lqrki4CouoCoe2Te1Q
	Qjsdd5sQQm8ZNgabmTWa+4qohd1xu1Un/Onrt4YOb3vaqyyIfqOys8VOjW1vSbV5stuDSf6TNhF
	LafITR9eHPJSyHr/Q8nIPhkBnyL/fxueIUy7A8jQku0Fa1o3F06Z8urD29vVSJLQvfFYcjxPoa4
	bd4F5IypPUv3MpDOc5leShcTXQ2P0fTU8zoGjDPfaZD5TOwpMbbr7Xz1C7EmHJFc2AL6BFkKUfq
	iUZ+ERd1FtkThuNOkrCjRYgkIBOZ0xIU1apIZ9erVqThiPeyE7BKiqZ1ZXn877nug/9qRs+la7e
	ln0GKWuASj/agMxcBW4JTKZGU0CtAmvKP0LJ9wWDoAh65XL9ANOiIukQE4aEebl6pTo93Nizmhy
	uAAhDWeUVa4v8Wx53M/gUPeT8p4puUepj2zkZBxwvHcDtCxYVxYX//hD+yo0DkFPSFk2GHnsWh0
	GHFsn+l/Mzz8kX7LtdnhfnhnUpo
X-Received: by 2002:a05:6000:4b0c:b0:482:dac8:cd0d with SMTP id ffacd0b85a97d-485aaddef7amr22611052f8f.21.1789037091565;
        Thu, 10 Sep 2026 03:44:51 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm52826286f8f.4.2026.09.10.03.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:44:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 12:44:37 +0200
Subject: [PATCH v8 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v8-3-e906a61a7f3d@baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3988; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LBdBMXYah5b+O3yxBs9VZHzS2W2px3jjTuPIQfDgazg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqoooYcq9NPLrJjbzNHBDceVlyXxodJiDIF3o1j
 uP2FnaCXZKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKKGAAKCRDm/A8cN/La
 hX4TD/0aixhIChR8fwPiI2ZsPUSeOT6RQoSd5UZ2+mVFMj1cxLeoY0/ityCYTKcdmRkcDbJzWjZ
 pI3QgldSkswPWmBrRXu6MHUNtJBnlQciA7EEaas8IcWccgXA+OF8/fzfOM+5CEejrl0/sXbPdWw
 UmsEjHx3y+t0S/jUUXAbS/NKJlhNvC+fIoNqNuj5Q8NiNilYvJWLOFMRtn/NYRkGDvL8krkjHCU
 C6619HmWZO0gfPLGGtK7rVL4VR0DsQY0Pf08Ox1DREHKcNAGFGu+6sW7HkRAQGKdANEP17oZS9c
 bgGLvc/fEmSq0l6zhAMqRHwQsjCBAvYHP108+dpfRodRrih2cuL8iZccJuHMURO7I9SaUaK6VEw
 AHIVyseMkMIKGq86sZmksCW8SmhPERhSeND4mWqY6x6hoJvE6HGRoOA5mgY43ll7rZYSvwyu0fX
 qGVyXIXg6VOeEYF8Z3NHa5gFnUngDR5NXgxkaJcgY8mvRPjlhfPYVclKi7cxvwsZNcVIwjH9GAa
 B8qilD92l3RlWYaKJEI41C5XPvwnOl/A61xzBaF+uhwIjjrNBdy+VN24cYvOzN0AbONxO0QaB+I
 wKlsP8X1ZpmZjhFFqFi9wk8UU4Gx+uHNwYphQaU14yMg1MyUjerkEYjSO4zlRWD1kcnuOtRQcGT
 E+R85hsYUQHpMbg==
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
 .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..edca6b1e9f70 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -70,6 +70,7 @@ allOf:
               enum:
                 - x-powers,axp15060
                 - x-powers,axp305
+                - x-powers,axp318w
                 - x-powers,axp313a
                 - x-powers,axp323
 
@@ -83,6 +84,7 @@ allOf:
           contains:
             enum:
               - x-powers,axp313a
+              - x-powers,axp318w
               - x-powers,axp323
               - x-powers,axp15060
               - x-powers,axp717
@@ -102,6 +104,7 @@ properties:
           - x-powers,axp221
           - x-powers,axp223
           - x-powers,axp313a
+          - x-powers,axp318w
           - x-powers,axp323
           - x-powers,axp717
           - x-powers,axp803
@@ -156,10 +159,18 @@ properties:
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
@@ -168,6 +179,10 @@ properties:
     description: >
       DCDC4 power supply node, if present.
 
+  vin45-supply:
+    description: >
+      Combined DCDC4/DCDC5 power supply node, if present.
+
   vin5-supply:
     description: >
       DCDC5 power supply node, if present.
@@ -176,6 +191,10 @@ properties:
     description: >
       DCDC6 power supply node, if present.
 
+  vin678-supply:
+    description: >
+      Combined DCDC6/DCDC7/DCDC8 power supply node, if present.
+
   vin7-supply:
     description: >
       DCDC7 power supply node, if present.
@@ -220,6 +239,14 @@ properties:
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
@@ -277,7 +304,7 @@ properties:
           Defines the work frequency of DC-DC in kHz.
 
     patternProperties:
-      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
+      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-2]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
         $ref: /schemas/regulator/regulator.yaml#
         type: object
         unevaluatedProperties: false

-- 
2.53.0

