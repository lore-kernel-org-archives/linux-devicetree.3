Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078558;
	b=rRSOwYufTkftNRJi2SJkcktu/RutGSVxQibMdoUpcLr9405QeH7G2iYanItRjhfMFNit
	 mIwWbF46KDhOlWPXkiadaZccoygEUVoAf9P/yxt8q6JVVC5Ac9UiIKi0kmG9k+7NiyM2b
	 CVrUoq+mtHTNpEg05U0Oglqh0SO6XCZlpdYy7SJuNGQIXKWli4SV8kzGOY6i8jHBQogkE
	 DGAgVpBxfoLUSOIlxxOlfu5WWgh3mZ/DkhsbBHXpSnd0mLR5o1IopJR/2LD6UoHI6fGPO
	 5JZU2th1lvYxP8PZucXwAlo7e8emqAr9fbdi+/rvgkzDhiKL4cWERPJvb74B9qSXUHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LYx7WQ2dST+Wao6Q5mfg9jnAzXBRpmGNPpjAkBgVZCY=;
	b=DBJ8quOdnGwFHkWYfgYQZf/3cThzniM0vIyw/lE3tsiybefqDy6T/T2YuTaR4f4dLqzH
	 EhUIl+e5yknWNpdmTykw0PoHcbATk77Oqb4An51ilLy0/dWiuBvW4TPb70TOWGeJlB3zu
	 VNd+GjtclV2aTElUiO66GTCiVLlqhx2kJVZ8aZoh/G20Nme+VS/T1PQ+JbrPlYoQAp5Jy
	 KhRsuFqRjZY3zd0syFQGdB0DtF1ysM2ea6EY0UYBaL6+nOBc95vNxJTjyh8mjMdRrgmxr
	 +uVbkzPyFHsNc5fzPjF7sChTam/5bCdEpNnU6M14o8l6Xs3PFkWxRG27xeE9z3AkyvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oTpkKtR5;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC5606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BEC5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oTpkKtR5
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55b8cd4e2abso20417631cf.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078556; x=1795683356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYx7WQ2dST+Wao6Q5mfg9jnAzXBRpmGNPpjAkBgVZCY=;
        b=oTpkKtR5jgfhSMtioprv8nKTdbYjmMMQnKDfzN/18N/GdrnQ9qOhExi4aYKvVoeZpv
         cIErT8C+xvXIywLDacEo3WsR/3bmZd7gCcaNiqc6x3TO6OnLJHmVp91UcHawA5uvgrwx
         59NfjTVF4E8bMUWl+2B4Q0bDiMnGON4X4P3fdXt5/7v6bN6CVQSaVgPXRMd64GxGN07U
         uANnuwiYdoDp1uQQUQmUpBQW/zBJ55pA+nG7JKqC6lu3Cr4QjPsjkVM5Jyle1sDIt48a
         JWCADFeQZl9aiyvcpdyCJxHDyTjrId6dgxTShK8qwUe5gqFt07p0pfF83Uk1Gudo5A45
         8vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078556; x=1795683356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYx7WQ2dST+Wao6Q5mfg9jnAzXBRpmGNPpjAkBgVZCY=;
        b=SacyPR96nnpP1RDiaPDK84YzJU7VXnX4wgFxLwRhTihrYixvHNLIKM88viirFZyKnd
         GiGQ6humvLhDPnKt1fsrNqkst/o/jW3Utj66/lVkK21JDTy2U1QwyboXS/wvUTqy281e
         gM2qi0Gss1BsHkDsUJ2wm/rSChcOTQLquakYAF1QLwL5wa18DWRHFsG8gxdNJm2rOKsK
         HzNg2pEYftdwC1ZsflXScTqkH11zHNfp9WIp/M1nCLc/QIJgO49KVCo0tPW2tewmGoeW
         rgND+YSZLXGebiHuWSK0edM8ID/78NA5XSRZNjcwTCUDCQqHRNniDYOuvShiNxUI9yS6
         r8aw==
