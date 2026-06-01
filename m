Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C52EC08C
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330926; cv=none; b=l7dDMNyPloAXBYp0/W/QxfkxQUvMJAwAIiPKM7O9Wkf6dZzP2t9OxfwE+4lmFtkmEbcNV6fIa0WeJyJ0DFLXPwzbFiSsjYTjAK124sqJVyFqNNoLaYpCgYKSSpklgaZIZc9zGeZkWEWbGhKEwrqSLNuIPkDj3X/bCCIRQNG1hbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330926; c=relaxed/simple;
	bh=AlIbcBhxQY5tdoRA+xhInIDubeZASOSXqAsfI1siQbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AI8PXdRI6p0PMclcKfHoVmwZoI0C8l95F6HbSakkqBCgIfn32KtOel3PQ0uC8IMo2irdjgAYBzJsjlIT05sh8DOb+7+NiK7pNwRUNCU71KKNSWV2J+t5vaIuf/A0IqNgtk4y2rxklUa3t/pAcaDMNZU+65+doSXZ5MrrYBezQEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf1b0GpM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf1b0GpM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso15096385ad.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780330923; x=1780935723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=kf1b0GpMiVliT4l+tKLugYKfGlNn1jSomyPPFWN+/HN87spNVB65F36UYr0AbVXyyn
         wyv2k/Vx3+zdiP+gc6NsmWKhWSGcNCUPgEVKnycZksLPHD0K7RE7wPCLUqmiGhFxn6Qk
         39iOVlVWbcfWFffcxhQBQrAlxlGjkmY4Q15AE3IYYSy03acG0FlgHKO5zAdExCjLC7Wg
         iWrdwzZsF6KIQ9R2m3toJ7CUJovvZcNk7+gYn5UDtk6kOdszc6Zijv69unl2mwSmf2ef
         UnipRu9Q7nd9oie6z5vG/IPwkrbIo5KgFlSKYZckmcREum2hzUfUGJSxYF9atOSljfN8
         qMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330923; x=1780935723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=Ik59rdVBW7wa9sDyDKLcTs8r243ezrfn7iUWa7qcbSw5YMa89YXLRVHIlaDrG7U0Bj
         oQ2gLWpV22qWxd8dAH90YmX0L8xHq9suGPgAanyAqbpApXUNjLiNN/Sz8hcnmXKGOm0j
         iC3rrSA44GDERGi1haQGTjnk9lpYpTilDcfXpruCYIuuAfyC/zWvQllQRPuvLccnGfdu
         q14NGTxn5Q/pX2UghcmJWcC2K/dsLF/2c35OJIvLnr/n//A84ukkGx5hlF738E+VjWVQ
         RabRwXOBoEqu5K/JJ6JWrqRtWdm6BGu86pUJaZMComLfyMv5p410s8v6p5+6RAquGKMc
         VvFg==
X-Forwarded-Encrypted: i=1; AFNElJ/L0d36VJacsjmU0ZFyPJZtyolhmtbvPWC3bOeTRGiOYDb6UjlQ7Jt+xgCaxkVWrqRRXlyuve4VI815@vger.kernel.org
X-Gm-Message-State: AOJu0YzFtZ/ZXGHqYualENh7g+gbPwFcAWUNjoQZ8zura5gaoQtGqpNj
	2wdELrDU7cRiTivx1Qa4C2CvnpZEO/zqlhuod/lmHGgaAL2b9rDpfooQhUrvJAD0wVg=
X-Gm-Gg: Acq92OHGTdUP6W/irVeC0qdxfRusFc7cOs2041UbRWWIo9yAYt4LPSL1s3ocw/X+XmS
	o6u3TgW3v5B6Y/BhN2n9iKZJBxEpYe21Hqb9AtU2O1OmjnRKH3NJDcCeFUa58bPs5VV0C6J+aN9
	aGD1GC3DxnFBalf99NuO8aq+04h7FDAcMTtmD4nSMOvQ0lrdu49PUyunZisQGypizNFzNOqSWcd
	XqoI2teBd5ekvO5+n4I7p4Dm6xu+TykIzGyz60HKQVUje7XTwMQiV5KeH3WQe6Uh74yuINKfF1A
	iM3OVpTCoFcLyUZIxQ8kfFfvam6yGzYKewxrSHh/jgTMu6lr6cfJ6yaVXeKPeE8Gb69BObXwWQk
	4XecwKqyZnlW1UJkahDD2KhHc7c56jusECfVBpRNSCd4zuVXfuGlLYgBVsJIjnSaqtCJDX7iCsh
	PHbgEpKwk+xEkuwQdm94fLgbQvGKe+CP9xMKuP+BFA
X-Received: by 2002:a17:903:2311:b0:2c0:cb90:1dfc with SMTP id d9443c01a7336-2c0cb902165mr76599465ad.12.1780330923397;
        Mon, 01 Jun 2026 09:22:03 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5d83sm116647455ad.8.2026.06.01.09.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:22:02 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v6 1/3] dt-bindings: vendor-prefixes: add vicharak
Date: Mon,  1 Jun 2026 21:51:40 +0530
Message-ID: <20260601162143.170030-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601162143.170030-1-hrushirajg23@gmail.com>
References: <20260601162143.170030-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for Vicharak Computers Pvt. Ltd.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..504a691a33b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1791,6 +1791,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.47.3

