Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632501;
	b=hmNcp1QdhBEIGyG2kotEu+XMvLb9w5AVRdFlHO0QCecU3n0uXopwwxhEc5xmtpM5GMZB
	 582DJ7lIWzYkblXd5ee88Pcdq4c6tWbuXqEhXBkw6qHx2aYOrjRb8N2h5lNUKgG3tMGN0
	 guoe+W+VjLdSOD4C3D7PGtjbwDnI5Xz04+N3WoITotPW0+l280OxUOa/HwYO0OZgn40Df
	 fiZP6zrCB5TW5gtqIrxvUgzmqVeUMtUpN4RMKQRrrgj55TRd/wT92Mo5IPfv5XGnH/UYp
	 QC7LYJZcg2972s5aSsaqraTLBFf7CRrDyOzcsMQQDhGx6OW7PajIUWyZ9xOdeoxm3mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
	b=WqFtwZZ1/wmUHJpGHF4uEqPFRZYfFYltHCFKp3DHOdmDKRglv3PMMX/neZWBbkDo2/bH
	 KUHipJf5tnRDtnF13deikz3VK50TvwMlQPWQb4tQcrcJyT5BJGf6hYx0TZiQByd13by6P
	 aMDd0E/W/4b7F5EycnhHRM+AIHvQz5KLM2HxZ9GWcT3U5xcwfEni+wnkMyzUE6UzWffM8
	 RYHlRmiakaegm2wWSOKSiZZS0sAWdylncDvS4FfxwUyeE4Gr7YDWLNpXLmmBJak3/nSvM
	 B7iFqua+V+jBAhO0lx3HfxQVPFtXXYLOvAgk0m84wdiZeL+JsXZGHImgOOPSv++4Jcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lM6jPvTR;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E600606A33E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E600606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lM6jPvTR
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1129457566b.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632498; x=1796237298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=lM6jPvTRh8qC2tVEZxJ68Vw2DXnOsWAPa/Hxyo3vQhA2zAFe/MejY0hAD0zdt/076P
         FRh1bvwBu2AMN0W9nu0BQy3ySoAq7UjjWTuteT5cGjB5LQfTcDnDidmoBlJBCbWVQi0H
         U8RkDKgN1kbmwcXHqPweWxaMcn9IErDkmuE8kCSBog3R+w77Ml3s8pXsI8RTvXeATNNK
         foTTKZwypSgexu8jk9H1TcGqgQq/kEUeYS2i6OO6Zsn4SjEECE1JypvAdZbuI8Tj2v0i
         YShrmZYhrR53MZHuohEChrnpTslc2OFjcXWzQ7BwquGlMo94uuGZ1iiNFsAj7u++Y57q
         VXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632498; x=1796237298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRZdj8OAA5IgBUgIXtKpGdWFleIEtSggcmllPJz2aKU=;
        b=cIQHqAxcJJ/illZjNJcUoe4nmQGfJx+H6lEe3EAUM5fR/zBDivol0ZmvbkCEeRBEg2
         0Lld0bUvJHd1++tWSL7klMYWHAyycDKYVGHM7Gmo9yX4VYBqvbh3z0Q40H7c2flxseKx
         y+XyuIJ0jXEGf/zldQ1T9rwCGkmDrUJdxdqV+H0lf5o4C+Qp0iHG0IQpV/qsgsASYFip
         UWBz0jedrSWTcVzmRjRnTgaH5mROmY/4hgdo+hMFopFL0US0RhNAXHa0y8tWnUzMupk4
         fuG/hlnbCM+SSQVJcS5WzcS6Kk9k49aVmrN6jZi23w9kwS5rGeUZtH2sDMNmfKL7LWD3
         laRA==
X-Forwarded-Encrypted: i=1; AL+hErFX8aF/ZeD5rj/pqI/1eJAo0QokZvZHVIbTxQd9LJGDRD0L3cN4DYDMgaJx4fdYrep+OBwo7fxc97UE@vger.kernel.org
X-Gm-Message-State: APuU4Z/byMwh91fZsK6J4AUc5XQanAXJTXsRDTytFll8qbikgVUxXj+9
	7u6LVIZ2BOuknMR/NRzxTDSQfkI118Q0jg8yUu7wx56BJWEKtSrptyq7
X-Gm-Gg: AZFdTZfqR6dYNHvFW+hahDw3Jcfba53v12s4ygRscCVQoEyLrd6Ed/z+QKwqD0a+tII
	Tw5yKox5OwspfZUw5nrfgscUOG8vn9RfGMqy4ENexcfJfMM1x0X3hVtd7QLaCiVeRYB2/CQ1vKo
	S7L5/RldMWkpOWWGTA41zAUitc8dXbMXyibtvX0AgGkDo+FGVVQBQZ4fd269BkF+EZxRIyAgJUT
	6lTzt9KmElLQhRcV79v2yY+4xWxacReI2d0Yfx9ZeZYoi+gg+tfqxlcajGSKF+FRkwh0JzGFoHa
	8Od7DEDViml8+2dLDv7g3uQTmUFKKcAb/mHY11ZD+2ibpPFIET6ebqVhRT5aisE9FiTZCqBm1Cv
	/v7eywHHvHOzFgaRf87FZCKOjlimGsbcJQZNRG9oMAZZLa3yUisPoeJ2bQ08jvsRhzA2QofzjFk
	EaVOmdbI3VEqBnzA5+ZjhRg/khiUCIaQvfkWmG2UMDB3O3ffuT+m0CEfmo/CuWcatIpzndkwJqm
	J40QdRy79qRw3Yu+qDkQ6SsEyB6m+mbXCLv4vFdQoRdGL3vHdg9ZSkY4pUYtgVUhrot2d/1dWxM
	xw7yAcvIuwE/EYffVUGTmCynjnXhq0wVebSimatYB1bQGjb9lmZ8Kj+pbNmJkCCPJkdEmg1QNGQ
	FIMye
X-Received: by 2002:a17:906:5492:b0:c51:caa:607 with SMTP id a640c23a62f3a-c513ab0c394mr1129231566b.19.1795632498494;
        Wed, 25 Nov 2026 10:48:18 -0800 (PST)
Received: from antoniarch (84-40-239-22.cgnat.inetia.pl. [84.40.239.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm677226666b.64.2026.11.25.10.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:48:18 -0800 (PST)
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
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
Date: Wed, 25 Nov 2026 19:47:46 +0100
Message-ID: <20261125184750.57866-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125184750.57866-1-apokusinski01@gmail.com>
References: <20261125184750.57866-1-apokusinski01@gmail.com>
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.56.1

