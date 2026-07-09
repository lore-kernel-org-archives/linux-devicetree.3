Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C717C37C0E5
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 01:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783559439; cv=none; b=WAk6pWYrhE+jVlu4AEvoOKWLFjzHxH3B3y30CidrQC0NFqimLYa7MkPiEyJuVMgco8/cYjgxrxjnn9nPzM9uyOVmBG9e5/1IEjctFx3YqcY/Yk4yA/r9H6p4qE0Mb2Rpik97Fu7M8mKdzV0u7OwRWF2dqD1+wf8Zxbw4DFVkVe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783559439; c=relaxed/simple;
	bh=s1AKyzoSxxIvdhYYPordthXUPycyeTIy07faFZKS5zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+caxM7iTSp6GPPORuRLOXAhBb3byt2EHqWTdFGRL3Z5iOvG7XqkxZ6WImIbNDeMunpImrCz7MBDWRO8eVu4fxLcenAbQlOio/gIvf/KIo7XOw/N8RkjQb9ZPPy7Li13In0ricGn0j3t9fUi/ZPpFvxaFRVSMm8UTtrPP8W2wZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VX/Z2DfC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VX/Z2DfC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ba701891so9042835e9.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 18:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783559435; x=1784164235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jq7X/6sAn2Z6bUb0L/rtYSi5kwwPRvuB+ZVyS57/4wU=;
        b=VX/Z2DfCoqvjm2owhRY6CxUoUTERFnSDdXkeEny75dtIlSRWA2uRYokSX6qCShaiQf
         69PeL4/3OtdoyJ5uMe9aCJNl+iDZ84I1gqGktlF/hMGHJ1DzPkm93zNMmPsQ9WqLbma4
         Fbejp2zJCQw1oS7TpV9p+YVXi70IJuRgmQgrMTdghRlwNtwy/3UlMMIU5rXn36VT5DnJ
         XPr9cx0TNgwwF2ZjLTMzl9mZNwJlHYSFm2GA4gZtP5f3+ND2XajrstQ+J0/RDNFde4xa
         F5UOMn4LiVlSAc+aytAeu8UnL2Varnil0Iqzi0PVG5b9huFcxrr3KImYzYXfNyvI71SX
         qGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783559435; x=1784164235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jq7X/6sAn2Z6bUb0L/rtYSi5kwwPRvuB+ZVyS57/4wU=;
        b=jg22QFisSGp37ep2ogxkjfayOVHJRmf5ApMUzfJ6JsAykyrbM1kPJGeFq335BjGiHj
         tHvuT9glJlpFnaAfVWSkzD2o9kQYopja7uFjWKQQeDZPOYMig+dZZn1JlqZsjMLS/NHj
         VU3e0tKYXl2aCOgUYwRtd7G4Kah1NOC88T3Kj3xIeX2txtFB8TmsgLXvWiUvHTHSSIkT
         7YTWK+tjU+i4sKfY+ULYm1TGnknT22NYXFCTVUMFFGJedLECiqujs7oiZe6aCMLMxYQ+
         X2LkcuhVia+JtAb4zKbSyXf8GuidNCVM9DmvjM0t1UDQZ9F+pFJFDaztnjmLT28h886/
         bIvA==
X-Forwarded-Encrypted: i=1; AHgh+RrNdbNwOJAKTmomO7V8TwEsuq+A741AjSEyy51Qr34jLC6URBKQhisJ9FsaDxnTVTGbtMtf+Vn6mUQ8@vger.kernel.org
X-Gm-Message-State: AOJu0YzMNRplygx7Th703zflm1J3V+5Ey5hLnd3UAqpWTeSW7CX3sv/H
	nTBUM1E7iwVjg2ZDKwlJHeEYvrf0GdELwYmkXlrUErsZSTwgG94NnefP3VXaIXI4RX8=
