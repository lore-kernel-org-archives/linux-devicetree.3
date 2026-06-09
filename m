Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDEB3ACA77
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998690; cv=none; b=qJlk4POw9nSevA4yTQfsxoMxE7pltFaWMW6DpVomegSRQSLjS8v+8SkUch6qNQ30F78ncONHPsCH5+b/G8W072LBmm5/NDJny4rYZSKYDnYxJlsI5N3KjyCXyR4mDPzHdDTlOU1fiAS0JddN/CTu1j1lc+7atxZlj9tghd7m+RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998690; c=relaxed/simple;
	bh=32mmXQW5mN6FX7eUOhQr0LzR09q9PhnKOpOCWTiEo10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=km5EoRWle89jNbHcu3Kzyy5hJonyQLNuaahDkAXIfpQDOXfogXbapotmlucrsKw28b2Kx4cx/kkeFQeTUtSyLVs8ulGcHD51HGiyzh+WRVjySiCQsIcXHNpzi2QMx5mfw6mL0cqi5Cqh1yjVvPrSeX5LfjDWA8Yxw+apHVdaS30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNfNwebC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNfNwebC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b64c8311so59513445e9.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998687; x=1781603487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tb/SzpL1XcA+D39fXfaz+1d8t1vR0zE4qmQ3IX4y348=;
        b=BNfNwebCsVUIUN9YWD57OKCWbRgCxBN8RWQnDQ7QQWhplMrmae6zGnJ/Pq1lEQlxXN
         xmcWKE/fye3dcumZPKRLYr2v6IWs3DnGuZ9ZZ2g/bNebXCSzxXmewo1JxbJDw+JfJ7zI
         mfWdhpw15T4MxPlfz4t3uyEaer/KXcrJoygXYwHMfa2ZOddkRBzhbZ5kiLyFviwsdt7x
         Ks6fHzUpDtKG3NlNG6z2gb4DUy9YtCCCrlNJRKzbTzEXeoYP37s7XLbwjVxXX1FAemG8
         GlIfMYkWLN7V1snTL1NnSBL1TFYbeL07hTFvCF7fozXx2CoOpMYBgbiE3Rx+qDQOTLqh
         nqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998687; x=1781603487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tb/SzpL1XcA+D39fXfaz+1d8t1vR0zE4qmQ3IX4y348=;
        b=P0nNFrVAgkAu4x2Rc6XGKDxiu8Bmh71oPV+Okzh2i0jpoUGPbgfR8fCCM6lpA6EQ4K
         ygs/iYJlvkdXYe5hUEMpe6FyW8ri1Z8crR9w5D4qkmBww6qhp3EhzcDaeKoi5gMLSl5a
         bqCd/BpdSUJFlVva+A7TYK2FBDUkZoBhKxmCfDGn3IblErebN2K5peyEsx4fYVGKpAOE
         GRNq57VhahP5QMDY2X/0YTAPTYUdkIOhFZ7JhgtDCTt6mGjfx2JIxUYG1xoT1U5YXUTT
         8dDd59Kx9W9L/koigVrIKQpitAd3OVSWyfeBBQuMoQIeNMCbXMY2wfl1rTnwJJspT60k
         wdtg==
X-Forwarded-Encrypted: i=1; AFNElJ8U4hG2NTH4B2cPj38D8LWiwn3ARpnGsYcE4GPz+lelI/xgCSSK97dHToupYlaSrdBgqFXvLHyAZuo1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb4SjTzxBB5uunviLxs4cvrDpRP9VLhha6tjYt+eFAGCYfN+tD
	3kbOMpzqhb7enjI8p+IWSusGtVOJBscnon2c9VAjjZ4OeWocTT6ge9US
X-Gm-Gg: Acq92OG6fgv3u80RCsDlwb+Fbs6bubaZ4M74ae6QSl8GONUwa8nkjcjJhZe91vX/yJy
	zFCH/ePkOv8oWkSE8MON/DRiKeqxaGfXqLsi6io2jXyO1TbBkcK2VsrdXlSUR5l8GTNaDU6QF42
	jFLCk+gl1fu3sN/CkSkKjNOA8UKKwcKHphwfX1ji1KEhvtW+lfGyNbgAJuk236xh4YOrbHXp0ne
	nNgXDRryp4WFBrUuq0BXT5hYa2+8eHTewrvtf0et7/w3FSVcQhxzV6iYLY84xDEIdUySRUr0AYD
	1Fg/TOsGfy6mtkA2BNY519EpBiffxmobU/ZZTHPkE1Ft4E+DGA3ubuVUGAAIKGfTRF3czq+mrlq
	BkYQ/2eRaFSD3YLzFgbNqipYUWzgSMLI4RnKBFqagzA+SyG7GE+YZmIkoIoyspLBZWgk9dbvfmC
	6qaeEhp/EJDcK78tRdUQjxSe4VqfyuMLWNgQReA9D9OmLiqXaod0AzKV7mkNJ09d2w/97WMSLav
	7bfaGaf5aTaR+B593OlhpN7RLEDa0oQ+qHvSV3vRlPkBIY=
X-Received: by 2002:a05:600c:83c3:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490c25a21a9mr347442605e9.9.1780998686731;
        Tue, 09 Jun 2026 02:51:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm471043955e9.15.2026.06.09.02.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:51:26 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Tue,  9 Jun 2026 11:51:18 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780998600.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780998600.git.stefano.r@variscite.com>
References: <cover.1780998600.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

