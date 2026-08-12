Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A5739792B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 20:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786566478; cv=none; b=KUP2GKM0Pid7DVUxhib7tXoxP/t2uHu7Gd+TpCXeM0hHyteTcL7h5KbzwviGyFGDgC0lyBcXTECeAjNF3U0k2NrgZQkI7cJhmJslxxiYwsKLP8R9kwpV9uZ/bkzFwPhLvh09nWK/fLPQxCEakagZNeu6kq81vWWlrY1uYEM7DjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786566478; c=relaxed/simple;
	bh=aaM+chNBUVzOK+71XSf/Mb82WOTb5qO+DxTTOj0UyJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KF/+uzG1thUUtJFPrQalETy/ECML44aqikLGTSyajllPQMtnzh/iHA8sabw6uDN8Sl4RFx3BTx8vEXLaoamuRTryWqo6suNFXmlkJYqIm3nFOSTrfHvlBuhCMui9tcrKQ4u5xwa4HzaVrBYWIQpUtTkCJTyq2Ydt1beOvnlPmJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnMd7x7t; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnMd7x7t"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49558ce01afso10917225e9.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786566473; x=1787171273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcNEmMVFuuQmsODrVbSfU7PhXNWqkwOb79tP/Y3pu6A=;
        b=EnMd7x7tjPQ1Q5yXNtdg4M+ZBs9/cFu63vIXc8dA4/nRhxAW9IVcLRmInQCCLxrtyc
         R8eFDNqxsxAZJ63n+xAQNYHx4H5V+QC3iBLcFZuHDtcL26eR3CUuq35HkWsg4Fmpul9n
         yqUEbruL9p76rTfSqkU1DYUZcaWoDTq8jTOa1TAL9Gr1uSqzdTJJpB94TjvJzCQ7gmz5
         BSnc/6HxvQ6PlqtD8f0Spde0j/IpBZClzyAU43zNoY2jQIv4r5efCWw6u3LuGV06JSLd
         bSSm1N2yurLfbXuw6xbROtSyLTogKqT4oGMeFV1tR80/zv9g7sWqHV5N7x9bl2yhfcmN
         ojPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786566473; x=1787171273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcNEmMVFuuQmsODrVbSfU7PhXNWqkwOb79tP/Y3pu6A=;
        b=iajoV9c1iSg5UBdVn6waJf+lvptxE5fGZwmGYsNNTEswDJbwzhmXk6cJ0I1METC69f
         VVCouXtrvh+LP83m/OdLNCUC1y9LIgSNobvyXAKOt9UcjgIt+acjBaylDYPfy+PZc3Jj
         HPhv9tVUTMde//QfJSqvmr2HNjuPfh7anJcAFcsLz5LkzNDUiC+yf0G8FRZiGQKgQypG
         RsPHhUJ+MyJJQ7D1Rh/P+a9vrYaM6wEIumIGw6+WAA7WE76n0uqQpaAc/k3BYshDwMF3
         A4tjEjmjihgnWr7wns1EecCxzRB/wZC82tzhahywyBRhW1o68riBJ++8jKgUwepbtscU
         0YpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9YEWMvm6GvkP7OTXKsIo9ToHTOgbH6HVwuPNR/QJIjskPeWGxgksIrGK3A+s0t5HupYFc0Z1eIEG4@vger.kernel.org
X-Gm-Message-State: AOJu0YxqzFGrg+NuMffiv1E7H0dfKOqpxYW18/QTvuzo5WK7mmsqkfWN
	HaX8zVXkoSd/UdNThBOyCVlmQd1To8DM//crm0aWirvb27dUu69vyENI
X-Gm-Gg: AR+sD10GYTKPSBV8hpuMXKvb+X9rotBsCpSBmSgAhYgSfgxYFt7tYgpya+OrK/Kamqt
	9P5rU9feUwtPc7cIzImM7GmwcfJrf6lpPHx1EYDDTbEGvRlTn2fj482WBlHtApvY5+izs5Lm3Qr
	DpvU3UzJSVkJubI4wIXQ2pForI2fj1KhPIw80mh7y0oxuzV/mh97l4E16H2XlCqNiRfIrSDo5AN
	TqxQb3EsX5Y0SubMjEi2UuBjygokRZm0Cin/b4ovJ4ighXViwYtQq4VBjf8d1hPHmNv01hAYwLF
	ccs3XeWuUPzOCCS6oVm9LGtI1pGbun9k4C40anWKfiCDA3pmlA0UizclHIb+/QkTDkIPH1YMFXO
	cBfpzmHWX84RB1k/6d+UIyFUVseBBU5GRN1cQip7xeUkYPpYQsdDSE3bscO1M8b1ZIFCGQnB026
	BsaWo86lstWI9Ul17D2B/6w1Zb1hiaP1KO8rNszjvdWQ6OnFcMLArWxRoyyzgwNOwYARd8kcFq2
	+Ry
X-Received: by 2002:a05:600c:4e87:b0:495:4859:8f9b with SMTP id 5b1f17b1804b1-499821add3amr3159625e9.9.1786566473100;
        Wed, 12 Aug 2026 13:27:53 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:16f:15e0:179c:a67f:8487:260])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b03e70sm13911725e9.3.2026.08.12.13.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:27:52 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 12 Aug 2026 22:27:40 +0200
Subject: [PATCH v6 1/4] dt-bindings: iio: light: veml6030: add veml6031x00
 ALS series
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-veml6031x00-v6-1-7eef6e4ce290@gmail.com>
References: <20260812-veml6031x00-v6-0-7eef6e4ce290@gmail.com>
In-Reply-To: <20260812-veml6031x00-v6-0-7eef6e4ce290@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786566469; l=3092;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=aaM+chNBUVzOK+71XSf/Mb82WOTb5qO+DxTTOj0UyJ4=;
 b=L2rc1mZOwca++QUVNKzBpIcHBD/wO9rBu7CiYuOmSh9z9lCXhfdTAnvhlKptNWoRw35L577CZ
 SxXPI/S75yZCaUN1XfjspkSNKIOYuEcjZQehXT1JljRO9hTNLrtk1uI
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
index 0041e1db6838..a44de649184a 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
@@ -4,7 +4,8 @@
 $id: http://devicetree.org/schemas/iio/light/vishay,veml6030.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: VEML3235, VEML3328, VEML6030, VEML6035 and VEML7700 Ambient Light Sensors (ALS)
+title: VEML3235, VEML3328, VEML6030, VEML6031x00 series, VEML6035
+  and VEML7700 Ambient Light Sensors (ALS)
 
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