X-Gm-Gg: AfdE7ckK5pu9nf8RDo+9wnX337LmoiDM+CdfT+Z1DM8mqFqoHR9cTyBRRILqEQYqvmu
	IAKScjRct1BC0Zl34rZJOtlFWSJtTKcphXrFped4t7EMJV7ijE/JWsHvXYB22UR0p8FMZjGXFXX
	MzTIMZv7MEyhSmHip8LKfsdmAeJB9AMQKCODn/GfuF28fuC3LIFwVCwCm/1NIiBGUDsFZmCIe+j
	APPXlCRuwH5ahU6nQ+dJQ0NNMRAT8Jgd7nQNEOwhyKfc7NOXrfQj8oDWTTiFNoKQcmvOuw2677O
	dv06LzW40MXu5zhca5ubwBfHgB/1lEFooRrCf6ThqLe3Bi2TGlA9Mup+E3wvemcJYuUCNgNavtD
	5kQkEv8K5l/nY16pAK91ZU0Ib5Tfm1O9cZGLaQpL+/tLzf+g5ZjuOxcm3lkuMFRUV6bCD0ne0Kn
	HOzn2GVpg2qOplk4KsX52SoAJu8xFHUGJJYr7371yPtHr2fy+4JnqyldKLNDaM8w1xedWa+xH1k
	9dl
X-Received: by 2002:a05:600c:34c3:b0:493:bb29:af40 with SMTP id 5b1f17b1804b1-493e689b37amr57409965e9.14.1783559435205;
        Wed, 08 Jul 2026 18:10:35 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb742d0esm18994725e9.13.2026.07.08.18.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 18:10:33 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 09 Jul 2026 02:10:27 +0100
Subject: [PATCH 1/3] dt-bindings: thermal: gs101-tmu: add Exynos850
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-acpm-tmu-e850-support-v1-1-9fdd58b634af@linaro.org>
References: <20260709-acpm-tmu-e850-support-v1-0-9fdd58b634af@linaro.org>
In-Reply-To: <20260709-acpm-tmu-e850-support-v1-0-9fdd58b634af@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Mateusz Majewski <m.majewski2@samsung.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Document the `samsung,exynos850-tmu-top` compatible string for the
Exynos850 SoC.

Unlike the GS101, where the ACPM firmware handles most of the TMU
initialization and threshold configuration, the Exynos850 firmware
implements a significantly smaller subset of TMU IPC commands.
Consequently, the Application Processor requires broader direct
MMIO access to initialize the thermal unit, configure thresholds,
clear interrupts and collect calibration data.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 26 +++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
index 75560ebca48d..bea208cd4619 100644
--- a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -15,17 +15,27 @@ description:
   both direct register-level access and firmware-mediated management
   via the ACPM (Alive Clock and Power Manager) firmware.
 
-  On these platforms, the hardware is managed in a hybrid fashion. The
-  Application Processor (AP) maintains direct memory-mapped access
-  exclusively to the interrupt pending registers to identify thermal
-  events. All other functional aspects - including sensor
-  initialization, threshold configuration, and temperature acquisition
-  - are handled by the ACPM firmware. The AP coordinates these
-  operations through the ACPM IPC protocol.
+  On these platforms, the hardware is managed in a hybrid fashion, though
+  the distribution of responsibilities between the Application Processor
+  (AP) and the ACPM firmware varies by SoC.
+
+  On the GS101, the AP maintains direct memory-mapped access exclusively
+  to the interrupt pending registers to identify thermal events. All other
+  functional aspects - including sensor initialization, threshold
+  configuration, and temperature acquisition - are handled by the ACPM
+  firmware. The AP coordinates these operations through the ACPM IPC protocol.
+
+  On the Exynos850, the ACPM firmware implements a smaller subset of TMU IPC
+  commands (mainly temperature querying, basic TMU initialization, and power
+  state management). Consequently, the AP is responsible for register-level
+  access to initialize the thermal unit, configure thresholds and handle
+  interrupts via MMIO.
 
 properties:
   compatible:
-    const: google,gs101-tmu-top
+    enum:
+      - google,gs101-tmu-top
+      - samsung,exynos850-tmu-top
 
   reg:
     maxItems: 1

-- 
2.51.0

