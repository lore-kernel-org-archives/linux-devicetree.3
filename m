Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796081;
	b=Aa0SM8FI59GRmDXRbiIH0hGr9PoHvApSiLfDmIeaqTXEYvMpoMvEx3rYxHxwWCBkGfik
	 10tagZ7PHDZ3u38roqVFfN1UeULi7mVj++MKRu1dVyBwpi+ruDHajRoKcTHra76h1iKjt
	 wJnEPnbEfFqVZAzntUb02noICBzKL/R+pd1PGJodGonU06FePceVT5c+jAwdQUcTy90YJ
	 DqVgfYS1QTbhJd4bTRWWfyRjUMehXnOfEmT8S/1gfxGjdUUXALU1InFU1tvJ7xXo/wdUD
	 USovpY2OPVrAA1r+uUA5omOiXNYdAzg2p+keOPUBvZQLjDKkzHQO3xbGFOe/tF5fcUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
	b=OdGIU5s5uyFK0em033nbpwL4/jFIloKV6BCNmNld0Z8Db0bz9AxLEAwYx1vJkqcnpUM/
	 zBz568TO3X1anW5107CQSi7mtpx1/qmk6MzAqSjZhfhm1r91pmJL5v4bpSFHFOPnfo8SJ
	 wycH6nm5pvfN8L+sXlOSWw2uoK7T0Q3BUoq4uF1CtHPK0FPBSmpS1yk6zc8skJMyvOEoI
	 zX5X0Oly1zrylnGzlp3+Wh2r+t1Rg+4Ag5B4MsvmBkSdITHyb9oi0ofJP3IOyOcSeVLcY
	 bJj1ypwwIIyVNohamxPduPQh+/SHPcymgXw2oAX7DH7czuZWHudgB9uFU2X5qBkrK5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2L77hlY;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110C4606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110C4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2L77hlY
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so4793725e9.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796078; x=1794400878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
        b=S2L77hlY3JFmZzFsMAsKB/5Efv9vC9OzccoH9cJ7Ezw2jZ0jFCFaXti/iQHmqhbrcW
         nwAbU3Z6Cajg92RSkOV9yVzNpWY7QjttNPQjhLfeYb9XmRWyI8o9rWoAfoqV7Ky3qT5j
         +L5QuHt5sijyOSKLYfjfCJaRJwL/a5oKRZT9vvpJgTrfSU9A8gaQHB1KMezWl2jFd6KG
         TxKMIM9S5L+b1lVdRcoiJ+yllC2IzK5JdCnngoGsRHLK+CJeBE2Pq9XCipPJ9oF1KlQH
         2lgc9lVTswJs+yPhXLyxyTTy/YfvbXh3EEpU2o6SFewPxwqAoWY61yFGHDIFLvHz+r2n
         /jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796078; x=1794400878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
        b=lG6K1ek+XDESIUvu1hqU7zB6BnHlv8pv8VZzwlUtxINtKAZLM4bwXtJfg7NwBUGKaz
         IkB8+z+q3WeZGSUxjyf5cVB2T83WysF09nH+3hrpCT7NHfjZ3fJKwhm9M4PULgmQkacH
         oNrIEpA9gqHWK57018F4Hg/jRnr2Y+5qwmrd91r4eqAFYlffC8HXycV1Yu3j9+8U66t7
         S5nlEy+5dTT7X9aFqTBA2XUH1bILwOijJiBj8QMexqMQTtwItyQ/G9+3u/SDiSB0dSuN
         7D/iMr/5RwxmWs1pJrKJ3Ds7Ik7XOMl+Xzv3hw1bgwE5sDDEV8JIWvPP2MDJcbC5CqZG
         M1vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNIydckgq9KjvKULD+BWsXTAA97CPMKO7mls7DbiYqcILUcY/CGaHc8Diu5QZH9g7zIsEteP8H7pIW@vger.kernel.org
X-Gm-Message-State: APuU4Z96cNvjoTIfsa1aHyfn49yzI7SpWjoujSciFRvvAEyFyLABVmNZ
	tdw0q8ZEJZi3F9yirfBh9s24nNclOeNiPwfL6fPPfBJgtQaFMRZHuKNF
X-Gm-Gg: AYBFou3uAedaOKs2nekieWBRlXZoL69v2EqoN9PJgZCZcqVNXBhV2eUoTczYkjpjnW8
	9nWpe56kdxXVHVlAe1UtGLPJ89KU8iClCPxmEU2HhDClk9gGBCdfLK5olVycaIhChj3UygAORJx
	qfMoMvuyge2ydBAnc+A8M4NJjeyX56Tz4EHlB43xtHl/AnIWm2NABbG8oghi+18jUCuRzeMyXVX
	89hmRdrqzVC3X0YoaCwbDKYJ2G/+dyIWy7aDnmF+w2jwqdlrQ0g7M6OxLUm0X4rDvZEMPIyEEZq
	4ybA4DxVUIq4/fSnuJHIDTL/DrohB/eTUaY4spdH4BP0Nf9GnIQPbTP/+TeV+B1JqjPcsAtjZtK
	mms6N0gdwkBLt3yksyGdNaB/FuGEpuXTASXFia4iuiNMFhh8voHFIXwCVSyUdRCnAO+fAFGjPIr
	LvdFrWBl4zWz5rXpJaCs3xs0o7NwLyZBFyIkqkpeJLxnNBFOFZeiWs1hzHswRdaCYIpbvh1MoRF
	Li/VrWKeVedJMHRjP7i9QQ+pWmvxJ+gQKuU4MO4b5rej9EBTxSrp/ssnpv6PP71urhhfvhLPalv
	AoWpsQSafcTKYhl7KpGCXuUYPuqYN9/C9LGQX/xBnmUGcTop9w==
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr363754215e9.24.1793796078321;
        Wed, 04 Nov 2026 04:41:18 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:17 -0800 (PST)
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
Subject: [PATCH v2 5/7] ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:55 +0200
Message-ID: <20261104124057.240288-6-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8994 codec provides three DAI cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
index 0db04a90ac6b3..f367c1ee0a947 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
@@ -69,7 +69,7 @@ properties:
   SPKVDD2-supply: true
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
 
   wlf,gpio-cfg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.53.0

