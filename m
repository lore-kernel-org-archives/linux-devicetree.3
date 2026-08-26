Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5B9353A9B
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732167; cv=none; b=kgJ46CKbhzILPlxJJkxXnGn82kjVt0SDvPIBsVW/CWyXUc1BAMaSK5QkzUy0qVcDSjvwTEwyrWv/v40GhGRAWc0Mo0tdArjll7QJhcozq8A9LZihv0BN78TpSw7qXg/a6P8/QFxwi/+z0C6WjWecO8W/ipAquk99kF1cflOkBCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732167; c=relaxed/simple;
	bh=//38RNGRI8cIGlNByhxtPiGRknwkc3/M+Mr5jgncyA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjBXdyiomQd7D8pEjSlUqZw1wih+TrmCiMS7viXMtOYtapG24ngK+jY6KMg+remeprc5kbcHpbK4kDPommECvByIUj1ijlu9Pm10uz6r+W/2JPrCoi0KillLEqyjcxofOgvZStayD1tlmDwTCeOAUPikH1YiXNjSoHkMSxpq8KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHUbnF/X; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHUbnF/X"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so74645766b.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732161; x=1788336961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zB08SnEagvgroJBWvO8F5zjbyavejq+4YlAWaJHBEM4=;
        b=nHUbnF/XLQoE2PSvuwHuAbogqhITOfrLNOzM0fdPICLSJX02Mz7xcsMInLWlrHBE+/
         VNH5DqYips/9sCF7sxrtRSpLSzsCNwqzPIzUBFLVWD+/d/KEmV6y/UXHf1Ooc4yyysQF
         13yrO4kLudMok++fgIvLlxQCGYKobUasByChOnaVCUf7+fFdL2W6ekgHabHMUIzAlAUC
         sZehW9bUvYMfVLS+QOhv3I8JALiuT0LRqleZDi3N8SI3dAcaQXJXp0pFGWzzm+UTPfSY
         OEjHh+fbfMEEN6t/GxcbRdlx8MGFOMOFh0Syw6pQNsTZGFSbOCVdwr87W9bQAFFHcCdK
         tyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732161; x=1788336961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zB08SnEagvgroJBWvO8F5zjbyavejq+4YlAWaJHBEM4=;
        b=buWVxuLgyfLIgvNd08LdppRCgh13OS21cBgnnaYHKI2GzZqfQLIkvfT/+cUNDqm2RD
         17UgfBpfsqRn1oy6MG9XQHjUw1Z58C84EBGUP4j73/LCCi2J9iSzl3VJzxbi/L+NM16N
         5sIeB0buLd+10pJygwMVbBr/WclYkN1A8rWZ1pe875i2UkPXjtCB5geJH/ws8kzM2Pmf
         brdSLroa6esZ8ht/yYulhVSys+PO3ORq5pAxgQg0HIIOn19DlDZljMQG1c5vSD3HzREm
         tQX2ulGf0CO+U+dcfljJgTb9pCOJZwT5PuvuHXETusSDqSgyHcFanY7IFqWFDhstpjay
         MdTw==
X-Forwarded-Encrypted: i=1; AHgh+RqdRXnVFOWrpHeCV/xNWdbWuYfNuQmSkGmx9AAOdnApu7NiSnO2jee6OpFzylCogWrq9s0kY4sWPMSQ@vger.kernel.org
X-Gm-Message-State: AFuF++nTkb6O5Izx5wEesmIvBiZbreLBe2+2YiTqvxYXe3nHjwUKfa3F
	Ao0tOJXhYOXjS9Pvtiee30KjePoBkBCRV67YCFiTGT6zJndKAQOYK0i4
X-Gm-Gg: AR+sD10gjNY+Q2iq889y22vgexqsNTUbEbYRV2UfAf5ak+m5KPe3sg1iQew9TO0lcay
	XowtAmOB/OFl2g3Qf6sSlaNjCWmSqeFcouOPE6pnN7JUHmkfjU4lPCcEepO5EX7w6C2jAxa5e9K
	a2VrSGh87gHBPPhuEKnCSExLGS/KjaK6Nn1/rcJfPKYkV3KT+2qWONlOC8et8oFxypXX5GAvwA7
	EqFEglRnSuasr8EJXUWAUN6Zrtanxu5ReyGrUblPZTT69ENVMVmKzoapCFxE6pm3GtFU22tbD83
	hYbf1m2TnZgLlnqYzfv+SJ5n3djzt5KU2geJenrRW3sKvDiJ3fxY7cz8KjnDkdeD+cfERSUKBro
	my0NvWa2COW2gFV6LKOcNyHQ1b/Xzd5qbo/MTNefOd5lEoaHdlfBodv7n5g5OYVMIVMxI/Tym8A
	5B8Pn6OB66WW7+nMOYah2Gkbs2rWhuumimRqYUNn2nUL4v0ZtsmzgU/yLVu1ZLCHqyy/eOnuCAv
	LdlbpM/sJVWYjJqTQ4Jn6g=
X-Received: by 2002:a17:907:3d44:b0:c12:74af:51f3 with SMTP id a640c23a62f3a-c250bb126c5mr640061466b.6.1787732160791;
        Wed, 26 Aug 2026 01:16:00 -0700 (PDT)
Received: from GLaDOS.station ([91.80.77.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab65sm360997566b.37.2026.08.26.01.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:16:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Wed, 26 Aug 2026 10:15:35 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787674237.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787674237.git.stefano.r@variscite.com>
References: <cover.1787674237.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

Both the first and second hardware revisions are supported, including
eMMC and NAND configurations, with WM8731 variants available for the
first hardware revision.

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
 - Fixed commit message
 - Fixed spacing

 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..b732ff810265 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-emmc-mx7customboard
+                  - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                  - variscite,var-som-imx7d-nand-mx7customboard
+                  - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+              - const: variscite,var-som-imx7d
+              - const: fsl,imx7d
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                  - variscite,var-som-imx7d-v2-nand-mx7customboard
+              - const: variscite,var-som-imx7d-v2
+              - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3

