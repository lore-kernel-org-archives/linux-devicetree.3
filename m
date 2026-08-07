Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E45C38E8CE
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110745; cv=none; b=cvUvjOKOt5YqGUecabCqBTVZB4H1Ucd5fFxQpyhVJvSeDdfTxbiEsUwo7Bx2BCW4fMZfLO3h4dJY7pKuSjuOh57S6aAfmuGZ1nu7dYaqLHnnB4CmNSCtdqw3mLNZDTkWZ1ABXSlyyGpPbX6sFGxWD0vpZcNvB/997LV3ErPDuLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110745; c=relaxed/simple;
	bh=ObBWfLfE4GPP8LCHnfNTzpcfqHPLFsSPFFNTLOW+PNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jv28bi/lPKmi9yU9ky3WPxllq8TbZBtl9mcR9U/FwmkzLt5IMb9vE0YbxGw4I1U/RME0pwqj/Om+9LbxVTLf5/SrVGGRiSjvycRaoXC5DVL06HqDgxvNZzClCQLdsJYOLFGARf68/JYU+DVmx90n+SDeQ1v2tL1VHWO+dOp3iSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ek9JFAUh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ek9JFAUh"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47db714766aso1254499f8f.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786110733; x=1786715533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zuBQp/Lf41ln9pCgsCu9cfS2v+qSw/epBAvyAhrlgD4=;
        b=Ek9JFAUh/Gl6G8ziRPNcUzTlwEOlUuOAEsRe0VkTys2P+61QNtJfnN7qkhirOIGvk6
         A89C2YwXA3jCEejPalxt9Wt2NL83JHiwsz5lqCZYZY+UjCmyvOjxj76Gx1LEx2JBJ7lk
         5b3yeb0HjiWGgJooH8tf4NzVsTXmhcMaWECQSslAbVNk9TggUSUwDc4RsQ80e/VHCKpO
         61kNUFOEDBHFZiUkvYdw9XBpH9draeKo2e/hi0WnZA+odqUXCkgiGGud+BlWayZ29KsA
         EZf1gfE/Hgj2BtfHeOXip1iQuKE89RHqDrTWGYFbYiYSWWTmKZ8B87jAPRHzm/MSt6D6
         GGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786110733; x=1786715533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuBQp/Lf41ln9pCgsCu9cfS2v+qSw/epBAvyAhrlgD4=;
        b=ltHi5JudawwhRTGDnVGIbiPRQXyIHQF5RnfSpOLedhrbznAKrKHDVfx0Ranu500zMH
         zLOoNFcKFdxWnBsShjz5eFTC/gLFosdx2l4m2VfHiSeNK6OOHmkTp/97wt+gqRTtgRim
         8XskfFfN81wzV9NdDPUZ81kxgHCkIsjJVHcwqHx2G1f+hNKxxMp81AEK4rDKPmoe6JoS
         xBuWiIgp3JMxjbvrzUrd7TLW62nOjj3EwfxTwVSD+IwR51W3+rj0+uevl256ptTXIqXR
         riGSepm8bquyPfyBvjSHtraUa4AS18GZH3kNBSjgLYN2lc0R97AWJSk2u7hfFQKPfcKU
         HnIw==
X-Forwarded-Encrypted: i=1; AHgh+RruChNCIex3lxCrrvot2gfOI2bXTWCOOckhYJZKNNHC0lUHdRJIKv7FAzI+eVtbebPkiG/b1FryfTSx@vger.kernel.org
X-Gm-Message-State: AOJu0YxLuQDGJL46yc2c1FVfXHXC+j9Zk84x87FDe0Srn8czO6F5ZFMW
	xPiHsHo33acJQp8wpQU9/iJKCmHf2TERmzcGQB2TWkE1FIZykgpwhXR9zB7CYQ==
