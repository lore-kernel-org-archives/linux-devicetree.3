Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11BA3BCD1A
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081946; cv=none; b=Bj74bGO+tTXwkjXkNia2Z/4bUBY/ML7gUISuuU6o4yO9z5WULL7IKpBayrBIvnrGsE33qTFr+zD3LYxRYV4/jU4W0fTw9WhHsrv/vEu6R/IzAwApaDmkh9yM8oN2imIzHd+xEJs3zIo9txEuaFEn2ES3kKAQDVD64iqENULiIY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081946; c=relaxed/simple;
	bh=AeeAt8dBMzBxVI1NDMXxG38fbRWwtzredoQ8jRuC/iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFLVU8G074K1VFaQBVV9Q6T4sZC3t9vGck4STPgEJLlOf3PocDlOxbrWEQ3hh6y3LO8prYEwkQLCoUe6fjMHuIY89T8PebYZ/JiJQwth3IPfN3qP8iDEOyt2oV9Dkai8XB/sMarMcj88mLggW4TYTw7QA55s599m0IYoKIC3bvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOysT1qR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOysT1qR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490a76757e5so42491545e9.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781081941; x=1781686741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQZhKoWaHBuz2lW2inQzfo2S49FUVl78W6tJ1Wh3VB8=;
        b=OOysT1qRn3i4LaIuFsULT9d4/mzjFWyB60yZsDNTVOh57wJcq2ZRfHyvzi1rJxvnnh
         L8JzzzyKfXjunKKyMKd/lovLki77od1rrgYOOQreuKG1Y09fRCHiwOdoe+UsYIVHJb3X
         ip5lpUx2C2/j6bbGWcZqi8kuEez7W0HI2xaVp7Mirql7ihBrMnwaqsxfYBASRBXRuIbr
         kC0gcnFBajsyrH1DfOsvU+6nm9NofmBCxeSVvwMnmoTcaMZlvDkd0aFW0O2UV8I3te+/
         Gh0a9hJuJWLiWxJtFCZuVthaSWKN6Z3DDRPGoTiS5XKngYR+fPviF5A62xHd3M1vy/0l
         q3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081941; x=1781686741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQZhKoWaHBuz2lW2inQzfo2S49FUVl78W6tJ1Wh3VB8=;
        b=J07g6DLFCks4trAC4cIpKSH4OJWK1x6sZiLL3HIERbsOSerOba4eg+fdz/4H70qW7N
         on/MBkBf5KXsZdxSr+NY1PsVXhBHFiDHZhS1hM1wIgW4W5jmmk/ttA/+7AQRuhgmz06e
         JBL80VKQrXRG2q9DN30lvxfjsE6M5omYP+Bsa2jreaqZ6QTFo5ZXBKFV5Yo9lQWFHJNK
         d2CkkhLDxqv1mhfhBgSHTmFLCPPNajfsPFgpJV9a1Ivqfw7IvHoBd8DFVMm0Sht07uIA
         8vCDgVWjm1md7VBpDQe/F4O/GR/jLxTYXB3+4Ark/7ARvO4JZtEWYegih98n/2qlotWq
         7PRA==
X-Forwarded-Encrypted: i=1; AFNElJ+KN+DZ2VfOZ145EvuisVMvwLRDl9NZpOaEPwPH0SJsck7UjKk2FfNSKYRQnzQlfxT5oZt8WUPB4Gfh@vger.kernel.org
X-Gm-Message-State: AOJu0YxhKzrkj9jNleCa2F+VDaZK9UtkonpoSN3BLiqSQsKGDJ4hlEgI
	WViaCCSXrJXW4MM3BQqeyGhgKyqxbtpZEDodkTJJ9MRmTPNn78gejiKPKenO5e9K
X-Gm-Gg: Acq92OEWNs4n+Is6ohjW0R//UiBuScktmTfZ3dXfuvs0Fs0rqU4mYqhGTrdqa2zHg3+
	pMgQeXb5szFMCrbxdjn/7Pqs+HJ3NDs1+6D5ty6SGsPW2RyRq63yMMUqPP1VPxQc8puGJjeBtIW
	5rk6OMmaze6jXex6EJL/EtUjMAaAI4RKpZ8pgrn6QmQS81koKXMf0XehbqP4dfV+ceflkpbFbc1
	6J7A1mTq/JAG2qHk7QZFTSrHadFV0XkYo1vvv+gqsJCYuIMM+bfeU8PIRcMZj9Ozy1I1v9zCV8v
	mDHFkDT28Sltr30Vlk6rjWLDK5GjoOfuhZc0iEgj7wi5WPefZHEwsU2M1NdGpQhbB/cVBYZnS93
	3Fw/iU9ehaOgHEfXKBvDNt8k4k8dfYxA26lay/tErq8osifWXAsnP43ZM2SmwqXL2jq6yz9P9tW
	wPnr9BFsbNVplMVtqws6GKFIRB+bMVSPSP/Ear70+R/TUS7x7sKdtsnu8YLs3LRPJ+2taqn4CYC
	msAXRx0b5fIzT3BFBqHKj5CfNrV5XiSwx0HZPnH/GjWUOs/bi1nrnn9jiU=
X-Received: by 2002:a05:600c:8b6a:b0:490:688b:ece5 with SMTP id 5b1f17b1804b1-490c261b08fmr361705165e9.30.1781081940688;
        Wed, 10 Jun 2026 01:59:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm564088465e9.7.2026.06.10.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:59:00 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
Date: Wed, 10 Jun 2026 10:58:53 +0200
Message-ID: <a3355082aec3454f671b44e1f9a78000d2733470.1781024557.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781024557.git.stefano.r@variscite.com>
References: <cover.1781024557.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MM SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..c942d3d06469 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1064,6 +1064,12 @@ properties:
           - const: solidrun,imx8mm-sr-som
           - const: fsl,imx8mm
 
+      - description: Variscite DART-MX8MM based boards
+        items:
+          - const: variscite,var-dart-mx8mm-sonata # Variscite DART-MX8MM on Sonata Development Board
+          - const: variscite,var-dart-mx8mm # Variscite DART-MX8M-MINI SOM
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
-- 
2.47.3

