Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BBB430314
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330514; cv=none; b=utuQgWhrcNzN7A25kh5xwVql9S739d+qPRednKST2Xc1sKOXKqSv7gdVHezyDGUcmBRXSvR9P0IfloA554j6XJT+SPCzshTwJbersgzOujlqSYfNELUKeAjwat/7Pl3n19Ss2L+FcdeGG2IX1F3IOZew/PZPhs2wDzE8b/cExEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330514; c=relaxed/simple;
	bh=7WN54U2QmWBYjmzIh7xFRoxzzdn3vndoXYM27XhvjdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWJyYrmTknS2pdV8g1/MMA+LT+CHgt6hKM/mS5GqJKsP4RDCvIueCHPdfqBCiFKIAGGYjbAd7S5mkKlPYoCGhU/f64yXHqjrtYbVjkCnxraT5rpPm0BZlNCHLtJYJ90jNYF745+0UE0B9CcWU3M7no4GfPZrzxERc5XYzCyaLNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXIrHTBc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXIrHTBc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so20133895e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330505; x=1783935305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yx4FBJmHhIhPwgpgVHtFQpg4a59/aBHMExozfwUf+P0=;
        b=XXIrHTBcQ3eIlwdUjTZ/+nY23PNq/LTzC+wfHYMitGEjJg1nrF7KsMaeVBFbMWYktU
         0u1Alw6vZq/KIe8w/4DWQFzUj+bPuBuCa/QPkvIPUY4Lz1EsDO8ccxQhBD3dxNfdOBZV
         ICtJSa6c1SCRKPVteEEyZ8nU8bkWYZFTQ87MP5MBSxsL3Yeut+dbxTRusK1Pnf8lSHDK
         BcuKR6iITHSv8nVyn/fqXY/wY53HkiclpG+C+9qyVFML4XYeXEt/nQru/BETnT2BuFoe
         7jI4dEPhLTaqnTvEvjuTXFKJVSM9dKbQ0MgKVjhq4UN7NG1IWHtZzxuL2RQWlqS6GzPk
         mYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330505; x=1783935305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yx4FBJmHhIhPwgpgVHtFQpg4a59/aBHMExozfwUf+P0=;
        b=XOLLbLuui0Eb2vNAeKSlWUEnGsMtoVqPvvKquIrJsWys1SzyhY4PAo+EU87/di+gCT
         LQ+DL0WJk0hMyXBI/IxZ05TgNWZP58Tfbce7AX+PIaDsrRzlhuh1vCWDy1nWwlOiYZp1
         3aCyUUZns9bnITOx017S1BKxPygP05lUNnsdDmurrtNiKvsCNJphIjCYUeLDWJhjTilT
         mBPkPuoAvzEL97y2HGwxSDTk9M4ANt2Atn4MGWt/HUJsgDAxE1L8IyrgzQ2uFje4k5Fq
         5rKbdnIfjVvMXVaRiyC++p9W0Hs9fOnS4k4rrwC2fsTQhpsFWk81W8bv9xc/sA20eg1P
         teKA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2Tq1gx/qIbNvrKWhyWHabZXl7w3lJK953lgNDVeq+5B/vlTnPMn653uS/GsiPvz4h6bAP72Hz0qSp@vger.kernel.org
X-Gm-Message-State: AOJu0YwzvON1WV7ZkCDeMptfXLQZbAdsu4V7S6LZbUyq33WNbVS73v1j
	YO8xGI5TVKK+MevAM/MtZMPlq/iKdKW+UVCX0kGfXYG1kOaTkaMaDwp2
X-Gm-Gg: AfdE7cn32W6WXO4+hyaL6bZM82Mb0pnEZKkJrLOlKeQvOhi7KvLra12mjXqCTLeBCa8
	cxLYBRvi6fLQIWb6moBBC06FQNQbRJ+kgqFIzKA7nggOo2t/5ZwwwJf5JDJEK9usPtC+ddsh/zu
	X3NKLdduK/jBnuDTC7J84liDHJ41iLj5pkfuKZDdufTtMAFqp6Fn5x2oZd1YXmRZfZbWreTeCpy
	5fTjQQAQ4RxQfW/brk3CFiHEgsrDpgKYu0/tKEwzEQ3iAafqdLxhft1WtbCjMCjwrtnW62VXTXK
	xp4cWxG+RRs5ncHUE4IfjRy3TJeXy75vo1bFF5Mof7XMC90echYAO3cRW+Jo14QUm24A8pYwssa
	djhX4fYjba9Bw2mk/WWl1ayeV5w78w8Jvrdzhrp+kyHtNbQsJchVnG6OesJBjk+LEfYDW06RGsz
	b1eBq9ap1a8UkVW/5CrP1JQ1Gzl7PraKc6ry7Sl84j1h7z5AldifPD7U8U1+/0qU/VbBM06h5+C
	a+L2p25wW7z3Ub5cvb3nFHz2g==
X-Received: by 2002:a05:600c:81c5:b0:493:bd4f:510 with SMTP id 5b1f17b1804b1-493d11f02f3mr97319415e9.19.1783330504569;
        Mon, 06 Jul 2026 02:35:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:04 -0700 (PDT)
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
Subject: [PATCH v2 12/15] arm64: dts: imx8mn-var-som-symphony: add wakeup sources
Date: Mon,  6 Jul 2026 11:34:42 +0200
Message-ID: <af94dbb605a1c18f2cd2d1f86813c0c6e84eaedd.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the Symphony carrier board GPIO keys and capacitive touchscreen as
wakeup sources.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 4898018f030c..c98dca8e7889 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -40,18 +40,21 @@ key-back {
 			label = "Back";
 			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_BACK>;
+			wakeup-source;
 		};
 
 		key-home {
 			label = "Home";
 			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
+			wakeup-source;
 		};
 
 		key-menu {
 			label = "Menu";
 			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_MENU>;
+			wakeup-source;
 		};
 	};
 
@@ -187,6 +190,7 @@ ft5x06_ts: touchscreen@38 {
 		touchscreen-size-y = <480>;
 		touchscreen-inverted-x;
 		touchscreen-inverted-y;
+		wakeup-source;
 	};
 
 	rtc@68 {
-- 
2.47.3

