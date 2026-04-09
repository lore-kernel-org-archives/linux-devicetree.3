Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C040B37997E
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 21:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769554; cv=none; b=omRL6vDvxgClEklInkJBsNnUEZ//PbP8+4g6SK9SXK7KhlZ0dxCGjPt5xu1IA/9J3VbekWjSw6z9HUVwZfrA/HMRjhBhWs+g8REdRdCyUmQ0QlRKV2N7yYr24BkL7QNE/fYkm3eEtP/681ZKtYl580kCB6qX/1n/GH8cz0Wl9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769554; c=relaxed/simple;
	bh=e4toIhY1XnBncjjcn6xW+plNhdLseEPNSl1mwdNwRdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBaxENnZTtpAYNQ1bO6HTgHak4SJ5bTfuuhIWFKkswYwhgqyDTioYfPKo3Vmg5Bt/Hq8l5sfq/avk3PuWgnbie/dnrQL14agVs7F3gzUvkt/GQOaySEnkz2/CAY5ktQVfAwEHupe7oNq6/67DV8VAXxSAN8opGRcOvK1uqPdGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFXgcgWe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFXgcgWe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483487335c2so14573185e9.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 14:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769551; x=1776374351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTpdJiWpctaBz8EDwKAMUDhRQ5r/ZSbqFZcd3xgdw3U=;
        b=oFXgcgWezpXdX6WPrj5Bw9JPv+M3PgjsU4j1MDtL/UqfDZ4yOb4/CwNWFLqXoy3EHz
         PAduh3cNBU5Wfn/RopOfnUBcSls4ZjzZFZFVHVQJZZBl2SdWxCRFDJq9y9uBOQww0j7W
         Usw+cs/PJvqcXQdPPNQoaz9WEdvq/CghWlxvd7Iv0l6NWuqL0MwvkGy60F9mybG8jNda
         otPD7HJVc7ZrM1LzFMjXgdOj8xitU3hZNdVPvmjJLNsL7UsW4YCrrKMNK0BcHny1onqN
         H/K+DPpMWIj38dnltK4LvAKKvIWc23DFjKitnzIc16ZLQMG3YtqPosByi0JiQ9kkcOh2
         3KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769551; x=1776374351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rTpdJiWpctaBz8EDwKAMUDhRQ5r/ZSbqFZcd3xgdw3U=;
        b=dgCn+ceSwMdYEFz1rsbdDKd/TzCIIKoZR6W7zTzE3ZIfRkxHhFiPNaKfibT4Xp+Ve5
         PdD3QwapQXrdxhHvadKy/b3v6EYKeq4yFT0WvUG4jkRDScpfuaH+VV7JURt448xOCFqo
         H/AdVs8AeRxlfHDjyJbzpHugB0RET2iR5N6GKGtbkEPNuDAsVh4r8JUHRhlR1Ro8kggj
         7Q1/EbEZAfsYbO/1ucMHyUAEyZSNAhp3VrFSnlxi8XcwI4p3hXS2LtNpfNqfz0R1faeb
         i1ZMCtMizQSkU6YqA3lZjAblvkskdUh1XQtG5DVviBkEw02BgOB6+cwZ4wGRy3dgGd61
         rTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj3iC0An98ZqMs68JzrFkrHG6bY9ikDkQ/D8Hc7ch+eBcpKJjOrsUArl6/8Sl0ts8jo3mcnLknbJ1v@vger.kernel.org
X-Gm-Message-State: AOJu0YyfmS/znn6yjZfw5VoVwn1hdrlLiK4WQIn3Wk2FRnZs/A8vklWC
	a4AnxbNmK6uhTM9ZFgw15S1R7KIXOQ59oIdPN1B1mntw00dwGs5eJtF9
X-Gm-Gg: AeBDietcHgH3VyVV0J6QTc1fJfm5Sb1+5Bk0CYVtm+1blLnJYb+DaPG7k9heZqTz2Qd
	nuDEVnZL9vM6xM0e219uFogwThFR2h+/2kDzYiTrF7gZ9it3KgfgX9/ECRflwud31oNRavSA2Kp
	RaSSqEiUoJ3whKBmvXS8vIxc48kQRd6BE9TXhkpvCAAUfqtx6x2gbKgVHbmJXFr88dDx3zykGRi
	bRDSkoO1VVgZkj/m6Sy48UQExQEbzmByj16yvOKvX9+0HDe9ynSSSTXSAOAz5vJZ2sIyQzIr+Md
	X+iPWOfBZr722uH+5kop/fGMuncoczSm6fVj+Lm6oVHpIXJRQAb9Orju5pY8XQBU7TrSlXY/95A
	G0W8tsFK2H0NjZd/3oBSDOfE3cJ/GXOUDfnbi5spvk+KBSVBMAOU3UhuGMGhmax5zNMn/LcIu4S
	fwEnxa4TDwivH18r3tK1PJjAha+njLGcvFdwbtCfYIrWuFHji+86aWkJDs3KFwJ2KtjIZvif/Jj
	+ZVko6e2awzYCDVNx1sz6Q=
X-Received: by 2002:a05:600c:8883:b0:488:9e54:94c8 with SMTP id 5b1f17b1804b1-488d689cf93mr3393895e9.31.1775769550767;
        Thu, 09 Apr 2026 14:19:10 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:10 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Thu, 09 Apr 2026 23:17:24 +0200
Subject: [PATCH 1/4] arm64: dts: marvell: samsung-coreprimevelte: Increase
 touchscreen voltage
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-1-8df6f88942c8@dujemihanovic.xyz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=ndFclFFjoYoUngHB8O00J2Z5yd0XN5xq+j1JCK5Rmzc=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ/e7XDgv0uXP3Pd93n5f/6fs749WXBBeiXXraDSl
 pd3fzW87ihlYRDjYpAVU2RhXip3iS81fKJDkW0SzBxWJpAhDFycAjCRk2yMDLO/lNuyZ261EdGT
 VMo2XHxPsDeXe/p/658ir+7G7oxK+cHIsO7EqpCNohYddxnv1vY2x9W9yux6NM38/7OzySu+35d
 S5AMA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

The old 1.9V setting was found to be insufficient in certain
environments (in my case cold ones), causing the touchscreen to register
ghost touches and mostly ignore actual touches. Increase the voltage to
2.5V to correct the issue.

Fixes: ec958b5b18c8 ("arm64: dts: samsung,coreprimevelte: add touchscreen")
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index b2ce5edd9c6a..bb0a99399624 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -460,7 +460,7 @@ pmic@30 {
 
 		regulators {
 			ldo2: ldo2 {
-				regulator-min-microvolt = <1900000>;
+				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <3100000>;
 			};
 

-- 
2.53.0

