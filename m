Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36333EB17
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 19:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780257518; cv=none; b=Mnj0szSeKqh/m6YYAoH4oTvGp+oF3Pg8wPWUi2HTWp08uIkYA8Ey5/3nq+Dd9BKNe1WbVXuuP1cScz0Q0iGD7VM9Glm70c2o9HmAwwYn+DWsj9vse1FrNZIHY/9KOVLFpZbAeYo2lixMsMA81Q4c2p1ZvEoW+4IbIKOFOHqVxSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780257518; c=relaxed/simple;
	bh=HJcKaiRHUPVVz44flDxq7RjqHlMgRL2UvrwWMWukkOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckbg/TS5L+0IuiPgh6AEPkiK1/Kh8YF4dwm7AmgLdUYE6HiNJH0V5JtteOX01IdwHpBJ+jgZPFmk3R8I0L4ZNWPZg+3QsIrtJ9cm7fbCYcVGc9IdihuKKW5/Ldrz1w3feICPSUoXl8FIUC4oHVVAzi2xcz8z+pSE02N9QcweqA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1WVcK44; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1WVcK44"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45efa0326fdso975137f8f.1
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780257516; x=1780862316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28TrmenFX4jJrjlN6PZ1KHA15XnNjrQNxHUo4wAACFA=;
        b=F1WVcK44cICGoqTLOnFOqFDlvQuaz7EfWIUZA0oOdj0pbTpeWxq9k9P7BzRl4z0VVz
         SZbcbPzjYKUIClLz2RD1xYsU90mlGvqcLAj/wUyeuxNyp5eN12+1ypefM1nrBTOp548/
         BBVwwwlozvzu2Tk7b8Isosj32j/36vP51ejMDzDDWgkU+6Fd48Fyr8vbtAjFuHcV2z1W
         sFHtUw+09xXCqcPtTq+TM9g1WOrUCb9D9CTw0sVBER8F9oXdgI1xCc+aIyTpAKKfk+WU
         5RE+Y7AdaBwjC+fz7hMTpdrXlTZo+acjxPj+ijkYRh+3qMkUeOYK4ku4tqaVYX9magWx
         F6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780257516; x=1780862316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=28TrmenFX4jJrjlN6PZ1KHA15XnNjrQNxHUo4wAACFA=;
        b=orNeWlaX6qzhPvvDcjY2vAvuhlyXDLzdC+vUQYqHpS8bshwQjxXOsVstrTOpxsUiS9
         qrptPy3jjV0sk87ME5maZw6MigZv38gy3UF6XV4ijgTvbfbj+NLjAiOVJRVTHxBRqu7m
         GaCazNrwyu5Vj+IkPdOAiN5MdYY0cZAsV45cIKCOGvN7n2O3hMt+zqFwUI5CJj3NkZqX
         llFNjW9JlFj15nAYBlD4VYH7Ue08E+VaCtvFQBNviFr04OfXQGluZ/9qMl4HHYAH6iOu
         ItXEfRJFXvAX8ZejfCQPVap1RObJARwIBa/M7teuQFFvwrs51yyFze/nyj8AHgLswA3O
         WzJg==
X-Forwarded-Encrypted: i=1; AFNElJ+inR93LjHt3FKxDmXwJvt9O0yeVrxNtQ2fDrjBFUIC67yiFoqGVh76q4ytQo7J4c5LYzXsCFdXPFtm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiu5Xg+MJiKb2nFMZApTBD2tarPOsmj24lDnTx9kHirmya2k4v
	yeDyPugkCE3AWHDb662zVisywqk3/1itglPv8SlWbAHfGof75CJ6Uugd
X-Gm-Gg: Acq92OHTJqHpjAsP6E/ubeTC7geOo9/Nk27Yp5Dn0LmXy/bKODaUNDnl2CVTEpCizwC
	KVg+t1eii+gF8ZMiJcFExeDpvKNeyKnXud+WPWiPIUjqm1aIBnZ5xtH/GHcL1hY1Dg2bcKvHyd2
	VeDhttLs+aLhgpIdkbOX1tqHfHOkh7JnTvRrP25mrlWqNevvyOx7FVDjC8KvPyuTP4OR+RoiaSt
	Ron4TOBXOCOy3krSfS6C1SMmDXHspmjKT5yDjnv4AtRAuXjQ7hTZynk/0NC64dax9ZxaOt0tL9k
	1a5IQQ88iKrWhfA7VG4JtCoKyp2+3o+os6KEfWfb0pbCG7eXoYx1aImEH0xeNjKT8XM3rFaivs9
	ojrHWjV0H1T4PMUi/0tLlCrc11UEjHAlAOUkBTt0WOC7VjisVBgFHPyYny1c7DKmUYLNFZEm7iu
	L3D9eRDdqUSeF8uguNdhu+aTAvk/A3gDWBqY4PBNNz3GqWt1TXZg==
X-Received: by 2002:a05:600c:1988:b0:490:44eb:c1dd with SMTP id 5b1f17b1804b1-490a294fe9cmr141548325e9.29.1780257515601;
        Sun, 31 May 2026 12:58:35 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:152:df59:bc17:a305:8902:fb31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d7002e8sm220323775e9.15.2026.05.31.12.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 12:58:35 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 31 May 2026 21:58:21 +0200
Subject: [PATCH v4 1/4] dt-bindings: iio: light: veml6030: add veml6031x00
 ALS series
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-veml6031x00-v4-1-e64f7fdce38d@gmail.com>
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
In-Reply-To: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780257511; l=3301;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=HJcKaiRHUPVVz44flDxq7RjqHlMgRL2UvrwWMWukkOU=;
 b=/PVpw15lZ0+TPX6JQq+JbCzNeahWAhBqe7SGtPcGK1AuPeTrd2dAbXBTKAoUni/6VfW3qwqvH
 I9kAFKTZAfAD/RQV5wU9HBWRcXpXKaM1KatsdHlWMZWOiOWPvSEWlYG
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
index 2fb1c75afd16..921da7584963 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28375,6 +28375,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
 F:	drivers/iio/light/veml6030.c
 
+VISHAY VEML6031X00 AMBIENT LIGHT SENSOR DRIVER
+M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
+
 VISHAY VEML6046X00 RGBIR COLOR SENSOR DRIVER
 M:	Andreas Klinger <ak@it-klinger.de>
 S:	Maintained

-- 
2.43.0

