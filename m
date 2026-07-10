Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8328832571D
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700438; cv=none; b=Joiesa55SDPCYxum7iEpL/nJirUE8Xo/SloTf4GMngE57sMuYRBuRS1CoWFlpNXA/DCwEj17vNYYsiu/bHCjRFFfeUQh9vaKkRfTWCuzBMu+mcAetRRz3B2csiooTvnAu/7Z6rKZdJuegckEWEbgpCe9H6ZDh/kX5HTFhB/ibDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700438; c=relaxed/simple;
	bh=fKVVvIqEhOaY4890nYcR3KSeZ/1TQ8Q+JpLER3c6NSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWbbn99GA5Vmqt+dStwkedeBadKBoTUd0CigS0cglg9ajQtYm/3S+7Dx9XwMkZGEemul9FpnltSOwa3/SSTwd5DvmZL0ieSeL/JkaHwCkGiLKEKcn3WbZH0Bmz8uOxt9fwU9gV/OceuA6fLQHoHVO6RnF5g4jes/RrF5qYaA8aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cJ0vvkgL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cJ0vvkgL"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47df43bfb07so290232f8f.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783700431; x=1784305231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuE7YP+ugHKtet/YjLsJjWZRMasE72CKIRTYH+lVWVI=;
        b=cJ0vvkgLKRd9t2G2aGieayF4OIPUw1qCkR+4bo+6d63ltEWumRxLYrWcoZ0QjA6a6Z
         oslh2XI3yh8CZUwjX5/lVMZSrPcPBHc++gbZI+TlXFghGWeJSMcvJUw1W3tHXHUJaVeJ
         CqCKohyYz4FD1LpX0j278gVcRWp8/O3tNvJXlRRRta2GVFLPV1LmfPjLUzFJVhvUNH8c
         g05Q6Vc6dvSV2wWtRV6fEHcDUvpfWBkyvOgjMWsTgSk2N8JOo1y2Xz4MrPtN5/NxcbDD
         Ej9q/tsIJre2S3h01nmPuElAFoJWhHRZ/tUznN2gk1LleKskd8PRgtxbcSaOFnoxC4Ni
         926Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700431; x=1784305231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nuE7YP+ugHKtet/YjLsJjWZRMasE72CKIRTYH+lVWVI=;
        b=i7KelYVUP8i/JyuXKIEL5rFLu8uWU1n1k7WVdGbuDPOEXDCcESVheEK1RVcjaj5Nhd
         lMFnj6DVo5mKM1yz7dWqSqMHczhPMU0Q3y9Bap4l4yMk4cftLqkM0silrSlxX1sfP6Vn
         LiMrvz2rzfudw3mUZDikmWjoiWMgSF8VitVWqhhkNAvscGQ7sQ6XwhkwiFtBIKlboLTV
         yrujoYvnYuR6ip03WkryQsQ1GXVniWB8DYqxqQ8nh0f182eNyq7rCcb3PO92pKaUENji
         p99FWOw6tzjPeyQMioj13Hdfj28m3WB77t5wr32fBFHvfrMO0T0EnQhjVnNX2nWxOkSE
         0Y7Q==
X-Gm-Message-State: AOJu0Yybe20yjYVlLLR/9EcQX9OTVAYakGLZ0QXJMddsXfNmCFVwHqPT
	PAI69dPY5fleskz6bvlurN61GEkFRmMaCYAktWiUVrrQgGhuGmwPZScuCW2OK/90Tm0=
X-Gm-Gg: AfdE7ckGBka/jASftYwg+h93CPYE0/ALc5EObje7HvqEtax1ccvperdEzv2l/Lf0+tt
	5EE0KlINwkmGt87MLX8FXYBp/aCPQgpiq2D25Do6IYU/maEb3YCFScqnux25NDKV3kWufNebS8P
	Gw1mZaqOnW1UGhlvHQ4X1eEaHnjWUHxEdz4bnS8E5EIgVV/NBmNKQ1Pri1kn8ERTqHY7/x6iNHw
	JTuw4SHMzsAjBphx6qYKRZo/H3I8AZUVNZwsatNRsGBnUAo019GjHHPNkuk9OWtRspxfopMbwsa
	cPqgd1a6ScyVb63TyxzF9lnyu9pvTxI3ifJTWLkjS7WrfwLcDdpluhK5/KyKOPF1pDEg1WHIohn
	kEMTV7Sy3EMY6hn5jBpV+bJz1bP/C9eDLOv3Xg6K1UBTG0G79oNpABSy0TxAVqCckl+2XEkpREJ
	k0G8mGYbCv/9U=
X-Received: by 2002:a05:6000:455c:b0:47e:96f6:6dd3 with SMTP id ffacd0b85a97d-47e96f6714amr3807495f8f.17.1783700431519;
        Fri, 10 Jul 2026 09:20:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5e43:31e8:5645:d4e0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f214d2sm59995779f8f.33.2026.07.10.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:20:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 10 Jul 2026 18:19:25 +0200
Subject: [PATCH v2 1/3] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-axp318-regulator-v2-1-ee5f1c56b49f@baylibre.com>
References: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
In-Reply-To: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=wv1nTWnn872ufIVhbI4UCIkelK8ryXZIIeZU5j5xa5o=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqURvCPvWDmUocb0ozN84vyqLMjXQYhmrK2kmUy
 D7f8VzY2L+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalEbwgAKCRDm/A8cN/La
 hX0wEACj3voA56xlqeu69E5GM33lAnjk0PaJCDliBPz1qMBlAU6quyg86muFinkqx3q8a+rE4rU
 HLpNsYCnYJQ+jU/2CW6z8od1yW42Py8FJYD7kIsPzZKyRQuUGvLZCb/q+YfqJrsfvorNwLS5PlB
 6S3mwWtTJ3g+krMeAmlRCDCZCaYJwKAbynXzA3MQ+R+RHbqhIBvE9U52U9xCelBe7C1tZMbQT66
 eZqrrVQY7zpciKh0mQTCZ384xt+JFwHhZ9t/oX1wtDk2aKG1LS/aVYGBeC5+F1WB5XZEfMpneUY
 rIVajX+vj72QnVydhL7lpqr9632l7plbH+fBSpAJ7ORTCYR4B90YyMuNQPagt86olP4hkJ0OeEu
 qIlFIfztopLk2IrhPtN/GeAaB5Gq0woACs/hOAELSIog4MPzeBglw+l0v6s1yxkF1Njdtk2nVIX
 oCbVKu4r30tRNntPA8FPDMGGPv795kR4mUKpGojQy/SxfcMbm3/Xh6OXSZ2ufg3vhlQ4WTXZ0W3
 RB72WcG6Sg4u7e4qpzzzSd4lIMFe3sO8jnJLMAhTjgmm+kc6XJeGD599laRKylNi5a90vUNeaZX
 QzoPBc3bhD1vEMSHpGJ3VGmDnbmLbzwsI0HywNL/Cz4Tzz/MIQKj9KMsyyntqlHRrvIZA7EbRc6
 OkaMM65F5eqHDbg==
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
index 45f015d63df1..1bed19fc91ec 100644
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
+      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-9]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
         $ref: /schemas/regulator/regulator.yaml#
         type: object
         unevaluatedProperties: false

-- 
2.47.3

