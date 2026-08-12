Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561F33938B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541302; cv=none; b=gR1CK9De58cB0rIHWEFHbbbzUGT+iMtNgN/ooPF5n00jtWCyclZKqZyf77F8fkMbRTtQTzvRxtzmfgpb/rzp8hyzcghJbza9PL65UBhNpnXVsRvAZgrNWpJU8VLGhQN2OUsyuo3zRY1fDeqACQ14BJEGtG4/vIbqEJ+9OKMaXQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541302; c=relaxed/simple;
	bh=hfm3IjAf+OeZzH6aELNfG97RQmCw3LrX/haeNb/06/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SLduArE/qHiz99VBrG2B4fR3SBWjwqIBWmJxrV5AVrnEFacULWIAceo4l95iQ23L2QzLqutSDPBuZFhvVWHo7yBSiT7dS2Boo8OopbM/hWWaJvpKApvJWwSLqb/h/Y6jQKmvpVB7Shl0Szsubv7/9OK6UfixXGmu2K9b+4U+bJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFGGECYi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFGGECYi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49954b88fffso10494845e9.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786541297; x=1787146097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGyGvWCodz+0FevuarrifPNB90a1n0BY2okOjukDJ30=;
        b=DFGGECYi4y5V8sYKdezlVSwdcLJOuWwmUvXc3YbU5AIvj3gFVjM9tKUApNhZIOIP3P
         kxq7MaulBl6Z2YPF90ugRAEmwRi3oxEcBx0lbYuYlIp8+uW9Xk2j0zmkmKd6NXVbTIGJ
         MHWSuhnOkMtR5A1i61te8SwOV9pUPpy7kVVyhxjehsEh8Vri+/5m1PSRsatrMaij8wVs
         1lVAbIxVr91GeK9YrIRB6EkImUz18am6c9LnHAUFDVA99Z5p/uScnSnO6U2yZdcXNuRY
         6nSkBh4UkDhh7fdmK/hzdg/YkwBmziVHZom2vqcc3auuSxHfEYogXv8qexMf0epsrqty
         06BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541297; x=1787146097;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGyGvWCodz+0FevuarrifPNB90a1n0BY2okOjukDJ30=;
        b=Bs77pPlth6ik0xMnhZv/6XvyFp56lKjwtQQT+mV6uw00Uq9DUP1jJ6UThJXnYBLc/8
         mqu9J6z5QtecgNMLapKXG/6xL1SLX1v8ikgnlT0SDe+jb0hRkseRxM0q7OYKCQmQuHgc
         JnefR4DXoinYQ+XDeq/5FXNAGkQi1vCwKFcHjBrt9GJtx47XDuydkFkN89G8zfPthCDh
         dV5oq31A4GHT5eqgmoriQG6mE8CRkEWga1xHQKwfoV97vRVr/HrO9m0SkTJgCTgJpVIz
         V4M2I4eU88RcdBJ+L+uWsi0kwPupy+d8hSb1vFepdYP6oPcnzVn00l9YHQu1lsA0cXGY
         EF9A==
X-Forwarded-Encrypted: i=1; AHgh+RoU+xFxeoKJr4GVbUtRmpWq7qtG0S6rgwrBs1CRQTQ9zdc937c0MdbD9Skzh4GMTIGPbxLsheJvc5aR@vger.kernel.org
X-Gm-Message-State: AOJu0YyhPM9leq5ZYrCi8dz3TuNMOApz1QKlpoQH62CKSe6izFSFlMeQ
	Sxk/LGLkuVa7SahRPOx1/fxAxWTE4NK1f8O0IYRQvHH8Ur7xKdQ5WkBP
X-Gm-Gg: AR+sD10AVue9C5ZrxkLkZaabspND/MIwbtCKvFVKUYfDG8L8GAgJzb80DV+xSLK6Lj2
	T1JCm2oofjv9kD67nsaw9tzY4cL/98gAM0rBf2WzKpCZ7RPkqyC/Kq9oXbsFoEnVVYyDSU7NtWz
	HD3ZoDZLjVrr1HPZI49tXNL8MK3X6UfNiSVOuLI/NYWpTds/yqCUEySs9ePoAFVuctfB+CIv+VM
	rO5PmMJ0gzpquuqhx6ZjON+14yJmYI+y28z9fD79jDRfDsnjmEx3a7xbJ6vsD8Uwo1ysk165uoq
	muz9EXDTYMKalnm4hca0aMKPiQ1yos5xpcCk3aYFyQ8cEhm38FmYgyRNRuO4KcopYBr/3LNegQF
	tOHT0V35Bj/nAHnrlEi+Vo5SXcctEtb45y/UjNp0qlcyCfleJpv9aV0hFxAQm7obSzdKkbopEUL
	vbxxo8RzhqjrHyTuonZC3yxpBeEH1c4ANEx1EjgyBe+32C3KecLBRLyUjCxHhAv6m3/5ib50gAC
	xIbUslavbxYyWzsh2JTqNN7n/Uuww==
X-Received: by 2002:a05:600c:b85:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4997c12caffmr71100895e9.18.1786541296817;
        Wed, 12 Aug 2026 06:28:16 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf917csm87818995e9.13.2026.08.12.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:28:16 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 3/4] ARM: dts: BCM5301X: drop pointless "cpu" labels from switch CPU ports
