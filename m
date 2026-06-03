Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF65B481223
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492381; cv=none; b=apSkSN5xUCwIexv3l1lXdxcGvFKebg6X4/y1hpi4ctwoa8j2ibXiiNP5Ru0FYRz7SK3F2S0K7rsz4kATOXxJt2ISFXDf+4Xc+G6/pyhAQRWmGc5TaSZlJ/ZzQADY3cmfAZokI067Hx8TlkGWHKxcxHLvDxwjMF7k3GGrAUW5V6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492381; c=relaxed/simple;
	bh=/cmWhljEJtFekc9xS145GwukYyOiz9c+Ja54CHAULoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eO8z+mWrLUGV3WhEZenxikBRnQuKC04ojYwfLOVeKC0uO1B5NNzLYOvu++ukEDjowGKKrSjkeHymWergXuHMIkJlafgkOZdz13fOvjbgg9N1Sv/hYVhM5BrGmNaFx4Q8nx1AW5utcMrQVOOdygswMTUdHcj6vhD9BhD0bEocNgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGG6LAcR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGG6LAcR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so12139895e9.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492375; x=1781097175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Dy/GQpes6t3Dr4yJzGcSgwwK8OeTYqUiZJxbHyAXsg=;
        b=HGG6LAcRy3WJxUcYjdDwrgCihv7pONMbgiqx8VUJoZccbliXb/mWCoPX24/JJ438JM
         Z92624f4ZjRd/fkiTUwraHI2L3y0aQqFufln2Ywx/pmECRPghoh3aWYxKodJZEhJbHKC
         Uad/Z/x34pmOFUxswbjLNeSpo6Iu6DFvoDLIAPucBB7PAODxTdmyWxa4FB29+adDAMdz
         9w8I4GuznEa+EsCFB3BUncNbdYBVtikTwFjzkcmwxIBI+P/o5h3bNahjZu+TZOF8vgbx
         91PrZYnjgI3y3WjpZR6Cf+j7l/ZhfPZASxcr284d4Qb7Ize4T+ZPPrnmbx5zsjts6kcJ
         Zqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492375; x=1781097175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Dy/GQpes6t3Dr4yJzGcSgwwK8OeTYqUiZJxbHyAXsg=;
        b=pCBv3WpAyQ6Lr83McmVVw1Iv9S2+yartH7kSanv1w9zzRWbQU9Tpk6JMXUBFI3TxuE
         dlTKf+k82CrXIz9RpUK8/JjGEwcb+Cht9WmoQfa5Juo3Kt6Kp25kr4AQlO2x59gYeMty
         JrWxwYPOCeCf9Y7nvct8KpKHypvb+tDNl7+FlzOM6uN879II9mJgTB1IIjSzJG3+560R
         IwSgvkk9r5nFJLV0YVgEQ82RDOp0N95dZcou6ZhkCdT+5OPzh7yaf9QyhqtYtj6JwO/J
         WLyXlCjRBSFp5i3IRaZzbFpC3+3YmLGc4nPQBePnDtW3ohSsUCDQD5ZMDZx4g7u9yCux
         i8uA==
X-Forwarded-Encrypted: i=1; AFNElJ8UWE7o2OoKiXbcprJvQZlyNQSdGDcqpSO2lVp6x/XgJ0iVX6+IngIldv6lEeYUHAdzRizl7x3uIMUf@vger.kernel.org
X-Gm-Message-State: AOJu0YzLQ1sZUqmOsvExy5mJV3MLED/vzXQBQudBULleMsjzGtOS4IdA
	vY5vtgm+fJ4O1odQXhHkic2sPRaYihM1C9zFSbwLKPKKxX/MpbPGOaEd
X-Gm-Gg: Acq92OE/LnQry17WVjMSuXnisVOQWeS6Himalff0qRfmXZTheJVmOzkPajGcsnTG+cS
	LCncu3D8LbYkgCabxzvFwpDyZAxBcMJQDcZ+Wxf5J6VTvOgcAaiYKIBjPDZknDOQZ8wvxsayWxc
	8UrMSKmaANHD+PjhfJy2BbshHk50HrCofV88/3PkcXE9nmsZgUw2eCQzG0fpS38dAu7SHp4YkdY
	ahmg/CW7T3EM36TtEJKKj4a89o/r4ODhIz/YBblBMNSRN9lguxmfLTAxG2lboaiOCb/mARrEIgH
	YAT/+/xZNy/3DD5TgPrWX3ajny/0ZChKJrYZaqlFLzQrKo31HNuyMtdxRUY9k340qKMEbJRYfqW
	A3GuusgU7KyGk9XZ3NJBJ9gjaABe9N7NwuQ2JigBSKb79wFGVmsIwK0/CWZKsBuzWOap3ahOIKy
	YKwhjAEbirddlkrgsVrYHNgXtbPDFWKZ0KFsPuMabgWygWAVA2epmJOrRv+BWeG/Int0Lfb1eb0
	gbrDt60V/G89gg4QXp4tKFCzRaU7WkdDl14Ng9WRuPaMWPo
X-Received: by 2002:a05:600c:8184:b0:490:7227:100 with SMTP id 5b1f17b1804b1-490b5fe9544mr53737595e9.18.1780492374970;
        Wed, 03 Jun 2026 06:12:54 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:54 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 01/12] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Wed,  3 Jun 2026 15:12:39 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

