Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5673C53FD57
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695086; cv=none; b=r2+8wzlmmXRUUd6jgIxjuDMmaD15yrAtgaET1rs8bEubz4nieLRV/yttI1TJg+RE4gm8BMFVxH27CIx/u+FUdKJrLbxheGY2NDVj/xdh8r75d0TyQh1csXE92OfO353THn+YDVlLS2PWFQp+AGMrs4fvL0bcvIxQ9dI5iqlA4S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695086; c=relaxed/simple;
	bh=cgkMSwM4juxySH5oXoW3O7eWRh40ogW9zBygalx6hnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKOSPG/XYDV1d+8iAb7S08AfGVQfBreuQORFiSyh75ZS63NQxwaj3AN2jKPltvzdgjXx0Mkz2ilEDc0Yms5hMgSmmUI4Abhn7xSnRysHiG491B9D1MqWl6SN7oFfIfA4eziNoohVG9ejwiUSKn3yBc+X6lK42Acvvd2TEGR5XQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0uPNRmE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0uPNRmE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so27736745e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695066; x=1791299866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74RUEBvytcfICQALEQDWbpTlzpkzH2p8RRgKPqwsI10=;
        b=G0uPNRmEJkVsxUnU3QrmSFDCNF1h/pQ4Rqil4bB5YLfwdT45nTOzeH4XYZeTIsEy2y
         qLgBqZKYBmXmYkRkcz+JmqFv65jXvUtPRT5kcXbDmSw1UFmI6uLKf6FeUUOq/jmbyzx6
         YVXONTNPK7WxFaKj4fBRUi2pqXuAVGtFEN40qsRkcf2j7KzoT4H+BSQU5JSGAnIuq8pJ
         H7ePfbD41s1FEUfzB/bR+ARQ6FujmY60YTFrtTaW8nuVGSooNgLTs3yiI7faSsrxePBp
         uS0wC/jlyvmhXzLkveEeWzssJiQDzSzNRQXPK1mluUs8DaR075S7h1V98PkZa1JLL+lH
         6hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695066; x=1791299866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74RUEBvytcfICQALEQDWbpTlzpkzH2p8RRgKPqwsI10=;
        b=NsgssbE5h2Ewn/Ds6U8BsJysAzgbZl854xX234TjYYOr4vqnrtCdgGmH35mgL1mpTq
         WOfghh9VJ2a8vWM5tiEu7XhnE4SNF+g+OU5U1aKveG0/mY056ghh7i4/UgpBL40/CPDR
         +9cNT1n4+ilNLvhl1d8BKMvpLzlOcJA7a615AIqsAdd7X1CzjPeLtHq2XrT4jO/IMYuP
         SDeYAsuTksYwWlopKtiEnk6E44dDzzmiYKh8uOutpDiOkJbpD8dX5kwifpTJLjGIxMRj
         slfpzO3vILot1ORcJumnJbHYBSXjHChDqRpcG6Zl/Meq6VAn3HACHeRzEOb5m7vU6NSQ
         dtYw==
X-Forwarded-Encrypted: i=1; AKwUvByA6vc8XTae0PqJIPPU7FJkXNIM2E9jN26zCimDzBFa9a1McnZIDzzLSwGER1vAEsg+6HvVbX2A1pNk@vger.kernel.org
X-Gm-Message-State: AFuF++lHW7QK8rKqZ13Ce+aMQrOs+7oCPQ5sm0jQcks0Tw0RXVj/hJX1
	SAGystdaE0HjHV3+s04g4BHCN3Zq1QvpB06zxz+J8f4ojDQxkFrWOBbq
X-Gm-Gg: AYBFou0KqiwYKy6wwWU5eALXg1Dt9QDI7a/GDVLYYj0sVQHClY0Fm+nq3uyhTrdQT7G
	KyhGf1AFQI90eop/GmpC1fOMZhHjpl/JZU4b1giUFzh6ZKyOBQt19nOK6IJhM4mRibHEmag4Ma5
	HhnlndBHZSxD3X7SlLvtSCvSq9THi60004QYTIzy99XZ+Gu3AptKuZ6zW522bLiIoQp5HTUWqtz
	mq7Xa45nnv1bWHwnXlXeAPTxse2E5PJlWnlnTI+LDP3zMMZQn8WPfZ569gWeMB84W4WbSiUN/2Y
	EYrJFHzJjN6pi8gCH5E8OZmWXbGIh+B5mKVwPlrG8FcySf6ViqHuMNpomsduRq+Bcx7M/7zDjNx
	d/V9PuqBmg7d0UniRBPvGoYD4KwHktK6aZiMfphQxVGrYBcD3GbHFenEJTUBFekkPLyJCsqPYE8
	4M3jevgDfUTXv9vAkjXfu34Rs/i8h6jnSZES9SKqVo13RpZs+OFG3nW9qP5K5ei8rFU8v0qhqDl
	4du6Rnta48nz/arKROlXO+wieEnr8KccmlNXSRfFBTAkxX69XZWcntXRdyJ0JOJPgfbsvx9D87a
	OhRIpGR8gn3lIXGH8339NA==
X-Received: by 2002:a05:600c:1c2a:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a00c2a48cdmr69280265e9.33.1790695066289;
        Tue, 29 Sep 2026 08:17:46 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:45 -0700 (PDT)
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
Subject: [PATCH v4 01/13] dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
Date: Tue, 29 Sep 2026 17:17:28 +0200
Message-ID: <c547995bcb14779a5883d855137148ebddb7ef8d.1790693249.git.stefano.r@variscite.com>
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

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e28e0e4ad9..233687131adb 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,9 +688,46 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
+      - description: i.MX6UL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ul
+          - const: fsl,imx6ul
+
       - description: i.MX6UL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ulconcerto
+          - enum:
+              - variscite,mx6ulconcerto
+              - variscite,var-som-imx6ul-emmc-sd-card-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-symphony
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ul
           - const: fsl,imx6ul
 
-- 
2.47.3
