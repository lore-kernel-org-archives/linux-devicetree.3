Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A87F30DD2A
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 06:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048754; cv=none; b=JCLXTiacSMA+X0Qo2x7ls2Ixuy7mM88ZCkfX1jSmjd7yvWqnYb+K9QtQ2cO2JiSLvCNoQt9nFxCtmobf2Ep6I65cWyH3fjpnmG84RTNRZKaASvgKcqK8lvuzD11h1F3sRwHjSg/RpCMCVvjFSwskbLodo9mlkctnGXkjjlsHksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048754; c=relaxed/simple;
	bh=Od/U653CYr2uV9LuMXpvcbgLnqmkdoHQYdxApWWdjZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZ9ziIxvd7AoL8Ljulq2Z0kS9Y1SN64KhPKUuw/GcwmNJYNWBTz2flf+21Yr4mSHpVBppUeILkubUH6FSUdpGnBZ9GTxm4pZ0ePkUiwIvGOhVWNzeI2/EdBYspNp9hze/hCdjEa2cc+0NrLlgBpg9WpZYSaZ2xB29J1xnfsJd8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfAHogCU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfAHogCU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba6485d219so7688735ad.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 23:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778048752; x=1778653552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzcBT6AuCoQj4AfTL/xvE8aMkT5NRGY46LoscvrSBko=;
        b=IfAHogCUZKTr1Ex+uIwa/RXDGWLDI+IuyJbXJVstEKHO3qX0vEBriraYhiMjys/SUg
         +0s3eTGhufuF+vntKaDWsy0KQq6u6ihxoQFdddYOLUKuTZkS/ikFR1Loen3vp0lmSpXv
         gzywcs/59rvTgl693za8AWD8ELleD683W6LLXyp/B7yrurQDzC4IfaB4/ITEwH14ctM2
         W9CfxB5iNkX85sfUBw+mOWgKacHKCznqDZp0pdiAm96qZGiAW4D7pEogUm8nzSHjDL4i
         gySFJ4mWpy2BNXjoLUW94myqCO65O2ZWT/ZEIG436n/SiH70Gfxc7DBJqku9WFd7yvm6
         gbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778048752; x=1778653552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FzcBT6AuCoQj4AfTL/xvE8aMkT5NRGY46LoscvrSBko=;
        b=kQJA5hG5WkqJZVKLa/nRgKLcHIPlN/feegm9i98lF4voal+W5CFn/++WPib0ZNVBwA
         /VMyIoDFf95CrWz9wCyAW9oaWMwrbhyed34cvVn6Mr7rDwF+SzV+vSncW6AvdTOhJM9n
         oyhtYI11mjJb3nAuyHZZyr5VJv9J2h18oOVYmpSazaCUwP/QLLUlTN4443j6xwZklSw/
         5e2EanhMtZFe9VdGN9Ipj9VzS1BjOGCEK6ILohNFc8oWBsewe4RhoU3JyBwe8nOBuMdA
         oZEwlMBZFD9v5rFlrSOONr+SIAU8321G1zB7gb4UZLKvwnFXoC3g25iM1DwiSLVfgTI1
         +9uQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jLuYkE6rPBPH0nnWoxYiyjNAdA3B5VX+E5dOXYZphNGdJfTZvh7n8TaxycoOuYcOr8QPLB0jKxWYN@vger.kernel.org
X-Gm-Message-State: AOJu0YxA9DXzRPzblVeKZ8MWQr4FTFgixLHPjOpuSuzW7PeH9EX0ElSK
	DJsR0p4LuhOxYW30PSmcogwV07sb6DhNE8k+4M07G+BQdjt78LuZvciF
X-Gm-Gg: AeBDievrTSS6cf/zgFpVyubVJebk73HGdPPd6JveKQ30k+rUnoxCp0c9xxR1o9irr+h
	IWFEbSTFyxqqVFkO95J88Ovqe7Pu8DWK3d1twry4f6OoPj24PziyHKK1kK/LhALdJxcM4jZOdO0
	rTHpdOPm1M7cqMC6hMwMSRXEks6b5KngweOS/Qhtc6bn/7SyudagVLl56/kY7sKKpXLGdyrg7ir
	NIK5uDgbaRTAialWnIAN2TTwfI15o728U35arf1TdiuP0oZMJ/DOGP+T1lOGwXFxKJLoY9qsvOp
	CSsG+kytCoAia3W1/d0YfTx+dsIG8Shz0TmQIFp1AcVlMxdm7UTZy+ddnKx6jwJx4aURUjx3YVs
	HCF3Hzywn2yBtDxzx1Tb5UvPMuNlP/fY7Td/nd2V1SW4FuFv6TlqA/PCs+nvqbTWvMucNllAAim
	cJb6ixHliT/3o2WQKaMtT6t782gFKYwhaXs1Xev6DWVkIWaJkbHoYPANxOsTH3rzn8IvjZBuCd2
	m15itR0jIaxp6sfctmpvQ==
X-Received: by 2002:a17:902:ef11:b0:2ba:60a:3108 with SMTP id d9443c01a7336-2ba79bfcbe3mr18857875ad.34.1778048751750;
        Tue, 05 May 2026 23:25:51 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7bd2ab2esm16330865ad.4.2026.05.05.23.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:25:51 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Wed, 06 May 2026 14:25:37 +0800
Subject: [PATCH 1/2] dt-bindings: display: mayqueen,pixpaper: add
 pixpaper-426m
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-bar-v1-1-12195406f4ef@gmail.com>
References: <20260506-bar-v1-0-12195406f4ef@gmail.com>
In-Reply-To: <20260506-bar-v1-0-12195406f4ef@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778048746; l=2408;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=Od/U653CYr2uV9LuMXpvcbgLnqmkdoHQYdxApWWdjZI=;
 b=2Qc4tvZiVcWV5lqAfHk54NzvvVQ3T+uZL7e+d1WtUUUKEKKVI3LCqKOoMzvTvk9NeO/rj6nqO
 GlAsPn0m1RSAX4zo0ZoPEGlq9nDjsjU3OCUwiytCaT3ANzFipmn8Chc
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

Add the compatible string for the PIXPAPER 4.26 monochrome
e-ink panel to the Mayqueen Pixpaper binding.

The new panel uses the same SPI and GPIO control interface as
the existing Pixpaper panel, so extend the existing binding
instead of adding a separate schema. Document the new compatible
string and add an example node for pixpaper-426m.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../bindings/display/mayqueen,pixpaper.yaml        | 25 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
index cd27f8ba5ae1d94660818525b5fa71db98c8acb7..4b0db2b079ebea244eb149a52ee1d8dbab0f60bb 100644
--- a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
+++ b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
@@ -4,22 +4,23 @@
 $id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mayqueen Pixpaper e-ink display panel
+title: Mayqueen Pixpaper e-ink display panels
 
 maintainers:
   - LiangCheng Wang <zaq14760@gmail.com>
 
 description:
-  The Pixpaper is an e-ink display panel controlled via an SPI interface.
-  The panel has a resolution of 122x250 pixels and requires GPIO pins for
-  reset, busy, and data/command control.
+  Mayqueen Pixpaper e-ink display panels are controlled via an SPI interface
+  and require GPIO pins for reset, busy, and data/command control.
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
-    const: mayqueen,pixpaper
+    enum:
+      - mayqueen,pixpaper
+      - mayqueen,pixpaper-426m
 
   reg:
     maxItems: 1
@@ -61,3 +62,17 @@ examples:
             dc-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        display@0 {
+            compatible = "mayqueen,pixpaper-426m";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            reset-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+            busy-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+            dc-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1

