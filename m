Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A773DDDBE
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789078364; cv=none; b=WRGBkm07Dv2xED9GR7YBraudgkhSeI5yKMVvLsUhEgIa1XiX2ihJWlYLmybW/quYWmwRxzga3Wpze0bhivzpRLO1ca9hrAeMIELFOFMn/3qsNwAFMjkAQun352Fio9Qaq3/JnYYxg27PB9anjNZyTBjP3IZvHRyKDIn0FE8bhzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789078364; c=relaxed/simple;
	bh=3NlwmlgeR9UStztzEJOa5XxE0OKSg9rGXxb09yHnIZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnQ+S/UWDYfCSBtbpvlnScuM68vDyKvglAb3JxBm+VLvmmhvtHVH3O+7sDjJ6COBtzNrRcbRxX5sXGxnIGXpJKWt6tf+XKynVIvkw4AKBZd/XeRIu4gmhdjtb4g0iJCY2TY7myObIiHZxvwzzIYfZPRpyhzur/7ltqx+NPuxkLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STrEwEKK; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STrEwEKK"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab16a9b0so24247a12.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789078362; x=1789683162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnvNRJTUsdTr1CADcV3hYsbAspY/4YujciextqHo7XU=;
        b=STrEwEKK2ioQFBgMIdG1IkLkN5wi61R1ORecpfnEQdMmxdvR8yqJEELoLlbyefQQUR
         wymqfJwsNL29zliR2t/NHP+pzYw/MagJ0xJyygiC4h/KkgiKkDuEsI1UTf5ywmS5Kc/X
         AIDrmrqZVJ9BZVuwcTpz0nTREQUtXGGjSu5MKQBcLVrOFyQ8Ze6FAY+sPyeqHire4XLe
         KEhXpM9kwANrPq5HMhaybLT6nZlf7g3NKV6jSUYcPU6ztEQa+ElnuOc/eO8zWC/H/uSK
         Zz7hTNv1S7hj89vP4cCgDsLUsaOIbnY+0OimHHWBAmDHapV1b23YBUzslWYldcO1JgmV
         Xraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789078362; x=1789683162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnvNRJTUsdTr1CADcV3hYsbAspY/4YujciextqHo7XU=;
        b=W5tmBlmMyZJ7Ln2MBF5Lk77g1q1WFLiuGXBBKIFbPQe0OMyXurSGgzKHFj39q2GqXk
         a4faoveTmX6k1Nd3LCCOlvlIqdtA09A3+T/VkHPHWspbpV5t8/ghvYoqRbNoMEXEmb/Y
         DYkBrmcLDkp4gssH6pA1qr7OimSZzVxRknIvhSOD4UKkb+C7OIrr3W8aMzAEW3cwkP2Q
         hCqtuHIoPG/UYR/7bt/sSZ9zUU5biugKm0aJlEk0FEbmt2eymvzlCFV/UKyspjMw+u6m
         3QPBtAZN+naFdg+CVwBqsgRJPij7rFbA//AUT6qR05tBrqgfyCjVc0xMSyMKOlHhKGgi
         m24g==
X-Forwarded-Encrypted: i=1; AKwUvBwmWoSn3OjSIQ6ARMCTGl066hmzTgh8BS+cfp/lsb2YcuA4IziV8Jn7S80pLRVoAKukqQbfiBPGNhu9@vger.kernel.org
X-Gm-Message-State: AFuF++kMyNyWqLamV2pbM8vrm5pBuXpv21NQMBBuRWi7w6EtdTRVjLXJ
	ZnyqO8ORTxTySsChxpYTLc7ugeb/eQ4YcjEe0Zlg3oDY6Xj/mR3rD1sV
X-Gm-Gg: AYBFou18gGjz34s9mM7z+zN+C6xCuTXn/jHO4mDx5d6cZq5RtpKYrAF0yZpQNmIIvIp
	NJOnF8i5uavv9ME/lWwFFtYTrtx/b+1IFsLKHCE2F1iBrXfdbGuAv9CyVWT+ZtMNldOIvZMIwQD
	44XbzB/9ca8lJJRgzlBGjqjaNT5avAORjaLKHcOKUDSKyjgIgGBYhmD4HnprRzBfpQjd6eYuenT
	9uvKqT3e0Buh4EhaJGG0cJeT/n4mMB7ADI3Ftmqr/+chp966zU9C98Oef+WzV9gNjKWuzz6nBUH
	8yMCg2iqrEefy6rEQrnhFQjFvwzaKeBLkZToBvqPaZhIZhzz6xxlyM/XHGrSm3tctIBC427XHg9
	TNTsZaqCr8rb/S1e4zr5aOt6AEapiJ4bBJ/EiEL33mgnLIDsXabQLUspPL9pLlwrwhFmT3Zgm55
	raaMr1UsFzlirJmKuvdiotCB5cB0sdNRoYz4mnHEZMkt1GsySlOSZMytKyeP8HQNW/D2/imOxS7
	EGKDWCiX8QM73BoczejAbI=
X-Received: by 2002:a05:6a00:4994:b0:867:8d0b:6870 with SMTP id d2e1a72fcca58-86b2c9f2b7dmr719905b3a.0.1789078361469;
        Thu, 10 Sep 2026 15:12:41 -0700 (PDT)
Received: from [172.29.212.252] ([2409:40c2:5426:e355:af9c:7683:e7ab:273b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291bf622sm171875b3a.27.2026.09.10.15.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:12:40 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 11 Sep 2026 03:41:58 +0530
Subject: [PATCH 2/2] dt-bindings: crypto: ti,omap-sham: Add OMAP3
 compatible and deprecate ti,hwmods
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ti-dra7-omap-sham-fix-v1-2-c430f01b4e13@gmail.com>
References: <20260911-ti-dra7-omap-sham-fix-v1-0-c430f01b4e13@gmail.com>
In-Reply-To: <20260911-ti-dra7-omap-sham-fix-v1-0-c430f01b4e13@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789078323; l=1381;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=3NlwmlgeR9UStztzEJOa5XxE0OKSg9rGXxb09yHnIZY=;
 b=rzU+sCzu/3EItdNAPicMXqfdZGo59KPgmNLWn2f1+uGHccQf9SFGCu3tf6TJ/ZIMHM5Pk4OoZ
 qWogz1kZcxJAiWMdPiaIu6KW3IPg9ymaLWHCxy8AEtTQegE25ifx//V
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The OMAP SHAM driver supports OMAP3 SoCs, and "ti,omap3-sham" is
actively used in existing dts. However, it was previously missing from
binding. Add "ti,omap3-sham" to the list of valid compatibles.

The legacy "ti,hwmods" property is no longer needed as TI OMAP mirgrated
to "ti-sysc". Mark it as deprecated and remove it from the required
properties.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml b/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
index d69b50228009..3ef05890e13a 100644
--- a/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
+++ b/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - ti,omap2-sham
+      - ti,omap3-sham
       - ti,omap4-sham
       - ti,omap5-sham
 
@@ -32,6 +33,7 @@ properties:
     description: Name of the hwmod associated with the SHAM module
     $ref: /schemas/types.yaml#/definitions/string
     enum: [sham]
+    deprecated: true
 
 dependencies:
   dmas: [dma-names]
@@ -40,7 +42,6 @@ additionalProperties: false
 
 required:
   - compatible
-  - ti,hwmods
   - reg
   - interrupts
 

-- 
2.55.0

