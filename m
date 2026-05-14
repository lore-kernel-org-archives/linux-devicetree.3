Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218CE3976A7
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750146; cv=none; b=Ctd7Cl6EGfnsLkpSbl2bGssyOj9u4VEsPI1X12MZtO/tDiITEI7CFtS7WKxwS68FtfR1zUPXREQya+NkPtmTpZbyphvWrb4jdV/Dkxt1rB7Fcr6bFf/PzDlpH15QCAq0JrYJ5SQSyME1sOsba7PEm2dlzS42wK5S+T5YbFnilGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750146; c=relaxed/simple;
	bh=DTBnL4HwzAOAZljqEvrv9l+D8Hwv11mmN9XRGb8ULTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bq4KU/e1mt785iBGULywlaR7cjOCBd9jFQMmZkHQN6hIMEmyxlMplNURcRNE0uYLTZNC1vT45PhqYeJmVX2uOk0tS4V49pvNokc7dWneyeVmGSlSxh8loMJK5yr/aBV3XgJcjKn7WqY5/Z2VaP79UyhtIdc8arbpTaUJNrKSRtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BnurhN8+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BnurhN8+"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c828daf83e2so2253572a12.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750144; x=1779354944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKKjqJ4FNen/2IxMjocGJwSBRhkQlcYeBL/RLTZpyhY=;
        b=BnurhN8+YLAl4Tp44bL/lhQGy7Kh+Yz+2QwTqjaOhfQgIMNYnLm8A7EwAJcbbNQgV+
         Es5MMcj128P0+B3enHe9T+ObnsXizT8HdBBbaHw8/sUUZ95BOYrOPXAejcX41FD/5plI
         ZPHZo9gZiAlevAtNkuJwrl7ZLZFEQj3aejOu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750144; x=1779354944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PKKjqJ4FNen/2IxMjocGJwSBRhkQlcYeBL/RLTZpyhY=;
        b=l16spjmWqsj9TjnUg1HfhXGOn490avUrlAC4xV3AQA+r3dB2A1BZgj6AWKFhyINR3c
         qruo8TsPr7E7afvN4Gny9pNHbDWbmXHRMO0a9fDrIH8gRLNd6coVyCXwXXwaytqkJ2ku
         a7owFOFjpkSlZywnI4n32lYssQ+DYAgVtmT1gZoC4DA2eABiYdmqMw5pFjf2v2vWciQG
         9tEImSpsFeoM6PjTJMPsaarfCX5DHTOgGQqylYr6Zed5xKtB4yfTHt4yK/KKrOK7kIrw
         dcZCKIPSHrgY+giThKl6BwT8vi29m9rbgXZZWyQym3XV1QaeYZ1iP9C77SI50B3jVuT5
         3q6w==
X-Forwarded-Encrypted: i=1; AFNElJ8uafI5lQcJiWloW/lhI8H5X1TWOfNkywGwgFDikYaGHchc8W5yvEbltIJ+PX5uxzlrUE3u0RAfH7nZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx400hkwmzA8Etprcpiu14B08yUUnlx7qtvLh3qBpHvDWn/WckU
	At5n1fU383U7mnImn0q+pTMNENku0LyUzao/4irDDe9LmIVqZbMQqEV5VkdmeWHceQ==
X-Gm-Gg: Acq92OE5ligWJsIQiwYUDkJht8o8f97TQO2MUJ/A++k06Lw+/Aophsv/kd5+IBkYvRL
	h2UnJeXu6Owk3PXPrXOh6f5C3dpphrlrGGlASnZNUxV7knLJQZSoNuspPZ7hhrweWREnJzy0v8A
	MFhLTIZvYsBDIZrRT1yYbRqqCiWTLlA6Qc4sKubUK4StFPHKui31SGUMYzwx+gvafmyV2B/+dti
	FWJDlkgV9Y4IkSmfcMB5n+14UHeXbV2dE+xEXNnzPmaS5tArVCa6Pi1+heIZRoRu69Q5FSB6FCX
	oI1GDcxdlPM7e+ENGDIsNt+kt2JMuy4GSpetE4Vyp1EcBZrx/2gS15oLLdHOihCix8Weyl9KBVd
	OV0vCZS0Z66+YA06DmUHDVQiabntwMD50O0NjvvOjem/olhVgESxjW2gkaU8kgiiRsMf7RYCkBJ
	gpRIFV8w7wNeflMq4uv5qVW6r3w1S98VjV4Ej2//KxiM2eNotYHghTqPGzFD28fwSyCNadl4sKP
	d/GD0+PjS8FEe7sC+A=
X-Received: by 2002:a05:6a20:6a26:b0:39c:4b84:d90f with SMTP id adf61e73a8af0-3afaea365e8mr7445174637.8.1778750144405;
        Thu, 14 May 2026 02:15:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
Date: Thu, 14 May 2026 17:15:16 +0800
Message-ID: <20260514091520.2718987-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Deprecate the existing regulators, and add proper regulators matching
the outputs: vcn33_1 and vcn33_2.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v3:
- Added ending match to regex for deprecated vcn33_[12]_(bt|wifi) (Sashiko)
- Updated example to use proper vcn33_[12] nodes (Sashiko)
---
 .../bindings/regulator/mt6359-regulator.yaml  | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index ac925334ae83..e3c20412c8a7 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -30,7 +30,7 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+  "^ldo_vcn(18|13|33_[12])$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -55,6 +55,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
+  "^ldo_vcn33_[12]_(bt|wifi)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      vcn33_[12]_(bt|wifi) are incorrect representations.
+      Use vcn33_[12] instead.
+    deprecated: true
+    unevaluatedProperties: false
+
 additionalProperties: false
 
 examples:
@@ -203,13 +212,8 @@ examples:
           regulator-min-microvolt = <900000>;
           regulator-max-microvolt = <1300000>;
         };
-        mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
-          regulator-name = "vcn33_1_bt";
-          regulator-min-microvolt = <2800000>;
-          regulator-max-microvolt = <3500000>;
-        };
-        mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
-          regulator-name = "vcn33_1_wifi";
+        mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1 {
+          regulator-name = "vcn33_1";
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <3500000>;
         };
@@ -270,13 +274,8 @@ examples:
           regulator-min-microvolt = <2500000>;
           regulator-max-microvolt = <3300000>;
         };
-        mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
-          regulator-name = "vcn33_2_bt";
-          regulator-min-microvolt = <2800000>;
-          regulator-max-microvolt = <3500000>;
-        };
-        mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
-          regulator-name = "vcn33_2_wifi";
+        mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2 {
+          regulator-name = "vcn33_2";
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <3500000>;
         };
-- 
2.54.0.563.g4f69b47b94-goog

