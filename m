Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3D14B405E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488430; cv=none; b=m91nlYM7hGBXRaDan2uP4zgQL0aNVmKQswmBiUMrGKexesD/6lDbEFTdStFCTxLoHdtlD/cU4Dp4q1hh583/5lERc3G18Bbqtn0jXhK+CHKeOYlOqazXQPLckWnrOYC3D4zI7DszaxVNcV4j89Pcnf6j5no2wGCc2a0bD7DdDPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488430; c=relaxed/simple;
	bh=JAOMxI61QC8KPKmV82fMgcEzMe1b7vaB9yj/4Lg5yhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIZCZKyIItkE6Qt6GLY4B0sD40L3r4+P/D+AFESstunfKthbKeIwFs7bPWJjBgYl3YUbxUI+Fm6mVhEM/0qReaiJjAGzU6bsVMhMOY/v1T3RfFRAHNeWdw8+LrHtx/lPn5do8dQMLjQGaKzinqrA0nJ/TM790IkqshjlobazWPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1Ba1GLg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1Ba1GLg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so58799665e9.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488420; x=1792093220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23uKYxmoySlp6REJxlYJvE+Uk9Vl3V7y8fMNqG3cHos=;
        b=P1Ba1GLgTDRNMSdoAxRlDdOy6+mzuwKV5EhN0DzYSHvtDYgW3DAQD2CBd6UBhc9MZk
         QnzeeftQTaAJ0x1WUtZ8ia9/oyBaqFAK2OxpV4sJxJov+t6+li2Asg/cAyeaIs9U5rpx
         NCcJ0Cg1vDIeJo04nCLtJt7c3bpiiEcfL2Z3/G47SnUl9FNP5OfwJK41i7ynOqzzIyyl
         5F/XkB2Hq4JRg02aet9LimRIYe8pFyQvHRpzNO4CSfxb2s4Uwy3+cfNvUQVqmo6bRFfy
         9jZIe1ddsjTanN/FKu8WXbYd5k/dyFDbXhDO0rEPLek/qBGwXm81KWHWjUV4GyfanWi6
         leww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488420; x=1792093220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=23uKYxmoySlp6REJxlYJvE+Uk9Vl3V7y8fMNqG3cHos=;
        b=xWXRQ2xbC/GiK/68ulin07rNl5hCjZBNPgbQyhIH58seqwtwruXU1FleDDsO23AxIS
         uKu6aqDLaN+25sj68BeMvTemfIzOpd90czhC0eRfPZp40500vGxbPMtOymV1rlVnTO5a
         ONPujJvRCtMr9mnQ65yPLbHweSMqBqxJbuwq1lm97hhCobUzn0QohIVNXxGa3t6rce/l
         zXolH20bho1lL1deyALZjnAnlclBucEdOCEfAVIJMiUoBzy2FwoBsLP/0LWad0dt1Y32
         1si4rLLMHXe7BEoTFWR4pQN5xvPI27lKgOcXmzMwNdRpbz5dkbEvk9IkXQc+6WmbWQGs
         7taw==
X-Forwarded-Encrypted: i=1; AKwUvBxnJp9+9R2ZRg/MjwFQFGvsoTWoGtJjltt+MGKswZyjOuTnqx5bsVfVwXjmAQAmVY3VCf0qhJLnHCZv@vger.kernel.org
X-Gm-Message-State: AFuF++n2evy/gdtWavRFavds6SXJHxBjT1JsLTV+zqVVsxQogudSsnx1
	wd3mNr6VTtYdzjnTwtL1JKlrRC6XNaEWBmQaWsLHcWaGOYDykRJKswWp
X-Gm-Gg: AYBFou1V87B1wYm62hFB4mM2Ekjl/TNRoVfUhQtgMxbJEEuSgzimVCtRUx6vUIG7CVO
	vXw+NlzFgb5hrTauCbjXFiUZk31aCHcnMymxNyfJ1LnE14nIoMAk+pfhURr2uJtqZL+QHhuSCYb
	dS7zIEjL1kc2e6sItEhYjpdkWOG4wkrCMZ+nD0V0GgTR2KHLH1Szhzszol+9TZZExqP/VvurrlT
	zH5HazPFDonStPxPT5iQ02Nk96kWbwSXjrvZ1vhL7PJzy7S2YWR+r649bLFDVjMNDQL2VvUjahD
	65eDHy1dk5DSsYYuHMsusVP5zzzu9bmks+4cCbjjn1FpimuP/4DoxoMmmtiyiAOXT0VyYCnM5CI
	nis52j5wnEi4cBHvxU7x3CgC345maxPHG6Xq8sa+MXMZu7ZSeB/wYidtGm8xklwBHVmzqwRdC2A
	UbQn+VU4TFXOs3YJ9L4a3glgLObW1chv6Xn/xEbKDof6Ph8BXItVAdc5wW0agNxNWWBsG7hhAEQ
	TqYej81PrkfDkFvgtDRu/ZTG3Vulz3tGt/ynpc6fLsUaiDPNVi1ylXPgWiRNug/Svi5rs6I7x83
	WexFbeqK+2dLc0py4vfQUYXRM/5OZYgmKw==
X-Received: by 2002:a05:600c:609a:b0:4a0:2540:b46 with SMTP id 5b1f17b1804b1-4a18031130emr114964675e9.12.1791488419663;
        Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
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
	netdev@vger.kernel.org
Subject: [PATCH v5 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
Date: Thu,  8 Oct 2026 21:37:43 +0200
Message-ID: <cb2311ceda0efe83d2a05d2d0488d547043b1d47.1791487179.git.stefano.r@variscite.com>
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

Document VAR-SOM-6UL configurations on the Concerto and Symphony
carriers and DART-6UL configurations on VAR-6ULCustomBoard with
i.MX6ULZ.

The compatibles identify the SoM storage, wireless and audio options
followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Put fsl,imx6ulz before the fsl,imx6ull fallback in the new Variscite
   entries. Leave the existing EVK and BSH compatible order unchanged.

v3->v4:
 - Split the board binding by SoC and add separate VAR-SOM-6UL and
   DART-6UL entries for i.MX6ULZ.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index ca6778b8777f..d75a08cc11cf 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -945,6 +945,50 @@ properties:
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
+          - const: fsl,imx6ulz
+          - const: fsl,imx6ull
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
+          - const: fsl,imx6ulz
+          - const: fsl,imx6ull
+
       - description: i.MX7S based Boards
         items:
           - enum:
-- 
2.47.3

