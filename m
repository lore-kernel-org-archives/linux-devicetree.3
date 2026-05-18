Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11DF18C332
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779075297; cv=none; b=PHoTzmNIXzn2d0+qn2bdI7BjJEahENsQrYYc5Nj8xOceRrTM4KhYlxMH24B1OnmOldzeRcEJjumq4CoQpXxWWuZWMkHoob40Yv6gmABrNQLMtQ5XmsCHiKBgz+yrd0Hm1hv4WUJenYZGR5w5qCLXwudXfStYBUB7ZL373pOUtzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779075297; c=relaxed/simple;
	bh=5ze2uazgAeVIlCca6kGtV7W6GRHZsCErjSONJCf+OPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pu/HrTDmd4PXe3U6cUi2VTvs5jMxSHKUV6KMWR0u80/QzyptjEzmmmeJBdMDVMTmt1bXdmsx6h1pE925ZGiquTtNjrS3ujbRG5xFV7KRfia5SEyhtH3vXlFiOaiCNXVLvhG3lfqrwE17LjqIcaICGGlEK1PiUILUKPkMzr7XyI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrrSGf3T; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrrSGf3T"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-369742178f8so793760a91.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779075295; x=1779680095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=HrrSGf3TX0QekFaXRLvJL2fnf+WvefhGlJrnww+TPG1L8ZpC/ERw80nwo7U3EU2t1h
         PSyv5v4B2jcrKJg+NCd7oC9WA9gx6k4Ce7khF9/39/ZP2mYQEGAmbgkUMvXlnkc1kRPU
         hCfwqarsqm1GC+c6Uw73V72eIqI08qPyEzUbAfD7qvj6Zt9ECxDvGybOw0F8RRqkmF1l
         FkVh2+DBJ/fv9atemTWKUEmpyRl5x+3FjRUncxDSgLVDRDKYff4q8WaRxfNWmBv70lwp
         apVh79K75pBu8GMiI9NHR0goIdYYksv7dM0IBn7lHAwWN6cjuJbhTaCdlkBwKM+7yqfZ
         qvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779075295; x=1779680095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=XimC53MRmFbj2cUd+6XutSaVt4jc5LDSo5s3DO5DYPTTwHBb2TJXH/T74OuaivX5MQ
         eXYJcnlwGyWrBwDcgy6opOb5OX6unUxuymtIqwceSULaxSJVqCHI+3DbLXUi9B8julDX
         lrwIhtCcn5F4lmPclIVSfrETGbCuyj0Q5+LSsa9DQwCQ7EL1yUUsGu9BGRbj2q9yJl5E
         Jsk+ajx/w9E9GlhSw4YVoKatimR8B9a4M9sNN6pJxtNgGFkL3BJ3IO6OwFUiCf8tVSQG
         UmkVuMDsq5KF8qUQprjztI/K0+F3Sl4oU1f65BIppQSUHGstpv0S8l+ulpU2k3q2b6Y+
         ue1w==
X-Forwarded-Encrypted: i=1; AFNElJ9EMocPV/FiRGyuTKCD6y0u3jaLgIEwHP3xD9skK04y2dANpoQA+ZmLUWOoRk/cl29ib+OGCwcgHoaN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc2QhS8nqlsNjjVShEq4dAFjgATkjoxaL5KLcDiryqug39XAv2
	jzUE5vUL0JbRksKzNgxMyZy/E22zYJE96fQjztm7Lu1BCCACe2mPQJzv
X-Gm-Gg: Acq92OHkWM45lpx/bhw+xFzggoSkpWsc8IdWvs0lDbUO/0Kd5IYX2i5ArP33rMwpL4d
	PJc4P3iy1hf8qT/JjEEhjYVhPIdCYxXwQ99pHdsq9eJbJNb8He41U9RanZhuk+6HYvKb/J2cEbw
	SyWwjeqmw9cbm9utyt7Cogk3+DBWCSFas6e9YLC7Dzjqi/Knu1likXQ8Hv7X5rXK8cVTMooXia0
	VdsdFeqGvVEI/g8wK42YG18dcTXPcyKkwnf5dEQ2SxSsaeZr59v50DelckHou8SsntsQgEKE3yR
	TrFePPm6OmKK5wmIIulbyHK1Tuc5dmbCSBdVoTulYC/vNQXvuZRj+SDxWtSo7CVgL1SnrTyWtJx
	kw7N3YbtvEcP1GBwvmYJ0xNWvLERFI2o2fgCW5YqjRZzYW6N1CACNzG8OC20XorTWfkjxnbkkqj
	+KQlszUZveoDM6GJaAmHBV0uAjVrqsn1IjX5ZE3xLu0aVJ/LGDGH4=
X-Received: by 2002:a17:90b:5284:b0:367:bc89:546e with SMTP id 98e67ed59e1d1-369519e5346mr12755196a91.12.1779075295262;
        Sun, 17 May 2026 20:34:55 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82c4031662sm11183717a12.16.2026.05.17.20.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:34:54 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Mon, 18 May 2026 09:04:39 +0530
Message-ID: <20260518033440.17569-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
References: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab0..656397850 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -77,6 +77,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
-- 
2.47.3

