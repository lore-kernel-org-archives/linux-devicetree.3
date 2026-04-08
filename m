Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3423D75C2
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670043; cv=none; b=gGknm+v5JAJBuTO2/8GpugEdpkla7zbVyVIs7FA4Q0evXEaUXsDjYLYDWlXzeRVCXPIjJuvGOjinjfXrkmDB8eNYAVKrj03wVmGAWHAGvePWTUmDm3CWPFeOLKQgpBq/6zFCAeqQWEFQlN6sDFZ4/rVFFkEO1n3Uv5cP0u7y/ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670043; c=relaxed/simple;
	bh=Wwh1G0U3AYh1ns30yDeRh5FJciD3KtisCsCylnD9alc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g25KyXYogIGoGBG4IXcT2y1ZXV3WTD6ei7lqiyDUlWELfwwzCWSU5JdQe1mAScF0gK1yRXuYENd3hUfkcju9TDmsLBp8iIT7IaajW6Y1SBWXf2abxUBjLPUD0848qeFs37ANzffSmmbPF9WzGCty+T2nzVTSIZ91O1cGGD+dicA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePJxl81E; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePJxl81E"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cf906b007so51192f8f.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 10:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775670041; x=1776274841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBqPX62gE29RPUhtAwboPIfLOZlTavt7gFwp4D+1oYY=;
        b=ePJxl81E5mZKac2qdaLyyK+GpNVUa66RP6lDoBtJ6rF+JvoQ1ZFzhlw66MGrUOwBid
         cknfQajYNVi9+6rkdONJuMbEd6Mw4yCDL1KHVnmG37ZG8H4RT/vkVVL2EhKmj13GYaIu
         l0BrR9zz+/jdHTeOGr4g7+0lSvMNPElqHx4Cu1U9nTIQYWGjdYUSuzJVw+GZoltmFbxI
         G71JU6mEI+9smV3pM3aGX9tHXGmGmbG13WD0ijTl/Urt7a2D4mSyHLjpmzRur7Xdxqra
         /EANaKQvwTnO1yWmW57dbpNxwU57x+lAABUvaJy15vSNJLUhHfGbzlAxcLAPTBuoU1zu
         GFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670041; x=1776274841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kBqPX62gE29RPUhtAwboPIfLOZlTavt7gFwp4D+1oYY=;
        b=mn26CtBEC754NiPYLIb9Dw6ylE2GmJUWhXKvVOeKwik7bHbay/QKzn/4I/ZxGLqKLj
         maYoeDINFOs4kg2V+NKGsP8REJM19bnuiPY1bjV4cuKaAMdzCiq+3Hp5wPhK/h9fk+/O
         e5gCZksH/QNj04m3st8oZryEXya4Vc1XPWO9jrNyJ/DN3naeGyQbIH7MKqVDYc5zvGyD
         ud1h+LScmy984J17UNQveov40iK5lGl3UO02yx64kBwxUSggdW9lF8+4atRM+T/hJ4wb
         P9m1OHHhJRbMLUbfa4eCOTUyQ1+Y7VcPkYH63mla7XcGDPQXTkvZ/DBe7gOjP9Tu2kxv
         hbmw==
X-Forwarded-Encrypted: i=1; AJvYcCVhr72cCTvrcSofghZfbUFsih8fdQstNvb6r+pwpnOnGdW/pGnQVvD+zRyP0Hf9/QPXmAmCfmiRwEJo@vger.kernel.org
X-Gm-Message-State: AOJu0YwUZ42bldrzbsRZoWYI0z9WOU3Hfaf/ip6XDw4DcvVoI6FbGmNC
	McqhuDuet25Dt5lAJRREJQPPvoTepTOCHtoqejXBo/L0LavDGl9ALQoI
X-Gm-Gg: AeBDiesKmCOLm9o4dYMDXE4z5obumZYhPh4arfNHvcsYi47g/wdqY4xFhPfZn3qlYdj
	xG7LLeVDgv8/jfU6XAZ+E5PMmJ+VuQPBbG2r4E+jWXuRu+ybbY5J2yUxwDolPoWe0HeyayoAL/G
	+1n8PcPkwm1Cp0rX+qz2pnT5dlQAV8vc1te7X1pWjw5PsV64KX1X+JJ4sOID3NbTXjIRujDxz2c
	EXHQbr/gTLCu3nNQAQIF70IW1ElS4XOW1/sY+6tcV2oETUiBk9jFBNqAi0zD3gc7+mzXah8lmDS
	EuqAoaK/5VEHVuBXbLzjkHzdS2MmHQM6+2o5vqMGwrT47aDPQR2gEvZcJUKp49+Nd4QkJNclwE2
	ocKWnZdTT4so6L2ZF0r0/Bt3v3fJnyqGEjsf9Yuy2pbkZMUGW0HqNZ+W/yb5iK6S16v9R2o79oz
	LCmV9tPZSUMjD6jM0HTAcspriDfeoVQfPSkABg6bIQJZBqqSfJUwGYMftXQqA7Z3vnd7yRH/l63
	/T84cbwAMKjfHMRinoTPjRwr+gHtQ53FSmPvQ==
X-Received: by 2002:a05:6000:1789:b0:43b:6356:7d00 with SMTP id ffacd0b85a97d-43d2927baf3mr31918164f8f.17.1775670040620;
        Wed, 08 Apr 2026 10:40:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm61774659f8f.0.2026.04.08.10.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:40:40 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX91 Boards
Date: Wed,  8 Apr 2026 19:39:44 +0200
Message-ID: <86635091cd5db0ecb7f07c5ad9d6f735ec349485.1775669847.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775669847.git.stefano.r@variscite.com>
References: <cover.1775669847.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX91 SoM and Symphony
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b29362cb650f..3c31e5167348 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1614,6 +1614,12 @@ properties:
           - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
           - const: fsl,imx91
 
+      - description: Variscite VAR-SOM-MX91 based boards
+        items:
+          - const: variscite,var-som-mx91-symphony # Variscite VAR-SOM-MX91 on Symphony
+          - const: variscite,var-som-mx91 # Variscite VAR-SOM-MX91
+          - const: fsl,imx91
+
       - description: Variscite DART-MX93 based boards
         items:
           - const: variscite,var-dart-mx93-sonata # Variscite DART-MX93 on Sonata Development Board
-- 
2.47.3

