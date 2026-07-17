Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0223D5C1E
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277906; cv=none; b=ErZ7gWt1ynfC5Er1PGl7vNz/0puyB2yDjQpQ7LxsRydxYODEjdhTE3JvOW5mpd7L+OvsHev4BZrjO6pfsSAdk42BpCcUce4ssZ+uw/WjXl+KirNIuxkyY7aaJQeEWpU+SFZ/QGEX4LetR7RKoQ7YMI0JqnMdYBhc2Gb46J7YEyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277906; c=relaxed/simple;
	bh=LxL3P7ZDDGnSBlu/ddOmtGsoPccExZSdj2/X5iSlPsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YPWfYSrSa/R2x6501OlVXxt50b9Zj2/xqMc6lBPPUXYMoeH+p5Um2Jnc6al7+X0Ih4/JUSmUeK9Td1EY2gZbQpJSftTHnsa26GrS6Gnfz7oLmkiAjPsYITiKqCFsmJlvKWsMDvRKrfwM5E2xEIkdHVD2Dw0mo4kEguOS+e4E9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OUjg7WPY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OUjg7WPY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so27583355e9.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784277902; x=1784882702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQrvCLaskKYjL8vcT0t1hmEL3tKSyDUY1GNsxXEl0Is=;
        b=OUjg7WPYNlsVS4dph12xUjUsktKwUOsd5xy4zzOjxsvuAs/qQPxAE/gjwmgpogpAi0
         glTzg0TX9Fjk5+JmGW+GrCRjrViMvDeXGilMJuypNLbgltFmLD/ZIealW4D4IUi7KRnA
         6K0Zu3ArM6ORjpBlcE9b8MNIAe0XPMgdQYkdM/E0ZLoMF7jYo9Jql00CDxr2FK5X0/ZL
         fcqkaU3ciPlTuOlZAOQJ4KQUNZ+61k9gMpxB5mYmGJEzam5/G4JEwcyzencyNkefQIpj
         7uJDKD/tACcy7Avc84y7fGXaWYLt9qxCjaXYDfArvZ4x9SiEICSugqM4rEmZnj2DPrvH
         poXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277902; x=1784882702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQrvCLaskKYjL8vcT0t1hmEL3tKSyDUY1GNsxXEl0Is=;
        b=h/uxtJAqqDesdP21GgRw5/q3ceZNlDmciy7vZVq1+zXCT30uYq9JcgTwIhLDjrelgv
         mzmDxu0dgcrMQILgghL01JwCZRqDRyQcO7n+zzJuqlXq+fOeRflRVu2sSH/TvvPcgj8T
         ZlYS16TNg+k14I7bpZvurn0WmF6DPSbI1diNlGuQsl3cjg5fY8Qs8pJ6GlqgO9RxdADX
         09qsLMDnuIhSe9O6ldwVcXlNVuA88BHgZQsbiL8aGXv27m2X1gL3MnEkUyZpHF4Mu9FQ
         0yW8+JSA8UbcfWjUOoM0dRkuejonjxuAEyB6alpysPj9n2m/DthlMk51NQeHlTnsz295
         WP8w==
X-Gm-Message-State: AOJu0YyXsaBtK5/i5p1Ip8BJ4aOiOlVKyoTzPpdF94Qrx20IFDhEJFGW
	O15ELY7RXY6BrsP3oGTb32Q3dWZ7EZYeq3kjuCI79KIiZevZkpy3fq7iHdGLtjxEKHg=
X-Gm-Gg: AfdE7cnw48TEjZRa+t+sO+gshuA+bsBXJXT2abUaLCSAC3RlGijL2F4t8Uf/er/QJbK
	HNEgiFqgoZaHRjroVjgYcBnt2Sy9OMOOMPPXGTss3LK43w4atGX2HVjI56QNAq2Ds9Td+KCNCG5
	Rnfp7GyiYy2q3IYFmHvCNiH32xgLDS070EUWnbRpSeXITzjQm6xe4thxjbfnoUz2mIg+7/pIrMK
	GwEqIgWnOuMW7mEI9nDw9gajkuN9eFhn1DcAlPAujJNezPT+FKAl9ipX76R+ozxIEY60HvbpjTa
	W7z8PrI0n4tWg6m4N+ifIpr4QJyWgGFe4ZDfzkin29r+YzAL1iYS11Zn0tNtZaepqUO/zWVBtg+
	jGXaof2sHkMfmz5ir8Fst6lLSBKC/Cga6K3DsgDUvcxqKYaTOZVReboJMGO56FafB0cYZkC0ia3
	A+
X-Received: by 2002:a05:600c:1c0b:b0:495:46dd:e238 with SMTP id 5b1f17b1804b1-4954a50ea30mr20255325e9.30.1784277902251;
        Fri, 17 Jul 2026 01:45:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49548e075d4sm28741535e9.1.2026.07.17.01.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:45:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 10:44:29 +0200
Subject: [PATCH v3 1/4] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-axp318-regulator-v3-1-779dc1b97dd4@baylibre.com>
References: <20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com>
In-Reply-To: <20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWeuFuBCui3i7dYpKcArfNZ/VQyYLRCCETqaxw
 V8iTAkuz4GJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalnrhQAKCRDm/A8cN/La
 hV7cEAC0uoG2kDq8GOg7nN5xHReRro4C5xLKRb4iVbzjdGVqfYwnudi0UIG+RsxAjh5SuwOBugd
 VSDF13m5j1NLvj2BeX7lWHZfnMZbPhruIHwdAV4AcYmAoadoZZF5SO3/8x9ZYM6ykciri7BL8zq
 VFdCKKIirHlzJqMAS9jk6cOvabR7e6a2FHre17pooRHOLBXUWswdB2nVpSaDNSgSIIb9cnTKld1
 +wQxTTNUxu+GI6Jo10qYtvT/jvoqBxsNRX6xJJk3DgT2CGkywr0Kt6TxPWmhcCCqyL6lataGqp5
 QNp2AKtmQuji/HMginaGcpn5qwjOMPKCjRum1++6h4JQ3l/Uq+Fs9KLwP+pSuyEaK+NrW8zwz3r
 ywtENh4ApUsX8mduSfukyYuzQeUagIgaRX4ni+V1cFc9RgazYO4jrCgK59jp66p/kYIocJixmIX
 rMMsLWmCC+Ri3Lv+tSTEsiihL+g9ye56GVnwqm/k6B+MfINchNfuwXd9wIaVegWZg6k7U7u/+Ay
 +SC4V90iReAwMJu8p+tBfZ9NHhch3w6slXXA4Yc2AK2Da13X9G+rxS2gDw2uCaiRm7hBE7x43fX
 /yWRSz4/5lbObUvP5uCKgHR2MR5owYS69WTWCIj8uz9QFDQNHc55HAMXo9k1TnD/S7wdeqD3gMV
 00ZL3vuVwmiPGJA==
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

