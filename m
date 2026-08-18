Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3691F3E3DA7
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052878; cv=none; b=Pmz2W5QrPnXzek9Pzu6PPtC7TBVMRwtbFZztd6LsuS3Q+LaCHImMNCUNHtcdoOhE21YNaIcUygdhvHSgtlX9NmFBOfC9/WNVqZUzGdZiQ9wrfnPsvYkrzduww+B1JxVwrTiALEMmyup9a5A2HFr34kO85l54A+NaIzzE+uk/xQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052878; c=relaxed/simple;
	bh=aaM+chNBUVzOK+71XSf/Mb82WOTb5qO+DxTTOj0UyJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1MxXB1LARjFDtSlMluM5qgCKfHd6CX8jKktiwl5XjWwX/hDYh7rfunDt9Tma0J1GXUdA8BGx6hHg/0bHEpbeR8VNNLATzQjyrmfo3xI363nbSQhzLsF/REFKHZqMjLxZLtFGqAx40HFFnR4d4Ay0YBOnESylZsqFucCYw+Bvlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrFmua2M; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrFmua2M"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2020421077so731658766b.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787052874; x=1787657674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcNEmMVFuuQmsODrVbSfU7PhXNWqkwOb79tP/Y3pu6A=;
        b=WrFmua2MqMmHEGO9ImmL+c8QmlqqjDGRqrTti86FUkA9zqoGe/dhVclrqXXRJaqelJ
         Unkn2P+pRZ8+wQgJT1AiR76bBoeAixcCIMvMrtt1JcrY5Tf+4ZEqB2U8UW+zTc7jvPIa
         1zXkXlTa17o5LjWlVwdvmJw8VUoLNkXuCSf60k04KdD2MyV90alG2T2XBgqat7+9NZlZ
         +eyMgQ91IiwTgtbnNF5wFWG5fvZDbJ6LAp2LUtLSy2iltTwJJehBOTNPhiMZ+BEHs3Ad
         jVZu9LCvsDTWfHZWfjhDuxKsKUA36zRTijkGcdpLVXtUn4s9ODJ32vd+Fv7fdzC1FuDq
         IROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052874; x=1787657674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcNEmMVFuuQmsODrVbSfU7PhXNWqkwOb79tP/Y3pu6A=;
        b=XFmiSCrXcve590DriINTDT3Shs3Ou9YsJSNFTk6B2uUfBhQHO0W9Xrf8NXvM4s/pau
         BHdWI65wySyMQ/JK9v7tM7pjMXXY2kP/Nf1cC7IDq4RousipOWcQc/OsEV4wDwHWdovL
         I7YIGFk0bwN7hFkCjRShGDS4uBvrsTS3PIsV9WJ59MXOHXMhy0u9Ba8DT58Arq4zPBj4
         HDMhhmoUKVIWTNuWOrID+xKj+WppCICPd4AR8mOnTOTaOEvyT3TkVNRKX/DVCg/G8HnU
         hy6KiW/tp8nfanXMNrI3ajiKPZM6W4TXMmxY+qog8LRx6JRT/8kPkiknKtxRb80qL0EE
         EIKw==
X-Forwarded-Encrypted: i=1; AHgh+RqhqS/HqNDcLd9Flu4XELcSmJLzAXkmBSbUao/ZwTjDLZfdC5skLXS2UEphSGIGZXY+2wblDL8qP+D+@vger.kernel.org
X-Gm-Message-State: AOJu0YyMVFLmOSi+RCohLHEyS6JZKh5nmTivb7yDlLPwJrmX/pk6A2vL
	3rgCpDU+9HdkZxyPnW059KuszLA2OOxPTF94cXIOlahXPKvZptlrHpZo
X-Gm-Gg: AR+sD12pk5eU0zA4nhYkYfwdz7CARC879NbXrHgwR8oXYjy4Y6nYfOmPkQ38BLAEJvl
	L1XVo7WK9tFj1xJuYK5esE6G41N9SciU6bW0/++jvrlfiGvj7e5mzGcRtusgjloZkD5VCrcKShR
	8uvJCbqRx4qS8mrGkhPTZfKlXZnPKVNgHfJYYkgkqxjoaY1pdAeiTD0fNnIRYt+nIZQAuTnDQna
	BDpmT3gjXoSODlLEfUhpDkzunbBWadKcBAM2hxHmkTgE7+KoIuElTi1L7zGPVBJ5G5VeaWnW7LJ
	SZk6h60HgkV5A8vkj0rVgzM1p4tZTEbamS+X+0dLRFs4fuz8p+DpbHJ8+3WssZYLbVFpl+t5v3x
	DBTCKHmYpLA6euXU2eBidRC/kHY4Rvz8TsFvGXoctAF6rI3Hl1Z/67JVpGckTApaohOXq/TpHyj
	yICRG3DDJs5uEPFbCJ8X3gLzuyBhsiw3aBdUeV88o6dGo1yCz1Zh0ARu8z6hfD1kZNnP+QSQMAY
	tt3ow==
X-Received: by 2002:a17:906:6207:b0:c12:83c9:d41 with SMTP id a640c23a62f3a-c2129be130dmr1739874266b.12.1787052874257;
        Tue, 18 Aug 2026 04:34:34 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:17a:e1ae:f7c9:8a7c:d206:62fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b73db1sm137901966b.40.2026.08.18.04.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:34:33 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Tue, 18 Aug 2026 13:34:26 +0200
Subject: [PATCH v7 1/4] dt-bindings: iio: light: veml6030: add veml6031x00
 ALS series
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-veml6031x00-v7-1-2b0de0f20edf@gmail.com>
References: <20260818-veml6031x00-v7-0-2b0de0f20edf@gmail.com>
In-Reply-To: <20260818-veml6031x00-v7-0-2b0de0f20edf@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787052868; l=3092;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=aaM+chNBUVzOK+71XSf/Mb82WOTb5qO+DxTTOj0UyJ4=;
 b=jMmCQLW61kUrWLBtl1MZQqb261yjfNkfD/oSsrcjhqnD356XTW/oo0iICnXNIpzZaP9oApzQ0
 POesHo2NQWxDbu3n4C9d279bI00H5/l/5DnYZsiTDYbdP2GYbdlc5TQ
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