X-Gm-Gg: AR+sD10ebiYx4igpNItbah2QA+7GyBR9JB423rRL3LxnpOfuAt5pXVzU7bvzC5RrK4Q
	F9Ero9jSviixQBzLjd0jH0+U9yG9ljo5mxZCkJgBh92SthASTVnbO/zc3ZCf6BMz4SR0i/0sNcU
	blWei/3v3EqKZMrbiHGijH50kOdTAVQcyeb5qPzmzFZTaqFgf4HVMX2TyrvVzH8CSuf0H7rJO9m
	xVSM2JXig7LT3d6gp5QEW1BPVhCjYdmNDgqcLbyingssNK+Xj/vnN5/dr9o75L9b30+vWK5Qr/O
	s+kJfE7TVBXp7nbgweR6zvokSdvEh9mumqHAbgY7HM2lROL45T1MOibCPPXmX5HbCcQYRQXiElS
	tCnv11o3d1ql5ih2vQzBd80gXtN0Ddfk8GgAttnbXwh7AWhWoNBSKC4ZA4kTb6Zb4aZ9QQqMoN9
	jrP+4V20Qyo4l3J6XTM+JAAKNNdt/Y+jnjYUMNSq9SQx961Ad20FI0MIfSymn6Gs5XoQPYDDeFy
	TYGiw==
X-Received: by 2002:a5d:6604:0:b0:47f:e746:dcab with SMTP id ffacd0b85a97d-48130b2299emr186184f8f.10.1786110732955;
        Fri, 07 Aug 2026 06:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:13c:7c2e:7f0a:5759:2e0d:bf8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8b09sm6581333f8f.23.2026.08.07.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:52:12 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 07 Aug 2026 15:51:52 +0200
Subject: [PATCH v5 1/4] dt-bindings: iio: light: veml6030: add veml6031x00
 ALS series
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-veml6031x00-v5-1-e60876fb3640@gmail.com>
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
In-Reply-To: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786110728; l=3090;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=ObBWfLfE4GPP8LCHnfNTzpcfqHPLFsSPFFNTLOW+PNE=;
 b=1tAjfOJlzciAG4mERMzK8NKDVCbJ/ifi/y9kQKxvrX0bx4Ly9stwiXSkCcJVV/m1aShkQ1FdF
 GvrCeOCs1FqDQ3Ncb1F4qshdJ4MMF2K4AiBTo6WD/I9fKH4SW1hbQ6Q
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

These ambient light sensors share their properties with the ones
from the same manufacturer that are supported by this bindings.

Note that only two datasheets are provided as every one of them covers
two devices (veml6031x00/veml60311x00 and veml6031x01/veml60311x01).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/iio/light/vishay,veml6030.yaml      | 13 ++++++++++++-
 MAINTAINERS                                                 |  5 +++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
index 0041e1db6838..6a387c76df35 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
@@ -4,7 +4,8 @@
 $id: http://devicetree.org/schemas/iio/light/vishay,veml6030.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: VEML3235, VEML3328, VEML6030, VEML6035 and VEML7700 Ambient Light Sensors (ALS)
+title: VEML3235, VEML3328, VEML6030, VEML6031x00 series, VEML6035
+and VEML7700 Ambient Light Sensors (ALS)
 
 maintainers:
   - Rishi Gupta <gupt21@gmail.com>
@@ -23,6 +24,8 @@ description: |
     https://www.vishay.com/docs/80131/veml3235.pdf
     https://www.vishay.com/docs/84968/veml3328.pdf
     https://www.vishay.com/docs/84366/veml6030.pdf
+    https://www.vishay.com/docs/80007/veml6031x00.pdf
+    https://www.vishay.com/docs/80008/veml6031x01.pdf
     https://www.vishay.com/docs/84889/veml6035.pdf
     https://www.vishay.com/docs/84286/veml7700.pdf
 
@@ -32,6 +35,10 @@ properties:
       - vishay,veml3235
       - vishay,veml3328
       - vishay,veml6030
+      - vishay,veml6031x00
+      - vishay,veml6031x01
+      - vishay,veml60311x00
+      - vishay,veml60311x01
       - vishay,veml6035
       - vishay,veml7700
 
@@ -69,6 +76,8 @@ allOf:
       properties:
         compatible:
           enum:
+            - vishay,veml6031x00
+            - vishay,veml6031x01
             - vishay,veml6035
     then:
       properties:
@@ -82,6 +91,8 @@ allOf:
           enum:
             - vishay,veml3235
             - vishay,veml3328
+            - vishay,veml60311x00
+            - vishay,veml60311x01
             - vishay,veml7700
     then:
       properties:
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..4369cbf8b5ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28761,6 +28761,11 @@ S:	Maintained
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