Date: Wed, 12 Aug 2026 15:27:54 +0200
Message-ID: <20260812132755.32585-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
References: <20260812132755.32585-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

Those labels don't really have any use.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi |  4 ----
 .../arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts |  4 ----
 .../arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts |  4 ----
 arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts |  4 ----
 .../boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts    |  4 ----
 .../dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts    |  4 ----
 .../boot/dts/broadcom/bcm47081-luxul-xap-1410.dts    |  4 ----
 .../boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts    |  4 ----
 .../arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts |  4 ----
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts |  4 ----
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi   | 12 ------------
 .../boot/dts/broadcom/bcm47094-dlink-dir-885l.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-dlink-dir-890l.dts    |  1 -
 .../boot/dts/broadcom/bcm47094-linksys-panamera.dts  |  6 ------
 .../boot/dts/broadcom/bcm47094-luxul-abr-4500.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-luxul-xap-1610.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts    |  4 ----
 .../boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts |  4 ----
 arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts  |  2 --
 arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts  |  2 --
 22 files changed, 91 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
index 9f9084269ef5..b3bd99ae01f4 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
@@ -178,10 +178,6 @@ port@4 {
 			label = "wan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
index 72e960c888ac..efef16da1242 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
@@ -82,10 +82,6 @@ port@4 {
 			label = "lan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
index 750e17482371..842dc9af6fc2 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
@@ -85,10 +85,6 @@ port@4 {
 			label = "lan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 2bdbc7d18b0e..e480e2006657 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -119,10 +119,6 @@ port@4 {
 			label = "wan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index 03f4a6d37a67..4a72501cfdfd 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -160,10 +160,6 @@ port@4 {
 			nvmem-cell-names = "mac-address";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
index 192b8db5a89c..55f7a12001bc 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
@@ -142,10 +142,6 @@ port@4 {
 			label = "wan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
index 0198b5f9e4a7..a7aa8992b87d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
@@ -78,10 +78,6 @@ port@4 {
 			label = "poe";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index 73ff1694a4a0..3fc4bded5cf2 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -145,10 +145,6 @@ port@4 {
 			nvmem-cell-names = "mac-address";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 9041dc6bfa8d..23e5ae237602 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -196,10 +196,6 @@ port@5 {
 		port@7 {
 			status = "disabled";
 		};
-
-		port@8 {
-			label = "cpu";
-		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index a4b135d37659..bbb6b869507e 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -242,9 +242,5 @@ fixed-link {
 				full-duplex;
 			};
 		};
-
-		port@8 {
-			label = "cpu";
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
index 2d2e7e581291..8cc9db307527 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
@@ -151,18 +151,6 @@ port@4 {
 			nvmem-cells = <&et0macaddr 1>;
 			nvmem-cell-names = "mac-address";
 		};
-
-		port@5 {
-			label = "cpu";
-		};
-
-		port@7 {
-			label = "cpu";
-		};
-
-		port@8 {
-			label = "cpu";
-		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index c5099defe9f9..74290ada098c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -167,9 +167,5 @@ port@5 {
 		port@7 {
 			status = "disabled";
 		};
-
-		port@8 {
-			label = "cpu";
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
index 944d592dee2c..f79c9c5e2023 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
@@ -205,7 +205,6 @@ port@7 {
 		};
 
 		port@8 {
-			label = "cpu";
 			phy-mode = "rgmii";
 		};
 	};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index 675967a1ad0a..0c89e103a95b 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -241,7 +241,6 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
 			status = "disabled";
 
 			fixed-link {
@@ -251,7 +250,6 @@ fixed-link {
 		};
 
 		port@7 {
-			label = "cpu";
 			status = "disabled";
 
 			fixed-link {
@@ -259,10 +257,6 @@ fixed-link {
 				full-duplex;
 			};
 		};
-
-		port@8 {
-			label = "cpu";
-		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
index e374062eb5b7..fc518a8a28cd 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -104,10 +104,6 @@ port@4 {
 			label = "lan1";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
index 3a33705c2969..532d3edeec70 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
@@ -97,10 +97,6 @@ port@1 {
 			label = "lan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index cf95af9db1e6..3ba672b090cd 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -104,10 +104,6 @@ port@4 {
 			label = "lan1";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
index 992c19e1cfa1..9149bf85e716 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
@@ -72,10 +72,6 @@ port@0 {
 			label = "lan";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index 4d0ba315a204..7133bbb94ae7 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -144,10 +144,6 @@ port@4 {
 			nvmem-cell-names = "mac-address";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..0a5c6df78466 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -135,10 +135,6 @@ port@4 {
 			nvmem-cell-names = "mac-address";
 		};
 
-		port@5 {
-			label = "cpu";
-		};
-
 		port@7 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
index 08abfdc63d18..38af5b3428d2 100644
--- a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
@@ -137,8 +137,6 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
index 45bd27906f29..f635a49e1857 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
@@ -178,8 +178,6 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
-- 
2.51.0

