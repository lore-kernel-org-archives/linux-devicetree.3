Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DF437BE74
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 21:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779659791; cv=none; b=SrWkW02ZO/Ovv26c4ecuU7Tc9iHrAbW2YZpwn7nzRPg5SW7qy4fnOgUZ5x2bLLI9Picd2P7wlxYSYRlfmoaINvXmrj0MqBGigIkf0efkuV9kg9puRmZq+AWEDNrXG7lZWPV7pAOTFbQrXm3rOyBLSqMQwLK4/swO13Wc3Rvzr2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779659791; c=relaxed/simple;
	bh=hQjSMM6t3sxCSqcmkJ81Zbjq0q2FxI3vCZeoMcJ9WpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3S42HSRSs/0jo/n5OynQ8M+wAU0hoqvMJuup+NVfM3kZ5W5ZpJVkiwAGgIrbRKKD1HX05YWKr07molqAkp2djC2zi+xky3PqXPzA59nvmCFYss2jtLqkJ8dw0H8qJ4J5pp3aH/87gghxwiA9Mjih8kZC2xAbrQXWHvGTWlCwTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meATpwqD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meATpwqD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49068493267so278275e9.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 14:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779659787; x=1780264587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHBYjKJssuWT+wJ7wjpQGIvdSHQM3QcFtzdTivvLnQo=;
        b=meATpwqDYRigVI/wz+1HVTInVg0zcOW0aLT/EhhuNC8LlLezx2P0ULYvDWycSDhQ2L
         0ppuPDBwiC7kY04A06FDVWTMw9vGv2JQsg5a6FvgzlVhhbUKTEP3RzuBrXhLbqfTFCSX
         zIR1vtLZc0VuLCKUVxCq8hIQyMvhmA4yA87UJEX+uEQwMDEq1qOFXzEhdZGt7RGrsibk
         Q5f/z/sxQGMO65L5dqMBA2dGPUTYKJyRb5iFQmYyPvUCez7a7+Orh41aDUdGHtZnw9Vu
         BNVfboeOe/vqwI1Vj84pHD3YOlr5iU16kxweQxrq9neKJ0+HQNy6htHCmD5sh7T072bY
         WzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779659787; x=1780264587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHBYjKJssuWT+wJ7wjpQGIvdSHQM3QcFtzdTivvLnQo=;
        b=mn02lJL124o/zZCplm8k9f182ck4y3s75+2KJY7bgx+dWHLi9sHnllH0VSEmgsQHZf
         FXV0G8N2jlfcN1jK8PQqZjWJGIropyfeb8dCaLd1ZXGl3lr/F39J7yX4bkij4FzatJNC
         Fnmn4jX7qws4VVdFVlKeVJGbGiRfdJlC7LLA8NHq0L+IlLx+poEsS2T0AY0gArYQ08Jq
         zSBWmwyiT36QoTD+NOvMRVQifclpbKzJauWBDSQyvjOl0FYbvELmAJHvBSUs1Az17guX
         kIw/yrY0n9T6j9T40rqwXpedoGxzOFSeAPAIG89agC0EVBby7rJzvf/T84BZcK++T3ZD
         dZnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QsUJBs++PVAGR6ch/lw9auHURABfkNYVZsyDx8KoFBH0ayu3r6Ue1Gb+dweur+C73W+oTxwEtLNwP@vger.kernel.org
X-Gm-Message-State: AOJu0YylMBdQ154vCVu23NboVryrK8A7PiFEfzyFT5B4KyC/IMMaizHb
	I12iQXVKYfdXQ6Oomt3JMb7q93HGWbvAHKz3GpGDWoJ0IF+pxmTaa52B
X-Gm-Gg: Acq92OEuf+iQR0JOFBlgoVK5i1KiOvoIRM/pphu97YTAbuJsvXEqWCAzkftnW+vg4By
	1OqgQZeLNgxtyxomxdWp9c60Ta3RcKKuPAbnpSZgBtjULQBfFUo/wnyeQkNvbKmO9Tb8fWmW5tJ
	Muk3O2oviBDhsR3H/nK9LpNDyFjcvamt6A3phCS7dbljuvy8IfqW9olNslFTbqJX9l1Lau4trGW
	KzVRUWn8FQ1AfSQgMuKY0UZUgVsfSUe+UM+c8u2OY5hhi0I0cAA1REr5GP1wOhOggfKghAKQLtK
	0Jinb5BFerjANFX58RRPMifUAwSZI9xuEDRL7u8DdeS8Ea2FEO2qSRMkV4U+1++KcFIJ1yrx59V
	B0ZLdpNWcgqTNHAFpofcp3PWUBhX4vYU4R2DUyN2aqXwQRDUcn3FePXJnq2uWTT/v5Z9JQCCut5
	KfklOShgX0QP27dMW+P/Vsy+rIi4AHp8WZfsVy8ja/rkO2UD9j7As+BolyxKr/sjWY+So80A==
