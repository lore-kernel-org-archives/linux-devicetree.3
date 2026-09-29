Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773F153F6AF
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695101; cv=none; b=PGcYDpg8oVRhTazgPxjmKL1/CijECgmYGH4wSZKVkxPtqaG4MxzzCjlER+5UwWgs930ACC++bsbPXjA8Q4MxMIwrv+rl2Pu/ISf/Ac9It6uwDTJNg6fqgToDSmn+dZrORp9ZcFVoizUNuizmfv0qCa7jMy5nQ4Zzb4J0ycQhgqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695101; c=relaxed/simple;
	bh=G6XcWLt9W/5WDaZoUK2UZH2AziJLt/KqfJMUg1KtHrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdIhsVKPDiSGnN1RVnWA3GDYTctRaeaFAObbtQnBFmJRXL0mNm7rnGu9o9fzkfjvZJyb1WiQCMRQmtJ7XYK4pJ0QaJNuqlNPblAUB3BkEYJhAUrPejAm2PS8u4ICWcVlQJj7nywHrMVVHlNtAN5HugUuHIJJpsJxbGHtGA/iDtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKYBcH43; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKYBcH43"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so24505865e9.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695070; x=1791299870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/wcOHMEVWVR3p6oq6xv8OGP6miSv6dtFwXxohtxDzw=;
        b=dKYBcH430Ni41p7Orn0RKODRmn/vH/LezrNZhO5anMA3JEXtmCWTkyxCq3X2kC/eiW
         /IAqGxe04orBxsBV7V3lsIUyHc3d5njREPWxSfWpi+8Xld2XF1V9/8HQSeFnmTIpdWz2
         CGC9JQUBufzzHc1XABjYqvrRrU22TrG58VOkYX18Qzn1lEqOqtI18GLSpkLi9Xx+zT3J
         62aNM0Pb1xKlbhP46w9g6HqFA5Ks3OQ12vETEnhXI5pgMKVlCpOVBN4M3U/5UnIQu/Jz
         hLsj6+kXFFRs/IdS2Osd2XsxJ4cuhb5rXqakLjIHL0l2YvE/N9CmhFKEdhE1XR79Dcc8
         V9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695070; x=1791299870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/wcOHMEVWVR3p6oq6xv8OGP6miSv6dtFwXxohtxDzw=;
        b=IJ8xa7/8MW7oX8FwFrF7GmqHroCLux2xhD0su9sC+wKIUQVlethcYs/huPrU+nNf11
         tJJRwZE0tmVuqW6YPgs9PQDB+hxoT94wiDkXPZkRvQB7C1A5aS7x4Z4kXxrYW4TUq8MY
         nu8S5S6Q1UqqeJ0AJO5lh8RXr/Si5sP1gungRx/v/ItPlGYbaNJzTMAIFkf6GoidChsW
         X0Mp90Gq4E6Vvyox1EIxon3MeC2+SuG2PQfL6LJV98fT5opNntp87mCOzSBm0841rEWy
         3HlPzKfB9UgbHEa6me4qrzUoXgHCoo+MlCyg7c2RqgD0pcd6whWttCn8DgiCqmxOuunh
         btBA==
X-Forwarded-Encrypted: i=1; AKwUvBwpz4n+LJxAYj14Irxp8RGH2j+pc7EBe9mZDNbTYg3iKAl6U41W8JP1bhoE9A3m3jfkLWVm8xP6mq8C@vger.kernel.org
X-Gm-Message-State: AFuF++n2GSxrTA0Hi6xYAcwBF9Jfd2WTnsCz2+BhzP9VP6fLBjp4IyM8
	LhPx1kpRqNX9Z2/rK1EFLcRHC0kg8wiOqKNqd3b6hHcKcej6+XESspuh
X-Gm-Gg: AYBFou2CT1jNFq3DNUfAhSDkdgTlFXM3HpiFvWAJ1wMovgsu+lJ4X8FB431qQwZfWia
	5DOini2Aa7SQ3sW72M2qE30+ccngr76uVcEs/XqMZ/EjAfJ71FZZ3mcYX/smRnfBrn1PhWAbIQV
	cWHSKCLrqx5VQcDabmxWKOSySSD/F+jKlYhCQywtx/gcbqI+xD4O9dX9mjdFzd10/Plz6Yjttbp
	/M8gnzhrfgXxAaHHuQ0ih1N6wkYerpXSMgU0ZlnWakoU9x7SRf2+AR5Uv/nSkYLT3K6vPNKQTvX
	kQ9cmve3qvzCdWJN/lP/WnnAFzDKs9oCZBow8bLvpv4v9g/UzMze7xrNljclFlWM6d6HBW6bgt9
	BhBj0D2vfVR8LEmpsGutYuZ1UedJP16AZXSLLMGscf60MDJZitrIdGNJrk7j1Rb2PpkqTjmJj02
	+7xnnBTNi+Gq8Czx3r+cwA/zjsbwjwF2ftuF9PUZHvy+GbNdWPAk0B8vmXW1eulAATcH84aZJk8
	+lsZF0p58muXVfD0rJfKSFn4IPJjt/WynG8D1nrJzC8v0pBnWL2C6OQxXOKLpxOU62myPlNKssB
	r+VG8x0yevPaYfxWiMzmcKc3+l4jY8lq
X-Received: by 2002:a05:600c:8518:b0:49f:d325:9912 with SMTP id 5b1f17b1804b1-49ff06bcd79mr215836965e9.10.1790695069866;
        Tue, 29 Sep 2026 08:17:49 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:49 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
Date: Tue, 29 Sep 2026 17:17:30 +0200
Message-ID: <1e6f9e01bd9e0e0801b18ddc9eb44bde200ea984.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Document VAR-SOM-6UL configurations on the Concerto and Symphony
carriers and DART-6UL configurations on VAR-6ULCustomBoard with
i.MX6ULZ.

The compatibles identify the SoM storage, wireless and audio options
followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC and add separate VAR-SOM-6UL and
   DART-6UL entries for i.MX6ULZ.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 9b1224091e01..42d12624c1db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -944,6 +944,50 @@ properties:
           - const: fsl,imx6ull # This seems odd. Should be last?
           - const: fsl,imx6ulz
 
+      - description: i.MX6ULZ Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ulz
+          - const: fsl,imx6ull
+          - const: fsl,imx6ulz
+
+      - description: i.MX6ULZ Variscite VAR-SOM-6UL board variants
+        items:
+          - enum:
+              - variscite,var-som-imx6ulz-emmc-sd-card-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-symphony
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-symphony
+          - const: variscite,var-som-imx6ulz
+          - const: fsl,imx6ull
+          - const: fsl,imx6ulz
+
       - description: i.MX7S based Boards
         items:
           - enum:
-- 
2.47.3
