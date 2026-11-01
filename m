Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543439;
	b=ftHB/ZzAQK0cc1rmylt81STa7mYJKrpc5M9X6gozB2CFmycb+22hkDZljpOzXaDJKLho
	 PlHGG6r2XLqHLNflC3dCaK+qftl8FvW7Sxyvw5WN8bEYW7yAoflSN5ZBSoxHn6SqmJBhK
	 HQ8yJ0u/t2w8hoQ1OwQ9DZmpkCaIOuYuWGg32t6iWuU/hyNPA2DyuqY0rQk6268EGBJir
	 oWkItD+KcUmdSqQ5d5aofT9JBdOazhlfsY6qb0wVY00XMnuUYwjWDp9zibmUPNnyrZEfs
	 H+yW3xjrE0PemYI0gK55UhrtF7nZIZzceTgKbhhow0VOlwcJ0+eYx0FhQI4fxMgA37w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
	b=ptKa6EG8/O8yFAMaHcVCZhb5+utdvklL620OipjIGQvD7ecfGAqfE/2+9RBQagYnj0Vr
	 wnKcl3UlxgXddwYq9GpbXtOwMQdgc3gXyRTeWDYT4sg3tmRHQcocPwaKYGcllbyz8i5wd
	 WO6L6DdBiHLsNAG9tW1GAvQKvbRuWqMUM19KELzaH97V/0e2rzOvcjTrVEEW5b73FXKiD
	 Yl0grwG8WwAdJXXZYygCjUb6YYA/KMR74hpsG81teMSi+JPJIKpGqsSC+6w3js/sJaw8Z
	 iikHyk1ccrnM4pfyMxQkbAdG2RUHlInz4S+c2CVnGpWWInyGbCoiWXTlGeA0bSE8kRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyXJcmJH;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82612606A325
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82612606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyXJcmJH
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso18474345e9.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543438; x=1794148238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
        b=xyXJcmJH5wPsOL72onw5F0BVHspNB6fuOYfQQ2Wjiv+rYv3SQHyW6LdOMQTp8MEwhs
         kh+AalkYom2n6GOMe1KJUigZ4UrLRFvojVNCiq07f3Sl8tFSafUlMjsAG/lNtHO4UONB
         gkoZ4e3N6Ylz7HjqRMYK/Mv3bR/9WCzybaN/1056W+yV2Rd+74WmlsiBvQqK+nabX5kX
         etWqijTGGhorbsgh/42yDc5tNd4KCnkErlmB95Dd76Wrgrt6zo02Pc8n83UtgHc8V6zY
         TKTd4yT7eUCkdwBu2RLLwcx1qYoRWBdrYEOczbSraAtzkOs4IqknsrFLC7Rz7kftSv3C
         wJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543438; x=1794148238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
        b=YUPaH258FAsMLSYge6nMb2UKSOXU6u/hViTkeoEHjcWqsbSSTAYdjGeKkjd+ncIgpl
         U+vjHQplo+as9g82EF83ALCs9IVPcjDJXeBXXDZOzgTsmyuLKlOAcWQLSSd9y4nlVTCn
         diP2TEfM0rUjwJzTopVQYPWfc2XwZHKgjus1jhufGZ9pCc36bCVFSt9kiqC4/Neop5+8
         hql2IQqer7+/pKY60b6RqJSFo+9uxOy0HeAS37C/4xVisD5l4RB4+BCkCtt3DN6kpiws
         MtrQTT+yP45u1Wla1iUiRZOnVypeRfm2XUZibnSzEc8d/oE+ldMGDQgHgKuBs1MNlPdn
         ayaA==
X-Forwarded-Encrypted: i=1; AKwUvBxAZLZJvH+peLzKxPFwrYki1zWXwdT2IDJPJorNT/jetrDP08RXBpLeqa0pfNcyl9gEMK9kHq0OGj6u@vger.kernel.org
X-Gm-Message-State: AFq9FYIcewVsgR9yHWKsUt6nuCZr9K6hhkvk1AA5zonLjl1i5+2LTLVd
	t160hFzS5ON9nf10gAxumhRZY+OMoRXBW6+GQhClDLyfHBpkCP8zEF4M
X-Gm-Gg: AYBFou0oMxTnSWHYEDeNAWqfZYeyiGVak9vQxIDJPqiqpsTXdW270BialZ+AuzLJ1q8
	vG0MHLeGLnL92QNpYfDST0zx+bJZ8w+HiAyVn41Dcu9BGq3miwhiMXe4so+R1ebEZYwfKhHGyM+
	PSKHRy07F+K+F46GtRd/ApD7sLza1bxK44u7PWLIO2VVMwJYM4fg0gIEvxTXF9AB2moYNLpzXAj
	csfFNoL1P+/r/jaYbCnUekrnX09xDUbcvZeLi3C0oRPbD8bXdwFfSmy1LZHbb+8uWgLPQb+dxqT
	ELrZ/or0QcsHXMh0xUY/vRynqla8Dmr1Sn5/FiVbHsMzXj6Ez4/7ayEMF75TmtFHFrac8CB0ybU
	cqyOCUJEZ3P4kY5+0t9tttL+zUbXwh3YjamatF8y0c8wKqLuA3Fdbk0vKHjDuu7cSZcYlk2WDTE
	9w0H4Ziv801r5ymG1dH/BQ6ZonHdRJuCRXRNAtsy3NMs/f7FUpZ1VMQ0S0HSxcVQJC1b/6qqgcw
	5NdNSLlF3tAhim4ABXwSToHNg7oObJRgyvLqmOi/aeOuOcu7zXFsRUe5PVbsEVKtW0YwIB9nhIl
	3lrk4NVrxNyYYnGoRVzbMh6W9YZyvsSHhggIeWxhAsdJ+TFNjXKB+lDHhkafIeQ7adKHMh5QL7O
	C0MViuyqvydFWAuRqIdJcEXwsLrVw9HP550anZTvdlOjm
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr176697105e9.18.1793543437845;
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 1/2] ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
Date: Sun,  1 Nov 2026 15:30:34 +0100
Message-ID: <20261101143035.880469-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101143035.880469-1-romain.tisserand@gmail.com>
References: <20261101143035.880469-1-romain.tisserand@gmail.com>
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

The RT5631 runs from a master clock on its MCLK pin. On boards where that
clock comes from a SoC clock output, the codec node needs to name it so
the driver can keep it running while the codec is in use.

Document an optional "mclk" clock, as the realtek,rt5616 binding does.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44..03ee25e1eb 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -45,6 +45,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
   port:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
-- 
2.43.0

