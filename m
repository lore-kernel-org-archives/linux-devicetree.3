Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0ED3E316B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285446; cv=none; b=gjJdfKRKizzR9LBKmR9SANHC6gERiCeefaYK8tAsyx5XgMnPV7o+uKbCrQ3Op7po0lx3RXdmZjWEwyRPoX89Xp4EYt5lLIOzRlR1QwaIDbbo93Ne8wb31xVD2oRTOuv2niV/wQW/y8aiVMdySUJvCOV1nItIRAAQki6uOqr1sR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285446; c=relaxed/simple;
	bh=tqRyoaZBs1tvjQrY9z9TFd/uxGf92frpQLPL1VyfqU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hc9f64vHXAI+Y4vaFNRR50nGFj8MT3HBaGVYciJDYnqFdjTnxcm3S32a418WpL2JJ8DIH18TvIFRmObF76R6Tq/2WTcMZ5/gltcE/O9dXyCeJGVh62GPl9z/JkvfZ3WUVvNi7subi+PWrZvN3tzOJ1TPTN+FChYn35jItShv9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SladTUN0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SladTUN0"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso2455118a91.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285444; x=1779890244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qC2QIpvU6HmG8jsTK89YMedFfyyJiHf9gc9ctAYYQYk=;
        b=SladTUN00vINPTNw6MvpbYPZMDYwpUJRCTSqi2BO44+cHwZi+vPOw7lavX1u1JNVsY
         aiOLksRhl0sohbHxbI9IKFYfyc9dvQ+qc/nzFbm0gj3/dKEF35FL0b6z1QgTcJnasgIW
         q16V2DSgfK84eMQUC8eYNDZERdIj1R3rE1wqNWqc32HOT9iS1J17FLMNd+WNoElHamNX
         sUgP2qNNw7W1dv9k5mpuPbbHMDEVD3TGjsf4FTdEMLtb04nfPBGvMAVb5oTPRg1ert/I
         y4+OqAsCNQ1bxASMsgxqUy3R4KqJnsU8S8l1uBMSAmwRsQCyvdvAxpX9wVeJE3g8bnxY
         GgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285444; x=1779890244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qC2QIpvU6HmG8jsTK89YMedFfyyJiHf9gc9ctAYYQYk=;
        b=RIv/CBD+z9n5wT1ViJ4QwCtXQFUpaOUfY2/AgvV5Zvhu7oig9aYQy3mYHrzEc//ZPC
         9adMNr+QLnkd+jGUnBJkQIya7CRnU3V3+Be2O3IJMoZBQpAFEn0giM0E0w7BGiH3I97L
         O8wsn796gMmQWXLbXU8jM0tarU/TTJIlGK3UDqd1VQRhy4JpaUTfTk2FIhDdBPA/FoKW
         7xTXgBzzbCpf4S/1HCjx4brT1tZwh2IoyvuNd8MKuIwtECjrTs2ftEpVKMzL9+Z0Ibpn
         B7sUXrlW/Ix5NOt7kNS+iG1QPL0f7IM4f2KApv6hKX/YnmlXjBj9UWf3xW3tTIXbKUQp
         3VsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8R2IhlW/a5+mdmsGy6BxIgDSwMadrj85LytvzydJul30j46Xv+OuLnNFvrU4sLC0S0yu2Mpfq5NxiP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk7SudmGO4vdkav/wqr+Zcvbx8sUYhJ4Qe3tCVih5vB7Fn744r
	YIMwFRLmQOzzqIJkh5q6Ag276JWrUnXAB04KG8Zl/7DZy+w0BHhbLrMF
X-Gm-Gg: Acq92OEP/0h4hMfjxgu5gpWZ+vqOb6srkWlrqYExl5NGB+3hnlrgmeHk5ryKFllTMRe
	qfWtlKYlPwZEnH8HBIGudpEPkD/SA6qNd6hBRuWrH9QPQdJtTVzCtFfPYOVth8LlXcfAkeVIYD8
	ywWKmp5UX/FS4GyXB7lKNYT/8/GG9NUBdjZayf9RLTrzN+5SldvwOxpc4Pillw72iIcaf6ZdqU7
	RQdy46l52F3C3k8Sbdvwp36oWIQ38vR4CSK1+Lr97lQstyHLNiNTRhm+62BO8XSlGqTNfuxmxLU
	vouIm8sfZb2vbsoHW/vUEZh11KsJaRfJu7rO0cKyfnJrTRXae//eomyaK2R2ZGyVkvQxSxP84OQ
	HiesEJEUAkDLO0Iiba029/BPvoC8k6lsMEdYJ0yHfDstGYSlcBIzZVakcx0UvMIjSjuoI2a6Qjy
	Ll3nINTZ3fn3GRfQyU+U7CbmB5zOf7z0zJNI/0QLU=
X-Received: by 2002:a17:90b:3c10:b0:369:a359:b189 with SMTP id 98e67ed59e1d1-369a35a15a7mr15900466a91.19.1779285444332;
        Wed, 20 May 2026 06:57:24 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:23 -0700 (PDT)
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
Subject: [PATCH v7 2/6] dt-bindings: leds: issi,is31fl32xx: add support for is31fl3236a
Date: Wed, 20 May 2026 21:56:55 +0800
Message-ID: <20260520135659.1430008-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
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
 .../bindings/leds/issi,is31fl32xx.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
index 81f1e30e493d..5f22d8b77edd 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
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
2.54.0

