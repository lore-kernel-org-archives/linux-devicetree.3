Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF34E3ED0
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554335; cv=none; b=WJhLlwfyli1fD0RydiiJeDbBU9WeB8fXX1VWh73+vadHHzOMBXH8/rbnsca/TByGHAzUoGRanTEeQ/ovbkiGpikZ9oPPtzKOhNwZbGQdX1zJyHAIVlu+tf9Mg1ryCH1NOtN5o5fdd1f+7bEA0/0d6Yldou1OMUqQ2a+12yPAJ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554335; c=relaxed/simple;
	bh=NPVvYa0o2JXEuO+wqb3DLtCe7TyxNaegmqQ1wWhGP/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lK3FSfJUBBVjZIgcalOBH8PqFAT9l3pgx1+7lU5vL2l3UUIF/t2U3XVGrhidzxmy2NH+2y3Jp5pk5jczknLB8cEcZ7vjSx3BfpFfgMhbu0+LJPzEu1o8lqRj2JXvGReoJBHLQWVkM0wq0zYqQxxF1QqSeBSTn5o44oCRjwEFrkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b4ei6V8k; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b4ei6V8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=hxjsJQLA0Yc9nWgVkiDF3bqNJIF8rogEHzVxKGUlhCI=; b=b4ei6V
	8kXTiY0EgdWzSpeqXr1/me/XvDfS3RsbwoSa/i9CB8fBtckPGCgyspZY/LZq6Hob
	rd2pjK1amccm9MZgJorAtgh2B29FDqUEI+HvNuD7PrVNpEyDPTyiDTm4Nx6aYC55
	chH2/z3SdmpONKjdvyqDu70vPQiAas6GI5wKTKIec1JZ/4yEp6EjbcQlx7OxVMHr
	GMnM1w0vCiUjl23FjUCr9koRnMhkYcaTBknRbvY/qFrJo6GpvBaD+g275gC2jgWc
	f4LYKAJdLGpTlI5hSoMtiTcpuNnAJeH04h3tBkVC2eqFJ8H4QK1HwNoD8o/C2PxX
	hb5/aTnFXfqIkLUg==
Received: (qmail 1502857 invoked from network); 16 Sep 2026 12:25:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2026 12:25:22 +0200
X-UD-Smtp-Session: l3s3148p1@jyysFZdbhoMujnt4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: rtc: rzn1: drop unneeded 'start-year' from example
Date: Wed, 16 Sep 2026 12:25:16 +0200
Message-ID: <20260916102520.24288-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916102520.24288-1-wsa+renesas@sang-engineering.com>
References: <20260916102520.24288-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't use 'start-year' in upstream DTs because the driver does the
right thing by default, ranging from 2000 to 2099. So, drop it from the
example, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
index ea7b039a91e7..e96007981c34 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -91,5 +91,4 @@ examples:
         clocks = <&sysctrl R9A06G032_HCLK_RTC>;
         clock-names = "hclk";
         power-domains = <&sysctrl>;
-        start-year = <2000>;
     };
-- 
2.53.0

