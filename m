Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918700;
	b=c4SWHEZk9qFB6TGAyHRnJrgyQkb4jULTKCY++POu9zYTeUnq9d/JCFUxOIBD7x0X2pTs
	 xFFhJSq5smzJoiHdJl2djIDn0Jy+nfCMPtZXtr7JmfCn1GOdwSWLSM5ZvKRTa5D8d4tbF
	 r4qvP3+HrsW6/HX3NFC/P0Qxn0HZruKZCM1W7TfsjbuliGbwZXRxEVAF9mKmlKSd8t/dl
	 u6DOS3GU9U84NlWn96ulWJVbc8MQU212KZE4Nt0mhiUgf2ULTkAWTvILmd0xONfqlY9Pf
	 80DgQykcvXUlnkXpMToINTbrd+5gfbaHYrsY3Kuk+5FpDXbrINMagfqgG7tEZVmbgzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
	b=LVsAVqvDd1SFbj+Mf8na4dmSDRQbhNEsgmCIN+UQ2fb95M7NaxQ0/SXBfcwr5ejTDh7d
	 EcXIlvsel1Tk2xOjDjDSwKAXnn53JDVlRhUHbcyNY6ZN4AdJWiK48FEBJCj8E7PBrQSde
	 9OnQKOPZIR+PLQA8gpplU/sUlmRtvKLk76P3wArZqANM2swQmtutKctp1fe5L26GNe6h4
	 uE06HO1dFaSepmg3LXEXg6mkevXev8US4rP2Mim1Y9MbIyMStAvDyyRuHK9JCFZyOWYR7
	 wWN9HouBvSn6hr+i6Q9GHfiS646zdw+M8eSZp9a29nOXlra4PfoufF3qqzsV6Gl299w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0h1zAkhN;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59841606A320
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59841606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0h1zAkhN
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1404827f8f.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918699; x=1793523499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=0h1zAkhNBCBfd+jMzU1ahmkYzTEgQQ7x+lhVNLUYDmjw3PIaPbGtlr0/DJDLJs9bB9
         ZYYAk1ShE6Zc5Zg4Oj/TNh3II9+juLMnZ2qsq+qLNxiYqbDWIt6sJR38LvjuTjy7QJOB
         Rd6HZvQiPCnAUQGNvPIuI8h7tIAjvUfBs1oI8W94xL2A4Zv4RSV2oOZLDG7bxKn177LY
         WZze2MMpmOIYFbs6cJqjJpGefUvmDNhdhQIcgLZK5gJC0LEycMYe7T7wHSmiuBig+0Jf
         gqLamkHFKXvEObKYGGu5MgYVKeVXl9Fqin2rBLu4T1WSt4hYmKSeUyaPNHOUsKLKu07s
         0o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918699; x=1793523499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=DOoQK8Q1rI4R8Gn/3qVa5WTV/Iw9hVjT3dfinvs2Sw/N+IPat3M5YAAhE7US+oozDq
         xEV6zo51HPQtYsjCprHYIC9peQ/NMlgHYH59X6iizl+4wOx2jQvaafKuwMbU8GbUE7kK
         1eFh4PXtJGaniT4uGOBckLR3u0dEu0ZcKi71ov9VQjP/wCBwKCvmUL7fTh9300VLhato
         swMLwXQx47iinYvL3oPDV7rQb9pr2wVeoxT4D0PFHVzwKHxRX7B/NwLfAqVoNtQqpDvt
         AxJDXjszQGHa80LjdF9M7RnZD7EoYL4GG2tFPxKrcEtiFm4EHNwOYkWqTl1URVTVWNsg
         W++Q==
X-Forwarded-Encrypted: i=1; AKwUvBykLPrQqirS7blCm52q6Hvat1d6N9/R5QmfjByqwj4db/8HtwKnsVE0nl666FZDQRVOO5s52pbAd880@vger.kernel.org
X-Gm-Message-State: AFq9FYI5rCxp09kDPgPWFhgXar/85ay9Oe8MHaBdIiSFQbmnWHP6Kr/J
	MrtjU3d+bgAtOewNlhk9xA0UP1UZrqD2eot/oydNKp7vtlBs6NmVndBHC6I1G98SsWo=
X-Gm-Gg: AYBFou38MwtXnwlz7IPUkEdIE2+jZ/uKboY9P96KPb3CVgA9TL14Ls25itHxN+E25J/
	qj4kA0DQ8h3eIDGrqqXFDieFr4GvusgUJsjQcuudWX7DOcgEZrIMHn/htpog5+g9ZZ2MmUkgDbc
	ndBZmrHkyMNhbPN9UnzmqqmnuPoU46tR2auY/kYbL3gk+l0ODlz3j3+IQiEgqsx++Uyr4fGv6Ew
	nqVLDZSeBv4r127GoA86vAPo6yJWILGUu9WItumlxkQE5QqRWcK1ojwWodIty2DVD4phLlpuxkG
	+WnqrrRjPjlskjWTK1syk/pshf3d2fEOBA1uhmvYZRNb5tkkdHa1cE49PImirNya7L5u+DjL1ys
	nsMrEueKhavsJMKqzvF6giLw1wrTgoZjNntEree2AB/o8rIgkghjvqHLBeiLMFe6NSkYdORPm4h
	hDNl+IdWuSWRJvoMHYXawLnDl4zLkBY0utedYvDSUnpdRr51RTpJcfVxqyc8rl2Lgglzx+rNorQ
	F/AqFeBkuiXfp3e11x+rXULagKQJIeT5HBLq4Blm9JqAe88d1yYKSV+wGjQtx5P0nsAZnoHp5HV
	4VYKOKT9aVgAMRFHymHMO0ARNYl6imqtlYSO5qEpmO+Aad6OMdKtyhrdxwBe3KcFKJ+LAnuawGJ
	ETzCgtpRGKUqsXHBJ/us=
X-Received: by 2002:a05:600c:5248:b0:4a2:150f:15fc with SMTP id 5b1f17b1804b1-4a35ac91242mr67013405e9.5.1792918698790;
        Sun, 25 Oct 2026 01:58:18 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:18 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Sun, 25 Oct 2026 09:58:12 +0100
Message-ID: <20261025085816.60405-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025085816.60405-1-olivier@mgcrea.io>
References: <20261025085816.60405-1-olivier@mgcrea.io>
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

HiBy makes digital audio players, among them the R1.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..b5bb11c20471 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -722,6 +722,8 @@ patternProperties:
     description: HEAD acoustics
   "^hechuang,.*":
     description: Shenzhen Hechuang Intelligent Co.
+  "^hiby,.*":
+    description: Guangzhou HiBy Technology Co., Ltd.
   "^hideep,.*":
     description: HiDeep Inc.
   "^himax,.*":
-- 
2.39.5

