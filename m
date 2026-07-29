Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A66483839
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329761; cv=none; b=UAtbmasCB10tYS0D0QdtpEf7/f2yAxqRH3D/cBtTe+AU1YWzKI5wHrrGQ7OPH4tEKdbi0N8d3P9lvLKcITBNeTM2Sg+pm913cM0JWFUO4aXCD35hKcuUeS2otTZ8gphQrVRpfeR1JzVjsaOjhFGxFsuS/cL4imbbKyueo/xMB8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329761; c=relaxed/simple;
	bh=IiLPp4PIRjg5C9F2ratuBcgARkjOhNMRvwXUs2S6kiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZcFWZvF0A97cQEcWz+aGOIXurP1M60PIc9Gn3ylqJwgnDHnB+ZNSqUtI0KR3TrFL23BvueV4WqJkOIkVDwlF8RwQ2VFI4M467Iq7CaD1zV6zqzG3QrLqu1eqoLa2u5RyIOVK6urOgCLpMqLAtnxJaghTKZhylNEXjEAG5q1Tu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REa8dKTV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REa8dKTV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de008b020so588304f8f.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329741; x=1785934541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/99S/3ENJvfT7IYW+hXwiTuszeriwZH+fXQ8iDS3M6I=;
        b=REa8dKTVHkXqKTfu+cF9UqgXGFeTUD3woHADoHMP49JLrlEABxzJH12gBpIQiBpxH7
         sDJ/IY7lyft8eWxFEBsBUioxRoxTpP9W9vgzA3WkaArr65lQG44xLIHp7KmItlzQLiHa
         SUFsRLOPTdMNLpwB0vR9IQyK5gbZnrXexfml/UXKmstz3aks/c+D7KvLre56Lux8Qj60
         Li19KlUUWJ/NYJdVzymXnTXAZ0UQmrCkHy8itposcOzr5wyb1TIBW5wH1KawmvOM3dmS
         O+9Da/etluO1wE80gxMCuuiBV2KgL8eQy0QFzvIqpZkVrQVn2YEbZLi1CF4qrHH3OWzI
         nQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329741; x=1785934541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/99S/3ENJvfT7IYW+hXwiTuszeriwZH+fXQ8iDS3M6I=;
        b=rFLe6RtzaMvbVpAU/mrlWFTNmmcqANaGTrECKPIfZ7tT5OfEhqNHjJX8kZi5u/txJ/
         varmCFzaWjPJt64i42SpbDFu1aqCe2WH3Ek5xGcGg29qXEwhg2GJsUovvGPL0FJXao7L
         EWo1DemsZb6qxBG4uIgwqMjWDDU9KKFf2hq6RL9lUxpL6M0QA6VoWZUmu9OPl7EyKnrc
         gG6/CLT46krVvQX8SMvc3bvSl2AUAtqJhZG3cyhG7Uhaz+s9VHBcA01A7TAvLmVgRQid
         CV1k2LckeFYt39F05IGzdNJJjQjatQWz2NeUzqbXT5hnZ0u4IaLRHgFxD/gmRWoMEV5N
         dKnA==
X-Forwarded-Encrypted: i=1; AHgh+RoU4fg0m0G619POfiSEYsVmvvw4542NRpi7P8O5VApFw6v3IyHsP1OyLn2Nd0tI6Dtb67KE9b0LEvJG@vger.kernel.org
X-Gm-Message-State: AOJu0YwgXaszCnVp3L4UvJPhDxolh6kPzKbRPgF0GKnHwJU9Dz98Amel
	nHJKF42P1r3pflkDzH0B1i7cIZ8Ildusv6Ut4dXWkEN44GyemiD7ZrGt
X-Gm-Gg: AR+sD124uVz2JM4wJsADBAyU4VstNibjVdtsu/wRAUuKrutExwT/DGgiYkZluzEWrwX
	W56pVX6CEFGzf8hnu2ZMr6MpT5hAsKmnesNXGldO0/5r2tWcc9a9Ml6jRQ6ULB49Fdlq/GiNhVA
	7VUxgYw9UvUUZu4sXXTGutMYydhlpmrHNNPKottp7nfM9LTiapaciy7UeM1ejOsvil9Nt+xSVwO
	e923RmWDf61lgtKl+Llc3rZRwXePSHPRJTfZbPFZXVHE23hmXO3cnEu+l4GuV1+hUP3td+nfyOV
	f23CzWjhVW0/iAzmXwxrvSaDL+D42KOthy9d7UYC/tKAO2ttqf81cKOJamZJbmXVOq+eatAEYWT
	+E1M6pIuy5JD22K1goO7bqnlbrmRU2VH2PCHtbUVjLm7P32GTkFmt76jp6ngyJY2/p6M0h3sKpy
	rxEcN8ZdQWjb59pedhyYeMqOmJG+BfKKRXKTuclKwz548MceFexdx56lP979HoNYqJFWhmBnNUa
	YbTKL7HjB2Dzw==
X-Received: by 2002:a05:6000:2302:b0:47f:8c78:6b3e with SMTP id ffacd0b85a97d-47fbabca25bmr3080620f8f.5.1785329740956;
        Wed, 29 Jul 2026 05:55:40 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:39 -0700 (PDT)
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
Subject: [PATCH v2 11/16] arm64: dts: renesas: r9a08g046: Add fcpvd node
Date: Wed, 29 Jul 2026 13:55:03 +0100
Message-ID: <20260729125516.230757-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add fcpvd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index bf0dbac66d14..03693f01228a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		fcpvd: fcp@10880000 {
+			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
+			reg = <0 0x10880000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+		};
+
 		gpu: gpu@108b0000 {
 			compatible = "renesas,r9a08g046-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0

