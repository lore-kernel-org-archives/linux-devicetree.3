Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F158400E15
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570264; cv=none; b=eGmpavNWa0djHeQrYHQMyLqfCZewhX7/v3NZ7Xql8gMNu1Y3l7l6s+0ZgJrTGHyAowzpAtkn4JABOApiMZdH8ogZmxVnx6j79tnn5KrzefPPYcPdToebogfjmCam3yLLuv3C+pLEEo6Jn+za38FGq1ZKv4r1vLk59t6l7z24/Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570264; c=relaxed/simple;
	bh=HNKPooQDA/uxDpi0iVReus05wyumo6SSu/JRjgFGHnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/hOVTwtc6jUC7Gqm5ezWjlvpaQDOi7UxattJDS2sV6hrAd3yA9o48DxPTgo5clCAmTm3SBrzWQjtBf5Qr+T3hqjA7xJnhwIpu2bDhZkjUTRbdoN8YXNiXa0eH5KKqgz0LHnx9K1OG9QzAtvyaCBi8tawpH/2D2gtUyIZ2dxp8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ju35CkvD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ju35CkvD"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fd4531020so10758f8f.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786570261; x=1787175061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sMG++y6EWSQXnyGqXgGD2YHD3WKXzWPkbseer/BOl7g=;
        b=ju35CkvD3UG4ksekdPaPn4eMfhRu4jOT3p1x5JkjgHXFWWBu46gSCgSSC+IctS82R7
         RoZk/FuB4QfqgYuzsi96zIkI0yZxYeSDcPH3IHjWBYYp/5Z66JsvhX1e/GfNxQ/PqxPb
         HcjF+l5OnuJbCsTACUHsPPKUAtzFjri4Kejn+5GeFfEuoLAyPfXkD5e5WdSwxrjrq1Zd
         Ae3PZU+5+pSaDc4JFCXYZQHYv9stHYzgQYYfEcsW0ZbbtrdPH+cr7ykUMKVceU0JZE5G
         seE7m+Rf3JYGIt7cwhTJAz2WPW/OV9TK+KkGQqizeeOYiP2PbyRJRublbv0E+KGklwB5
         YsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570261; x=1787175061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMG++y6EWSQXnyGqXgGD2YHD3WKXzWPkbseer/BOl7g=;
        b=LvE9i5/BM453YG8DnxH75Q+xcOicWKrGIFv7glagyDaoTUDgJzYsj8Cj3XfYM6gmgL
         3j2xTLjje7i/KqTooBOH5D+ekA6DPzQW7XXBkqadVPDhqX9dCdnyaa24aYXLqceGii4R
         UQhQjc0rk2TRePf5kB/a38zr6bewEXQ/BMt+eMQ4Bvuk4NxI0gRxvr8sDKnY34hOdQQv
         YO2mqmmq1xj7m3+gCV6YFPWujbJTS2WLu0wD3dK9aoJt8ru4yHS90uCkpVQm6uIqf0ML
         5Q3YiNEnKnpDPWmE8VbgR3FI0nJlI6hlCKVnN673EZy19bMBTO2zL+EeQYTW/TOBss+0
         85eQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMeOfpZdL0DdPBqEAZWxyCjK+wdOyAABPKvJPV5tN+KMgxsqiejUm9CVobRQxMVfMXZ8uaBR8asOEY@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZIvf9h8tukPVS92aoe0FjoKTL7At6IcEPmnCgrjPPIa5qowj
	oN3DWHo2TzFrcM0f6BjvTge/ih7o7azakUpbCphJNu/md3j5yJcdiwnmvhMssd4sBSY=
X-Gm-Gg: AR+sD10R6X4HTQhFgD+4g0UQPE7rT8TFzUL9UNA9RSI/snml1Nst6ekTOY0LcbEZxGn
	9iHz3tCi1MghycOCb8SOePqTF67jOLdGWW3Q7np/CNIGQ8pVATpHrYmKWVuFNV8J1/nSwJJwzFJ
	FVLoh4FutfE1eGZVFb5nEAx3T7DTYlNDsWABVpmEIPtQUThmw4bQTOZpHVSMkkSNY3Ibi686Bml
	oVI9pKAw0LbEM7AJMeLqbdRCURtmCTJiWOBequLDENoCS7VhIeZXy9vNzWNPN1qlWciV3v7ZqcJ
	5XR7dXLaZTZERajF/PTAbq4/Lm0SdEKHDZcEeMVYKgvbK0ezBWrgj7C+Cnkip4To0wdcSvXNmQJ
	l+I7BkRr4oP5sVI8EBesAalIikvPfcHxLcRgSnLn9mBOksvE/oVHeiOsqe6fhohOIhVAOKVA+q6
	ZvMz4RGJgc+9v8X83SCmlgiM/dJ22zj95s6vxtCaOp+VUBYQUjfx9AsbsUHdk=
X-Received: by 2002:a05:600c:c177:b0:498:1595:be7b with SMTP id 5b1f17b1804b1-499821c5be9mr6759415e9.4.1786570260889;
        Wed, 12 Aug 2026 14:31:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49982165351sm6314125e9.10.2026.08.12.14.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:31:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v6 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Date: Wed, 12 Aug 2026 23:30:41 +0200
Message-ID: <20260812-axp318-regulator-v6-3-d6b84b55c000@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hsuv5cpXOmqMVqVOdS3Ga8YcCzGfBUQhLGlSYAfReNA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfOJ8dDhs1bfNHi0MQ0Ue7kcC2Hyl4pxxtcGNl
 ZVimVyhWlSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanzifAAKCRDm/A8cN/La
 hdRDEACKZWGPCosu2FYJsYRBrh/QnLeeS6tlhiGjbm/0wljxSeJqqaeA/Zj6PKxRmTsir0UwkiX
 ynGIan7e3xLw5jVx7s9CowpD1WfgMUXsjQDSm7vqspJPSNdOsgoIbQTqDvVk6eBqCa7sPgElAX6
 JweYM9T9S70qw9FsSEikWeogGvnqVVqX0XU6kcGLe/7zAtAgfC+9d3PwtFvyNnQv0vBOkXGhCDF
 BhtteNDXaWbFLr2BizXR+ACt3RDa27WSCc2gi7m0BlDUY1gfstso3BMS7MTS3iTbeQ6J4laNLcX
 7df2duGl3oKlqSyp2ECnah1cWJB4wBS3Nvpx+XgyXSssxxPONZRnrccih7mtMMCCo7mnNjXWTWQ
 jInxx8+b+OMY3F59ZUBVFqHQKSCh4R/4IVwpaDu+dTxRA6M28N9MjmTnP62MKdBt1XSq4lZ+iQr
 aeqlZBP4wlaIGOdrp9pXp+aR1/Afuo8BEgUCx3xMAbvX8SLyt1T34yRB1McwKcQx4IzSRHKs2Ma
 bVpTAu4fYP5ByLD0ee3qDvbjwHfypt01CEkPuvB20xWsT+5OcG5F2SY6tJKa4acJL+JfXrCLvV5
 Sze+mDXAOn29Z6zU2U/9NPKuf6FgTbF6NLsSs6su8ZjwPaNa+NncfhrKFgBhE8gyA/uYjnpSVLq gsuZtQ/bnVA+VSg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

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

