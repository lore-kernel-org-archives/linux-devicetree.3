Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A83D4118
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277914; cv=none; b=oZfkSoFnz0EOdUABY1JadnaFRHNlOh+sFV8oKGFxIz4RaHixLwsSXQr/GsLPb5bo6uoCHJQr9ERGMgxUJ2PqC7adEUU+WcM3PLNthqoDCkohevSnTsOxZnr6WDL2V9/2Z4a0Qm6FRoQHDPzuVbMQI3zllNIq2aXFGYeNmcZJDTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277914; c=relaxed/simple;
	bh=8eXxgMRvwvak+ZE0RwYotqpuKtjBzsLkHKbyXFDzy+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUh6UKgmixX5BQ5C6P4pJeU8jH1IcCwvxuc2BZB/33go6ooeUseLKuHREdPrlxMYwWsNOP1MwSEGNLFORvCPL6008nJJVT+DJDgGjwvczacPu2oiC9Je3yLQLBhRhosu9GPrTZSJ8+Ho46Oap4G9Yu41ooNIyJ589E5icxoMGys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1XgMdOc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1XgMdOc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso39822395e9.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779277908; x=1779882708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIfKEnRkl+xfWeFX2M7Vryt8G2X889LLQhN+8qPTBrk=;
        b=B1XgMdOcvrB+jAMSMF1CelbebleWObMY5YA4i+4vE49nYtjkfbHc69TBOvYf/Jb0lP
         alXV0wUCB26ZqhYieWiE0aiUgCJg49by/pVPgpn0Smn/kOsbNxc5yD0fJgoUjJbuy0nH
         +URIJy2LK8xo33bN5O3oakkUym9/WHeNy6UyuPCjg/ItiR9Frcu6H/QZfbwqX7qiawxE
         S+JeFc20fFcZEpNLrXG0+J1AOW52v+htLPhaorw2SmUFJYFqjeKEiJmoet2Ff6NGZYYv
         YITo9DZf9wjCUbdmcfNJy3t/Idwulp3XSjE+w9WEKYceS09HT+XhtePU6knawhV/yydT
         CDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277908; x=1779882708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIfKEnRkl+xfWeFX2M7Vryt8G2X889LLQhN+8qPTBrk=;
        b=Ccq8bGXkhDjzo5tuitcJtUwQjNUN3SfFcjgU4cRhSYoTJcbZzWy9B/cKQnSRjfdd8y
         d3znZeHQUbvj1mSNncTy6OreeUlLXzbp2KAse5kZAesM/XFoMzJ+kcGO38MAS8/LQrjl
         EY+NY6NWuGFx2j/6IYRpG+RXyq4m67hMheW3FbK0OTyuzyBULKWN4OwdDOHR0Mc6cNuO
         GwG3gnwGLe6XjcoJg/cf9SlulY9r8+X/NQJBSafasdveGLtKk65FBfftulx22W1pPTGU
         a/XoNOeuJjX54r95uNaOJkJbawwNw9sXaDmyOTC9HF5gou8RujOVFUDqwDeRIbUWP0TG
         HJKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+maMucjX2X/kCW0e3OZSAc9C8mLqxze0FDiErG00Dta47G9kF7rbW+2f5gnDYqUFtRdjPOqpdU3ug9@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJtIZ/gufuBocIsKyOERtQU4AWlXNXG6ki4VP9N3F+hx669Uw
	JBiuQ8eA6FpS7XM+lwolbQNF5v+j9bQeijgMm04WlSs9E+BrePcH7C1l
X-Gm-Gg: Acq92OFaqzUekKc3w5q4FYdn592zDksSBBsEYNTanxx/uEWWe8Fc4OSJJQaoAfmDXYo
	IzFaxfHoEvd79cmTSJIHPfmkMaTkc87DybH9W0OIqIjuvpVZfw70askmfQeK/XQocDeZK49lo5Y
	A+yV5hAeYwYw6UPkKwJiIRADZ5ordJ9/7LQUMO6FyAdaGFG7InZZXyPUHfPgQMZ45MKOQQg3Gq4
	57fM8uNkDryOYDNI3v4920b3KgqvhL7ZbnzKqVO5YM5eM6YA1KrBlRJ04imzYSZzOIY3xRWSObt
	jB7ArTNyabQX2wuGD9NdD+7SHyo02FMaMvp+g+GIPK8Jj2VZcKCakmHiX5exklLrHpS7oEHGw2R
	9IefqfikJwsMBH0rOZp+4OVtlpW9gjUjavynfVDA7xNXT/ylAkbO+HTrevmDZ6POjuMvNIwJggP
	DPqCq7FCn9kg9brgUWRF6/an8elYLgM/dGPyNQXaxHGMbtPV4=
X-Received: by 2002:a05:600c:c10b:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48fe5fcdedemr279401685e9.5.1779277908333;
        Wed, 20 May 2026 04:51:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:a11b:196c:5f9e:ac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm278842735e9.2.2026.05.20.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:51:48 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a07g043: Add max-frequency to SDHI nodes
Date: Wed, 20 May 2026 12:51:39 +0100
Message-ID: <20260520115144.60067-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
SDHI0 and SDHI1 MMC controller nodes in the RZ/{G2UL,Five} (r9a07g043)
device tree.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index ded4f1f11d60..ce2023c01baa 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -656,6 +656,7 @@ sdhi0: mmc@11c00000 {
 				 <&cpg CPG_MOD R9A07G043_SDHI0_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G043_SDHI0_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <133333333>;
 			resets = <&cpg R9A07G043_SDHI0_IXRST>;
 			power-domains = <&cpg>;
 			status = "disabled";
@@ -672,6 +673,7 @@ sdhi1: mmc@11c10000 {
 				 <&cpg CPG_MOD R9A07G043_SDHI1_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G043_SDHI1_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <133333333>;
 			resets = <&cpg R9A07G043_SDHI1_IXRST>;
 			power-domains = <&cpg>;
 			status = "disabled";
-- 
2.43.0

