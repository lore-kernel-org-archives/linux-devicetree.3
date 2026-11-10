Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340394;
	b=W8gxsOb+0ozjWLQHB2nrNZ1hC0/j7kB30nWvuQ0w1LAsr8jWF/ADD+lug5YwFCQ/CtlV
	 vpABf1buW7yuY9taHehJ0+7PWt70zcwb7Wvq6YAlkeYFK1QWJOagEGGOtDWcvgQMvPpE6
	 GJCQCpXEBxjJ9zBxX2Tj8adjcZWD6STG9wBOr2uvNJYMzJLTcnRaY8csrF6a5BHB/qIjJ
	 o3Hu/ERMbWLQtEztSC8wfR90yUuah/wCqxs7D3/zpB2wB5p9X+hWUKJtLIRVIrWnyQwN3
	 tpziH7pUmZO3s16hlL67xkK0oYnVjuXbU3BatJaE7XEOQEeYo/SsHeLMovsrSlSdtdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=WL9SHgfJTRGu/WBkYdNm7G/jAeYVCea7hdaqofQfU7g=;
	b=PHGmtKNPKH4lMLBs40ImW5yqBxgbR0WXywm3FQuZaFoluTULj3pCBjIwUBoeK0YDEYHC
	 7Bvny9mkRnYMEmGQ5Zj3dWpKmW+Cc7od0xDbuEzddGENNjKMCEDfEixk2pAfVhhzHJACD
	 AtLVq1oHRyAedDMuLs04uh+hy7GvLRuaXO8Wd0beiZdChsXU9ZbjchCynsacubKLfjZzi
	 dRMODn0Kb16yVI31YI9y6BiMZNjzLjPBxrv2staqK0mqHkbKDR8Ihi2NcvG59R+SlahTL
	 amGySFHrkKNvcpMYQTCQgRlu66FThDVnAQz+BiXQQgElyY44KRgLnJIxeH0xLW4/vXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjJdQ4P0;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4229606A339
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4229606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjJdQ4P0
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0d09fc934so301911a91.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340393; x=1794945193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WL9SHgfJTRGu/WBkYdNm7G/jAeYVCea7hdaqofQfU7g=;
        b=RjJdQ4P0TaxJRvRooZd1WV+O6P7NwLQnlInIdiOq9sDBKpRL5JMAJOHc57dvfPSCqA
         F0lcUbi0N8b3V6wddGJbLnWQ+CrqAnzoHBcxgSWkE7/RwgCLDoSRDGfwSN3t+h8vLADY
         t9m2mLl3w3K4OGN0zmD6qLafSjcx/13gHSXwb1zZNh2PFy3C25IChklwawBI3QN3Lm4q
         3l5VovYBJ4mRPYwXWilE4joz/BbiAj0jQdztGoU43KFkeEnvrEFNQniNlMFQk8o7Btss
         0tsYzCEaU+gbvVt21/RK6Bx/c3Gj/Ru46jKDVFqcv17WJtFPaYkP5Tf8gL8wsZbDoBz4
         kYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340393; x=1794945193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WL9SHgfJTRGu/WBkYdNm7G/jAeYVCea7hdaqofQfU7g=;
        b=WNvyMP0cfy+/PR37r20Yvsfg8EyFDYYguXM4NNa7/P3Pn3ZwC6HnvoZgNWvG+5U5Cr
         qA4h8yCORjIwpQD3pUJPP4hxiJyJLLab8XZYIaCfkFwb5JcW11BLTrXtBnv7v7i4+8FY
         WyfZ4QItP6+JyomZJIFxp58ArjzqgIcH+6D27IxAYMfz9NOcnmaVKYaPVm02EfuJv86R
         58ENNXBuLFGydt4pGoF0ywZJHGwC90bkWpSXFJx33zNqJwMHtKP5/YQU1O265FuYxJH1
         +Cu6qDFPHa/8Vb3zZugeKzQQmtA/5k7zZPXWEFbErHsAIYczvY7jDyocJXbOhU5YEjff
         sWlQ==
X-Gm-Message-State: APuU4Z+14rxc/pD8BTaAGUwe8YcOWWBorGuYH+8KiUOqFJblUKwf5OjO
	OEx5N+S8gjnk18ExAXn6UfZJNM2KnhMfuAVx075XpbolpB2szr/kGI2v
X-Gm-Gg: AYBFou1hWqOtq+7hb1zTgfn9QlH6xqruv3Iz84pu/wPaCnXrRwo+FwnmqBNIMP0OD7o
	ARR5+WeIDUzN/xMgyqmaWjDZYVJ7J8oPKWqy+hYfxExSRNtkQCGQmegbMFBXOeS09n6TR0FZcHU
	FGZqcLOCT/tu5DzstYZPDTIuIfE3rg4oM5fdwDY+kF5FuOUgwfQX1LUQC9gHCTDc4KeTpvSAJQo
	blL6/dehVsn4NopUsJkoCnBRAdOXdloAoNILPgD7W5H02C9Y44pYsUDM0PsRI9cqIoShiVNP1Lq
	Vuuzss2Eg5sTTGJls9OTdlwUeOCsG/sh/9GXlPwTDOxgJRI7o0m14KKS+uejScgH2rrDUlfbcZK
	lFcycQ3M0L5Lmo3YdJMbISScd8gf8NGluC7DxIFAB0fMFOoU36X+rPaJHLRZieJKlzFzhZQmWN+
	8NufcX350Oc7dLbe1/T8GWwIdZoQIIajahGQFAA3afNxMnV5MqmPwkXlBXPzsTgvuFqWgMH/Cr5
	GeHucbrspKPtmrsrAi8+IfwmtTjbjbBJL6GFJHGQQjx1z/kbKqFwlIkg+vuBa6D8YwDAivNYHyp
	+ZNlLD5Wu6BeqceJjsYqOXbB/NdOUL9QYf9l2GE=
X-Received: by 2002:a17:90b:28c3:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b182d34513mr149153a91.0.1794340393165;
        Tue, 10 Nov 2026 11:53:13 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:53:12 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:36 +0530
Subject: [PATCH 6/7] ARM: dts: ti: omap: omap4-panda-es: drop redundant
 fallback compatibles
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ti-omap-dts-fix-v1-6-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=897;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=BRnkJw3cHyRHMzMZ0B/KYf4+f70CIw00mFhCF3duqu0=;
 b=aVlp7YfQ2U/wkPFkov8Zzk2jzrkg3QeNdbU342SFwuZTRBt8/vXz25600TLPBSI0VqH0tZZIw
 RjBAOTuggEbDyDKDbUeKrSEyKVEqf1WKVm311zOyYsANoKEGaCEL/FI
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

PandaBoard-ES uses the OMAP4460 SoC rather than OMAP4430, and no driver
matches "ti,omap4-panda". Drop both redundant strings to match omap.yaml
binding.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
index 70c609811d119..2c7de0bb02d55 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "TI OMAP4 PandaBoard-ES";
-	compatible = "ti,omap4-panda-es", "ti,omap4-panda", "ti,omap4460", "ti,omap4430", "ti,omap4";
+	compatible = "ti,omap4-panda-es", "ti,omap4460", "ti,omap4";
 };
 
 /* Audio routing is different between PandaBoard4430 and PandaBoardES */

-- 
2.56.0