X-Received: by 2002:a05:600c:8285:b0:490:601f:d766 with SMTP id 5b1f17b1804b1-490601fd959mr55022715e9.1.1779659787017;
        Sun, 24 May 2026 14:56:27 -0700 (PDT)
Received: from [127.0.1.1] (213-225-2-150.nat.highway.a1.net. [213.225.2.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527f7f7sm300779285e9.7.2026.05.24.14.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 14:56:26 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 24 May 2026 23:53:55 +0200
Subject: [PATCH v3 1/4] dt-bindings: iio: light: veml6030: add veml6031x00
 ALS series
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-veml6031x00-v3-1-29165609b2b5@gmail.com>
References: <20260524-veml6031x00-v3-0-29165609b2b5@gmail.com>
In-Reply-To: <20260524-veml6031x00-v3-0-29165609b2b5@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779659783; l=3324;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=hQjSMM6t3sxCSqcmkJ81Zbjq0q2FxI3vCZeoMcJ9WpE=;
 b=uoheIXCm+3JGFAkvAyPTibOgSRYFB14l14N4pavWltkao6dcg+I5L6vpSOMV4gr0eTAbLxusD
 Y4AFxMMaZGECL4h20heu4GRDQ0WFyO/jdzU2vZXxVr8xH+cG1K4iBws
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

These ambient light sensors share their properties with the ones
from the same manufacturer that are supported by this bindings.

Note that only two datasheets are provided as every one of them covers
two devices (veml6031x00/veml60311x00 and veml6031x01/veml60311x01).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../bindings/iio/light/vishay,veml6030.yaml        | 23 +++++++++++++++++++++-
 MAINTAINERS                                        |  5 +++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
index 4ea69f1fdd63..e01e8747e47c 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
@@ -4,7 +4,9 @@
 $id: http://devicetree.org/schemas/iio/light/vishay,veml6030.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: VEML3235, VEML6030, VEML6035 and VEML7700 Ambient Light Sensors (ALS)
+title:
+  VEML3235, VEML6030, VEML6031x00 series, VEML6035 and VEML7700 Ambient
+  Light Sensors (ALS)
 
 maintainers:
   - Rishi Gupta <gupt21@gmail.com>
@@ -22,12 +24,18 @@ description: |
   Specifications about the sensors can be found at:
     https://www.vishay.com/docs/80131/veml3235.pdf
     https://www.vishay.com/docs/84366/veml6030.pdf
+    https://www.vishay.com/docs/80007/veml6031x00.pdf
+    https://www.vishay.com/docs/80008/veml6031x01.pdf
     https://www.vishay.com/docs/84889/veml6035.pdf
     https://www.vishay.com/docs/84286/veml7700.pdf
 
 properties:
   compatible:
     enum:
+      - vishay,veml6031x00
+      - vishay,veml6031x01
+      - vishay,veml60311x00
+      - vishay,veml60311x01
       - vishay,veml3235
       - vishay,veml6030
       - vishay,veml6035
@@ -67,6 +75,8 @@ allOf:
       properties:
         compatible:
           enum:
+            - vishay,veml6031x00
+            - vishay,veml6031x01
             - vishay,veml6035
     then:
       properties:
@@ -79,12 +89,23 @@ allOf:
         compatible:
           enum:
             - vishay,veml3235
+            - vishay,veml60311x00
+            - vishay,veml60311x01
             - vishay,veml7700
     then:
       properties:
         reg:
           enum:
             - 0x10
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - vishay,veml3235
+            - vishay,veml7700
+    then:
+      properties:
         interrupts: false
 
 additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..94a23bac568d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28381,6 +28381,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/vishay,veml6046x00.yaml
 F:	drivers/iio/light/veml6046x00.c
 
+VISHAY VEML6031X00 AMBIENT LIGHT SENSOR DRIVER
+M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
+
 VISHAY VEML6075 UVA AND UVB LIGHT SENSOR DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 S:	Maintained

-- 
2.43.0

