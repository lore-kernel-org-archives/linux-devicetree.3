Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71444A2619
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488425; cv=none; b=s+UpB18vZDdp8gfHX8S5pBYC3P9gBWGrFCNvboiLNpzosf59Kc08izM6YaQDZuLudCMr60P6G4lRm+1iQ2FqhV8B5yilRV5czNl748D3knAj8wzgCXn3WivU+8NN4DvgV8vvawNVpiYPQZCuAZNiEJIlxsb+r7hC53u8RzQOVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488425; c=relaxed/simple;
	bh=yeElXe5PuqMK9cXSg0q/mdekpBfVZljUalhMY591reQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMcbVLs55KdK9HqYwU7ApSuEQgKlZf8QE4OL1eiy1SZGU9uEpTRr4lX9Tp/eGesJQqfjdr3p0BPlLMB2GXYVhs//6MgHmn5mubPjcBfuTIaB630FUHnaaSU4QA9m6haY1sUN3h6bD+I/0NcS+pSR7NJofnS0a+YViKf26jB6tAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyd/4jSa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyd/4jSa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so6685355e9.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488418; x=1792093218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ne6jQNHZSute3MOl6uhvR02t4ZAiYz3hjPWK7wQg7Q=;
        b=pyd/4jSaZHAySJcbaHbEyrsbhAurgXUMUiMctnQ35u+yeR5aaD+KRIf1Hp2KqsHwsF
         MP+1m9O9TtqfrlkLg66y+jj8Hj8oD+z6hMugo6YbcjO1RIJHOvbbBhQK+xkgEGfas3QS
         8XxoRuZZWieZWdPyzdvx/PcUkWYjTTepEMBD4mYP5skwUWHjUGm/2fDXff8DxOHLLC4i
         LaRGzwq/Ogej9mwpN8jFmZgqNsIaW6YNu0OQrhOQy47VXTe0PGjbpTIUEJS0cTQY+b2A
         zrjD44ilFdKlpOJuvKF6XH2kA6OVCGADDPMZVc7tewyhzSOvXOoUY5GyfrlVErJ5cJTS
         7Rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488418; x=1792093218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ne6jQNHZSute3MOl6uhvR02t4ZAiYz3hjPWK7wQg7Q=;
        b=yK+G/GcvztivtDxZrUaXL4t6l4NsQ6XHI1TJ/Y7nAv8LY2T8alLR7gpVFbe6E8JP5t
         D4fLH/QRN5CzDhenEZ30iVjjm+rFcuGbBth6PgqiwhsYre2L4u3ImIi97Ysmn2WtvSn4
         KzCoIxTQ9L//brZlbqpJ99lAGnG88XLPTxFt7UAocCKHGVxg7LQ2B780DF8KjrEu6Vac
         PBONUdMISxJ2jS9wxx0CODgTRBFYaxfamyjeZpDCpp7+okVfqsQD0AlTgKa7OmmbqiCH
         PJ1JAl2gkgVXHOImO/nrP4xFp+geNqqRLRy0dO5aCHFdQc3pmTLcVL9zcAmTsibT2Dhx
         ILog==
X-Forwarded-Encrypted: i=1; AKwUvBwKEqNNWg0h8GaazrkrDUOiYYeXd8p6iIFxoQLytiZJwDEeR3lc5JnkVXmUc0AuvETrgJ18OHwFtPa5@vger.kernel.org
X-Gm-Message-State: AFuF++m4krxyCS8hK7Mh2jYIQ9bt/9mB9988Cj4HvxRJK5ocHwIWur/e
	m539SwbanzEyhFD8CPVnWGU2AJcCjIU0zV2rXn02ZThBpzHE6soh/mqm
X-Gm-Gg: AYBFou1BUjZv+krtc+JTCHlDavLYObHO++XjXzTgp94DzTDQhAJrhCmZGpGgDmR2l0w
	i3EaYOzYXARyW6F62hsXQbFlaGHvCuxSTpYFdlzLjbhLfZ46f4/47E/SFbHwPupROLxfzKCcnTR
	14yMSmnOotPkKtweGi9vttBGhGYvpFSLHU/uh1AxuDCdYr8y7xJRvw9IUL+r1y6lvTxnGbK87qw
	rTAAXUtTlJiz4VdUbAXQdcuTbxB6OGmptBVyhJv7SOSiL4JGo2gsU7Xx9pS8IoO/dtwstM4eU4/
	q4osBwIvKjtE5IeNqrn/eUADdpug1L7/AzEHWMAJfb96iphInM6ZLh5rzOqB714IBSpk+CpXUhK
	W9vyeximdk4Yr8rBRL6Y8C8R/paD2oeoAmCzHVE5lF9vGP/qVNJA4s9Z/c5550AbaX4Ack1rszD
	E/jiAwfcZXwQ9EAOxqBupD2+S4waK3Bqbu5M494pVzSw/r8Sq7Yw7R466GQUGIErJHrKGpH9AGR
	egGgenTqtu9NGrRqj53W5Wf61qu8dis2Djxc7elrRIn6QFNGnu52FZuAQNQgmucl+dE5j5/OGEt
	XtHt0dR7Er2D2qDKB40OBw==
X-Received: by 2002:a05:600c:5391:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a1802eab67mr140228155e9.10.1791488417829;
        Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 02/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULL board variants
Date: Thu,  8 Oct 2026 21:37:42 +0200
Message-ID: <e5f0dc2bdf5574c907c0efdc8b5b9974a32e2cbf.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Collect Krzysztof Kozlowski's Reviewed-by; no binding changes.

v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f044f6fce51f..ca6778b8777f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -835,9 +835,46 @@ properties:
           - const: phytec,imx6ull-pcl063        # PHYTEC phyCORE-i.MX 6ULL
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ull-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ull
+          - const: fsl,imx6ull
+
       - description: i.MX6ULL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+          - enum:
+              - variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+              - variscite,var-som-imx6ull-emmc-sd-card-concerto
+              - variscite,var-som-imx6ull-emmc-sd-card-symphony
+              - variscite,var-som-imx6ull-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ull-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ull-nand-sd-card-concerto
+              - variscite,var-som-imx6ull-nand-sd-card-symphony
+              - variscite,var-som-imx6ull-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ull-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ull-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ull-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ull-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ull-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ull # Variscite VAR-SOM-6UL SoM (6ULL variant)
           - const: fsl,imx6ull
 
-- 
2.47.3

