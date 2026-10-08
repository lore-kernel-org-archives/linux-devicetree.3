Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EBA3D0936
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488420; cv=none; b=KelaR2DE09E+rZsZ/UPCW+h1+P1FMvqo3znSXVoluT0o0CL2gQeSI2t2rvJFEx98sqUCfQGlGYJMlpLwXPemLkl84lOlxklNsfKWhdXpto3C1uL4YHFo5mSsvmioOagQrffbWJz+4LyAE1lmU0dH2Iqaxuz6iWYVEQaR20WMLu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488420; c=relaxed/simple;
	bh=XjUNeeMRC2ts5MdmKtrm3eVb5N5Z36fM2sJ8EfZSQaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvpNCxNe4PV+IvngrRSvX/GcO+QoVGtmcdvRhZ1+4QJokZ6uiIXvhbmMHJrHa8GeC8Umrvx0ZiEOOCK/Tl85mzWuvZc7Oaiglby359C6ISt0K5Z51WoxbYamuFeIMaJbWJ9i/7MhI9efc63nVvZbmzI1zj0aBVdpMnK7h0DuB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUvRH08f; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUvRH08f"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso51394415e9.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488416; x=1792093216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf168IjSFgOfzHnEoVof5QzOtPwLIXW0PLzbFbqRkiE=;
        b=sUvRH08fjMys9bYnFAMAAN7wMBwgH7EPTZC+tIaqL3HGTrB/ptx3r3BT/DTvOO92fV
         u6IZW9n0/7YMONgNqjMR1p1pK2G9z7sVfDrjoHhJ5rlwnk+xR5EeShIEFbd2pKoSurA2
         nbeBlOpr1rZ8QrwsdH2pxlQFXh4kQAjSV0t2AW9tQAdizSOVThuY6iCB9Tmapez2Fkd0
         IfchSmE5mAA+cU4Sfu9OG7sttyLgLvS8XBp+tFl86u84JekAuu4QpasU58e14zCtp8oe
         cHkQM8DldEUZbgBkmb/EP409lpNVfLLOu09M02IQJE9qUlbA0AnVefYSNRyVH3F7SjYy
         cR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488416; x=1792093216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf168IjSFgOfzHnEoVof5QzOtPwLIXW0PLzbFbqRkiE=;
        b=SS1gmKJWJB8aesHyzW773BuwRynUldQuilAmrwOLI/pL/7kMueXssjl5DripDFxVTl
         BceD3UK5rKUZciVMJXaTJkUdk5KeRat+ZvDwzjBL2NI4koHwP71NhGkUuZMyQTTFdZS1
         UVAo6AzzTVyYeh6m6RK5kLt4+INFEkTtSdY7Cydgz1xsixwdLWJi6/q+ZRQ6cf+1XKGs
         85yLQ6XaWdx/2WbdXc7Aw1pln2AOLEf/td7SSzePqAUE1zh8aw6YCL7bKgXDjBC15h4U
         PebewxoYsSeA/BpPy/TYeVq9nHUe0LMbCqp1uA7KpD1BEyDw6a1UcDIIpVTLGmvBaNh0
         Lzqg==
X-Forwarded-Encrypted: i=1; AKwUvBzcprUMcvxW0fER3D4ZHV9+MUCWT6Lxtch1/2rLp39MTQe8kqvq0uoAisALPlz3RWelVV7w3q2i0i1p@vger.kernel.org
X-Gm-Message-State: AFuF++m/kEs3HginttA5CpGQphS8HK2QZSNG8hYiUtLInb0bzB/02pP9
	qogvenqrxrkYzf70MGKkice5oij9qYZDp1Sh1n34j3U5RPXXhql4DOCj
X-Gm-Gg: AYBFou12FCg4NSiU2RRKoDOVND+ixzAVsj5HksIUqnCD2DiXi7bcjc1TWD+wte623WF
	XEqR9bTYB9IsLTychg731w7HbDoiWDayOmWpxh0QBmOoMNuAR8NoM9ciNVKpDfAMtskODNGbyCB
	Ca+FP8KFy8zCIQhEtQmyz1xton3c6sse3ZuwW470P20BiXYCDtTiStpKvoUWnpiaI6RBd8WuyPn
	6Yb/aVda9FSQQ/ENYAMxk3Ry6HcH5ALTDbr/DcL0c/SVvSNWSFd/4uaTpT7CwkgE/6Pm39RF+LU
	da5cYqod1pTUP+aUqbdZxMb9z9AMxYZepKyxjinsz5xnU8f2ctVM71H0dk5syfINIF1HmnOsUD6
	A1obt3e6NociWV1TrT83/gYpxr6h4F6HDcyGc4lTwjbhguEGsEQvj1YKISZR1Y+O4JF3viEsG4F
	wlHai4VPekQoeqXYxXFelRA249YQVqzR/PNKKrLSTVimIPRNITAe+m+IWzLUoV9LqKhpcwWW/p2
	AhWLzG0SkdJSAzlEaaaZZk5Tfp3+xxkoizENqZcWEH71FFWDTPV88IFM2QDoAhZnoJJ0untAc93
	4o1TddrSu3SY1/XCNCoGNQ==
X-Received: by 2002:a05:600c:8b09:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a180682d24mr123505435e9.34.1791488415898;
        Thu, 08 Oct 2026 12:40:15 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:15 -0700 (PDT)
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
Subject: [PATCH v5 01/13] dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
Date: Thu,  8 Oct 2026 21:37:41 +0200
Message-ID: <4ea26fb755799e279e195b3f8b8669c394a7f7b1.1791487179.git.stefano.r@variscite.com>
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
index c8290a83205b..f044f6fce51f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -689,9 +689,46 @@ properties:
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

