Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909237;
	b=nA/uwNoLjeODano9oYmb++BOT3ueRfU5u7lAExH4rm+Ay1flpeENIGzDeCYBqeriU3KF
	 8fSXwZVOhT3TPxfS4ioHZ1PkjlT18IL+aHjBrujkNoivZf9lSgFcgUrlVqS96V691MqUC
	 gR4ykaxMw8Hi80SQ8yi/VSEOZDOO4lgZi1bPxo9fKlKf75n4GbQTniuwBALnyzllcckC5
	 p7l7ckytbqMNczulxdpzJ7iwdF9gVNeatn3oZdW1d/ibgqucluAA9BFFrgVqGCTRf2/kB
	 hVOm2akzBLKxj0aij9QjM++wtvu/t/tUyhe7anf3QigxuD5S/gTonF5/Hbx7i8qUtvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZwrKsB6tOpT/G+EQ3qCbOkWdsaYoyG0ZDwls387/DiQ=;
	b=DH/ApFwlZdl/wTtHWJeO7quXe9uZrhvt6NOA9PiWIFdhEna7AvVwfjim7WTPTIM5xkrr
	 tdIeYenElBQy2gw8tL/rMbe2SGODdciNoXGfbw1MPsmEb0GngVsmZJ26tjx7+ANu78QkB
	 uQtPCFutLCL9EJ/3qABrJYChaoIbHmRoncPt0puEQqol3RijtVgwoJJExTumDW++IAh+/
	 uGfh/abO0KUDppTPuDLHwHI5dRwBIoXEJeJ+hd8JA52uUroUL0LNOuEr87BTl0s0+b/Zw
	 X7dSO6fkZ1hgC3JvA5N76VFNf2zrBZdzFO6fTwnK97dK9yP+SkIVec3oMVXxn0vtY/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHgnd0Yw;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0D1606EE9F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0D1606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHgnd0Yw
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so21375375e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909235; x=1794514035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwrKsB6tOpT/G+EQ3qCbOkWdsaYoyG0ZDwls387/DiQ=;
        b=xHgnd0YwB3pVKxQKrb7e1Dxdlxiafgo9GQRfOsdPZr7HAuus+XL5JFG05Yxw/pNIWg
         kY/rIy1IlI40ze6PsdD0U92wi8F6AoC0m9dIAXPJWrkj+Ys0WZuXWhkA1Ept874kB29X
         j4HXwSVEKoiekoKMeShmaYyF+YE/odF5B0EICZM1GCeP/I9h/mBBKouctuzMZI/wuaLg
         HI56tMGrt3yDDoZsvSVOOOL80AzwogojKRkey3o3z/+WZo7A9Al9TZuAwTz9dr65H+T8
         izYXAm3RXgSm60s3sU4thmzgOWXZye3MjHa68XRvdut8E5UWKVJJwPISjCRPGoPH4LCb
         uloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909235; x=1794514035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwrKsB6tOpT/G+EQ3qCbOkWdsaYoyG0ZDwls387/DiQ=;
        b=lenYB3j74o+ZGouD7vtJkjxWJZimNg0f22NfqiRjpbxhXjGhxArPeW6D0uqA7LgdWq
         asI5S4GwrBp0Vi7NKvCsGKPqRppmU+Zm//5cRXwknxK5OfscyIbDH1whF5jty+NSNZD0
         fRwvy5FAHIB0QndH9HjJU9PXGz+CL0TwUn42mjX8Dt+z1ca0snR/iBgEWY5v8Q9NCPLz
         Xd6HFsTRZ/h1SsSxRfnLAtFiU8omzJmfebN81bB6EtERfAAt8ZplMOVRSLUkS/yDqfKt
         fLX5bgDktYIYuWzHIE1sUKmjXc2a4hbkh5gA4LVK9+86tlqkZqYERBV4YANUE/QZhT9Q
         q+Jw==
X-Forwarded-Encrypted: i=1; AKwUvBywQT5zlVMcxDgc9AJq5xHRxEoIunLeziNUpl8/Jiv4TwGfCh+2L1E/NK5DXvhtAXs5GV+uCQLaddbi@vger.kernel.org
X-Gm-Message-State: APuU4Z/DXCMH/J5o/KU8jXmuV32FbxCvteEj6Wt/Y58w6xpi4Y2YzFlI
	Hevfi2baOc2q0+Kqc4TOpGKM32OgAuLfQrqnyb0wqqoZMV7zm8n7hAzp
X-Gm-Gg: AYBFou3Xarop//WNQ5Its0e/b0s6eDzmDUa2W17PN78DEY9xF2/UYN88SWrgYcAG3Tm
	0kaajERk02/PHW96QVru0iGXaAC0qK8B8LpxxzBmtd7cTc74PUHPGiehxWg0J8EGuZOPR9FxQwT
	vt8ADPNh7jlITSKXUCVqdHmDoW26Kv8OGmVVctUT+sVlUyYc+FmKsq1iCnugROQo0s4Vi9Tnurg
	I6dOwNwpHEY7VUU3rwaL9T/hvbufP+gpavnvc4v0uphFwTpl+/20D90i/J6DJ7fz9EdC38V1lzG
	tMCQKqyHc/IoH0Y2ezyQpO2Z1PrBucLaiwYE/lFhytDgqropIyzmzpOk2eIxBZe5+OHMw0kPdVd
	37L1omrkhMos54rSleaJrzxpG44wyQp0K1wEXffD1wcWqfZkuylhMNNebIgDOQ2QMHrw3pF08XT
	f0sXVMSop9SIdwHzEK6ULY5H6fNMMUQFvIXjipjX2MMFr0x36V2MBO0HUXokqFqLjjb+Ij1TKIw
	v5oONITq5rg8R1BThrxbpDgttDxCyZGp5KvU2zuai5DprTYSfAMcCjWauTyGaM+H4gw4ESZCK/1
	cS4/szI1D4L/t7CjlXt1Sj7Y/bmfpEuvW66CoJmSpZf0MpCnfo/ZPsmwnRE=
X-Received: by 2002:a05:600c:6387:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4b6de1c6450mr3686705e9.19.1793909234959;
        Thu, 05 Nov 2026 12:07:14 -0800 (PST)
Received: from antoniarch (78-212-29-45.subs.proxad.net. [78.212.29.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm131671835e9.3.2026.11.05.12.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:14 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 1/3] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Thu,  5 Nov 2026 21:05:52 +0100
Message-ID: <20261105200556.34240-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105200556.34240-2-apokusinski01@gmail.com>
References: <20261105200556.34240-2-apokusinski01@gmail.com>
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

Document the TX and RX DMA request channels featured
by the OMAP I2C controller.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
index 58d32ceeacfc..ff946fdfaad3 100644
--- a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -37,6 +37,16 @@ properties:
   clock-names:
     const: fck
 
+  dmas:
+    items:
+      - description: TX DMA channel phandle
+      - description: RX DMA channel phandle
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
   power-domains: true
 
   ti,hwmods:
@@ -93,4 +103,6 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         mux-states = <&i2c_mux 1>;
+        dmas = <&edma 58 0>, <&edma 59 0>;
+        dma-names = "tx", "rx";
     };
-- 
2.56.0