X-Forwarded-Encrypted: i=1; AL+hErHEj95ctuuNdItfLSQDBQ4ThaMNgotV7QAIcVcy96lp9eD362BdORNqnxx+prjcs2oUECCMjyLz4Jtb@vger.kernel.org
X-Gm-Message-State: APuU4Z+WR0iUPpuCCenvl/1ZmI0IJSvo+4GEzt/dmlrCbTo18lh/NQ9J
	Ggm7N3ymxCpeIJtug6475R9taIEDMXr/yWTwLn9SAWFIKjun80t6hfDI
X-Gm-Gg: AYBFou3UlKojPMTveAStTi+Bis8rQF6IEDW3UKYdsViPBZpm1dx0DakzuYxs3xdIF7o
	5CiXjhx5AXRYaYkDYJ3kin2TQGHbd+qWJ+S91wZditXbI7RKLYIuVETkrkG1ElSVyHGT2wjpy62
	ki3qU/dfxCJUx6e95L7SgNME4jdDbmsC5rk3ru4tVflEAJP6Tff3Mo2F/gFVJiGic40xD9Oan9e
	teu//vLj+jczlSQIDLcN1RP/ySdrP6n4XAH84O9JMD2Yf2PcXMkoU+KI2oWjA07wbbxr870brab
	3EQi2iD2SOcWgMI3W8Ivw6l1Oqa2XBeVTHXuTd4GiwHfBnwgCEiaDQj22a7axAVvKEW01jf5usi
	nXjVrnop3TfqZ7ZwdTax2keVZ6/CB3VlfrW67XPOuSNUbJm1X30vqphq860oPKvT6yDrmu+ZrgY
	M4cfXRCxYQ/cWvV8WNdvOfQsnqKTk8rJFbh+fgZRX76YpqLNEWPHOg/CvZh8UJ8j+Uj+Ig2FWIz
	bPoL6vgcowTn6fUJLdnTm9GG6RHsJA++kQkq1NIrNpZ7KJ5FXzriz64uNKSpGBVt9qOYyznTHc1
	KoIKCpkCVghYc4lqAz2a0hVX8ci1bjL3mk99BpL2t6pxyhfc05foCFk/K/ySi/bCineSqwGyGUw
	KnbcBM27m15qpPjFfCF+F9LAdD5wG/5XmfGzrTN9Oo57y0cHcblO47u7PsJRwUMELDBD9KLiH6h
	gncw==
X-Received: by 2002:ac8:5fc7:0:b0:535:28bf:5561 with SMTP id d75a77b69052e-55d5a34dccamr84092401cf.6.1795078556283;
        Thu, 19 Nov 2026 00:55:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:55 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 21/22] ARM: dts: BCM5301X: use gmac2 as the CPU port
Date: Thu, 19 Nov 2026 00:54:51 -0800
Message-ID: <20261119085452.75708-22-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Port 8 is the switch's IMP port and connects to gmac2, which is present
on all Northstar SoCs. Several boards with a single CPU port use port 5
(gmac0) or port 7 (gmac1) instead. Switch them to port 8 and assign the
nvram MAC address to gmac2:

- AC87U: the MAC address is assigned to gmac0, but port 5 is disabled
  and port 7 (gmac1) is the CPU port, so the interface that carries the
  traffic never gets it.
- SR400AC, Luxul, R6250 and Meraki MR26/MR32: port 5 is the CPU port.
  R6250 had no nvram node, so add one. gmac0 got et0macaddr through the
  SPROM fallback, which gmac2 (et2macaddr) would not.

The Meraki port 5 fixed-link only repeated the bcm-ns.dtsi default, and
bcm-ns.dtsi already describes the port 8 fixed-link and links port 8 to
gmac2, so drop it.

Boards that use several CPU ports, and boards whose MAC address is only
known from the SPROM fallback (Buffalo WZR-600DHP2/WZR-1166DHP/
WZR-1166DHP2, BCM953012ER), are left unchanged.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-luxul-xap-1510.dts   |  6 +++---
 .../dts/broadcom/bcm4708-luxul-xwc-1000.dts   |  6 +++---
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 18 ++++++++++++++++--
 .../dts/broadcom/bcm4708-smartrg-sr400ac.dts  |  8 ++------
 .../dts/broadcom/bcm47081-luxul-xap-1410.dts  |  6 +++---
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  |  6 +++---
 .../dts/broadcom/bcm4709-asus-rt-ac87u.dts    |  6 +-----
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xap-1610.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xwc-2000.dts  |  6 +++---
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  |  6 +++---
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   |  6 +++---
 .../dts/broadcom/bcm53015-meraki-mr26.dts     | 19 +++++++------------
 .../dts/broadcom/bcm53016-meraki-mr32.dts     | 15 +++++----------
 15 files changed, 61 insertions(+), 65 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
