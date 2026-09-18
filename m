Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EF451A748
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750490; cv=none; b=u1uWMbDvN6ohMDF6rwCm8iB6pHIAhpOpERjlyGJwvwCT2aCLYDdZMFRRLD4Xrdl3NAyNld3RfCQHnfi0oTjeKrcq9hVzorcsFxMypey6IDHvZcyFH4wa5Ea+FffXqgV7yZpBxMZuNNZYdcdwy58SN9d1aVfjnUdVj5WUIyOdt48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750490; c=relaxed/simple;
	bh=qnoog98K51vnfZCiv1es1iBsnXh8XTJszGX/9tFR+MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyBIrCyQ9nofH+Ix+gjrklPHEIKNikzmm/xKgACi5gg04r7I2y6k0NHR59qx7XAgo+Hh697ZYs2dsTDHkJDYzA1DPFoLn7N8ewY4uPn5/YuCWZ3Wzg4vBJJvP+k1hfXdLcweFyUrxgAHuTIFNhrpN5OxuUuPBt3gyQG+UAWyvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7xsj4xl; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7xsj4xl"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so200178a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750485; x=1790355285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=K7xsj4xlkET1yEtwOJX3L5JhPJDBGdLT07HD5NH46dsvLlB5G/x/pjpCmYgcdYZ89i
         YxXms9kczpDNqLWE41vpaT9VXRO02JWgiWcEAoLWPOKwwaGWX28dZyf0nqj383kcAF5m
         X9t2oCvdlIOIwAhQvgGulzmIsAupauABDSfihL4jonPIQBpKxrbLb9Bxxp7MQyy9TVpi
         RGK6L8vsSq/wUfdwnmt63aY1W5A77rqpvZDtyEeBuGfHj/TUH7AaJWogH8czKyO9cCQt
         LY9as1TavpB7hYEYc6MytMeuGzN/5zCQr7dTHyH0PgXw2/bILa6uMSGFhjEqfD2OHOUZ
         RraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750485; x=1790355285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=WccHEne4Ou6mYwWeXJOwij6oQRM/407PAJRYqGKMb7QoPsmSWlRmfogNjje6G0GIxF
         32sPGaAJuLDcqh7UXycoY2f6inCqXFJa1BqIxWaBIwN9YOuKVlRNUORyyC02i5nm3fXa
         2FK0315k80kidBswsBe8HjSIDDqYVwKm8aO8pFO/KCJ5Zv3/XubQCNaLratnT/6Ik/TO
         FUPYVeT/ppHsSJa3Zaf34NJ1KZAMcVesfUPfnJzAuDSLUqJ5S9qp+s6dJObKP5F+5jpY
         ADZKb31KTSv3kDyuLZQBTg+m+l5cpMbsHHFPeT/Lxa3l4elOGwc9PI6SgtV3HkO+1jM1
         t5fg==
X-Gm-Message-State: AFuF++lO4KNpT5BQ6oios2G89/UDUP7pQqJlXHgEaiOGlnbb5pGSlzCJ
	3lLqBzqWiXSUFdMcs4lBwCobuslAoB/Pxo/Vp2Yn7ULjazEkwuWh3zg5
X-Gm-Gg: AYBFou2FIyWyCnsc0dOQPIgmmcMn5s+lcHWQnz4ncPRJvoc+ZZVTwTFgC22Rl5LwoiX
	E/ReCQgg8NHRNq/IdS+a2P7PVY53aJGoWyxfWGSW7BUYfe6RLtR7rQo7HioLPMcwjo6PWgl6X2j
	VLfvD4xpb5MtLMPfpe+YHmLV0S2doUSAM0Sdw2f4BMVEBCw6RmkQ4tV6jPH2Bnb1Bb1Htn4PIau
	Ffat+DfhXWLGJsXxh3EhznlqfR0fmWLLHr2HHRB3nTYpQPo4SgiwDjpTyRV/OIzufQOqqwGA/KP
	T0biURnc7eidfChH36wT3vlOur2ceZoSR31c/ZBRU8WFqeqtMKpC9XCeinAoCquVfj2DJYiOFil
	xw0DvzgdpP3H2v2zsph+UKXoFo8E/KInwK16BJW2J8VqwK7R4tGEfT5ggoofNgjrjAU8n1A5psX
	wXUegtWfye7ZPeSWsvOyOJErbwPOgPxO7vhFy3CcpDOZvnNWMqCtlJ8NsBIp5z4pEtmXgqVVAr5
	Q==
X-Received: by 2002:a17:90b:534d:b0:39e:6c68:fd8d with SMTP id 98e67ed59e1d1-39e6c68ff21mr213045a91.34.1789750485331;
        Fri, 18 Sep 2026 09:54:45 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:45 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 2/4] dt-bindings: arm: sunxi: Add Teclast P85T tablet
Date: Sat, 19 Sep 2026 00:54:12 +0800
Message-ID: <20260918165414.1129076-3-iuncuim@gmail.com>
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

Document the compatible for the Teclast P85T tablet, which is based on
the Allwinner A523 SoC.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..b9c2268fe 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -933,6 +933,11 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Teclast P85T
+        items:
+          - const: teclast,p85t
+          - const: allwinner,sun55i-a523
+
       - description: Topwise A721 Tablet
         items:
           - const: topwise,a721
-- 
2.55.0

