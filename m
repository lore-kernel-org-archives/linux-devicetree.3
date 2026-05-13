Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECB3385D9D
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778647835; cv=none; b=GVqbYSO26kDZsl9VYxk5L+b24mjTud6uKCD5xTeUyJF3BNWqJfafjwoKeZlDptCTP8GsMjZGhcNGFBqluWrmxwMzmjOhwLEKjrsjJxokgy2q938vBBdMXhi8KwP+nWNWm+voAkiKSheML1Bx26FxadrsXE6Tn4vhoe/owdlku70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778647835; c=relaxed/simple;
	bh=+ccVjW/jqDGXe+Kpx9slzAPr+lCSpT3yVLJ5GehwNBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=te0Wh7g1YeCSfnP6s1aD7J4eJdLxWTnHPb/T8NtlmGkvEVrQQgLmx6MnEMXO9OIr+DRBlK+op94yhi1Xf5kLy7O8AiXDXblKyrG14vfzCEfHQTolC2QgrWUBKtbyuatlXYhv2fLL46MqKhLA6RC82wkKJ+mtiqz95GF20zeE9Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzEb02HB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzEb02HB"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so3278838b3a.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 21:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778647833; x=1779252633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AkLS3ikcXWyd0nEsg1ckmOLpbRPjWnuu6CMO4iUAjs=;
        b=MzEb02HBErtYTHwwwDgjQSY/If1qJdS8SuLjpr2Qs8q6V2hL/gtbmp/SVnWDYDUS2h
         uBq+nVKkJn64BTyIAP8v56MzwfQS1WsELH8sfaU/055Y6Rshn4xWbETm/4IUKyOiGITo
         JGOJA605uReDyeRbZ/eNboBLVr7hNGhZ9oF4m3NAkqjh4PxyQ6jg4wtWRAM6WDnteY9N
         QH9OArrm1Mnnuqeo2MSa1ALMS4jBvtsIlaWzZb07WhqZIzs1fX7+ODHL+t2Kh0vqWB1D
         IYOlKo27OcwWm/lHfaHHZIq0Etm7nwgDZILGKJg2P6fSH1UhF3EcL5v8n6fpQAZxXYkp
         g0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778647833; x=1779252633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+AkLS3ikcXWyd0nEsg1ckmOLpbRPjWnuu6CMO4iUAjs=;
        b=PhKAWWi/gwp3W4gKTkHY89vtiBUFhH4uTTo3mazYiXtmgqQbhtxvJoabyvfw0Nv1D6
         vfU1YBIIS+bSJj0AISNxc3n0k2dFShd4uCJ9WD3Tho85ZTf5HWnSsF/ClXeUX6zoFb64
         hS17d6/cRAvx1OxDjRvPS0frwwUrwXHTSJMF0slmDK82FYKCKhnqfsMS4wFURWHJ0M/G
         B5N+Rzn0ujmfkGPi1Gd/OtPewZSYLgLIPDiXlCQGEhcyndTC/ZEAv0PnUuTqQJ8Zmjey
         MaiRveESgT9LWa8U/MxhDRPBTx6AmFAowOGtwm9N+SOeOCAByMuhF5G2UlDYFzWXXi8o
         tAwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lAimnVmrCPVW0HIeJAygR8n2aZpSASBm8+VQQfFtYkdVIbcbyXpaLIeFjaD6TND/VgIrCCx+Y1BRf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7VJTJzSk15il2zDBZAb6uAkkPkcwYVr/CWo0EBu3aZZgEQiR
	RS0f8xZ9+LurRmpjWf5MnmSN2zxI4V8BNDVCrVJjEF65n0zJ5tKJJWMg
X-Gm-Gg: Acq92OHydKrU9YElk9jZBx/fy+wfV0nvbX8WpZQs9gKOs9y2RJrsY3LFBgMWwRv9QPj
	GZm1GzvYyziuBNkpIKe+mrxVa8HqC3Np8JzuMuY3ifQH0GEUbabjpXUmFepe60MNRYkEmcYMLkY
	Dj9AlbVyprzP8/Wat9SzZkIQZiVbgLOdhTHZbMAP70/1q+S2cxDknYEJhr1ozBRt+xA7Gtss7Fc
	TZdGELvAxr3Jl6yTEk4xgpLqMMi4PCGKM0Idmo9ZsrMFABm1WycWZQ5C2wSK+CAeZM1qhNi8KOo
	Xsots++Nc/DxQbNfVIpt5jtKTN66P09jiMmZ9d4B2+JABrRGNaTF+1I4CwW8GXMQJYGeUBZgAIa
	8U7YTxicTjI96yy4EqhOgRhjygyHHt3UaGnHCu0hOy2Xndlg7OPhtQVtvSJJ3oj2oZtl3yHyu15
	p/tWmyFi5yA+OiLygu0rpl8zFVIKronLsgZVUM
X-Received: by 2002:a05:6a00:2e85:b0:82f:7762:3eb2 with SMTP id d2e1a72fcca58-83ee83ab8d8mr6611338b3a.17.1778647832891;
        Tue, 12 May 2026 21:50:32 -0700 (PDT)
Received: from [127.0.1.1] ([203.99.159.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm32311914b3a.21.2026.05.12.21.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 21:50:32 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 13 May 2026 17:49:43 +1300
Subject: [PATCH v2 3/4] dt-bindings: iio: light: veml6030: add veml6031x00
 ALS series
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-veml6031x00-v2-3-4703ca661a1d@gmail.com>
References: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
In-Reply-To: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778647803; l=2675;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=+ccVjW/jqDGXe+Kpx9slzAPr+lCSpT3yVLJ5GehwNBs=;
 b=EDok/p/DvyVNEPOElCZ4OUVjZIwbNbKHzGBiYvurGsYsbvYh3hhg8Kntf+FBZ58lQbBQpwzYC
 uG1WhK6e1j+CCXI47GnaYWGs1gAtqj0ahFbdkUzTxdvXy5/jwsUMZqx
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
 1 file changed, 22 insertions(+), 1 deletion(-)

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

-- 
2.43.0

