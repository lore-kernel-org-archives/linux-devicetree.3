Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834CC47A87E
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315294; cv=none; b=q4i6ky9jP8luKIoaCDeXoPwVZmXup9TMyAO0pDwtWfTtFx7W6xZt9r/fb3uCD4twEXkYsBePmxuFFu1Z2mHcLnv0TDfUc1Wp/PfZffpAgLgKdP2fSKsqrHqS2PW+7nkVGEjawARwe/THg3Saiw+7S0tmeM8s5fKRshMPxtnU5iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315294; c=relaxed/simple;
	bh=9deJD4c057ciJX+jP/7khGcYZHlb7Vj3wZuZ0+Y3U3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVizyaaCHqUuWPycfKrq9T8KywNI076KS2wyOWi7cI0rLFeGGshX39tF2JVpBBG7JL1J2fCGgQndCFZ4Yyz/4XF7NvDRk99q1NV6HX35KHHAS+GlRVmB7/Cnjh6gZdNMqiSTR2rvdlMx3/+/gJrE4feRr1XC5SNQf9ffONaJK+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WM5L6KVx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WM5L6KVx"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso1866843a12.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315289; x=1787920089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnb1hnrwJYg9Ac5/Vnbdf4M0HUhLsGXMbMJwhXncPks=;
        b=WM5L6KVxhVH2eT4UHljkwK4XeclUxbC1qOnA2Q/HnO+8xBIHRIIT6siF025i4P5zL5
         22YKjGytUQwG7m8YswCWRMn2c+Ap4aRNAmCR56D9TLKmqMyLDQKy4qfw2sb+8y0J49lV
         XoUXChAtPnRASv9PRjoFuhLe1GwpalLEhFE6PYIqh1+sQtmOE/YBGbGmYpm1KAzMo9pT
         0G/F0Q+3GehROpDSU44hqomdhNfjq5N1SCcGLrbv+nU8rlq7gouBBvM2kjHKzFaL1HSU
         8JeM1k52jo8Uu6q7UX59YCMD7J5BQQzuS3CjvJ1LrAXEQnKWumc51ic+IEWXrX7ANQli
         j5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315289; x=1787920089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnb1hnrwJYg9Ac5/Vnbdf4M0HUhLsGXMbMJwhXncPks=;
        b=Nf1OIJKw/Kd/GCrXzrbLGqAgeZH5KfnCii9R8SpxYrr6QwWJOGQNVB2KKknNvMJgDf
         Jo+fqalnYoOehiVb8neHBsxb4BU3fpdBgriY7+6+4x5jV1dvoxTskzMMget7j8b4cYT1
         HIagy3KptwF1QSpwBDsPn/NrH8ywt4lfrYNK+rfdjaz/b2rfUlj4qqZdO6Ax5oDcHtke
         +WMe+rkdApGgAyu2F3uv8re2E39tWTZcnO3yNtY1hSNs1cOAs9yetO0v7o5fuf8B+Zyn
         VruvcgMNnrBjZRn2EgliX6BiR0qC7q2e739P6/4pH8ufu2HxJchvyw9OH9vxA35q/6eA
         Nypw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+IeWIcymollwjqdHaZQyxmen6EJjPwBmt5jF0Zj93LtkwoDwJlksA/cDM7qxDpZC4geIekZ530/Ow@vger.kernel.org
X-Gm-Message-State: AFuF++khcNOa5KXqMLCU0QOmtn6Zz2zC+lICVvlJA5jRyNCe0XWkWw2O
	3twF7rmRN6iH7/OXtgy4scKD3d5M0npxB3J+B77Pw/PkxltZklH2frh82bQcwRTi
X-Gm-Gg: AR+sD13s3WVr9eV5J3qoUsJnW5pPfDyd7E7tBMGNdmIjnZjtHZ8bjrhgYCZqywQ7dI9
	iiiD6aRRnRa5wGv5Q61eTEsRWSxTl2Chd60mzLVeChw95fuBLiXrbWphzjvL5bH7F6VsPcv8HJ+
	2frr5jttoj6XHHz0LrzcwGrJNuZQjwlzewVTWCNGKUhqeDDMJPvOgjii8iY/pUxq8Z+De1lxikR
	tca3wvn4XocANj/ZQ5k0kmolkfaofdOoUUb6qubEn+FXQz/Z0wHnYO1AQuvmnsG9FuOxPNAOLC2
	ro+9Bpn3fMcuHyq1Opn6eIMgqzh5eqFO3SLC57VrtmuDbzyCfqaBC5j4y01pEh8Lk5M1quWTc49
	WGQjl4XjFMRN1/IW9YUG67xGCcmBpp+NMAwPshEFDh8MllmqydNeG9nafL7pDGWoeooAEXKdRCJ
	zBSuMkAOJfit1r48wcWQyC+cHKcVcwndlWgmhwprgo4If3cnLnQxI/SKdBuCQV6nd6X0xEbRafW
	nOQcOuFiVAaFBj8eToH4054k+SMOVbc8BVmm8qyNSf3yW1nBTy2UaISh2+mUNsdsGG9
X-Received: by 2002:a05:6402:847:b0:69e:9213:11b with SMTP id 4fb4d7f45d1cf-6a42f1bca7amr5773872a12.13.1787315288354;
        Fri, 21 Aug 2026 05:28:08 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-140-38.net.vodafone.it. [5.90.140.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9c9dsm6608874a12.4.2026.08.21.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Fri, 21 Aug 2026 14:27:50 +0200
Message-ID: <2e7d5abd893afb7f5362a5b3b8ee83730546674f.1787314780.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787314780.git.stefano.r@variscite.com>
References: <cover.1787314780.git.stefano.r@variscite.com>
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

Both the first and second hardware revisions are supported, with
eMMC, NAND and WM8731 configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..20a225420d20 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+            - enum:
+                - variscite,var-som-imx7d-emmc-mx7customboard
+                - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                - variscite,var-som-imx7d-nand-mx7customboard
+                - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+            - const: variscite,var-som-imx7d
+            - const: fsl,imx7d
+          - items:
+            - enum:
+                - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                - variscite,var-som-imx7d-v2-nand-mx7customboard
+            - const: variscite,var-som-imx7d-v2
+            - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3

