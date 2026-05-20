Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC13E5590
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285450; cv=none; b=Le9fbeml7Scy6ZTfXEeAhPVCPSYOsxwN1HCRm6AUV8KDENrvLFmwuB+Wc6TSjmc9h0yZMtfUGUwVgvK4MZErhnIBJFGzExDMoGjCYrLQHmr71CRpZdmX5m33KY1aIuCzSCQGY/iwWbz2rIgQe9kWGtkYMVZj+QXyXRaa75Tr/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285450; c=relaxed/simple;
	bh=K+tQdEa1w/oGtmN7/A0Fdc7GiMO7t+lg3h7hsUuhzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBON0QQLwYDiHL8uxtzM2/PTLsCqIwvYpmL7SvRdIT91mUdaRaBT6evQC5LG6y2mX6qDQq2hEzy4gRHA8a7ZuLnuow4IqvkxbIhowKBq8p1XbFr0WZA8cuhIeFbmmc+rySuDUulTIJ/At6gbPiUdd/txbRFS1D+tCh+Url9OT4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQ+F7hKo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ+F7hKo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so2494127a91.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285449; x=1779890249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=ZQ+F7hKo/Bf5419k0GUk+f5bMI6JLfQGWC3lnSzPkZfMIXvDpq/LtP0/bSjsKRnpon
         YG4jXoPfYLG7JhQwordrJ1+a/7NvkEs26kJhoOhpisQAmtXj4vm7lFTH4yUqxu/+GZN0
         sJ97g9p02sZt1sKp68yupHjEjUTjwUpw4NGPIYC5M44thfQOs6QawHtFuB2n57NwRKw8
         2mdfXMCxDXLU6z8gxcoxGPNLv7A6YvntKRBg+ZM0mKoKD8+DSCA+9K9UpUYTLAd5Zl7p
         ltPiSUgjzqs8A4KZlpRyII8QLzHX9GIjLH1RfRGjn7oHMf5bopGiaaL4YLMu6TpeVd0Y
         dHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285449; x=1779890249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=G1IM59T4IGLKHvrv60r13aEP9YuYFpBMgfEf+jOYsMJGNVjvJIWzDVWb9/hp38tucW
         h63B3FKPR76GWLDel2NP/wahfJqCtDg9VMZa0sod2ouA2rLen6lxq2QyFCcU8OFLAKbw
         zhqWTibfsNTQxfS/HlYJ/rSEF5gAbBV+6MpVIFMFMehVDIpTvSZygVmkPxkv9l1TKv5M
         zUQZcwRl2NMBT0LQ7VbQdhOPEmVW5so/4Apk3tMZ0P8/6Oa74a1xtEvRd62owfvKrQ0V
         aiiwwTIWCKNOGgTQ1XxdoHksb/IDmVq19Bd5bjAXAx17dM2K1N7LDEF0rWQRnLVx83At
         zsZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qSvx9Pr+gCcSFZsT1zqvCCJaJM7PuW9Rfl5NyHp5nnJajU/RtCdD9SmQGmv9ZEXt1l5CPtsVwV9cT@vger.kernel.org
X-Gm-Message-State: AOJu0YzZed7JKzahz5y8uyqxz5m7V5gXCW8bQqgxyQvktFKm8QbR2HQB
	vgt0S5aAPvbLN6zeeAg0fSxhvDkNeCgkKkxInSW0nn+oYjjKhvbrys1/
X-Gm-Gg: Acq92OGLEdoxwEqvG8Trxb9GYi7LoWSVI1C48BLlbQn779bX1JwiA9xJnY6USd/kGwZ
	mLZdflbuBBj33RFyPmzh8WK+kyKvhSECaVPg9JrykpL4RUKHVOmxaMAeCN1/3Fk0F+9GNQsIowh
	iPS82LEdCx9dKVxV8lbsfTkhO15DUGJH/tEuefKLfl/Ig4vpaM+fs//N0Kec/RI+0s06HYBXtxg
	NbNG6pTZle/Cp57IdGGJ6kOYpDFROJkbfPTGRa/Nz43XG2mYVClv+VEz050B6mdvabW3K7hV2Uf
	QYTLS8MMMzSXPAprB0QcnfELZVQ8EsuIGVEOlt801krthtj23Exx8BnjntAyA7GTGVTP1nCFH7t
	787xbS0NYaRomLwKZ3nUuCafzSGQhASHB+RygtGfqIzDJmp6PrnTMy9Q1K7yyX7BDW7o4vJMjNs
	cb5kLiSiZr5BO+KC3JN8suARBA7RJ2QjB3XxKkCsb49V7+CZRZWA==
X-Received: by 2002:a17:90b:58c4:b0:35f:b69d:7292 with SMTP id 98e67ed59e1d1-36951b827ecmr23225986a91.15.1779285448778;
        Wed, 20 May 2026 06:57:28 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:28 -0700 (PDT)
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
Subject: [PATCH v7 3/6] dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
Date: Wed, 20 May 2026 21:56:56 +0800
Message-ID: <20260520135659.1430008-4-jerrysteve1101@gmail.com>
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

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Add powerdown-gpios property to describe the GPIO connected to the
SDB pin of IS31FL32XX series LED controllers.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/issi,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
index 5f22d8b77edd..f33c8305e464 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
@@ -45,6 +45,15 @@ properties:
       When present, the chip's PWM will operate at ~22kHz as opposed
       to ~3kHz to move the operating frequency out of the audible range.
 
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
+
   "#address-cells":
     const: 1
 
@@ -145,6 +154,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -157,6 +167,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
+            powerdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+
             led@1 {
                 reg = <1>;
                 color = <LED_COLOR_ID_RED>;
-- 
2.54.0

