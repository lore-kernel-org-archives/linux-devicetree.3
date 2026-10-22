Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648336;
	b=MRExh8CdL7H6jD2vJ7OU8IaQd65wWlxnBJu3UVIwij66AxPjEEdWD6b4vr+NF9kjPdNS
	 k1cSDacU9Gs4cwv8ISGxlrp+TepaFoAnqGbRK6PkuTndsc6XdNegiSqJmytZgK6UKWAOW
	 91ZD+ar6ALL3P9mco6Am5okQ/h64dHbvIyjLVxMCoj8UXCfzlhI6VDWshytbZY6/GTlG7
	 bkUb4m0+Um9SjK8tVyhMT8VuTgxi93k+QxAZrJlk5zK1nEGrC96CYsJNwafECDKumyWAU
	 vps7iG0ATJeUDgcIQE0B+sqqT3KMW6IxNIT9mV57DahzH4fxTmMOBRgYCQ8hm/eJkXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
	b=zDia/6la3wIEVq9ef/wYZYwox3l9oMOUMcHJMkakrxhgj7AvE3A5CuAWsgmLeu1YNZLf
	 9K8bJgo/o6sZIy7ickwD8DnLD3/wICh5eG7bfauqX/XSQVwpOFyoXSxP6KlePZjVMk2bo
	 WKLVEF33uyD/ryFu3fJD/GF+ZPMmWOy0EsqUW07l1e0UYV7L0jCisQG0i3yQP3X/W2vlq
	 yAUJb7ljIR2THg3Wykxzcj+r52j5D93mZVBk8pEYeaclRWVSiISWM00q1q+Eo63cmgDnU
	 KcQrWFmyL+KHpUbN+irrTFcev5MG3yoRINoIs8MBmQq5EET3Gm/elE/Cc93u2yv2gEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McxzsOeT;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F8C606A326
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F8C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McxzsOeT
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so16521805e9.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648334; x=1793253134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=McxzsOeT3cRyR+H5WlkOR7UuGaGOBUj789iuYYSuvRyZzLlSdZ0le6nFZawvb9e8Tb
         RiqIy1kp/CaQrJvB2P625l8OvYF5b5GRfDyHRJjahSiPONQO2mmh3SY/FDDxX67/cgHw
         KPmjZM2OAngJsLs9zzOddztXf/fE9L1bruF4j4Z0FVX4q0b+481YBG1c+qimh2dvtC3M
         vbOmXia9B0ku91ru6TCdb7LKd5iYpVSYQz2bJMecUiSd22rzi9hq51m9ndtR42VYFJPR
         r+DNnDZM1L5mEEBRuahLHzyWkEoqyu7aU91kbum8/JsVwXg9W7VWCaL4jKuAUhhlyFiw
         7LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648334; x=1793253134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=BQ1RaCBgSExdxs5hmkjVFBMEbpZztoz2Bm5CMZOjDVEd3vgu4mP3bskSCxcjspZzln
         jBlCgJMsuop7AmMh/gCx2oFFntDN/mj3Cj71pOCYmsNkhIPs8AZT1ylcnILzLrbcewso
         L68XzRhVT2Ekg9KqdfviOwxLjFjkrbpCHZ9azUZgHt7plBP+rzhdiB1YRCraVCMufzyB
         QR0Q14/egSDmaEEiHgwewtYzSv55q1kBz90db68ZiNuBMZ5ctfoU6cbfs8VR7NVNHfYR
         suaEwinByLnCw124o5BDrTF9AFEDiBE4aWjx499mT5lNPn+0HfnFG0Mb70RiSUMUje1d
         lw2g==
X-Forwarded-Encrypted: i=1; AKwUvBz285hk1SKIYakOxIquTLWrdZe76SIrJKQtnLbq/MFMtdcvXp6ldmeUPfxyXpE6z1VH3FO5/G3FIE7p@vger.kernel.org
X-Gm-Message-State: AFq9FYKmaypDxWpBsW16iSe1B14PZuzr/JMWQtEgS5Brh6udotzq6zaQ
	EhuJYHR/Oa6oDYD/EzulO7TfLuxQzuMKew5q6xnJzAeMs6Qi0/gZ6qi4
X-Gm-Gg: AYBFou2ahqvpHiWiq99j7y6OExZpVw5yrPqj3dL+bAl1n5XVpTt2QiYNh9RYHv0kzeG
	ViBewj5S+G+VTd61yyhWeZjgYbbI/ajpGabz+v1/4gWdaI/kQwED3uH6XG8wYoN/2d0XtZCT5Ka
	vRqoc3GDcG9bKDIJR3tG9I3OXHr3lcZZ1qzPUHrTmOijolVpVfb/09NLIFtCV5EI6TLG7hVL22t
	qf0bm7Pp+GRbXx3v6565DJwwwlnBgqAqBeMGHq/LtgmfbHXRDC2uluCOo0WTCN7c2ALjUd4EsJQ
	5k1tU8C1KaQuLXa0K/t/edtxEeBmyBIDxdSnNc6BsIhcEVuvfKCuHYBKVFTUQllFziXJiEXDKHG
	7fEC5lruP9P/glGQZUC//0QkQ4P1KsvKFAXVUKoAQddGba18gPunZGI4iV2xhExZ6DqZuJa0Jy3
	EFzw7w9VWJTTomkCWZqol5JHvgy3HQTsSre4Tj0LZR4bW1YiBk+tcjpQwMLUF2xCNPTOjLLyUqm
	+JHC22f3j2ssOtQFukA4yjjdbJShyOqf8QRvxZc0CK3sFPSyPZFxLKX3x52UVLX0qoZGPqHT1PW
	g2Mm1GuM1YlGnbdkf5Yl18KbN2+EJUm9pINFweqM5I+vKquESl4BAPf7hINJlPKRdVnvCxVI/dA
	ChDUKMX0vYy7cTKI2b4DNedJnWKyIBg53dgOFU7vFKPoWKJ1Cv1MwFuHvdxnMw3qDjnu3OQuLoR
	ESjNvR8wypLaP+RtYgRZ9THPOyKA==
X-Received: by 2002:a05:600c:1f95:b0:4a1:e722:a0a7 with SMTP id 5b1f17b1804b1-4a1fdd19dddmr91581465e9.30.1792648334182;
        Wed, 21 Oct 2026 22:52:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:13 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:07 +0200
Message-ID: <20261022055208.17746-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
References: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Hardkernel ODROID-U2 board compatible string.

The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
MAX98090 audio codec.

Reviewed-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..f863803c84f8 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -86,6 +86,7 @@ properties:
         items:
           - enum:
               - friendlyarm,tiny4412            # FriendlyARM TINY4412
+              - hardkernel,odroid-u2            # Hardkernel Odroid U2
               - hardkernel,odroid-u3            # Hardkernel Odroid U3
               - hardkernel,odroid-x             # Hardkernel Odroid X
               - hardkernel,odroid-x2            # Hardkernel Odroid X2
-- 
2.54.0 (Apple Git-157)

