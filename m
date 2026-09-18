Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6192377023
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750484; cv=none; b=ePufLPJltULYAw3xWFYBliobXCuSh+ifTJ/otHBeCK1LY0oLC3YU2znY+uhgXgFBCMdk/O9YJSHwQRou+jFz1RuVdDjY0Ku5NNjSPdveQ0u68A9ItvljlMLR98e+K73IyRzGfrCg6MZ8F9U1GBelz22reNRqnpEHe3tOeoZlJmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750484; c=relaxed/simple;
	bh=ZXJS5JzKrOR11yrKsPhvFOiNFDXrOJb0Qlf/cDD/4pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHu1N0mbM/0HQDsW4ZEfVET2X3fvCGlKgWBd3Hi/k1pb4CI/fwccb2KKgTZGPEUAuQ8oSgO0ybDQXqPPKK189mDlaZWFDPOOSuDHEdx9bOpjp+kAyvoLAGeP4cnPb0pC7JLFYA6ESh0N+hx+Zb9trLKx37O7ABfTE9EZ/zms0X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRXQ/oDg; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRXQ/oDg"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so739184a12.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750478; x=1790355278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=lRXQ/oDgPn5tS51PoVHVb2O8Dd2bli/P6S60MkN24vkv8flPtCFwN7c2jUHqqsBMc/
         UBodf/rDZG6USnbDwczYT3mqO0gfzQNghgeB0FO4rdSmRlOmyhVmUPrTNLAkmoHFPY3G
         haXt40QZwmeCmE5VPHZCOBoYghFOrU2LFHSlgigfLiaZ9B1WwAME5+9DhidQYMdFB/vl
         Nvi+LCq0kJbafEy4Yv14yGK66lVWlfQVBkVa7/UbaEoEAT4oRgP8TaIpQriz+7riHKpS
         0k+K6FziSHcfISYZI0Vl0SJwVIC3D5utdkwqM1BuAdUqDJYXM5y4HfbjW0OBfnx+OHyi
         fgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750478; x=1790355278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=pCw7ofoikmbWXI1ZpCCCBDZlseblxGfIIinYJrXm9Qp9VWUpSI4hfCCjE9lYKxt89R
         uDg9mBmCQ6YNkYceRT4V7kpJvQvASeqO0etafSti1SDOGlqrI8v0VofOp8UQWovhXVOQ
         4j15IDM2Akvq/y4c1Z57dpYwvT9HiXQfi7uoguiq297jt3AWHbHzHzUHeja5Y2Ho9JbF
         fUbPoOTZa1OWTWQxYObeFJUaBqQA4415MKmfi1PsahoiVSa7aFs80OdMl9Hx152oaMyC
         /5lzcwJGbt4aUnrZAIwKyHVw1MRIBOOzYVeD83MoXUSWZoIcs6O0352ikNHkqHslcpz2
         uyYg==
X-Gm-Message-State: AFuF++kRemYDDAUtK7xA3OhSEwv3oaSYJx2PgRQ/sfqoGUtmhyblJME9
	Mi7E4vK15dSHpE0Xq50KUr8EfED8+DSFc7c6I3J1NKchid47bNLEVM7f
X-Gm-Gg: AYBFou3u0n6szTcSt5wz70BW9Iw+HvDSB3mPF9Gbsrp2tLt0DgY7gdeJhRGq91am0T3
	Q6YF4ty+gCecYSHD0AzGiOVFBsNoBbOf3JoSw5YLnfIoJnwYtKxZ2uTaZ4phWlToekLxtZVJOGV
	hLOwkf8KT+P1IeFrDX5NWwIBQzU3Bqcdn3E9mN0XEirY66Jkyqt8RvriBVU/7+DerUfEzjAYcZe
	RhvCTcxsTTb7U4EX/v9JlTirD7YXBIVCgR4wrWr9rtBgJuI1nWXjwQeAtdoMkoD/QKLzBLbTubb
	GkPHwkObu4nEg+WPuM7ZvvcpBF0d9miE+itPtsomalzCjDWIZ3jN7iIzs7qryoLDOspmVeQB0ZZ
	IswtUSppSj9gyiG9vEHTg7UsEA3rHtJtFE81IONxExoI50XDKX4AXl/kX8nbLjJ6XB4pkHvB4mD
	rC1vK2EeZ55ukcMlfaLxqSeyn4cC7kpRMXXYRmBpwQyyfyHbTmsDU6uUv+I7byZYyfHkdLK5T3o
	cA=
X-Received: by 2002:a17:90b:1dce:b0:39d:f064:3a68 with SMTP id 98e67ed59e1d1-39e54d36e3emr7094039a91.21.1789750478423;
        Fri, 18 Sep 2026 09:54:38 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:38 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
Date: Sat, 19 Sep 2026 00:54:11 +0800
Message-ID: <20260918165414.1129076-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
so that board compatible strings can use it.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..c7c2fcd37 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1694,6 +1694,8 @@ patternProperties:
     description: Techvision Intelligent Technology Co., Ltd
   "^techwell,.*":
     description: Techwell, Inc.
+  "^teclast,.*":
+    description: Guangzhou Shangke Information Technology Co., Ltd.
   "^teejet,.*":
     description: TeeJet
   "^teltonika,.*":
-- 
2.55.0

