Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796079;
	b=pwjCtb6Pw/TCMpF/kw+3ANoKVVrIp+IwbxBwpYouJWoe2ruf5O9fELzOPhoMPMBx+cKh
	 JDfWg7i3YJL9W7Iav/r0KEaHM2wRawbZTPBPDG/TFs0v6wTeeCBEWb/J7AN+21FyntiPO
	 VKT5ltZcRjr/ixsfmlPjN5GPsswVp9VfUEHUb4++TEeegUr7iJGOw/NhyPTSCyweqmpb1
	 QXWm5OxUiZ8efqQOelpSmf3Z1J7d//fNCO4k7TXegVJjXPpw/DwBnqhUJNl/JsuuGrJSV
	 b+YMGGC5l/0fHW4Mk4oH3GdfPUYIbHS0zviUai0A7J9O8uWsvW+o3lOI0lWHy1Q/njg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
	b=EslREFCSMa0HwHmCDBiHmnvJN17CWMmbTm0NoL252/rpluSarDyhaRqToAjKVBPOb+Y7
	 WPpVoy+G/ut4o8wQVrHmy55R/q06ZI866OLUvORc6U+qal/p5m0+uivc7Cc1N2TjvsgPO
	 cXfnEOalM+pImN5cjly0RnwaHpHkTKbEOrhf7kidL02UMY7KxhzfBcLgWxnH0olAGC1RC
	 Hu9f0hV53EkF1PcjTeqcFSiMS9b0+QCeeGWyhtFlxA+XdXMo1yip/kwSY85m71ik02MX2
	 OGORbZlp6x2OTKX+MER/U3jaYUgYv6pRW2EmrkglVo20T8uhgl3dypi2XkWqZRfpHhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNhd0UHH;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C823F606D808
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C823F606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNhd0UHH
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6169645e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796072; x=1794400872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=eNhd0UHHlwredQE9dCABAE+no7ssHugAHzFNVD852XOpfPGxF8uQ9W5bPcI3+MwqR9
         Cw++Le4R37QwQjXfc7M46J56SV978jsy4//A9Cy2feU8/LlulcdRClN6aPk837nurjgn
         l4TyUixz3zG3gjBQX03Rsnm7rjLh1fJTNlKDUOxYodLhoED3eUn0Mu1xuXAzVGPXWsDL
         dvv50lpMvZDaxqD2yHPFMqfoQ8ZhHJNhlBPenAaQdepaWew5UKtMxAA3Ulo4MhH/eHqA
         FccmAKvd6BxvHxocuIHe4/MNg46zvMZYOffXunaoQYmCQGxfv3vVaKdD1LqcXiY24ExE
         MIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796072; x=1794400872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=oqZX+Orqs2j5c3YoTSibC0JhDprvY3q23fjqnDjkgAy+2vCeGLaVYdOt1MSsUpaj1J
         DOyBdKDl0A2jXNiR+bCDLdlMWnn06C7HxB6+3YVqVAMu6hG69f095hf8EGYzLaSz2jOg
         Zl29IXByXncFeU8lgz/yYTq7MkdflPuJjWPWVJUMA/FTyFOSU9y9UhUT0oIL8N3gjscM
         SQWXJfsv7Z+ZtosbA6LnyDjBJnuXxwcpWXEF/ZkyPnwWH9Qpja4f00PFVrLcoi9LDguy
         oD0wn+pCggYvDiHMpl+PuUFNppkXiDEvWwUN5S4hzxbRArNNom94dZPkjMjr4fjemMC8
         Sbug==
X-Forwarded-Encrypted: i=1; AKwUvBy/bG2osmjkSTkBu3aesSPD2CAjLtOJutdftSD340c/EEgp2MT657n5sFmFMlJLZU6/WukkZKHtsgwi@vger.kernel.org
X-Gm-Message-State: APuU4Z89MzU4s9reypRDeRQLf2OyK7Oqz9oe9k09QtnXLDzplCF/kKxt
	oalxjrO+wUmfT7MDQOihGL7J1XU0tGjt3rbT4AzLsYggy4Nw0YTc6MXz
X-Gm-Gg: AYBFou2S3el7f+9f33w3Tc4BIAlgWs8mPTUnyPpv1rZZbe+5iAWyNFo1emWI+tHchNE
	v5goYz7YPiUUoFLmxkC3cl+Xsy2ZOkVEfIXuEGrGIhby/SGUZDlR8QVYZa/EveuAsHkZCtTICqQ
	rXFUF+pWeDJoBYlgtUV3LTGNWz5CGvA3HiQgZe/pj1MuxmiEEZyzpraDVc3m+P+cleMjcZYxXNe
	WZq7z4DVQ9Lm1M/2d5QqXQpjQBO7jGrDbOF9edmtA5Fl3rWmnPQvTysYpqYJeThENrSyVXXvvND
	KbX2BjvAfo1Izxs5x1E+27fdutNTjsGd9Yj2xn69hs9JmUp3Cbjdc2VkFLdsVfiSh0oGYRtocr8
	9KH7sbzDtsd37qt0YeAWzl3d59PF73vGRJj1ysmakQvGIKcX5/cGH9T/EO0+IwjDklBiuEFGrUL
	qDtasSm0ne5xE1qr9HNYQT0kHdz6+Dn0BLD6Y9sWK4yoCiXPnFKzQcP194bX2iBahMT1oW7qejS
	UlhMOHRW3eVWZzH9o9Q6eButyo3ATRbdYxEeB0Ut3rD73myhPxs91TBRGaWRe5L9x8P5Mwv8p4v
	mKA38IcsCauSFHou6QX61Doe64gbIuprMFPpE0aJnWKaAMUndw==
X-Received: by 2002:a05:600c:19d3:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ac1209eafcmr361875015e9.0.1793796072166;
        Wed, 04 Nov 2026 04:41:12 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/7] ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:52 +0200
Message-ID: <20261104124057.240288-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
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

The Realtek ALC5632 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,alc5632.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
index fb05988ff7ea0..939b1fbf2afe6 100644
--- a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -28,6 +28,9 @@ description: |
 maintainers:
   - Leon Romanovsky <leon@leon.nu>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: realtek,alc5632
@@ -40,13 +43,16 @@ properties:
 
   gpio-controller: true
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#gpio-cells'
   - gpio-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

