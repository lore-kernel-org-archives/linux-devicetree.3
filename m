Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EE537FF61
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068381; cv=none; b=sLSVxcLc0qLugUYU+ef0vqeB+64P7fJxHppT6D5ga0tpmx4mgj6adbQpPjNbrYsCMbM13A/Y6RBxHJBOBVR9ThBM6DMDxFEGhE371AEXz+vQDDBAgIAitasVUiyv194CScm7cyULCfHYCmc+hjNexaWTnXdIC+WjTMp8Jy3xk5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068381; c=relaxed/simple;
	bh=rcKMJehS8cUvmu7Wr9QE3dsbUNJSkKpdJsK13VtMdsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSmP4T7Y6QrogaMlhPlwpMHSIlablDBzDXGpI2zOau1DvlrJ5Brj0ul4RUtHbt7eSPiMxQ5d5pAQLLyMzwWaR90zkdzPxTAHiXzv3L8oTVLZh7aBrKaCAEzLyd2NaYvhZOPdG3Icotfdag5PQXdtF/u8utfokM5ZV1jTt0FLUjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odLEWFiJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odLEWFiJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so2100295e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068377; x=1783673177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0FCkqTWarPZ/Alrb1TBHUBHsPbxEV74UniaSC9ntbI=;
        b=odLEWFiJvcFbHoPovfmbj/H/PPJriZeCxXP7PAuH5dYrCKyVpaAKUdHm47jj7M+wyd
         WVgieEWQ+5MttRD7u3fGD06R5xCUGqfgofPGJRUAoRYv0ywf1QJAXOlNMgjS/Win+Owd
         6QKcOPu11u36fOv02g1RbTlap+wsVVwJPzIu4M3+BloAQpYpTk/Pq7WM+np05I8NHJZY
         Ro5Ub6639f/qTxmvQZfhPWx6bcMM7gyx0Xe21IVrP2P74IJmuZETIT8jLjlaOjp4g0OA
         luZF0sJ1ZPg0HVDf7wBYjWjpiurQrvRqnv21XeP2GWcbOOoKWvPXT3qn4kHHf6iuWj/I
         qjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068377; x=1783673177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G0FCkqTWarPZ/Alrb1TBHUBHsPbxEV74UniaSC9ntbI=;
        b=bHh8rPKwZ2QZ1zg0VxouUZFNgLPWSn2+A/FCHmyJH6z2EaViDKFXXdtj3YDil5/P9M
         6CX8DbAFJ3CyCpKVr20moFH2HrHYNJwPzCwjpAnpNBi2JBHKKJH8JjIifaD9FKSbYbSE
         PoMOgDKGhjaNhVW61ZLLrSersmHdEY31VD6nog+ZL/pgdr/hD3anmeX1qW4v4ETrzLAT
         Q3Jghq0QPBZG7hUyWfOMKGx9oaMin/NQRqChhE1MONPPPTm+tLrvNWijojlx1RbvzFO5
         lll01SJVmx+EswKTbosLKauMOONi0kNnWt6z5L6UJOoCMgR9eHqJaB2KuvcEgFXIOj5H
         wf5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8BK3CM4NiHPHd1KlD/bVY0GLq1E7t0bghFRprbef2PDvKitnttB38EKZbKn6quL8pYyCasvutZNjn+@vger.kernel.org
X-Gm-Message-State: AOJu0YxyPtNTcav9vciNTUQSx/gvUt4XBVp+V2hOKbEOqiy6hQHyO0TR
	BMK46Sr5Dt7HirVvewKhFFgOyusur6fuJsvoG/BlmEGmlwGI1ZDfibx2
X-Gm-Gg: AfdE7cmyT28wJ5lzGaaInZRD7dGav5ewTRqWtjeG96xMks6tAKuuege7UcT7odz4BC0
	5hT6e0IQlEkqwIKByH0M2iH64o1be0bCm5VKQ6wGCNyvJaKD+lIjRrnESYG8siYLQ3bZBiJ4haC
	bstrzkGAEEyGn3No9rkVG3FOFJitxfCZbanaM0QuYb/HA6UKr4tjPJaYTeJ6OIuiByrM7/Se9VG
	LmX67tz7YDV5g8JFh7cVVY85gY5VMYixGsLZ9PCK35zezxToX0rcrs/WeKwEYfem/byJHcx94gm
	8oxD4NZjOUMke2EQ/AgbZeIKyHTTF8vH1wH5q4wXTDqof5ypbmEHhgXbecpqmnFM9HX3hVX7en8
	YL7sdG29M7NAOMwQobHLasp6fYgd1/H/pI7XtKyx2osvh2Wa5dtWU7cbsTKWLYiK4xVrCZOu832
	lYeefVf4W5v+LhTfK4YfSSPccTQtoehF1AYQZV0su9gGf4cbV3c+jGsrhvEhTjQTUX/4z+iwChs
	EIWzIgzEidBusWf68muWF6HWA==
X-Received: by 2002:a05:600c:19ca:b0:493:cce0:3724 with SMTP id 5b1f17b1804b1-493cce03d79mr16704165e9.4.1783068376592;
        Fri, 03 Jul 2026 01:46:16 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:16 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 08/15] arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
Date: Fri,  3 Jul 2026 10:45:55 +0200
Message-ID: <3bf0960b005e174b22df28ddf31268f0560f51b9.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard USB connector.

The complete USB OTG description, including the Type-C role switch
configuration, is already provided by the Symphony carrier board device
tree. Remove the duplicate USB OTG node from the SOM dtsi to avoid
describing the same hardware in two places.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index ff5f658b33de..0abc2d33e711 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -365,12 +365,6 @@ &uart2 {
 	status = "okay";
 };
 
-&usbotg1 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
 &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.47.3