index 72e960c888ac..3375b234fc9b 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
@@ -61,7 +61,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -83,7 +83,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -91,7 +91,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
index 750e17482371..26ac2f2ed5a3 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
@@ -68,7 +68,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -86,7 +86,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -94,7 +94,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 2bdbc7d18b0e..81c2e6652a27 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -26,6 +26,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -83,6 +92,11 @@ button-restart {
 	};
 };
 
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &usb3 {
 	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
 };
@@ -120,7 +134,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -128,7 +142,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index 03f4a6d37a67..60661dde8ca5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -128,7 +128,7 @@ &spi_nor {
 	status = "okay";
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -161,14 +161,10 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
-		};
-
-		port@7 {
 			status = "disabled";
 		};
 
-		port@8 {
+		port@7 {
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
index 0198b5f9e4a7..2b152115d03e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
@@ -61,7 +61,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -79,7 +79,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -87,7 +87,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index 73ff1694a4a0..b5664216dcef 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -110,7 +110,7 @@ &usb2 {
 	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -146,7 +146,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -154,7 +154,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 2fed02ebb1d7..4114c6eda1ac 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -71,7 +71,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -108,10 +108,6 @@ port@5 {
 		};
 
 		port@7 {
-			label = "cpu";
-		};
-
-		port@8 {
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
index e374062eb5b7..00aa28a2e70e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -65,7 +65,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -105,7 +105,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -113,7 +113,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
index 3a33705c2969..04420ebf056a 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
@@ -59,7 +59,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -98,7 +98,7 @@ port@1 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -106,7 +106,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index cf95af9db1e6..765b74919fcd 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -65,7 +65,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -105,7 +105,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -113,7 +113,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
index 992c19e1cfa1..eb4bdf8c9c7e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
@@ -55,7 +55,7 @@ &uart1 {
 	status = "okay";
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -73,7 +73,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -81,7 +81,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index 4d0ba315a204..d5436d70ecbf 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -105,7 +105,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -145,7 +145,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -153,7 +153,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..64d3634d130c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -76,7 +76,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -136,7 +136,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -144,7 +144,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
index 08abfdc63d18..890945a5690b 100644
--- a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
@@ -58,17 +58,17 @@ &uart1 {
 };
 
 &gmac0 {
-	status = "okay";
-
-	nvmem-cells = <&macaddr_board_config_66>;
-	nvmem-cell-names = "mac-address";
+	status = "disabled";
 };
 
 &gmac1 {
 	status = "disabled";
 };
 &gmac2 {
-	status = "disabled";
+	status = "okay";
+
+	nvmem-cells = <&macaddr_board_config_66>;
+	nvmem-cell-names = "mac-address";
 };
 &gmac3 {
 	status = "disabled";
@@ -137,12 +137,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
-			fixed-link {
-				speed = <1000>;
-				full-duplex;
-			};
+			status = "disabled";
 		};
 
 		port@7 {
@@ -150,7 +145,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
index 45bd27906f29..d6dc448b2849 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
@@ -104,15 +104,15 @@ &uart2 {
 };
 
 &gmac0 {
-	nvmem-cell-names = "mac-address";
-	nvmem-cells = <&mac_address>;
+	status = "disabled";
 };
 
 &gmac1 {
 	status = "disabled";
 };
 &gmac2 {
-	status = "disabled";
+	nvmem-cell-names = "mac-address";
+	nvmem-cells = <&mac_address>;
 };
 &gmac3 {
 	status = "disabled";
@@ -178,12 +178,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
-			fixed-link {
-				speed = <1000>;
-				full-duplex;
-			};
+			status = "disabled";
 		};
 
 		port@7 {
@@ -191,7 +186,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1

