Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D47A24A047
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 00:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781829204; cv=none; b=TREhbySF6PMPDdDm825vx6kGrpF8s2upT1T2CqNiuS+icew4/Sq36jetoAQ8txIMqI/1+WZBdo0yHGDIkcCKEO9y9qRFywmXj3Yri9eETCCXovkotPmM+ULDGq/F2ldx56yVOQmS3LQ3gGxiSQdpCGX6W5KYyTpWvsUXH/U6NZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781829204; c=relaxed/simple;
	bh=l2g7/z/AH31QQ2FPAVpxdJVGorUFIpJvHR3qJvSCt/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=et19eKnikSnsDg+v2kXtIiRSx2YVCFt6ws02jJp0+N/SJnlvo92MLhSw/msNknKndmM3FLZ2lNQs3LeT9vZM26DSngLe8s3pT3EQMx20idbj0TKXAKZzBd1x4z0ErlLAoo6PWNsblOt1EqXfw78uTHa0JHA3rpYX6Xs2RE4nDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTt7qKEx; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTt7qKEx"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59d541955f8so511559e0c.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781829201; x=1782434001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxJPuccmsizX1T5f4AHNlctz3loKgW1+YIRVdkkYLLY=;
        b=VTt7qKExq3k5M8tPmcv0Mf8g6QQwloKGdpNFRZwTW/GQcyIRE4fPIM7x+lcuzB4Osr
         RpzOa6kNgsF7L4fGbmmDFOiN+s0h5vunS99RCXievO8StkPs/XMC49ezlBxbJClX7A/q
         lHAl9nw48AtBNEDhMEIFjxw22mRL2DXfFaK3FI/L1ksHliMzNJwY7KxwHAMk/4y+4wls
         nNtsd512n5xQhN63ZvuIiRBy6XlzVxq7c2Ellbm26/FCAGPyrJh1SaQT/GmeRTb4UNYe
         iRzL4k3WoHfhWeIv4keuM0OMjo84t/DSdo123G6UcQfRJH6nuecL+JO+vL99KdyocO9E
         jrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781829201; x=1782434001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JxJPuccmsizX1T5f4AHNlctz3loKgW1+YIRVdkkYLLY=;
        b=gFRKqTzS1iT6L3TFuYD1L9keCew0u0LCqNWrp2LqNxmLcdn9D6wndUcUa4YwLhEFFX
         mjVwzKlUmoKvZWOoma33Bd2OFxO3JDBvmlVGj6Q2YefqoLxRQcIFgam2/3glvjbBNAcg
         /Q3dfk8KLz/KORkyrZDBhU9p8B7Q04UNcrxICilH+i+mXzFd4437A8QgbYRMjl1FOCbE
         OGdGoFOF40hTrPIDH9IBbIHMxjhCsXXZawASmcQqlTAcMFyEAFYs57Y+ovnZ5/YC8Ld1
         j7Iel0M/zdjMVyoFvRCBwtS0izSH/FksmAiY5CjibxSDYkI2vVoO/fjtwSYV9wuK4V8X
         7YjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dWYr6bbt2gCpUC6bkl0aJAxgCGyDKp4oieph4ixHC5jNeVUtQpe9Z1U4be4TNJBMhsTI+P0jECcf1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0uk3Ym4IQkrAu56OtfNaA/qZgniGKwg8P+4ZwHKxDnye4ovH+
	raCNnHvxaAqdL8wyJxmTabEZaKBAdZDUvVwrFcfSsXVz8KuVqGVvSMUCtoWNXA==
X-Gm-Gg: AfdE7cmqROseEo+8qRPb7qXriebR8lSzK+SDdwCRKjZwnAdj1hbsP/v66S3ITHCC1wv
	hUGvFgWxYUzFHxvpCWOOuGtz4cICQw1otTHB5bmoe0yDRBl+F6fb65CRpaPl6r/E3wNEbAihzbW
	IUGUOMHYYfX44tXzq69ODo/qTFA6DXnRQfnkXL4wctCwjhsjikf4Le1qJ4784dEMbTzgsY3e4rE
	HrfTmjQRk/jdgX33DyV4HLuUGyTT0IeqhD22UwtD0rcz2hnXjXpQM8XXQgTHHOOoC/ErHWXvWMa
	unSCzW6zaglR+cRNh4bXqrEyDAc97VKOAr51lqD7Cpx19kc9NPJl5ePPPiS3t35MwsTDj4ZB3zA
	xU/snRWhpuoP8CwSLpx+i380uE10ssDsGRdDsfydnlKaF2lTq8e1KUWcixm2eng8pYAKWXCXybE
	nAs0rFhWvhKbVEXqk=
X-Received: by 2002:a05:6122:a18:b0:5bb:d01d:451 with SMTP id 71dfb90a1353d-5bbebc4c13emr623003e0c.10.1781829201380;
        Thu, 18 Jun 2026 17:33:21 -0700 (PDT)
Received: from [192.168.100.222] ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbea36b5e6sm861581e0c.9.2026.06.18.17.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 17:33:20 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Thu, 18 Jun 2026 19:33:03 -0500
Subject: [PATCH RFC 3/3] dt-bindings: iio: adc: Add burn-out current
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-new-channel-props-v1-3-963c1b5cf40a@gmail.com>
References: <20260618-new-channel-props-v1-0-963c1b5cf40a@gmail.com>
In-Reply-To: <20260618-new-channel-props-v1-0-963c1b5cf40a@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=l2g7/z/AH31QQ2FPAVpxdJVGorUFIpJvHR3qJvSCt/M=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkmfZ73DRgZPy/582Flz/md3Le+/Pqcx83VIL5rBfcq9
 ZNHfQ96d5SyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBEAlQYGb7kthZfK5MzUbHU
 CV688HPWW6n7LpsKfm39dmv3a14ZCU2G/wlenwPqpT7zB0krGu9IucLt+Ekxsaw6ZOOlnARWsxN
 LWAE=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Some ADCs incorporate burn-out current sources that provide current to
the channel's input pins for open-circuit or short-circuit detection.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index 106b1e317411d5..6b63aac9ac04dd 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -106,6 +106,20 @@ properties:
       This array describes the current configuration of the excitation current
       sources or the single matched current for all sources.
 
+  burn-out-current-microamp:
+    description:
+      Burn-out current sources provide current to the channel's input pins for
+      open-circuit or short-circuit detection.
+
+  burn-out-current-polarity:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Burn-out current sources provide current to the channel's input pins for
+      open-circuit or short-circuit detection.
+    enum:
+      - pull-up
+      - pull-down
+
 anyOf:
   - oneOf:
       - required:

-- 
2.54.0

