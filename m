Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0433E2745
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245922; cv=none; b=ddqlFil0rCYPvlHoPRIUrs3UoNEvA62mErcKqwn0YgfQGzrQuvwDfHhjse0Bm3Gj8jLIW6X1kyTuYxYBYJNGoHoypQ/t4cpEQ5LV/AwBK/0PBeeKtF2pvpVSe06GGsXngiHwKq418fOm2KpWZil9h+3DYA/jGtYu8kZfBB5YvxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245922; c=relaxed/simple;
	bh=2b0FDpYiUDHYTaTWt/ZYBFR8OZHcqRcI/kgwYOW2JAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klfvTgFaDGMAt8m+zT7QA+vTnRK/PlEbuzBM4ZNuupuB3qRtZxR24w1+XMSb2ZU6X01JgoaOzRvwZA+kx8ufPmi0fvHlzUojyWPWbasTRSXHS0h8F+zrO+vWClA4B2trvWLAab7q6aaF+zFZXHPMaEFSISflidB5qLbMubBQbQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDENpBpi; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDENpBpi"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso56844eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245919; x=1778850719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyBJrvlz7Sq+JJiQV9BBY6vFwOZpdmX7IWJeP3gm/zA=;
        b=PDENpBpi6Rc3GurEyP8ei0qRUWEADpLrXVavQi67r8gFi9JgJ63UUtPY7uuEBv2a0r
         aoCMG1CxeW3kZXDNWTn8yffGA9IaHfUo0P+UXAg3k+10MNRWQDuvOQLk1WX2B5FH603Z
         8+HLKXlc/PV7c7FW+G3L7Q7mZmq+evEuqFvakO5iu4XMxA1tvDtWNbR6AkbpMMC5koBM
         Z44Lqu7Y0kQNuN5uNvd+BqQB5Arfem7k3ArpSsGq/UwpBNORyaTm/zfFJHBlJ+kLmTme
         ndLc213LN2vuqV9UYwUkjsVrdajgeSEVn7umjK91iLtd7Ui96+5F6ixLJHqH42oRXlQw
         gz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245919; x=1778850719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PyBJrvlz7Sq+JJiQV9BBY6vFwOZpdmX7IWJeP3gm/zA=;
        b=OMb5bKUGG3zCjwinkakmdRhdWGMYA5hwUeukO6RSBLhYmVzRNHEBA6Xkg+QGvxICjI
         YTlmi95HWWCau1wio1RL9njHJVb6eyPp0ly6IlkeMSgjrDAc/SQpKX9TaZkC32QWpmb4
         ZyitBmErQ16kXRNYBVdBrD4fWLckSaw7Yjn8OBOiXBXqHYKg0SpOVwERSoMajvhH7vCJ
         6xXprlJCaGNf48UVZU6hOlakb+DXYmsVsyUVcAMOhhcM9YMrVz6vLqNespidJC6mWpBr
         UlvwI0GWvFWoOPPYgSTcI/IYV7OT9RiOq3WrcQcGwSgc3tJjpv2FOmZtlxe+aWZoKjX/
         ROqw==
X-Forwarded-Encrypted: i=1; AFNElJ9q8YEdbZVjSdKOqfzuYUYmPw6QpsjOU385HzQIt5CLjYgjHxsoGtAUWPD6CDySuB0kZsUWq+0UQbT5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn2QAGFgUmMGsu2YFoB2LxIsAUnrLNIQWBsc7vras5/AxkKHNR
	Q20FQLTQjxw/PO/Li4+p9+fLsMzOp5V8qG4R6+wR2OB3gpK858q9S7xY
X-Gm-Gg: Acq92OGWPtJjikQnQGCo5lDnEtfyv54ghazRaKMVfq+5seYAr4tEt9P6502ClihyxnL
	5OWEVM4IUO3+EjDMp+EGiZIafp2gjFv3+7gMROtyv0BxBmfseJbmCc8U6IlpPjqjEWxcebA+l3V
	B/vIw0rub35x/QwQiEBtS+lEc9Djz8LijUL2dpaVoQ/jU41uwaE9q6sRahzekN2VF251NvgPoiV
	UPgOkya+gXytraEOzRbmkKXlJzKcE+eodoHz5LDv6MUJ95nyYsq5hjymo+2g3ikU8SQ31WMStZs
	eEK2oTD0Lkz/hNHfhQ8eFMX1wJRLtzOBvzOSC3MaZfQZqDr1kyo/vBKCgtvOJXfVmZ+J6m/gDLS
	jq4Ok7T7Qg0IiVf6duodzvbtI5Z/0dFpR49ODfVQ88PpTkiONpBkFSp80hevSnh09oSeP2WU+m5
	99hTPQY72jEfoK1cfqbw==
X-Received: by 2002:a05:7300:7255:b0:2d4:aa5a:391c with SMTP id 5a478bee46e88-2f54869a41bmr6264814eec.12.1778245918854;
        Fri, 08 May 2026 06:11:58 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:11:58 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v5 2/5] dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
Date: Fri,  8 May 2026 21:11:36 +0800
Message-ID: <20260508131139.1523597-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
References: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/leds/issl,is31fl32xx.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index f4a6ef99b477..a8ed62fd2f35 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -21,6 +21,7 @@ description: |
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
 
 properties:
@@ -30,6 +31,7 @@ properties:
       - issi,is31fl3218
       - issi,is31fl3235
       - issi,is31fl3236
+      - issi,is31fl3236a
       - issi,is31fl3293
       - si-en,sn3216
       - si-en,sn3218
@@ -37,6 +39,12 @@ properties:
   reg:
     maxItems: 1
 
+  issi,22khz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
   "#address-cells":
     const: 1
 
@@ -60,6 +68,22 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - issi,is31fl3218
+              - issi,is31fl3235
+              - issi,is31fl3236
+              - issi,is31fl3293
+              - si-en,sn3216
+              - si-en,sn3218
+    then:
+      properties:
+        issi,22khz-pwm: false
+
   - if:
       properties:
         compatible:
-- 
2.53.0

